#!/bin/bash
trap "echo 'Script Terminado'" EXIT
trap "echo 'Hubo un error'" ERR

ls archivo_que_no_existe

echo "Script terminado"
