#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

startInstall() {
    printf "\nInstalling...\n\n";
    path=$(pwd)
    bleachPath="$(pwd)/cleaner.bash"
    alreadyInstall=$(grep "####10108bleach10108####" < ~/.zshrc)
    
    if [  ${#alreadyInstall} == 0 ]
    then
        echo -e "\n####10108bleach10108####" >> ~/.zshrc
        echo "/bin/bash $bleachPath" >> ~/.zshrc
        echo "alias storage=\"bash $path/check_space.bash\"" >> ~/.zshrc
        echo "alias bleach=\"bash $path/help.bash\"" >> ~/.zshrc
        echo "alias unBleach=\"bash $path/unbleach.bash\"" >> ~/.zshrc
        echo "alias bclean=\"bash $bleachPath\"" >> ~/.zshrc
        echo -e "####10108bleach10108####" >> ~/.zshrc
        printf "\033[32mInstalled ✅ \033[0m\n"
        printf "Please reopen terminal\n"
    else
        printf "\033[32mAlready installed!✅ \033[0m\n\n"
    fi
}

echo -e "\033[33m
            ╔╗ ┬  ┌─┐┌─┐┌─┐┬ ┬ 
            ╠╩╗│  ├┤ ├─┤│  ├─┤
            ╚═╝┴─┘└─┘┴ ┴└─┘┴ ┴
         Created by \033[0;32mRachid Oudouch
\033[0m
"

printf "\nBefore you continue you must have installed Zsh first!\n\n"
printf "\033[0;33mInstall? [y/n]: \033[0m"
read -p "" zsh

if [ "$zsh" == 'y' ] || [ "$zsh" == 'yes' ]
then
    startInstall;
fi
if [ "$zsh" == 'n' ] || [ "$zsh" == 'no' ]
then
    printf "\n\n\033[0;31mPlease install zsh then try to install Bleach!\n\n"
fi
