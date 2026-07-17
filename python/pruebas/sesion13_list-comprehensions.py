numeros = [1,2,3,4,5,6,7,8,9,10]

par = [pares for pares in numeros if pares % 2 == 0]
impar = [impares for impares in numeros if impares % 2 != 0]

print("Los números pares son: ", par)
print("Los números impares son: ", impar)


datos = [
    {"nombre": "Ana", "numero": "555-1234", "categoria": "trabajo"},
    {"nombre": "Luis", "numero": "555-5678", "categoria": "familia"},
    {"nombre": "Sol", "numero": "555-9999", "categoria": "trabajo"}
]

trabajo = [contacto for contacto in datos if contacto["categoria"] == "trabajo"]
print(f"Los contactos de trabajo son: {trabajo}\n")