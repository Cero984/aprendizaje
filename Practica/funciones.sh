#!/bin/bash

es_par() {
   if [ $(($1 % 2))  -eq 0 ]; then
       return 0
   else
       return 1
   fi
}

es_par 5
echo $?


mensaje="Hola mundo"

saludar() {
  local mensaje="Hello word"
  echo "Adentro:$mensaje"
}

saludar
echo "Afuera:$mensaje"



validar_numero() { [ -n "$1" ] && return 0 || return 1; }

calcular() {
    if validar_numero "$1"; then 
         echo $(( $1 * 2 ))
    else
         echo "Error"
    fi
}

calcular "5"
