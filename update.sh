#!/bin/bash

read -p "Download 'beta', 'stable', or 'both'? " choice

if [[ "$choice" == "both" ]]; then

    find . -mindepth 1 -not -path "./.git*" -not -name "README.md" -not -name "update.sh" -not -name "_jsList.txt" -delete
    mkdir -p img loc snd beta/img beta/loc beta/snd

    wget -O index.html http://orteil.dashnet.org/cookieclicker/
    wget -O grab.txt http://orteil.dashnet.org/patreon/grab.php
    wget http://orteil.dashnet.org/cookieclicker/style.css
    wget -N -i _jsList.txt -B http://orteil.dashnet.org/cookieclicker/
    sed -i "s|/patreon/grab.php|grab.txt|g" main.js
    cd img/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/img/
    grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_imgList.txt
    wget -N -i _imgList.txt -B http://orteil.dashnet.org/cookieclicker/img/
    cd ../loc/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/loc/
    grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_locList.txt
    wget -N -i _locList.txt -B http://orteil.dashnet.org/cookieclicker/loc/
    cd ../snd/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/snd/
    grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_sndList.txt
    wget -N -i _sndList.txt -B http://orteil.dashnet.org/cookieclicker/snd/
    cd ../

    cd beta
    wget -O index.html http://orteil.dashnet.org/cookieclicker/beta/
    wget http://orteil.dashnet.org/cookieclicker/beta/style.css
    wget -N -i ../_jsList.txt -B http://orteil.dashnet.org/cookieclicker/beta/
    sed -i "s|/patreon/grab.php|../grab.txt|g" main.js
    cd img/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/img/
    grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_imgList.txt
    wget -N -i _imgList.txt -B http://orteil.dashnet.org/cookieclicker/beta/img/
    cd ../loc
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/loc/
    grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_locList.txt
    wget -N -i _locList.txt -B http://orteil.dashnet.org/cookieclicker/beta/loc/
    cd ../snd
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/snd/
    grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_sndList.txt
    wget -N -i _sndList.txt -B http://orteil.dashnet.org/cookieclicker/beta/snd/
    cd ../../

elif [[ "$choice" == "stable" ]]; then

    find . -mindepth 1 -not -path "./.git*" -not -path "./beta*" -not -name "README.md" -not -name "update.sh" -not -name "_jsList.txt" -delete
    mkdir -p img loc snd

    wget -O index.html http://orteil.dashnet.org/cookieclicker/
    wget -O grab.txt http://orteil.dashnet.org/patreon/grab.php
    wget http://orteil.dashnet.org/cookieclicker/style.css
    wget -N -i _jsList.txt -B http://orteil.dashnet.org/cookieclicker/
    sed -i "s|/patreon/grab.php|grab.txt|g" main.js
    cd img/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/img/
    grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_imgList.txt
    wget -N -i _imgList.txt -B http://orteil.dashnet.org/cookieclicker/img/
    cd ../loc/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/loc/
    grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_locList.txt
    wget -N -i _locList.txt -B http://orteil.dashnet.org/cookieclicker/loc/
    cd ../snd/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/snd/
    grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_sndList.txt
    wget -N -i _sndList.txt -B http://orteil.dashnet.org/cookieclicker/snd/
    cd ../

elif [[ "$choice" == "beta" ]]; then

    find ./beta -mindepth 1 -delete
    mkdir -p beta/img beta/loc beta/snd

    cd beta
    wget -O index.html http://orteil.dashnet.org/cookieclicker/beta/
    wget http://orteil.dashnet.org/cookieclicker/beta/style.css
    wget -N -i ../_jsList.txt -B http://orteil.dashnet.org/cookieclicker/beta/
    sed -i "s|/patreon/grab.php|../grab.txt|g" main.js
    cd img/
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/img/
    grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_imgList.txt
    wget -N -i _imgList.txt -B http://orteil.dashnet.org/cookieclicker/beta/img/
    cd ../loc
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/loc/
    grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_locList.txt
    wget -N -i _locList.txt -B http://orteil.dashnet.org/cookieclicker/beta/loc/
    cd ../snd
    wget --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/beta/snd/
    grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' >_sndList.txt
    wget -N -i _sndList.txt -B http://orteil.dashnet.org/cookieclicker/beta/snd/
    cd ../../

else
    echo "Invalid choice."
fi
