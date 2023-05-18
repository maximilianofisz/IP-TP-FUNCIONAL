module TestSuite3 where
import Test.HUnit
import TestAlgo
import Solucion

--cantidadDeAmigos :: RedSocial -> Usuario -> Int
--cantidadDeAmigos x a = longitud (amigosDe x a) 
--Datos para test suite 3

ts3_1redsocial = ([],[],[]) ()
ts3_2redsocial = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5, "Juan")], [], []) 
ts3_3redsocial = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5, "Juan")], [tst_relacion1], [])
ts3_4redsocial = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5, "Juan")], [tst_relacion6, tst_relacion7], [])

testSuite3 = test [
    "cantidadDeAmigos 1" ~: (cantidadDeAmigos ts3_1redsocial_usuario) ~?= undefined,
    "cantidadDeAmigos 2" ~: (cantidadDeAmigos ts3_2redsocial_usuario (5, "Juan")) ~?= 0,
    "cantidadDeAmigos 3" ~: (cantidadDeAmigos ts3_3redsocial_usuario (2,"Lujan")) ~?= 1,
    "cantidadDeAmigos 4" ~: (cantidadDeAmigos ts3_4redsocial_usuario (5, "Juan")) ~?= 2
]


