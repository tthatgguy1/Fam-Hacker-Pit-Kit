#!/data/data/com.termux/files/usr/bin/bash

# <── Pipe Fail ──> #
  set -euo pipefail

# <── Configure ──> #
  OUT_BASE="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit"
  LOG_DIR="$HOME/storage/shared/Fam-Hacker-Pit-Kit/.cache/YouTube_Playlists"

# <── String Display for 1440p Cap ──> #
  mkdir -p "$OUT_BASE" "$LOG_DIR"

# <── Set Colors ──> #
  ESC=$'\e'
  NGRN="${ESC}[38;2;51;255;0m"       # ${NGRN}        $NGRN      - Lime Green
  BMGT="${ESC}[38;2;255;16;240m"     # ${BMGT}        $BMGT      - Bright Magenta
  NONG="${ESC}[38;2;255;95;0m"       # ${NONG}        $NONG      - Neon Orange
  BCYN="${ESC}[38;2;0;255;255m"      # ${BCYN}        $BCYN      - Cyan
  ACID="${ESC}[38;2;204;255;0m"      # ${ACID}        $ACID      - Acid Green
  VBLU="${ESC}[38;2;138;43;226m"     # ${VBLU}        $VBLU      - Violet Blue
  MMDB="${ESC}[38;2;25;25;112m"      # ${MMDB}        $MMDB      - Midnight Blue
  NPPL="${ESC}[38;2;188;19;254m"     # ${NPPL}        $NPPL      - Neon Purple
  BWHT="${ESC}[38;2;255;255;255m"    # ${BWHT}        #BWHT      - Bright White
  RESET="${ESC}[0m"                  # ${RESET}       $RESET     - Color Reset
  clear

# <── Intro Sounds (Skull Kid Laugh) ──> #
  mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/SKL.mp3" >/dev/null 2>&1 || true

# <── Nah-Fam_Studios ──> #
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

# <── Manual URL Entry ──> #
  printf "${VBLU}┌──${BCYN}Enter${VBLU}─${BCYN}Any${VBLU}─${BCYN}YouTube${VBLU}─${BMGT}URL${VBLU}─${BCYN}Here${VBLU}──┐${RESET}\n"
  printf "${VBLU}└──${BCYN}>${BMGT}:${ACID} "
  read -r URL

  if [[ -z "$URL" ]]; then
  echo "No URL Has Been Entered, Now Exiting."
  exit 2
  fi
  clear

# <── Intro Sounds (MDATA) ──> #
  mpv "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/sfx/MDATA.mp3" >/dev/null 2>&1 || true

# <── Channel Strings (Robust) ──> #
  DELIM=$'\x1f'
  FMT=$'%(title)s\x1f'
  FMT+=$'%(playlist_title)s\x1f'
  FMT+=$'%(uploader)s\x1f'
  FMT+=$'%(channel_follower_count)s\x1f'
  FMT+=$'%(like_count)s\x1f'
  FMT+=$'%(upload_date)s\x1f'
  FMT+=$'%(width)s\x1f'
  FMT+=$'%(height)s'

  if ! IFS=$DELIM read -r \
    TITLE \
    PTITLE \
    CHANNEL \
    SUBS \
    LIKES \
    UPLOAD_DATE \
    QLTYW \
    QLTYH \
    < <(
    yt-dlp \
    -q \
    --cookies "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/Cookies/cookies.txt" \
    --no-warnings \
    --print "$FMT" "$URL"

  ); then
    echo "Failed to fetch metadata from yt-dlp for: $URL"
    exit 1
  fi

# <── Time & Date Formate ──> #
  if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
    UPLOAD_DATE_FMT="${BCYN}${UPLOAD_DATE:4:2}"
    UPLOAD_DATE_FMT+="${BMGT}-"
    UPLOAD_DATE_FMT+="${BCYN}${UPLOAD_DATE:6:2}"
    UPLOAD_DATE_FMT+="${BMGT}-"
    UPLOAD_DATE_FMT+="${BCYN}${UPLOAD_DATE:0:4}"
    UPLOAD_DATE_FMT+="${RESET}"
  else
    UPLOAD_DATE_FMT="${UPLOAD_DATE}${RESET}"
  fi

# <── Nah-Fam_Studios 2 ──> #
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

# <── String Display ──> #
  printf "\n\n"
  printf "    ${VBLU}┌───────────────────────────────────────────────────────────────┐${RESET}\n"
  printf "    ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽───────────────────┤${RESET}\n"
  printf "    ${VBLU}├───────────────────────────────────────────────────────────────┘${RESET}\n"
  printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Ttl${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$TITLE"
  printf "    ${VBLU}│  ${NONG}───${BWHT}>  📺   ${ACID}Chl${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$CHANNEL"
  printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Sbs${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$SUBS"
  printf "    ${VBLU}│  ${NONG}───${BWHT}>  👍   ${ACID}Lks${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$LIKES"
  printf "    ${VBLU}│  ${NONG}───${BWHT}>  📆   ${ACID}Upd${BMGT}:    [%s${BMGT}]${RESET}\n"     "$UPLOAD_DATE_FMT"
  printf "    ${VBLU}└───────────────────────────────────────────────────────────────┘${RESET}\n\n"

# <── Output Template ──> #
  OUT_TPL='%(uploader)s - %(title)s.%(ext)s'
  LOG_FILE="$LOG_DIR/nfs_$(date +%Y%m%d-%H%M%S).log"
  echo "${ACID}"

# <── Progress Template Setup ──> #
  PROGRESS_TEMPLATE=$'\033[2K'"${BCYN}            ┌               ${BMGT}DL${BCYN}:        %(progress._percent_str)s"$'\n'
  PROGRESS_TEMPLATE+=$'\033[2K'"${BCYN}            ├───────────────────────────────────────────────┤"$'\n'
  PROGRESS_TEMPLATE+=$'\033[2K'"${BCYN}            |              ${BMGT}ETA${BCYN}:         %(progress._eta_str)s"$'\n'
  PROGRESS_TEMPLATE+=$'\033[2K'"${BCYN}            ├───────────────────────────────────────────────┤"$'\n'
  PROGRESS_TEMPLATE+=$'\033[2K'"${BCYN}            └            ${BMGT}Speed${BCYN}:       %(progress._speed_str)s"$'\033[4A\r'

# <── yt-dlp ──> #
  yt-dlp \
    -f "bestvideo+bestaudio/best" \
    --merge-output-format mkv \
    --embed-thumbnail \
    --embed-chapters \
    --embed-subs \
    --quiet \
    --ignore-errors \
    --cookies "$HOME/storage/shared/Fam-Hacker-Pit-Kit/.NFS-Data/Cookies/cookies.txt" \
    --no-warnings \
    --continue \
    --no-overwrites \
    --progress \
    --progress-template "$PROGRESS_TEMPLATE" \
    -o "$OUT_BASE/%(uploader)s/%(uploader)s - %(title)s[%(height)sp].mkv" \
    "$URL" 2>>"$LOG_FILE"
  printf "\n\n"

  echo "The Script Had Finished.. Log: $LOG_FILE"
  read -r -n1 -t5
