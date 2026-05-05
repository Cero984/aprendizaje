#!/bin/bash

# Validar que se puso algo
validar() { [ -n "$1" ] && return 0 || return 1;}

# Varibles Matemáticas
sumar() {
   if  validar "$1"; then
    echo $(( $1 + $2 ))
   else
    echo "error"
   fi
}

restar() {
   if validar "$1"; then
    echo $(( $1 - $2 ))
   else
    echo "error"
   fi 
}

multiplicar() {
   if validar "$1"; then
    echo $(( $1 * $2 ))
   else
    echo "error"
   fi
}

# Uso, acción
ACCION=$1

 if [ "$ACCION" = sumar ]; then
    sumar "$2" "$3"

 elif [ "$1" = restar ]; then
    restar "$2" "$3"

 elif [ "$1" = multiplicar ]; then
    multiplicar "$2" "$3"

 else
  echo "seleccione una operacion (sumar, restar, multiplicar)" 
 fi
