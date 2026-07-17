print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")

datos = [
    {"nombre": "Ana", "numero": "555-1234", "categoria": "trabajo"},
    {"nombre": "Luis", "numero": "555-5678", "categoria": "familia"},
    {"nombre": "Sol", "numero": "555-9999", "categoria": "trabajo"}
]

trabajo = [contacto['nombre'] for contacto in datos if contacto["categoria"] == "trabajo"]
familia = [contacto['nombre'] for contacto in datos if contacto["categoria"] == "familia"]
amigos = [contacto['nombre'] for contacto in datos if contacto["categoria"] == "amigos"]

print(f"Trabajo: {trabajo}")
print(f"Familia: {familia}")
print(f"Amigos: {amigos}")
