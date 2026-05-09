#!/bin/bash

sed -e 's/ERROR/⚠️  ERROR/g' -e 's/INFO/✅ INFO/g' logs.txt > logs_limpios.txt
cat logs_limpios.txt
