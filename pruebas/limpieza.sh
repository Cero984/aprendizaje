#!/bin/bash

ARCHIVO="/tmp/temporal.txt"

trap "rm -f $ARCHIVO; echo 'Funciono'" EXIT



echo "Paso 1- Tratado"
echo "Contenido temporal" > "$ARCHIVO"
echo "Archivo creado: $ARCHIVO"
sleep 5
echo "Finalizado"
