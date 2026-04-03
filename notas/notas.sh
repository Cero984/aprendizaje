
#!/bin/bash

# Sistema de Notas
# Autor:cero984
# Fecha de inicio:2026-03-31

# Categorias validas
CATEGORIAS=("bash" "git" "conceptos" "ia" "terminal")

# --- FUNCIONES ---

agregar () {
read -p "Categoría (bash/git/conceptos): " CATEGORIA
}
rapido() {
    CATEGORIA=$1
    NOTA=$2
  

# Validar que la categoria existe en el array
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
echo "✅ Nota guardada."
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

else 
    echo "❌ Uso: ./notas.sh [agregar|ver|buscar]"
fi
