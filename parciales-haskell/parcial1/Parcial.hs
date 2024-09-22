module Parcial where

type Formula = (String, String)

type Votos = [Int]

type VotosTotales = Int

votosEnBlanco :: [Formula] -> Votos -> VotosTotales -> Int
votosEnBlanco [] [] votosTotales = votosTotales
votosEnBlanco _ votos votosTotales = votosTotales - sumaDeElementos votos

formulasValidas :: [Formula] -> Bool
formulasValidas [] = True
formulasValidas formulas = not (hayRepetidos (aplanarDuplas formulas))

porcentajeDeVotos :: String -> [Formula] -> Votos -> Float
porcentajeDeVotos presidente formulas votos = division (nEsimoElemento (posicionDeLaFormula presidente formulas) votos) (sumaDeElementos votos)

proximoPresidente :: [Formula] -> Votos -> String
proximoPresidente formulas votos = fst (nEsimoElemento (posicionDelMax votos) formulas)

-- Funciones Auxiliares

sumaDeElementos :: (Num t) => [t] -> t
sumaDeElementos [] = 0
sumaDeElementos (x : xs) = x + sumaDeElementos xs

aplanarDuplas :: [(t, t)] -> [t]
aplanarDuplas [] = []
aplanarDuplas ((a, b) : xs) = a : b : aplanarDuplas xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x : xs) = n == x || pertenece n xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x : xs) = pertenece x xs || hayRepetidos xs

posicionDeLaFormula :: String -> [Formula] -> Int
posicionDeLaFormula _ [] = -1
posicionDeLaFormula presidente (formula : formulas)
  | presidente == fst formula = 0
  | otherwise = 1 + posicionDeLaFormula presidente formulas

nEsimoElemento :: Int -> [t] -> t
nEsimoElemento _ [x] = x
nEsimoElemento n (x : xs)
  | n == 0 = x
  | otherwise = nEsimoElemento (n - 1) xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

posicionDelMax :: (Num t, Ord t) => [t] -> Int
posicionDelMax [] = 0
posicionDelMax (x : xs) = posicionDelMaxAux xs x
  where
    posicionDelMaxAux [] _ = 0
    posicionDelMaxAux (x : xs) max
      | x > max = 1 + posicionDelMaxAux xs x
      | otherwise = posicionDelMaxAux xs max