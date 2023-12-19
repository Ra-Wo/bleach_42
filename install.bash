#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

startInstall() {
    printf "\nInstalling...\n\n";
    path=$(pwd)
    bleachPath="$(pwd)/cleaner.bash"
    alreadyInstall=$(grep "####10108bleach10108####" < ~/.zshrc)
    if [ ${#alreadyInstall} == 0 ]
    then
        echo $'\n\n\n####10108bleach10108####' >> ~/.zshrc
        echo "alias storage=\"bash $path/check_space.bash\"" >> ~/.zshrc
        echo "alias bleach=\"bash $path/help.bash\"" >> ~/.zshrc
        echo "alias unbleach=\"bash $path/unbleach.bash\"" >> ~/.zshrc
        echo "alias bdocker=\"bash $path/init_docker.bash\"" >> ~/.zshrc
        echo "alias bclean=\"bash $bleachPath\"" >> ~/.zshrc
        echo "alias bcleanfull=\"bash $path/cleanAllAppsData.bash\"" >> ~/.zshrc
        
        if [ "$1" == '1' ]
        then
            echo "/bin/bash $bleachPath" >> ~/.zshrc
        fi
        echo "####10108bleach10108####" >> ~/.zshrc
        printf "\033[32mInstalled ✅ \033[0m\n"
        printf "\n\n\033[0;31mPlease reopen terminal\033[0m\n\n"
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

printf "\033[0;36m[1] \033[0;33mFull install (install and run whenever you open terminal)\n\033[0;36m[2] \033[0;33mJust install (run bleach as a command) \033[0m\n\n \033[0;36m─➤ "
read -p "" var

if [ "$var" == '1' ]
then
    startInstall '1';
fi
if [ "$var" == '2' ]
then
    startInstall;
fi
