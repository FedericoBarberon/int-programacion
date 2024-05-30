import reload
from random import randint
from math import floor
import numpy as np
from reload import RelModule

reload = RelModule("guia7").reload

# MARK: Ejercicio 1

# 1

def pertenece(ls: list[int], e: int) -> bool:
    for x in ls:
        if x == e:
            return True
    
    return False

def pertenece2(ls: list[int], e: int) -> bool:
    return e in ls

def pertenece3(ls: list[int], e: int) -> bool:
    i: int = 0

    while i < len(ls):
        if e == ls[i]:
            return True
        i += 1

# 2

def divide_a_todos(ls: list[int], d: int) -> bool:
    for a in ls:
        if a % d != 0:
            return False
    
    return True

# 3

def suma_total(ls: list[int]) -> int:
    suma: int = 0

    for i in ls:
        suma += i
    
    return suma

# 4

def ordenados(ls: list[int]) -> bool:
    for i in range(len(ls) - 1):
        if ls[i] > ls[i+1]:
            return False
    
    return True

# 5

def tiene_palabra_larga(palabras: list[str]) -> bool:
    for palabra in palabras:
        if len(palabra) > 7:
            return True
    
    return False

# 6

def palindromo(texto: str) -> bool:
    i: int = 0

    while i < floor(len(texto) / 2):
        if texto[i] != texto[-i-1]:
            return False
        i += 1
    
    return True

# 7

def fortaleza_de_contraseña(contraseña: str) -> str:
    if len(contraseña) < 5:
        return "ROJA"
    
    if len(contraseña) <= 8:
        return "AMARILLA"
    
    tiene_mayuscula: bool = False
    tiene_minuscula: bool = False
    tiene_digito_numerico: bool = False

    for c in contraseña:
        if c >= 'a' and c <= 'z':
            tiene_minuscula = True
            continue

        if c >= 'A' and c <= 'Z':
            tiene_mayuscula = True
            continue

        if c >= '0' and c <= '9':
            tiene_digito_numerico = True
            continue
    
    if tiene_minuscula and tiene_mayuscula and tiene_digito_numerico:
        return "VERDE"
    
    return "AMARILLA"

# 8

def calcular_saldo(movimientos: list[tuple[str,float]]) -> float:
    saldo: float = 0

    for operacion, monto in movimientos:
        if operacion == 'I':
            saldo += monto
        elif operacion == 'R':
            saldo -= monto
    
    return saldo

# 9

def tres_vocales_distintas(palabra: str) -> bool:
    vocales: list[chr] = ['a','e','i','o','u']

    for c in palabra:
        lower_c = c.lower()

        if lower_c in vocales:
            vocales.remove(lower_c)
    
    return len(vocales) <= 2

# MARK: Ejercicio 2

# 1

def reemplazar_pares(ls: list[int]):
    for i in range(len(ls)):
        if i % 2 == 0:
            ls[i] = 0

# 2

def reemplazar_pares_2(ls: list[int]) -> list[int]:
    new_list: list[int] = ls.copy()
    reemplazar_pares(new_list)

    return new_list

# 3

def eliminar_vocales(texto: str) -> str:
    texto_sin_vocales: str = ""
    vocales: list[chr] = ['a', 'e', 'i', 'o', 'u']

    for c in texto:
        if not c in vocales:
            texto_sin_vocales += c
    
    return texto_sin_vocales

# 4

def reemplaza_vocales(texto: str) -> str:
    texto_sin_vocales: str = ""
    vocales: list[chr] = ['a', 'e', 'i', 'o', 'u']

    for i in range(len(texto)):
        if texto[i] in vocales:
            texto_sin_vocales += '_'
        else:
            texto_sin_vocales += texto[i]
    
    return texto_sin_vocales

# 5

def da_vuelta_str(string: str) -> str:
    str_al_reves: str = ""

    for i in range(len(string) - 1, -1, -1):
        str_al_reves += string[i]
    
    return str_al_reves

def da_vuelta_str2(string: str) -> str:
    str_al_reves: str = ""
    longitud: int = len(string)

    for i in range(longitud):
        str_al_reves += string[longitud - 1 - i]
    
    return str_al_reves

# 6

def eliminar_repetidos(string: str) -> str:
    str_sin_repetidos: str = ""

    for i in range(len(string) - 1):
        esta_repetida: bool = False

        for j in range(i+1, len(string)):
            if string[i] == string [j]:
                esta_repetida = True
                break

        if not esta_repetida:
            str_sin_repetidos += string[i]

    return str_sin_repetidos

# MARK: Ejercicio 3

def aprobado(notas: list[int]) -> int:
    todas_aprobadas = todas_materias_aprobadas(notas)
    promedio_notas = promedio(notas)

    if not todas_aprobadas or promedio_notas < 4:
        return 3
    
    if promedio_notas < 7:
        return 2
    
    return 1

def todas_materias_aprobadas(notas: list[int]) -> bool:
    for nota in notas:
        if nota < 4:
            return False
    
    return True

def promedio(notas: list[int]) -> float:
    return suma_total(notas) / len(notas)

# MARK: Ejercicio 4

# 1

def obtener_estudiantes() -> list[str]:
    estudiantes: list[str] = []

    nombre: str = ""

    while nombre != "listo":
        if nombre != "":
            estudiantes.append(nombre)
        
        nombre = input("Ingrese el nombre de un estudiante: ")
    
    return estudiantes

# 2

def obtener_historial() -> list[tuple[chr, float]]:
    opc: chr = ''
    historial: list[tuple[chr, float]] = []
    creditos: float = 0

    print("Bienvenido a su billetera electrónica\n")
    
    while opc != 'X':
        imprimir_menu(creditos)
        opc = obtener_opcion_ej2()

        if opc == 'C':
            monto: float = float(input("\nMonto a cargar: "))
            creditos += monto
            historial.append(('C', monto))

            print("\n-- Operación realizada con éxito --\n")
        elif opc == 'D': 
            monto: float = float(input("\nMonto a descontar: "))

            if (monto > creditos):
                print("\nCreditos insuficientes\n")
                continue

            creditos -= monto
            historial.append(('D', monto))

            print("\n-- Operación realizada con éxito --\n")
    
    return historial

def obtener_opcion_ej2() -> chr:
    opc: chr = ''
    opc_validas: list[chr] = ['C', 'D', 'X']

    while not opc in opc_validas:
        opc = input("\nIngrese una opción: ").upper()
    
    return opc

def imprimir_menu(creditos: float):
    print(f"Operaciones\t\tCreditos: {creditos}\n")
    print("C - Cargar créditos")
    print("D - Descontar créditos")
    print("X - Finalizar la simualción")

# 3

def siete_y_medio():
    cartas: list[int] = []
    suma: float = 0
    opc: chr = ''

    print("Siete y medio")

    while suma <= 7 and opc != 'P':
        carta = repartir_carta()
        cartas.append(carta)
        suma += calcular_valor(carta)

        if suma <= 7:
            opc = obtener_opcion_ej3()
            
    
    imprimir_resultado(suma)

    return cartas

        
def obtener_opcion_ej3() -> chr:
    opc: chr = ''
    opc_validas = ['S', 'P']

    print("S - Sacar una carta")
    print("P - Plantarse")

    while not opc in opc_validas:
        opc = input("\nIngrese una opción: ").upper()
    
    return opc


def repartir_carta() -> int:
    carta: int = randint(1, 12)

    while carta == 8 or carta == 9:
        carta: int = randint(1, 12)
    
    print(f"\n--- Obtuviste un {carta} ---\n")
    return carta

def calcular_valor(carta: int) -> float:
    figuras: list[int] = [10,11,12]

    if carta in figuras:
        return 0.5
    
    return carta

def imprimir_resultado(suma: float):
    if suma <= 7.5:
        print(f"\nGanaste!\tResultado: {suma}")
        return
    
    print(f"\nPerdiste!\tResultado: {suma}")

# MARK: Ejercicio 5

# 1

def pertenece_a_cada_uno_version_1(s: list[list[int]], e: int, res: list[bool]):
    for i in range(len(s)):
        res.insert(i, pertenece(s[i], e))

# 2

def pertenece_a_cada_uno_version_2(s: list[list[int]], e: int, res: list[bool]):
    res.clear()

    for i in range(len(s)):
        res.insert(i, pertenece(s[i], e))

# 3

def es_matriz(s: list[list[int]]) -> bool:
    len_filas = len(s[0])

    if len(s) == 0 or len_filas == 0:
        return False

    for fila in s:
        if len(fila) != len_filas:
            return False
    
    return True

# 4

def filas_ordenadas(matriz: list[list[int]], res: list[bool]):
    res.clear()

    for fila in matriz:
        res.append(ordenados(fila))

# 5

def matriz_random_elevada(d: int, p: int) -> list[list[int]]:
    matriz = np.random.random((d, d))

    for i in range(d):
        for j in range(d):
            matriz[i][j] = calcular_valor_de_producto_de_matriz(matriz, i, j)
    
    return matriz

def calcular_valor_de_producto_de_matriz(matriz: list[list[int]], i: int, j: int) -> int:
    suma: int = 0

    for k in range(len(matriz)):
        suma += matriz[i][k] * matriz[k][j]
    
    return suma