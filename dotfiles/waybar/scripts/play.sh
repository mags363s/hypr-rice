#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
  echo ""
  exit
fi

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  icon="⏸"
  class="play"
else
  icon="▶"
  class="pause"
fi

echo "{\"text\":\"$icon\",\"class\":\"$class\"}"
