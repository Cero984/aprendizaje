from dotenv import load_dotenv
import os
import requests

load_dotenv()
api_key = os.getenv("API_KEY_GEMINI")


if api_key is None:
    print("ERROR")
    exit (1)
else:
    for i in range(3):    
        try:
            respuesta = requests.post(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.8-flash:generateContent",
            headers={
                "x-goog-api-key": api_key,
                "Content-Type": "application/json"
            },
            json={"contents": [{"parts": [{"text": "tu prompt aquí"}]}]},
            timeout=10
            )
            respuesta.raise_for_status()
            print(f"Intento {i+1}: Status: {respuesta.status_code}")
            break
        except requests.exceptions.HTTPError as e:
            if respuesta.status_code == 503:
                print(f"Intento {i+1}: Servicio no disponible, reintentando...")
            else:
                print(f"Intento {i+1}: Error HTTP {respuesta.status_code}, no reintentable")
                raise
        except requests.exceptions.ConnectionError:
            print(f"Intento {i+1}: Error de conexión, reintentando...")
        except requests.exceptions.Timeout:
            print(f"Intento {i+1}: Tiempo de espera agotado, reintentando...")
    else:
       print("No se pudo completar la petición después de 3 intentos")


if respuesta.status_code == 200:
    datos = respuesta.json()["candidates"][0]["content"]["parts"][0]["text"]
    print(f"Datos: {datos}")
    exit(0)
else:
    print("Error desconocido")
    print(respuesta.text)
    exit(1)