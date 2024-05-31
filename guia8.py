from reload import RelModule

reload = RelModule("guia8").reload


# MARK: Archivos: Ejercicio 1

# 1

def contar_lineas(nombre_archivo: str) -> int:
    file = open(nombre_archivo, "r")
    lineas = file.readlines()

    cantidad_lineas: int = len(lineas)
    
    file.close()
    
    return cantidad_lineas

# 2

def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    file = open(nombre_archivo, 'r', encoding="utf-8")
    lineas = file.readlines()
    file.close()

    res: bool = False

    for linea in lineas:
        if pertenece(palabra, obtener_palabras(linea)):
            res = True
    
    return res

def pertenece(elem, list: list) -> bool:
    res: bool = False

    for x in list:
        if x == elem:
            res = True
    
    return res

def obtener_palabras(texto: str) -> list[str]:
    palabras: list[str] = []
    chars: list[str] = list(texto)
    palabra_actual: str = ""

    for i in range(len(chars)):
        if chars[i] == ' ' or i == len(chars) - 1:
            if palabra_actual != "":
                palabras.append(palabra_actual)
            palabra_actual = ""
        else:
            palabra_actual += chars[i]
    
    return palabras

# 3

def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    file = open(nombre_archivo, 'r', encoding="utf-8")
    lineas: list[str] = file.readlines()
    file.close()
    
    cantidad: int = 0

    for linea in lineas:
        palabras: list[str] = obtener_palabras(linea)

        for palabra_actual in palabras:
            if palabra == palabra_actual:
                cantidad += 1
    
    return cantidad

# MARK: Ejercicio 2

def clonar_sin_comentarios(nombre_archivo: str):
    in_file = open(nombre_archivo, 'r', encoding="utf-8")
    lineas: list[str] = in_file.readlines()
    in_file.close()

    lineas_sin_comentarios: list[str] = []

    for linea in lineas:
        if not es_comentario(linea):
            lineas_sin_comentarios.append(linea)
    
    out_file = open("sin_comentarios.txt", 'w', encoding="utf-8")
    out_file.writelines(lineas_sin_comentarios)
    out_file.close()
    

def es_comentario(linea: str) -> bool:
    res: bool = False
    chars: list[str] = list(linea)
    es_el_primero = True

    for i in range(len(chars)):
        if chars[i] == "#" and es_el_primero:
            res = True
        elif chars[i] != " ":
            es_el_primero = False

    return res

# MARK: Ejercicio 3

def invertir_lineas(nombre_archivo: str):
    in_file = open(nombre_archivo, 'r', encoding="utf-8")
    lineas: list[str] = in_file.readlines()
    in_file.close()

    lineas_invertidas: list[str] = []

    for linea in lineas:
        lineas_invertidas.insert(0, linea)
    
    out_file = open("reverso.txt", 'w', encoding="utf-8")
    out_file.writelines(lineas_invertidas)
    out_file.close()

# MARK: Ejercicio 4

def agregar_frase_al_final(nombre_archivo: str, frase: str):
    file = open(nombre_archivo, 'a', encoding="utf-8")
    file.write('\n' + frase)
    file.close()

# MARK: Ejercicio 5

def agregar_frase_al_principio(nombre_archivo: str, frase: str):
    file = open(nombre_archivo, 'r+', encoding="utf-8")
    lineas = file.readlines()
    lineas.insert(0, frase + '\n')
    file.seek(0)
    file.writelines(lineas)
    file.close()

# MARK: Ejercicio 6

def listar_palabras_de_archivo(nombre_archivo: str) -> list[str]:
    file = open(nombre_archivo, 'rb')
    bytes: list[int] = file.read()
    file.close()

    palabras: list[str] = []
    palabra_actual: str = ""

    for byte in bytes:
        char: str = chr(byte)

        if es_caracter_valido(char):
            palabra_actual += char
        else:
            if len(palabra_actual) >= 5:
                palabras.append(palabra_actual)
            
            palabra_actual = ""
    
    return palabras


def es_caracter_valido(char: str) -> bool:
    return (char >= 'a' and char <= 'z') or (char >= 'A' and char <= 'Z') or (char >= '1' and char <= '9') or char == ' ' or char == '_'

# MARK: Ejercicio 7

def calcular_promedio_por_estudiante(nombre_archivo_notas: str, nombre_archivo_promedios: str):
    in_file = open(nombre_archivo_notas, 'r', encoding="utf-8")
    filas: list[str] = in_file.readlines()
    in_file.close()

    lista_lu = obtener_lista_lu(filas)

    out_file = open(nombre_archivo_promedios + '.csv', 'w', encoding="utf-8")
    out_file.write("nro de LU,promedio\n")

    for lu in lista_lu:
        promedio: float = promedio_estudiante(nombre_archivo_notas, lu)

        out_file.write(f"{lu},{promedio}\n")
    
    out_file.close()


def obtener_lista_lu(filas: list[str]) -> list[str]:
    lista_lu: list[str] = []

    for i in range(1,len(filas)):
        lu = separar_por(filas[i], ",")[0]

        if not pertenece(lu, lista_lu):
            lista_lu.append(lu)
    
    return lista_lu

def promedio_estudiante(nombre_archivo: str, lu: str) -> float:
    file = open(nombre_archivo, 'r', encoding="utf-8")
    filas: list[str] = file.readlines()
    file.close()

    suma_notas: float = 0
    cant_materias: int = 0

    for i in range(1, len(filas)):
        [lu_actual, _, _, nota] = separar_por(filas[i], ",")

        if lu_actual == lu:
            suma_notas += float(nota)
            cant_materias += 1
    
    promedio: float = round(suma_notas / cant_materias, 2)

    return promedio

def separar_por(string: str, separador: str) -> list[str]:
    lista_str: list[str] = []
    substr: str = ""

    for c in string:
        if c == separador:
            lista_str.append(substr)
            substr = ""
        else:
            substr += c
    
    lista_str.append(substr)

    return lista_str

# MARK: Pilas: Ejercicio 8


from queue import LifoQueue as Pila
import random

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]:
    pila: Pila = Pila()

    while cantidad > 0:
        pila.put(random.randint(desde, hasta))
        cantidad -= 1
    
    return pila

# MARK: Ejericio 9

def cantidad_elementos(pila: Pila) -> int:
    pila_aux: Pila = Pila()
    cantidad: int = 0

    while not pila.empty():
        pila_aux.put(pila.get())
        cantidad += 1
    
    mover_pila(pila_aux, pila)

    return cantidad

def mover_pila(pila_origen: Pila, pila_destino: Pila):
    while not pila_origen.empty():
        pila_destino.put(pila_origen.get())

# MARK: Ejercicio 10

def buscar_el_maximo(pila: Pila[int]) -> int:
    pila_aux: Pila = Pila()
    max: int = pila.get()
    pila_aux.put(max)

    while not pila.empty():
        elem = pila.get()

        if elem > max:
            max = elem
        
        pila_aux.put(elem)
    
    mover_pila(pila_aux, pila)

    return max

# MARK: Ejercicio 11

def esta_bien_balanceada(operacion: str) -> bool:
    res: bool = True
    parentesis: Pila = Pila()

    for i in range(len(operacion)):
        if operacion[i] == '(':
            parentesis.put(0) # No importa el contenido de la pila sino la cantidad de elementos
        elif operacion[i] == ')':
            if parentesis.empty():
                res = False
            else:
                parentesis.get()
    
    if res:
        res = parentesis.empty()
    
    return res

# MARK: Ejercicio 12

def evaluar_expresion(expresion: str) -> float:
    operandos: Pila = Pila()

    for op in expresion.split(" "):
        if op == '+':
            b = operandos.get()
            a = operandos.get()

            operandos.put(a + b)
        elif op == '-':
            b = operandos.get()
            a = operandos.get()

            operandos.put(a - b)
        elif op == '*':
            b = operandos.get()
            a = operandos.get()

            operandos.put(a * b)
        elif op == '/':
            b = operandos.get()
            a = operandos.get()

            operandos.put(a / b)
        else:
            operandos.put(int(op))
        
    return operandos.get()

# MARK: Colas: Ejercicio 13

from queue import Queue as Cola

def generar_nros_al_azar_cola(cantidad: int, desde: int, hasta: int) -> Cola[int]:
    cola: Cola = Cola()

    while cantidad > 0:
        cola.put(random.randint(desde, hasta))
        cantidad -= 1
    
    return cola

# MARK: Ejercicio 14

def cantidad_elementos_cola(cola: Cola) -> int:
    cola_aux: Cola = Cola()
    cantidad: int = 0

    while not cola.empty():
        cola_aux.put(cola.get())
        cantidad += 1
    
    mover_cola(cola_aux, cola)
    
    return cantidad

def mover_cola(cola_origen: Cola, cola_destino: Cola):
    while not cola_origen.empty():
        cola_destino.put(cola_origen.get())

# MARK: Ejercicio 15

def buscar_el_maximo_cola(cola: Cola[int]) -> int:
    cola_aux: Cola = Cola()
    max = cola.get()
    cola_aux.put(max)

    while not cola.empty():
        elem = cola.get()

        if elem > max:
            max = elem

        cola_aux.put(elem)
     
    mover_cola(cola_aux, cola)

    return max

# MARK: Ejercicio 16

def armar_secuencia_bingo() -> Cola[int]:
    bolillero: Cola[int] = Cola(100)
    numeros_al_azar: list[int] = list(range(100))
    random.shuffle(numeros_al_azar)

    for num in numeros_al_azar:
        bolillero.put(num)
    
    return bolillero

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    cantidad_aciertos: int = 0
    cantidad_jugadas: int = 0
    bolillero_aux: Cola = Cola(100)

    while cantidad_aciertos < 12:
        num: int = bolillero.get()

        if pertenece(num, carton):
            cantidad_aciertos += 1
        
        cantidad_jugadas += 1
        bolillero_aux.put(num)

    mover_cola(bolillero, bolillero_aux) # Termino de pasar los elementos restantes del bolillero a bolillero_aux
    mover_cola(bolillero_aux, bolillero)
    
    return cantidad_jugadas

# MARK: Ejercicio 17

def n_pacientes_urgentes(pedidos_atencion: Cola[tuple[int, str, str]]) -> int:
    pedidos_atencion_aux: Cola[tuple[int, str, str]] = Cola()
    cantidad_pacientes_urgentes: int = 0

    while not pedidos_atencion.empty():
        pedido: tuple[int, str, str] = pedidos_atencion.get()

        if pedido[0] <= 3:
            cantidad_pacientes_urgentes += 1
        
        pedidos_atencion_aux.put(pedido)
    
    mover_cola(pedidos_atencion_aux, pedidos_atencion)
    
    return cantidad_pacientes_urgentes

# MARK: Ejercicio 18

def atencion_a_clientes(cola_clientes: Cola[tuple[str, int, bool, bool]]) -> Cola[tuple[str, int, bool, bool]]:
    cola_clientes_aux: Cola[tuple[str, int, bool, bool]] = Cola()

    subgrupos_colas: list[Cola[tuple[str, int, bool, bool]]] = [Cola(), Cola(), Cola()] # lista con subgrupos
    con_prioridad, con_cuenta_preferencial, resto = 0, 1, 2 # enum de cada subgrupo

    cola_ordenada: Cola[tuple[str, int, bool, bool]] = Cola()

    while not cola_clientes.empty():
        cliente = cola_clientes.get()

        tiene_prioridad: bool = cliente[3]
        tiene_cuenta_preferencial: bool = cliente[2]

        if tiene_prioridad:
            subgrupos_colas[con_prioridad].put(cliente)
        elif tiene_cuenta_preferencial:
            subgrupos_colas[con_cuenta_preferencial].put(cliente)
        else:
            subgrupos_colas[resto].put(cliente)
        
        cola_clientes_aux.put(cliente)

    
    for cola in subgrupos_colas:
        while not cola.empty():
            cola_ordenada.put(cola.get())
    
    mover_cola(cola_clientes_aux, cola_clientes)
    
    return cola_ordenada