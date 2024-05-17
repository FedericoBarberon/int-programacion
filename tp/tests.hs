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
      "cifrarLista" ~: testSuiteCifrarLista
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
    [ "Mensaje sin cambios posibles" ~: cifrar "ABCDEFG" 2 ~?= "ABCDEFG",
      "Mensaje con algunos cambios posibles" ~: cifrar "ABcd,Efgh?" 3 ~?= "ABfg,Eijk?",
      "Mensaje con todos cambios posibles" ~: cifrar "zoqkdabe" (-4) ~?= "vkmgzwxa"
    ]

testSuiteDescifrar =
  test
    [ "Mensaje sin cambios posibles" ~: descifrar "ABCDEFG" 2 ~?= "ABCDEFG",
      "Mensaje con algunos cambios posibles" ~: descifrar "ABfg,Eijk?" 3 ~?= "ABcd,Efgh?",
      "Mensaje con todos cambios posibles" ~: descifrar "vkmgzwxa" (-4) ~?= "zoqkdabe"
    ]

testSuiteCifrarLista =
  test
    [ "lista vacía" ~: cifrarLista [] ~?= [],
      "lista con un elemento" ~: cifrarLista ["computacion"] ~?= ["computacion"],
      "lista con varios elementos" ~: cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"]
    ]
