#!/bin/bash

# Personal Learning Logger V5
# Autor: cero984
# Fecha de inicio: 2026-05-13

# Protección con set

set -euo pipefail

   if [ ! -f "study_log.txt" ]; then
   echo "Error: no se encontró study_log.txt"
   echo "El script necesita ese archivo para continuar."
    exit 1 
   fi
# --- FUNCIÓN AGREGAR ---

agregar() {
    echo "=== Learning Logger ==="
    echo "Registrando nueva sesión de estudio..."
    echo ""

    read -p "¿Qué materia estudiaste? (terminal/ingles/ia): " MATERIA
    read -p "¿Cuántos minutos estudiaste?: " DURACION
    read -p "¿Qué aprendiste hoy?: " NOTAS

    if [ -z "$MATERIA" ] || [ -z "$DURACION" ] || [ -z "$NOTAS" ]; then
        echo ""
        echo "Error: todos los campos son obligatorios."
        exit 1
    fi

    FECHA=$(date "+%Y-%m-%d %H:%M")
    echo "[$FECHA] | $MATERIA | $DURACION min | $NOTAS" >> $HOME/aprendizaje/learning-logger/study_log.txt
    echo ""
    echo "Sesión guardada correctamente."

    TOTAL=$(wc -l < $HOME/aprendizaje/learning-logger/study_log.txt)
    echo "Total de sesiones registradas: $TOTAL"
}

# --- FUNCIÓN REPORTE DIARIO ---
reporte() {
    HOY=$(date "+%Y-%m-%d")

    echo ""
    echo "REPORTE DE HOY ($HOY)"
    echo "=========================="
    echo ""

    SESIONES=$(grep "$HOY" $HOME/aprendizaje/learning-logger/study_log.txt| wc -l) || true
    echo "Sesiones de hoy: $SESIONES"

    MINUTOS=$(grep "$HOY" $HOME/aprendizaje/learning-logger/study_log.txt| cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma}') || true
    echo "Minutos totales: $MINUTOS min"

    echo ""
    echo "Desglose por materia:"

    TERM=$(awk -v fecha="$HOY" -F"|" '{ gsub(/ /, "", $2); if ($1 ~ fecha && $2 == "terminal") suma += $3 } END { print suma }' ~/aprendizaje/learning-logger/study_log.txt)    
    echo "Terminal: $TERM min"

    ING=$(awk -v fecha="$HOY" -F"|" '{ gsub(/ /, "", $2); if ($1 ~ fecha && $2 == "ingles") suma += $3 } END { print suma }'  ~/aprendizaje/learning-logger/study_log.txt)
    echo "Ingles: $ING min"

    IA=$(awk -v fecha="$HOY" -F"|" '{ gsub(/ /, "", $2); if ($1 ~ fecha && $2 == "ia") suma += $3 } END { print suma }'  ~/aprendizaje/learning-logger/study_log.txt)
    echo "IA: $IA min"


   echo ""
}

# --- FUNCIÓN REPORTE SEMANAL ---
semanal() {
    HACE_7_DIAS=$(date -d "7 days ago" "+%Y-%m-%d")
    HOY=$(date "+%Y-%m-%d")

    echo ""
    echo "REPORTE SEMANAL ($HACE_7_DIAS a $HOY)"
    echo "=================================="
    echo ""

    FILTRADO=$(awk -v desde="$HACE_7_DIAS" -v hasta="$HOY" '{
        fecha=substr($0, 2, 10)
        if (fecha >= desde && fecha <= hasta) print $0
    }' $HOME/aprendizaje/learning-logger/study_log.txt)

    SESIONES=$(echo "$FILTRADO" | grep -c ".")
    echo "Sesiones en 7 días: $SESIONES"

    MINUTOS=$(echo "$FILTRADO" | cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma+0}')
    echo "Minutos totales: $MINUTOS min"

    echo ""
    echo "Desglose por materia:"

    echo "$FILTRADO" | awk -F"|" '{gsub(/[^0-9]/, "", $3); array[$2] += $3} END {for (key in array) print "Tiempo de"key, array[key] " min"}'

    echo ""
}

# --- MENÚ PRINCIPAL ---
ACCION=$1

if [ "$ACCION" = "agregar" ]; then
    agregar
elif [ "$ACCION" = "reporte" ]; then
    reporte
elif [ "$ACCION" = "semanal" ]; then
    semanal
else
    echo "Uso: ./logger.sh [agregar|reporte|semanal]"
fi
