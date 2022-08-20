#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

path=$(pwd)
shouldRemove='0'
alreadyInstall=$(grep "####10108bleach10108####" < ~/.zshrc)
    
    if [  ${#alreadyInstall} == 0 ]
    then
        printf "\n\033[0;31mBleach is not installed!\033[0m\n\n"
    else
        while read -r line
        do
            if [[ ! $line =~ "####10108bleach10108####" ]]
            then
                if [ $shouldRemove == '0' ]
                then
                    echo "$line"
                fi
            else
                if [ $shouldRemove == '0' ]
                then
                    shouldRemove='1'
                elif [ $shouldRemove == '1' ]
                then
                    shouldRemove='0'
                fi
            fi
        done < ~/.zshrc > O1234567899876543210

        $(cat O1234567899876543210 > ~/.zshrc)
        $(rm -rf O1234567899876543210)

        echo -e "\033[33m
        ╔╗ ┬  ┌─┐┌─┐┌─┐┬ ┬ 
        ╠╩╗│  ├┤ ├─┤│  ├─┤
        ╚═╝┴─┘└─┘┴ ┴└─┘┴ ┴
        \033[0;32m      GoodBye 👋
        \033[0m
        ";
    fi