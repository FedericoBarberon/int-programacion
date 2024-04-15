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