/*
 * Parts of the code are made by james-d, clarkbean710 and ajeje93
 * Link: https://gist.github.com/james-d/ce5ec1fd44ce6c64e81a
 */

package sorceforge_auto_updater;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonBar;
import javafx.scene.control.ButtonType;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import sorceforge_auto_updater.updater.CheckForUpdatesTask;
import sorceforge_auto_updater.updater.DownloadTask;
import sorceforge_auto_updater.updater.Version;
import view.updater.ProgressBarWindow;

import java.io.IOException;
import java.text.ParseException;
import java.util.Optional;
import java.util.concurrent.ExecutionException;

public class Main extends Application {

    /** Used for automatic update checks */
    private static final Version VERSION = new Version("1.1.0");

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        //endregion
        primaryStage.setScene(new Scene(new StackPane(new BorderPane())));
        primaryStage.setMaximized(true);
        primaryStage.setMinHeight(500);
        primaryStage.setMinWidth(500);
        primaryStage.setTitle("Some Software");
        primaryStage.show();

        try {
            ConfigurationManager configurationManager = new ConfigurationManager();

            //Start Check for updates task:
            CheckForUpdatesTask checkForUpdatesTask = new CheckForUpdatesTask(VERSION, configurationManager);
            checkForUpdatesTask.setOnSucceeded(e -> {
                try {
                    if (!checkForUpdatesTask.get().isEmpty()) {
                        ButtonType updateButton = new ButtonType("Update", ButtonBar.ButtonData.OK_DONE);
                        ButtonType skipUpdateButton = new ButtonType("Skip Update", ButtonBar.ButtonData.CANCEL_CLOSE);
                        Alert alert = new Alert(Alert.AlertType.CONFIRMATION,
                                "A new update (v" + checkForUpdatesTask.newVersion.get() + ") is available. Do you want to update this software?",
                                skipUpdateButton, updateButton);

                        alert.setTitle("Software Update");
                        Optional<ButtonType> result = alert.showAndWait();

                        if (result.isPresent()) {
                            ButtonType buttonType = result.get();
                            if (updateButton.equals(buttonType)) {
                                startUpdate(checkForUpdatesTask.get());
                            } else if (skipUpdateButton.equals(buttonType)) {
                                configurationManager.setSkippedUpdateVersion(checkForUpdatesTask.newVersion.get());
                            }
                        }
                    }
                } catch (ExecutionException | InterruptedException executionException) {
                    executionException.printStackTrace();
                }
            });

            new Thread(checkForUpdatesTask).start();

        } catch (ParseException | IOException e) {
            e.printStackTrace();
        }
    }

    private void startUpdate(String downloadURL) {
        ProgressBarWindow progressBarWindow = new ProgressBarWindow();

        DownloadTask downloadTask = new DownloadTask(downloadURL);
        downloadTask.setOnSucceeded(e2 -> progressBarWindow.close());

        progressBarWindow.bind(downloadTask);

        Thread thread = new Thread(downloadTask);
        thread.start();
    }
}