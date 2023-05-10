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

-- Ejercicios----------------------------------------------------------------------


--Dada un RedSocial toma el primer elemento de la tripla y llama a la funcion iterarUsuarios sobre la lista de usuarios. 
--Y devuelve una lista con los nombres de los usuarios.
-- Casos: 
        -- 

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (x,y,z) = iterarUsuarios (x)

--Dada la lista de usuarios, devuelve el segundo elemento de la tupla de cada elemento de la lista. 

iterarUsuarios :: [Usuario] -> [String]
iterarUsuarios (x:[]) = [nombreDeUsuario x]
iterarUsuarios (x:xs) = [nombreDeUsuario x] ++ iterarUsuarios xs


-- describir qué hace la función: ..... 
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (x,(y:[]),z) a = matchRelacion y a
amigosDe (x,(y:ys),z) a = matchRelacion y a ++ amigosDe (x,ys,z) a

matchRelacion :: (Usuario, Usuario) -> Usuario -> [Usuario]
matchRelacion (x,y) a | x==a = [y] 
                      | y==a = [x]
                      | otherwise = []

-- describir qué hace la función: .....
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos x a = longitud (amigosDe x a) 

longitud :: (Eq t) => [t] -> Int
longitud [] = 0
longitud (x:[]) = 1
longitud (x:xs) = 1 + longitud xs

-- describir qué hace la función: .....
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ((x:[]),y,z) = x
usuarioConMasAmigos (x,y,z)      = comparadorDeCantidadDeAmigos (x,y,z) x (head x)

comparadorDeCantidadDeAmigos :: RedSocial -> [Usuario] -> Usuario -> Usuario 
comparadorDeCantidadDeAmigos ((x:[]),y,z) l u = u
comparadorDeCantidadDeAmigos r (a:[]) u = u
comparadorDeCantidadDeAmigos r (a:b:bs) u | cantidadDeAmigos r a >= cantidadDeAmigos r b = comparadorDeCantidadDeAmigos r (a:bs) a
                                          | otherwise = comparadorDeCantidadDeAmigos r (b:bs) b


-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos x | cantidadDeAmigos x (usuarioConMasAmigos x) > 100 = True
                    | otherwise = False

-- describir qué hace la función: .....
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (x,y,[]) u = []
publicacionesDe (x,y,(z:zs)) u | nombreDeUsuario u == nombreDeUsuario (usuarioDePublicacion z) = [z] ++ publicacionesDe (x,y,zs) u
                               | otherwise = publicacionesDe (x,y,zs) u

-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (x,y,z:[]) a = usuariosGustaPublicacion z a
publicacionesQueLeGustanA (x,y,z:zs) a = usuariosGustaPublicacion z a  ++  publicacionesQueLeGustanA (x,y,zs) a          

usuariosGustaPublicacion :: Publicacion -> Usuario -> [Publicacion]
usuariosGustaPublicacion p a | pertenece (likesDePublicacion p) a == True = [p] 
                             | otherwise = []


--LA USAMOS EN TIENE SEGUIDOR FIEL TAMBIEN
pertenece :: [t] -> t -> Bool
pertenece (x:[]) a | x == a = True
                   | otherwise = False
pertenece (x:xs) a | x == a = True
                   | otherwise = False || pertenece xs a
  

-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r a b | publicacionesQueLeGustanA  r a == publicacionesQueLeGustanA r b = True 
                                      | otherwise = False

-- describir qué hace la función: .....
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel = undefined


 

-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos = undefined
