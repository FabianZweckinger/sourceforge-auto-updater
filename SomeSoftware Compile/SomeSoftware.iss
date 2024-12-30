#define MyAppName "SomeSoftware"
#define MyAppVersion "1.1.1"
#define MyAppPublisher ""
#define MyAppURL "https://github.com/FabianZweckinger/sourceforge-auto-updater"
#define MyAppExeName "Some Software.exe"
#define MySetupImageIco "icon.ico"

[Setup]
AppId={{5E533997-8689-44C8-A978-C922C80C5CDC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName=Some Software
DisableProgramGroupPage=yes
SetupIconFile={#MySetupImageIco}
UninstallDisplayIcon={app}\{#MyAppExeName}
PrivilegesRequiredOverridesAllowed=dialog
OutputDir={#SourcePath}
OutputBaseFilename=Some Software {#MyAppVersion} Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "icelandic"; MessagesFile: "compiler:Languages\Icelandic.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovak"; MessagesFile: "compiler:Languages\Slovak.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
        
[Icons]
Name: "{group}\Some Software"; Filename: "{app}\Some Software.exe"; WorkingDir: "{app}"
Name: "{group}\Uninstall Some Software"; Filename: "{uninstallexe}"

[Files]
Source: "Some Software.exe"; DestDir: "{app}"; Flags: ignoreversion
                              
[Registry]
; Open with file associations
; Root: HKLM; Subkey: "SOFTWARE\Classes\SystemFileAssociations\image\shell\Some Software"; ValueType: string; ValueName: ""; ValueData: "Open with Some Software"; Flags: uninsdeletekey
; Root: HKLM; Subkey: "SOFTWARE\Classes\SystemFileAssociations\image\shell\Some Software"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\Some Software.exe"""; Flags: uninsdeletekey
; Root: HKLM; Subkey: "SOFTWARE\Classes\SystemFileAssociations\image\shell\Some Software\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Some Software.exe"" ""%1"""