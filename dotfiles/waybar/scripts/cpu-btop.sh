#!/bin/bash
# Abre kitty flotando y ejecuta btop
hyprctl dispatch exec "[float;center;size 900 600] kitty -e btop"

