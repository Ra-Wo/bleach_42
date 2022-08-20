#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

check_storage() {
    Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
    if [ "$Storage" == "0BB" ];
    then
        Storage="0B"
    fi

    printf "\n\n\033[32m [ Available storage :  $Storage  ]\n\033[0m\n\n"
}

check_storage;
