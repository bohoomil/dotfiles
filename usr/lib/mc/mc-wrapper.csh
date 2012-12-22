set MC_USER="`id | sed 's/[^(]*(//;s/).*//'`"

if ($?TMPDIR) then
	setenv MC_PWD_FILE $TMPDIR/mc-$MC_USER/mc.pwd.$$
else
	setenv MC_PWD_FILE /tmp/mc-$MC_USER/mc.pwd.$$
endif

/usr/bin/mc -P "$MC_PWD_FILE" $*

if (-r "$MC_PWD_FILE") then
	setenv MC_PWD "`cat '$MC_PWD_FILE'`"
	if ( -d "$MC_PWD" ) then
		cd "$MC_PWD"
	endif
	unsetenv MC_PWD
endif

rm -f "$MC_PWD_FILE"
unsetenv MC_PWD_FILE
