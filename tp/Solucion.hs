module Solucion where

import Data.Char

-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf

-- Completar!
-- Nombre de grupo: Los llamados recursivos
-- Integrante1: 46557940, Barberón Federico Joaquín
-- Integrante2: { DNI2,apellidoYNombre2}
-- Integrante3: { DNI3,apellidoYNombre3}
-- Integrante4: { DNI4,apellidoYNombre4}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
-- integrante, completar con los dni y apellidos, sino dejar vacío}

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula c = c >= 'a' && c <= 'z'

-- EJ 2
letraANatural :: Char -> Int
letraANatural c = ord c - ord 'a'

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar c n
  | not (esMinuscula c) = c
  | otherwise = chr (ord 'a' + mod (letraANatural c + n) 26)

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (c : texto) n = desplazar c n : cifrar texto n

-- EJ 5
descifrar :: String -> Int -> String
descifrar [] _ = []
descifrar (c : texto) n = desplazar c (-n) : descifrar texto n

-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista ls = cifrarListaAux ls 0
  where
    cifrarListaAux :: [String] -> Int -> [String]
    cifrarListaAux [] _ = []
    cifrarListaAux (x : ls) i = cifrar x i : cifrarListaAux ls (i + 1)

-- EJ 7
frecuencia :: String -> [Float]
frecuencia str
  | cantMinusculas str == 0 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
  | otherwise = frecuenciaAux str 0
  where
    cantMinusculasStr = cantMinusculas str
    frecuenciaAux :: String -> Int -> [Float]
    frecuenciaAux _ 26 = []
    frecuenciaAux str i = frec : frecuenciaAux str (i + 1)
      where
        frec = fromIntegral (cantApariciones (desplazar 'a' i) str) / fromIntegral cantMinusculasStr * 100

cantApariciones :: (Eq t) => t -> [t] -> Int
cantApariciones _ [] = 0
cantApariciones e (x : xs)
  | e == x = 1 + cantApariciones e xs
  | otherwise = cantApariciones e xs

cantMinusculas :: String -> Int
cantMinusculas [] = 0
cantMinusculas (c : str)
  | esMinuscula c = 1 + cantMinusculas str
  | otherwise = cantMinusculas str

-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente str n = obtenerLetraMasFrecuente (frecuencia (cifrar str n))

obtenerLetraMasFrecuente :: [Float] -> (Char, Float)
obtenerLetraMasFrecuente (frecDeA : frecuencia) = obtenerLetraMasFrecuenteAux frecuencia 'b' ('a', frecDeA)
  where
    obtenerLetraMasFrecuenteAux :: [Float] -> Char -> (Char, Float) -> (Char, Float)
    obtenerLetraMasFrecuenteAux [] _ max = max
    obtenerLetraMasFrecuenteAux (frecActual : frecuencia) letraActual (letraMasFrec, frecMax)
      | frecActual > frecMax = obtenerLetraMasFrecuenteAux frecuencia sigLetra (letraActual, frecActual)
      | otherwise = obtenerLetraMasFrecuenteAux frecuencia sigLetra (letraMasFrec, frecMax)
      where
        sigLetra = chr (ord letraActual + 1)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado _ _ = False

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados _ = [("compu", "frpsx"), ("frpsx", "compu")]

-- EJ 11
expandirClave :: String -> Int -> String
expandirClave _ _ = "compucom"

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ _ = "kdueciirqdv"

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere _ _ = "computacion"

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ _ = "asdef"

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere _ _ _ = [("hola", "b")]
