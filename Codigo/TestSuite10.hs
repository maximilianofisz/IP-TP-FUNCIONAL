module TestSuite10 where
import Test.HUnit
import Solucion

--nombresDeUsuarios :: RedSocial -> [String]
--nombresDeUsuarios (x,y,z) = iterarUsuarios (x)

--iterarUsuarios :: [Usuario] -> [String]
--iterarUsuarios (x:[]) = [nombreDeUsuario x]
--iterarUsuarios (x:xs) = [nombreDeUsuario x] ++ iterarUsuarios xs
-- Datos para test suite 1

ts1_redsocial1 = ([],[],[])
ts1_redsocial2 = ([(1,"Maximiliano")],[],[])
ts1_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan")],[],[])

testSuite1 = test [
    " nombresDeUsuarios 1" ~: (nombresDeUsuarios ts1_redsocial1) ~?= [],
    " nombresDeUsuarios 2" ~: (nombresDeUsuarios ts1_redsocial2) ~?= ["Maximiliano"],
    " nombresDeUsuarios 3" ~: (nombresDeUsuarios ts1_redsocial3) ~?= ["Maximiliano", "Mauricio", "Lujan"]