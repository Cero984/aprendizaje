print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")

tareas = []
tarea = ""
while tarea != "listo":
    tarea = input("Ingresa las tareas: ")
    if tarea != "listo":
        tareas.append(tarea)
    else:
        print("===== TUS TAREAS =====")
        for i, tarea_s in enumerate(tareas, 1):
          print(f"{i}.-{tarea_s}")
     
