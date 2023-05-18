module TestSuite2 where
import Test.HUnit
import Solucion

-- Datos para test suite 2

tst_relacion1 = ((1, "Maximiliano"),(2, "Lujan"))
tst_relacion2 = ((1, "Maximiliano"),(3, "Mauricio"))
tst_relacion3 = ((1, "Maximiliano"),(4, "Santiago"))
tst_relacion4 = ((1, "Maximiliano"),(5, "Juan"))
tst_relacion5 = ((1, "Maximiliano"),(6, "Carlos"))

ts2_1redsocial = ([(1, "Maximiliano")], [], [])
ts2_2redsocial = ([(1,"Maximiliano"),(2,"Lujan")], [((1, "Maximiliano"),(2, "Lujan"))],[])
ts2_3redsocial = ([(1,"Maximiliano"),(2,"Lujan")], [((2, "Lujan"),(1, "Maximiliano"))],[])
ts2_4redsocial = ([(1,"Maximiliano"),(2,"Lujan"),(3, "Mauricio"),(4, "Santiago"),(5, "Juan"),(6, "Carlos"),(7, "Bodoque")],[tst_relacion1, tst_relacion2, tst_relacion3, tst_relacion4, tst_relacion5],[])

testSuite2 = test [
    " amigosDe 1" ~: (amigosDe ts2_1redsocial (1,"Maximiliano")) ~?= [],
    " amigosDe 2" ~: (amigosDe ts2_2redsocial (2, "Lujan")) ~?= [(1, "Maximiliano")],
    " amigosDe 3" ~: (amigosDe ts2_3redsocial (1, "Maximiliano")) ~?= [(2, "Lujan")],
    " amigosDe 4" ~: (amigosDe ts2_4redsocial (1, "Maximiliano")) ~?= [(2,"Lujan"),(3, "Mauricio"),(4, "Santiago"),(5, "Juan"),(6, "Carlos")]
 ]
