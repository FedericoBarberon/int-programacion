# Ejercicio 1

def ind_nesima_aparicion(nums: list[int], n: int, elem: int) -> int:
    ind: int = -1
    i: int = 0

    while i < len(nums) and ind == -1:
        if nums[i] == elem:
            if n == 1:
                ind = i
            else:
                n -= 1
        i += 1

    return ind

# Ejercicio 2

def mezclar(s1: list[int], s2: list[int]) -> list[int]:
    res: list[int] = []
    
    for i in range(len(s1)):
        res.append(s1[i])
        res.append(s2[i])
    
    return res

# Ejercicio 3

def frecuencia_posiciones_por_caballo(caballos: list[str], carreras: dict[str, list[str]]) -> dict[str, list[int]]:
    frecuencia_posiciones: dict[str, list[int]] = {}

    cant_caballos: int = len(caballos)

    for caballo in caballos:
        frecuencia_posiciones[caballo] = [0] * cant_caballos
    
    for posiciones in carreras.values():
        for i in range(cant_caballos):
            frecuencia_posiciones[posiciones[i]][i] += 1
    
    return frecuencia_posiciones

# Ejercicio 4

def matriz_capicua(matriz: list[list[int]]) -> bool:
    res: bool = True

    for fila in matriz:
        for i in range(len(fila) // 2):
            if fila[i] != fila[len(fila) - 1 - i]:
                res = False
    
    return res