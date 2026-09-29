import requests

for i in range(3):
    try:
        respuesta = requests.get("https://api.github.com", timeout=0.001)
        print(f"Intento {i+1}: Status: {respuesta.status_code}")
        break
    except requests.exceptions.ConnectionError:
        print(f"Intento {i+1}: Error de conexión, reintentando...")
    except requests.exceptions.Timeout:
        print(f"Intento {i+1}: Tiempo de espera agotado, reintentando...")
else:
    print("No se pudo completar la petición después de 3 intentos")