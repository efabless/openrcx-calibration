#!/bin/sh

export IMAGE_NAME=efabless/foss-asic-tools:delta

docker pull $IMAGE_NAME

docker run -it -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration && ./scripts/run-magic.sh nom"
docker run -it -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration && ./scripts/run-magic.sh max"
docker run -it -v $(pwd):/foss/designs/openrcx-calibration --entrypoint bash $IMAGE_NAME -c "cd openrcx-calibration && ./scripts/run-magic.sh min"
