with open("texto.txt", "w") as f:
    f.write("Linea 1, en texto.txt")
    f.write("\nLinea 2, en texto.txt")
    f.write("\nLinea 3, en texto.txt")
 
with open("texto.txt", "a") as f:
    f.write("\nLinea 4, agregada al final del archivo, sin borrar")

with open("texto.txt", "r") as f:
    contenido = f. readlines()


def lista(contenido):
    for i, linea in enumerate(contenido, 1):
        print(f"{i}. {linea.strip()} ")

lista(contenido)
