#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'        # No Color

clear

        # Create necessary directories
        mkdir -p /home/pi/RetroPie/music /home/pi/RetroPie/music-adult
        mkdir -p /home/pi/music_settings/adult_songs /home/pi/music_settings/music_over_games /home/pi/music_settings/user_switch

        # Create flag files for settings
        echo "1" > /home/pi/music_settings/onoff.flag
        echo "1" > /home/pi/music_settings/adult_songs/onoff.flag
        echo "0" > /home/pi/music_settings/music_over_games/onoff.flag
        echo "1" > /home/pi/music_settings/user_switch/onoff.flag

        # Backup and copy autostart.sh
        if [ ! -f /opt/retropie/configs/all/autostart.sh.orig ] && [ -f /opt/retropie/configs/all/autostart.sh ]; then
            mv /opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh.orig
        fi
        cp music_files/autostart.sh /opt/retropie/configs/all/

        # Copy other music-related files
        cp music_files/*.sh /home/pi/RetroPie/retropiemenu/

        # Backup and replace runcommand files
        [ -f /opt/retropie/configs/all/runcommand-onstart.sh ] && mv /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh.orig
        [ -f /opt/retropie/configs/all/runcommand-onend.sh ] && mv /opt/retropie/configs/all/runcommand-onend.sh /opt/retropie/configs/all/runcommand-onend.sh.orig
        cp music_files/runcommand-on*.sh /opt/retropie/configs/all/

        # Install required packages
        sudo apt-get -y install mpg123

        # Download test songs if not present
        #[ ! -f /home/pi/RetroPie/music/ADULT-Da\ Shootaz\ \-\ Grand\ Theft\ Auto_PSX.mp3 ] &&
        #   wget -q -O /home/pi/RetroPie/music/ADULT-Da\ Shootaz\ \-\ Grand\ Theft\ Auto_PSX.mp3 "http://installtekz.com/downloads/musicpi/ADULT-Da%20Shootaz%20-%20Grand%20Theft%20Auto_PSX.mp3"
        #[ ! -f /home/pi/RetroPie/music/aftershocks.mp3 ] &&
        #    wget -q -O /home/pi/RetroPie/music/aftershocks.mp3 "http://installtekz.com/downloads/musicpi/aftershocks.mp3"

        # Inform user of success
        echo -e "${GREEN}Setup complete!${NC}"
        echo "Place all your MP3 music files in: /home/pi/RetroPie/music"
        echo




