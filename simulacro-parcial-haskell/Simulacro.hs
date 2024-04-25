module Simulacro where

-- Comprobante de correción: QtWnAs41 

duplaRepetida :: (Eq t) => (t,t) -> [(t,t)] -> Bool
duplaRepetida _ [] = False
duplaRepetida (a,b) ((c,d) : duplas) = (a == c || a == d) && (b == c || b == d) || duplaRepetida (a,b) duplas

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y : ys) = x == y || pertenece x ys

aplanarDuplas :: [(a, a)] -> [a]
aplanarDuplas [] = []
aplanarDuplas (dupla : duplas) = fst dupla : snd dupla : aplanarDuplas duplas

quitarRepetidos :: (Eq t) => [t] -> [t]
quitarRepetidos [] = []
quitarRepetidos (x : xs)
    | pertenece x xs = quitarRepetidos xs
    | otherwise = x : quitarRepetidos xs

longitud :: [t] -> Integer
longitud [] = 0
longitud xs = 1 + longitud (tail xs)

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (relacion : relaciones) = fst relacion /= snd relacion && not (duplaRepetida relacion relaciones)

personas :: [(String, String)] -> [String]
personas [] = []
personas relaciones = quitarRepetidos (aplanarDuplas relaciones)

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((persona1, persona2) : relaciones)
    | persona == persona1 = persona2 : amigosDe persona relaciones
    | persona == persona2 = persona1 : amigosDe persona relaciones
    | otherwise = amigosDe persona relaciones

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = []
personaConMasAmigos relaciones = personaConMasAmigosAux relaciones listaPersonas (head listaPersonas)
    where
        listaPersonas = personas relaciones
        personaConMasAmigosAux _ [] personaConMasRelaciones = personaConMasRelaciones
        personaConMasAmigosAux relaciones (persona : personasRestantes) personaConMasRelaciones
            | longitud (amigosDe persona relaciones) > longitud (amigosDe personaConMasRelaciones relaciones) = personaConMasAmigosAux relaciones (tail personasRestantes) persona
            | otherwise = personaConMasAmigosAux relaciones personasRestantes personaConMasRelaciones