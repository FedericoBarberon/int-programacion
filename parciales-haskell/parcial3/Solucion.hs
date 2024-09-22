module Solucion where

type CharMap = (Char, Char)

type Frase = String

hayQueCodificar :: Char -> [CharMap] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c (mapeo : mapeos) = c == fst mapeo || hayQueCodificar c mapeos

cuantasVecesHayQueCodificar :: Char -> Frase -> [CharMap] -> Int
cuantasVecesHayQueCodificar c frase mapeos
  | hayQueCodificar c mapeos = repeticiones c frase
  | otherwise = 0

laQueMasHayQueCodificar :: Frase -> [CharMap] -> Char
laQueMasHayQueCodificar [c] _ = c
laQueMasHayQueCodificar (c1 : frase) mapeos = laQueMasHayQueCodificarAux frase mapeos (c1, cuantasVecesHayQueCodificar c1 frase mapeos)
  where
    laQueMasHayQueCodificarAux :: Frase -> [CharMap] -> (Char, Int) -> Char
    laQueMasHayQueCodificarAux [] _ (cMasCodificable, _) = cMasCodificable
    laQueMasHayQueCodificarAux (c1 : frase) mapeos (cMasCodificable, repeticionesDelMasCodificable)
      | repeticionesDeC1 > repeticionesDelMasCodificable = laQueMasHayQueCodificarAux frase mapeos (c1, repeticionesDeC1)
      | otherwise = laQueMasHayQueCodificarAux frase mapeos (cMasCodificable, repeticionesDelMasCodificable)
      where
        repeticionesDeC1 = cuantasVecesHayQueCodificar c1 (c1 : frase) mapeos

codificarFrase :: Frase -> [CharMap] -> Frase
codificarFrase frase [] = frase
codificarFrase [] _ = []
codificarFrase (c1 : frase) mapeos = mapearCaracter c1 mapeos : codificarFrase frase mapeos

-- Aux Functions

repeticiones :: Char -> Frase -> Int
repeticiones _ [] = 0
repeticiones c (c1 : frase)
  | c == c1 = 1 + repeticiones c frase
  | otherwise = repeticiones c frase

mapearCaracter :: Char -> [CharMap] -> Char
mapearCaracter c [] = c
mapearCaracter c (mapeo : mapeos)
  | c == fst mapeo = snd mapeo
  | otherwise = mapearCaracter c mapeos