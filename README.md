# Thermal Monitor Plasmoid

## Install
~~~ bash
kpackagetool5 -t Plasma/Applet --install plasmoid
~~~

## Preview without installing
~~~ bash
plasmoidviewer --applet plasmoid  
~~~

## Upgrade and restart Plasmashell
~~~ bash
kpackagetool5 -t Plasma/Applet --upgrade plasmoid && killall plasmashell && kstart5 plasmashell
~~~

## Plasma DataSource Engine Explorer
~~~ bash
plasmaengineexplorer   
~~~