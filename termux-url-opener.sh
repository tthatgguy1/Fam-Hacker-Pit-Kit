#!/data/data/com.termux/files/usr/bin/bash
clear
set -euo pipefail

# <── Terminal Width Fallback Check ──> #
TERM_WIDTH=$(tput cols 2>/dev/null || echo 0)
MIN_WIDTH=72

# <── Reusable: ANSI-Aware Centered Print ─> #
deluxe_ansi_print() {
  printf '%b\n' "$1" | awk '
    BEGIN {
      ESC_SEQ = "\033\\[[0-9;]*m"
    }
    {
      raw = $0
      gsub(ESC_SEQ, "", raw)  # Remove ANSI sequences for length calc
      cmd = "tput cols"
      cmd | getline width
      close(cmd)
      padding = int((width - length(raw)) / 2)
      if (padding > 0) {
        printf "%*s%s\n", padding, "", $0
      } else {
        print $0
      }
    }
  '
}

# <── Reusable: Centered Printf Lolcat──> #
deluxe_pretty_print() {
  printf '%b\n' "$1" | awk '{
    cmd = "tput cols";
    cmd | getline width;
    close(cmd);
    padding = int((width - length($0)) / 2);
    if (padding > 0) {
      printf "%" padding "s%s\n", "", $0;
    } else {
      print $0;
    }
  }' | lolcat --seed=489
}

# <── Reusable: Centered Cowsay ──> #
deluxe_cowsay() {
  cowsay -r "$1" | awk '{
    cmd = "tput cols";
    cmd | getline width;
    close(cmd);
    padding = int((width - length($0)) / 2);
    if (padding > 0) {
      printf "%" padding "s%s\n", "", $0;
    } else {
      print $0;
    }
  }' | lolcat --seed=589
}

if (( TERM_WIDTH < MIN_WIDTH )); then
  printf '\n\n'
  deluxe_pretty_print "[ERROR] Terminal width (${TERM_WIDTH}) is too small\nPlease expand your terminal to at least ${MIN_WIDTH} columns.\nCurrent terminal width: ${TERM_WIDTH}"
  exit 1
fi

# <── Function ──> #
show_nf_banner() {
  {
    printf '%b\n'   " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    printf '%b\n'   " ░███████╗╔█████░░███╗░░░███╗░██╗░░██╗╔█████╗░╔██████╗██╗░░██╗██████╗░░"
    printf '%b\n'   " ░██╔════╝██╔══██╗████╗░████║░██║░░██║██╔══██╗██╔════╝██║░██╔╝██╔══██╗░"
    printf '%b\n'   " ░█████╗░░███████║██╔████╔██║░███████║███████║██║░░░░░█████╔╝░██████╔╝░"
    printf '%b\n'   " ░██╔══╝░░██╔══██║██║╚██╔╝██║░██╔══██║██╔══██║██║░░░░░██╔═██╗░██╔══██╗░"
    printf '%b\n'   " ░██║░░░░░██║░░██║██║░╚═╝░██║░██║░░██║██║░░██║╚██████╗██║░░██╗██║░░██║░"
    printf '%b\n'   " ░╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝╚═╝░░╚═╝╚═╝░░╚═╝░"
    printf '%b\n'   " ░░░░░░░░░░╔██████╗██╗░░░░░██╗███████╗███╗░░░██╗████████╗░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░██╔════╝██║░░░░░██║██╔════╝████╗░░██║╚══██╔══╝░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░██║░░░░░██║░░░░░██║█████╗░░██╔██╗░██║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░██║░░░░░██║░░░░░██║██╔══╝░░██║╚██╗██║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░╚██████╗███████╗██║███████╗██║░╚████║░░░██║░░░░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░░╚═════╝╚══════╝╚═╝╚══════╝╚═╝░░╚═══╝░░░╚═╝░░░░░░░░░░░░░░░░░"
    printf '%b\n'   " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    printf '%b\n\n' " └────────────────────────[Nah─Fam─Studios]───────────────────────────┘"
  } | lolcat --seed=634551
}

# <── Path Setup ──> #
VIDEO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit"
AUDIO_OUT="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit"
WORKDIR="$HOME/downloads"
LOG_DIR="$HOME/storage/shared/Fam-Hacker-Pit-Kit/.cache/YouTube_Single-Downloads"

# <── File Template Setup ──> #
OUT_TEMPLATE_BEST='%(uploader)s - %(title)s [%(height)sp] {Highest_Quality}.mkv'
OUT_TEMPLATE_2K='%(uploader)s - %(title)s [%(height)sp] [2K].mkv'
OUT_TEMPLATE_MP3='%(uploader)s - %(title)s.mp3'

# <── Safe CD ──> #
cd "$WORKDIR" || { echo "Cannot cd to $WORKDIR"; exit 1; }

# <── Color Setup ─> #
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

# <── Nah-Fam_Studios ──> #
show_nf_banner

# <── Generate Top Bar With Alternating ${BMGT} & ${ACID} ──> #
TOP_BAR=""
for ((i=0; i<68; i++)); do
  if (( i % 2 == 0 )); then
    TOP_BAR+="${VBLU}─"
  else
    TOP_BAR+="${ACID}─"
  fi
done

# Manual URL Input ──> #
printf '%b\n' " ${ACID}┌${TOP_BAR}${VBLU}┐${RESET}"
printf '%b\n' " ${VBLU}│                ${VBLU}Enter Any ${ACID}YouTube URL ${VBLU}To Continue                   ${ACID}│${RESET}"
printf '%b'   " ${ACID}└${VBLU}─${ACID}─${VBLU}─${ACID}─${VBLU}─${ACID}─${VBLU}>${BMGT}:${ACID} "
IFS= read -r URL || { echo "Failed to read URL"; exit 1; }
URL="${URL#"${URL%%[![:space:]]*}"}"   # Trim leading
URL="${URL%"${URL##*[![:space:]]}"}"   # Trim trailing

# <── Exit If No URL Is Detected ──> #
if [[ -z "$URL" ]]; then
  echo "${NONG} URL was empty. Exiting.${RESET}"
  exit 1
fi
clear

# <── Nah-Fam_Studios ──> #
# <── Cowsay Intro With Terminal Centering ──> #
show_nf_banner
deluxe_cowsay "Welcome To Fam-Hacker Tube Client. You Can Download All Sorts Of Stuff Here. Right my script is gathering metadata needed for a download. Please Hold Tight, This Should Only Take Around 60-90 Seconds"

# <── Intro Sounds ──> #
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.Nfs-Data/sfx/SKL.mp3" >/dev/null 2>&1 || true
mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.Nfs-Data/sfx/MDATA.mp3" >/dev/null 2>&1 || true

# <── Channel Strings (Robust) ──> #
DELIM=$'\x1f'
FMT=$'%(title)s\x1f%(uploader)s\x1f%(channel_follower_count)s\x1f%(like_count)s\x1f%(upload_date)s\x1f%(width)s\x1f%(height)s'
IFS=$DELIM read -r TITLE CHANNEL SUBS LIKES UPLOAD_DATE QLTYW QLTYH < <(
  yt-dlp -q --no-warnings --print "$FMT" "$URL"
)

# <── Format Upload Date ──> #
if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
  UPLOAD_DATE_FMT="${BCYN}${UPLOAD_DATE:4:2}${BMGT}-${BCYN}${UPLOAD_DATE:6:2}${BMGT}-${BCYN}${UPLOAD_DATE:0:4}${RESET}"
else
  UPLOAD_DATE_FMT="${UPLOAD_DATE}${RESET}"
fi

# <── Reusable: Metadata Panel ──> #
show_metadata() {
  printf '%b\n'   " ${VBLU}┌────────────────────────────────────────────────────────────────────┐${RESET}"
  printf '%b\n'   " ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽────────────────────────┤${RESET}"
  printf '%b\n'   " ${VBLU}├────────────────────────────────────────────────────────────────────┘${RESET}"
  printf '%b\n'   " ${VBLU}│     ${BCYN}─────${BMGT}>      📺       ${BCYN}[${BMGT}Chl${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$CHANNEL${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│     ${BCYN}─────${BMGT}>      🙋       ${BCYN}[${BMGT}Sbs${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$SUBS${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│     ${BCYN}─────${BMGT}>      👍       ${BCYN}[${BMGT}Lks${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$LIKES${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│     ${BCYN}─────${BMGT}>      📹       ${BCYN}[${BMGT}Res${BCYN}]${NGRN}:       ${BMGT}[${BCYN}${QLTYW}${BMGT}x${BCYN}${QLTYH}${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│     ${BCYN}─────${BMGT}>      📆       ${BCYN}[${BMGT}Upd${BCYN}]${NGRN}:       ${BMGT}[${BCYN}$UPLOAD_DATE_FMT${BMGT}]${RESET}"
  printf '%b\n\n' " ${VBLU}└────────────────────────────────────────────────────────────────────┘${RESET}"
}

# <── Reusable: Metadata Panel Music ──> #
show_alt_metadata() {
  printf '%b\n'   " ${VBLU}┌───────────────────────────────────────────────────────────────────┐${RESET}"
  printf '%b\n'   " ${VBLU}├────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽────────────────────────┤${RESET}"
  printf '%b\n'   " ${VBLU}├───────────────────────────────────────────────────────────────────┘${RESET}"
  printf '%b\n'   " ${VBLU}│   ${BCYN}───${BMGT}>  📺   ${VBLU}Chl${BMGT}:    [${BCYN}$CHANNEL${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│   ${BCYN}───${BMGT}>  🙋   ${VBLU}Sbs${BMGT}:    [${BCYN}$SUBS${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│   ${BCYN}───${BMGT}>  👍   ${VBLU}Lks${BMGT}:    [${BCYN}$LIKES${BMGT}]${RESET}"
  printf '%b\n'   " ${VBLU}│   ${BCYN}───${BMGT}>  📆   ${VBLU}Upd${BMGT}:    [${BCYN}$UPLOAD_DATE_FMT${BMGT}]${RESET}"
  printf '%b\n\n' " ${VBLU}└───────────────────────────────────────────────────────────────────┘${RESET}"
}

# <── Download: Best Quality MKV ──> #
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
    --progress-template "download:  ${VBLU}└──${ACID}> ${ACID}[${BMGT}DL${ACID}]${BCYN}: %(progress._percent_str)s ${NGRN}── ${ACID}[${BMGT}ETA${ACID}]${BCYN}: %(progress._eta_str)s ${NGRN}── ${ACID}[${BMGT}Speed${ACID}]${BCYN}:%(progress._speed_str)s ${ACID}<${VBLU}──┘${RESET}"
  "$URL"
)

# <── Download: 2K-Capped MKV ──> #
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
    --progress-template "download:    └──>  [DL]: %(progress._percent_str)s ─ ETA: %(progress._eta_str)s ─ Speed:%(progress._speed_str)s   <──┘"
  "$URL"
)

# <── Download: MP3 Audio ──> #
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
    --progress-template "download:    └──>  DL: %(progress._percent_str)s ── ETA: %(progress._eta_str)s ── Speed:%(progress._speed_str)s   <──┘"
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
deluxe_pretty_print "$TITLE"

# <── Aligned Menu Box ──> #

printf '%b\n' "     ${VBLU}┌───────────────────────────────────────────────────────────┐${RESET}"
printf '%b\n' "     ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n' "     ${VBLU}│ ${BMGT}[${BCYN}1${BMGT}] ${OPTION_BMKV}            ${VBLU}│${RESET}"
printf '%b\n' "     ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n' "     ${VBLU}│ ${BMGT}[${BCYN}2${BMGT}] ${OPTION_2K_CAP}          ${VBLU}│${RESET}"
printf '%b\n' "     ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n' "     ${VBLU}│ ${BMGT}[${BCYN}3${BMGT}] ${OPTION_B3}              ${VBLU}│${RESET}"
printf '%b\n' "     ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n' "     ${VBLU}│ ${BWHT}[${NONG}E${BWHT}] ${BCYN}Press ${BWHT}[${NONG}Enter${BWHT}] ${BCYN}For Default Option ${BMGT}[${ACID}${DEFAULT}${BMGT}]               ${VBLU}│${RESET}"
printf '%b\n' "     ${VBLU}├───────────────────────────────────────────────────────────┤${RESET}"
printf '%b\n' "     ${VBLU}│           ${ACID}This Was Incredibly Frustrating To Write        ${VBLU}│${RESET}"
printf '%b'   "     ${VBLU}└────────${BMGT}>${ACID}: "
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
  deluxe_ansi_print "${VBLU}Downloading ${ACID}$TITLE ${VBLU}Right Now${RESET}"
  show_metadata

  printf '%b\n' "        ${VBLU}┌────────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "  ${VBLU}┌─────┤ ${BMGT}[${ACID}Running${BMGT}]${NGRN}:  ${BMGT}──${ACID}> ${BCYN}Highest Quality ${ACID}Video ${BCYN}Download ├─────┐${RESET}"
  printf '%b\n' "  ${VBLU}│     └────────────────────────────────────────────────┘     │${RESET}"
  sleep 1.0

  "${OPT_BMKV_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    clear
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '\n\n'
    deluxe_cowsay "Your MKV File Has Downloaded Successfully"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    sleep 1.0
  else
    clear
    printf '\n\n'
    deluxe_ansi_print "${VBLU}Your ${ACID}MKV File ${VBLU}Has Failed To ${ACID}Download${RESET}"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "          ${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─Button─To─Move─On──┐${RESET}"
    printf '%b'   "          ${VBLU}└──${ACID}→${BMGT}:${ACID} "
    read -r
  fi

  if [[ -f "$NF_PRODUCT" ]]; then
    clear
    mv -- "$NF_PRODUCT" "$VIDEO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 1.0
    printf '\n\n'
    deluxe_cowsay "Your MKV File Has Been Transferred To ${VIDEO_OUT} Successfully"
    printf '%b\n' "          ${VBLU}┌───${BCYN}Press${VBLU}──${BCYN}Any${VBLU}──${BCYN}Button${VBLU}──${BCYN}To${VBLU}──${BCYN}Move${VBLU}──${BCYN}On${VBLU}───┐${RESET}"
    printf '%b'   "          ${VBLU}└───${BMGT}>${ACID}: "
    read -r
  else
    clear
    printf '\n\n'
    deluxe_ansi_print "${NONG}Transfer Failed: ${NF_PRODUCT} not found${RESET}"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>: "
    read -r
    sleep 1.0
  fi
  ;;

2)
  clear
  # <── Log File Setup ──> #
  LOG_FILE="$LOG_DIR/2K_Quality_Via_Bash_$(date +%m-%d-%Y_%H%M).log"

  # <── Output 2K File Detection ──> #
  NF_PLACEMENT_2K=$(yt-dlp --print "$OUT_TEMPLATE_2K" "$URL" | head -n1)
  NF_PRODUCT_2K="$WORKDIR/$NF_PLACEMENT_2K"

  # <── Nah-Fam_Studios Duo Banner ──> #
  show_nf_banner
  deluxe_pretty_print "$TITLE"
  show_metadata

  printf '%b\n' "         ${VBLU}┌───────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "    ${VBLU}┌────┤ ${NONG}[${BWHT}Running${NONG}]${NGRN}: ${BCYN}──${BMGT}> ${ACID}UHD 2560x1440 Quality Download ${VBLU}├────┐${RESET}"
  printf '%b\n' "    ${VBLU}│    └───────────────────────────────────────────────┘    │${RESET}"
  sleep 1.0

  "${OPT_2K_CAP_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    clear
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '\n\n'
    deluxe_cowsay "Your MKV File Has Downloaded Successfully"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
    sleep 1.0
  else
    clear
    printf '\n\n'
    deluxe_ansi_print "${VBLU}2K File Has ${ACID}${ACID}Failed ${VBLU}To Download${RESET}"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b\n' "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  fi

  if [[ -f "$NF_PRODUCT_2K" ]]; then
    clear
    mv -- "$NF_PRODUCT_2K" "$VIDEO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    sleep 1.0
    printf '\n\n'
    deluxe_cowsay "Your MKV [2K] File Has Been Transferred To VIDEO OUT FOLDER Successfully"
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b\n' "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  else
    clear
    printf '\n\n'
    deluxe_cowsay "${NONG}Transfer Failed: File not found${RESET}"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b\n' "└──>"
    read -r
    sleep 2.0
  fi
  ;;

3)
  clear
  # <── Log File Setup ──> #
  LOG_FILE="$LOG_DIR/MP3_Via_Bash_$(date +%m-%d-%Y_%H%M).log"

  # <── Output File Detection ──> #
  NF_PLACEMENT_MP3=$(yt-dlp --print "$OUT_TEMPLATE_MP3" "$URL" | head -n1)
  NF_PRODUCT_MP3="$WORKDIR/$NF_PLACEMENT_MP3"

  # <── Nah-Fam_Studios Duo Banner With Alt MetaData──> #
  show_nf_banner
  deluxe_pretty_print "$TITLE"
  show_alt_metadata

  printf '%b\n' "         ${VBLU}┌───────────────────────────────────────────────┐${RESET}"
  printf '%b\n' "    ${VBLU}┌────┤ ${NONG}[${BWHT}Running${NONG}]${NGRN}:  ${BCYN}──${BMGT}>  ${ACID}Highest Quality MP3 Download ${VBLU}├────┐${RESET}"
  printf '%b\n' "    ${VBLU}│    └───────────────────────────────────────────────┘    │${RESET}"
  sleep 1.0

  "${OPT_BMP3_CMD[@]}" 2>>"$LOG_FILE"
  rc=$?

  if [[ "$rc" -eq 0 ]]; then
    clear
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/c.mp3" >/dev/null 2>&1
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '\n\n'
    deluxe_cowsay "Your MP3 File Has Downloaded Successfully!"
    sleep 1.0
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/TXS.mp3" >/dev/null 2>&1
  else
    clear
    printf '\n\n'
    deluxe_cowsay "Your Audio File Extract Has Failed, Please Try Again"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MFGTA.mp3" >/dev/null 2>&1
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  fi

  if [[ -f "$NF_PRODUCT_MP3" ]]; then
    clear
    mv -- "$NF_PRODUCT_MP3" "$AUDIO_OUT"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '\n\n'
    deluxe_cowsay "Your Audio File Has Been Transferred To ${AUDIO_OUT} Successfully"
    printf '%b\n' "${VBLU}┌──${BCYN}Press${VBLU}─${BCYN}Any${VBLU}─${BCYN}Button${VBLU}─${BCYN}To${VBLU}─${BCYN}Move${VBLU}─${BCYN}On${VBLU}──┐${RESET}"
    printf '%b'   "${VBLU}└──${BMGT}>${ACID}: ${RESET}"
    read -r
  else
    clear
    printf '\n\n'
    deluxe_cowsay "${NONG}Transfer Failed: ${NF_PRODUCT_MP3} not found${RESET}"
    mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/FHS.mp3" >/dev/null 2>&1
    printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
    printf '%b'   "└──>"
    read -r
    sleep 2.0
  fi
  ;;

*)
  clear
  rc=2
  printf '\n\n'
  printf '%b\n' "┌──Press─Any─Button─To─Move─On──┐"
  printf '%b'   "└──>"
  read -r
  ;;
esac
