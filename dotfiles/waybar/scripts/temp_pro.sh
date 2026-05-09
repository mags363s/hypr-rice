#!/bin/bash

temp=$(sensors | grep -m 1 "Package id 0" | awk '{print $4}' | tr -d '+°C')

if [ -z "$temp" ]; then
  exit
fi

temp=${temp%.*}

# colores por rango
if [ "$temp" -lt 50 ]; then
  icon_color="#00ff99"
elif [ "$temp" -lt 65 ]; then
  icon_color="#ffcc00"
else
  icon_color="#ff0033"
fi

# icono con color + texto blanco
text="<span foreground='#ffffff'>${temp}°C</span>"

icon="<span foreground='${icon_color}'></span>"

echo "{\"text\":\"$icon $text\",\"format\":\"pango\"}"