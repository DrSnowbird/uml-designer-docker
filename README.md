# uml-designer-docker
[![](https://images.microbadger.com/badges/image/openkbs/uml-designer-docker.svg)](https://microbadger.com/images/openkbs/uml-designer-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/uml-designer-docker.svg)](https://microbadger.com/images/openkbs/uml-designer-docker "Get your own version badge on microbadger.com")

* UMLDesigner 9 + Java 11 OpenJDK + Maven 3 + Python 3 + X11 (display GUI)

# Components
* UMLDesigner v9.0.0
* [Base Container Image: openkbs/jdk11-mvn-py3](https://github.com/DrSnowbird/jdk11-mvn-py3)
* [Base Components: OpenJDK, Python 3, PIP, Node/NPM, Gradle, Maven, etc.](https://github.com/DrSnowbird/jdk11-mvn-py3#components)
* X11 for desktop display
* Google-Chrome
* Firefox
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

# Run (recommended for easy-start)
Image is pulling from openkbs/uml-designer-docker
```
./run.sh
```

# Build
You can build your own image locally.
```
./build.sh
```

# Configurations (Optional)
If you run "./run.sh" instead of "docker-compose up", you don't have to do anything as below.

* The container uses a default "/workspace" folder. 
* The script "./run.sh" will re-use or create the local folder in your $HOME directory with the path below to map into the docker's internal "/workspace" folder.

# Other docker-based IDE
* [openkbs/eclipse-photon-docker](https://hub.docker.com/r/openkbs/eclipse-photon-docker/)
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)

# Display X11 Issue

More resource in X11 display of Eclipse on your host machine's OS, please see
* [X11 Display problem](https://askubuntu.com/questions/871092/failed-to-connect-to-mir-failed-to-connect-to-server-socket-no-such-file-or-di)
* [X11 Display with Xhost](http://www.ethicalhackx.com/fix-gtk-warning-cannot-open-display/)

# Other possible Issues
You might see the warning message or something similar in the launching xterm console like below, you can just ignore it. I googles around and some blogs just suggested to ignore since the IDE still functional ok.

# Releases information
* [See Releases Information](https://github.com/DrSnowbird/jdk-mvn-py3#releases-information)

