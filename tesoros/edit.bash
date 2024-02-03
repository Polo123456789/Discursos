#!/bin/bash

# https://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0

if [[ $sourced -eq 0 ]]
then
    echo "Script is not sourced, note that the CWD will not change"
fi

date=$(zenity --calendar --date-format "%Y-%m-%d")

if [[ ! -d "$date" ]]
then
    mkdir "$date"
fi

cd "$date"
nvim bosquejo.md

file_is_empty=$(cat bosquejo.md | wc -l)

if [[ $file_is_empty -eq 0 ]]
then
    read -p "File is empty, delete? [y/n] " delete
    if [[ $delete == "y" ]]
    then
        rm bosquejo.md
        cd ..
        rmdir "$date"
    fi

fi
