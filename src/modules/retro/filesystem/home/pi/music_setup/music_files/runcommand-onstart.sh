if [ "$(cat /home/pi/music_settings/adult_songs/onoff.flag)" == "0" ]; then
        pkill -STOP mpg123
fi