import Solucion
import Test.HUnit

runAll = runTestTT allTests

allTests =
  test
    [ "esMinuscula" ~: testSuiteEsMinuscula,
      "letraANatural" ~: testSuiteLetraANatural,
      "desplazar" ~: testSuiteDesplazar,
      "cifrar" ~: testSuiteCifrar,
      "descifrar" ~: testSuiteDescifrar,
      "cifrarLista" ~: testSuiteCifrarLista,
      "frecuencia" ~: testSuiteFrecuencia,
      "cifradoMasFrecuente" ~: testSuiteCifradoMasFrecuente,
      "esDecifrado" ~: testSuiteEsDecifrado
    ]

testSuiteEsMinuscula =
  test
    [ "letra minuscula" ~: esMinuscula 'g' ~?= True,
      "letra mayuscula" ~: esMinuscula 'H' ~?= False,
      "simbolo" ~: esMinuscula '-' ~?= False
    ]

testSuiteLetraANatural =
  test
    [ "letra a" ~: letraANatural 'a' ~?= 0,
      "letra z" ~: letraANatural 'z' ~?= 25,
      "otra letra" ~: letraANatural 'd' ~?= 3
    ]

testSuiteDesplazar =
  test
    [ "¬ (ord 'a' <= ord c <= ord 'z')" ~: desplazar 'L' 2 ~?= 'L',
      "n == 0" ~: desplazar 'k' 0 ~?= 'k',
      "0 <= n <= ord 'z' - ord c <= 25" ~: desplazar 'f' 15 ~?= 'u',
      "0 <= ord 'z' - ord c <= n <= 25" ~: desplazar 'h' 23 ~?= 'e',
      "-25 <= ord 'a' - ord c <= n <= 0" ~: desplazar 'd' (-2) ~?= 'b',
      "-25 <= n <= ord 'a' - ord c <= 0" ~: desplazar 'r' (-18) ~?= 'z'
    ]

testSuiteCifrar =
  test
    [ "mensaje sin cambios posibles" ~: cifrar "ABCDEFG" 2 ~?= "ABCDEFG",
      "mensaje con algunos cambios posibles" ~: cifrar "ABcd,Efgh?" 3 ~?= "ABfg,Eijk?",
      "mensaje con todos cambios posibles" ~: cifrar "zoqkdabe" (-4) ~?= "vkmgzwxa"
    ]

testSuiteDescifrar =
  test
    [ "mensaje sin cambios posibles" ~: descifrar "ABCDEFG" 2 ~?= "ABCDEFG",
      "mensaje con algunos cambios posibles" ~: descifrar "ABfg,Eijk?" 3 ~?= "ABcd,Efgh?",
      "mensaje con todos cambios posibles" ~: descifrar "vkmgzwxa" (-4) ~?= "zoqkdabe"
    ]

testSuiteCifrarLista =
  test
    [ "lista vacía" ~: cifrarLista [] ~?= [],
      "lista con un elemento" ~: cifrarLista ["computacion"] ~?= ["computacion"],
      "lista con varios elementos" ~: cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"]
    ]

testSuiteFrecuencia =
  test
    [ "sin minusculas" ~: frecuencia "PRUEBA" ~?= [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
      "con algunas minusculas" ~: frecuencia "PruEba" ~?= [25.0, 25.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 25.0, 0.0, 0.0, 25.0, 0.0, 0.0, 0.0, 0.0, 0.0],
      "con todas minusculas" ~: frecuencia "probando" ~?= [12.5, 12.5, 0.0, 12.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 12.5, 25.0, 12.5, 0.0, 12.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    ]

testSuiteCifradoMasFrecuente =
  test
    [ "desplazamiento 0" ~: cifradoMasFrecuente "PRUEBa" 0 ~?= ('a', 100.0),
      "varias letras con misma frecuencia" ~: expectAny (cifradoMasFrecuente "coMPuTAcioN" 3) [('f', 33.333336), ('r', 33.333336)],
      "una letra con mayor frecuencia" ~: cifradoMasFrecuente "pRobANdo" 5 ~?= ('t', 40.0)
    ]

testSuiteEsDecifrado =
  test
    [ "strings vacíos" ~: esDescifrado "" "" ~?= True,
      "strings con diferente longitud" ~: esDescifrado "compu" "frpsxwdflrq" ~?= False,
      "s2 es un cifrado de s1" ~: esDescifrado "compu" "frpsx" ~?= True,
      "se no es un cifrado de s1" ~: esDescifrado "hola" "chau" ~?= False
    ]

-- test aux functions

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)