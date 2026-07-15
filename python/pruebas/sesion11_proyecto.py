print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")


nombre = input("Nombre: ")
numero = input("Número: ")
categoria = input("Categoria (trabajo, familia, amigos): ")
datos = {"nombre": nombre, "numero": numero, "categoria": categoria}
print("= Contacto guardado =")
for clave, valor in datos.items():
    print(f"{clave}: {valor}")

print("====================")