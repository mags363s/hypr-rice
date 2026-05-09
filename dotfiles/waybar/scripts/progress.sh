#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
  exit
fi

# detectar Spotify (único confiable)
if [[ "$player" == *"spotify"* ]]; then
  is_spotify=1
else
  is_spotify=0
fi

pos=$(playerctl position 2>/dev/null)
len=$(playerctl metadata mpris:length 2>/dev/null)

# 🎯 SOLO Spotify tiene barra real
if [ "$is_spotify" -eq 0 ]; then
  echo ""
  exit
fi

# seguridad
if [ -z "$pos" ] || [ -z "$len" ] || [ "$len" -le 0 ]; then
  echo ""
  exit
fi

len_sec=$(echo "$len / 1000000" | bc -l)
percent=$(echo "$pos / $len_sec * 100" | bc -l)

if (( $(echo "$percent < 0" | bc -l) )); then percent=0; fi
if (( $(echo "$percent > 100" | bc -l) )); then percent=100; fi

bar_len=5
filled=$(printf "%.0f" "$(echo "$percent/100*$bar_len" | bc -l)")

bar=""
for ((i=0; i<bar_len; i++)); do
  if [ $i -lt $filled ]; then
    bar+="▰"
  else
    bar+="▱"
  fi
done

echo "$bar"