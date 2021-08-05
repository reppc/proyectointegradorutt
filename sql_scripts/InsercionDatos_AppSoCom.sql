/*ROL USUARIOS*/
--rol de usuario
INSERT INTO
  rol_usuario (rol_usuario.tipo_usuario)
VALUES
  ('Cliente'),
  ('Tecnico'),
  ('Administrador_Blog'),
  ('Administrador');
  
/*USUARIOS*/
INSERT INTO
  usuarios (
    usuarios.correo,
    usuarios.contrase ñ a,
    usuarios.Rol_usuario
  )
VALUES
  ('4abduhosny_2012@gmail.com', 'papwi123', '1'),('zahmadn@gmail.com', 'dan123', '1'),
  ('fosaf47575@gmail.com', 'santi123', '2'),('jseham_20@gmail.com', 'iozo133', '2'),
  ('vzlo_1@gmail.com', 'dan934', '1'),('9hunjun@gmail.com', 'letan123', '3'),
  ('qhic_1@gmail.com', 'fueg_1', '1'),('gsenyoo_5@gmail.com', '54senda', '2'),
  ('boussama179@gmail.com', 'nome35', '2'),('2ishwarya@gmail.com', 'spider123', '1'),
  ('2reyeslam991@gmail.com', 'itsjust123', '1'),('giwanttokilluman@gmail.com', 'ch123', '1'),
  ('ospaco.red@gmail.com', 'desplant123', '1'),
  ('zakaria12_@gmail.com', 'bait123', '4'),('jennifer.mou_@gmail.com', 'mason123', '4'),
  ('ujames_1@gmail.com', 'papas123', '3'),('elovee_21@gmail.com', 'cuatra123', '1'),
  ('PaloArt55@gmail.com', 'pali123', '1'),('ela_ou_55@outlook.es', '123mma', '1'),('Imas_a_331@outlook.es', 'inten193', '1'),
  ('Maride_la_55@outlook.com', 'marde123', '1'),('Tom_mas_55@outlook.es', 'bronce143', '1'),
  ('Santi_00_2@outlook.es', 'menis123', '1'),('pbito123_4@gmail.com', 'qatar123', '1'),
  ('Luna123_s@gmail.com', 'delha1', '1'),('Leond54@gmail.com', 'funda12_', '1'),
  ('Wallie65_@hotmail.com', 'wil123', '1'),('Patric_55_34@gmail.com', 'distan12', '1'),
  ('rita.958_@gmail.com', 'rat123', '2'),('jbelabas53l@gmail.com', 'isac123', '1');
  /*CLIENTES*/
INSERT INTO
  clientes (
    clientes.nombres,
    clientes.ap_paterno,
    clientes.ap_materno,
    clientes.direccion,
    clientes.telefono,
    clientes.suscripcion,
    clientes.usuario
  )
VALUES
  (
    'Victor Isaac',
    'Rodriguez',
    'Garcia',
    'ALLENDE 95, CIUDAD LERDO CENTRO, 35166',
    '8711201258',
    'activada',
    '1'
  ),
  (
    'Naira',
    'Uribe',
    'Macias',
    'ATOMO ESQ. PROTÓN NO. 12, 53381',
    '8711201265',
    'activada',
    '2'
  ),
  (
    'Juan Manuel',
    'Fernandez',
    'Bañuelos',
    'LAZARO CARDENAS SN, LA LIBERTAD, 39793',
    '8713315687',
    'activada',
    '5'
  ),
  (
    'Alejandra',
    'Luna',
    'Perez',
    'ALBERT N SWAIN NO. 880, CD INDUSTRIAL',
    '8713567000',
    'activada',
    '7'
  ),
  (
    'Leon Daniel',
    'Martinez',
    'Hopi',
    'ALBERT N SWAIN NO. 880, CD INDUSTRIAL',
    '8713564589',
    'desactivada',
    '10'
  ),
  (
    'Maria Rocio',
    'Liu',
    'Sanchez',
    'MAYRAN NO. 247, TORREON JARDIN',
    '8713547062',
    'activada',
    '11'
  ),
  (
    'Jorge',
    'Cisneros',
    'Martinez',
    'MATAMOROS PTE NO. 1285 NO. 1, TORREON CENTRO',
    '8711312657',
    'desactivada',
    '12'
  ),
  (
    'Pablo',
    'Contreras',
    'Siller',
    'ALLENDE PTE NO. 1544, TORREON CENTRO',
    '8713564064',
    'desactivada',
    '13'
  ),
  (
    'Manuel',
    'Garcia',
    'Perez',
    'CALZ AGROINDUSTRIA NO. 10, PQUE AGROINDUSTRIAL OTE',
    '8717715689',
    'desactivada',
    '17'
  ),
  (
    'Elsa Patricia',
    'Garay',
    'Hernandez',
    'HUICHOLES 37, PALMAS SAN ISIDRO',
    '8717895423',
    'activada',
    '18'
  ),
  (
    'Leslie',
    'Cuellar',
    'Oropeza',
    'AV DE LOS ROBLES NO. 455 S/N, VILLA JACARANDAS',
    '8715753142',
    'desactivada',
    '19'
  ),
  (
    'Wilbert',
    'Guajardo',
    'Gutierrez',
    'MATAMOROS 968 OTE S/N, CENTRO',
    '8714312659',
    'desactivada',
    '20'
  ),
  (
    'Hector Miguel',
    'De Santiago',
    'Adame',
    '74 189 BIS SUR, NUEVO TORREON',
    '8711310295',
    'desactivada',
    '21'
  ),
  (
    'Paola',
    'Arteaga',
    'Garcia',
    'BLANCO 76 SUR S/N, TORREON CENTRO',
    '8712354899',
    'desactivada',
    '22'
  ),
  (
    'Tamara',
    'Plascencia',
    'Lopez',
    'JUAN E GARCIA 381 S/N, CENTRO',
    '8712314598',
    'desactivada',
    '23'
  ),
  (
    'Patricio Emanuel',
    'Miron',
    'Perez',
    'FILEMON GARZA 231, TORREON CENTRO',
    '8713526614',
    'desactivada',
    '24'
  ),
  (
    'Elisa',
    'Muro',
    'Reynoso',
    'GONZALEZ ORTEGA 647 NTE',
    '8715320578',
    'desactivada',
    '25'
  ),
  (
    'Tomas',
    'Corral',
    'Lazarin',
    'CALZ XOCHIMILCO 101 A, VILLA CALIFORNIA',
    '8717654595',
    'desactivada',
    '26'
  ),
  (
    'Maria Lucia',
    'Muñoz',
    'De la rosa',
    'AGUILA NACIONAL 2465 OTE, CENTRO',
    '8714557061',
    'desactivada',
    '27'
  ),
  (
    'Imanol',
    'Arzate',
    'Rivera',
    'DIV. DEL NORTE 157, LAS MISIONES',
    '8714312671',
    'activada',
    '28'
  ),
  (
    'Marcos',
    'Martinez',
    'Jimenez',
    '1982 Hickman Street',
    '8713596020',
    'activada',
    '30'
  );
  /*TECNICOS*/
INSERT INTO
  tecnicos (
    tecnicos.nombres,
    tecnicos.ap_paterno,
    tecnicos.ap_materno,
    tecnicos.telefono,
    tecnicos.usuario
  )
VALUES
  ('Felipe', 'Macias', 'Adame', '8711143127', '3'),
  (
    'Joseph',
    'De la Rosa',
    'Esquivel',
    '8715312654',
    '4'
  ),
  ('Isaac', 'Lopez', 'Gonzales', '8711976635', '8'),
  ('Jorge', 'Perez', 'Cuellar', '8714369915', '9'),
  (
    'Daniel',
    'Brizuela',
    'De la cruz',
    '8711312600',
    '29'
  );
  /*Productos*/
DELETE FROM
  productos
WHERE
  id_producto >= 1;
ALTER TABLE
  productos
MODIFY
  COLUMN productos.nombre VARCHAR(80);
ALTER TABLE
  productos AUTO_INCREMENT = 1;
INSERT INTO
  productos (
    productos.nombre,
    productos.existencia,
    productos.precio_unitario,
    productos.categoria,
    productos.descripcion
  )
VALUES
  (
    'Disco Duro Interno 1TB WD',
    '66',
    '849.00',
    'refacciones',
    'Disco Duro Interno 1TB 3.5 SATA3 7200RPM Nuevo WD WD10EZEX'
  ),
  (
    'Unidad de estado solido SSD 120GB',
    '30',
    '549.00',
    'refacciones',
    'Unidad de estado solido SSD 120GB 2.5" SATA3 Kingston A400 / SA400S37/120G'
  ),
  (
    'Aire Comprimido Silimex',
    '85',
    '125.76',
    'limpieza',
    'Aire comprimido Silimex / Teclados y electronicos / Circuitos mecánicos 660Ml'
  ),
  (
    'Liquido Limpiador Perfect Choice',
    '10',
    '69.00',
    'limpieza',
    'Liquido Limpiador Alcohol Isopropilico / Para electronicos / PC-033066'
  ),
  (
    'Toallitas Limpiadoras Perfect Choice',
    '8',
    '49.00',
    'limpieza',
    'Toallitas Limpiadoras Perfect Choice / Ideal para pantallas'
  ),
  (
    'Mouse Gamer Logitech G203 Lightsync Black',
    '300',
    '429.00',
    'accesorios',
    'Mouse Gamer Logitech G203 Lightsync Black / Optico / USB / 8000DPI / Led RGB/'
  ),
  (
    'Mouse Gamer Yaguaret Mantis',
    '288',
    '299.99',
    'accesorios',
    'Mouse Gamer Yaguaret Mantis / Optico / USB / 6400DPI / Led RGB/ GMMANTISYGT / 7 Botones'
  ),
  (
    'Teclado Mecanico Gamer Naceb Black Cobra RGB',
    '26',
    '399.00',
    'accesorios',
    'Teclado Mecanico Gamer Naceb Black Cobra RGB / USB / NA-0944 / Switch Red / Antighosting / Reposamuñecas desmontable'
  ),(
    'Teclado Gamer Naceb',
    '205',
    '219.00',
    'accesorios',
    'Teclado Gamer Naceb NA-0912 Retroiluminado / Antighosting / Efecto rainbow'
  ),(
    'Memoria RAM Kingston HyperX DDR3',
    '12',
    '518.18',
    'refacciones',
    'Memoria RAM Kingston HyperX 4GB 1x4GB DDR3L 1866Mhz / Sodimm HX318LS11IB/4/ para Laptop'
  ),(
    'Memoria RAM DDR4',
    '38',
    '549.00',
    'refacciones',
    'Memoria RAM DDR4 4GB 2666MHz Kingston HyperX Fury 1 Modulo Negro HX426C16FB3/4'
  ),(
    'Memoria RAM DDR3',
    '52',
    '779.00',
    'refacciones',
    'Memoria RAM DDR3 4GB 1333MHz Kingston Value 1 Modulo / KVR13N9S8/4'
  ),(
    'Pasta Termica Cooler Master',
    '235',
    '299.99',
    'limpieza',
    'Pasta Termica Cooler Master MasterGel Pro V2 / MGY-ZOSG-N15M-R3'
  ),(
    'Fuente de poder 400W EVGA',
    '158',
    '650.99',
    'refacciones',
    'Fuente de poder 400W EVGA Continuous Power Active PFC 75%Ef. / 100-N1-0400-L1'
  ),(
    'Fuente de poder Getttech',
    '250',
    '259.00',
    'refacciones',
    'Fuente de poder Getttech 500W - FG500WBX'
  ),
  (
    'Disipador para CPU Disipador y Ventilador para Procesador',
    '64',
    '619.66',
    'refacciones',
    'Disipador para CPU Disipador y Ventilador para Procesador Thermaltake Contact Silent 12 - 120mm X1 Intel y AMD'
  ),
  (
    'Disipador y Ventilador para Procesador',
    '55',
    '300.50',
    'refacciones',
    'Disipador y Ventilador para Procesador Cooler Master Hyper T4 - 120mm X1 Intel y AMD'
  ),
  (
    'Tarjeta Madre Asus',
    '190',
    '1379.55',
    'refacciones',
    'Tarjeta Madre Asus PRIME A320M-K Socket AM4 AMD A320 Micro ATX / DDR4'
  ),
  (
    'Tarjeta Madre Intel',
    '10',
    '1299.99',
    'refacciones',
    'Tarjeta Madre MSI H310M PRO-VDH PLUS Socket 1151-v2 Intel H310 Micro-ATX'
  ),
  (
    'Tarjeta de video NVIDIA',
    '20',
    '2499.00',
    'refacciones',
    'Tarjeta de video NVIDIA GeForce GT 1030 2GB GDDR4 / Gigabyte / HDMI, DVI / GV-N1030D4-2GL'
  );
insert into
  metodo_pago(nombre)
VALUES
  ('efectivo'),
  ('tarjeta'),
  ('transaccion');
insert into
  domicilio(
    id_cliente,
    calle,
    ciudad,
    numeroExt,
    numeroInt,
    codigo_postal
  )
VALUES
  (
    1,
    'AZTECAS, LAS CAROLINAS',
    'TORREÓN',
    395,
    null,
    27040
  ),
  (
    2,
    'PEDRO CAMINO, AMPLIACION LOS ANGELES',
    'TORREÓN',
    108,
    null,
    27260
  ),
  (
    3,
    'JUAN E GARCIA, TORREON CENTRO',
    'TORREÓN',
    63,
    null,
    27000
  ),
  (
    4,
    'PASEO DE LA DANZA, CAMPESTRE LA ROSITA',
    'TORREÓN',
    506,
    1,
    27250
  ),
  (
    5,
    'SALTILLO 400, CAMPESTRE LA ROSITA',
    'TORREÓN',
    951,
    null,
    27250
  ),
  (
    6,
    'BERLIN, SAN ISIDRO',
    'TORREÓN',
    201,
    null,
    27100
  ),
  (
    7,
    'AVE JUAREZ, FRAC CALIFORNIA',
    'TORREÓN',
    null,
    null,
    27089
  ),
  (
    8,
    'HIDALGO, TORREON CENTRO',
    'TORREÓN',
    1440,
    4,
    27000
  ),
  (
    9,
    'AV. PRESIDENTE CARRANZA, CENTRO',
    'TORREÓN',
    881,
    null,
    27000
  ),
  (
    10,
    'SALTILLO, CAMPESTRE LA ROSITA',
    'TORREÓN',
    400,
    951,
    27250
  ),
  (
    11,
    'JUAREZ, TORREON CENTRO',
    'TORREÓN',
    3254,
    null,
    27000
  ),
  (
    12,
    'PASEO DE LA DANZA, CAMPESTRE LA ROSITA',
    'TORREÓN',
    506,
    1,
    27250
  ),
  (
    13,
    'PASEO DE LA DANZA, CAMPESTRE LA ROSITA',
    'TORREÓN',
    506,
    2,
    27250
  ),
  (
    14,
    'PASEO DE LA DANZA, CAMPESTRE LA ROSITA',
    'TORREÓN',
    506,
    3,
    27250
  ),
  (
    15,
    'CARR MATAMOROS TORREON, LA AMISTAD',
    'TORREÓN',
    309,
    null,
    27087
  ),
  (
    16,
    'CONSTITUCION, LAS MARGARITAS',
    'TORREÓN',
    1111,
    null,
    27130
  ),
  (
    17,
    'AV PDTE CARRANZA, CENTRO',
    'TORREÓN',
    1499,
    null,
    27000
  ),
  (
    18,
    'DE LAS PAPAS, ABASTOS',
    'TORREÓN',
    169,
    170,
    27020
  ),
  (
    19,
    'HIDALGO, TORREON CENTRO',
    'TORREÓN',
    1130,
    null,
    27000
  ),
  (
    20,
    'FALCON, CENTRO',
    'TORREÓN',
    157,
    null,
    27000
  );
insert into
  carrito(id_cliente, id_producto, cantidad)
VALUES
  (9, 1, 1),
  (1, 1, 2),
  (2, 2, 3),
  (3, 3, 4),
  (4, 3, 5),
  (5, 8, 6),
  (6, 20, 7),
  (1, 20, 8),
  (2, 9, 9),
  (3, 10, 10),
  (4, 11, 11),
  (5, 12, 12),
  (6, 13, 13),
  (7, 14, 14),
  (1, 15, 15),
  (8, 16, 16),
  (12, 14, 17),
  (20, 12, 18),
  (12, 7, 19),
  (3, 3, 20);
ALTER TABLE
  orden_compra AUTO_INCREMENT = 1;
insert into
  orden_compra(
    id_cliente,
    id_metodoPago,
    total,
    id_domicilio,
    fecha_pedido
  )
values
  (1, 1, 150, 1, '2019-08-12'),
  (2, 2, 150, 2, '2019-09-29'),
  (3, 3, 150, 3, '2019-10-1'),
  (4, 3, 150, 4, '2019-11-2'),
  (5, 2, 150, 5, '2019-12-15'),
  (6, 1, 150, 6, '2020-01-17'),
  (7, 2, 150, 7, '2020-02-18'),
  (8, 3, 150, 8, '2020-03-20'),
  (9, 1, 150, 9, '2020-04-29'),
  (10, 1, 150, 10, '2020-05-19');
insert into
  orden_detalle(id_orden, id_producto, cantidad, precio)
VALUES
  (1, 1, 5, 12),
  (2, 1, 5, 12),
  (3, 1, 5, 12),
  (4, 1, 5, 12),
  (5, 1, 5, 12),
  (6, 1, 5, 12),
  (7, 1, 5, 12),
  (8, 1, 5, 12),
  (9, 1, 5, 12),
  (10, 1, 5, 12);
  /*Citas*/
ALTER TABLE
  citas AUTO_INCREMENT = 1;
INSERT INTO
  citas (
    tipo_cita,
    fecha_crea,
    fecha_cita,
    hora_cita,
    estado_cita,
    cliente,
    tecnico
  )
VALUES
  (
    'domicilio',
    '2021-06-10',
    '2021-06-11',
    '9:00',
    'activa',
    '1',
    '1'
  ),
  (
    'domicilio',
    '2021-06-14',
    '2021-06-16',
    '9:15',
    'cancelada',
    '2',
    '3'
  ),
  (
    'sucursal',
    '2021-06-13',
    '2021-06-15',
    '11:30',
    'activa',
    '5',
    '4'
  ),
  (
    'sucursal',
    '2021-06-17',
    '2021-06-21',
    '14:30',
    'activa',
    '7',
    '5'
  ),
  (
    'domicilio',
    '2021-06-21',
    '2021-06-23',
    '11:30',
    'activa',
    '3',
    '5'
  ),
  (
    'sucursal',
    '2021-06-24',
    '2021-06-25',
    '14:30',
    'activa',
    '8',
    '5'
  ),
  (
    'domicilio',
    '2021-06-25',
    '2021-06-28',
    '9:00',
    'activa',
    '4',
    '5'
  ),
  (
    'sucursal',
    '2021-06-30',
    '2021-07-1',
    '14:20',
    'activa',
    '6',
    '1'
  ),
  (
    'sucursal',
    '2021-06-29',
    '2021-07-1',
    '12:15',
    'activa',
    '10',
    '1'
  ),
  (
    'domicilio',
    '2021-07-02',
    '2021-07-05',
    '9:00',
    'cancelada',
    '9',
    '2'
  ),
  (
    'domicilio',
    '2021-07-05',
    '2021-07-07',
    '9:00',
    'activa',
    '20',
    '1'
  ),
  (
    'sucursal',
    '2021-07-07',
    '2021-07-08',
    '11:30',
    'cancelada',
    '11',
    '2'
  ),
  (
    'sucursal',
    '2021-07-10',
    '2021-07-12',
    '10:00',
    'cancelada',
    '17',
    '2'
  ),
  (
    'domicilio',
    '2021-07-12',
    '2021-07-13',
    '9:15',
    'activa',
    '21',
    '4'
  ),
  (
    'sucursal',
    '2021-07-14',
    '2021-07-25',
    '12:15',
    'activa',
    '12',
    '4'
  ),
  (
    'sucursal',
    '2021-07-16',
    '2021-07-18',
    '10:15',
    'cancelada',
    '13',
    '2'
  ),
  (
    'sucursal',
    '2021-07-20',
    '2021-07-25',
    '10:15',
    'cancelada',
    '14',
    '4'
  ),
  (
    'sucursal',
    '2021-07-19',
    '2021-07-20',
    '11:30',
    'cancelada',
    '15',
    '3'
  ),
  (
    'sucursal',
    '2021-07-23',
    '2021-03-24',
    '10:15',
    'cancelada',
    '16',
    '3'
  ),
  (
    'sucursal',
    '2021-07-25',
    '2021-07-26',
    '9:15',
    'cancelada',
    '18',
    '4'
  ),
  (
    'sucursal',
    '2021-07-25',
    '2021-07-26',
    '12:15',
    'cancelada',
    '19',
    '3'
  );
  /*Modificaciones a citas*/
UPDATE
  citas
SET
  citas.estado_cita = 'activa'
WHERE
  cve_cita = '13';
UPDATE
  citas
SET
  citas.estado_cita = 'activa'
WHERE
  cve_cita = '17';
UPDATE
  citas
SET
  citas.estado_cita = 'activa'
WHERE
  cve_cita = '18';
UPDATE
  citas
SET
  citas.estado_cita = 'activa'
WHERE
  cve_cita = '19';
UPDATE
  citas
SET
  citas.estado_cita = 'activa'
WHERE
  cve_cita = '20';
  /*Tipo_servicio*/
ALTER TABLE
  tipo_servicio AUTO_INCREMENT = 1;
INSERT INTO
  tipo_servicio (nombre_servicio)
VALUES
  ('Eliminacion de malware del sistema'),
  /*1*/
  (
    'Adquisicion de licencia de antivirus e instalacion de antivirus'
  ),
  /*2*/
  ('Instalacion de disipador de calor para CPU'),
  /*3*/
  ('Instalacion de fuente de poder'),
  /*4*/
  ('Mantenimiento correctivo de hardware'),
  /*5*/
  ('Instalacion de memoria RAM'),
  /*6*/
  ('Instalacion de tarjeta de red'),
  /*7*/
  ('Instalacion de controladores de hardware'),
  /*8*/
  ('Instalacion de disco duro'),
  /*9*/
  ('Respaldado de informacion'),
  /*10*/
  ('Importacion de informacion'),
  /*11*/
  ('Limpieza de componentes de computador'),
  /*12*/
  (
    'Instalacion de ventiladores interiores de equipo de computo'
  ),
  /*13*/
  ('Instalacion de display'),
  /*14*/
  ('Instalacion de tarjeta de sonido');
  /*15*/
  /*Orden_servicios*/
ALTER TABLE
  orden_servicios AUTO_INCREMENT = 1;
DELETE FROM
  orden_servicios
WHERE
  reg_orden_serv;
INSERT INTO
  orden_servicios (
    comentarios_cliente,
    autorizacion,
    especificacion_equipo,
    diagnostico,
    cita,
    fecha_inicio_proc,
    fecha_fin_proc
  )
VALUES
  (
    'El disipador del procesador se ha ensuciado o tiene demasiado polvo, ademas la pantalla se congela cuando se usa por grandes periodos de tiempo',
    'aceptada',
    'Computadora Completa Hp Core i5 4ta Gen 8gb 500gb Monitor 22 Pulgadas Wifi Teclado Raton',
    'Malware en el sistema que propicia el uso de mas recursos de los necesarios en el sistema',
    '1',
    '',
    ''
  ),
  (
    'Mucha lentitud en las operaciones normales al usar la computadora y problemas con la fuente de poder, emite ruido y olor',
    'aceptada',
    'Computadora Lenovo M83 Core I7 8gb 500hdd Monitor 22',
    'Una tarjeta de memoria RAM no encajaba perfectamente, ademas el disipador de calor del cpu no funciona correctamente, incluyendo la inminente descompostura de la fuente de poder',
    '3',
    '',
    ''
  ),
  (
    'No enciende el computador',
    'pendiente',
    'Computadora de Escritorio Dell Core i5 8gb RAM disco duro 500GB Monitor 22 pulgadas',
    'Mal funcionamiento del encendido por problemas en la conexion de los pines de encendido y poder',
    '4',
    '',
    ''
  ),
  (
    'El sonido de la computadora falla o simplemente se va por mucho tiempo',
    'rechazada',
    'Computadora All in One Hp 24-DP0002LA / AMD Ryzen 5 / 23.8 Pulg. / 1tb / 12gb RAM / Plata',
    'Desajuste en el socket de conexion de la tarjeta de sonido',
    '5',
    '',
    ''
  ),
  (
    'Computador se apaga repentinamente',
    'rechazada',
    'Computadora HP 280 G5 SFF, Intel Core i5-10500 3.10GHz, 8GB, 1TB, Windows 10 Pro 64-bit',
    'Cables de la fuente de poder descompuestos e incompatibilidad de RAM',
    '6',
    '',
    ''
  ),
  (
    'Las conexiones wifi no se establecen',
    'pendiente',
    'Computadora Gamer Xtreme PC Gaming CM-05024, AMD Ryzen 3 3200G 3.60GHz, 8GB, 1TB, Radeon Vega 8, FreeDOS',
    'La tarjeta de red esta dañada',
    '7',
    '',
    ''
  ),
  (
    'La pantalla parpadea y cambian los colores normales',
    'aceptada',
    'Computadora Dell Vostro 3681, Intel Core i5-10400 2.90GHz, 8GB, 1TB, Windows 10 Home 64-bit',
    'Controladores de pantalla inadecuados',
    '8',
    '',
    ''
  ),
  (
    'Las teclas del portatil se han despegado',
    'pendiente',
    'Laptop HP 2020 de 14 pulgadas (35.6 cm), HD, AMD Ryzen 3, 3250U Dual-Core, 4GB RAM, disco duro de 1TB, HDMI, tarjeta AMD Radeon Vega 3 Graphics, Windows 10 Home, color plata',
    'Teclas de uso frecuente despegadas',
    '9',
    '',
    ''
  ),
  (
    'Ruidos extraños al encender la computadora',
    'aceptada',
    'Computadora Dell Vostro 3681, Intel Core i5-10400 2.90GHz, 8GB, 1TB, Windows 10 Home 64-bit',
    'Disco duro dañado por el tiempo, se recomienda respaldado urgente',
    '11',
    '',
    ''
  ),
  (
    'Se muestra la pantalla con retraso de imagen y parpadeante',
    'rechazada',
    'Chromebook 2020 Flagship HP 14, Laptop de 14 pulgadas, HD SVA, Pantalla antirreflejante Procesador Intel Celeron 4GB DDR4 64GB eMMC Retroiluminada',
    'Daños en las bisagras de la pantalla',
    '13',
    '',
    ''
  ),
  (
    'Ruidos extraños en la laptop al encender y en arranque',
    'aceptada',
    'HP 15,6 pulgadas HD Screen Laptop, 10ª generación Intel Core i3-1005G1, 8 GB DDR4 RAM, 256 GB PCIe NVMe M.2 SSD, Intel UHD Graphics, Wi-Fi, cámara web, Windows 10 Home',
    'Ventilador sobreefrozandose debido al exceso de polvo',
    '14',
    '',
    ''
  ),
  (
    'La pantalla se queda sin colores',
    'aceptada',
    'Computadora Lenovo V50s SSF, Intel Core I3-10100 3.60GHz, 8GB, 256GB SSD, Windows 10 Pro 64-bit',
    'Conexion inestable entre la pantalla y el CPU, entradas dañadas',
    '15',
    '',
    ''
  ),
  (
    'La pantalla de la laptop muestra todo en color magenta y lineas blancas',
    'pendiente',
    '2021 HP 15.6" HD Laptop Computer Intel Dual-Core Pentium 6405U Procesador 4GB RAM 128GB SSD Intel UHD Graphics HD Webcam Bluetooth RJ-45 USB-C HDMI Windows 10 Scarlet Red RE 32GB USB 3.0 Flash Drive',
    'Daños serios en la pantalla de laptop, se recomienda cambio',
    '17',
    '',
    ''
  ),
  (
    'Sonido fuerte y preocupante en la fuente de poder',
    'rechazada',
    'Computadora Gamer Xtreme PC Gaming CM-05021, Intel Celeron J1800 2.41GHz, 8GB, 500GB,',
    'Fuente de poder a termino de su vida util, requiere cambio e instalacion',
    '18',
    '',
    ''
  ),
  (
    'Se ven rayas de colores en la pantalla con el uso continuo',
    'aceptada',
    'Computadora Gamer Xtreme PC Gaming CM-78048, AMD Ryzen 5 2400G 3.60GHz, 8GB, 240GB SSD, WiFi, Windows',
    'Falta de correcta ventilacion de los componentes, se sugiere instalacion de ellos',
    '19',
    '',
    ''
  ),
  (
    'Pitido continuo en la computadora',
    'pendiente',
    'Computadora Kit Dell Vostro 3681, Intel Core i7-10700 2.90GHz, 8GB, 1TB, Windows 10 Pro 64-bit',
    'suministro eléctrico incorrecto, fuente de alimentación o alimentación de la placa',
    '20',
    '',
    ''
  );
BEGIN --actualizaciones
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-06-12'
WHERE
  reg_orden_serv = '1';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-06-13'
WHERE
  reg_orden_serv = '1';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-06-16'
WHERE
  reg_orden_serv = '2';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-06-17'
WHERE
  reg_orden_serv = '2';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-07-02'
WHERE
  reg_orden_serv = '7';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-07-03'
WHERE
  reg_orden_serv = '7';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-07-08'
WHERE
  reg_orden_serv = '9';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-07-09'
WHERE
  reg_orden_serv = '9';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-07-9'
WHERE
  reg_orden_serv = '11';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-07-10'
WHERE
  reg_orden_serv = '11';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-07-26'
WHERE
  reg_orden_serv = '12';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-07-27'
WHERE
  reg_orden_serv = '12';
UPDATE
  orden_servicios
SET
  fecha_inicio_proc = '2021-03-25'
WHERE
  reg_orden_serv = '12';
UPDATE
  orden_servicios
SET
  fecha_fin_proc = '2021-03-26'
WHERE
  reg_orden_serv = '12';
END --final de actualisasiones
/*cotizacion*/
ALTER TABLE
  cotizacion AUTO_INCREMENT = 1;
INSERT INTO
  cotizacion (detalle_concepto, tipo_serv, precio, orden_serv)
VALUES
  ('Eliminacion de malware', '1', '165', '1'),
  (
    'Instalacion de Kaspersky antivirus y licencia semestral',
    '1',
    '350',
    '1'
  ),
  (
    'Cuidado e instalacion de memorias RAM',
    '6',
    '50',
    '3'
  ),
  (
    'Compra e instalación de un nuevo disipador de calor para CPU',
    '3',
    '400',
    '3'
  ),
  (
    'Compra e instalación de una fuente de poder a la medida calidad plata',
    '4',
    '790',
    '3'
  ),
  (
    'Instalacion correcta de los pines de conexion en la tarjeta madre',
    '5',
    '60',
    '3'
  ),
  (
    'Reparacion e instalación de la tarjeta de sonido',
    '15',
    '250',
    '4'
  ),
  (
    'Compra e instalacion e una fuente de poder a medida calidad plata',
    '4',
    '800',
    '5'
  ),
  (
    'Compra e instalacion de memoria RAM compatible con la tarjeta madre',
    '6',
    '850',
    '5'
  ),
  (
    'Compra de una tarjeta de red a medida e instalacion de la misma',
    '7',
    '1050',
    '6'
  ),
  (
    'Instalacion de controladores de pantalla adecuados, actualizados y compatibles en el equipo',
    '8',
    '130',
    '7'
  ),
  (
    'Reparacion de teclado de laptop y mantenimiento',
    '5',
    '210',
    '8'
  ),
  (
    'Compra e instalacion de disco duro ',
    '9',
    '1300',
    '9'
  ),
  ('Respaldo de informacion', '10', '375', '9'),
  (
    'Importacion de datos a nuevo disco duro',
    '11',
    '175',
    '9'
  ),
  (
    'Compra e instalacion de nuevo marco y bisagras de laptop',
    '14',
    '650',
    '10'
  ),
  (
    'Limpieza total de interior de computador',
    '12',
    '180',
    '11'
  ),
  (
    'Reparacion y mantenimiento de ventilador de CPU',
    '5',
    '130',
    '11'
  ),
  (
    'Reparacion de entrada de conexion de la tarjeta madre',
    '5',
    '75',
    '12'
  ),
  (
    'Cambio e instalacion de cable de conexion de pantalla',
    '5',
    '145',
    '12'
  ),
  (
    'Compra e instalacion de una pantalla para laptop',
    '14',
    '490',
    '13'
  ),
  (
    'Compra e instalacion de fuente de poder a medida de calidad plata',
    '4',
    '1050',
    '14'
  ),
  (
    'Compra de ventiladores e instalacion de los mismos para tener buen entrada y salida de aire',
    '13',
    '556',
    '15'
  ),
  (
    'Mantenimiento y conexion correcta de las conexiones de alimentacion a placa base',
    '5',
    '250',
    '16'
  ),
  (
    'Limpieza de componentes interiores del cpu',
    '12',
    '85',
    '16'
  );