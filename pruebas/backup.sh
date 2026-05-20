#!/bin/bash
set -e
set -u
set -x
set -o pipefail

FUENTE="sesiones.txt"
DESTINO="/tmp/backup_prueba.txt"
cp "$FUENTE" "$DESTINO"
ls "$DESTINO"
wc -l "$DESTINO"
