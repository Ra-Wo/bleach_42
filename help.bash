#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

function deleteService() {
    shouldRemove='0'
    while read -r line
    do
        if [[ ! $line =~ $1 ]]
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
    done < ~/.zshrc > O1234567899876543210Darkmode

    $(cat O1234567899876543210Darkmode > ~/.zshrc)
    $(rm -rf O1234567899876543210Darkmode)
}


if [ "$1" == "active" ]
then
    if [ "$2" == "dark-mode" ]
    then
        alreadyInstall=$(grep "####10108bleach-Dark-mode10108####" < ~/.zshrc)
        if [  ${#alreadyInstall} == 0 ]
        then
            $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true')
            echo -e "\n####10108bleach-Dark-mode10108####" >> ~/.zshrc
            echo -e "osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'" >> ~/.zshrc
            echo -e "####10108bleach-Dark-mode10108####" >> ~/.zshrc
            printf "\n\033[32mDark-mode activated ✅ \033[0m\n\n"
        else
            printf "\n\033[0;31mDark-mode is already activated!\033[0m\n\n"
        fi
    fi

    if [ "$2" == "code" ]
    then
        alreadyInstall=$(grep "####10108bleach-code10108####" < ~/.zshrc)
        if [  ${#alreadyInstall} == 0 ]
        then
            echo -e "\n####10108bleach-code10108####" >> ~/.zshrc
            echo -e "alias code=\"/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/./code\"" >> ~/.zshrc
            echo -e "####10108bleach-code10108####" >> ~/.zshrc
            printf "\n\033[32mcode command activated ✅ \033[0m"
            printf "\033[0;31m: you need to reopen your terminal to apply the new changes.\033[0m\n\n"
        else
            printf "\n\033[0;31mcode command is already activated!\033[0m\n\n"
        fi
    fi

elif [ "$1" == "deactivate" ]
then
    if [ "$2" == "dark-mode" ]
    then
        alreadyInstall=$(grep "####10108bleach-Dark-mode10108####" < ~/.zshrc)
        if [  ${#alreadyInstall} == 0 ]
        then
            printf "\n\033[0;31mDark-mode is not activated!\033[0m\n\n"
        else
            $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false')
            deleteService "####10108bleach-Dark-mode10108####"
            printf "\n\033[32mDark-mode deactivated ✅ \033[0m\n\n"
        fi
    fi
    if [ "$2" == "code" ]
    then
        alreadyInstall=$(grep "####10108bleach-code10108####" < ~/.zshrc)
        if [  ${#alreadyInstall} == 0 ]
        then
            printf "\n\033[0;31mcode command is not activated!\033[0m\n\n"
        else
            deleteService "####10108bleach-code10108####"
            printf "\n\033[32mcode command deactivated ✅ \033[0m"
            printf "\033[0;31m: you need to reopen your terminal to apply the new changes.\033[0m\n\n"
        fi
    fi
else
    echo -e "\033[33m
                    ╔╗ ┬  ┌─┐┌─┐┌─┐┬ ┬ 
                    ╠╩╗│  ├┤ ├─┤│  ├─┤
                    ╚═╝┴─┘└─┘┴ ┴└─┘┴ ┴
                    Created by \033[0;32mRachid Oudouch
    \033[0m"
    printf "\n\033[0;33mBleach will always run when you open the terminal, you don't need to do anything.\033[0m"
    printf "\n\n\033[0;35m------- Command line you can run -------\033[0m\n\n"
    printf "|- To clean your computer: \033[4;36mbclean\n\n\033[0m"
    printf "|- To run docker: \033[4;36mbdocker\n\n\033[0m"
    printf "|- To clean all the applications data in your computer: \033[4;36mbcleanfull \033[0m be careful with this command.\n\n"
    printf "|- To see your free space: \033[4;36mstorage\n\n\033[0m"
    printf "|- To Uninstall Bleach: \033[4;36munbleach\n\n\033[0m"
    printf "|- To active dark-mode: \033[4;36mbleach active dark-mode\n\n\033[0m"
    printf "|- To deactivate dark-mode: \033[4;36mbleach deactivate dark-mode\n\n\033[0m"
    printf "|- To active \"code\" command (Vscode): \033[4;36mbleach active code\n\n\033[0m"
    printf "|- To deactivate \"code\" command: \033[4;36mbleach deactivate code\n\n\033[0m"
    printf "|- for help: \033[4;36mbleach\n\n\033[0m"

fi
