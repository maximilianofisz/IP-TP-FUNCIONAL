module TestSuite5 where
import Test.HUnit
import Solucion

-- Datos para test suite 5
ts5_redsocial1 = ([],[],[])
ts5_redsocial2 = (ts5_usuariosRobertoCarlos,ts5_relacionesRobertoCarloIgualA10,[])
ts5_redsocial3 = (ts5_usuariosRobertoCarlos,ts5_relacionesRobertoCarloMayorA10,[])

ts5_usuariosRobertoCarlos = [(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan"),(4,"Santiago"),(5,"Juan"),(6,"Carlos"),(7,"Bodoque"),(8,"Tulio"),(9,"Juanin"),(10,"Calcetin ConRombos Man"),(11, "El camarografo"),(12, "Ikari shinji kun")]

ts5_relacionesRobertoCarloIgualA10 = [ts5_relacion1, ts5_relacion2, ts5_relacion3, ts5_relacion4, ts5_relacion5, ts5_relacion6, ts5_relacion7, ts5_relacion8, ts5_relacion9, ts5_relacion10 ]
ts5_relacionesRobertoCarloMayorA10 = [ts5_relacion1, ts5_relacion2, ts5_relacion3, ts5_relacion4, ts5_relacion5, ts5_relacion6, ts5_relacion7, ts5_relacion8, ts5_relacion9, ts5_relacion10, ts5_relacion11 ]

ts5_relacion1 = ((1,"Maximiliano"),(2,"Mauricio"))
ts5_relacion2 = ((1, "Maximiliano"), (3, "Lujan"))
ts5_relacion3 = ((1, "Maximiliano"), (4, "Santiago"))
ts5_relacion4 = ((1, "Maximiliano"), (5, "Juan"))
ts5_relacion5 = ((1, "Maximiliano"), (6, "Carlos"))
ts5_relacion6 = ((1, "Maximiliano"), (7, "Bodoque"))
ts5_relacion7 = ((1, "Maximiliano"), (8, "Tulio"))
ts5_relacion8 = ((1, "Maximiliano"), (9, "Juanin"))
ts5_relacion9 = ((1, "Maximiliano"), (10, "Calcetin ConRombos Man"))
ts5_relacion10 = ((1, "Maximiliano"), (11, "El camarografo"))
ts5_relacion11 = ((1, "Maximiliano"), (12, "Ikari shinji kun"))

testSuite5 = test [
    "estaRobertoCarlos 1 - Red social vacia" ~: (estaRobertoCarlos ts5_redsocial1) ~?= False,
    "estaRobertoCarlos 2 - Red social sin un usuario con mas de 10 amigos" ~: (estaRobertoCarlos ts5_redsocial2) ~?= False,
    "estaRobertoCarlos 3 - Red social con un usuario con mas de 10 amigos" ~: (estaRobertoCarlos ts5_redsocial3) ~?= True
 ]