from dotenv import load_dotenv
import os
import requests

load_dotenv()
api_key = os.getenv("GITHUB_TOKEN")

if api_key is None:
    print("ERROR")
    exit(1)
else:
    respuesta = requests.get("https://api.github.com/user", headers={"Authorization": f"Bearer {api_key}"})

print(f"Status: {respuesta.status_code}")
if respuesta.status_code == 200:
    datos = respuesta.json()
    print("Autenticación correcta")
    print("Sin problemas, enlace exitoso")
    print(f"Nombre de usuario: { datos['login']}")
elif respuesta.status_code == 401:
    print("Error: no se pudo autenticar")
    exit(1)
else:
    print("Error desconocido")
    print("Mandando informe de error")
    exit(1)