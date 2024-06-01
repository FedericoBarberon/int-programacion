import math
from reload import RelModule

reload = RelModule("guia6").reload

# MARK: Ejercicio 1

# 1

def imprimir_hola_mundo():
    print("¡Hola mundo!")

# 2

def imprimir_un_verso():
    print("I've been through the desert on a horse with no name\nIt felt good to be out of the rain\nIn the desert, you can't your name\n'Cause there ain't no one for to give you no pain\nLa, la, la, la-la-la-la-la, la-la-la, la, la\nLa, la, la, la-la-la-la-la, la-la-la, la, la")

# 3

def raizDe2() -> float:
    return round(math.sqrt(2), 4)

# 4

def factorial_de_dos() -> int:
    return 2*1

# 5

def perimetro() -> float:
    return 2 * math.py

# MARK: Ejercicio 2

# 1

def imprimir_saludo(nombre: str):
    print(f"Hola {nombre}")

# 2

def raiz_cuadrada_de(n: float) -> float:
    return math.sqrt(n)

# 3

def fahrenheit_a_celsius(t: float) -> float:
    return ((t - 32) * 5) / 9

# 4

def imprimir_dos_veces(estribillo: str) -> str:
    return estribillo * 2

# 5

def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

# 6

def es_par(n: int) -> bool:
    return n % 2 == 0

# 7

def cantiad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    return math.floor((comensales * min_cant_de_porciones) / 8)

# MARK: Ejercicio 3

# 1

def alguno_es_0(a: int, b: int) -> bool:
    return a == 0 or b == 0

# 2

def ambos_son_0(a: int, b: int) -> bool:
    return a == 0 and b == 0

# 3

def es_nombre_largo(nombre: str) -> bool:
    longitud: int = len(nombre)
    return longitud >= 3 and longitud <= 8

# 4

def es_bisiesto(año: int) -> bool:
    return es_multiplo_de(año, 400) or (es_multiplo_de(año, 4) and not es_multiplo_de(año, 100))

# MARK: Ejercicio 4

def metros_a_cm(metros: float) -> float:
    return metros * 100

def peso_pino(altura: float) -> float:
    peso_hasta_3m = 3
    peso_despues_de_3m = 2
    
    if altura > 3:
        return metros_a_cm(3) * peso_hasta_3m + metros_a_cm(altura - 3) * peso_despues_de_3m
    
    return metros_a_cm(altura) * peso_hasta_3m

def es_peso_util(peso: float) -> bool:
    return peso >= 400 and peso <= 1000

def sirve_pino(altura: float) -> bool:
    return es_peso_util(peso_pino(altura))

# MARK: Ejercicio 5

"""
1-
problema devolver_el_doble_si_es_par(in n: R): R {
    requiere: {True}
    asegura: {(res = 2*n && mod n 2 == 0) || (res = n)}
}
"""

def devolver_el_doble_si_es_par(n: float) -> float: 
    if es_par(n):
        return 2*n
    return n

"""
2-
problema devolver_valor_si_es_par_sino_el_que_sigue(in n: R): R {
    requiere: {True}
    asegura: {(res = n && mod n 2 == 0) || (res = n + 1)}
}
"""

def devolver_valor_si_es_par_sino_el_que_sigue(n: float) -> float:
    if es_par(n):
        return n
    
    return n + 1

"""
3-
problema devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(in n: R): R {
    requiere: {True}
    asegura: {(res = 2 * n && mod n 3 == 0) || (res = 3 * n && mod n 9 == 0) || (res = n)}
}
"""

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n: float) -> float:
    if es_multiplo_de(n, 3):
        return 2 * n
    
    elif es_multiplo_de(n, 9):
        return 3 * n
    
    return n

"""
4-
problema lindo_nombre(in nombre: String): String {
    requiere: {True}
    asegura: {(res = "Tu nombre tiene muchas letras!" && |nombre| >= 5) || (res = "Tu nombre tiene menos de 5 caracteres")}
}
"""

def lindo_nombre(nombre: str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    
    return "Tu nombre tiene menos de 5 caracteres"

"""
5-
problema elRango(in n: R) {
    requiere: {True}
    asegura: {(n < 5 && imprime "Menor a 5") || (n >= 10 && n <= 20 && imprime "Entre 10 y 20") || (n > 20 && imprime "Mayor a 20")}
}
"""

def elRango(n: float):
    if n < 5:
        print("Menor a 5")
    elif n >= 10 and n <= 20:
        print("Entre 10 y 20")
    elif n > 20:
        print("Mayor a 20")
    
"""
problema situacion_de_persona(in sexo: Char, in edad: Z) {
    requiere: {sexo == 'F' || sexo == 'M'}
    requiere: {edad >= 0}
    asegura: {(edad >= 18 && ((sexo == 'M' && edad < 65) || (sexo == 'F' && edad < 60)) && imprime "Te toca trabajar") || imprime "Andá de vacaciones"}
}
"""

def situacion_de_persona(sexo: chr, edad: int):
    if edad < 18 or (sexo == 'F' and edad >= 60) or (sexo == 'M' and edad >= 65):
        print ("Andá de vacaciones")
    else:
        print ("Te toca trabajar")
    
# MARK: Ejercicio 6

# 1

def imprime_del_1_al_10():
    i = 1

    while i <= 10:
        print(i)
        i += 1
    
# 2

def imprime_pares_entre_10_40():
    i = 10

    while i <= 40:
        print(i)
        i += 2
    
# 3

def imprime_eco_10_veces():
    i = 1

    while i <= 10:
        print("eco")
        i += 1
    
# 4

def cuenta_regresive(n: int):
    if n < 0:
        return
    
    while n >= 1:
        print(n)
        n -= 1
    
    print("Despegue")

# 5

def viaje_en_el_tiempo(año_partida: int, año_llegada: int):
    if año_llegada >= año_partida:
        return
    
    while año_partida > año_llegada:
        año_partida -= 1
        print(f"Viajó un año al pasado, estamos en el año {año_partida}")
    
# 6

def viaje_hasta_348ac(año_partida: int):
    if año_partida <= -348:
        return
    
    while año_partida >= -348 + 20:
        año_partida -= 20

        if (año_partida > 0):
            print(f"Viajó 20 años al pasado, estamos en el año {año_partida} d.C")
        else:
            print(f"Viajó 20 años al pasado, estamos en el año {-año_partida} a.C")

# MARK: Ejercicio 7

# 1

def for_imprime_del_1_al_10():
    for i in range(1,11):
        print(i)

# 2

def for_imprime_pares_entre_10_40():
    for i in range(10, 40, 2):
        print(i)

# 3

def for_imprime_eco_10_veces():
    for i in range(10):
        print("eco")

# 4

def for_cuenta_regresive(n: int):
    for i in range(n, 0, -1):
        print(i)
    
    print("Despegue")

# 5

def for_viaje_en_el_tiempo(año_partida, año_llegada):
    for i in range(año_partida - 1, año_llegada - 1, -1):
        print(f"Viajó un año al pasado, estamos en el año {i}")

# 6

def for_viaje_hasta_348ac(año_partida):
    for i in range(año_partida - 20, -348, -20):
        if (i > 0):
            print(f"Viajó 20 años al pasado, estamos en el año {i} d.C")
        else:
            print(f"Viajó 20 años al pasado, estamos en el año {-i} a.C")