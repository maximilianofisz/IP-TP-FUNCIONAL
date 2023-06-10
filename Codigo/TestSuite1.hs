module TestSuite1 where
import Test.HUnit
import Solucion

-- Datos para test suite 1
ts1_redsocial1 = ([],[],[])
ts1_redsocial2 = ([(1,"Maximiliano")],[],[])
ts1_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan")],[],[])

testSuite1 = test [
    "nombresDeUsuarios 1 - Red social sin usuarios" ~: (nombresDeUsuarios ts1_redsocial1) ~?= [],
    "nombresDeUsuarios 2 - Red social con un usuario" ~: (nombresDeUsuarios ts1_redsocial2) ~?= ["Maximiliano"],
    "nombresDeUsuarios 3 - Red Social con varios usuarios" ~: expectAny (nombresDeUsuarios ts1_redsocial3) [["Maximiliano", "Mauricio", "Lujan"],["Maximiliano", "Lujan", "Mauricio"],["Mauricio", "Maximiliano", "Lujan"],["Mauricio", "Lujan", "Maximiliano"]]
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)