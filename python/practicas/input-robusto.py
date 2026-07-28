texto_s = "  Trabajo  "
resultado = texto_s.lower().strip()
print(resultado)

def limpieza(texto): 
   texto = texto.strip()
   texto = texto.lower()
   return texto

print(limpieza(texto_s))