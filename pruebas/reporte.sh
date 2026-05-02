reporte() {
awk '{array[$3] += $4} END {for (key in array) print key, array[key]}' sesiones.txt

awk '{total +=$4} END {print "Total minutos: " total}' sesiones.txt

awk 'BEGIN { max_minutos = 0 } { if ($4 > max_minutos) { max_minutos = $4; dia_max = $2 } } END { print "Día más producivo:" dia_max, max_minutos " minutos" }' sesiones.txt
}

ACCION=$1

if [ "$ACCION" = "reporte" ]; then
echo "=== REPORTE SEMANAL ==="
echo "Total por tema:"
reporte

else 
 echo "escribe |reporte|"
fi
