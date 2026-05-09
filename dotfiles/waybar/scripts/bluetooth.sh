#!/bin/bash
# Script para waybar bluetooth personalizado

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
    echo "" # Icono bluetooth apagado (requiere FontAwesome)
elif [ $(bluetoothctl info | grep "Connected: yes" | wc -l) -eq 0 ]; then
    echo "" # Icono bluetooth encendido, sin conexión
else
    echo "" # Icono bluetooth conectado
fi

