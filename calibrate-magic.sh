#!/bin/sh


export IMAGE_NAME=efabless/foss-asic-tools:epsilon

docker pull $IMAGE_NAME

export PDK=sky130A

docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK nom"
docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK min"
docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK max"

export PDK=sky130B

docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK nom"
docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK min"
docker run -it -u $(id -u):$(id -g) -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration; ./scripts/run-magic.sh $PDK max"
