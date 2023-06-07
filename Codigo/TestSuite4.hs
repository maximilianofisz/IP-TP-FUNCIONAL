module TestSuite4 where
import Test.HUnit
import Solucion

-- Datos para test suite 4
ts4_relacion1 = ((1, "Maximiliano"),(2, "Lujan"))
ts4_relacion2 = ((1, "Maximiliano"),(3, "Mauricio"))
ts4_relacion3 = ((1, "Maximiliano"),(4, "Santiago"))
ts4_relacion4 = ((2, "Lujan"),(3, "Mauricio"))
ts4_relacion5 = ((2, "Lujan"),(4, "Santiago"))
ts4_relacion6 = ((1, "Maximiliano"),(5,"Pilar"))
ts4_relacion7 = ((2,"Lujan"),(5,"Pilar"))
ts4_relacion8 = ((3,"Mauricio"),(4,"Santiago"))
ts4_relacion9 = ((3,"Mauricio"),(5,"Pilar"))
ts4_relacion10 = ((4,"Santiago"),(5,"Pilar"))


ts4_redsocial1 = ([(1,"Maximiliano")], [], []) 
ts4_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago")], [ts4_relacion1,ts4_relacion2,ts4_relacion3,ts4_relacion4,ts4_relacion5], []) 
ts4_redsocial3 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago")], [ts4_relacion1,ts4_relacion2,ts4_relacion3,ts4_relacion4], [])
ts4_redsocial4 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio"),(4, "Santiago"),(5,"Pilar")], [ts4_relacion1,ts4_relacion2,ts4_relacion3,ts4_relacion4,ts4_relacion5,ts4_relacion6,ts4_relacion7,ts4_relacion8,ts4_relacion9,ts4_relacion10],[])
testSuite4 = test [
    "usuarioConMasAmigos 1 - Red social con un único usuario" ~: (usuarioConMasAmigos ts4_redsocial1) ~?= (1, "Maximiliano"),
    "usuarioConMasAmigos 2 - Red social con varios usuarios, dos de ellos con la misma cantidad de amigos" ~: (usuarioConMasAmigos ts4_redsocial2) ~?= (1, "Maximiliano") || (2,"Lujan")
    "usuarioConMasAmigos 3 - Red social con varios usuarios, un usuario tiene la mayor cantidad de amigos" ~: (usuarioConMasAmigos ts4_redsocial3) ~?= (1, "Maximiliano")
    "usuarioConMasAmigos 4 - Red social con los usuarios teniendo a todos los usuarios como amigos" ~: (usuarioConMasAmigos ts4_redsocial4) ~?= (1,"Maximiliano") || (2,"Lujan") || (3,"Mauricio") || (4, "Santiago") || (5,"Pilar")
    ]
