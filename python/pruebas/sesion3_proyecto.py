print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")

ryzen = ["Ryzen 3", "Ryzen 5", "Ryzen 7", "Ryzen 9"]
nota = "< Este es la mejor gama de cada generacion"
for i, procesador in enumerate(ryzen, 1):
    if procesador in ["Ryzen 3", "Ryzen 5", "Ryzen 7"]:
        print(f"{i}. {procesador}")
    else:
        print(f"{i}. {procesador} {nota}")

print("")