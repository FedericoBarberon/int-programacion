import Solucion
import Test.HUnit

testSuiteHayQueCodificar =
  test
    [ "Mapeo vacío" ~: hayQueCodificar 'a' [] ~?= False,
      "Caracter no es la primer componente de ningun mapeo" ~: hayQueCodificar 'a' [('b', 'a'), ('c', 'r')] ~?= False,
      "Caracter es la primer componente de algun mapeo" ~: hayQueCodificar 'f' [('c', 'r'), ('f', 't'), ('l', 'p')] ~?= True
    ]

testSuiteCuantasVecesHayQueCodificar =
  test
    [ "Mapeo vacío" ~: cuantasVecesHayQueCodificar 'a' "hola" [] ~?= 0,
      "Caracter no es la primer componente de ningun mapeo" ~: cuantasVecesHayQueCodificar 'o' "hola" [('l', 'x'), ('r', 'p')] ~?= 0,
      "Caracter es la primer componente de algun mapeo" ~: cuantasVecesHayQueCodificar 'o' "hola todo bien" [('o', 'u'), ('a', 'e')] ~?= 3
    ]

testSuiteLaQueMasHayQueCodificar =
  test
    [ "Un solo caracter que se puede codificar" ~: laQueMasHayQueCodificar "Hola" [('r', 'a'), ('o', 'm')] ~?= 'o',
      "Varios caracteres se puede codificar, uno solo aparece mas veces" ~: laQueMasHayQueCodificar "Testeando" [('s', 'z'), ('e', 'l'), ('a', 'k')] ~?= 'e',
      "Varios caracteres se pueden codificar, varios aparecen la misma cantidad de veces" ~: laQueMasHayQueCodificar "Hola gato" [('l', 'm'), ('o', 'a'), ('a', 'z')] ~?= 'o'
    ]

testSuiteCodificarFrase =
  test
    [ "Mapeo vacío" ~: codificarFrase "hola" [] ~?= "hola",
      "Frase no tiene caracteres codificables" ~: codificarFrase "hola" [('t', 'p'), ('x', 'e')] ~?= "hola",
      "Frase tiene algunos caracteres codificables" ~: codificarFrase "TesteaNdo" [('e', ' '), ('N', 'P'), ('r', 'T')] ~?= "T st aPdo",
      "Frase se puede codificar toda" ~: codificarFrase "PruebA" [('r', 'a'), ('P', 'G'), ('u', 't'), ('b', 's'), ('e', 'o'), ('A', '!')] ~?= "Gatos!"
    ]

-- Run Tests Functions

testHayQueCodificar = runTestTT testSuiteHayQueCodificar

testCuantasVecesHayQueCodificar = runTestTT testSuiteCuantasVecesHayQueCodificar

testLaQueMasHayQueCodificar = runTestTT testSuiteLaQueMasHayQueCodificar

testCodificarFrase = runTestTT testSuiteCodificarFrase

runAll = testHayQueCodificar >> testCuantasVecesHayQueCodificar >> testLaQueMasHayQueCodificar >> testCodificarFrase