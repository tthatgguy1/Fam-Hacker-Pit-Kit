#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# ---- Config ---------------------------------------------------------
#OUT_BASE Was Created In The install.sh File.
OUT_BASE="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Video-Pit"
LOG_DIR="$HOME/storage/shared/Fam-Hacker-Pit-Kit/.cache/YouTube_Playlists"
mkdir -p "$OUT_BASE" "$LOG_DIR"

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
RESET="${ESC}[0m"                  # ${RESET}       $RESET
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
  echo "No URL Has Been Entered, Now Exiting."
  exit 2
fi
clear

# ---- Channel Info ----------------------------------------------------
echo
DELIM=$'\x1f'
FMT=$'%(title)s\x1f%(uploader)s\x1f%(channel_follower_count)s\x1f%(like_count)s\x1f%(upload_date)s'
IFS=$DELIM read -r TITLE CHANNEL SUBS LIKES UPLOAD_DATE < <(
    yt-dlp -q --no-warnings --print "${FMT}" "${URL}"
)
if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
  UPLOAD_DATE_FMT="${BCYN}${UPLOAD_DATE:4:2}${BMGT}-${BCYN}${UPLOAD_DATE:6:2}${BMGT}-${BCYN}${UPLOAD_DATE:0:4}${RESET}"
else
  UPLOAD_DATE_FMT="${UPLOAD_DATE}"
fi

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
printf "    ${VBLU}┌───────────────────────────────────────────────────────────────┐${RESET}\n"
printf "    ${VBLU}├─────────────────────👽─${BMGT}[${BCYN}Nah${VBLU}─${BCYN}Fam${VBLU}─${BCYN}Studios${BMGT}]${VBLU}─👽───────────────────┤${RESET}\n"
printf "    ${VBLU}├───────────────────────────────────────────────────────────────┘${RESET}\n"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Ttl${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$TITLE"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📺   ${ACID}Chl${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$CHANNEL"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  🙋   ${ACID}Sbs${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$SUBS"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  👍   ${ACID}Lks${BMGT}:    [${BCYN}%s${BMGT}]${RESET}\n"     "$LIKES"
printf "    ${VBLU}│  ${NONG}───${BWHT}>  📆   ${ACID}Upd${BMGT}:    [%s${BMGT}]${RESET}\n"     "$UPLOAD_DATE_FMT"
printf "    ${VBLU}└───────────────────────────────────────────────────────────────┘${RESET}\n\n"

# ---- Output template ------------------------------------------------
OUT_TPL='%(title)s - %(uploader)s.%(ext)s'
LOG_FILE="$LOG_DIR/nfs_$(date +%Y%m%d-%H%M%S).log"
echo "${ACID}"

# ---- Download -------------------------------------------------------

yt-dlp \
  -f "bestvideo+bestaudio/best" \
  --merge-output-format mkv \
  --embed-thumbnail \
  --embed-chapters \
  --embed-subs \
  --yes-playlist \
  --quiet \
  --ignore-errors \
  --no-warnings \
  --continue \
  --no-overwrites \
  --progress \
  --progress-template "download: ${BCYN}DL${BMGT}:%(progress._percent_str)s ${BCYN}ETA${BMGT}: %(progress._eta_str)s ${BCYN}Speed${BMGT}: %(progress._speed_str)s" \
  -o "$OUT_BASE/%(title)s - %(uploader)s [%(height)sp].mkv" \
  "$URL" 2>>"$LOG_FILE"
printf "\n\n"

echo "The Script Had Finished.. Log: $LOG_FILE"
read -r -n1 -t5
