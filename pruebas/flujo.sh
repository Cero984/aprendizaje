#!/bin/bash

# Preparar
read -p "Ponga un archivo: " RECIBIDO

# Proteger
set -euo pipefail
trap "echo 'Script terminado'" EXIT

# Validar
if [ ! -f "$RECIBIDO" ]; then
    echo "Ponga un archivo existente"
    exit 1

elif ! grep -qi "error" "$RECIBIDO"; then
   echo "Archivo sin error"
   exit 1
fi 

# Procesar 
TOTAL=$(grep -ci "error" "$RECIBIDO")

# Mostrar
echo "Conteo terminado"
echo "Lineas:$TOTAL"

