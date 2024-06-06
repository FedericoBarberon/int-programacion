# Ejercicio 1

def verificar_transacciones(historial: str) -> int:
    saldo: int = 0
    terminar: bool = False
    i: int = 0

    while not terminar and i < len(historial):
        if historial[i] == 'r':
            saldo += 350
        elif historial[i] == 'v':
            if saldo < 56:
                terminar = True
            else:
                saldo -= 56
        elif historial[i] == 'x':
            terminar = True

        i += 1
    
    return saldo

# Ejercicio 2

def valor_minimo(temperaturas: list[tuple[float, float]]) -> float:
    temp_minima: float = temperaturas[0][0]

    for i in range(1, len(temperaturas)):
        temp_minima_actual: float = temperaturas[i][0]

        if temp_minima_actual < temp_minima:
            temp_minima = temp_minima_actual
    
    return temp_minima

# Ejercicio 3

def valores_extremos(cotizaciones: dict[str, list[tuple[int, float]]]) -> dict[str, tuple[float, float]]:
    cotizaciones_extremas: dict[str, tuple[float, float]] = {}

    for empresa, cotizaciones_empresa in cotizaciones.items():
        cotizacion_minima: float = cotizaciones_empresa[0][1]
        cotizacion_maxima: float = cotizaciones_empresa[0][1]

        for i in range(1, len(cotizaciones_empresa)):
            cotizacion_actual: float = cotizaciones_empresa[i][1]

            if cotizacion_actual > cotizacion_maxima:
                cotizacion_maxima = cotizacion_actual
            elif cotizacion_actual < cotizacion_minima:
                cotizacion_minima = cotizacion_actual
        
        cotizaciones_extremas[empresa] = (cotizacion_minima, cotizacion_maxima)
    
    return cotizaciones_extremas

# Ejercicio 4

def es_sudoku_valido(sudoku: list[list[int]]) -> bool:
    es_valido: bool = True
    
    i: int = 0

    while es_valido and i < 9:
        nums_fila: list[int] = []
        nums_columna: list[int] = []

        j: int = 0

        while es_valido and j < 9:
            valor_celda_fila: int = sudoku[i][j]
            valor_celda_columna: int = sudoku[j][i]

            if valor_celda_fila in nums_fila or valor_celda_columna in nums_columna:
                es_valido = False
            else:
                if valor_celda_fila != 0:
                    nums_fila.append(sudoku[i][j])
                
                if valor_celda_columna != 0:
                    nums_columna.append(sudoku[j][i])
            j += 1
        
        i += 1
        
    return es_valido