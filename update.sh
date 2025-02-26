#!/bin/bash

# Remove files listed in _delList.txt
if [ -f _delList.txt ]; then
  while IFS= read -r entry; do
    rm -rf "$entry"
  done < _delList.txt
fi

# Function to download and process files
download_files() {
  local dir=$1
  local url=$2
  local pattern=$3
  local list_file=$4

  cd "$dir"
  wget --convert-links -O index.html "$url"
  grep -v PARENTDIR index.html | grep "$pattern" | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > "$list_file"
  wget -N -i "$list_file" -B "$url"
  cd - > /dev/null
}

# Prompt user for download options
echo "Choose download option:"
echo "1. Download both"
echo "2. Download stable"
echo "3. Download beta"
read -p "Enter choice (1/2/3): " choice

# Create directories based on user choice
if [ "$choice" == "1" ] || [ "$choice" == "2" ]; then
  mkdir -p img loc snd
fi

if [ "$choice" == "1" ] || [ "$choice" == "3" ]; then
  mkdir -p beta/img beta/loc beta/snd
fi

if [ "$choice" == "1" ] || [ "$choice" == "2" ]; then
  # Download images, sounds, and localization files
  download_files "img" "http://orteil.dashnet.org/cookieclicker/img/" '\[IMG' "_imgList.txt"
  download_files "snd" "http://orteil.dashnet.org/cookieclicker/snd/" '\[SND' "_sndList.txt"
  download_files "loc" "http://orteil.dashnet.org/cookieclicker/loc/" '\[TXT' "_locList.txt"

  # Download main files
  wget -O index.html http://orteil.dashnet.org/cookieclicker/
  wget -O grab.txt http://orteil.dashnet.org/patreon/grab.php
  wget http://orteil.dashnet.org/cookieclicker/style.css
  wget -N -i _jsList.txt -B http://orteil.dashnet.org/cookieclicker/
  sed -i "s|/patreon/grab.php|grab.txt|g" main.js
fi

if [ "$choice" == "1" ] || [ "$choice" == "3" ]; then
  # Download beta images, sounds, and localization files
  download_files "beta/img" "http://orteil.dashnet.org/cookieclicker/beta/img/" '\[IMG' "_imgList.txt"
  download_files "beta/snd" "http://orteil.dashnet.org/cookieclicker/beta/snd/" '\[SND' "_sndList.txt"
  download_files "beta/loc" "http://orteil.dashnet.org/cookieclicker/beta/loc/" '\[TXT' "_locList.txt"

  # Download beta main files
  cd beta/
  wget -O index.html http://orteil.dashnet.org/cookieclicker/beta/
  wget http://orteil.dashnet.org/cookieclicker/beta/style.css
  wget -N -i ../_jsList.txt -B http://orteil.dashnet.org/cookieclicker/beta/
  sed -i "s|/patreon/grab.php|../grab.txt|g" main.js
  cd ..
fi

# Generate _delList.txt
find . -not -path './.git*' -not -name '.' -not -name '_jsList.txt' -not -name 'update.sh' -not -name 'README.md' > _delList.txt