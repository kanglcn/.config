;  ██▓███  ▒█████   ██▓   ▓██   ██▓ ▄▄▄▄    ▄▄▄       ██▀███  
; ▓██░  ██▒██▒  ██▒▓██▒    ▒██  ██▒▓█████▄ ▒████▄    ▓██ ▒ ██▒
; ▓██░ ██▓▒██░  ██▒▒██░     ▒██ ██░▒██▒ ▄██▒██  ▀█▄  ▓██ ░▄█ ▒
; ▒██▄█▓▒ ▒██   ██░▒██░     ░ ▐██▓░▒██░█▀  ░██▄▄▄▄██ ▒██▀▀█▄  
; ▒██▒ ░  ░ ████▓▒░░██████▒ ░ ██▒▓░░▓█  ▀█▓ ▓█   ▓██▒░██▓ ▒██▒
; ▒▓▒░ ░  ░ ▒░▒░▒░ ░ ▒░▓  ░  ██▒▒▒ ░▒▓███▀▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░
; ░▒ ░      ░ ▒ ▒░ ░ ░ ▒  ░▓██ ░▒░ ▒░▒   ░   ▒   ▒▒ ░  ░▒ ░ ▒░
; ░░      ░ ░ ░ ▒    ░ ░   ▒ ▒ ░░   ░    ░   ░   ▒     ░░   ░ 
;     ░       ░ ░      ░  ░░ ░      ░            ░  ░   ░     
;       ░                  ░ ░           ░
; author: Trollwut (trollwut.sexy)    ░  ░       ░
; based on BVollmerhaus' polybar (https://gitlab.com/BVollmerhaus/dotfiles)
; with modifications for Dracula color scheme (draculatheme.com)
; License: MIT

; TODO: backlight plugin

; layout {{{

[layout]
icon-font = 2

icon-padding = 1
module-padding = 2

bar-format = %{T4}%fill%%indicator%%{F#dc404040}%empty%%{F-}%{T-}
bar-fill-icon = ﭳ

; }}}

; colors {{{

; colors have been taken from Dracula colorscheme
; https://github.com/dracula/dracula-theme#color-palette
[color]
fg = #f8f8f2
text-fg = ${self.fg}
bg = #282a36
base-bg    = ${self.bg:#dd282a36}
text-bg = ${self.bg}
selection = #44475a
comment = #6272a4
; glyph-bg   = ${self.comment}
; module-bg  = ${self.comment}
glyph-bg   = ${self.bg}
module-bg  = ${self.bg}
cyan  = #8be9fd
green  = #50fa7b
orange = #ffb86c
pink  = #ff79c6
purple  = #bd93f9
red  = #ff5555
white  = #f8f8f2
yellow  = #f1fa8c


; }}}

; bars and fonts {{{

[bar/base]
monitor = ${env:MONITOR}
width = 100%
height = 28
fixed-center = true

background = ${color.base-bg}
foreground = ${color.text-fg}

; size of under-/overlines
line-size = 2

; some cursors to indicate a module's functions
cursor-click = pointer
cursor-scroll = ns-resize

;font-0 = Ubuntu Condensed:style=Regular:size=12;2
font-0 = Germania One:weight=regular:fontformat=truetype:size=13:antialias=true;2
; Material Design Icons
font-1 = Symbols Nerd Font:style=Medium:size=12;2
; Powerline Glyphs
font-2 = Iosevka Term,souce han sans cn:style=Medium:size=24;3
; Larger font size for bar fill icons
font-3 = Symbols Nerd Font:style=Medium:size=13;3
; Smaller font size for shorter spaces
font-4 = Iosevka Term:style=Medium:size=7;3
; ramp font
font-5 = "TerminessTTF Nerd Font:style=Medium:pixelsize=13;1"

font-6 = souce han sans cn:pixelsize=12:antialias=true;1
; bar doesn't take away gaps space
;override-redirect = true

; restack the bar window and put it above the selected window manager's root
; fixes the issue where the bar is being drawn on top of fullscreen window's


[bar/top-primary]
inherit = bar/base

modules-left = i3 right-end-top left-end-bottom wlan eth ping right-end-top left-end-bottom right-end-top
modules-center = xwindow
modules-right = temp left-end-top right-end-bottom updates left-end-top cpu memory right-end-bottom left-end-top volume right-end-bottom left-end-top date


[bar/top-secondary]
inherit = bar/base
modules-left = i3 right-end-top
modules-center = xwindow
modules-right = left-end-top date
tray-position =


; [bar/bottom-primary]
; inherit = bar/base
; bottom = true
;
; modules-left = wlan eth ping right-end-bottom left-end-top right-end-bottom
; modules-center = now-playing
; modules-right = left-end-bottom battery right-end-top left-end-bottom cpu memory right-end-top left-end-bottom
; ; TODO: brightness
;
; tray-background = ${color.module-bg}
; tray-padding = ${layout.module-padding}
; tray-position = right
;
;
; [bar/bottom-secondary]
; inherit = bar/bottom-primary
; tray-position = 

; }}}

; style formats {{{

; A generic format for any modules that support it. Unfortunately, this
; doesn't apply to all modules since some use different names for their
; format and prefix definitions, such as format-NAME or ramp-NAME, which
; don't fall back to the unnamed ones and have to be declared explicitly.
[generic-format-style]
format-background = ${color.module-bg}
format-padding = ${layout.module-padding}

;format-prefix-font = ${layout.icon-font}
format-prefix-foreground = ${color.comment}
format-prefix-padding-right = ${layout.icon-padding}

[format-glyphs]
inherit = generic-format-style

format-prefix-background = ${color.base-bg}
format-prefix-foreground = ${color.module-bg}
format-suffix-background = ${color.base-bg}
format-suffix-foreground = ${color.module-bg}

format-padding = 0
format-prefix-padding-right = 0
format-prefix-padding-left = 0

[format-glyphs-top-center]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

[format-glyphs-top-left]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

[format-glyphs-top-right]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

[format-glyphs-bottom-center]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

[format-glyphs-bottom-left]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

[format-glyphs-bottom-right]
inherit = format-glyphs
format-prefix = "%{T3}%{T-}"
format-suffix = "%{T3}%{T-}"

; }}}

; decorative glyphs {{{

;  ____                           _   _              ____ _             _         
; |  _ \  ___  ___ ___  _ __ __ _| |_(_)_   _____   / ___| |_   _ _ __ | |__  ___ 
; | | | |/ _ \/ __/ _ \| '__/ _` | __| \ \ / / _ \ | |  _| | | | | '_ \| '_ \/ __|
; | |_| |  __/ (_| (_) | | | (_| | |_| |\ V /  __/ | |_| | | |_| | |_) | | | \__ \
; |____/ \___|\___\___/|_|  \__,_|\__|_| \_/ \___|  \____|_|\__, | .__/|_| |_|___/

[module/decor-glyph]
type = custom/text
content-background = ${color.base-bg}
content-foreground = ${color.glyph-bg}

[module/left-end-top]
inherit = module/decor-glyph
content = "%{T3}%{T-}"

[module/right-end-top]
inherit = module/decor-glyph
content = "%{T3}%{T-}"

[module/left-end-bottom]
inherit = module/decor-glyph
content = "%{T3}%{T-}"

[module/right-end-bottom]
inherit = module/decor-glyph
content = "%{T3}%{T-}"

; }}}

; modules {{{

[module/i3]
type = internal/i3

index-sort = true
; Don't wrap around when scrolling through workspaces
wrapping-scroll = false
; Only show workspaces on the same output as the bar
pin-workspaces = true
; Split the workspace label on ':' to get its name
strip-wsnumbers = true

; Have this set in your i3 config, otherwise rename it here
;ws-icon-default = 缾
;ws-icon-0 = 1:一;
;ws-icon-1 = 2:二;ﲵ
;ws-icon-2 = 3:三;
;ws-icon-3 = 4:四;
;ws-icon-4 = 5:五;
;ws-icon-5 = 6:六;
;ws-icon-6 = 10:〇;ﱘ

format = <label-state><label-mode>


; Active workspace on focused monitor
;label-focused = %{T2}%icon%%{T-}  %name%
label-focused = %name%
label-focused-foreground = ${color.text-fg}
label-focused-background = ${color.module-bg}
;label-focused-underline = ${color.pink}
label-focused-overline = ${color.pink}
label-focused-padding = ${layout.module-padding}

; Inactive workspace on any monitor
label-unfocused = ${self.label-focused}
label-unfocused-foreground = ${color.text-fg}
label-unfocused-background = ${color.module-bg}
label-unfocused-padding = ${layout.module-padding}

; Active workspace on unfocused monitor
label-visible = ${self.label-focused}
label-visible-background = ${color.module-bg}
;label-visible-underline = ${color.module-bg4}
label-visible-padding = ${layout.module-padding}

; Workspace with urgency hint set
label-urgent = ${self.label-focused}
label-urgent-foreground = ${color.text-bg}
label-urgent-background = ${color.red}
;label-urgent-underline = ${color.module-bg4}
;label-urgent-overline = ${color.module-bg4}
label-urgent-padding = ${layout.module-padding}

label-mode-background = ${color.orange}
label-mode-foreground = ${color.text-bg}
label-mode-padding = ${layout.module-padding}


[module/xwindow]
type = internal/xwindow
inherit = format-glyphs-top-center
;label-title-padding = 60
label = %title:0:60:…%


[module/cpu]
type = internal/cpu
inherit = generic-format-style

; format =  <label> <bar-load>
format =  <label> <ramp-coreload>
;format-prefix = 

label = %percentage:2%%

; Seconds to sleep between updates
; Default: 1
interval = 0.5

; Bar
bar-load-format = ${layout.bar-format}

bar-load-foreground-0 = ${color.green}
bar-load-foreground-1 = ${color.green}
bar-load-foreground-2 = ${color.orange}
bar-load-foreground-3 = ${color.orange}
bar-load-foreground-4 = ${color.red}
bar-load-gradient = true

bar-load-width = 6
bar-load-fill = ${layout.bar-fill-icon}
bar-load-indicator =
bar-load-empty = ${layout.bar-fill-icon}

ramp-coreload-spacing = 0
ramp-coreload-0 = ▁
ramp-coreload-0-font = 6
ramp-coreload-0-foreground = ${color.green}
ramp-coreload-1 = ▂
ramp-coreload-1-font = 6
ramp-coreload-1-foreground = ${color.green}
ramp-coreload-2 = ▃
ramp-coreload-2-font = 6
ramp-coreload-2-foreground = ${color.green}
ramp-coreload-3 = ▄
ramp-coreload-3-font = 6
ramp-coreload-3-foreground = ${color.yellow}
ramp-coreload-4 = ▅
ramp-coreload-4-font = 6
ramp-coreload-4-foreground = ${color.yellow}
ramp-coreload-5 = ▆
ramp-coreload-5-font = 6
ramp-coreload-5-foreground = ${color.orange}
ramp-coreload-6 = ▇
ramp-coreload-6-font = 6
ramp-coreload-6-foreground = ${color.orange}
ramp-coreload-7 = █
ramp-coreload-7-font = 6
ramp-coreload-7-foreground = ${color.red}


[module/memory]
type = internal/memory
inherit = generic-format-style

;format-prefix = ﬘
label = ﬙ %percentage_used:2%%


[module/temp]
inherit = format-glyphs-top-right
type = internal/temperature
interval = 2

; Thermal zone to use
; To list all the zone types, run
; $ for i in /sys/class/thermal/thermal_zone*; do echo "$i: $(<$i/type)"; done
; Default: 0
thermal-zone = 0

;units = false
warn-temperature = 80

; Normal
format = 
format-background = ${color.module-bg}
;format-padding = ${layout.module-padding}


label = %temperature-c%

; Warning
format-warn-background = ${color.red}
format-warn-foreground = ${color.fg}
format-warn-underline = ${color.red}
format-warn-padding = ${layout.module-padding}

format-warn =  <label-warn>
;format-warn-foreground = ${color.red}
label-warn = ${self.label}


[module/tempryzen]
inherit = format-glyphs-top-right
type = internal/temperature
interval = 2

; Thermal zone to use
; To list all the zone types, run
; $ for i in /sys/class/thermal/thermal_zone*; do echo "$i: $(<$i/type)"; done
; Default: 0
thermal-zone = 2

; Full path of temperature sysfs path
; Use `sensors` to find preferred temperature source, then run
; $ for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done
; to find path to desired file
; Default reverts to thermal zone setting
hwmon-path = /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon0/temp1_input

;units = false
warn-temperature = 70

; Normal
format = 
format-background = ${color.module-bg}
;format-padding = ${layout.module-padding}


label = %temperature-c%

; Warning
format-warn-background = ${color.red}
format-warn-foreground = ${color.fg}
format-warn-underline = ${color.red}
format-warn-padding = ${layout.module-padding}

format-warn =  <label-warn>
;format-warn-foreground = ${color.red}
label-warn = ${self.label}


[module/xkeyboard]
type = internal/xkeyboard
inherit = generic-format-style
blacklist-0 = num lock

format-prefix = 

label-indicator-underline = ${color.red}
label-indicator-padding = 1
label-indicator-margin = 1


[module/filesystem]
type = internal/fs

mount-0 = /

; Mounted
format-mounted-background = ${color.module-bg}
format-mounted-padding = ${layout.module-padding}

format-mounted-prefix = 
format-mounted-prefix-font = ${layout.icon-font}
format-mounted-prefix-foreground = ${color.text-fg}
format-mounted-prefix-padding-right = ${layout.icon-padding}

label-mounted = %used% / %total%

; Unmounted
format-unmounted-background = ${color.module-bg}
format-unmounted-padding = ${layout.module-padding}

format-unmounted-prefix = 
format-unmounted-prefix-font = ${layout.icon-font}
format-unmounted-prefix-foreground = ${color.text-fg}
format-unmounted-prefix-padding-right = ${layout.icon-padding}

label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${color.red}


[module/network]
type = internal/network
interval = 2

; Connected
format-connected-background = ${color.module-bg}
format-connected-padding = ${layout.module-padding}

format-connected-prefix-font = ${layout.icon-font}
format-connected-prefix-foreground = ${color.text-fg}
format-connected-prefix-padding-right = ${layout.icon-padding}

; Disconnected
format-disconnected-background = ${color.module-bg}
format-disconnected-foreground = ${color.orange}
format-disconnected-padding = ${layout.module-padding}

format-disconnected-prefix-font = ${layout.icon-font}
format-disconnected-prefix-foreground = ${color.text-fg}
format-disconnected-prefix-padding-right = ${layout.icon-padding}


[module/wlan]
inherit = module/network
interface = ${env:IFACE_WLAN}

format-connected-prefix = 直
label-connected = %essid%

format-disconnected-prefix = 睊
label-disconnected = 


[module/eth]
inherit = module/network
interface = ${env:IFACE_ETH}

format-connected-prefix = 
label-connected = %local_ip%

format-disconnected =


[module/ping]
type = custom/script
inherit = generic-format-style

exec = $HOME/.config/polybar/modules/measure_ping.py
tail = true
click-left = kill -USR1 %pid%

format-prefix-foreground = ${color.text-fg}
format-prefix = 


[module/date]
type = internal/date
inherit = generic-format-style
interval = 1

date = %Y-%m-%d
date-alt = %A, %d %B %Y

time = %H:%M
time-alt = %H:%M:%S

label = %date% %time%


[module/now-playing]
type = custom/script
inherit = format-glyphs-bottom-center

exec = $HOME/.config/polybar/modules/now_playing.py
tail = true

click-left = playerctl next
click-middle = playerctl play-pause
click-right = playerctl previous


[module/volume]
type = internal/alsa

; Not muted
format-volume = <ramp-volume><bar-volume>
format-volume-background = ${color.module-bg}
format-volume-padding = ${layout.module-padding}

ramp-volume-font = ${layout.icon-font}
ramp-volume-foreground = ${color.text-fg}
ramp-volume-padding-right = ${layout.icon-padding}

ramp-volume-0 = 墳

; Bar
bar-volume-format = ${layout.bar-format}
bar-volume-foreground-0 = ${color.green}

bar-volume-width = 6
bar-volume-fill = ${layout.bar-fill-icon}
bar-volume-indicator =
bar-volume-empty = ${layout.bar-fill-icon}

; Muted
format-muted = <label-muted>
format-muted-background = ${color.module-bg}
format-muted-foreground = ${color.orange}
format-muted-padding = ${layout.module-padding}

format-muted-prefix = 婢
format-muted-prefix-font = ${layout.icon-font}
format-muted-prefix-foreground = ${color.text-fg}
format-muted-prefix-padding-right = ${layout.icon-padding}

label-muted = muted


[module/battery]
; Use the following command to list batteries and adapters:
; $ ls -1 /sys/class/power_supply/
type = internal/battery
inherit = generic-format-style

battery = BAT0
adapter = AC
full-at = 99

label = %percentage%%

; Discharging
label-discharging = ${self.label}
label-discharging-background = ${color.module-bg}

format-discharging = <ramp-capacity><label-discharging>
format-discharging-background = ${color.module-bg}
;format-discharging-padding = ${layout.module-padding}

; Capacity
ramp-capacity-font = ${layout.icon-font}
ramp-capacity-foreground = ${color.yellow}
ramp-capacity-background = ${color.module-bg}
ramp-capacity-padding-right = ${layout.icon-padding}

ramp-capacity-0-foreground = ${color.fg}
ramp-capacity-1-foreground = ${color.fg}
ramp-capacity-0-background = ${color.red}
ramp-capacity-1-background = ${color.red}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-5 = 
ramp-capacity-6 = 
ramp-capacity-7 = 
ramp-capacity-8 = 
ramp-capacity-9 = 
ramp-capacity-10 = 

; Charging
label-charging = ${self.label-discharging}

format-charging = <label-charging>
format-charging-background = ${color.module-bg}
;format-charging-padding = ${layout.module-padding}

format-charging-prefix = 
format-charging-prefix-foreground = ${color.green}
format-charging-font = ${layout.icon-font}

; Full
label-full = %percentage%%

format-full = <label-full>
format-full-background = ${color.module-bg}
;format-full-padding = ${layout.module-padding}

format-full-prefix = 
format-full-prefix-font = ${layout.icon-font}
format-full-prefix-foreground = ${color.green}
format-full-prefix-padding-right = ${layout.icon-padding}


[module/wattage]
inherit = module/battery

; Discharging
format-discharging = <label-discharging>

format-discharging-prefix = 
format-discharging-prefix-font = ${layout.icon-font}
format-discharging-prefix-foreground = ${color.icon-fg}
format-discharging-prefix-padding-right = ${layout.icon-padding}

label-discharging = -%consumption:0:4% W

; Charging
format-charging = <label-charging>

format-charging-prefix = ${self.format-discharging-prefix}
format-charging-prefix-font = ${layout.icon-font}
format-charging-prefix-foreground = ${color.yellow}
format-charging-prefix-padding-right = ${layout.icon-padding}

label-charging = +%consumption:0:4% W


[module/updates]
; https://github.com/jaagr/polybar/wiki/User-contributed-modules
; modified to hide if no updates available
inherit = format-glyphs-top-right
type = custom/script
interval = 1200
format = <label>
; format-underline = #dc322f
label = "%output:0:30%"
exec = .config/polybar/scripts/check_updates.sh
exec-if = "ping -q -w 2 -c 1 1.1.1.1 > /dev/null"

; Full
format-full =

; }}}

; polybar settings {{{

;  ____               ____       _   _   _                 
; | __ )  __ _ _ __  / ___|  ___| |_| |_(_)_ __   __ _ ___ 
; |  _ \ / _` | '__| \___ \ / _ \ __| __| | '_ \ / _` / __|
; | |_) | (_| | |     ___) |  __/ |_| |_| | | | | (_| \__ \
; |____/ \__,_|_|    |____/ \___|\__|\__|_|_| |_|\__, |___/
;                                                |___/     

[settings]
; Reload upon receiving XCB_RANDR_SCREEN_CHANGE_NOTIFY events
screenchange-reload = true

; }}}

; vim:filetype=dosini:foldmethod=marker
