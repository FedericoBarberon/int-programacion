-- MARK: Ejercicio 1

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- MARK: Ejercicio 2

parteEntera :: Float -> Integer
parteEntera n
    | n >= 0 && n < 1 = 0
    | n >= 1 = 1 + parteEntera (n - 1)
    | otherwise = (-1) + parteEntera (n + 1)

-- MARK: Ejercicio 3

{-
problema esDivisible(a: Z, b: Z): Bool {
    requiere: {a > 0 && b > 0}
    asegura: {res = True <-> existe un k natural tq a = k.b}
}
-}

esDivisible :: Integer -> Integer -> Bool
esDivisible a b
    | a >= b = esDivisible (a-b) b
    | otherwise = a == 0

-- MARK: Ejercicio 4

{-
problema sumaImparesHasta(n: Z): Z {
    requiere: {n > 0}
    asegura: {res = la suma de todos los numeros impares hasta n}
}

problema sumaImpares(n: Z): Z {
    requiere: {n > 0}
    asegura: {res = la suma de los primeros n numeros impares}
}
-}

sumaImparesHasta :: Integer -> Integer
sumaImparesHasta n
    | n <= 0 = 0
    | mod n 2 /= 0 = n + sumaImparesHasta (n-1)
    | otherwise = 0 + sumaImparesHasta (n-1)

sumaImpares :: Integer -> Integer
sumaImpares n = sumaImparesHasta (n*2 - 1)

-- MARK: Ejercicio 5

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n-2)

-- MARK: Ejercicio 6

{-
problema sumaDigitos(n: Z): Z {
    requiere: {n > 0}
    asegura: {res = la suma de los dígitos de n}
}
-}

sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

-- MARK: Ejercicio 7

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | mod n 10 == n = True
    | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
    | otherwise = False

-- MARK: Ejercicio 8

cantDigitos :: Integer -> Integer
cantDigitos n
    | div n 10 == 0 = 1
    | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n (10 ^ (cantDigitos n - i))) 10

-- MARK: Ejercicio 9

{-
problema esCapicua(n: Z): Bool {
    requiere: {n >= 0}
    asegura: {res = True <-> n es un numero capicua}
}
-}

esCapicua_aux :: Integer -> Integer -> Bool
esCapicua_aux n i
    | div (nDigitos) 2 >= i = iesimoDigito n i == iesimoDigito n (nDigitos + 1 - i) && esCapicua_aux n (i+1)
    | otherwise = True
    where nDigitos = cantDigitos n

esCapicua :: Integer -> Bool
esCapicua n = esCapicua_aux n 1