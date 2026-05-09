#!/bin/bash

data=$(curl -s "wttr.in/Mexico%20City?format=j1")

temp=$(echo "$data" | jq '.current_condition[0].temp_C' | tr -d '"')
desc=$(echo "$data" | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"')
wind=$(echo "$data" | jq '.current_condition[0].windspeedKmph' | tr -d '"')

# Iconos estilo hacker
if [[ $desc == *"Rain"* ]]; then
  icon="🌧"
elif [[ $desc == *"Cloud"* ]]; then
  icon="☁"
elif [[ $desc == *"Clear"* ]]; then
  icon=""
else
  icon="☁"
fi

echo "{\"text\":\"$icon $temp°C\",\"tooltip\":\"$desc | 🌬 $wind km/h\"}"
