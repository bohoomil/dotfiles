#!javascript 

bind("Mod1 m", function () { 
  system.spawn("sh -c 'mplayer $(youtube-dl -g " + tabs.current.uri + ")'"); 
});
bind("Mod1 y", function () { 
  system.spawn("youtube-dl " + tabs.current.uri); 
});
