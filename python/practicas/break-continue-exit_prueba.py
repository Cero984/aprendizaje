numeros = [10, 25, 3, 47, 3, 8]
for numeracion_a in numeros:
    if numeracion_a == 3:
        break
    print(numeracion_a)

for numeracion_b in numeros:
    if numeracion_b == 3:
        continue
    print(numeracion_b)

for numeracion_c in numeros:
    if numeracion_c == 47:
        exit()
    print(numeracion_c)
print("esto no debería imprimirse si exit() esta bien")