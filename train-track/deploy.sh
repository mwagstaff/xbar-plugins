#!/bin/bash

# For all scripts except this one, ensure all files are executable, and copy to the xbar plugins directory
for file in *.sh; do
    if [ "$file" != "deploy.sh" ]; then
        echo "Deploying script: $file"
        chmod +x $file
        cp $file ~/Library/Application\ Support/xbar/plugins
    fi
done