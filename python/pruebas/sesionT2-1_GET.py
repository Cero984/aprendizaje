import requests

respuesta = requests.get("https://api.github.com/users/octocat")

print(f"Status: {respuesta.status_code}")
if respuesta.status_code == 200:
    datos = respuesta.json()
    print(f"Nombre de usuario: {datos['login']}")
    print(f"Repos públicos: {datos['public_repos']}")
else:
    print("Error: no se pudo obtener el perfil")
    exit(1)



respuesta = requests.get(
    "https://api.github.com/search/repositories",
    params={"q": "language:python", "sort": "stars"}
    )

print(f"Status: {respuesta.status_code}")
if respuesta.status_code == 200:
    datos = respuesta.json()
    print(f"{datos['items'][0]['name']}")
    print(f"total de repositorios: {datos['total_count']}")
else:
    print("Error: no se pudo obtener la lista de repositorios")
    exit(1)