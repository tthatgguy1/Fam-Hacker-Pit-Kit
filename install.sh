#!/data/data/com.termux/files/usr/bin/bash
  # Project name: Fam-Hacker-Pit-Kit
  # Coded by: tthatgguy1 (You dont become a coder by just changing the credits)
  # Github: https://github.com/tthatgguy1/Fam-Hacker-Pit-Kit
  # Date: 12/04/2024
  # Updated 08/21/2026

# <───── Rare Logo ─────> #
	 clear
     #       ╔=====================================================================================================================╗
     #       ║        o          o                       o                       o__ __o__/_                                       ║
     #       ║       <|\        <|>                     <|>                     <|>                                                ║                                                                                                                             
     #       ║       / \\o      / \                     / >                     < >                                                ║
     #       ║       \o/ v\     \o/       o__ __o/      \o__ __o                 |         o__  __o/        \o__ __o__ __o         ║            
     #       ║        |   <\     |       /v     |        |     v\                o__/_    /v       |         |     |     |>        ║
     #       ║       / \    \o  / \     />     / \      / \     <\               |       />       / \       / \   / \   / \        ║
     #       ║       \o/     v\ \o/     \      \o/      \o/     o/              <o>      \        \o/       \o/   \o/   \o/        ║
     #       ║        |       <\ |       o      |        |     <|                |        o        |         |     |     |         ║
     #       ║       / \        < \      <\__  / \      / \    / \              / \         \__   / \       / \   / \   / \        ║  
     #       ║                                                                                                                     ║
     #       ║                                                                                                                     ║
     #       ║                                                                                                                     ║                                                   
     #       ║        d888888o. 8888888 8888888888 8 8888      88 8 888888888o.       8 8888  ,o888888o.           d888888o.       ║
     #       ║      .`8888:' `88.     8 8888       8 8888      88 8 8888    `^888.    8 8888  . 8888     `88.   .` 8888:' `88.     ║
     #       ║      8.`8888.   Y8     8 8888       8 8888      88 8 8888        `88.  8 8888  ,8 8888       `8b  8.`8888.   Y8     ║
     #       ║      `8.`8888.         8 8888       8 8888      88 8 8888         `88  8 8888  88 8888        `8b `8.`8888.         ║
     #       ║       `8.`8888.        8 8888       8 8888      88 8 8888          88  8 8888  88 8888         88  `8.`8888.        ║
     #       ║        `8.`8888.       8 8888       8 8888      88 8 8888          88  8 8888  88 8888         88   `8.`8888.       ║
     #       ║         `8.`8888.      8 8888       8 8888      88 8 8888         ,88  8 8888  88 8888        ,8P    `8.`8888.      ║
     #       ║     8b   `8.`8888.     8 8888       ` 8888     ,8P 8 8888        ,88'  8 8888  `8 8888       ,8P 8b   `8.`8888.     ║
     #       ║     `8b.  ;8.`8888     8 8888         8888   ,d8P  8 8888    ,o88P'    8 8888  ` 8888     ,88'   `8b.  ;8.`8888     ║
     #       ║      `Y8888P ,88P'     8 8888          `Y88888P'   8 888888888P'       8 8888  `8888888P'          `Y8888P ,88P'    ║
     #       ║                                                                                                                     ║   
     #       ╚======================================================Menu===========================================================╝
# <───── Color Setup ─────> #
	ESC=$'\e'
		BLK="${ESC}[38;2;0;0;0m"           # ${BLK}   $BLK   - Black
		GRN="${ESC}[38;2;51;255;0m"        # ${GRN}   $GRN   - Lime Green
		BLU="${ESC}[38;2;0;102;255m"       # ${BLU}   $BLU   - Medium Blue
		GRY="${ESC}[38;2;208;208;208m"     # ${GRY}   $GRY   - Gray

		MBLU="${ESC}[38;2;25;25;112m"      # ${VBLU}  $VBLU  - Midnight Blue
		BONG="${ESC}[38;2;255;140;0m"      # ${BONG}  $BONG  - Pumpkin Orange

		NONG="${ESC}[38;2;255;95;0m"       # ${NONG}  $NONG  - Neon Orange
		BBLK="${ESC}[38;2;128;128;128m"    # ${BBLK}  $BBLK  - Bright Black
		NYLW="${ESC}[38;2;255;255;0m"      # ${NYLW}  $NYLW  - Neon Yellow
		BYLW="${ESC}[38;2;255;255;51m"     # ${BYLW}  $BYLW  - Bright Yellow
		BCYN="${ESC}[38;2;0;255;255m"      # ${BCYN}  $BCYN  - Cyan
		BGRN="${ESC}[38;2;0;255;0m"        # ${BGRN}  $BGRN  - Bright Green
		ACID="${ESC}[38;2;204;255;0m"      # ${ACID}  $ACID  - Acid Green
		IBLU="${ESC}[38;2;75;0;130m"       # ${IBLU}  $IBLU  - Indigo Blue
		VBLU="${ESC}[38;2;138;43;226m"     # ${VBLU}  $VBLU  - Violet Blue
		NPPL="${ESC}[38;2;188;19;254m"     # ${NPPL}  $NPPL  - Neon Purple
		BPNK="${ESC}[38;2;255;16;240m"     # ${BPNK}  $BPNK  - Bright Magenta
		BWHT="${ESC}[38;2;255;255;255m"    # ${BWHT}  $BWHT  - Bright White
		RESET="${ESC}[0m"		   		   # ${RESET} $RESET - Resets The Color

# <───── Update Packages ─────> #
 echo
 printf "${VBLU}Updating ${BCYN}Default ${VBLU}Packages${RESET}\n\n"
 read -r -n1 -t3
 "pkg" update -y && pkg upgrade -y && pkg update -y && pkg upgrade -y
 "pkg" install ruby -y
 "gem" install lolcat
 "pkg" install mpv -y | lolcat
 "pkg" install aria2 -y | lolcat
 "pkg" install cowsay -y | lolcat
 "pkg" install python ffmpeg -y | lolcat
 "pkg" install yt-dlp -y | lolcat
 "pkg" install toilet -y | lolcat
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear
# <───── Fam-Hacker Banner ─────> #
 printf "\n"
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
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <───── Ternux Storage Setup ─────> #
 printf "\n"
 date +"%l:%M:%S %p" | lolcat
 printf "\n\n"
 printf "You Will Need To Give Termux Permission To Access Your Storage.\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
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

# <───── Create Cookies ─────> #
 mkdir ~/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/Cookies
 printf "${VBLU}Created ${BPNK}Cookies\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t6
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

# <───── Create Termux-Playlist─URL─Script─────> #
 echo
 printf "${VBLU}Now Creating ${BPNK}termux${BCYN}-${BPNK}playlist${BCYN}-${BPNK}url${BCYN}.${BPNK}sh\n"
 sleep 2.0
 chmod +x termux-playlist-url.sh
 mv termux-playlist-url.sh ~/bin/
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <───── Create Termux-Playlist─URL─MKV─Script─────> #
 echo
 printf "${VBLU}Now Creating ${BPNK}termux${BCYN}-${BPNK}playlist${BCYN}-${BPNK}url${BCYN}-${BPNK}mkv${BCYN}.${BPNK}sh\n"
 sleep 2.0
 chmod +x termux-playlist-url-mkv.sh
 mv termux-playlist-url-mkv.sh ~/bin/
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <───── Create Termux-File-Editor Script─────> #
 echo
 printf "${VBLU}Now Creating ${BPNK}termux${BCYN}-${BPNK}file${BCYN}-${BPNK}editor\n"
 sleep 2.0
 chmod +x termux-file-editor
 mv termux-file-editor ~/bin/
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <───── Create Termux-URL-Opener Script─────> #
 echo
 printf "${VBLU}Creating ${BPNK}termux${BCYN}-${BPNK}url${BCYN}-${BPNK}opener ${VBLU}Now\n"
 sleep 2.0
 chmod +x termux-url-opener
 mv termux-url-opener ~/bin/
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <───── Create Termux─URL─Bash─Script─────> #
 echo
 printf "${VBLU}Now Creating ${BPNK}termux${BCYN}-${BPNK}url${BCYN}-${BPNK}opener${BCYN}.${BPNK}sh\n"
 sleep 2.0
 chmod +x termux-url-opener.sh
 mv termux-url-opener.sh ~/bin/
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear

# <── Create Bashrc ──> #
cat > "$HOME/.bashrc" <<'EOF'
# <── Termux Bashrc ──> #

export EDITOR=nano
export VISUAL=nano

alias backhak="pkg uninstall aria2 && rm -rf storage && rm -rf Fam-Hacker-Pit-Kit && rm -rf bin && rm -rf downloads"
alias backlol="pkg uninstall aria2 && rm -rf storage && rm -rf Fam-Hacker-Pit-Kit && rm -rf bin && rm -rf downloads | lolcat"
alias fam500="echo Fam-Hacker King | lolcat --animate -d 500"
alias fwd="git clone https://github.com/tthatgguy1/Fam-Hacker-Pit-Kit.git && cd Fam-Hacker-Pit-Kit && bash install.sh"
alias fwdcat="git clone https://github.com/tthatgguy1/Fam-Hacker-Pit-Kit.git && cd Fam-Hacker-Pit-Kit && bash install.sh | lolcat"
alias nanload="nano /data/data/com.termux/files/usr/etc/bash.bashrc"
alias cls="clear"
alias catlsa="ls -a | lolcat"
alias catls="ls | lolcat"
alias cdh="cd \$HOME"
alias cdb="cd .."
alias upkitty="pkg update && pkg upgrade -y"
alias upkitty2="pkg update && pkg upgrade -y && clear"
alias cprop="nano ~/.termux/colors.properties"

printf "\n\n\n\n"

cowsay -f cheese 'Welcome to Termux' | lolcat
sleep 3.0
PS1='\033[1;35m╔═╣\033[0m\033[1;33m\d\033[0m\033[1;35m╠══╣\033[0m\033[1;34mFam\033[0m\033[1;32m-\033[0m\033[1;34mHacker\033[0m\033[1;35m╠══╣\033[0m\033[1;32m\T\033[0m\033[1;35m╠══\033[0m\033[1;36m⦃\033[0m\033[1;32m\w\033[0m\033[1;36m⦄\033[0m
\033[1;35m╟─────────────\033[0m\033[1;36m⦓\033[0m\#\033[1;36m⦔\033[0m
\033[1;35m╚═\033[0m\033[1;36m{\033[0m👽\033[1;36m}\033[0m\033[1;35m═≽\033[0m\033[1;36m'
clear

printf "\n\n\n\n"

echo '
                                ┳
            ──▄────▄▄▄▄▄▄▄────▄─┃
            ─▀▀▄─▄█████████▄─▄▀▀┃
            ─────██─▀███▀─██────┃
            ───▄─▀████▀████▀─▄──┃
            ─▀█────██▀█▀██────█▀┃
                                ┃
                                ┃
                                ┃
                                ┃
                                ┻' | lolcat \-a

printf "\n\n\n\n"

sleep 1.0
clear
cowsay -f milk 'Load Complete' | lolcat
printf "\n\n\n\n"
date | lolcat
printf "\n\n"
echo '⚡ Nah-Fam Studios ⚡' | lolcat
printf "\n\n\n\n"
clear
EOF

printf "${VBLU}bashrc created ${BPNK}successfully${VBLU}!${RESET}\n"
printf "\n\n"
printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
printf "${BCYN}└──${BPNK}>${BCYN}"
read -r -n1 -t3

# <───── Outro ─────> #
 echo " "
 echo " "
 cowsay -r "You Can Now Download Any YouTube Video To A .MKV File by Sharing Any URL to Termux from YouTube, As Well As Download Torrent Files by Clicking Edit When Opening Through Termux." | lolcat --seed 75
 printf "\n\n"
 printf "${BCYN}┌──${BPNK}Press${BCYN}─${BPNK}Any${BCYN}─${BPNK}Button${BCYN}─${BPNK}To${BCYN}─${BPNK}Move${BCYN}─${BPNK}On${BCYN}──┐\n"
 printf "${BCYN}└──${BPNK}>${BCYN}"
 read -r -n1 -t3
 clear
 exit
