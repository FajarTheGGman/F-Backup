#Copyright© 2020 By Fajar Firdaus

#!/bin/bash
green='\e[32m'
cyan='\e[36m'
red='\e[31m'
yellow='\e[33m'
underline='\e[4m'

echo -e $green "[ =- F-Backup -= ]\n"
echo -e $cyan "[ Backup Terminal For Linux ]"

echo -e $yellow "{"
echo -e $red "'Coder' : 'Fajar Firdaus',"
echo -e $red "'FB' : 'Fajar Firdaus',"
echo -e $red "'IG' : 'FajarTheGGman',"
echo -e $red "'GITHUB' : FajarTheGGman"
echo -e $yellow "}\n"


echo -e $green "[1] Backup"
echo -e $green "[2] Restore"
echo -e $red "[0] Exit"

read -p "{Choose} >_ " x

if [[ $x == 1 ]]; then
   mkdir backup
   echo -e $green "[+] Backup all packages installed"
   dpkg --get-selections > ./backup/packages.log
   echo -e $green "[+] Backup all files in home directory"
   tar czf hasil.tar.gz ../ > ./backup
   echo -e $green "[+] Backup python3 modules"
   pip3 freeze > ./backup/pip3.log
   echo -e $green "[+] Backup python2 modules"
   pip2 freeze > ./backup/pip2.log
fi

if [[ $x == 2 ]]; then
   dpkg --clear-selections < ./backup/packages.log
   tar -xzvf ./backup/hasil.tar.gz $HOME
   pip3 install -r ./backup/pip3.log
   pip2 install -r ./backup/pip2.log
fi

if [[ $x == 0 ]]; then
exit
fi
