try:
    numero = int(input("elija su divisor:"))
    print( 40 / numero)
except ZeroDivisionError:
    print("Error: no puedes dividir entre cero.")
except ValueError:
    print("Error: eso no es un número.")