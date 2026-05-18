#!/bin/bash
read -p "Seleccione un archivo: " USUARIO
ARCHIVO=$(mktemp)
trap "rm -f $ARCHIVO" EXIT
trap "echo 'Interrumpido con Ctrl+C'; exit 1" INT
if [ ! -f "$USUARIO" ]; then
    echo "Archivo no encontrado"
    exit 1
fi
wc -l "$USUARIO" > "$ARCHIVO"
sleep 4
cat "$ARCHIVO"
