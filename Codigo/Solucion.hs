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

usuarioPerteneceAListasDeUsuarios :: (Eq t) => t -> [[t]] -> Bool
usuarioPerteneceAListasDeUsuarios usuario [] = False
usuarioPerteneceAListasDeUsuarios usuario (primeraListaUsuarios:[]) = pertenece usuario primeraListaUsuarios
usuarioPerteneceAListasDeUsuarios usuario (primeraListaUsuarios:restoListasUsuarios) = pertenece usuario primeraListaUsuarios && usuarioPerteneceAListasDeUsuarios usuario restoListasUsuarios

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

-- Dada una lista de usuarios, devuelve el nombre de ellos.
iterarUsuarios :: [Usuario] -> [String]
iterarUsuarios [] = []
iterarUsuarios (primerUsuario:[]) = [nombreDeUsuario primerUsuario]
iterarUsuarios (primerUsuario:restoUsuarios) = [nombreDeUsuario primerUsuario] ++ iterarUsuarios restoUsuarios


-- Ejercicio 2
-- Dada una red social y un usuario de esta, devuelve una lista de los usuarios amigos de este usuario.
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (usuarios,[],publicaciones) usuario = []
amigosDe (usuarios,(primerRelacion:[]),publicaciones) usuario = matchRelacion primerRelacion usuario
amigosDe (usuarios,(primerRelacion:restoRelaciones),publicaciones) usuario = matchRelacion primerRelacion usuario ++ amigosDe (usuarios,restoRelaciones,publicaciones) usuario

-- Dado un usuario y una relacion, nos devuelve al amigo del usuario si el primero es parte de la relacion.
matchRelacion :: (Usuario, Usuario) -> Usuario -> [Usuario]
matchRelacion (unUsuario,otroUsuario) usuario | unUsuario==usuario = [otroUsuario]
                                              | otroUsuario==usuario = [unUsuario]
                                              | otherwise = []


-- Ejercicio 3
-- Dada una red social y un usuario de esta, devuelve la cantidad de amigos de este usuario.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red usuario = longitud (amigosDe red usuario)


-- Ejercicio 4
-- Dada una red social, devuelve un usuario que tenga el mayor numero de amigos.
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ((unicoUsuario:[]),relaciones,publicaciones) = unicoUsuario
usuarioConMasAmigos (usuarios,relaciones,publicaciones) = comparadorDeCantidadDeAmigos (usuarios,relaciones,publicaciones) usuarios

-- Dada una red social y su lista de usuarios, elige entre el primero y el segundo usuario, segun cual tiene mas amigos
-- El ganador de esta seleccion compite contra el siguiente de la lista de usuarios.
comparadorDeCantidadDeAmigos :: RedSocial -> [Usuario] -> Usuario 
comparadorDeCantidadDeAmigos ((unicoUsuario:[]),relaciones,publicaciones) usuarios = unicoUsuario
comparadorDeCantidadDeAmigos red (primerUsuario:[]) = primerUsuario
comparadorDeCantidadDeAmigos red (primerUsuario:segundoUsuario:restoUsuarios) | cantidadDeAmigos red primerUsuario >= cantidadDeAmigos red segundoUsuario = comparadorDeCantidadDeAmigos red (primerUsuario:restoUsuarios)
                                                                              | otherwise = comparadorDeCantidadDeAmigos red (segundoUsuario:restoUsuarios)


-- Ejercicio 5
-- Dada una red social nos devuelve True si Roberto Carlos pertenece a ella (un usuario con más de 10 amigos) 
-- o False si no pertenece a esta.
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red | cantidadDeAmigos red (usuarioConMasAmigos red) > 10 = True
                      | otherwise = False


-- Ejercicio 6
-- Dada una red social y un usuario de esta, nos devuelve una lista de las publicaciones generadas por este usuario.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (usuarios,relaciones,[]) usuario = []
publicacionesDe (usuarios,relaciones,(primerPublicacion:restoPublicaciones)) usuario | nombreDeUsuario usuario == nombreDeUsuario (usuarioDePublicacion primerPublicacion) = [primerPublicacion] ++ publicacionesDe (usuarios,relaciones,restoPublicaciones) usuario
                                                                                     | otherwise = publicacionesDe (usuarios,relaciones,restoPublicaciones) usuario


-- Ejercicio 7
-- Dada una red social y un usuario de esta, nos devuelve una lista de todas las publicaciones que le gustan a este usuario.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (usuarios,relaciones,primerPublicacion:[]) usuario = leGustaLaPublicacion usuario primerPublicacion
publicacionesQueLeGustanA (usuarios,relaciones,primerPublicacion:restoPublicaciones) usuario = leGustaLaPublicacion usuario primerPublicacion ++ publicacionesQueLeGustanA (usuarios,relaciones,restoPublicaciones) usuario        

-- Dado un usuario y una publicacion, nos devuelve la publicacion si a este le gusta.
leGustaLaPublicacion :: Usuario -> Publicacion -> [Publicacion]
leGustaLaPublicacion usuario publicacion | pertenece usuario (likesDePublicacion publicacion) = [publicacion] 
                                         | otherwise = []


-- Ejercicio 8
-- Dada una red social y dos usuarios de esta, nos devuelve True si a ambos usuarios les gustan las mismas publicaciones.
-- De lo contrario, devuelve False.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red unUsuario otroUsuario | publicacionesQueLeGustanA  red unUsuario == publicacionesQueLeGustanA red otroUsuario = True 
                                                          | otherwise = False


-- Ejercicio 9
-- Dada una red social y un usuario de esta, nos devuelve True si a algun otro usuario de la red social le gustan todas las publicaciones de este.
-- De lo contrario, devuelve False.
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel (usuarios,relaciones,[]) usuario = False
tieneUnSeguidorFiel red usuario | longitud (publicacionesDe red usuario) == 0 = False -- El usuario no tiene publicaciones
                                | longitud (likesDePublicacion ((head (publicacionesDe red usuario)))) == 0 = False -- La primer/unica publicacion del usuario no tiene ningun "me gusta"
                                | longitud (likesDePublicacion ((head (publicacionesDe red usuario)))) == 1 && head (likesDePublicacion ((head (publicacionesDe red usuario)))) == usuario = False -- Una publicacion del usuario tiene un solo "me gusta" y es propio
                                | otherwise = compararListasDeLikeadores (likesDePublicacion ((head (publicacionesDe red usuario)))) (listasDeLikeadores (publicacionesDe red usuario))

-- Dada la lista de likeadores de la primer publicacion del usuario y el resto de listas de "me gusta" de sus otras publicaciones
-- Verifica si los usuarios de la primer lista pertenecen a todas las otras listas, indicando la existencia de algun seguidor fiel
compararListasDeLikeadores :: [Usuario] -> [[Usuario]] -> Bool
compararListasDeLikeadores [] likesDePublicaciones = False
compararListasDeLikeadores (primerUsuario:[]) likesDePublicaciones = usuarioPerteneceAListasDeUsuarios primerUsuario likesDePublicaciones
compararListasDeLikeadores (primerUsuario:restoUsuarios) likesDePublicaciones | usuarioPerteneceAListasDeUsuarios primerUsuario likesDePublicaciones == False = compararListasDeLikeadores restoUsuarios likesDePublicaciones
                                                                              | otherwise = True 

-- Dada una lista de publicaciones devuelve una lista con listas de los usuarios que le dieron "me gusta"
listasDeLikeadores :: [Publicacion] -> [[Usuario]]
listasDeLikeadores (primerPublicacion:[]) = [likesDePublicacion primerPublicacion]
listasDeLikeadores (primerPublicacion:restoPublicaciones) = [likesDePublicacion primerPublicacion] ++ listasDeLikeadores restoPublicaciones 


-- Ejercicio 10
-- Dada una red social y dos usuarios de esta, nos devuelve True si estos usuarios son amigos directa o indirectamente.
-- Indirectamente refiere a que haya una "cadena" de relaciones entre los dos usuarios. De lo contrario, devuelve False.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red usuarioInicial usuarioFinal = pertenece usuarioFinal (recorredorDeListas red (amigosDe red usuarioInicial) []) 

-- Dada una red social y la lista de amigos del usuario inicial, vamos a ir agregando a esta lista y a otra lista, inicialmente vacia,
-- los amigos del usuario inicial y recursivamente los amigos de estos. No se agregan a ninguna lista usuarios repetidos.
-- La primer lista se agranda y se vacia al finalizar. La segunda tiene a toda la "red de amigos" del usuario inicial.
-- Si el usuario final pertenece a esta segunda lista, existe secuencia de amigos entre el usuario inical y final
recorredorDeListas :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
recorredorDeListas red [] usuarioInicial = []
recorredorDeListas red (primerUsuario:[]) usuarioInicial | listaPerteneceALista (amigosDe red primerUsuario) usuarioInicial = usuarioInicial
                                                         | otherwise = recorredorDeListas red (eliminarRepetidos(amigosDe red primerUsuario)) (eliminarRepetidos(usuarioInicial ++ (amigosDe red primerUsuario)))
recorredorDeListas red (primerUsuario:restoUsuarios) usuarioInicial | listaPerteneceALista (amigosDe red primerUsuario) usuarioInicial = recorredorDeListas red restoUsuarios usuarioInicial
                                                                    | otherwise = recorredorDeListas red (eliminarRepetidos(restoUsuarios ++ amigosDe red primerUsuario)) (eliminarRepetidos(usuarioInicial ++ amigosDe red primerUsuario))