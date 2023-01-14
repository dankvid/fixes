#!/bin/bash

# get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# get discord path
DISCORD_PATH=$(which discord)

# get discord folder
DISCORD_FOLDER=$(dirname $DISCORD_PATH)

# go to discord folder
cd $DISCORD_FOLDER

# get build_info.json path
BUILD_INFO_PATH="$DISCORD_FOLDER/resources/build_info.json"

# edit build_info.json
sed -i 's/"version": "[0-9\.]*"/"version": "0.0.xx"/g' $BUILD_INFO_PATH

# go back to original directory
cd $DIR

# add "SKIP_HOST_UPDATE" to settings.json
echo '{"SKIP_HOST_UPDATE": true}' >> ~/.config/discord/settings.json
