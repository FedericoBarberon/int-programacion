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
todosIguales (x : xs) = x == head xs && todosIguales xs

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
sacarBlancosRepetidos (c : chList)
    | c == ' ' && head chList == ' ' = sacarBlancosRepetidos chList
    | otherwise = c : sacarBlancosRepetidos chList

-- 2)

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (c : []) | c /= ' ' = 1 | otherwise = 0
contarPalabras (c : chList)
    | c /= ' ' && head chList == ' ' = 1 + contarPalabras chList
    | otherwise = contarPalabras chList