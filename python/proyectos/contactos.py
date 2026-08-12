import json
import os

datos = []

if os.path.exists("contactos.json"):
    with open("contactos.json", "r") as f:
        datos = json.load(f)
    print(f"Se cargaron {len(datos)} contactos existentes.")


continuar = ""
while continuar != "no":
    persona = input("Nombre del contacto: ")
    numero = input ("numero del contacto: ")
    categoria = input("Categoria del contacto (trabajo, familia, amigos): ")
    categoria = categoria.lower().strip()
    if categoria not in ["trabajo", "familia", "amigos"]:
        print("Error en la categoria")
        continue    
    datos.append({"persona": persona, "numero": numero, "categoria": categoria})
    continuar = input("¿Continuar agregando? (si/no): ")

def clasificar(categoria):
    if categoria == "trabajo":
       return "TRABAJO"
    elif categoria == "familia":
       return "FAMILIA"
    elif categoria == "amigos":
        return "AMIGO"

def listado_guardar(datos):
    for i, contacto in enumerate(datos, 1):
        es = clasificar(contacto["categoria"])
        print(f"{es}:")
        print(f"{i}.{contacto['persona']} -{contacto['numero']}")

def registro_contactos(datos):
        try:
            with open("contactos.json", "w") as f:
                json.dump(datos, f)
        except FileNotFoundError:
            print("Error: Archivo no existente")

def filtrar_por_categoria(datos, categoria):
   return [contactos for contactos in datos if contactos["categoria"] == categoria]

clasificar_categorias = ""
while clasificar_categorias != "no":
    clasificar_categorias = input("¿Desea clasificar los contactos? (si/no): ")
    if clasificar_categorias == "si":
        categoria = input("Ingrese la categoría a filtrar (trabajo, familia, amigos): ")
        categoria = categoria.lower().strip()
        contactos_filtrados = filtrar_por_categoria(datos, categoria)
        if contactos_filtrados:
            print("")
            print(f"Contactos en la categoría '{categoria}':")
            print("========================")
            for i, contacto in enumerate(contactos_filtrados, 1):
                print(f"{i}. {contacto['persona']} - {contacto['numero']}")
            print("========================")
        else:
            print(f"No se encontraron contactos en la categoría '{categoria}'.")
    elif clasificar_categorias == "no":
        print("No se clasificaron los contactos.")
        break
    else:
        print("Opción inválida. Por favor, ingrese 'si' o 'no'.")


registro_contactos(datos)
print("======================")
listado_guardar(datos)
print("======================")
print("Datos mandados a: contactos.json")