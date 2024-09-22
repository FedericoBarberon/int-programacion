module Solucion where

type Alumno = String

type Notas = [Int]

type CantidadDeMaterias = Int

type Registro = [(Alumno, Notas)]

aproboMasDeNMaterias :: Registro -> Alumno -> Int -> Bool
aproboMasDeNMaterias registro alumno n = cantidadDeMateriasAprobadas (obtenerNotasDeAlumno registro alumno) > n

buenosAlumnos :: Registro -> [Alumno]
buenosAlumnos [] = []
buenosAlumnos ((alumno, notas) : registro)
  | esBuenAlumno = alumno : buenosAlumnos registro
  | otherwise = buenosAlumnos registro
  where
    esBuenAlumno = promedio notas >= 8 && not (tieneAplazos notas)

mejorPromedio :: Registro -> Alumno
mejorPromedio ((al1, notas) : registro) = mejorPromedioAux registro (al1, promedio notas)
  where
    mejorPromedioAux :: Registro -> (Alumno, Float) -> Alumno
    mejorPromedioAux [] (alConMejorPromedio, _) = alConMejorPromedio
    mejorPromedioAux ((al1, notasAl1) : registro) (alConMejorPromedio, mejorPromedio)
      | promedioAl1 > mejorPromedio = mejorPromedioAux registro (al1, promedioAl1)
      | otherwise = mejorPromedioAux registro (alConMejorPromedio, mejorPromedio)
      where
        promedioAl1 = promedio notasAl1

seGraduoConHonores :: Registro -> CantidadDeMaterias -> Alumno -> Bool
seGraduoConHonores registro cantDeMaterias alumno =
  aproboMasDeNMaterias registro alumno (cantDeMaterias - 1) && pertenece alumno (buenosAlumnos registro)

-- Aux Functions

obtenerNotasDeAlumno :: Registro -> Alumno -> Notas
obtenerNotasDeAlumno [] _ = []
obtenerNotasDeAlumno ((al1, notas) : registro) alumno
  | al1 == alumno = notas
  | otherwise = obtenerNotasDeAlumno registro alumno

cantidadDeMateriasAprobadas :: Notas -> Int
cantidadDeMateriasAprobadas [] = 0
cantidadDeMateriasAprobadas (nota : notas)
  | nota >= 4 = 1 + cantidadDeMateriasAprobadas notas
  | otherwise = cantidadDeMateriasAprobadas notas

tieneAplazos :: Notas -> Bool
tieneAplazos [] = False
tieneAplazos (x : xs) = x < 4 || tieneAplazos xs

promedio :: [Int] -> Float
promedio [] = 0.0
promedio xs = fromIntegral (sumatoria xs) / fromIntegral (longitud xs)

sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

longitud :: [t] -> Int
longitud [] = 0
longitud (_ : xs) = 1 + longitud xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x : xs) = e == x || pertenece e xs