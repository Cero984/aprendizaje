
#!/bin/bash

# Sistema de Notas
# Autor:cero984
# Fecha de inicio:2026-03-31


# $1 es el primer parametro que el usuario escribe después del script
ACCION=$1

if [ "$ACCION" = "agregar" ]; then
    read -p "Categoría (bash/git/conceptos): " CATEGORIA
    read -p "Nota:" NOTA
    FECHA=$(date "+%Y-%m-%d %H:%M")
    echo "[$FECHA]|$CATEGORIA|$NOTA" >> notas.txt
    echo "✅ Nota guardada."
 
elif [ "$ACCION" = "ver" ]; then
     echo "" 
     echo "📋 Todas tus notas:"
     echo "-----------------------------"
     cat notas.txt

elif [ "$ACCION" = "buscar" ]; then
    PALABRA=$2
    echo ""
    echo "🔍 Buscando: $PALABRA"
    echo "------------------------------"
    grep -i "$PALABRA" notas.txt

else

  echo "❌ Uso: ./notas.sh [agregar|ver|buscar]"

fi
