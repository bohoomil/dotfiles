/* See LICENSE file for copyright and license details. */
/* appearance */
static const char font[] = "-xos4-terminus-medium-r-normal-*-12-120-72-72-c-*-iso10646-1";
#define NUMCOLORS 26
static const char colors[NUMCOLORS][ColLast][26] = {
  // border foreground background         dec hex
  { "#001833", "#333840", "#000000" }, // 01  1 norm [dark grey on black]
  { "#1A6666", "#ACB4BF", "#000000" }, // 02  2 sel  [bright grey on black]
  { "#B641CC", "#E6E6E6", "#DC2F32" }, // 03  3 urg  [white on red]
  { "#001833", "#8C8B89", "#000000" }, // 04  4 mid grey on black
  { "#001833", "#001833", "#000000" }, // 05  5 dark blue on black
	{ "#001833", "#222946", "#000000" }, // 06  6 black 0
	{ "#001833", "#8C8B89", "#000000" }, // 07  7 black 8
	{ "#001833", "#B32323", "#000000" }, // 08  8 red 1
	{ "#001833", "#DC2C2C", "#000000" }, // 09  9 red 9      error
	{ "#001833", "#1AAA13", "#000000" }, // 10  A green 2
	{ "#001833", "#5DCE33", "#000000" }, // 11  B green 10   ok
	{ "#001833", "#FF9F3E", "#000000" }, // 12  C yellow 3
	{ "#001833", "#E6CB29", "#000000" }, // 13  D yellow 11  medium
	{ "#001833", "#4062F3", "#000000" }, // 14  E blue 4
	{ "#001833", "#4F75FF", "#000000" }, // 15  F blue 12
	{ "#001833", "#BF3E94", "#000000" }, // 16 10 magenta 5
	{ "#001833", "#B641CC", "#000000" }, // 17 11 magenta 13 hot
	{ "#001833", "#0CAAB8", "#000000" }, // 18 12 cyan 6     cool
	{ "#001833", "#48ACF3", "#000000" }, // 19 13 cyan 14
	{ "#001833", "#AEAEAE", "#000000" }, // 20 14 white 7
	{ "#001833", "#DBDDE4", "#000000" }, // 21 15 white 15
	{ "#001833", "#001833", "#000000" }, // 22 16 dwm normbg
	{ "#001833", "#090C19", "#000000" }, // 23 17 Xorg bg
	{ "#001833", "#5E6875", "#000000" }, // 24 18 normal grey
	{ "#001833", "#8EA0B2", "#000000" }, // 25 19 clock bright
	{ "#001833", "#005577", "#000000" }, // 26 1A dwm selbg
};

static const unsigned int borderpx  = 1;     /* border pixel of windows */
static const unsigned int snap      = 32;    /* snap pixel */
static const Bool showbar           = True;  /* False means no bar */
static const Bool topbar            = True;  /* False means bottom bar */
static const Bool clicktofocus      = True;  /* Change focus only on click */
#include "addons.c"

/* tagging */
static const char *tags[] = { "[1]", "[2]", "[3]", "[4]" };

static const Rule rules[] = {
	/* class - instance - title - tags mask - isfloating - iscentred - monitor */
  {  NULL,               NULL,   "tmux",        1 << 3,   False,    False, -1 },
  { "dwb",               NULL,    NULL,         1 << 0,   False,    False, -1 },
	{ "Firefox",           NULL,    NULL,         1 << 0,   False,    False, -1 },
  { "Firefox",           NULL, "Preferences",   1 << 0,    True,    False, -1 },
	{ "Firefox",       "Toplevel",  NULL,         1 << 0,    True,    False, -1 },
	{  NULL,               NULL, "About Mozilla", 1 << 0,    True,    True,  -1 },
	{  NULL,               NULL,  "gparted pass",      0,    True,    False, -1 },
	{ "Xsane",             NULL,    NULL,         1 << 1,    True,    False, -1 },
	{ "MPlayer",           NULL,    NULL,         1 << 2,    False,   False, -1 },
	{  NULL,               NULL, "mplayer2",      1 << 2,    False,   False, -1 },
	{ "XCalc",             NULL,    NULL,              0,    True,    True,  -1 },
	{ "Mate-font-viewer",  NULL,    NULL,              0,    False,   False, -1 },
	{ "XFontSel",          NULL,    NULL,              0,    True,    True,  -1 },
	{ "Xfd",               NULL,    NULL,              0,    True,    True,  -1 },
	{ "Display",           NULL,    NULL,              0,    True,    False, -1 },
	{ "XMahjongg",         NULL,    NULL,              0,    True,    True,  -1 },
  {  NULL,               NULL, "Xdefaults Color Picker", 0, True,   False, -1 },
	{ "Wine",              NULL,    NULL,         1 << 1,    True,    False, -1 },
	{  NULL,               NULL,    "mc",              0,    True,    False, -1 },
	{  NULL,               NULL,   "pad",              0,    True,    False, -1 },
};

/* layout(s) */
static const float mfact      = 0.62;  /* master area size [0.05..0.95] */
static const int nmaster      = 1;
static const Bool resizehints = False;

static const Layout layouts[] = {
  /* symbol   arrange function */
  { "[T]",    tile },    /* first entry is default */
  { "[F]",    NULL },    /* no layout function means floating behavior */
  { "[M]",    monocle },
  { "[B]",    bstack },
};

/* key definitions (as in heresy) */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY, toggleview, {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY, view,       {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY, tag,        {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY, toggletag,  {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenu[] = { "dmenu-dwm", NULL };
static const char *tmux[]  = { "urxvtc", "-title", "tmux", "-cd", "/home/bohoomil", "-e", "tmux", NULL };
static const char *ff[]    = { "firefox", "-P", "default", NULL };
static const char *dwb[]   = { "dwb", NULL };
static const char *pad[]   = { "urxvtc", "-geometry", "81x16+0+801", "-name", "pad", NULL };
static const char *fm[]    = { "urxvt-fm", NULL };
static const char *vim[]   = { "vim-bin", NULL };
static const char *kfd[]   = { "kfd", NULL };
static const char *star[]  = { "stardict", NULL };
static const char *acro[]  = { "acrobat", NULL };
static const char *volu[]  = { "amixer", "-q", "sset", "Master", "1+", NULL };
static const char *vold[]  = { "amixer", "-q", "sset", "Master", "1-", NULL };
static const char *volm[] = { "amixer", "-q", "sset", "Master", "toggle", NULL };
static const char *brup[]  = { "xbacklight", "-inc", "5", NULL };
static const char *brdw[]  = { "xbacklight", "-dec", "5", NULL };
static const char *lock[]  = { "slock", NULL };
static const char *scrot[] = { "teiler", NULL };
static const char *lohis[] = { "lolictrl", NULL };
static const char *losyn[] = { "lolictrl", "-spc", NULL };
static const char *out[]   = { "killall", "dwm-start", NULL };
static const char *rebt[]  = { "systemctl", "reboot", NULL };
static const char *halt[]  = { "systemctl", "poweroff", NULL };

#include "X11/XF86keysym.h"
static Key keys[] = {
  /* modifier             key        function       argument */
	/* custom commands */
	{ MODKEY,               XK_d,      spawn,         {.v = dmenu }},
	{ ControlMask|Mod1Mask, XK_f,      spawn,         {.v = fm }},
	{ ControlMask|Mod1Mask, XK_t,      spawn,         {.v = tmux }},
  { ControlMask|Mod1Mask, XK_x,      spawn,         {.v = pad}},
	{ ControlMask|Mod1Mask, XK_b,      spawn,         {.v = ff }},
	{ ControlMask|Mod1Mask, XK_d,      spawn,         {.v = dwb }},
  { ControlMask|Mod1Mask, XK_k,      spawn,         {.v = kfd }},
  { ControlMask|Mod1Mask, XK_s,      spawn,         {.v = star }},
  { ControlMask|Mod1Mask, XK_a,      spawn,         {.v = acro }},
	{ ControlMask|Mod1Mask, XK_v,      spawn,         {.v = vim }},
  { ControlMask|Mod1Mask, XK_h,      spawn,         {.v = lohis }},
  { ControlMask|Mod1Mask, XK_r,      spawn,         {.v = losyn }},
	{ 0,                    XK_Print,  spawn,         {.v = scrot }},
  /* */
  { MODKEY,               XK_b,      togglebar,     {0}},
	{ MODKEY,               XK_j,      focusstack,    {.i = +1}},
	{ MODKEY,               XK_k,      focusstack,    {.i = -1}},
	{ MODKEY,               XK_h,      setmfact,      {.f = -0.05}},
	{ MODKEY,               XK_l,      setmfact,      {.f = +0.05}},
	{ MODKEY|ShiftMask,     XK_l,      incnmaster,    {.i = +1}},
	{ MODKEY|ShiftMask,     XK_h,      incnmaster,    {.i = -1}},
	{ MODKEY|ControlMask,   XK_j,      pushdown,      {0}},
	{ MODKEY|ControlMask,   XK_k,      pushup,        {0}},
	{ MODKEY,               XK_Return, zoom,          {0}},
	{ MODKEY,               XK_Tab,    view,          {0}},
	{ MODKEY|ShiftMask,     XK_c,      killclient,    {0}},
	/* layouts */
	{ MODKEY,               XK_t,      setlayout, {.v = &layouts[0]}}, // tile
	{ MODKEY,               XK_f,      setlayout, {.v = &layouts[1]}}, // float
	{ MODKEY,               XK_m,      setlayout, {.v = &layouts[2]}}, // monocle
	{ MODKEY,               XK_s,      setlayout, {.v = &layouts[3]}}, // bstack
  /* */
  { MODKEY,               XK_space,  setlayout,      {0}},
	{ MODKEY|ShiftMask,     XK_space,  togglefloating, {0}},
	{ MODKEY,               XK_0,      view,           {.ui = ~0}},
	{ MODKEY|ShiftMask,     XK_0,      tag,            {.ui = ~0}},
	/* navigation */
  TAGKEYS(                XK_1,                      0)
	TAGKEYS(                XK_2,                      1)
	TAGKEYS(                XK_3,                      2)
	TAGKEYS(                XK_4,                      3)
	/* exit, halt, etc. */
	{ MODKEY|ShiftMask,             XK_q,      spawn,      {.v = out }},
	{ MODKEY|ControlMask,           XK_q,      quit,       {0}}, // restart
	{ MODKEY|ControlMask|ShiftMask, XK_r,      spawn,      {.v = rebt }},
	{ MODKEY|ControlMask|ShiftMask, XK_h,      spawn,      {.v = halt }},
  { MODKEY|ControlMask|ShiftMask, XK_l,      spawn,      {.v = lock }},
	/* monitor */
	{ MODKEY,                       XK_comma,  focusmon,   {.i = -1 }},
	{ MODKEY,                       XK_period, focusmon,   {.i = +1 }},
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,     {.i = -1 }},
	{ MODKEY|ShiftMask,             XK_period, tagmon,     {.i = +1 }},
	/* moveresize */
	{ MODKEY,              XK_Left,  moveresize,     {.v = "-10x 0y 0w 0h"  }},
	{ MODKEY,              XK_Right, moveresize,     {.v = "10x 0y 0w 0h"   }},
	{ MODKEY,              XK_Down,  moveresize,     {.v = "0x 10y 0w 0h"   }},
	{ MODKEY,              XK_Up,    moveresize,     {.v = "0x -10y 0w 0h"  }},
	{ MODKEY|ControlMask,  XK_Left,  moveresize,     {.v = "0X 0y 0w 0h"    }},
	{ MODKEY|ControlMask,  XK_Right, moveresize,     {.v = "9000X 0y 0w 0h" }},
	{ MODKEY|ControlMask,  XK_Down,  moveresize,     {.v = "0x 9000Y 0w 0h" }},
	{ MODKEY|ControlMask,  XK_Up,    moveresize,     {.v = "0x 15Y 0w 0h"   }},
	{ MODKEY|ShiftMask,    XK_Left,  moveresize,     {.v = "0x 0y -10w 0h"  }},
	{ MODKEY|ShiftMask,    XK_Right, moveresize,     {.v = "0x 0y 20w 0h"   }},
	{ MODKEY|ShiftMask,    XK_Down,  moveresize,     {.v = "0x 0y 0w 20h"   }},
	{ MODKEY|ShiftMask,    XK_Up,    moveresize,     {.v = "0x 0y 0w -10h"  }},
	{ MODKEY|ShiftMask,    XK_f,     togglefullscreen, {0}},
	/* media keys */
	{ 0,                   XF86XK_AudioRaiseVolume,  spawn,  {.v = volu }},
	{ 0,                   XF86XK_AudioLowerVolume,  spawn,  {.v = vold }},
	{ 0,                   XF86XK_AudioMute,         spawn,  {.v = volm }},
	{ 0,                   XF86XK_MonBrightnessUp,   spawn,  {.v = brup }},
	{ 0,                   XF86XK_MonBrightnessDown, spawn,  {.v = brdw }},
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click          event mask button     function        argument */
  { ClkLtSymbol,    0,         Button1,   setlayout,      {0}},
  { ClkLtSymbol,    0,         Button3,   setlayout,      {.v = &layouts[2]}},
  { ClkWinTitle,    0,         Button2,   zoom,           {0}},
//  { ClkRootWin,     0,         Button2,   spawn,          {.v = padcmd }},
  { ClkClientWin,   MODKEY,    Button1,   movemouse,      {0}},
  { ClkClientWin,   MODKEY,    Button2,   togglefloating, {0}},
  { ClkClientWin,   MODKEY,    Button3,   resizemouse,    {0}},
  { ClkTagBar,      0,         Button1,   toggleview,     {0}},
  { ClkTagBar,      0,         Button1,   view,           {0}},
  { ClkTagBar,      MODKEY,    Button3,   tag,            {0}},
  { ClkTagBar,      MODKEY,    Button1,   toggletag,      {0}},
};
