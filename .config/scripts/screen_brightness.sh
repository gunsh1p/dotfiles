#!/usr/bin/env fish

set current_brightness (xrandr --verbose | grep "Brightness: " | sed "s/Brightness: //" | xargs)
set new_brightness (math $current_brightness $argv[1])
set brightness_check (math "$new_brightness * 100")

if [ $brightness_check -lt 10 ]
	set new_brightness (math 1/10)
end

if [ $brightness_check -gt 100 ]
	set new_brightness 1
end

xrandr --output (xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $new_brightness
