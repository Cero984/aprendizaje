# Contactos.py

## Resumen

El script facilita el registro de contactos y los guarda, permite buscar por categorías y persiste entre las ejecuciones, permitiendo agregar más contactos sin perder los anteriores.

## Cómo correrlo

```bash
python3 contactos.py
```

El programa pide, en este orden:

1. **Nombre del contacto** — con qué nombre distintivo le gustaría guardarlo.
2. **Número del contacto** — qué número se guarda afiliado a ese nombre.
3. **Categoría** — a qué categoría base pertenece ese contacto (`trabajo`, `familia`, `amigos`).
4. **Pregunta de continuidad** — para saber si se desea agregar otro contacto o el loop se detiene ahí.
5. **Pregunta de filtrado** — para saber si desea conocer los contactos y números de una determinada categoría. Si responde que sí, se le pide la categoría específica a buscar, y esto se puede repetir varias veces mientras siga respondiendo que sí.

## Ejemplo de uso

```
Nombre del contacto: Sara
numero del contacto: 2222
Categoria del contacto (trabajo, familia, amigos): amigos
¿Continuar agregando? (si/no): no
¿Desea clasificar los contactos? (si/no): si
Ingrese la categoría a filtrar (trabajo, familia, amigos): amigos

Contactos en la categoría 'amigos':
========================
1. Sara - 2222
========================
```

## Funciones

- `clasificar(categoria)` — convierte una categoría a su versión de despliegue en mayúsculas (por ejemplo, "trabajo" → "TRABAJO").
- `listado_guardar(datos)` — muestra cómo quedan los contactos con sus números y categoría, para ver cómo va tu lista de contactos.
- `registro_contactos(datos)` — guarda los nuevos datos agregados en un archivo .json.
- `filtrar_por_categoria(datos, categoria)` — muestra tus contactos en las categorías que le pidas que te muestre.

## Estructura del dato

Cada contacto se guarda como un diccionario con tres campos:

```json
{"persona": "Sara", "numero": "2222", "categoria": "amigos"}
```

`contactos.json` contiene una lista de estos diccionarios, uno por contacto.

## Archivos que genera

En caso de que el archivo `contactos.json` no exista, se creará uno donde se guardarán los contactos. Si se quiere borrar para empezar de nuevo, hay que hacerlo desde la terminal con:

```bash
rm contactos.json
```

Esto borrará todos los contactos y datos guardados de forma permanente.

## Manejo de errores

El guardado está protegido con `try/except` para casos de `FileNotFoundError` (problemas al acceder al archivo) y `PermissionError` (falta de permisos de escritura).

## Requisitos

- Python 3
- Sin librerías externas — usa `json` y `os`, ambas parte de la librería estándar.

## Estado del proyecto

Proyecto de cierre del Trimestre 1 del roadmap de Python (junio-julio 2026). Cubre: variables, condicionales, loops, funciones, manejo de archivos, `try/except`, diccionarios, list comprehensions, y persistencia con `json`.

Próximo trimestre: integración con APIs (`requests`, Claude API / OpenAI API) para dar el salto hacia agentes simples.