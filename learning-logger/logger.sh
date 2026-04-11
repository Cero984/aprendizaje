#!/bin/bash
# Personal Learning Logger v2
# Autor: cero984
# Fecha de inicio: 2026-03-29

# --- FUNCIÓN AGREGAR ---
agregar() {
    echo "=== 📚 Learning Logger ==="
    echo "Registrando nueva sesión de estudio..."
    echo ""
    
    # Capturar datos
    read -p "¿Qué materia estudiaste? (terminal/ingles/ia): " MATERIA
    read -p "¿Cuántos minutos estudiaste?: " DURACION
    read -p "¿Qué aprendiste hoy?: " NOTAS
    
    # Validar que no haya campos vacíos
    if [ -z "$MATERIA" ] || [ -z "$DURACION" ] || [ -z "$NOTAS" ]; then
        echo ""
        echo "❌ Error: todos los campos son obligatorios."
        exit 1
    fi
    
    # Fecha y hora automática
    FECHA=$(date "+%Y-%m-%d %H:%M")
    
    # Guardar en el archivo
    echo "[$FECHA] | $MATERIA | $DURACION min | $NOTAS" >> study_log.txt
    echo ""
    echo "✅ Sesión guardada correctamente."
    
    # Contar sesiones totales
    TOTAL=$(wc -l < study_log.txt)
    echo "📊 Total de sesiones registradas: $TOTAL"
}

# --- FUNCIÓN REPORTE ---
reporte() {
    HOY=$(date "+%Y-%m-%d")
    
    echo ""
    echo "📊 REPORTE DE HOY ($HOY)"
    echo "=========================="
    echo ""
    
    # Sesiones de hoy
    SESIONES=$(grep "$HOY" study_log.txt | wc -l)
    echo "📝 Sesiones de hoy: $SESIONES"
    
    # Minutos totales de hoy
    MINUTOS=$(grep "$HOY" study_log.txt | cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma}')
    echo "Minutos totales: $MINUTOS min"
    
    echo ""
    echo "Desglose por materia:"
    
    # Terminal
    TERM=$(grep "$HOY" study_log.txt | grep "terminal" | cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma +0}')
    echo "Terminal: $TERM min"
    
    # Inglés
    ING=$(grep "$HOY" study_log.txt | grep "ingles" | cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma+0}')
    echo "Inglés: $ING min"
    
    # IA
    IA=$(grep "$HOY" study_log.txt | grep "ia" | cut -d"|" -f3 | tr -d ' min' | awk '{suma += $1} END {print suma+0}')
    echo "IA: $IA min"
    
    echo ""
}

# --- MENÚ PRINCIPAL ---
ACCION=$1

if [ "$ACCION" = "agregar" ]; then
    agregar
elif [ "$ACCION" = "reporte" ]; then
    reporte
else
    echo "❌ Uso: ./logger.sh [agregar|reporte]"
fi
