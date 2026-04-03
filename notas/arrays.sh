#!/bin/bash

# Praćtica de arrays

MATERIAS=("bash" "git" "conceptos" "ia")

echo "Primera materia: ${MATERIAS[0]}"
echo "Tercera materia: ${MATERIAS[2]}"
echo "Todas: ${MATERIAS[@]}"
echo "Total de materias: ${#MATERIAS[@]}"

echo ""
echo "--- Recoriendo con loop ---"
for MATERIA in "${MATERIAS[@]}"; do
    echo "📚 $MATERIA"
done

