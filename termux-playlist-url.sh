#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# ---- Config ---------------------------------------------------------
#OUT_BASE Was Created In The install.sh File.
OUT_BASE="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube-Audio-Pit"
LOG_DIR="$HOME/storage/shared/Fam-Hacker-Pit-Kit/.cache/YouTube_Playlists"
mkdir -p "$OUT_BASE" "$LOG_DIR"
clear

# ---- Manual URL entry -----------------------------------------------
printf "\n\n\n"
echo -n "Enter The Desired YouTube Playlist URL: "
read -r URL

if [[ -z "$URL" ]]; then
  echo "No URL Has Been Entered, Now Exiting."
  exit 2
fi

# ---- Info header ----------------------------------------------------
echo
DELIM=$'\x1f'
FMT=$'%(playlist_title)s\x1f%(title)s\x1f%(uploader)s\x1f%(channel_follower_count)s\x1f%(like_count)s\x1f%(upload_date)s\x1f%(width)s\x1f%(height)s'
IFS=$DELIM read -r PTITLE TITLE CHANNEL SUBS LIKES UPLOAD_DATE QLTYW QLTYH < <(
    yt-dlp -q --no-warnings --print "${FMT}" "${URL}"
)
if [[ "$UPLOAD_DATE" =~ ^[0-9]{8}$ ]]; then
  UPLOAD_DATE_FMT="${UPLOAD_DATE:4:2}-${UPLOAD_DATE:6:2}-${UPLOAD_DATE:0:4}"
else
  UPLOAD_DATE_FMT="${UPLOAD_DATE}"
fi

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
   ------------------------[Nah-Fam_Studios]---------------------------- ' | lolcat --seed 555
printf "\n\n"
printf "    ┌───────────────────────────────────────────────────────────────┐\n"
printf "    ├─────────────────────👽─[Nah─Fam─Studios]─👽───────────────────┤\n"
printf "    ├───────────────────────────────────────────────────────────────┘\n"
printf "    │  ───>  📺   Chl:    [%s]\n"     "$CHANNEL"
printf "    │  ───>  🙋   Sbs:    [%s]\n"     "$SUBS"
printf "    │  ───>  👍   Lks:    [%s]\n"     "$LIKES"
printf "    │  ───>  📆   Upd:    [%s]\n"     "$UPLOAD_DATE_FMT"
printf "    └───────────────────────────────────────────────────────────────┘\n\n"

# ---- Output template ------------------------------------------------
OUT_TPL='%(playlist_title,replace="/","﹨")s/%(title)s - %(uploader)s.%(ext)s'
LOG_FILE="$LOG_DIR/nfs_$(date +%Y%m%d-%H%M%S).log"

# ---- Download -------------------------------------------------------
yt-dlp \
  -x --audio-format mp3 \
  -f bestaudio \
  --quiet
  --yes-playlist \
  --ignore-errors \
  --no-warnings \
  --continue \
  --no-overwrites \
  --progress-template 'download: DL:%(progress._percent_str)s ETA:%(progress._eta_str)s Speed:%(progress._speed_str)s' \
  -o "$OUT_BASE/$OUT_TPL" \
  "$URL" 2>>"$LOG_FILE"

echo
echo "The Script Had Finished.. Log: $LOG_FILE"
