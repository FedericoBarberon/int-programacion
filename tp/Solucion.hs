module Solucion where

import Data.Char

-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf

-- Completar!
-- Nombre de grupo: {}
-- Integrante1: { DNI1,apellidoYNombre1}
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
frecuencia _ = [16.666668, 0.0, 0.0, 0.0, 16.666668, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 33.333336, 0.0, 0.0, 0.0, 0.0, 0.0, 16.666668, 0.0, 16.666668, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente _ _ = ('o', 33.333336)

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
