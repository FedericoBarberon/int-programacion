module Solucion where

import Data.Char

type Mensaje = String

type Desplazamiento = Int

cantMinuscula :: Mensaje -> Int
cantMinuscula [] = 0
cantMinuscula (c : mensaje)
  | esMinuscula c = 1 + cantMinuscula mensaje
  | otherwise = cantMinuscula mensaje

maximoCambios :: [Mensaje] -> Mensaje
maximoCambios [] = []
maximoCambios [mensaje] = mensaje
maximoCambios (mensaje1 : mensaje2 : mensajes)
  | cantMinuscula mensaje1 >= cantMinuscula mensaje2 = maximoCambios (mensaje1 : mensajes)
  | otherwise = maximoCambios (mensaje2 : mensajes)

desplazar :: Char -> Desplazamiento -> Char
desplazar c d
  | not (esMinuscula c) = c
  | otherwise = chr (ord 'a' + mod (ord c + d - ord 'a') 26)

codificar :: Mensaje -> Desplazamiento -> Mensaje
codificar [] _ = []
codificar (c : mensaje) d = (desplazar c d : codificar mensaje d)

decodificar :: Mensaje -> Desplazamiento -> Mensaje
decodificar [] _ = []
decodificar (c : mensaje) d = (desplazar c (-d) : decodificar mensaje d)

-- Aux Functions

esMinuscula :: Char -> Bool
esMinuscula c = c >= 'a' && c <= 'z'