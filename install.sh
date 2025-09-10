#!/data/data/com.termux/files/usr/bin/bash
# Project name : Fam-Hacker-Client-Kit
# Coded by: tthatgguy1 (You dont become a coder by just changing the credits
# Github: https://github.com/tthatgguy1/Fam-Hacker_Client
# Date : 12/04/2024
# Updated 09/09/2025

## Logo & Date
clear

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
printf "┌──Please─Press─Any─Button─To─Start─The─Setup──┐\n└─>: "
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

# <───── Create Bin ─────> #
"mkdir" ~/bin
printf "Created Bin\n"
sleep 4.0
clear

# <───── Move Sound Effects ─────> #
mv ~/Fam-Hacker-Pit-Kit/Data/*.mp3* ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx
printf "Sound Effects Have Been Moved\n"
echo " "
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
echo " "

# <───── Update Packages ─────> #
echo " "
date +"%l:%M:%S %p"
echo " "
printf "Updating Default Packages\n"
"pkg" update -y && pkg upgrade -y && apt update -y && apt upgrade -y
sleep 2.0
echo " "
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 3.5
clear

# <───── Install mpv ─────> #
echo " "
date +"%l:%M:%S %p"
echo " "
printf "Now Installing MPV\n"
"pkg" install mpv -y
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

# <───── Install Ruby ─────> #
echo " "
date +"%l:%M:%S %p"
echo " "
printf "Now Installing Ruby for lolcat\n"
"pkg" install ruby -y
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

# <───── Install lolcat ─────>
echo " "
date +"%l:%M:%S %p"
echo " "
printf "Now Installing lolcat\n"
"gem" install lolcat
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

## <───── Install Aria2 Termux ─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "Now Installing Aria2c\n"
"pkg" install aria2 -y | lolcat
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

## <───── Install Cowsay ─────> #
echo " "
date +"%l:%M:%S %p" | lolcat
echo " "
printf "Now Installing Cowsay\n"
"pkg" install cowsay -y | lolcat
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

# <───── Install Python ffmpeg ─────> #
echo " "
printf "Now Installing ffmpeg\n"
"pkg" install python ffmpeg -y | lolcat
printf "┌──Please─Press─Any─Button─To─Continue──┐\n└─>: "
read -n1 -r
sleep 1.5
clear

# <───── Install yt-dlp ─────> #
echo " "
printf "Now Installing YT-DLP\n"
"pkg" install yt-dlp -y | lolcat
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
mv termux-file-editor ~/bin/
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
