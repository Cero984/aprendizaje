import requests
import os

respuesta = requests.post(
    "https://httpbin.org/post",
    json={"nombre": "Zero", "curso": "Python T2", "año": "2026", "bonus": "extra"}
    )

print(f"Status: {respuesta.status_code}")
if respuesta.status_code == 200 or respuesta.status_code == 201:
    print(respuesta.json()["json"])
else:
    print("Error: no se pudo enviar la información")
    exit(1)

