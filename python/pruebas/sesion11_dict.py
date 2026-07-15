try:
    datos = {"nombre": "Ana", "edad": "22"}
    print (f"{datos['nombre']} tiene {datos['edad']} años y vive en {datos['ciudad']}")
    print(datos['arbol'])   
except KeyError:
    print(f"Error: La clave no existe en el diccionario.")


