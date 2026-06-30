print("===== CONTACTOS =====")
datos = [
    ("Ana", "5512345678", "trabajo"),
    ("Carlos", "5598765432", "trabajo"),
    ("Papá", "5511223344", "familia"),
    ("Zack", "5544332211", "amigos")
]

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
    with open("contactos.txt", "w") as f:
      for i, (persona, numero, categoria) in enumerate(datos, 1):
          es = clasificar(categoria)
          f.write(f"{es}\n")
          f.write(f"{i}.{persona} -{numero}\n")
    
      
registro_contactos(datos)
listado_guardar(datos)
print("======================")
print("Datos mandados a: contactos.txt")