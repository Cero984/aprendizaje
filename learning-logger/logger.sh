#!/bin/bash

# Personal Learning Logger
# Autor: cero984
# Fecha de inicio: 2026-03-29

echo "=== 📚 Learning Logger ==="
echo "Registrando nueva sesión de estudio..."
echo ""

# Capturar datos
read -p "¿Qué materia estudiaste? (terminal/ingles/ia): " MATERIA
read -p "¿Cuántos minutos estudiaste?: " DURACION
read -p "¿Qué aprendiste hoy?: " NOTAS

# Fecha y hora automática
FECHA=$(date "+%Y-%m-%d %H:%M")

# Guardar en el archivo
echo "[$FECHA] | $MATERIA | $DURACION min | $NOTAS" >> study_log.txt

echo ""
echo "✅ Sesión guardada correctamente."

#Contar sesiones totales
TOTAL=$(wc -l < study_log.txt)

echo "📊 Total de sesiones registradas: $TOTAL"

