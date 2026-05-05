#!/bin/bash
set -e
set -u
set -o pipefail

FUENTE="sesiones.txt"
DESTINO="/tmp/backup_prueba.txt"
cp "$FUENTE" "$DESTINO"
ls "$DESTINO"
cat  cercero_archive | sort
wc -l "$DESTINO"


