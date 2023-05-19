module TestSuite6 where
import Test.HUnit
import Solucion

{-
- Dada una red social y un usuario y un usuario de esta, nos devuelve una lista de las publicaciones generadas por este usuario.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (x,y,[]) u = []
publicacionesDe (x,y,(z:zs)) u | nombreDeUsuario u == nombreDeUsuario (usuarioDePublicacion z) = [z] ++ publicacionesDe (x,y,zs) u
                               | otherwise = publicacionesDe (x,y,zs) u

-}

ts6_redsocial0 = ([], [], [])
ts6_redsocial1 = ([(1,"Maximiliano"),(2,"Lujan")],[],[])
ts6_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((1,"Maximiliano"),("Hay que ser, siempre el mejor"),[])])
ts6_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan"),(4,"Santiago")],[((1,"Maximiliano"),(2,"Mauricio"))],[((1,"Maximiliano"),("Hay que ser, siempre el mejor"),[]),((1,"Maximiliano"),("Mejor que nadie mas!"),[])])

testSuite6 = test [
    " publicacionesDe - El usuario no tiene publicaciones " ~: publicacionesDe ts6_redsocial1 ~?= [],
    " publicacionesDe - El usuario tiene al menos 1 publicacion " ~: publicacionesDe ts6_redsocial2 ~?= [((1,"Maximiliano"),"Hay que ser, siempre el mejor",[])],
    " publicacionesDe - El usuario tiene multiples publicaciones " ~: publicacionesDe ts6_redsocial3 ~?= [((1,"Maximiliano"),"Hay que ser, siempre el mejor",[]),((1,"Maximiliano"),"Mejor que nadie mas!",[])]
 ]