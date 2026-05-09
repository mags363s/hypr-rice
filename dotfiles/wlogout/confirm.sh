#!/usr/bin/env zsh

action=$1
name=$2

# Cerramos wlogout para que no interfiera con el foco de Zenity
pkill wlogout

# Inmediatamente lanzamos Zenity
zenity --question --text="¿Seguro que quieres $name?" --title="Confirmación" --modal --width=300

if [ $? -eq 0 ]; then
    eval "$action"
else
    # Si cancelas, REABRIMOS el menú de apagado automáticamente
    wlogout -b 4 &
fi


