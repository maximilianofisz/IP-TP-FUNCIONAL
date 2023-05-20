module TestSuite8 where
import Test.HUnit
import Solucion

-- Datos para test suite 8
ts8_redsocial1 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximiliano"),("Hola mundo"),[])])
ts8_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a alguien le va a gustar"),[(2, "Lujan")])]) 
ts8_redsocial3 = ([(1,"Maximiliano"), (2,"Lujan"),(3,"Mauricio"),(4, "Santiago")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a algunos les va a gustar"),[(2, "Lujan"),(3, "Mauricio")])])
ts8_redsocial4 = ([(1,"Maximiliano"), (2,"Lujan"),(3,"Mauricio"),(4, "Santiago")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a algunos les va a gustar, también"),[(2, "Lujan"),(3, "Mauricio")]),((1,"Maximiliano"),("Esta es mi segunda publicacion que a algunos les va a gustar, también"),[(2, "Lujan"),(3, "Mauricio")])])

testSuite8 = test [
    "lesGustanLasMismasPublicaciones 1 - Red social sin me gusta en ninguna publicacion" ~: (lesGustanLasMismasPublicaciones ts8_redsocial1 (2,"Lujan") (3,"Mauricio")) ~?= True,
    "lesGustanLasMismasPublicaciones 2 - Red social con un me gusta de un usuario de entrada pero sin me gusta del segundo usuario" ~: (lesGustanLasMismasPublicaciones ts8_redsocial2 (2,"Lujan") (3,"Mauricio")) ~?= False,
    "lesGustanLasMismasPublicaciones 3 - Red social donde a ambos usuarios de entrada les gusta la misma publicacion" ~: (lesGustanLasMismasPublicaciones ts8_redsocial3 (2,"Lujan") (3,"Mauricio")) ~?= True,
    "lesGustanLasMismasPublicaciones 4 - Red social con varias publicaciones que le gustan a los dos usuarios de entrada" ~: (lesGustanLasMismasPublicaciones ts8_redsocial4 (2,"Lujan") (3,"Mauricio")) ~?= True
 ]