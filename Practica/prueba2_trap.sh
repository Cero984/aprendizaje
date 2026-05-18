#!/bin/bash
set -euo pipefail
TEMP=$(mktemp)
trap "rm -f $TEMP; echo 'Script terminado'" EXIT
trap "rm -f $TEMP; echo 'Interrumpido pot Ctrl+C'" INT
sleep 4
echo "esto se imprime?"
