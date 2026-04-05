#!/bin/bash
source .env

# Personas validas
PERSONA_VALIDA=("RED32")

# FUNCION

inicio () {
read -p "Eres:" PERSONA

VALIDA=false
for CAT in "${PERSONA_VALIDA[@]}"; do
   if [ "$CAT" = "$PERSONA" ]; then
       VALIDA=true 
echo "-------------------------"
echo "Bienvenido $USUARIO"
echo "-------------------------"
echo ""
echo "Cargando.....$PROYECTO"
echo ""
echo "Echo Dirigiendo a directorio..."
echo " $LOG_DIR"  
echo ""
fi
done

   if [ "$VALIDA" = false ]; then
    echo "PERSONA NO VALIDA"
    exit 1
   fi
}


ACCION=$1

if [ "$ACCION" = "inicio" ]; then
    inicio
else
 echo "Diga quien es"
fi 
