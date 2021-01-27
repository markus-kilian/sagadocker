This container based on Ubuntu:latest and SAGA GIS. see http://www.saga-gis.org/en/index.html
In additon a python environment is implemented to ensure saga-python compatibility.

The installation and compiling based on: https://sourceforge.net/p/saga-gis/wiki/Compiling%20SAGA%20on%20Linux/

To run the SAGA GUI use this command: docker run -it --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" mkilian85/sagagis and in the terminal saga_gui

Otherwise the SAGA commandline saga_cmd can be run inside the terminal with: saga_cmd
