import Solucion
import Test.HUnit

-- Tests Suites

testSuiteCantMinuscula =
  test
    [ "Mensaje vacío" ~: cantMinuscula "" ~?= 0,
      "Mensaje sin minusculas" ~: cantMinuscula "ABCDE" ~?= 0,
      "Mensaje con minusculas" ~: cantMinuscula "AbcDe" ~?= 3
    ]

testSuiteMaximoCambios =
  test
    [ "Sin mensajes" ~: maximoCambios [] ~?= [],
      "Mensajes sin cambios posibles" ~: expectAny (maximoCambios ["ABC", "DEF", "GHI"]) ["ABC", "DEF", "GHI"],
      "Un mensaje con cambios posibles" ~: maximoCambios ["ABC", "Def", "GHI"] ~?= "Def",
      "Varios mensajes con cambios" ~: expectAny (maximoCambios ["ABc", "DeF", "GHI"]) ["ABc", "DeF"]
    ]

testSuiteDesplazar =
  test
    [ "¬ (ord 'a' <= ord a <= ord 'z')" ~: desplazar 'L' 2 ~?= 'L',
      "d == 0" ~: desplazar 'k' 0 ~?= 'k',
      "0 <= d <= ord 'z' - ord a <= 25" ~: desplazar 'f' 15 ~?= 'u',
      "0 <= ord 'z' - ord a <= d <= 25" ~: desplazar 'h' 23 ~?= 'e',
      "-25 <= ord 'a' - ord a <= d <= 0" ~: desplazar 'd' (-2) ~?= 'b',
      "-25 <= d <= ord 'a' - ord a <= 0" ~: desplazar 'r' (-18) ~?= 'z'
    ]

testSuiteCodificar =
  test
    [ "Mensaje sin cambios posibles" ~: codificar "ABCDEFG" 2 ~?= "ABCDEFG",
      "Mensaje con algunos cambios posibles" ~: codificar "ABcd,Efgh?" 3 ~?= "ABfg,Eijk?",
      "Mensaje con todos cambios posibles" ~: codificar "zoqkdabe" (-4) ~?= "vkmgzwxa"
    ]

testSuiteDecodificar =
  test
    [ "Mensaje sin cambios posibles" ~: decodificar "ABCDEFG" 2 ~?= "ABCDEFG",
      "Mensaje con algunos cambios posibles" ~: decodificar "ABfg,Eijk?" 3 ~?= "ABcd,Efgh?",
      "Mensaje con todos cambios posibles" ~: decodificar "vkmgzwxa" (-4) ~?= "zoqkdabe"
    ]

-- Run tests functions

testCantMinuscula = runTestTT testSuiteCantMinuscula

testMaximoCambios = runTestTT testSuiteMaximoCambios

testDesplazar = runTestTT testSuiteDesplazar

testCodificar = runTestTT testSuiteCodificar

testDecodificar = runTestTT testSuiteDecodificar

runAll = testCantMinuscula >> testMaximoCambios >> testDesplazar >> testCodificar >> testDecodificar

-- Aux Functions

expectAny actual expected = elem actual expected ~? ("EXPECTED ANY OF: " ++ show expected ++ "\n BUT GOT: " ++ show actual)