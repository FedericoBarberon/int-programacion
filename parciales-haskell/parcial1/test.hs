import Parcial
import Test.HUnit

expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("EXPECTED ANY OF: " ++ show expected ++ "\n BUT GOT: " ++ show actual)

formulas1 :: [Formula]
formulas1 = [("1", "2"), ("3", "4"), ("5", "6")]

formulas2 :: [Formula]
formulas2 = [("3", "1"), ("5", "2"), ("6", "4")]

formulasInvalidas1 :: [Formula]
formulasInvalidas1 = [("2", "2"), ("1", "3")]

formulasInvalidas2 :: [Formula]
formulasInvalidas2 = [("2", "1"), ("2", "3")]

formulasInvalidas3 :: [Formula]
formulasInvalidas3 = [("2", "1"), ("4", "1")]

formulasInvalidas4 :: [Formula]
formulasInvalidas4 = [("2", "1"), ("3", "2")]

runAll = runTestTT testSuiteVotosEnBlanco >> runTestTT testSuiteFormulasValidas >> runTestTT testSuitePorcentajeDeVotos >> runTestTT testSuiteProximoPresidente

runSingle t = runTestTT t

testSuiteVotosEnBlanco =
  test
    [ "Sin formulas, sin votos, votosTotales = 0" ~: votosEnBlanco [] [] 0 ~?= 0,
      "Sin formulas, sin votos, votosTotales > 0" ~: votosEnBlanco [] [] 50 ~?= 50,
      "Con formulas, con votos, votosTotales = suma de votos" ~: votosEnBlanco formulas1 [50, 5, 25] 80 ~?= 0,
      "Con formulas, con votos, votosTotales > suma de votos" ~: votosEnBlanco formulas1 [42, 6, 40] 100 ~?= 12
    ]

testSuiteFormulasValidas =
  test
    [ "Sin formulas" ~: formulasValidas [] ~?= True,
      "Misma persona de presidente y vice en una formula" ~: formulasValidas formulasInvalidas1 ~?= False,
      "Misma persona de presidente en dos formulas distintas" ~: formulasValidas formulasInvalidas2 ~?= False,
      "Misma persona de vice en dos formulas distintas" ~: formulasValidas formulasInvalidas3 ~?= False,
      "Misma persona de presidente y vice en dos formulas distintas" ~: formulasValidas formulasInvalidas4 ~?= False,
      "Formula valida" ~: formulasValidas formulas1 ~?= True
    ]

testSuitePorcentajeDeVotos =
  test
    [ "Una sola formula" ~: porcentajeDeVotos "1" [("1", "2")] [25] ~?= 1.0,
      "Varias formulas, votos de presidente 0" ~: porcentajeDeVotos "1" formulas1 [0, 23, 40] ~?= 0.0,
      "Varias formulas, votos de presidente > 0" ~: porcentajeDeVotos "6" formulas2 [23, 40, 34] ~?= 34 / 97
    ]

testSuiteProximoPresidente =
  test
    [ "Una sola formula" ~: proximoPresidente [("3", "5")] [50] ~?= "3",
      "Varias formulas con un ganador" ~: proximoPresidente formulas1 [40, 23, 0] ~?= "1",
      "Varias formulas con empate" ~: expectAny (proximoPresidente formulas2 [20, 34, 34]) ["5", "6"]
    ]
