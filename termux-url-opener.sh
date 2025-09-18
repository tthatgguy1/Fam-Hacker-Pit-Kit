#!/data/data/com.termux/files/usr/bin/bash
clear
set -euo pipefail

# <── Function ──> #
show_nf_banner() {
  {
    printf '%b\n' " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ░███████╗╔█████░░███╗░░░███╗░██╗░░██╗╔█████╗░╔██████╗██╗░░██╗██████╗░░"
    printf '%b\n' " ░██╔════╝██╔══██╗████╗░████║░██║░░██║██╔══██╗██╔════╝██║░██╔╝██╔══██╗░"
    printf '%b\n' " ░█████╗░░███████║██╔████╔██║░███████║███████║██║░░░░░█████╔╝░██████╔╝░"
    printf '%b\n' " ░██╔══╝░░██╔══██║██║╚██╔╝██║░██╔══██║██╔══██║██║░░░░░██╔═██╗░██╔══██╗░"
    printf '%b\n' " ░██║░░░░░██║░░██║██║░╚═╝░██║░██║░░██║██║░░██║╚██████╗██║░░██╗██║░░██║░"
    printf '%b\n' " ░╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝╚═╝░░╚═╝╚═╝░░╚═╝░"
    printf '%b\n' " ░░░░░░░░░░╔██████╗██╗░░░░░██╗███████╗███╗░░░██╗████████╗░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░██╔════╝██║░░░░░██║██╔════╝████╗░░██║╚══██╔══╝░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░██║░░░░░██║░░░░░██║█████╗░░██╔██╗░██║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░██║░░░░░██║░░░░░██║██╔══╝░░██║╚██╗██║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░╚██████╗███████╗██║███████╗██║░╚████║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░░╚═════╝╚══════╝╚═╝╚══════╝╚═╝░░╚═══╝░░░╚═╝░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    printf '%b\n' " ─────────────────────────[Nah-Fam_Studios]────────────────────────────"
  } | lolcat --seed 82
}

# <── Paths ──> #
VIDEO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit"
AUDIO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit"
WORKDIR="$HOME/downloads"
LOG_DIR="$HOME/storage/shared/Fam-Hacker-Pit-Kit/.cache/YouTube_Single-Downloads"

# <── Directory Setup ──> #
mkdir -p "$VIDEO_OUT" "$AUDIO_OUT" "$LOG_DIR"

# <── Templates ──> #
OUT_TEMPLATE_BEST='%(uploader)s - %(title)s [%(height)sp] {Highest_Quality}.mkv'
OUT_TEMPLATE_2K='%(uploader)s - %(title)s [%(height)sp] [2K].mkv'
OUT_TEMPLATE_MP3='%(uploader)s - %(title)s.mp3'

# <── Safe CD ──> #
cd "$WORKDIR" || { echo "Cannot cd to $WORKDIR"; exit 1; }

# <── Colors ──> #
ESC=$'\e'
NGRN="${ESC}[38;2;51;255;0m"
BMGT="${ESC}[38;2;255;16;240m"
NONG="${ESC}[38;2;255;95;0m"
BCYN="${ESC}[38;2;0;255;255m"
ACID="${ESC}[38;2;204;255;0m"
VBLU="${ESC}[38;2;138;43;226m"
BWHT="${ESC}[38;2;255;255;255m"
NPPL="${ESC}[38;2;188;19;254m"
RESET="${ESC}[0m"

# <── Banner ──> #
show_nf_banner
printf '\n\n'

# <── Manual URL Entry ──> #
printf '%b\n' "${VBLU}┌──${BCYN}Enter${VBLU}─${BCYN}Any${VBLU}─${BCYN}YouTube${VBLU}─${BMGT}URL${VBLU}─${BCYN}Here${VBLU}──┐${RESET}"
printf '%b'   "${VBLU}└──${BCYN}>${BMGT}:${ACID} "
IFS= read -r URL
URL="${URL#"${URL%%[![:space:]]*}"}"   # Trim leading whitespace
URL="${URL%"${URL##*[![:space:]]}"}"   # Trim trailing whitespace

if [[ -z "$URL" ]]; then
  printf '%b\n' "${BWHT}No ${NONG}URL ${BWHT}entered. Exiting.${RESET}"
  exit 2
fi
clear

# <── Banner Again ──> #
show_nf_banner
printf '\n\n'

# <── Intro Sounds ──> #
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.Nfs-Data/sfx/SKL.mp3" >/dev/null 2>&1 || true
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.Nfs-Data/sfx/MDATA.mp3" >/dev/null 2>&1 || true
printf '\n\n'

# <── Channel Strings (Robust) ──> #
DELIM=$'\x1f'
FMT=$'%(playlist_title)s\x1f%(title)s\x1f%(uploader)s\x1f%(channel_follower_count)s\x1f%(like_count)s\x1f%(upload_date)s\x1f%(width)s\x1f%(height)s'
IFS=$DELIM read -r PTITLE TITLE CHANNEL SUBS LIKES UPLOAD_DATE QLTYW QLTYH < <(
  yt-dlp -q --no-warnings --print "$FMT" "$URL"
)

if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
  UPLOAD_DATE_FMT="${BCYN}${UPLOAD_DATE:4:2}${BMGT}-${BCYN}${UPLOAD_DATE:6:2}${BMGT}-${BCYN}${UPLOAD_DATE:0:4}${RESET}"
else
  UPLOAD_DATE_FMT="${UPLOAD_DATE}${RESET}"
fi

sleep 2.0

# <── Reusable: Metadata Panel ──> #
show_metadata() {
  printf '\n'
  printf '%b\n' " ${VBLU}┌────────────────────────────────────────────────────────────────────┐${RESET}"
  printf '%b\n' " ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽────────────────────────┤${RESET}"
  printf '%b\n' " ${VBLU}├────────────────────────────────────────────────────────────────────┘${RESET}"
  printf '%b\n' " ${VBLU}│    ${BCYN}─────${BMGT}>      📺         ${BCYN}[${BMGT}Chl${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$CHANNEL${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│    ${BCYN}─────${BMGT}>      🙋         ${BCYN}[${BMGT}Sbs${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$SUBS${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│    ${BCYN}─────${BMGT}>      👍         ${BCYN}[${BMGT}Lks${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$LIKES${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│    ${BCYN}─────${BMGT}>      📹         ${BCYN}[${BMGT}Res]${NGRN}:       ${BMGT}[${BCYN}$QLTYW${BMGT}x${BCYN}$QLTYH${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│    ${BCYN}─────${BMGT}>      📆         ${BCYN}[${BMGT}Upd${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$UPLOAD_DATE_FMT${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}└────────────────────────────────────────────────────────────────────┘${RESET}"
}

# <── Reusable: Metadata Panel Music ──> #s
show_alt_metadata() {
  printf '\n'
  printf '%b\n' " ${VBLU}┌───────────────────────────────────────────────────────────────────┐${RESET}"
  printf '%b\n' " ${VBLU}├────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽────────────────────────┤${RESET}"
  printf '%b\n' " ${VBLU}├───────────────────────────────────────────────────────────────────┘${RESET}"
  printf '%b\n' " ${VBLU}│   ${BCYN}───${BMGT}>  📺   ${VBLU}Chl${BMGT}:    [${BCYN}$CHANNEL${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│   ${BCYN}───${BMGT}>  🙋   ${VBLU}Sbs${BMGT}:    [${BCYN}$SUBS${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│   ${BCYN}───${BMGT}>  👍   ${VBLU}Lks${BMGT}:    [${BCYN}$LIKES${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}│   ${BCYN}───${BMGT}>  📆   ${VBLU}Upd${BMGT}:    [${BCYN}$UPLOAD_DATE_FMT${BMGT}]${RESET}"
  printf '%b\n' " ${VBLU}└───────────────────────────────────────────────────────────────────┘${RESET}"
}

OPT_BMKV_CMD=(
  yt-dlp
  -f "bestvideo*+bestaudio/best"
  -o "$OUT_TEMPLATE_BEST"
    --progress --quiet
    --no-playlist
    --console-title
    --no-check-formats --no-warnings --ignore-errors
    --write-subs --embed-subs --sub-format srt --convert-subs srt
    --embed-thumbnail --embed-chapters
    --merge-output-format mkv
    --no-overwrites
    --progress-template "download:    ${VBLU}└──${ACID}>  ${BCYN}DL${BMGT}: %(progress._percent_str)s ${NGRN}── ${BCYN}ETA${BMGT}: %(progress._eta_str)s ${NGRN}── ${BCYN}Speed${BMGT}:%(progress._speed_str)s   ${ACID}<${VBLU}──┘${RESET}"
  "$URL"
)

OPT_2K_CAP_CMD=(
  yt-dlp
  -f "bestvideo[height<=1440]+bestaudio/best[height<=1440]"
  -o "$OUT_TEMPLATE_2K"
    --progress --quiet
    --no-playlist
    --console-title
    --no-check-formats --no-warnings --ignore-errors
    --write-subs --embed-subs --sub-format srt --convert-subs srt
    --embed-thumbnail --embed-chapters
    --merge-output-format mkv
    --no-overwrites
    --progress-template "download:    ${VBLU}└──${ACID}>  ${BCYN}DL${BMGT}: %(progress._percent_str)s ${NGRN}── ${BCYN}ETA${BMGT}: %(progress._eta_str)s ${NGRN}── ${BCYN}Speed${BMGT}:%(progress._speed_str)s   ${ACID}<${VBLU}──┘${RESET}"
  "$URL"
)

OPT_BMP3_CMD=(
  yt-dlp
  -x --audio-format mp3
  -f "bestaudio"
  -o "$OUT_TEMPLATE_MP3"
    --quiet --progress
    --no-playlist
    --console-title
    --no-check-formats --no-warnings --ignore-errors
    --no-overwrites
    --progress-template "download:    ${VBLU}└──${ACID}>  ${BCYN}DL${BMGT}: %(progress._percent_str)s ${NGRN}── ${BCYN}ETA${BMGT}: %(progress._eta_str)s ${NGRN}── ${BCYN}Speed${BMGT}:%(progress._speed_str)s   ${ACID}<${VBLU}──┘${RESET}"
  "$URL"
)

# <── Menu Options ──> #
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

clear
DEFAULT="1"

# <── Nah-Fam_Studios ──> #
show_nf_banner
printf '\n\n'

# <── Aligned Menu Box ──> #
printf '%b\n'     "   ${VBLU}┌───────────────────────────────────────────────────────────┐${RESET}"
printf '%b\n'     "   ${VBLU}│ ${BMGT}[${BCYN}1${BMGT}] ${OPTION_BMKV}                  ${VBLU}│${RESET}"
printf '%b\n'     "   ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n'     "   ${VBLU}│ ${BMGT}[${BCYN}2${BMGT}] ${OPTION_2K_CAP}                       ${VBLU}│${RESET}"
printf '%b\n'     "   ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n'     "   ${VBLU}│ ${BMGT}[${BCYN}3${BMGT}] ${OPTION_B3}                                  ${VBLU}│${RESET}"
printf '%b\n'     "   ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n'     "   ${VBLU}│ ${BWHT}[${NONG}E${BWHT}] ${BCYN}Press ${BWHT}[${NONG}Enter${BWHT}] ${BCYN}For Default Option [${DEFAULT}]                  ${VBLU}│${RESET}"
printf '%b\n\n'   "   ${VBLU}└───────────────────────────────────────────────────────────┘${RESET}"

printf '%b\n' "   ${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Choose${VBLU}──┐${RESET}"
printf '%b'   "   ${VBLU}└──${BMGT}>${ACID}:${RESET} "
read -r DECISION

DECISION=${DECISION:-$DEFAULT}
case "$DECISION" in

1)
  clear

  # <── Log File Setup ──> #
  LOG_FILE="$LOG_DIR/Highest_Quality_Via_Bash_$(date +%m-%d-%Y_%H%M).log"

  # <── Output File Detection ──> #
  NF_PLACEMENT=$(yt-dlp --print "$OUT_TEMPLATE_BEST" "$URL" | head -n1)
  NF_PRODUCT="$WORKDIR/$NF_PLACEMENT"

  # <── Nah-Fam_Studios Duo Banner ──> #
  show_nf_banner
  show_metadata
  printf '\n\n'

  printf '%b\n' "         ${VBLU}┌───────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "    ${VBLU}┌────┤ ${NONG}[${BWHT}Running${NONG}]${NGRN}: ${BCYN}──${BMGT}> ${ACID}Highest Quality Video Download ${VBLU}├────┐${RESET}"
  printf '%b\n' "    ${VBLU}│    └───────────────────────────────────────────────┘    │${RESET}"
  sleep 1.0

  "${OPT_BMKV_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Downloaded Successfully" | lolcat
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    sleep 2.0
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─Button─To─Move─On──┐${RESET}"
    printf '%b'   "└──→: ${RESET}"
    read -r
    clear
  fi

  if [[ -f "$NF_PRODUCT" ]]; then
    mv -- "$NF_PRODUCT" "$VIDEO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 2.0
    printf '\n\n'
    printf '%b\n\n' "Your MKV File Has Been Transferred To ${VIDEO_OUT} Successfully" | lolcat
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n\n\n' "${NONG}Transfer Failed: ${NF_PRODUCT} not found${RESET}"
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>"
    read -r
    sleep 2.0
  fi
  ;;

2)
  clear

  # <── Output 2K File Detection ──> #
  NF_PLACEMENT_2K=$(yt-dlp --print "$OUT_TEMPLATE_2K" "$URL" | head -n1)
  NF_PRODUCT_2K="$WORKDIR/$NF_PLACEMENT_2K"
  LOG_FILE="$LOG_DIR/2K_Quality_Via_Bash_$(date +%m-%d-%Y_%H%M).log"

  # <── Nah-Fam_Studios Duo Banner ──> #
  show_nf_banner
  show_metadata
  printf '\n'

  printf '%b\n' "         ${VBLU}┌───────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "    ${VBLU}┌────┤ ${NONG}[${BWHT}Running${NONG}]${NGRN}: ${BCYN}──${BMGT}> ${ACID}UHD 2560x1440 Quality Download ${VBLU}├────┐${RESET}"
  printf '%b\n' "    ${VBLU}│    └───────────────────────────────────────────────┘    │${RESET}"
  sleep 1.0

  "${OPT_2K_CAP_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MKV File Has Downloaded Successfully" | lolcat
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    sleep 2.0
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BCYN}>${BMGT}:${ACID} ${RESET}"
    read -r
    clear
  fi

  if [[ -f "$NF_PRODUCT_2K" ]]; then
    mv -- "$NF_PRODUCT_2K" "$VIDEO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '%b\n' "Your MKV [2K] File Has Been Transferred To ${VIDEO_OUT} Successfully" | lolcat
    sleep 1.0
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   '${VBLU}└──${BMGT}>${ACID}: ${RESET}'
    read -r
  else
    printf '%b\n\n\n\n' "${NONG}Transfer Failed: File not found${RESET}"
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>"
    read -r
    sleep 2.0
  fi
  ;;

3)
  clear
  # Output file detection
  NF_PLACEMENT_MP3=$(yt-dlp --print "$OUT_TEMPLATE_MP3" "$URL" | head -n1)
  NF_PRODUCT_MP3="$WORKDIR/$NF_PLACEMENT_MP3"
  LOG_FILE="$LOG_DIR/MP3_Via_Bash_$(date +%m-%d-%Y_%H%M).log"

  # <── Nah-Fam_Studios Duo Banner With Alt MetaData──> #
  show_nf_banner
  show_alt_metadata
  printf '\n\n'

  printf '%b\n' "         ${VBLU}┌───────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "    ${VBLU}┌────┤ ${NONG}[${BWHT}Running${NONG}]${NGRN}:  ${BCYN}──${BMGT}>  ${ACID}Highest Quality MP3 Download ${VBLU}├────┐${RESET}"
  printf '%b\n' "    ${VBLU}│    └───────────────────────────────────────────────┘    │${RESET}"
  sleep 1.0

  "${OPT_BMP3_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    cowsay -r "Your MP3 File Has Downloaded Successfully!" | lolcat
    sleep 1.0
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    clear
  else
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf "Your Audio File Extract Has Failed, Please Try Again\n\n"
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BCYN}>${BMGT}:${ACID} ${RESET}"
    read -r -n1
    clear
  fi

  if [[ -f "$FINAL_AUDIO" ]]; then
    mv -- "$FINAL_AUDIO" "$AUDIO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '%b\n' "Your Audio File Has Been Transferred To ${AUDIO_OUT} Successfully" | lolcat
    sleep 1.0
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  else
    printf '%b\n' "${NONG}Transfer Failed: ${FINAL_AUDIO} not found${RESET}"
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>"
    read -r
    sleep 2.0
  fi
    ;;

  *)
    rc=2
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>"
    read -r
    ;;
esac
