import os
print("Directorio actual:", os.getcwd())

archivos = os.listdir(".")
print("Archivos aqui:", archivos)

print("¿Existe contactos.txt?:", os.path.exists("contactos.txt"))