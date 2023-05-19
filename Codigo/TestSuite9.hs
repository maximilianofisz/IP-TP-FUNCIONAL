module TestSuite9 where
import Test.HUnit
import Solucion

-- Dada una red social y un usuario de esta, nos devuelve True si a algun otro usuario de la red social le gustan todas las publicaciones de este.
-- De lo contrario, devuelve False.
--tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
--tieneUnSeguidorFiel (x,y,z) u = compararListasDeLikeadores (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) (listasDeLikeadores (publicacionesDe (x,y,z) u))

--compararListasDeLikeadores :: [Usuario] -> [[Usuario]] -> Bool
--compararListasDeLikeadores (x:[]) y = usuarioPerteneceALista x y
--compararListasDeLikeadores (x:xs) y | usuarioPerteneceALista x y == False = compararListasDeLikeadores xs y
--                                    | otherwise = True 

--listasDeLikeadores :: [Publicacion] -> [[Usuario]]
--listasDeLikeadores (x:[]) = [likesDePublicacion x]
--listasDeLikeadores (x:xs) = [likesDePublicacion x] ++ listasDeLikeadores xs 
-- Datos para test suite 9

ts9_redsocial1 = ([(1,"Maximiliano")],[],[])
ts9_redsocial2 = ([(1,"Maximiliano")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a nadie le gusta"),[])])
ts9_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a mauricio le va a encantar"),[(2, "Mauricio")])])
ts9_redsocial4 = ([(1,"Maximiliano"), (2,"Mauricio")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a mi encanta"),[(1, "Maximiliano")])])
ts9_redsocial5 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan"),(4,"Santiago")],[((1,"Maximiliano"),(2,"Mauricio"))],[((1,"Maximiliano"),("Esta es mi publicacion que a mauricio le va a encantar"),[(2, "Mauricio")]),((1,"Maximiliano"),("Esta es mi segunda publicacion que a mauricio seguro le guste"),[(3, "Lujan"),(1, "Maximiliano")])])
ts9_redsocial6 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan"),(4,"Santiago")],[],[((1,"Maximiliano"),("Esta es mi publicacion que a mauricio le va a encantar"),[(2, "Mauricio")]),((1,"Maximiliano"),("Esta es mi segunda publicacion que a mauricio seguro le guste"),[(3, "Lujan"),(2, "Mauricio")])])

testSuite9 = test [
    " tieneUnSeguidorFiel 1 - Red social con un unico usuario sin publicaciones" ~: (tieneUnSeguidorFiel ts9_redsocial1 (1,"Maximiliano")) ~?= False,
    " tieneUnSeguidorFiel 2 - Red social con un usuario, su publicacion y un segundo usuario que no es su seguidor fiel" ~: (tieneUnSeguidorFiel ts9_redsocial2 (1, "Maximiliano")) ~?= False,
    " tieneUnSeguidorFiel 3 - Red social con un usuario, su publicacion y un segundo usuario que es su seguidor fiel" ~: (tieneUnSeguidorFiel ts9_redsocial3 (1, "Maximiliano")) ~?= True,
    " tieneUnSeguidorFiel 4 - Red social con un usuario y su publicacion y el usuario quiere ser su propio seguidor fiel " ~: (tieneUnSeguidorFiel ts9_redsocial4 (1, "Maximiliano")) ~?= False,
    " tieneUnSeguidorFiel 5 - Red social caso general con muchos usuarios, publicaciones, pero ningun amigo fiel " ~: (tieneUnSeguidorFiel ts9_redsocial5 (1, "Maximiliano")) ~?= False,
    " tieneUnSeguidorFiel 5 - Red social caso general con muchos usuarios, publicaciones, pero un amigo fiel " ~: (tieneUnSeguidorFiel ts9_redsocial6 (1, "Maximiliano")) ~?= True
 ]