module Solucion where

-- Completar con los datos del grupo
--
-- Nombre de Grupo: AlGODripmos
-- Integrante 1: Santiago Rocca, santiagorocca17@gmail.com, 152/23
-- Integrante 2: Mauricio Cabral, mauriciocab25@gmail.com, 1640/21
-- Integrante 3: Maximiliano Fisz, maxifisz@gmail.com.ar, 586/19
-- Integrante 4: Lujan Aylan, aldanaylan@gmail.com, 685/22

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Funciones auxiliares compartidas

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a [] = False
pertenece  a (x:[]) | x == a = True
                    | otherwise = False
pertenece  a (x:xs) | x == a = True
                    | otherwise = False || pertenece a xs

longitud :: (Eq t) => [t] -> Int
longitud [] = 0
longitud (x:[]) = 1
longitud (x:xs) = 1 + longitud xs

usuarioPerteneceALista :: (Eq t) => t -> [[t]] -> Bool
usuarioPerteneceALista x [] = False
usuarioPerteneceALista x (y:[]) = pertenece x y
usuarioPerteneceALista x (y:ys) = pertenece x y && usuarioPerteneceALista x ys

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = eliminarRepetidos xs
                         | otherwise = [x] ++ eliminarRepetidos xs

listaPerteneceALista :: (Eq t) => [t] -> [t] -> Bool
listaPerteneceALista [] y = True
listaPerteneceALista (x:[]) y = pertenece x y   
listaPerteneceALista (x:xs) y | pertenece x y = True && listaPerteneceALista xs y
                              | otherwise = False && listaPerteneceALista xs y

-- Ejercicios----------------------------------------------------------------------

-- Dada un red social, itera la lista de usuarios de esta y devuelve una lista de los nombres de estos.
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (x,y,z) = iterarUsuarios (x)

iterarUsuarios :: [Usuario] -> [String]
iterarUsuarios [] = []
iterarUsuarios (x:[]) = [nombreDeUsuario x]
iterarUsuarios (x:xs) = [nombreDeUsuario x] ++ iterarUsuarios xs


-- Dada una red social y un usuario de esta, devuelve una lista de los usuarios amigos de este usuario.
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (x,[],z) a = []
amigosDe (x,(y:[]),z) a = matchRelacion y a
amigosDe (x,(y:ys),z) a = matchRelacion y a ++ amigosDe (x,ys,z) a

matchRelacion :: (Usuario, Usuario) -> Usuario -> [Usuario]
matchRelacion (x,y) a | x==a = [y] 
                      | y==a = [x]
                      | otherwise = []


-- Dada una red social y un usuario de esta, devuelve la cantidad de amigos de este usuario.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos x a = longitud (amigosDe x a) 


-- Dada una red social, devuelve un usuario que tenga el mayor numero de amigos.
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ((x:[]),y,z) = x
usuarioConMasAmigos (x,y,z) = comparadorDeCantidadDeAmigos (x,y,z) x (head x)

comparadorDeCantidadDeAmigos :: RedSocial -> [Usuario] -> Usuario -> Usuario 
comparadorDeCantidadDeAmigos ((x:[]),y,z) l u = u
comparadorDeCantidadDeAmigos r (a:[]) u = u
comparadorDeCantidadDeAmigos r (a:b:bs) u | cantidadDeAmigos r a >= cantidadDeAmigos r b = comparadorDeCantidadDeAmigos r (a:bs) a
                                          | otherwise = comparadorDeCantidadDeAmigos r (b:bs) b


-- Dada una red social nos devuelve True si Roberto Carlos pertenece a ella (un usuario con más de 100 amigos) o False si no pertenece a esta.
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos x | cantidadDeAmigos x (usuarioConMasAmigos x) > 10 = True
                    | otherwise = False


-- Dada una red social y un usuario y un usuario de esta, nos devuelve una lista de las publicaciones generadas por este usuario.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (x,y,[]) u = []
publicacionesDe (x,y,(z:zs)) u | nombreDeUsuario u == nombreDeUsuario (usuarioDePublicacion z) = [z] ++ publicacionesDe (x,y,zs) u
                               | otherwise = publicacionesDe (x,y,zs) u


-- Dada una red social y un usuario de esta, nos devuelve una lista de todas las publicaciones que le gustan a este usuario.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (x,y,z:[]) a = usuariosGustaPublicacion z a
publicacionesQueLeGustanA (x,y,z:zs) a = usuariosGustaPublicacion z a ++ publicacionesQueLeGustanA (x,y,zs) a          

usuariosGustaPublicacion :: Publicacion -> Usuario -> [Publicacion]
usuariosGustaPublicacion p a | pertenece a (likesDePublicacion p) == True = [p] 
                             | otherwise = []


-- Dada una red social y dos usuarios de esta, nos devuelve True si a ambos usuarios son les gustan las mismas publicaciones.
-- De lo contrario, devuelve False.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r a b | publicacionesQueLeGustanA  r a == publicacionesQueLeGustanA r b = True 
                                      | otherwise = False


-- Dada una red social y un usuario de esta, nos devuelve True si a algun otro usuario de la red social le gustan todas las publicaciones de este.
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel (x,y,z) u = compararListasDeLikeadores (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) (listasDeLikeadores (publicacionesDe (x,y,z) u))

compararListasDeLikeadores :: [Usuario] -> [[Usuario]] -> Bool
compararListasDeLikeadores (x:[]) y = usuarioPerteneceALista x y
compararListasDeLikeadores (x:xs) y | usuarioPerteneceALista x y == False = compararListasDeLikeadores xs y
                                    | otherwise = True 

listasDeLikeadores :: [Publicacion] -> [[Usuario]]
listasDeLikeadores (x:[]) = [likesDePublicacion x]
listasDeLikeadores (x:xs) = [likesDePublicacion x] ++ listasDeLikeadores xs 

-- Dada una red social y dos usuarios de esta, nos devuelve True si estos usuarios son amigos directa o indirectamente.
-- Indirectamente refiere a que haya una "cadena" de relaciones entre los dos usuarios. De lo contrario, devuelve False.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos r i f = pertenece f (recorredorDeListas r (amigosDe r i) (amigosDe r i)) 

recorredorDeListas :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
recorredorDeListas r (x:[]) i | listaPerteneceALista (amigosDe r x) i = i
                              | otherwise = recorredorDeListas r (eliminarRepetidos(amigosDe r x)) (eliminarRepetidos(i++(amigosDe r x)))
recorredorDeListas r (x:xs) i | listaPerteneceALista (amigosDe r x) i = recorredorDeListas r xs i
                              | otherwise = recorredorDeListas r (eliminarRepetidos(xs++amigosDe r x)) (eliminarRepetidos(i++amigosDe r x))