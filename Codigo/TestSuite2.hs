module TestSuite2 where
import Test.HUnit
import Solucion

-- Datos para test suite 2
ts2_relacion1 = ((1, "Maximiliano"),(2, "Lujan"))
ts2_relacion2 = ((1, "Maximiliano"),(3, "Mauricio"))
ts2_relacion3 = ((1, "Maximiliano"),(4, "Santiago"))
ts2_relacion4 = ((1, "Maximiliano"),(5, "Juan"))
ts2_relacion5 = ((1, "Maximiliano"),(6, "Carlos"))
ts2_relacion6 = ((2, "Lujan"),(3, "Mauricio"))
ts2_relacion7 = ((4, "Santiago"),(5, "Juan"))

ts2_redsocial1 = ([(1, "Maximiliano")], [], [])
ts2_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan")], [((1, "Maximiliano"),(2, "Lujan"))],[])
ts2_redsocial3 = ([(1,"Maximiliano"),(2,"Lujan")], [((2, "Lujan"),(1, "Maximiliano"))],[])
ts2_redsocial4 = ([(1,"Maximiliano"),(2,"Lujan"),(3, "Mauricio"),(4, "Santiago"),(5, "Juan"),(6, "Carlos"),(7, "Bodoque")],[ts2_relacion1, ts2_relacion2, ts2_relacion3, ts2_relacion4, ts2_relacion5, ts2_relacion6, ts2_relacion7],[])
ts2_redsocial5 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Santiago")], [ts2_relacion6, ts2_relacion7],[])

testSuite2 = test [
    "amigosDe 1 - Red con un único usuario, no hay relaciones" ~: (amigosDe ts2_redsocial1 (1,"Maximiliano")) ~?= [],
    "amigosDe 2 - Usuario con un único amigo" ~: (amigosDe ts2_redsocial2 (2, "Lujan")) ~?= [(1, "Maximiliano")],
    "amigosDe 3 - Usuario con un único amigo, con la relación en orden invertido" ~: (amigosDe ts2_redsocial3 (1, "Maximiliano")) ~?= [(2, "Lujan")],
    "amigosDe 4 - Usuario con más de un amigo" ~: (amigosDe ts2_redsocial4 (1, "Maximiliano")) ~?= [(2,"Lujan"),(3, "Mauricio"),(4, "Santiago"),(5, "Juan"),(6, "Carlos")],
    "amigosDe 5 - Red con muchos usuarios y relaciones pero con usuario de entrada sin amigos" ~: (amigosDe ts2_redsocial5 (1, "Maximiliano")) ~?= []
 ]
