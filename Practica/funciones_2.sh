#!/bin/bash
validar_edad() {

if [[ "$1" -lt 120 ]] && [[ "$1" -gt 0 ]]; then
   echo "Edad valida"
   return 0
else 
   echo "Edad invalida"
   return 1
fi
}

clasificar() {
validar_edad "$1"
local resultado=$?
if [ "$resultado" -eq  1 ]; then
   return 1
elif [ "$resultado" -eq 0 ]; then
  if [[ "$1" -lt 18 ]]; then
     echo "Menor de edad"
  elif [[ "$1" -ge 18 ]]; then
     echo "Mayor de edad" 
  fi
fi
}

read -p "Ponga su edad: " EDAD
clasificar "$EDAD"
