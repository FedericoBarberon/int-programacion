import unittest
import main

class TestsIndNesimaAparicion(unittest.TestCase):

    def test_cant_apariciones_menores_que_n(self):
        self.assertEqual(main.ind_nesima_aparicion([1,2,3,4,5], 4, 3), -1)
    
    def test_cant_apariciones_mayores_iguales_que_n(self):
        self.assertEqual(main.ind_nesima_aparicion([1,2,1,3,1,4,1,5], 3, 1), 4)

class TestsMezclar(unittest.TestCase):

    def test_listas_vacias(self):
        self.assertEqual(main.mezclar([], []), [])
    
    def test_listas_con_elementos(self):
        self.assertEqual(main.mezclar([1,3,5], [2,4,6]), [1,2,3,4,5,6])

class TestsFrecuenciaPosicionesPorCaballo(unittest.TestCase):

    def test_sin_caballos(self):
        self.assertEqual(main.frecuencia_posiciones_por_caballo([], {"1": []}), {})
    
    def test_sin_carreras(self):
        self.assertEqual(main.frecuencia_posiciones_por_caballo(["1", "2"], {}), {"1": [0,0], "2": [0,0]})
    
    def test_con_caballos_y_carreras(self):
        caballos: list[str] = ["1", "2", "3"]
        carreras: dict[str, list[str]] = {
            "A": ["1", "2", "3"],
            "B": ["2", "3", "1"],
            "C": ["2", "1", "3"],
            "D": ["3", "1", "2"]
        }

        res: dict[str, list[int]] = {
            "1": [1,2,1],
            "2": [2,1,1],
            "3": [1,1,2]
        }

        self.assertEqual(main.frecuencia_posiciones_por_caballo(caballos, carreras), res)

class TestsMatrizCapicua(unittest.TestCase):

    def test_matriz_vacia(self):
        self.assertTrue(main.matriz_capicua([]))
    
    def test_matriz_con_elementos_vacios(self):
        self.assertTrue(main.matriz_capicua([[], []]))
    
    def test_matriz_no_capicua(self):
        self.assertFalse(main.matriz_capicua([[1,2], [3,3], [4,5]]))
    
    def test_matriz_capicua(self):
        self.assertTrue(main.matriz_capicua([[1,2,1], [2,2,2], [3,0,3]]))

if __name__ == "__main__":
    unittest.main(verbosity=2)