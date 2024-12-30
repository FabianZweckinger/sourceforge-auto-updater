# Sourceforge Auto Updater
Sample software showing how automatically updating a software from Sourceforge could be implemented, including the conversion pipeline from .jar -> .exe -> setup.exe.


## Build
- Build projects .jar file and move it to `SomeSoftware Compile/SomeSoftware.jar`.
- Use Launch4j to convert .jar file to a .exe. (Config file: `SomeSoftware Compile/SomeSoftware.xml`)
- For the creation of the setup.exe and the registry entries Inno Setup is used. (Config file: `SomeSoftware Compile/SomeSoftware.iss`)

## License
Sourceforge Auto Updater is licensed under [GNU GENERAL PUBLIC LICENSE](https://www.gnu.org/licenses/gpl-3.0.en.html).

## Credits
Thanks to:
- james-d
- clarkbean710
- ajeje93
- alex
- slartidan
- ItachiUchiha
