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
    | a >= b = esDivisible (a - b) b
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
    | mod n 2 /= 0 = n + sumaImparesHasta (n - 1)
    | otherwise = 0 + sumaImparesHasta (n - 1)

sumaImpares :: Integer -> Integer
sumaImpares n = sumaImparesHasta (n * 2 - 1)

-- MARK: Ejercicio 5

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n - 2)

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

esCapicuaAux :: Integer -> Integer -> Bool
esCapicuaAux n i
    | div nDigitos 2 >= i = iesimoDigito n i == iesimoDigito n (nDigitos + 1 - i) && esCapicuaAux n (i + 1)
    | otherwise = True
  where
    nDigitos = cantDigitos n

esCapicua :: Integer -> Bool
esCapicua n = esCapicuaAux n 1

-- MARK: Ejercicio 10

{- a)
problema f1(n: Z): Z {
    requiere: {n >= 0}
    asegura: {res = la sumatoria de i en 0 hasta n de n^i}
}
-}

f1 :: Integer -> Integer
f1 0 = 1
f1 n = f1 (n - 1) + 2 ^ n

{- b)
problema f2(n: Z, q: R): R {
    requiere: {n > 0}
    asegura: {res = la sumatoria de i en 1 hasta n de q^i}
}
-}

f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = f2 (n - 1) q + q ^ n

{- c)
problema f3(n: Z, q: R): R {
    requiere: {n >= 0}
    asegura: {res = la sumatoria de i en 1 hasta 2n de q^i}
}
-}

f3 :: Integer -> Float -> Float
f3 0 _ = 0
f3 n q = f2 (2 * n) q

{- d)
problema f4(n: Z, q: R): R {
    requiere: {n >= 0}
    asegura: {res = la sumatoria de i en n hasta 2n de q^i}
}
-}

f4Aux :: Integer -> Float -> Float
f4Aux 0 _ = 1
f4Aux n q = f4Aux (n - 1) q + q ^ n

f4 :: Integer -> Float -> Float
f4 0 _ = 1
f4 n q = f4Aux (2 * n) q - f4Aux (n - 1) q

-- MARK: Ejercicio 11

{- a)
problema eAprox(n: Z): R {
    requiere: {n >= 0}
    asegura: {res = la sumatoria de i en 0 hasta n de 1/i!}
}
-}

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = eAprox (n - 1) + 1 / (fromIntegral (factorial n))

-- b)

e :: Float
e = eAprox 10

-- MARK: Ejercicio 12

{-
problema raizDe2Aprox(n: Z): R {
    requiere: {n > 0}
    asegura: {res = an - 1, donde a1 = 2, an = 2 + 1/a(n-1) }
}
-}

raizDe2AproxAux :: Integer -> Float
raizDe2AproxAux 1 = 2
raizDe2AproxAux n = 2 + 1 / (raizDe2AproxAux (n - 1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = raizDe2AproxAux n - 1

-- MARK: Ejercicio 13

{-
problema fEj13(n: Z, m: Z): Z {
    requiere: {n > 0 && m > 0}
    asegura: {res = la sumatoria de i en 1 hasta n de la sumatoria de j en 1 hasta m de i^j}
}
-}

fEj13Aux :: Integer -> Integer -> Integer
fEj13Aux n 1 = n
fEj13Aux n m = fEj13Aux n (m - 1) + n ^ m

fEj13 :: Integer -> Integer -> Integer
fEj13 1 m = fEj13Aux 1 m
fEj13 n m = fEj13 (n - 1) m + fEj13Aux n m

-- MARK: Ejercicio 14

{-
problema sumaPotencias(q: Z, n: Z, m: Z): Z {
    requiere: {q > 0 && n > 0 && m > 0}
    asegura: {res = la sumatoria de i en 1 hasta n de la sumatoria de j en 1 hasta m de q^(i+j)}
}
-}

sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q i 1 = q ^ (i + 1)
sumaPotenciasAux q i j = sumaPotenciasAux q i (j - 1) + q ^ (i + j)

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 1 j = sumaPotenciasAux q 1 j
sumaPotencias q i j = sumaPotencias q (i - 1) j + sumaPotenciasAux q i j

-- MARK: Ejercicio 15

{-
problema sumaRacionales(n: Z, m: Z): R {
    requiere: {n > 0 && m > 0}
    asegura: {res = la sumatoria de i en 1 hasta n de la sumatoria de j en 1 hasta m de i/j}
}
-}

sumaRacionalesAux :: Integer -> Integer -> Float
sumaRacionalesAux n 1 = fromIntegral n
sumaRacionalesAux n m = sumaRacionalesAux n (m - 1) + fromIntegral n / fromIntegral m

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 m = sumaRacionalesAux 1 m
sumaRacionales n m = sumaRacionales (n - 1) m + sumaRacionalesAux n m

-- MARK: Ejercicio 16

-- a)

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n i
    | div n i * i == n = i
    | otherwise = menorDivisorAux n (i + 1)

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorAux n 2

-- b)

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

-- c)

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m = menorDivisor n /= menorDivisor m

-- d)

nEsimoPrimoAux :: Integer -> Integer -> Integer
nEsimoPrimoAux n i
    | esPrimo i && n == 1 = i
    | esPrimo i = nEsimoPrimoAux (n - 1) (i + 1)
    | otherwise = nEsimoPrimoAux n (i + 1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2

-- MARK: Ejercicio 17

esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux n i = fibonacci i == n || fibonacci i < n && esFibonacciAux n (i + 1)

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciAux n 0

-- MARK: Ejercicio 18

mayorDigitoParAux :: Integer -> Integer -> Integer -> Integer
mayorDigitoParAux n i max
    | i > cantDigitos n = max
    | mod iDigito 2 == 0 && iDigito > max = mayorDigitoParAux n (i + 1) iDigito
    | otherwise = mayorDigitoParAux n (i + 1) max
  where
    iDigito = iesimoDigito n i

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigitoParAux n 1 (-1)

-- MARK: Ejercicio 19

esSumaInicialDePrimosAux :: Integer -> Integer -> Bool
esSumaInicialDePrimosAux n i = n == 0 || (n > 0 && esSumaInicialDePrimosAux (n - nEsimoPrimo i) (i + 1))

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 1
