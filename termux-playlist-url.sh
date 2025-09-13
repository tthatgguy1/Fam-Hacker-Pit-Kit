#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# ---- Config ---------------------------------------------------------
#OUT_BASE Was Created In The install.sh File.
OUT_BASE="$HOME/storage/shared/Fam-Hacker-Pit-Kit/YouTube_Audio_Pit"
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
DELIM=$'\x1f'
FMT='%(playlist_title)s\x1f%(uploader)s\x1f%(playlist_count)s'
IFS=$'\x1f' read -r PTITLE PUP COUNT < <(yt-dlp -q --flat-playlist --no-warnings --print "$FMT" "$URL" || printf '%s\x1f%s\x1f%s' '?' '?' '?')
echo
printf '\nPlaylist : %s\nChannel  : %s\nItems   : %s\n\n' "$PTITLE" "$PUP" "$COUNT"

# ---- Output template ------------------------------------------------
OUT_TPL='%(playlist_title,replace="/","﹨")s/%(title)s - %(uploader)s.%(ext)s'
LOG_FILE="$LOG_DIR/nfs_$(date +%Y%m%d-%H%M%S).log"

# ---- Download -------------------------------------------------------
yt-dlp \
  -x --audio-format mp3 \
  -f bestaudio \
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
