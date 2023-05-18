module TestSuite1 where
import Test.HUnit
import Solucion

--nombresDeUsuarios :: RedSocial -> [String]
--nombresDeUsuarios (x,y,z) = iterarUsuarios (x)

--iterarUsuarios :: [Usuario] -> [String]
--iterarUsuarios (x:[]) = [nombreDeUsuario x]
--iterarUsuarios (x:xs) = [nombreDeUsuario x] ++ iterarUsuarios xs
-- Datos para test suite 1

ts1_1redsocial = ([],[],[])
ts1_2redsocial = ([(1,"Maximiliano")],[],[])
ts1_3redsocial = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan")],[],[])

testSuite1 = test [
    " nombresDeUsuarios 1" ~: (nombresDeUsuarios ts1_1redsocial) ~?= [],
    " nombresDeUsuarios 2" ~: (nombresDeUsuarios ts1_2redsocial) ~?= ["Maximiliano"],
    " nombresDeUsuarios 2" ~: (nombresDeUsuarios ts1_3redsocial) ~?= ["Maximiliano", "Mauricio", "Lujan"]
 ]

