#!/bin/bash

# Sistema de Notas
# Autor:cero984
# Fecha de inicio:2026-03-31

# Categorias validas
CATEGORIAS=("bash" "git" "conceptos" "ia" "terminal")

# --- FUNCIONES ---

agregar() {
read -p "Categoría (bash/git/conceptos): " CATEGORIA

VALIDA=false
for CAT in "${CATEGORIAS[@]}"; do
    if [ "$CAT" = "$CATEGORIA" ]; then
        VALIDA=true
    fi 
done

if [ "$VALIDA" = false ]; then
    echo "❌ Categoría inválida. Opciones: ${CATEGORIAS[@]}"
    exit 1
fi

read -p "Notas: " NOTA
FECHA=$(date "+%Y-%m-%d %H:%M")
echo "[$FECHA] | $CATEGORIA | $NOTA" >> notas.txt
echo "✅ Nota guardada."
}

rapido() {
    CATEGORIA=$1
    NOTA=$2

    VALIDA=false
    for CAT in "${CATEGORIAS[@]}"; do
        if [ "$CAT" = "$CATEGORIA" ]; then
            VALIDA=true
        fi
    done

    if [ "$VALIDA" = false ]; then
        echo "❌ Categoría inválida. Opciones: ${CATEGORIAS[@]}"
        exit 1
    fi

    FECHA=$(date "+%Y-%m-%d %H:%M")
    echo "[$FECHA] | $CATEGORIA | $NOTA" >> notas.txt
    echo "✅ Nota rápida guardada."
}

ver() {
echo ""
echo "📋 Todas tus notas:"
echo "------------------------"
cat notas.txt
}

buscar() {
PALABRA=$1
echo ""
echo "🔍 Buscando: $PALABRA"
echo "------------------------"
grep -i "$PALABRA" notas.txt
}

categoria() {
 CAT=$1
 echo ""
 echo "📂 Notas de categoria: $CAT"
 

 echo "------------------------"
 while IFS= read -r linea; do
   if echo "$linea"|grep -i "$CAT" > /dev/null; then
       echo "$linea"
   fi
  done < notas.txt
}

stats() {
echo ""
echo "📊 Estadísticas de tus notas"
echo "------------------------"

TOTAL=$(wc -l < notas.txt)
echo "Total de notas: $TOTAL"
 
echo ""
echo "Notas por categoría:"
cut -d"|" -f2 notas.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | while IFS= read -r linea; do
    echo " $linea"
done

echo ""
echo "ultima nota guardada:"
tail -1 notas.txt
}

# ---MENÚ PRINCIPAL --- 

ACCION=$1

if [ "$ACCION" = "agregar" ]; then
   agregar

elif [ "$ACCION" = "ver" ]; then
    ver

elif [ "$ACCION" = "buscar" ]; then
    buscar $2

elif [ "$ACCION" = "categoria" ]; then
     categoria $2

elif [ "$ACCION" = "-a" ]; then
     rapido $2 "$3"

elif [ "$ACCION" = "stats" ]; then
     stats

else 
    echo "❌ Uso: ./notas.sh [agregar|ver|buscar]"
fi

