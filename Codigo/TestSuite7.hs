module TestSuite7 where
import Test.HUnit
import Solucion

{-
type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

  Dada una red social y un usuario de esta, nos devuelve una lista de todas las publicaciones que le gustan a este usuario.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (x,y,z:[]) a = usuariosGustaPublicacion z a
publicacionesQueLeGustanA (x,y,z:zs) a = usuariosGustaPublicacion z a ++ publicacionesQueLeGustanA (x,y,zs) a

usuariosGustaPublicacion :: Publicacion -> Usuario -> [Publicacion]
usuariosGustaPublicacion p a | pertenece a (likesDePublicacion p) = [p]
                             | otherwise = []

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a [] = False
pertenece  a (x:[]) | x == a = True
                    | otherwise = False
pertenece  a (x:xs) | x == a = True
                    | otherwise = False || pertenece a xs

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-}

ts7_redsocial1 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((2,"Lujan"),("Yo opino que opinar es necesario"),[])])
ts7_redsocial2 = ([(1,"Maximiliano"),(2,"Lujan"),(3,"Mauricio")],[],[((2,"Lujan"),("Porque tengo inteligencia y por eso siempre opino"),[(1, "Maximiliano")])]) 
ts7_redsocial3 = ([(1,"Maximiliano"), (2,"Mauricio"),(3,"Lujan"),(4,"Santiago")],[((1,"Maximiliano"),(2,"Mauricio"))],[((1,"Maximiliano"),("Yo opino que si opino un pensamiento"),[(3, "Lujan"),(2, "Mauricio")]),((4,"Santiago"),("Que me venga a la cabeza hago critica social"),[(3, "Lujan"),(1, "Maximiliano")])])

testSuite7 = test [
    " publicacionesQueLeGustanA 1 - Al usuario no le gusta ninguna publicacion " ~: publicacionesQueLeGustanA ts7_redsocial1 (1,"Maximiliano") ~?= [],
    " publicacionesQueLeGustanA 2 - Al usuario le gusta una publicacion " ~: publicacionesQueLeGustanA ts7_redsocial2 (1,"Maximiliano")  ~?= [((2,"Lujan"),("Porque tengo inteligencia y por eso siempre opino"),[(1, "Maximiliano")])],
    " publicacionesQueLeGustanA 3 - Al usuario le gusta mas de una publicacion " ~: publicacionesQueLeGustanA ts7_redsocial3 (3,"Lujan") ~?= [((1,"Maximiliano"),"Yo opino que si opino un pensamiento",[(3,"Lujan"),(2,"Mauricio")]),((4,"Santiago"),"Que me venga a la cabeza hago critica social",[(3,"Lujan"),(1,"Maximiliano")])]
 ]