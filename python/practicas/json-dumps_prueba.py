import json

datos = {"nombre": "Ana", "edad": 22}


prueba = json.dumps(datos)
print(prueba)
print(type(prueba))


recuperado = json.loads(prueba)
print(recuperado)
print(type(recuperado))


contacto = {
    "nombre": "Luis",
    "telefonos": ["5512345678", "5598765432"],
    "categoria": "trabajo"
}


texto = json.dumps(contacto)
print(texto)
print(type(texto))


recuperado_contacto = json.loads(texto)
print(recuperado_contacto)
print(type(recuperado_contacto))


resultado = [recuperado_contacto["telefonos"][0]]
print(resultado)  # Output: ['5598765432']