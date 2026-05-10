#!/bin/bash

declare -A capitales
capitales[México]="CDMX"
capitales[Japón]="Tokyo"
capitales[Corea]="Seúl"

   echo ${!capitales[@]}
   echo ${capitales[@]}
