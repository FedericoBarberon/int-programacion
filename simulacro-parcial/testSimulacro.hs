import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "relacionesValidas: Caso base" ~: relacionesValidas [] ~?= True,
    "relacionesValidas: Caso relacion con uno mismo" ~: relacionesValidas [("juan", "juan"), ("ana", "pedro")] ~?= False,
    "relacionesValidas: Caso relacion repetida" ~: relacionesValidas [("ana", "pedro"), ("pedro", "juan"), ("ana", "pedro")] ~?= False,
    "relacionesValidas: Caso relacion repetida inversa" ~: relacionesValidas [("ana", "pedro"), ("Lucas", "juan"), ("pedro", "ana")] ~?= False,
    "relacionesValidas: Caso relaciones diferentes" ~: relacionesValidas [("ana", "pedro"), ("lucas", "juan"), ("ana", "lucas")] ~?= True,
    
    "personas: Caso base" ~: (personas [] ~?= []),
    "personas: Caso todas personas diferentes" ~: personas [("juan", "pedro"), ("ana", "lucas"), ("martin", "sofia")] ~?= ["juan", "pedro", "ana", "lucas", "martin", "sofia"],
    "personas: Caso con personas con varias relaciones" ~: personas [("pedro", "juan"), ("lucas", "pedro"), ("lucas", "juan")] ~?= ["pedro", "lucas", "juan"],

    "amigosDe: Caso base" ~: amigosDe "juan" [] ~?= [],
    "amigosDe: Caso persona sin relaciones" ~: amigosDe "juan" [("ana", "martin"), ("lucas", "sofia")] ~?= [],
    "amigosDe: Caso persona con 1 relacion" ~: amigosDe "juan" [("ana", "juan"), ("lucas", "sofia")] ~?= ["ana"],
    "amigosDe: Caso persona relacionada con todos" ~: amigosDe "juan" [("juan", "ana"), ("ana", "pedro"), ("pedro", "juan")] ~?= ["ana", "pedro"],

    "personasConMasAmigos: Caso base" ~: personaConMasAmigos [] ~?= [],
    "personasConMasAmigos: Caso hay personas con misma cantidad de amigos" ~: personaConMasAmigos [("juan", "pedro"), ("juan", "lucas"), ("pedro", "ana")] ~?= "juan",
    "personaConMasAmigos: Caso hay persona con mayor cantidad de amigos" ~: personaConMasAmigos [("juan", "pedro"), ("ana", "juan"), ("juan", "lucas")] ~?= "juan"
    ]