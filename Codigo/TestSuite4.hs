module TestSuite4 where
import Test.HUnit
import Solucion

-- Dada una red social, devuelve un usuario que tenga el mayor numero de amigos.
--usuarioConMasAmigos :: RedSocial -> Usuario
--usuarioConMasAmigos ((x:[]),y,z) = x
--usuarioConMasAmigos (x,y,z) = comparadorDeCantidadDeAmigos (x,y,z) x (head x)

--comparadorDeCantidadDeAmigos :: RedSocial -> [Usuario] -> Usuario -> Usuario 
--comparadorDeCantidadDeAmigos ((x:[]),y,z) l u = u
--comparadorDeCantidadDeAmigos r (a:[]) u = u
--comparadorDeCantidadDeAmigos r (a:b:bs) u | cantidadDeAmigos r a >= cantidadDeAmigos r b = comparadorDeCantidadDeAmigos r (a:bs) a
--                                          | otherwise = comparadorDeCantidadDeAmigos r (b:bs) b
-- Datos para test suite 4

ts4_relacion1 = ((1, "Maximiliano"),(2, "Lujan"))
ts4_relacion2 = ((1, "Maximiliano"),(3, "Mauricio"))
ts4_relacion3 = ((1, "Maximiliano"),(4, "Santiago"))
ts4_relacion4 = ((2, "Lujan"),(3, "Mauricio"))
ts4_relacion5 = ((2, "Lujan"),(4, "Santiago"))

ts4_redsocial1 = ([(1,"Maximiliano")], [], []) 
ts4_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago")], [ts4_relacion1,ts4_relacion2,ts4_relacion3,ts4_relacion4,ts4_relacion5], []) 
ts4_redsocial3 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago")], [ts4_relacion1,ts4_relacion2,ts4_relacion3,ts4_relacion4], [])

testSuite4 = test [
    "usuarioConMasAmigos 1 - Red social con un único usuario" ~: (usuarioConMasAmigos ts4_redsocial1) ~?= (1, "Maximiliano"),
    "usuarioConMasAmigos 2 - Usuarios con misma cantidad de amigos, devuelve al primero que encuentra" ~: (usuarioConMasAmigos ts4_redsocial2) ~?= (1, "Maximiliano"),
    "usuarioConMasAmigos 3 - Usuario con mayor cantidad de amigos" ~: (usuarioConMasAmigos ts4_redsocial3) ~?= (1, "Maximiliano")
 ]
