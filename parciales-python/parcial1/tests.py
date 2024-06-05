import unittest
import main

class TestsVerificarTransacciones(unittest.TestCase):

    def test_historial_sin_movimientos(self):
        self.assertEqual(main.verificar_transacciones("sss"), 0)
    
    def test_saldo_insuficiente(self):
        self.assertEqual(main.verificar_transacciones("ssrvvvvsvvsvvv"), 14)
    
    def test_historial_sin_x(self):
        self.assertEqual(main.verificar_transacciones("ssrvvrrvvsvvs"), 714)
    
    def test_historial_con_x(self):
        self.assertEqual(main.verificar_transacciones("rssvvvxssr"), 182)

class TestsValorMinimo(unittest.TestCase):

    def test_un_minimo(self):
        temperaturas: list[tuple[float, float]] = [(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)]
        self.assertEqual(main.valor_minimo(temperaturas), -3.1)
    
    def test_varios_minimos(self):
        temperaturas: list[tuple[float, float]] = [(26.5, 29.8), (38.6, 45.4), (2.8, 20.1), (17.5, 44.0), (2.8, 8.4)]
        self.assertEqual(main.valor_minimo(temperaturas), 2.8)

class TestsValoresExtremos(unittest.TestCase):

    def test_sin_cotizaciones(self):
        self.assertEqual(main.valores_extremos({}), {})
    
    def test_un_minimo_y_maximo(self):
        cotizaciones: dict[str, list[tuple[int, float]]] = {
            "YPF": [(4, 152.3), (5, 140.23), (24, 80.2), (31, 210)],
            "LOMA": [(2, 12.5), (10, 120.14), (23, 90.1)],
        }

        res_esperado: dict[str, list[tuple[int, float]]] = {
            "YPF": (80.2, 210),
            "LOMA": (12.5, 120.14)
        }

        self.assertEqual(main.valores_extremos(cotizaciones), res_esperado)
    
    def test_varios_minimos_y_maximos(self):
        cotizaciones: dict[str, list[tuple[int, float]]] = {
            "YPF": [(1, 152.3), (2, 152.3), (24, 80.2), (25, 80.2), (27, 84.5)],
            "LOMA": [(2, 12.5), (10, 120.14), (23, 12.5), (25, 120.14), (28, 110.12)],
        }

        res_esperado: dict[str, list[tuple[int, float]]] = {
            "YPF": (80.2, 152.3),
            "LOMA": (12.5, 120.14)
        }

        self.assertEqual(main.valores_extremos(cotizaciones), res_esperado)

class TestsSudokuValido(unittest.TestCase):

    def test_sudoku_valido_completo(self):
        sudoku: list[list[int]] = [
			[1, 9, 4, 8, 6, 5, 2, 3, 7],
			[7, 3, 5, 4, 1, 2, 9, 6, 8],
			[8, 6, 2, 3, 9, 7, 1, 4, 5],
			[9, 2, 1, 7, 4, 8, 3, 5, 6],
			[6, 7, 8, 5, 3, 1, 4, 2, 9],
			[4, 5, 3, 9, 2, 6, 8, 7, 1],
			[3, 8, 9, 6, 5, 4, 7, 1, 2],
			[2, 4, 6, 1, 7, 9, 5, 8, 3],
			[5, 1, 7, 2, 8, 3, 6, 9, 4]
		]

        self.assertTrue(main.es_sudoku_valido(sudoku))
    
    def test_sudoku_valido_incompleto(self):
        sudoku: list[list[int]] = [
            [1, 2, 3, 4, 5, 6, 7, 8, 9],
            [9, 8, 7, 6, 4, 5, 3, 2, 1],
            [0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 4, 0, 0, 0],
            [0, 0, 0, 0, 6, 0, 0, 0, 0],
            [0, 0, 0, 5, 0, 0, 0, 0, 0],
            [0, 0, 4, 0, 0, 0, 0, 0, 0],
            [0, 3, 0, 0, 0, 0, 0, 0, 0],
            [2, 0, 0, 0, 0, 0, 0, 0, 0]
        ]

        self.assertTrue(main.es_sudoku_valido(sudoku))
    
    def test_filas_invalidas(self):
        sudoku: list[list[int]] = [
            [1, 2, 3, 3, 5, 6, 7, 8, 9],
            [9, 8, 7, 6, 4, 5, 3, 2, 1],
            [0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 4, 0, 0, 0],
            [0, 0, 0, 0, 6, 0, 0, 0, 0],
            [0, 0, 0, 5, 0, 0, 0, 0, 0],
            [0, 0, 4, 0, 0, 0, 0, 0, 0],
            [0, 3, 0, 0, 0, 0, 0, 0, 0],
            [2, 0, 0, 0, 0, 0, 0, 0, 0]
        ]

        self.assertFalse(main.es_sudoku_valido(sudoku))
    
    def test_columnas_invalidas(self):
        sudoku: list[list[int]] = [
            [1, 2, 3, 4, 5, 6, 7, 8, 9],
            [9, 8, 7, 6, 5, 4, 3, 2, 1],
            [0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 4, 0, 0, 0],
            [0, 0, 0, 0, 6, 0, 0, 0, 0],
            [0, 0, 0, 5, 0, 0, 0, 0, 0],
            [0, 0, 4, 0, 0, 0, 0, 0, 0],
            [0, 3, 0, 0, 0, 0, 0, 0, 0],
            [2, 0, 0, 0, 0, 0, 0, 0, 0]
        ]

        self.assertFalse(main.es_sudoku_valido(sudoku))

if __name__ == "__main__":
    unittest.main(verbosity=2)