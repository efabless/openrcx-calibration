#!/bin/sh
docker pull  efabless/foss-asic-tools:gamma

#docker run -it -p 80:80 --user $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration -e VNC_RESOLUTION=1920x1080 efabless/foss-asic-tools:gamma bash -c "cd openrcx-calibration; ./calibrate.sh"
docker run -it -v $(pwd):/foss/designs/openrcx-calibration efabless/foss-asic-tools:gamma bash -c "cd openrcx-calibration; ./calibrate.sh"
