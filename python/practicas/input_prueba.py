nombre = input("Cual es tu nombre:")
try:
    edad = int(input("Cual es tu edad:"))
except ValueError:
    print("ponga un numero")
else: 
    print(f"Hola {nombre}, tienes {edad} años.")
