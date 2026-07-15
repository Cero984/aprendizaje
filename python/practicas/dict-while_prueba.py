datos = []
dato = ""
while dato != "no":
    nombre = input("Ingrese el nombre: ")
    numero = input("Ingrese el número: ")
    categoria = input("Ingrese la categoría: ")
    if categoria not in ["amigos", "familia", "trabajo"]:
        print("Categoría inválida. Por favor, ingrese 'amigos', 'familia' o 'trabajo'.")
        continue
    datos.append({"nombre": nombre, "numero": numero, "categoria": categoria})
    dato = input("¿Desea ingresar otro dato? (si/no): ")

for i, datos_p in enumerate(datos, 1):
    print(f"{i}. Nombre: {datos_p['nombre']}, Número: {datos_p['numero']}, Categoria: {datos_p['categoria']}")