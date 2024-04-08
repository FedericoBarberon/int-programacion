f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k n = g (f n)

{-
ej2 - c
problema maximo3(a: Z, b: Z, c: Z): Z {
    require {True}
    asegura {(res = a) o (res = b) o (res = c)}
    asegura {(res >= a) y (res >= b) y (res >= c)}
}
-}

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c 
    | a >= b && a >= c = a
    | b >= a && b >= c = b
    | otherwise = c

{-
ej2 - g
problema sumaDistintos(a: Z, b: Z, c: Z): Z {
    require {True}
    asegura {res = a + b + c <-> a != b != c}
    asegura {res = a + b <-> a != b y (c == a o c == b)}
    asegura {res = a + c <-> a != c y (b == a o b == c)}
    asegura {res = b + c <-> b != c y (a == b o a == c)}
    asegura {res = 0 <-> a == b == c}
}
-}

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c 
    | a /= b && a /= c = a + b + c
    | a /= b && (c == a || c == b) = a + b
    | a /= c && (b == a || b == c) = a + c
    | b /= c && (a == b || a == c) = b + c
    | otherwise = 0

{-
ej2 - i
problema digitoUnidades(x: Z): Z {
    require {True}
    asegura {res > 10 && res < 10}
    asegura {res es el digito de la unidad de x}
}
-}

digitoUnidades :: Int -> Int
digitoUnidades x = mod (abs x) 10

{-
ej2 - j
problema digitoDecenas(x: Z): Z {
    require {True}
    asegura {res > 10 && res < 10}
    asegura {res es el digito de las decenas de x}
}
-}

digitoDecenas :: Int -> Int
digitoDecenas x = div (mod (abs x) 100 - mod (abs x) 10) 10

{-
ej4 - b

problema todoMenor(a: RxR, b: RxR): Bool {
    require: {True}
    asegura: {res = True <-> (a[0] < b[0]) && (a[1] < b[0])}
}
-}

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor a b = (fst(a) < fst(b) && snd(a) < snd(b))

{-
ej3

problema estanRelacionados(a: Z, b: Z): Bool {
    requiere: {a /= 0 y b /= 0}
    asegura: {(res = True) <-> a*a + a*b*k = 0 para algún k perteneciente a los Z con k /= 0}
}
-}

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = mod (a*a) (a*b) == 0

{-
ej4 - a

problema prodInt(a: RxR, b: RxR): R {
    requiere: {True}
    asegura: {res = a[0] * b[1] + a[1] * b[0]}
}
-}

prodInt :: (Int, Int) -> (Int, Int) -> Int
prodInt a b = fst a * fst b + snd a * snd b

{-
ej4 - c

problema distanciaPuntos(a: RxR, b: RxR) {
    require: {True}
    asegura: {res = sqrt((b[0] - a[0])^2 + (b[1] - a[1])^)}
}
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos a b = sqrt ((fst b - fst a)^2 + (snd b - snd a)^2)

{-
ej4 - d

problema sumaTerna(x: ZxZxZ): Z {
    require: {True}
    asegura: {res = x[0] + x[1] + x[2]}
}
-}

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna x = x !! 0 + x !! 1 + x !! 2