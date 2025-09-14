#!/data/data/com.termux/files/usr/bin/bash
# Project Name: Fam-Hacker-Pit-Kit
# Coded by: tthatgguy1 (You dont become a coder by just changing the credits
# Github: https://github.com/tthatgguy1/Fam-Hacker-Pit-Kit
# Date : 12/04/2024
# Updated 09/12/2025
set -euo pipefail

cd /data/data/com.termux/files/home/downloads

VIDEO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit"
AUDIO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit"

ESC=$'\e'
NGRN="${ESC}[38;2;51;255;0m"      # ${NGRN}        $NGRN      - Lime Green
BMGT="${ESC}[38;2;255;16;240m"    # ${BMGT}        $BMGT      - Bright Magenta
NONG="${ESC}[38;2;255;95;0m"      # ${NONG}        $NONG      - Neon Orange
BCYN="${ESC}[38;2;0;255;255m"     # ${BCYN}        $BCYN      - Cyan
ACID="${ESC}[38;2;204;255;0m"     # ${ACID}        $ACID      - Acid Green
VBLU="${ESC}[38;2;138;43;226m"    # ${VBLU}        $VBLU      - Violet Blue
MMDB="${ESC}[38;2;25;25;112m"     # ${MMDB}        $MMDB      - Midnight Blue
NPPL="${ESC}[38;2;188;19;254m"    # ${NPPL}        $NPPL      - Neon Purple
BWHT="${ESC}[38;2;255;255;255m"   # ${BWHT}        #BWHT      - Bright White
RESET="${ESC}[0m"                 # ${RESET}       $RESET
clear

# --- Nah-Fam_Studies ----------------------------------------------------
echo '
   ─███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
   ─██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
   ─█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
   ─██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
   ─██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
   ─╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
   ──────────╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─────────────
   ──────────██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─────────────
   ──────────██║─────██║─────██║█████╗──██╔██╗─██║───██║────────────────
   ──────────██║─────██║─────██║██╔══╝──██║╚██╗██║───██║────────────────
   ──────────╚██████╗███████╗██║███████╗██║─╚████║───██║────────────────
   ───────────╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝────────────────
   ------------------------[Nah-Fam_Studios]----------------------------' | lolcat --seed 92
printf "\n\n"

# ---- Manual URL entry -----------------------------------------------
printf "${VBLU}┌──${BCYN}Enter${VBLU}─${BCYN}Any${VBLU}─${BCYN}YouTube${VBLU}─${BMGT}URL${VBLU}─${BCYN}Here${VBLU}──┐${RESET}\n"
printf "${VBLU}└──${BCYN}>${BMGT}:${ACID} "
read -r URL

if [[ -z "$URL" ]]; then
echo "${BWHT}No ${NONG}URL ${BWHT}Has Been ${NONG}Entered${BMGT}, ${BWHT}Now Exiting${NONG}. ${RESET}"
  exit 2
fi
clear

# <─────────────────── Intro Sounds ───────────────────> #
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/SKL.mp3" >/dev/null 2>&1
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MDATA.mp3" >/dev/null 2>&1
printf "\n\n"

# <─────────────────── Channel Strings ───────────────────> #
DELIM=$'\x1f'
FMT=$'%(playlist_title)s\x1f%(title)s\x1f%(uploader)s\x1f%(channel_follower_count)s\x1f%(like_count)s\x1f%(upload_date)s\x1f%(width)s\x1f%(height)s'
IFS=$DELIM read -r PTITLE TITLE CHANNEL SUBS LIKES UPLOAD_DATE QLTYW QLTYH < <(
    yt-dlp -q --no-warnings --print "${FMT}" "${URL}"
)
if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
  UPLOAD_DATE_FMT="${BCYN}${UPLOAD_DATE:4:2}${BMGT}-${BCYN}${UPLOAD_DATE:6:2}${BMGT}-${BCYN}${UPLOAD_DATE:0:4}"
else
  UPLOAD_DATE_FMT="${UPLOAD_DATE}"
fi

# <─────────────────── Download Options ───────────────────> #
OPTION_BMKV="${VBLU}Download${RESET} \
${BCYN}Video${RESET} \
${VBLU}In${RESET} \
${BCYN}Highest${RESET} \
${VBLU}Resolution${RESET}"

OPTION_2K_CAP="${VBLU}Download${RESET} \
${BCYN}Video${RESET} \
${VBLU}In${RESET} \
${BCYN}2K${RESET} \
${VBLU}Resolution${RESET}"

OPTION_B3="${VBLU}Download An${RESET} \
${BCYN}MP3${RESET} \
${VBLU}File${RESET}"

# <─────────────────── Aria2c Commands ───────────────────> #
OPT_BMKV_CMD=(
  yt-dlp
    -f "bestvideo+bestaudio"
    -o "%(uploader)s - %(title)s [%(height)sp] {Highest_Quality}.mkv"
    --progress
    --quiet
    --no-playlist
    --console-title
    --no-check-formats
    --no-warnings
    --ignore-errors
    --write-subs
    --embed-thumbnail
    --embed-chapters
    --embed-subs
    --sub-format srt
    --convert-subs srt
    --merge-output-format mkv
    --progress-template "download: ${VBLU}DL${BCYN}:%(progress._percent_str)s ${BMGT}ETA${BCYN}: %(progress._eta_str)s ${VBLU}Speed${BCYN}:%(progress._speed_str)s"
    "$URL"
)

OPT_2K_CAP_CMD=(
  yt-dlp
    -f "bestvideo[height<=1440]+bestaudio/best[height<=1440]"
    -o "%(uploader)s - %(title)s [%(height)s]p.mkv"
    --progress
    --quiet
    --no-playlist
    --console-title
    --no-check-formats
    --no-warnings
    --ignore-errors
    --write-subs
    --embed-thumbnail
    --embed-chapters
    --embed-subs
    --sub-format srt
    --convert-subs srt
    --merge-output-format mkv
    --progress-template "download: ${VBLU}DL${BCYN}:%(progress._percent_str)s ${BMGT}ETA${BCYN}: %(progress._eta_str)s ${VBLU}Speed${BCYN}:%(progress._speed_str)s"
    "$URL"
)

OPT_BMP3_CMD=(
  yt-dlp
    -x --audio-format mp3
    -f "bestaudio"
    -o "%(uploader)s - %(title)s.mp3"
    --no-playlist
    --console-title
    --no-check-formats
    --no-warnings
    --ignore-errors
    --progress
    --progress-template "download: DL:%(progress._percent_str)s ETA:%(progress._eta_str)s Speed:%(progress._speed_str)s"
    "$URL"
)

DEFAULT="1"
clear

# --- Nah-Fam_Studies ----------------------------------------------------
echo '
   ─███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
   ─██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
   ─█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
   ─██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
   ─██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
   ─╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
   ──────────╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─────────────
   ──────────██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─────────────
   ──────────██║─────██║─────██║█████╗──██╔██╗─██║───██║────────────────
   ──────────██║─────██║─────██║██╔══╝──██║╚██╗██║───██║────────────────
   ──────────╚██████╗███████╗██║███████╗██║─╚████║───██║────────────────
   ───────────╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝────────────────
   ------------------------[Nah-Fam_Studios]----------------------------' | lolcat --seed 92
printf "\n\n"
printf "   ${VBLU}┌───────────────────────────────────────────────────────────┐\n"
printf "   ${VBLU}│ ${BMGT}[${BCYN}1${BMGT}] %s	       ${VBLU}│\n" "$OPTION_BMKV"
printf "   ${VBLU}├───────────────────────────────────────────────────────────┤\n"
printf "   ${VBLU}│ ${BMGT}[${BCYN}2${BMGT}] %s	       ${VBLU}│\n" "$OPTION_2K_CAP"
printf "   ${VBLU}├───────────────────────────────────────────────────────────┤\n"
printf "   ${VBLU}│ ${BMGT}[${BCYN}2${BMGT}] %s	       ${VBLU}│\n" "$OPTION_B3"
printf "   ${VBLU}├───────────────────────────────────────────────────────────┤\n"
printf "   ${VBLU}│ ${BMGT}[${BCYN}E${BMGT}] ${BCYN}Press ${BWHT}[${NONG}Enter${BWHT}] ${BCYN}For ${BMGT}Default ${BCYN}}Option [%d] ${VBLU}│\n" "$DEFAULT"
printf "   ${VBLU}└───────────────────────────────────────────────────────────┘\n\n"

printf "   ${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐\n"
printf "   ${VBLU}└──${BMGT}>${ACID}: "
read -r -t100 DECISION

DECISION=${DECISION:-$DEFAULT}
    rc=2
    case "${DECISION}" in
  1)
echo '
   ─███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
   ─██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
   ─█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
   ─██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
   ─██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
   ─╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
   ──────────╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─────────────
   ──────────██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─────────────
   ──────────██║─────██║─────██║█████╗──██╔██╗─██║───██║────────────────
   ──────────██║─────██║─────██║██╔══╝──██║╚██╗██║───██║────────────────
   ──────────╚██████╗███████╗██║███████╗██║─╚████║───██║────────────────
   ───────────╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝────────────────
   ------------------------[Nah-Fam_Studios]---------------------------- ' | lolcat --seed 75
printf "\n"
printf "    ${VBLU}┌───────────────────────────────────────────────────────────────┐${RESET}\n"
printf "    ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽───────────────────┤${RESET}\n"
printf "    ${VBLU}├───────────────────────────────────────────────────────────────┘\n"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📺   ${ACID}Chl${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$CHANNEL"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Sbs${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$SUBS"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  👍   ${ACID}Lks${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$LIKES"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📹   ${ACID}Res${NONG}:    ${BMGT}[${BCYN}%s${BMGT}x${BCYN}%s${BMGT}]${RESET}\n"  "$QLTYW" "$QLTYH"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📆   ${ACID}Upd${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$UPLOAD_DATE_FMT"
printf "    ${VBLU}└───────────────────────────────────────────────────────────────┘\n\n"
printf "           ${VBLU}┌───────────────────────────────────────────────┐${RESET}\n"
printf "    ${BCYN}<${VBLU}──────┤ ${BMGT}[${BCYN}Running${BMGT}]${ACID}:${NONG}≡≡${BMGT}> ${BCYN}Highest Quality Video Download  ${VBLU}├────────${BCYN}>${RESET}\n"
printf "           ${VBLU}└───────────────────────────────────────────────┘${RESET}\n"
sleep 1.0
"${OPT_BMKV_CMD[@]}"
rc=$?
  if [ "$rc" -eq 0 ]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Downloaded Successfully" | lolcat
    sleep 1.0
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    printf "\n\n"
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BMGT}>${ACID}: "
    read -r -n1 -t4
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    clear
  fi
newf=$(ls -t -- *.mkv 2>/dev/null | head -n1)
  if [ -n "${newf}" ]; then
    mv -- "${newf}" "${VIDEO_OUT}" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Been Transferred To VIDEO_OUT Successfully"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 1.0
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BMGT}>${ACID}: "
    read -r -n1 -t4
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf "Your MKV File Has Failed To Transfer\n"
    printf "\n"
    printf "┌──Press─Any─Button─To─Move─On──┐\n"
    printf "└──>"
    read -r -n1 -t10
    clear
  fi
;;
  2)
echo '
   ─███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
   ─██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
   ─█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
   ─██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
   ─██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
   ─╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
   ──────────╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─────────────
   ──────────██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─────────────
   ──────────██║─────██║─────██║█████╗──██╔██╗─██║───██║────────────────
   ──────────██║─────██║─────██║██╔══╝──██║╚██╗██║───██║────────────────
   ──────────╚██████╗███████╗██║███████╗██║─╚████║───██║────────────────
   ───────────╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝────────────────
   ------------------------[Nah-Fam_Studios]---------------------------- ' | lolcat
printf "\n\n"
printf "    ${VBLU}┌───────────────────────────────────────────────────────────────┐${RESET}\n"
printf "    ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽───────────────────┤${RESET}\n"
printf "    ${VBLU}├───────────────────────────────────────────────────────────────┘\n"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📺   ${ACID}Chl${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$CHANNEL"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Sbs${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$SUBS"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  👍   ${ACID}Lks${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$LIKES"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📹   ${ACID}Res${NONG}:    ${BMGT}[${BCYN}%s${BMGT}x${BCYN}%s${BMGT}]${RESET}\n"  "$QLTYW" "$QLTYH"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📆   ${ACID}Upd${NONG}:    ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n"     "$UPLOAD_DATE_FMT"
printf "    ${VBLU}└───────────────────────────────────────────────────────────────┘\n\n"
printf "           ┌───────────────────────────────────────────────┐\n"
printf "    <──────┤   [Running]:≡≡>  1440p Quality & Best Audio   ├────────>\n"
printf "           └───────────────────────────────────────────────┘\n"
sleep 1.0
"${OPT_2K_CAP_CMD[@]}"
rc=$?
  if [ "$rc" -eq 0 ]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Downloaded Successfully" | lolcat
    sleep 1.0
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    printf "\n\n"
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BMGT}>${ACID}: "
    read -r -n1 -t4
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    clear
  fi
newf=$(ls -t -- *.mkv 2>/dev/null | head -n1)
  if [ -n "${newf}" ]; then
    mv -- "${newf}" "${VIDEO_OUT}" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Been Transferred To VIDEO_OUT Successfully"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 1.0
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BMGT}>${ACID}: "
    read -r -n1 -t4
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf "Your MKV File Has Failed To Transfer\n"
    printf "\n"
    printf "┌──Press─Any─Button─To─Move─On──┐\n"
    printf "└──>"
    read -r -n1 -t10
    clear
  fi
;;
  3)
echo '
   ─███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
   ─██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗
   ─█████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝
   ─██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗
   ─██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║
   ─╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝
   ──────────╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─────────────
   ──────────██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─────────────
   ──────────██║─────██║─────██║█████╗──██╔██╗─██║───██║────────────────
   ──────────██║─────██║─────██║██╔══╝──██║╚██╗██║───██║────────────────
   ──────────╚██████╗███████╗██║███████╗██║─╚████║───██║────────────────
   ───────────╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝────────────────
   ------------------------[Nah-Fam_Studios]---------------------------- ' | lolcat
printf "\n\n"
printf "   ${VBLU}┌───────────────────────────────────────────────────────────────┐${RESET}\n"
printf "   ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽───────────────────┤${RESET}\n"
printf "   ${VBLU}├───────────────────────────────────────────────────────────────┘${RESET}\n"
printf "   ${VBLU}│  ${NONG}───${BWHT}>  📺   ${ACID}Chl${NONG}:  ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n" "$CHANNEL"
printf "   ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Sbs${NONG}:  ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n" "$SUBS"
printf "   ${VBLU}│  ${NONG}───${BWHT}>  👍   ${ACID}Lks${NONG}:  ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n" "$LIKES"
printf "   ${VBLU}│  ${NONG}───${BWHT}>  📆   ${ACID}Upd${NONG}:  ${BMGT}[${BCYN}%s${BMGT}]${RESET}\n" "$UPLOAD_DATE_FMT"
printf "   ${VBLU}└───────────────────────────────────────────────────────────────┘${RESET}\n"
printf "                   ${VBLU}┌───────────────────────────┐${RESET}\n"
printf "    ${BCYN}<${VBLU}──────────────┤ ${BMGT}[${BCYN}Running${BMGT}]${BCYN}: Best ${VBLU}Audio ${BCYN}FMT ${VBLU}├─────────────────${BCYN}>${RESET}\n"
printf "                   ${VBLU}└───────────────────────────┘${RESET}\n"
printf "\n"
sleep 1.0
"${OPT_BMP3_CMD[@]}"
rc=$?
  if [ "$rc" -eq 0 ]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MP3 File Has Downloaded Successfully!"
    sleep 1.0
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf "Your Audio File Extract Has Failed, Please Try Again\n\n"
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BCYN}>${BMGT}:${ACID} "
    read -r -n1 -t4
    clear
  fi
new_mp3=$(ls -t -- *.mp3 2>/dev/null | head -n1)
  if [ -n "${new_mp3}" ]; then
    mv -- "${new_mp3}" "${AUDIO_OUT}" >/dev/null 2>&1
    cowsay -r "Your MP3 File Has Been Transferred To APIT Successfully!"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 1.0
    printf "\n"
    printf "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}\n"
    printf "${VBLU}└──${BCYN}>${BMGT}:${ACID} "
    read -r -n1 -t4
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf "Your MP3 File Has Failed To Transfer\n\n"
    printf "┌──Press─Any─Button─To─Move─On──┐\n"
    printf "└──>"
    read -r -n1 -t10
  fi
;;
  *)
    rc=2
    printf "┌──Press─Any─Button─To─Move─On──┐\n"
    printf "└──>"
    read -r -t60
esac
