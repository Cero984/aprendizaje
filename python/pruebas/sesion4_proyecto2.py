print("===== REPORTE DE PRODUCTOS =====")

productos = [
     ("Laptop", 15000),
     ("Mouse", 350),
     ("Teclado", 850)
]

def clasificar(precio):
    if precio > 1000:
        return "Caro"
    else:
        return "Accesible"


def imprimir_reporte(productos):
    for i, (producto, precio) in enumerate(productos, 1):
        esta = clasificar(precio)
        print(f"{i}. {producto} -${precio} - {esta}")

imprimir_reporte(productos)
print("================================")

