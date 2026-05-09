#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)
status=$(playerctl status 2>/dev/null)

# ❌ si no hay player o está detenido → ocultar todo
if [ -z "$player" ] || [ "$status" = "Stopped" ]; then
  echo ""
  exit
fi

# 🎵 detectar tipo
if [[ "$player" == *"spotify"* ]]; then
  icon=" "
  class="spotify"

elif [[ "$player" == *"firefox"* || "$player" == *"chrome"* ]]; then
  icon=" "
  class="youtube"

else
  icon=" "
  class="default"
fi

# 🎯 salida
echo "{\"text\": \"$icon\", \"class\": \"$class\"}"