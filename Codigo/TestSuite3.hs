module TestSuite3 where
import Test.HUnit
import Solucion

--cantidadDeAmigos :: RedSocial -> Usuario -> Int
--cantidadDeAmigos x a = longitud (amigosDe x a) 
--Datos para test suite 3

ts3_relacion1 = ((1, "Maximiliano"),(2, "Lujan"))
ts3_relacion2 = ((1, "Maximiliano"),(3, "Mauricio"))
ts3_relacion3 = ((1, "Maximiliano"),(4, "Santiago"))
ts3_relacion4 = ((1, "Maximiliano"),(5, "Juan"))
ts3_relacion5 = ((1, "Maximiliano"),(6, "Carlos"))

ts3_redsocial1 = ([],[],[])
ts3_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")], [], []) 
ts3_redsocial3 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5, "Juan")], [ts3_relacion1], [])
ts3_redsocial4 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5, "Juan")], [ts3_relacion1, ts3_relacion2, ts3_relacion3, ts3_relacion4, ts3_relacion5], [])

testSuite3 = test [
    "cantidadDeAmigos 1 - Red social vacía" ~: (cantidadDeAmigos ts3_redsocial1) ~?= 0,
    "cantidadDeAmigos 2 - Red social sin relaciones" ~: (cantidadDeAmigos ts3_redsocial2 (1,"Maximiliano")) ~?= 0,
    "cantidadDeAmigos 3 - Usuario con un único amigo" ~: (cantidadDeAmigos ts3_redsocial3 (2,"Lujan")) ~?= 1,
    "cantidadDeAmigos 4 - Usuario con más de un amigo" ~: (cantidadDeAmigos ts3_redsocial4 (1, "Maximiliano")) ~?= 5
 ]
