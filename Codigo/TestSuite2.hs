--amigosDe :: RedSocial -> Usuario -> [Usuario]
--amigosDe (x,(y:[]),z) a = matchRelacion y a
--amigosDe (x,(y:ys),z) a = matchRelacion y a ++ amigosDe (x,ys,z) a

--matchRelacion :: (Usuario, Usuario) -> Usuario -> [Usuario]
--matchRelacion (x,y) a | x==a = [y] 
--                      | y==a = [x]
--                      | otherwise = []
-- Datos para test suite 2

ts2_1redsocial_usuario = ([],[],[]) ()
ts2_2redsocial_usuario  = ([],[],[]) (1, "Maximiliano")
ts2_3redsocial_usuario = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan")]) (3, "Lujan")
ts2_4redsocial_usuario = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan")]) (1,"Maximiliano")

testSuite2 = test [
    "amigosDe 1" ~: (amigosDe ts2_1redsocial_usuario) ~?= undefined,
    "amigosDe 2" ~: (amigosDe ts2_2redsocial_usuario) ~?= [],
    "amigosDe 3" ~: (amigosDe ts2_3redsocial_usuario) ~?= ["Maximiliano"],
    "amigosDe 4" ~: (amigosDe ts2_4redsocial_usuario) ~?= ["Mauricio","Lujan"]
]


--cantidadDeAmigos :: RedSocial -> Usuario -> Int
--cantidadDeAmigos x a = longitud (amigosDe x a) 
--Datos para test suite 3

ts3_1redsocial_usuario = ([],[],[]) ()
ts3_2redsocial_usuario = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan"),(4, "Santiago")]) (4,"Santiago")
ts3_3redsocial_usuario = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan"),(4, "Santiago")]) (3, "Lujan")
ts3_4redsocial_usuario = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan"),(4, "Santiago")]) (1, "Maximiliano")

testSuite3 = test [
    "cantidadDeAmigos 1" ~: (cantidadDeAmigos ts3_1redsocial_usuario) ~?= undefined,
    "cantidadDeAmigos 2" ~: (cantidadDeAmigos ts3_2redsocial_usuario) ~?= 0,
    "cantidadDeAmigos 3" ~: (cantidadDeAmigos ts3_3redsocial_usuario) ~?= 1,
    "cantidadDeAmigos 4" ~: (cantidadDeAmigos ts3_4redsocial_usuario) ~?= 2
]

--usuarioConMasAmigos :: RedSocial -> Usuario
--Datos para test suite 4 
ts4_1redsocial = ([],[],[])
ts4_2redsocial = ([(1,"Maximiliano")])
ts4_3redsocial = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan")])
ts4_4redsocial = ([(1,"Maximiliano"),(2,"Mauricio"),(3,"Lujan"),(4, "Santiago"),(5, "Juan")])

testSuite4 = test [
    ""
]

--Usuarios
u1 = (1, "Maiximiliano")
u2 = (2, "Mauricio")
u3 = (3, "Lujan")
u4 = (4, "Santiago")
u5 = (5, "Juan")
u6 = (6, "Carlos")
u7 = (7, "Bodoque")

--Relaciones
r1con2 = (u1, u2)
r1con3 = (u1, u3)
r2con5 = (u2, u5)
r5con6 = (u5, u6)
r5con7 = (u5, u7)