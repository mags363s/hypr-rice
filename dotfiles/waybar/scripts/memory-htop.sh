#!/bin/bash
# Abre kitty flotando y ejecuta htop
hyprctl dispatch exec "[float;center;size 900 600] kitty -e htop"

