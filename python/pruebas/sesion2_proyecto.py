print("===================")
print("  PROYECTO LIBRE  ")
print("===================")

print("")

nombre = "Zed"
edad = 15
dedicacion = "estudiante"
ciudad_p= "CDMX"

print("Nombre:", nombre)

if edad < 18 and dedicacion == "estudiante" and ciudad_p == "CDMX":
    print("Perfil: Estudiante menor de edad capitalino")
elif edad >= 18 and dedicacion == "trabajador" and ciudad_p == "CDMX":
    print("Perfil: Trabajador mayor de edad capitalino")
else:
    print("Perfil: Perfil no correspondinte")

print("")