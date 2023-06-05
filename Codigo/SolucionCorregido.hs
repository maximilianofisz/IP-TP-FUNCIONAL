module SolucionCorregido where

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
usuarioPerteneceALista usuario [] = False
usuarioPerteneceALista usuario (x:[]) = pertenece usuario x
usuarioPerteneceALista usuario (x:xs) = pertenece usuario x && usuarioPerteneceALista usuario xs

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

-- Ejericio 1
-- Dada un red social, itera la lista de usuarios de esta y devuelve una lista de los nombres de estos.
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (usuarios,relaciones,publicaciones) = iterarUsuarios (usuarios)

iterarUsuarios :: [Usuario] -> [String]
iterarUsuarios [] = []
iterarUsuarios (u:[]) = [nombreDeUsuario u]
iterarUsuarios (u:us) = [nombreDeUsuario u] ++ iterarUsuarios us


-- Ejercicio 2
-- Dada una red social y un usuario de esta, devuelve una lista de los usuarios amigos de este usuario.
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usuarios,[],publicaciones) usuario = []
amigosDe (usuarios,(y:[]),publicaciones) usuario = matchRelacion y usuario
amigosDe (usuarios,(y:ys),publicaciones) usuario = matchRelacion y usuario ++ amigosDe (usuarios,ys,publicaciones) usuario

matchRelacion :: (Usuario, Usuario) -> Usuario -> [Usuario]
matchRelacion (x,y) usuario | x==usuario = [y]
                            | y==usuario = [x]
                            | otherwise = []


-- Ejercicio 3
-- Dada una red social y un usuario de esta, devuelve la cantidad de amigos de este usuario.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red usuario = longitud (amigosDe red usuario)


-- Ejercicio 4
-- Dada una red social, devuelve un usuario que tenga el mayor numero de amigos.
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ((x:[]),y,z) = x
usuarioConMasAmigos (x,y,z) = comparadorDeCantidadDeAmigos (x,y,z) x (head x)

comparadorDeCantidadDeAmigos :: RedSocial -> [Usuario] -> Usuario -> Usuario 
comparadorDeCantidadDeAmigos ((x:[]),y,z) l u = u
comparadorDeCantidadDeAmigos red (a:[]) u = u
comparadorDeCantidadDeAmigos red (a:b:bs) u | cantidadDeAmigos red a >= cantidadDeAmigos red b = comparadorDeCantidadDeAmigos red (a:bs) a
                                            | otherwise = comparadorDeCantidadDeAmigos red (b:bs) b


-- Ejercicio 5
-- Dada una red social nos devuelve True si Roberto Carlos pertenece a ella (un usuario con más de 100 amigos) o False si no pertenece a esta.
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red | cantidadDeAmigos red (usuarioConMasAmigos red) > 10 = True
                      | otherwise = False


-- Ejercicio 6
-- Dada una red social y un usuario y un usuario de esta, nos devuelve una lista de las publicaciones generadas por este usuario.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (x,y,[]) u = []
publicacionesDe (x,y,(z:zs)) u | nombreDeUsuario u == nombreDeUsuario (usuarioDePublicacion z) = [z] ++ publicacionesDe (x,y,zs) u
                               | otherwise = publicacionesDe (x,y,zs) u


-- Ejercicio 7
-- Dada una red social y un usuario de esta, nos devuelve una lista de todas las publicaciones que le gustan a este usuario.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (x,y,z:[]) usuario = usuariosGustaPublicacion z usuario
publicacionesQueLeGustanA (x,y,z:zs) usuario = usuariosGustaPublicacion z usuario ++ publicacionesQueLeGustanA (x,y,zs) usuario        

usuariosGustaPublicacion :: Publicacion -> Usuario -> [Publicacion]
usuariosGustaPublicacion publicacion usuario | pertenece usuario (likesDePublicacion publicacion) = [publicacion] 
                                             | otherwise = []


-- Dada una red social y dos usuarios de esta, nos devuelve True si a ambos usuarios les gustan las mismas publicaciones.
-- De lo contrario, devuelve False.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r a b | publicacionesQueLeGustanA  r a == publicacionesQueLeGustanA r b = True 
                                      | otherwise = False


-- Dada una red social y un usuario de esta, nos devuelve True si a algun otro usuario de la red social le gustan todas las publicaciones de este.
-- De lo contrario, devuelve False.
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel (x,y,[]) u = False
tieneUnSeguidorFiel (x,y,z) u | longitud (publicacionesDe (x,y,z) u) == 0 = False
                              | longitud (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) == 0 = False
                              | longitud (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) == 1 && head (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) == u = False
                              | otherwise = compararListasDeLikeadores (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) (listasDeLikeadores (publicacionesDe (x,y,z) u))

--
compararListasDeLikeadores :: [Usuario] -> [[Usuario]] -> Bool
compararListasDeLikeadores [] y = False
compararListasDeLikeadores (x:[]) y = usuarioPerteneceALista x y
compararListasDeLikeadores (x:xs) y | usuarioPerteneceALista x y == False = compararListasDeLikeadores xs y
                                    | otherwise = True 

listasDeLikeadores :: [Publicacion] -> [[Usuario]]
listasDeLikeadores (x:[]) = [likesDePublicacion x]
listasDeLikeadores (x:xs) = [likesDePublicacion x] ++ listasDeLikeadores xs 

-- Dada una red social y dos usuarios de esta, nos devuelve True si estos usuarios son amigos directa o indirectamente.
-- Indirectamente refiere a que haya una "cadena" de relaciones entre los dos usuarios. De lo contrario, devuelve False.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red i f = pertenece f (recorredorDeListas red (amigosDe red i) (amigosDe red i)) 

-- Dada una red social y dos listas de usuarios de esta, lista1 y lista2, por cada iteración se agregan los amigos del head de la lista1 
--a la cola de la lista1 y a la lista2, luego se eliminan los repetidos, la función finaliza una vez que la lista1 queda vacía y devuelve la lista2. 
recorredorDeListas :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
recorredorDeListas red [] i = []
recorredorDeListas red (x:[]) i | listaPerteneceALista (amigosDe red x) i = i
                                | otherwise = recorredorDeListas red (eliminarRepetidos(amigosDe red x)) (eliminarRepetidos(i++(amigosDe red x)))
recorredorDeListas red (x:xs) i | listaPerteneceALista (amigosDe red x) i = recorredorDeListas red xs i
                                | otherwise = recorredorDeListas red (eliminarRepetidos(xs++amigosDe red x)) (eliminarRepetidos(i++amigosDe red x))