module TestSuite8 where
import Test.HUnit
import Solucion

-- Dada una red social y dos usuarios de esta, nos devuelve True si a ambos usuarios les gustan las mismas publicaciones.
-- De lo contrario, devuelve False.
--lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
--lesGustanLasMismasPublicaciones r a b | publicacionesQueLeGustanA  r a == publicacionesQueLeGustanA r b = True 
--                                      | otherwise = False
{-
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (x,y,z:[]) a = usuariosGustaPublicacion z a
publicacionesQueLeGustanA (x,y,z:zs) a = usuariosGustaPublicacion z a ++ publicacionesQueLeGustanA (x,y,zs) a          

usuariosGustaPublicacion :: Publicacion -> Usuario -> [Publicacion]
usuariosGustaPublicacion p a | pertenece a (likesDePublicacion p) == True = [p] 
                             | otherwise = []
-}

-- Datos para test suite 8

ts8_redsocial1 = ([(1,"Maximiliano"),(2,"Lujan")],[],[])
ts8_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximilino"),("Hola mundo"),[])])
ts8_redsocial3 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximilino"),("Esta es mi publicacion que a alguien le va a gustar"),[(2, "Lujan")])]) 
ts8_redsocial4 = ([(1,"Maximiliano"), (2,"Lujan"),(3,"Mauricio"),(4, "Santiago")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a algunos les va a gustar"),[(2, "Lujan"),(3, "Mauricio")])])

testSuite8 = test [
    " lesGustanLasMismasPublicaciones 1 - Red social sin publicaciones" ~: (lesGustanLasMismasPublicaciones ts8_redsocial1 (1,"Maximiliano") (2,"Lujan")) ~?= True,
    " lesGustanLasMismasPublicaciones 2 - Red social con varios ususarios y una publicación sin me gusta" ~: (lesGustanLasMismasPublicaciones ts8_redsocial2 (2,"Lujan") (3,"Mauricio")) ~?= True,
    " lesGustanLasMismasPublicaciones 3 - Red social con varios usuarios y una publicación con un me gusta" ~: (lesGustanLasMismasPublicaciones ts8_redsocial3 (2,"Lujan") (3,"Mauricio")) ~?= False,
    " lesGustanLasMismasPublicaciones 4 - Red social con varios usuarios y una publicación con dos me gusta" ~: (lesGustanLasMismasPublicaciones ts8_redsocial4 (2,"Lujan") (3,"Mauricio")) ~?= True
 ]