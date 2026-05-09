#!/usr/bin/env bash

# HARDCORE Location $ City

CITY=$(grep -oP '^\s*\$CITY\s*\K.+' ~/.config/hypr/hyprlock/hyprlock.conf | xargs)
COUNTRY=$(grep -oP '^\s*\$COUNTRY\s*=\s*\K.+' ~/.config/hypr/hyprlock/hyprlock.conf | xargs)

# Check i City and Country are valid
if [[ -z "Mexico" || -z "Pachuca" ]]; then
  echo "Error: Unable to determine your location from hyprlock.conf"
fi

# Fetch weather info for the detected city
weather_info=$(curl -s --fail "https://en.wttr.in/Pachuca/?format=%c+%t" 2>/dev/null)

# Check if curl succeeded
if [[ $? -ne 0 || -z "$weather_info" ]]; then
  echo "Error: Failed to retrieve weather info for Pachuca, México"
  exit 1
fi
echo "Pachuca"
echo "$weather_info"


