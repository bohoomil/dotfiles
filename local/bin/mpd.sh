#!/bin/bash
pidof -s mpd >& /dev/null
if [ $? -ne 0 ] && [ -f $HOME/.mpd/mpd.conf ]; then
  ionice -c2 nice -n -3 /usr/bin/mpd $HOME/.mpd/mpd.conf &
fi

pidof -s mpdscribble >& /dev/null
if [ $? -ne 0 ]; then
  (sleep 60 && mpdscribble) &
fi

