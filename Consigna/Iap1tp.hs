module Iap1tp where


--Tests Chicos 

usuariosTest1 :: [Usuario]
usuariosTest1 = [(1,"Maximiliano") , (2,"Mauricio") , (3,"Santiago") , (4,"Lujan")]

relacionesTest1 :: [Relacion]
relacionesTest1 = [  ( (2,"Mauricio") , (4,"Lujan") ), ( (1,"Maximiliano") , (3,"Santiago") ), ( (4,"Lujan") , (3,"Santiago") )]

publicacionesTest1 :: [Publicacion]
publicacionesTest1 = [((1,"Maximiliano"), "hola aguante bokitaaaa", [(2,"Mauricio"),(3,"Santiago"), (4,"Lujan")]),((1,"Maximiliano"), "alguno vende rizz???", [(2,"Mauricio"),(1,"Maximiliano"), (4,"Lujan")])]

redSocialTest1 :: RedSocial
redSocialTest1 = (usuariosTest1 , relacionesTest1 , publicacionesTest1)


--tests grandes

-- red social 100 bodoques
redSocial100Bodoques = (usuariosBodoque, relacionesBodoque, relacionesBodoque)
--usuarios
usuariosBodoque = [(101,"Bodoque101"),(100,"Bodoque100"),(99,"Bodoque99"),(98,"Bodoque98"),(97,"Bodoque97"),(96,"Bodoque96"),(95,"Bodoque95"),(94,"Bodoque94"),(93,"Bodoque93"),(92,"Bodoque92"),(91,"Bodoque91"),(90,"Bodoque90"),(89,"Bodoque89"),(88,"Bodoque88"),(87,"Bodoque87"),(86,"Bodoque86"),(85,"Bodoque85"),(84,"Bodoque84"),(83,"Bodoque83"),(82,"Bodoque82"),(81,"Bodoque81"),(80,"Bodoque80"),(79,"Bodoque79"),(78,"Bodoque78"),(77,"Bodoque77"),(76,"Bodoque76"),(75,"Bodoque75"),(74,"Bodoque74"),(73,"Bodoque73"),(72,"Bodoque72"),(71,"Bodoque71"),(70,"Bodoque70"),(69,"Bodoque69"),(68,"Bodoque68"),(67,"Bodoque67"),(66,"Bodoque66"),(65,"Bodoque65"),(64,"Bodoque64"),(63,"Bodoque63"),(62,"Bodoque62"),(61,"Bodoque61"),(60,"Bodoque60"),(59,"Bodoque59"),(58,"Bodoque58"),(57,"Bodoque57"),(56,"Bodoque56"),(55,"Bodoque55"),(54,"Bodoque54"),(53,"Bodoque53"),(52,"Bodoque52"),(51,"Bodoque51"),(50,"Bodoque50"),(49,"Bodoque49"),(48,"Bodoque48"),(47,"Bodoque47"),(46,"Bodoque46"),(45,"Bodoque45"),(44,"Bodoque44"),(43,"Bodoque43"),(42,"Bodoque42"),(41,"Bodoque41"),(40,"Bodoque40"),(39,"Bodoque39"),(38,"Bodoque38"),(37,"Bodoque37"),(36,"Bodoque36"),(35,"Bodoque35"),(34,"Bodoque34"),(33,"Bodoque33"),(32,"Bodoque32"),(31,"Bodoque31"),(30,"Bodoque30"),(29,"Bodoque29"),(28,"Bodoque28"),(27,"Bodoque27"),(26,"Bodoque26"),(25,"Bodoque25"),(24,"Bodoque24"),(23,"Bodoque23"),(22,"Bodoque22"),(21,"Bodoque21"),(20,"Bodoque20"),(19,"Bodoque19"),(18,"Bodoque18"),(17,"Bodoque17"),(16,"Bodoque16"),(15,"Bodoque15"),(14,"Bodoque14"),(13,"Bodoque13"),(12,"Bodoque12"),(11,"Bodoque11"),(10,"Bodoque10"),(9,"Bodoque9"),(8,"Bodoque8"),(7,"Bodoque7"),(6,"Bodoque6"),(5,"Bodoque5"),(4,"Bodoque4"),(3,"Bodoque3"),(2,"Bodoque2"),(1,"Bodoque1")]
--relaciones
relacionesBodoque = [((1,"Bodoque1"),(101,"Bodoque101")),((1,"Bodoque1"),(100,"Bodoque100")),((1,"Bodoque1"),(99,"Bodoque99")),((1,"Bodoque1"),(98,"Bodoque98")),((1,"Bodoque1"),(97,"Bodoque97")),((1,"Bodoque1"),(96,"Bodoque96")),((1,"Bodoque1"),(95,"Bodoque95")),((1,"Bodoque1"),(94,"Bodoque94")),((1,"Bodoque1"),(93,"Bodoque93")),((1,"Bodoque1"),(92,"Bodoque92")),((1,"Bodoque1"),(91,"Bodoque91")),((1,"Bodoque1"),(90,"Bodoque90")),((1,"Bodoque1"),(89,"Bodoque89")),((1,"Bodoque1"),(88,"Bodoque88")),((1,"Bodoque1"),(87,"Bodoque87")),((1,"Bodoque1"),(86,"Bodoque86")),((1,"Bodoque1"),(85,"Bodoque85")),((1,"Bodoque1"),(84,"Bodoque84")),((1,"Bodoque1"),(83,"Bodoque83")),((1,"Bodoque1"),(82,"Bodoque82")),((1,"Bodoque1"),(81,"Bodoque81")),((1,"Bodoque1"),(80,"Bodoque80")),((1,"Bodoque1"),(79,"Bodoque79")),((1,"Bodoque1"),(78,"Bodoque78")),((1,"Bodoque1"),(77,"Bodoque77")),((1,"Bodoque1"),(76,"Bodoque76")),((1,"Bodoque1"),(75,"Bodoque75")),((1,"Bodoque1"),(74,"Bodoque74")),((1,"Bodoque1"),(73,"Bodoque73")),((1,"Bodoque1"),(72,"Bodoque72")),((1,"Bodoque1"),(71,"Bodoque71")),((1,"Bodoque1"),(70,"Bodoque70")),((1,"Bodoque1"),(69,"Bodoque69")),((1,"Bodoque1"),(68,"Bodoque68")),((1,"Bodoque1"),(67,"Bodoque67")),((1,"Bodoque1"),(66,"Bodoque66")),((1,"Bodoque1"),(65,"Bodoque65")),((1,"Bodoque1"),(64,"Bodoque64")),((1,"Bodoque1"),(63,"Bodoque63")),((1,"Bodoque1"),(62,"Bodoque62")),((1,"Bodoque1"),(61,"Bodoque61")),((1,"Bodoque1"),(60,"Bodoque60")),((1,"Bodoque1"),(59,"Bodoque59")),((1,"Bodoque1"),(58,"Bodoque58")),((1,"Bodoque1"),(57,"Bodoque57")),((1,"Bodoque1"),(56,"Bodoque56")),((1,"Bodoque1"),(55,"Bodoque55")),((1,"Bodoque1"),(54,"Bodoque54")),((1,"Bodoque1"),(53,"Bodoque53")),((1,"Bodoque1"),(52,"Bodoque52")),((1,"Bodoque1"),(51,"Bodoque51")),((1,"Bodoque1"),(50,"Bodoque50")),((1,"Bodoque1"),(49,"Bodoque49")),((1,"Bodoque1"),(48,"Bodoque48")),((1,"Bodoque1"),(47,"Bodoque47")),((1,"Bodoque1"),(46,"Bodoque46")),((1,"Bodoque1"),(45,"Bodoque45")),((1,"Bodoque1"),(44,"Bodoque44")),((1,"Bodoque1"),(43,"Bodoque43")),((1,"Bodoque1"),(42,"Bodoque42")),((1,"Bodoque1"),(41,"Bodoque41")),((1,"Bodoque1"),(40,"Bodoque40")),((1,"Bodoque1"),(39,"Bodoque39")),((1,"Bodoque1"),(38,"Bodoque38")),((1,"Bodoque1"),(37,"Bodoque37")),((1,"Bodoque1"),(36,"Bodoque36")),((1,"Bodoque1"),(35,"Bodoque35")),((1,"Bodoque1"),(34,"Bodoque34")),((1,"Bodoque1"),(33,"Bodoque33")),((1,"Bodoque1"),(32,"Bodoque32")),((1,"Bodoque1"),(31,"Bodoque31")),((1,"Bodoque1"),(30,"Bodoque30")),((1,"Bodoque1"),(29,"Bodoque29")),((1,"Bodoque1"),(28,"Bodoque28")),((1,"Bodoque1"),(27,"Bodoque27")),((1,"Bodoque1"),(26,"Bodoque26")),((1,"Bodoque1"),(25,"Bodoque25")),((1,"Bodoque1"),(24,"Bodoque24")),((1,"Bodoque1"),(23,"Bodoque23")),((1,"Bodoque1"),(22,"Bodoque22")),((1,"Bodoque1"),(21,"Bodoque21")),((1,"Bodoque1"),(20,"Bodoque20")),((1,"Bodoque1"),(19,"Bodoque19")),((1,"Bodoque1"),(18,"Bodoque18")),((1,"Bodoque1"),(17,"Bodoque17")),((1,"Bodoque1"),(16,"Bodoque16")),((1,"Bodoque1"),(15,"Bodoque15")),((1,"Bodoque1"),(14,"Bodoque14")),((1,"Bodoque1"),(13,"Bodoque13")),((1,"Bodoque1"),(12,"Bodoque12")),((1,"Bodoque1"),(11,"Bodoque11")),((1,"Bodoque1"),(10,"Bodoque10")),((1,"Bodoque1"),(9,"Bodoque9")),((1,"Bodoque1"),(8,"Bodoque8")),((1,"Bodoque1"),(7,"Bodoque7")),((1,"Bodoque1"),(6,"Bodoque6")),((1,"Bodoque1"),(5,"Bodoque5")),((1,"Bodoque1"),(4,"Bodoque4")),((1,"Bodoque1"),(3,"Bodoque3")),((1,"Bodoque1"),(2,"Bodoque2"))]
--Publicaciones 
publciacionesBodoque = []


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
usuariosGustaPublicacion p a | pertenece a (likesDePublicacion p) == True = [p] 
                             | otherwise = []


--LA USAMOS EN TIENE SEGUIDOR FIEL TAMBIEN
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a [] = False
pertenece  a (x:[]) | x == a = True
                    | otherwise = False
pertenece  a (x:xs) | x == a = True
                    | otherwise = False || pertenece a xs
  

-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r a b | publicacionesQueLeGustanA  r a == publicacionesQueLeGustanA r b = True 
                                      | otherwise = False

-- describir qué hace la función: .....

-- dado un usuario
-- agarro su primer publicacion
-- le extraigo su lista de likeadores
-- comparo esa lista con todas las otras listas de sus otras publicaciones
-- la primer lista tiene que pertenecer a todas las otras para que sea True

tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel (x,y,z) u = compararListasDeLikeadores (likesDePublicacion ((head (publicacionesDe (x,y,z) u)))) (listasDeLikeadores (publicacionesDe (x,y,z) u))

-- Dada una lista de likeadores, verifica si pertenece a otras n listas de likeadores
compararListasDeLikeadores :: [Usuario] -> [[Usuario]] -> Bool
compararListasDeLikeadores (x:[]) y = usuarioPerteneceALista x y
compararListasDeLikeadores (x:xs) y | usuarioPerteneceALista x y == False =  compararListasDeLikeadores xs y
                                     | otherwise = True 

-- Dado una lista, dame True si pertenece a la segunda lista
usuarioPerteneceALista :: (Eq t) => t -> [[t]] -> Bool
usuarioPerteneceALista x [] = False
usuarioPerteneceALista x (y:[]) = pertenece x y
usuarioPerteneceALista x (y:ys) = pertenece x y && usuarioPerteneceALista x ys

-- Dada una lista de publicaciones, devuelve sus listas de likeadores
listasDeLikeadores :: [Publicacion] -> [[Usuario]]
listasDeLikeadores (x:[]) = [likesDePublicacion x]
listasDeLikeadores (x:xs) = [likesDePublicacion x] ++ listasDeLikeadores xs 

-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos = undefined
