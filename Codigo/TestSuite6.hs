module TestSuite6 where
import Test.HUnit
import Solucion

-- Datos para test suite 6
ts6_redsocial0 = ([], [], [])
ts6_redsocial1 = ([(1,"Maximiliano"),(2,"Lujan")],[],[])
ts6_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximiliano"),("Hay que ser, siempre el mejor"),[])])
ts6_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan"),(4,"Santiago")],[((1,"Maximiliano"),(2,"Mauricio"))],[((1,"Maximiliano"),("Hay que ser, siempre el mejor"),[]),((1,"Maximiliano"),("Mejor que nadie mas!"),[])])

testSuite6 = test [
    "publicacionesDe 1 - El usuario no tiene publicaciones " ~: publicacionesDe ts6_redsocial1 (1,"Maximiliano") ~?= [],
    "publicacionesDe 2 - El usuario tiene al menos 1 publicacion " ~: publicacionesDe ts6_redsocial2 (1,"Maximiliano") ~?= [((1,"Maximiliano"),"Hay que ser, siempre el mejor",[])],
    "publicacionesDe 3 - El usuario tiene multiples publicaciones " ~: publicacionesDe ts6_redsocial3 (1,"Maximiliano") ~?= [((1,"Maximiliano"),"Hay que ser, siempre el mejor",[]),((1,"Maximiliano"),"Mejor que nadie mas!",[])]
 ]