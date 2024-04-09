-- Ejercicio 1

-- a)
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

-- b)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

-- c)

h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k n = g (f n)

------------------------------------

-- Ejercicio 2

{- a)
problema absoluto(x: Z): Z {
    requiere: {True}
    asegura: {res = x <-> x >= 0 y res = -x <-> x < 0}
}
-}

absoluto :: Int -> Int
absoluto x
    | x >= 0 = x
    | otherwise = -x

{- b)
problema maximoAbsoluto(x: Z, y: Z): Z {
    requiere: {True}
    asegura: {res = absoluto x || res = absoluto y}
    asegura: {res >= absoluto x && res >= absoluto y}
}
-}

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y
    | absX >= absY = absX
    | otherwise = absY
  where
    absX = absoluto x
    absY = absoluto y

{- c)
problema maximo3(a: Z, b: Z, c: Z): Z {
    require: {True}
    asegura: {(res = a) o (res = b) o (res = c)}
    asegura: {(res >= a) y (res >= b) y (res >= c)}
}
-}

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c
    | a >= b && a >= c = a
    | b >= a && b >= c = b
    | otherwise = c

{- d)
problema algunoEs0(a: Float, b: Float): Bool {
    requiere: {True}
    asegura: {res = (a == 0 || b == 0)}
}
-}

algunoEs0 :: Float -> Float -> Bool
algunoEs0 a b = a == 0 || b == 0

algunoEs0PM :: Float -> Float -> Bool
algunoEs0PM 0 _ = True
algunoEs0PM _ 0 = True
algunoEs0PM _ _ = False

{- e)
problema ambosSon0(a: Float, b: Float): Bool {
    requiere: {True}
    asegura: {res = True <-> (a == 0 && b == 0)}
}
-}

ambosSon0 :: Float -> Float -> Bool
ambosSon0 a b = a == 0 && b == 0

ambosSon0PM :: Float -> Float -> Bool
ambosSon0PM 0 0 = True
ambosSon0PM _ _ = False

{- f)
problema mismoInteralo(x: R, y: R): Bool {
    requiere: {True}
    asegura: {x <= 3 && y <= 3 -> res = True}
    asegura: {(x > 3 && x <= 7) && (y > 3 && y <= 7) -> res = True}
    asegura: {x > 7 && y > 7 -> res = True}
}
-}

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y = (x <= 3 && y <= 3) || (x > 3 && x <= 7 && y > 3 && y <= 7) || (x > 7 && y > 7)

{- g)
problema sumaDistintos(a: Z, b: Z, c: Z): Z {
    require: {True}
    asegura: {res = a + b + c <-> a != b != c}
    asegura: {res = a + b <-> a != b y (c == a o c == b)}
    asegura: {res = a + c <-> a != c y (b == a o b == c)}
    asegura: {res = b + c <-> b != c y (a == b o a == c)}
    asegura: {res = 0 <-> a == b == c}
}
-}

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c
    | a /= b && a /= c = a + b + c
    | a /= b && (c == a || c == b) = a + b
    | a /= c && (b == a || b == c) = a + c
    | b /= c && (a == b || a == c) = b + c
    | otherwise = 0

{- h)
problema esMultiploDe(a: Z, b: Z): Bool {
    requiere: {a > 0}
    requiere: {b > 0}
    asegura: {res = True <-> existe un k natural / a = bk}
}
-}

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b = mod a b == 0

{- i)
problema digitoUnidades(x: Z): Z {
    require: {True}
    asegura: {res > 10 && res < 10}
    asegura: {res es el digito de la unidad de x}
}
-}

digitoUnidades :: Int -> Int
digitoUnidades x = mod (abs x) 10

{- j)
problema digitoDecenas(x: Z): Z {
    require: {True}
    asegura: {res > 10 && res < 10}
    asegura: {res es el digito de las decenas de x}
}
-}

digitoDecenas :: Int -> Int
digitoDecenas x = div (mod (abs x) 100 - mod (abs x) 10) 10

------------------------------------

-- Ejercicio 3

{-
problema estanRelacionados(a: Z, b: Z): Bool {
    requiere: {a /= 0 y b /= 0}
    asegura: {(res = True) <-> a*a + a*b*k = 0 para algún k perteneciente a los Z con k /= 0}
}
-}

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = mod (a * a) (a * b) == 0

------------------------------------

-- Ejercicio 4

{- a)
problema prodInt(a: RxR, b: RxR): R {
    requiere: {True}
    asegura: {res = a[0] * b[1] + a[1] * b[0]}
}
-}

prodInt :: (Int, Int) -> (Int, Int) -> Int
prodInt a b = fst a * fst b + snd a * snd b

{- b)
problema todoMenor(a: RxR, b: RxR): Bool {
    require: {True}
    asegura: {res = True <-> (a[0] < b[0]) && (a[1] < b[0])}
}
-}

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor a b = fst a < fst b && snd a < snd b

{- c)
problema distanciaPuntos(a: RxR, b: RxR) {
    require: {True}
    asegura: {res = sqrt((b[0] - a[0])^2 + (b[1] - a[1])^)}
}
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos a b = sqrt ((fst b - fst a) ^ 2 + (snd b - snd a) ^ 2)

{- d)
problema sumaTerna(x: ZxZxZ): Z {
    require: {True}
    asegura: {res = x[0] + x[1] + x[2]}
}
-}

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a, b, c) = a + b + c

{- e)
problema sumarSoloMultiplos(terna: ZxZxZ, n: Z): Z {
    requiere: {n > 0}
    asegura: {res = terna[0] + terna[1] + terna[2] <-> esMultiploDe terna[0] n && esMultiploDe terna[1] n && esMultiploDe terna[2] n}
    asegura: {res = terna[0] + terna[1] <-> esMultiploDe terna[0] n && esMultiploDe terna[1]}
    asegura: {res = terna[1] + terna[2] <-> esMultiploDe terna[1] n && esMultiploDe terna[2]}
    asegura: {res = terna[0] + terna[2] <-> esMultiploDe terna[0] n && esMultiploDe terna[2]}
    asegura: {res = 0 <-> ¬(esMultiploDe terna[0] n && esMultiploDe terna[1] n && esMultiploDe terna[2] n) }
}
-}

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a, b, c) n
    | esMultiploDe a n && esMultiploDe b n && esMultiploDe c n = a + b + c
    | esMultiploDe a n && esMultiploDe b n = a + b
    | esMultiploDe b n && esMultiploDe c n = b + c
    | esMultiploDe a n && esMultiploDe c n = a + c
    | otherwise = 0

{- f)
problema posPrimerPar(x: ZxZxZ): Z {
    requiere: {True}
    asegura: {Sea i perteneciente a {1, 2, 3}, res = i <-> x[i] es par}
    asegura: {res = 4 <-> x no tiene ningún numero par}
}
-}

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a, b, c)
    | even a = 0
    | even b = 1
    | even c = 2
    | otherwise = 4

{- g)
problema crearPar(a: T1, b: T2): T1xT2 {
    require: {True}
    asegura: {res[0] = a && res[1] = b}
}
-}

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

{- h)
problema invertir(par: T1xT2): T2xT1 {
    requiere: {True}
    asegura: {res[0] = par[1] && res[1] = par[0]}
}
-}

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

------------------------------------

-- Ejercicio 5

{-
problema todosMenores(t: ZxZxZ): Bool {
    requiere: {True}
    asegura: {(res = true) <-> ((f'(t0) > g'(t0)) && (f'(t1) > g'(t1)) && (f'(t2) > g'(t2)))}
}

problema f'(n: Z): Z {
    requiere: {True}
    asegura: {(n ≤ 7 -> res = n^2) && (n > 7 -> res = 2n − 1)}
}

problema g'(n: Z): Z {
    requiere: {True}
    asegura: {Si n es un número par, entonces res = n/2, en caso contrario, res = 3n + 1}
}
-}

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (a, b, c) = (f' a > g' a) && (f' b > g' b) && (f' c > g' c)

f' :: Int -> Int
f' n | n <= 7 = n ^ 2 | otherwise = 2 * n - 1

g' :: Int -> Int
g' n | even n = div n 2 | otherwise = 3 * n + 1

------------------------------------

-- Ejercicio 6

{-
problema bisiesto (año: Z) : Bool {
    requiere: {True}
    asegura: {res = False <-> año no es múltiplo de 4 o año es múltiplo de 100 pero no de 400}
}
-}

bisiesto :: Int -> Bool
bisiesto año = not (mod año 4 /= 0 || (mod año 100 == 0 && mod año 400 /= 0))

------------------------------------

-- Ejercicio 7

{-
problema distanciaManhattan (p: RxRxR, q: RxRxR): R {
    requiere: {True}
    asegura: {res = la sumatoria de |pi - qi| desde i = 0 hasta i = 2}
}
-}

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (p0, p1, p2) (q0, q1, q2) = abs (p0 - q0) + abs (p1 - q1) + abs (p2 - q2)

------------------------------------

-- Ejercicio 8

{-
problema comparar (a: Z, b: Z): Z {
    requiere: {True}
    asegura: {(res = 1 <-> sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
    asegura: {(res = −1 <-> sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
    asegura: {(res = 0 <-> sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b))}
}
problema sumaUltimosDosDigitos (x: Z): Z {
    requiere: {True}
    asegura: {res = (|x| mod 10) + (⌊(|x| / 10)⌋ mod 10)}
}
-}

comparar :: Int -> Int -> Int
comparar a b
    | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
    | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
    | otherwise = 0

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10

------------------------------------

-- Ejercicio 9

-- a)

f1 :: Float -> Float
f1 n
    | n == 0 = 1
    | otherwise = 0

{-
problema f1(n: R): R {
    requiere: {True}
    asegura: {res = 1 <-> n = 0}
    asegura: {res = 0 <-> n != 0}
}
-}

-- b)

f2 :: Float -> Float
f2 n
    | n == 1 = 15
    | n == -1 = -15

{-
problema f2(n: R): R {
    requiere: {n pertenece a <1, -1>}
    asegura: {res = 15 <-> n = 1}
    asegura: {res = -15 <-> n = -1}
}
-}

-- c)

f3 :: Float -> Float
f3 n
    | n <= 9 = 7
    | n >= 3 = 5

{-
problema f3(n: R): R {
    requiere: {True}
    asegura: {res = 7 <-> n <= 9}
    asegura: {res = 5 <-> n >= 3}
}
-}

-- d)

f4 :: Float -> Float -> Float
f4 x y = (x + y) / 2

{-
problema f4(x: R, y: R): R {
    requiere: {True}
    asegura: {res = el valor medio entre x e y}
}
-}

-- e)

f5 :: (Float, Float) -> Float
f5 (x, y) = (x + y) / 2

{-
problema f5(p: RxR): R {
    requiere: {True}
    asegura: {res = (p[0] + p[1]) / 2}
}
-}

-- f)

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b

{-
problema f6(a: R, b: Z): Bool {
    requiere: {True}
    asegura: {res = True <-> ⌊a⌋ = b}
}
-}
