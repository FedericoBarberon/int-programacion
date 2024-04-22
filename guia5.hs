-- MARK: Ejercicio 1

-- 1)

longitud :: [t] -> Integer
longitud [] = 0
longitud (_ : xs) = 1 + longitud xs

-- 2)

ultimo :: [t] -> t
ultimo list = list !! fromIntegral (longitud list - 1)

-- 3)

principio :: [t] -> [t]
principio (_ : []) = []
principio (x : xs) = x : principio xs

-- 4)

reverso :: [t] -> [t]
reverso [] = []
reverso list = ultimo list : reverso (principio list)

-- MARK: Ejercicio 2

-- 1)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x : xs) = e == x || pertenece e xs

-- 2)

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (_ : []) = True
todosIguales (x1 : x2 : xs) = x1 == x2 && todosIguales (x2 : xs)

-- 3)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x : xs) = not (pertenece x xs) && todosDistintos xs

-- 4)

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos list = not (todosDistintos list)

-- 5)

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x : xs)
    | e == x = xs
    | otherwise = x : quitar e xs

-- 6)

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x : xs)
    | e == x = quitarTodos e xs
    | otherwise = x : quitarTodos e xs

-- 7)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x : xs)
    | pertenece x xs = eliminarRepetidos xs
    | otherwise = x : eliminarRepetidos xs

-- 8)

mismosElementosAux :: (Eq t) => [t] -> [t] -> Bool
mismosElementosAux [] _ = True
mismosElementosAux (x : xs) ys = pertenece x ys && mismosElementosAux xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = longitud xsSinRepe == longitud ysSinRepe && mismosElementosAux xsSinRepe ysSinRepe
  where
    xsSinRepe = eliminarRepetidos xs
    ysSinRepe = eliminarRepetidos ys

-- 9)

capicua :: (Eq t) => [t] -> Bool
capicua list = list == reverso list

-- MARK: Ejercicio 3

-- 1)

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

-- 2)

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x : xs) = x * productoria xs

-- 3)

maximo :: [Integer] -> Integer
maximo list = maximoAux list (head list)
  where
    maximoAux [] max = max
    maximoAux (x : xs) max
        | x > max = maximoAux xs x
        | otherwise = maximoAux xs max

-- 4)

sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x : xs) = x + n : sumarN n xs

-- 5)

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero s = sumarN (head s) s

-- 6)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo s = sumarN (ultimo s) s

-- 7)

pares :: [Integer] -> [Integer]
pares [] = []
pares (x : xs)
    | mod x 2 == 0 = x : pares xs
    | otherwise = pares xs

-- 8)

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x : xs)
    | mod x n == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs

-- 9)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar list = ordenar (quitar max list) ++ [max]
  where
    max = maximo list

-- MARK: Ejercicio 4

-- a)

-- 1)

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (c : []) = [c]
sacarBlancosRepetidos (c1 : c2 : texto)
    | c1 == ' ' && c2 == ' ' = sacarBlancosRepetidos (c2 : texto)
    | otherwise = c1 : sacarBlancosRepetidos (c2 : texto)

-- 2)

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (c : []) | c /= ' ' = 1 | otherwise = 0
contarPalabras (c1 : c2 : texto)
    | c1 /= ' ' && c2 == ' ' = 1 + contarPalabras (c2 : texto)
    | otherwise = contarPalabras (c2 : texto)

-- 3)

quitarEspaciosIniciales :: [Char] -> [Char]
quitarEspaciosIniciales [] = []
quitarEspaciosIniciales (c : []) | c == ' ' = [] | otherwise = [c]
quitarEspaciosIniciales (c : texto)
    | c == ' ' = quitarEspaciosIniciales texto
    | otherwise = c : texto

primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (c : []) | c == ' ' = [] | otherwise = [c]
primeraPalabra (c1 : c2 : texto)
    | c1 == ' ' = primeraPalabra (c2 : texto)
    | c2 == ' ' = [c1]
    | otherwise = c1 : primeraPalabra (c2 : texto)

quitarPrimeraPalabra :: [Char] -> [Char]
quitarPrimeraPalabra [] = []
quitarPrimeraPalabra (c : []) = []
quitarPrimeraPalabra (c1 : c2 : texto)
    | c1 == ' ' = quitarPrimeraPalabra (c2 : texto)
    | c2 == ' ' = quitarEspaciosIniciales (c2 : texto)
    | otherwise = quitarPrimeraPalabra (c2 : texto)

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras texto = primeraPalabra texto : palabras (quitarPrimeraPalabra texto)

-- 4)

palabraMasLargaAux :: [[Char]] -> [Char] -> [Char]
palabraMasLargaAux [] palabraMax = palabraMax
palabraMasLargaAux (palabra : palabrasRestantes) palabraMax
    | longitud palabra > longitud palabraMax = palabraMasLargaAux palabrasRestantes palabra
    | otherwise = palabraMasLargaAux palabrasRestantes palabraMax

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga texto = palabraMasLargaAux (palabras texto) []

-- Funciones generales para ejercicios 5,6 y 7

repetirCaracterNVeces :: Char -> Integer -> [Char]
repetirCaracterNVeces c 0 = []
repetirCaracterNVeces c n = c : repetirCaracterNVeces c (n - 1)

aplanarConNCaracteres :: [[Char]] -> Char -> Integer -> [Char]
aplanarConNCaracteres [] _ _ = []
aplanarConNCaracteres (palabra : []) _ _ = palabra
aplanarConNCaracteres (palabra : palabrasRestantes) c n =
    palabra ++ repetirCaracterNVeces c n ++ aplanarConNCaracteres palabrasRestantes c n

-- 6)

aplanar :: [[Char]] -> [Char]
aplanar texto = aplanarConNCaracteres texto ' ' 0

-- 7)

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos texto = aplanarConNCaracteres texto ' ' 1

-- 8)

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos texto n = aplanarConNCaracteres texto ' ' n

-- b)

-- El agregar el renombre de tipos type Texto = [Char] solo cambia la signatura de las funciones

-- MARK: Ejercicio 5

-- 1)

sumatoriaHastaN :: (Num t) => [t] -> Integer -> t
sumatoriaHastaN [] _ = 0
sumatoriaHastaN (x : xs) n
    | n == 0 = x
    | otherwise = x + sumatoriaHastaN xs (n - 1)

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = sumaAcumuladaAux xs 0
  where
    sumaAcumuladaAux xs i
        | i == longitud xs = []
        | otherwise = sumatoriaHastaN xs i : sumaAcumuladaAux xs (i + 1)

-- 2)

-- Funciones necesarias de la guia 4

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n i
    | div n i * i == n = i
    | otherwise = menorDivisorAux n (i + 1)

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorAux n 2

--

factoresPrimos :: Integer -> [Integer]
factoresPrimos 1 = []
factoresPrimos n = menorFactor : factoresPrimos (div n menorFactor)
  where
    menorFactor = menorDivisor n

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x : xs) = factoresPrimos x : descomponerEnPrimos xs