#!/data/data/com.termux/files/usr/bin/bash
# Project name : Fam-Hacker-Client-Kit
# Coded by: tthatgguy1 (You dont become a coder by just changing the credits
# Github: https://github.com/tthatgguy1/Fam-Hacker_Client
# Date : 12/04/2024
# Updated 09/09/2025

## Logo & Date
clear

		  # <───── Color Setup ─────> #
ESC=$'\e'
#BLK="${ESC}[38;2;0;0;0m"          # ${BLK}   $BLK   - Black
#GRN="${ESC}[38;2;51;255;0m"       # ${GRN}   $GRN   - Lime Green
#BLU="${ESC}[38;2;0;102;255m"      # ${BLU}   $BLU   - Medium Blue
#GRY="${ESC}[38;2;208;208;208m"    # ${GRY}   $GRY   - Gray

#MBLU="${ESC}[38;2;25;25;112m"     # ${VBLU}  $VBLU  - Midnight Blue
#BONG="${ESC}[38;2;255;140;0m"     # ${BONG}  $BONG  - Pumpkin Orange

NONG="${ESC}[38;2;255;95;0m"       # ${NONG}  $NONG  - Neon Orange
#BBLK="${ESC}[38;2;128;128;128m"   # ${BBLK}  $BBLK  - Bright Black
#NYLW="${ESC}[38;2;255;255;0m"     # ${NYLW}  $NYLW  - Neon Yellow
#BYLW="${ESC}[38;2;255;255;51m"    # ${BYLW}  $BYLW  - Bright Yellow
BCYN="${ESC}[38;2;0;255;255m"      # ${BCYN}  $BCYN  - Cyan
BGRN="${ESC}[38;2;0;255;0m"        # ${BGRN}  $BGRN  - Bright Green
ACID="${ESC}[38;2;204;255;0m"      # ${ACID}  $ACID  - Acid Green
#IBLU="${ESC}[38;2;75;0;130m"      # ${IBLU}  $IBLU  - Indigo Blue
VBLU="${ESC}[38;2;138;43;226m"     # ${VBLU}  $VBLU  - Violet Blue
NPPL="${ESC}[38;2;188;19;254m"     # ${NPPL}  $NPPL  - Neon Purple
BPNK="${ESC}[38;2;255;16;240m"     # ${BPNK}  $BPNK   - Bright Magenta
BWHT="${ESC}[38;2;255;255;255m"    # ${BWHT}  $BWHT  - Bright White
RESET="${ESC}[0m"		   # ${RESET} $RESET - Resets The Color

# <───── Intro Sound Effect ─────> #
echo " "

# <───── Fam-Hacker Banner ─────> #
echo " "
echo '
──███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
──██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
──█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
──██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
──██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
──╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
─██╗███╗───██╗███████╗████████╗╔█████╗─██╗─────██╗─────███████╗██████╗─
─██║████╗──██║██╔════╝╚══██╔══╝██╔══██╗██║─────██║─────██╔════╝██╔══██╗
─██║██╔██╗─██║███████╗───██║───███████║██║─────██║─────█████╗──██████╔╝
─██║██║╚██╗██║╚════██║───██║───██╔══██║██║─────██║─────██╔══╝──██╔══██╗
─██║██║─╚████║███████║───██║───██║──██║███████╗███████╗███████╗██║──██║
─╚═╝╚═╝──╚═══╝╚══════╝───╚═╝───╚═╝──╚═╝╚══════╝╚══════╝╚══════╝╚═╝──╚═╝
---------------------------[Nah-Fam_Studios]------------------------------' | lolcat
echo " "
sleep 5.0
clear

# <───── Date & Time With Cowsay ─────> #
echo " "
date +"%l:%M:%S %p" | lolcat --animate -d 90
echo " "
printf "${BCYN}┌──${BPNK}Please${BCYN}─${BPNK}Press${BCYN}─${ACID}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Start${BCYN}─${BPNK}The${BCYN}─${BPNK}Install${BCYN}──┐${RESET}\n${BCYN}└─${ACID}>${NONG}:${RESET} "
read -n1 -r
sleep 2.0
clear

# <───── Ternux Storage Setup ─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "You Will Need To Give Termux Permission To Access Your Storage.\n"
echo " "
printf "┌──Please─Press─Any─Button─To─Execute─This─Command──┐\n└─>: "
read -n1 -r
termux-setup-storage | lolcat
echo " "
echo " "
clear

# <───── Fam-Hacker-Client-Kit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit
printf "Created Fam-Hacker-Pit-Kit\n"

# <───── Create .NFS-Data ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data
printf "Created .NFS-Data\n"

# <───── Create Fam-Hacker-Torrent-Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/Fam-Hacker-Torrent-Pit
printf "Created Fam-Hacker-Torrent-Pit\n"

# <───── Create YouTube Audio Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit
printf "Created YouTube Audio Pit\n"

# <───── Create YouTube Video Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit
printf "Created YouTube Video Pit\n"

# <───── Create sfx ─────> #
mkdir ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx
printf "Created sfx\n"

# <───── Create downloads ─────> #
"mkdir" ~/downloads
printf "Created downloads\n"
sleep 4.0
clear

# <───── Create Bin ─────> #
"mkdir" ~/bin
printf "Created Bin\n"
sleep 4.0
clear

# <───── Move Sound Effects ─────> #
"cd" Data
"mv" * $HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx >/dev/null 2>&1
printf "Sound Effects Have Been Moved\n"
echo " "
"cd" ..
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
echo " "

# <───── Update Packages ─────> #
echo " "
date +"%l:%M:%S %p"
echo " "
printf "Updating Default Packages\n"
"pkg" update -y && pkg upgrade -y && apt update -y && apt upgrade -y
"pkg" install ruby -y
"gem" install lolcat
"pkg" install mpv -y | lolcat
"pkg" install aria2 -y | lolcat
"pkg" install cowsay -y | lolcat
"pkg" install python ffmpeg -y | lolcat
"pkg" install yt-dlp -y | lolcat
echo " "
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

# <───── Create Termux-File-Editor Script─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "Creating termux-file-editor Now\n"
sleep 2.0
chmod +x termux-file-editor
mv termux-file-editor ~/bin/
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
clear

# <───── Create Termux-URL-Opener Script─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "Creating termux-url-opener Now\n"
sleep 2.0
chmod +x termux-url-opener
mv termux-url-opener ~/bin/
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
clear

# <───── Outro ─────> #
echo " "
echo " "
cowsay -r "You Can Now Download Any YouTube Video To A .MKV File by Sharing Any URL to Termux from YouTube, As Well As Download Torrent Files by Clicking Edit When Opening Through Termux."
echo " "
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
