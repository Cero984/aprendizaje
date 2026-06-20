print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")

print("===== REGISTRO =====")
datos =[
    ("vaso", 75),
    ("plastilina", 100),
    ("veladora", 150),
    ("caja de cerillos", 50),
    ("encenderor", 200)
    ]

def listado(datos):
   for i, (producto, precio) in enumerate(datos, 1):
      print(f"{i}. {producto} - ${precio}")

def registro(datos):
    with open("registro.txt", "w") as f:
      for producto, precio in datos:
       f.write(f"{producto} -${precio}\n")

listado(datos)
registro(datos)
print("====================")