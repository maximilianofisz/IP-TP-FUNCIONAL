module TestSuite10 where
import Test.HUnit
import Solucion

-- Datos para test suite 10
ts10_redsocial1 = ([(1,"Maximiliano"),(2,"Mauricio")],[],[])
ts10_redsocial2 = ([(1,"Maximiliano"),(2,"Mauricio")],[((1,"Maximiliano"),(2,"Mauricio"))],[])
ts10_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"), (3, "Lujan")],[((1,"Maximiliano"), (2,"Mauricio")),((2,"Mauricio"),(3, "Lujan"))],[])
ts10_redsocial4 = ([(1,"Maximiliano"), (2,"Mauricio"), (3, "Lujan"), (4,"Santiago"), (5, "Bodoque"), (6,"Tulio")],[((1,"Maximiliano"), (2,"Mauricio")),((2,"Mauricio"),(4, "Santiago")),((4,"Santiago"),(5,"Bodoque")),((5,"Bodoque"),(3,"Lujan")),((2,"Mauricio"),(5, "Bodoque")),((6,"Tulio"),(4, "Santiago"))],[])

testSuite10 = test [
    "existeSecuenciaDeAmigos 1 - Hay dos usuarios pero no son amigos " ~: (existeSecuenciaDeAmigos ts10_redsocial1 (1,"Maximiliano") (2,"Mauricio")) ~?= False,
    "existeSecuenciaDeAmigos 2 - Hay dos usuarios y son amigos directamente" ~: (existeSecuenciaDeAmigos ts10_redsocial2 (1,"Maximiliano") (2,"Mauricio")) ~?= True,
    "existeSecuenciaDeAmigos 3 - Hay tres usuarios y hay secuencia de amigos entre los usuarios de entrada " ~: (existeSecuenciaDeAmigos ts10_redsocial3 (1,"Maximiliano") (3, "Lujan")) ~?= True,
    "existeSecuenciaDeAmigos 4 - Hay una secuencia larga de amigos entre los usuarios de entrada pero tambien relaciones random " ~: (existeSecuenciaDeAmigos ts10_redsocial4 (1,"Maximiliano") (3, "Lujan")) ~?= True
 ]