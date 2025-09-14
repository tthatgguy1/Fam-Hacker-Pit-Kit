#!/data/data/com.termux/files/usr/bin/bash
# Project name : Fam-Hacker-Pit-Kit
# Coded by: tthatgguy1 (You dont become a coder by just changing the credits
# Github: https://github.com/tthatgguy1/Fam-Hacker-Pit-Kit
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
printf "\n\n\n"
sleep 2.0
clear

# <───── Date & Time With Cowsay ─────> #
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t10
clear

# <───── Ternux Storage Setup ─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "You Will Need To Give Termux Permission To Access Your Storage.\n\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t10

termux-setup-storage | lolcat
clear

# <───── Fam-Hacker-Client-Kit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit
printf "${VBLU}Created ${BPNK}Fam${BCYN}-${BPNK}Hacker${BCYN}-${BPNK}Pit${BCYN}-${BPNK}Kit\n"

# <───── Create .NFS-Data ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data
printf "${VBLU}Created ${NONG}.${BPNK}NFS${BCYN}-${BPNK}Data\n"

# <───── Create Fam-Hacker-Torrent-Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/Fam-Hacker-Torrent-Pit
printf "${VBLU}Created ${BPNK}Fam${BCYN}-${BPNK}Hacker${BCYN}-${BPNK}Torrent${BCYN}-${BPNK}Pit\n"

# <───── Create YouTube Audio Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit
printf "${VBLU}Created ${BPNK}YouTube${BCYN}─${BPNK}Audio${BCYN}─${BPNK}Pit\n"

# <───── Create YouTube Video Pit ─────> #
"mkdir" ~/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit
printf "${VBLU}Created ${BPNK}YouTube${BCYN}─${BPNK}Video${BCYN}─${BPNK}Pit\n"

# <───── Create sfx ─────> #
mkdir ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx
printf "${VBLU}Created ${BPNK}sfx\n"

# <───── Create downloads ─────> #
"mkdir" ~/downloads
printf "${VBLU}Created ${BPNK}downloads\n"

# <───── Create Bin ─────> #
"mkdir" ~/bin
printf "${VBLU}Created ${BPNK}Bin\n"
sleep 2.0
clear

# <───── Move Sound Effects ─────> #
"cd" Data
"mv" * $HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx >/dev/null 2>&1
echo
printf "${VBLU}Sound Effects Have Been ${BCYN}Moved ${VBLU}Successfully\n"
echo
"cd" ..
sleep 2.0
echo

# <───── Update Packages ─────> #
echo
printf "${VBLU}Updating ${BCYN}Default ${VBLU}Packages${RESET}\n\n"
read -r -n1 -t5
"pkg" update -y && pkg upgrade -y && apt update -y && apt upgrade -y
"pkg" install ruby -y
"gem" install lolcat
"pkg" install mpv -y | lolcat
"pkg" install aria2 -y | lolcat
"pkg" install cowsay -y | lolcat
"pkg" install python ffmpeg -y | lolcat
"pkg" install yt-dlp -y | lolcat
"pkg" install toilet -y | lolcat
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Create Termux-Playlist─URL─Script─────> #
echo
printf "Now Creating termux-playlist-url.sh\n"
sleep 2.0
chmod +x termux-playlist-url.sh
mv termux-playlist-url.sh ~/bin/
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Create Termux-Playlist─URL─MKV─Script─────> #
echo
printf "Now Creating termux-playlist-url-mkv.sh\n"
sleep 2.0
chmod +x termux-playlist-url-mkv.sh
mv termux-playlist-url-mkv.sh ~/bin/
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Create Termux-File-Editor Script─────> #
echo
printf "Now Creating termux-file-editor\n"
sleep 2.0
chmod +x termux-file-editor
mv termux-file-editor ~/bin/
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Create Termux-URL-Opener Script─────> #
echo
printf "${VBLU}Creating ${BPNK}termux${BCYN}-${BPNK}url${BCYN}-${BPNK}opener ${VBLU}Now\n"
sleep 2.0
chmod +x termux-url-opener
mv termux-url-opener ~/bin/
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Create Termux─URL─Bash─Script─────> #
echo
printf "Now Creating termux-url-opener.sh\n"
sleep 2.0
chmod +x termux-url-opener.sh
mv termux-url-opener.sh ~/bin/
printf "\n"
printf "┌──Press─Any─Button─To─Move─On──┐\n"
printf "└──>"
read -r -n1 -t4
clear

# <───── Outro ─────> #
echo " "
echo " "
cowsay -r "You Can Now Download Any YouTube Video To A .MKV File by Sharing Any URL to Termux from YouTube, As Well As Download Torrent Files by Clicking Edit When Opening Through Termux." | lolcat
echo " "
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r -t3
clear
exit
