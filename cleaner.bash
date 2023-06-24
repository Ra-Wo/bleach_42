#!/bin/bash
#Author Rachid Oudouch
#42login : roudouch

StorageBefore=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$StorageBefore" == "0BB" ];
then
    StorageBefore="0B"
fi

printf "\n\033[32mBleach is cleaning your computer, pls wait...\033[0m\n"

clean42Caches() {
    /bin/rm -rf ~/Library/*.42* &>/dev/null
    /bin/rm -rf ~/*.42* &>/dev/null
    /bin/rm -rf ~/.zcompdump* &>/dev/null
    /bin/rm -rf ~/.cocoapods.42_cache_bak* &>/dev/null
}

# cleanTrash() {
#     /bin/rm -rf ~/.Trash/* &>/dev/null
# }

cleanGeneralCacheFiles() {
    /bin/rm -rf ~/Library/Caches/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Caches/* &>/dev/null
}

cleanAppsCaches() {
    /bin/rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/discord/Cache/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
}

cleanDS_StoreFiles() {
    find ~/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null
}

cleanTmpDownloadsFiles() {
    /bin/rm -rf ~/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null
}

cleanPoolThings() {
    /bin/rm -rf ~/Desktop/Piscine\ Rules\ *.mp4
    /bin/rm -rf ~/Desktop/PLAY_ME.webloc
}


clean42Caches;
# cleanTrash;
cleanGeneralCacheFiles;
cleanAppsCaches;
cleanDS_StoreFiles;
cleanTmpDownloadsFiles;
cleanPoolThings


Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi

printf "\n\033[32m[ storage :  \033[0;31mbefore= $StorageBefore  \033[32m=> \033[0m"
printf "\033[32mafter= $Storage  ]\033[0m\n\n"