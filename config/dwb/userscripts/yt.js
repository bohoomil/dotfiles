#!javascript 

bind("Mod1 m", function () { 
  system.spawn("sh -c 'mplayer $(youtube-dl -g --format=18 --max-quality=34 " + tabs.current.uri + ")'"); 
});
bind("Mod1 y", function () { 
  system.spawn("youtube-dl --format=18 --max-quality=34 -t " + tabs.current.uri); 
});
