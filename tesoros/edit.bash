#!/bin/bash

# https://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0

if [[ $sourced -eq 0 ]]
then
    echo "This script should be sourced"
    exit 1
fi

date=$(zenity --calendar --date-format "%Y-%m-%d")

if [[ ! -d "$date" ]]
then
    mkdir "$date"
fi

cd "$date"
nvim bosquejo.md
