import Solucion
import Test.HUnit

testSuiteAproboMasDeNMaterias =
  test
    [ "Alumno no tiene notas" ~: aproboMasDeNMaterias [("Juan", []), ("Lucas", [2, 3, 7])] "Juan" 3 ~?= False,
      "Alumno no tiene materias aprobadas" ~: aproboMasDeNMaterias [("Maria", [5, 6, 6]), ("Juan", [3, 2, 3, 1])] "Juan" 1 ~?= False,
      "Alumno tiene n o menos materias aprobadas" ~: aproboMasDeNMaterias [("Juan", [4, 5, 2, 3])] "Juan" 2 ~?= False,
      "Alumno tiene mas de n materias aprobadas" ~: aproboMasDeNMaterias [("Juan", [6, 7, 5, 3, 6]), ("Martin", [2])] "Juan" 3 ~?= True
    ]

testSuiteBuenosAlumnos =
  test
    [ "Registro vacío" ~: buenosAlumnos [] ~?= [],
      "Alumnos sin promedio >= 8" ~: buenosAlumnos [("Juan", [6, 4, 2]), ("Maria", [7, 7, 9, 3]), ("Lucas", [7, 8, 8])] ~?= [],
      "Alumnos con promedio >= 8 pero con aplazos" ~: buenosAlumnos [("Juan", [8, 10, 3, 10, 6]), ("Pedro", [4, 8, 2]), ("Sofia", [6, 6, 5, 4])] ~?= [],
      "Alumnos con promedio >= 8 y sin aplazos" ~: mismosElementos (buenosAlumnos [("Juan", [8, 8, 9, 10]), ("Lucas", [7, 8, 8, 3, 10]), ("Matias", [10, 10, 9])]) ["Juan", "Matias"]
    ]

testSuiteMejorPromedio =
  test
    [ "Alumnos sin notas" ~: mejorPromedio [("Juan", []), ("Pedro", [])] ~?= "Juan",
      "Varios alumnos con el mismo promedio" ~: mejorPromedio [("Juan", [3, 4, 8, 10]), ("Maria", [8, 10, 4, 3]), ("Lucas", [5, 9, 5, 3])] ~?= "Juan",
      "Un alumno con mayor promedio" ~: mejorPromedio [("Juan", [2, 7]), ("Maria", [10, 8, 9]), ("Lucas", [7, 7, 8])] ~?= "Maria"
    ]

testSuiteSeGraduoConHonores =
  test
    [ "Alumno no aprobó todas las materias" ~: seGraduoConHonores [("Juan", [7, 5, 8, 9]), ("Martin", [10, 8])] 5 "Juan" ~?= False,
      "Alumno no es un buen alumno" ~: seGraduoConHonores [("Juan", [7, 8, 4, 9]), ("Lucas", [10, 10, 7])] 4 "Juan" ~?= False,
      "Alumno aprobo todas las materias y es un buen alumno" ~: seGraduoConHonores [("Juan", [8, 10, 9, 7, 7]), ("Marin", [4, 8, 2])] 5 "Juan" ~?= True
    ]

-- Test aux functions

mismosElementos actual expected = length actual == length expected && mismosElementosAux actual expected ~? ("Expected to " ++ show actual ++ " to have the same elements that " ++ show expected)
  where
    mismosElementosAux [] _ = True
    mismosElementosAux (x : xs) expected = elem x expected && mismosElementosAux xs expected

-- Run tests functions

testAproboMasDeNMaterias = runTestTT testSuiteAproboMasDeNMaterias

testBuenosAlumnos = runTestTT testSuiteBuenosAlumnos

testMejorPromedio = runTestTT testSuiteMejorPromedio

testSeGraduoConHonores = runTestTT testSuiteSeGraduoConHonores

runAll = testAproboMasDeNMaterias >> testBuenosAlumnos >> testMejorPromedio >> testSeGraduoConHonores