import os
datos = []
continuar = ""
while continuar != "no":
    persona = input("Nombre del contacto: ")
    numero = input ("numero del contacto: ")
    categoria = input("Categoria del contacto (trabajo, familia, amigos): ")
    if categoria not in ["trabajo", "familia", "amigos"]:
        print("Error en la categoria")
        continue    
    datos.append((persona, numero, categoria))
    continuar = input("¿Continuar agregando? (si/no): ")

def clasificar(categoria):
    if categoria == "trabajo":
       return "TRABAJO"
    elif categoria == "familia":
       return "FAMILIA"
    elif categoria == "amigos":
        return "AMIGO"

def listado_guardar(datos):
    for i, (persona, numero, categoria) in enumerate(datos, 1):
        es = clasificar(categoria)
        print(f"{es}:")
        print(f"{i}.{persona} -{numero}")

def registro_contactos(datos):
    if os.path.exists("contactos.txt"):
        print("")
        print("Advertencia: contactos.txt ya existe. Sobreescribiendo...")
        print("===== CONTACTOS =====")
    else:
        print("")
        print("Creando archivo contactos.txt...")
        print("Escribiendo datos en contactos.txt...")
        print("===== CONTACTOS =====")
    try:
        with open("contactos.txt", "w") as f:
            for i, (persona, numero, categoria) in enumerate(datos, 1):
                es = clasificar(categoria)
                f.write(f"{es}\n")
                f.write(f"{i}.{persona} -{numero}\n")
    except FileNotFoundError:
        print("Error: Archivo no existente")
    except PermissionError:
        print("Error: Faltan permisos")
    else:
        print("Todo correcto")

registro_contactos(datos)
listado_guardar(datos)
print("======================")
print("Datos mandados a: contactos.txt")