#!/bin/sh

export IMAGE_NAME=efabless/foss-asic-tools:delta

docker pull $IMAGE_NAME

docker run -it -v $(pwd):/foss/designs/openrcx-calibration $IMAGE_NAME bash -c "cd openrcx-calibration; ./scripts/run-spef_extractor.sh nom"
docker run -it -v $(pwd):/foss/designs/openrcx-calibration $IMAGE_NAME bash -c "cd openrcx-calibration; ./scripts/run-spef_extractor.sh min"
docker run -it -v $(pwd):/foss/designs/openrcx-calibration $IMAGE_NAME bash -c "cd openrcx-calibration; ./scripts/run-spef_extractor.sh max"
