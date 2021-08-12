CREATE DATABASE AppSoCom;
USE AppSoCom;

CREATE TABLE Rol_usuario
(
id_rol INT(10) UNIQUE PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_usuario VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE categoria
(
id_cat int(10) auto_increment primary key not null,
categoria varchar(25) not null unique
);

CREATE TABLE usuarios 
(
id_usuario INT(10) UNIQUE PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_usuario varchar(25),
nombres varchar(35) not null,
ap_paterno varchar(28) not null,
ap_materno varchar(28) not null,
contraseña VARCHAR(500) NOT NULL,
correo VARCHAR(40) UNIQUE NOT NULL,
Rol INT(10) NOT NULL,
fecha_creacion date,
CONSTRAINT fk_rol_usuario FOREIGN KEY (Rol) REFERENCES Rol_usuario(id_rol)
);

CREATE TABLE publicaciones (
cve_pub int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
titulo_pub varchar(200) NOT NULL UNIQUE, 
contenido text NOT NULL,
imagen varchar(500), 
tema enum('informativa','consejos','sugerencias') NOT NULL, 
me_gusta int(10), 
fecha_pub date NOT NULL,
autor int(10) not null,
CONSTRAINT fk_usuario FOREIGN KEY (autor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE productos (
id_producto int(10) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT, 
nombre varchar(200) NOT NULL UNIQUE, 
descripcion text NOT NULL,
stock int(10) NOT NULL, 
precio_unitario double NOT NULL, 
categoria int(10), 
imagen varchar(500),
CONSTRAINT fk_categoria FOREIGN KEY (categoria) REFERENCES categoria(id_cat)
);

/*Tabla domicilio*/
CREATE TABLE Domicilio (
id_domicilio int (10) PRIMARY KEY AUTO_INCREMENT not null,
cliente int(10) not null,
calle varchar (50) not null,
codigo_postal int (5) not null,
numeroExt int(5),
numeroInt int(5),
telefono varchar(10),
CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario)
);

/*tabla metodo de pago*/
CREATE TABLE metodo_pago(
id_metodo int (10) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (20)
);

/*tabla carrito*/
CREATE TABLE carrito(
id_carrito int (10) PRIMARY KEY AUTO_INCREMENT,
cliente int(10),
producto int (10),
cantidad int(2) not null,
CONSTRAINT fk_cliente_carr FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario),
CONSTRAINT fk_producto_carr FOREIGN KEY (producto) REFERENCES productos(id_producto)
);

/*tabla orden compra*/
CREATE TABLE orden_compra(
id_orden int  (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
folio int,
cliente int (10) not null,
metodoPago int (10) not null,
total int(10) not NULL ,
domicilio int (10) NOT  NULL,
fecha_pedido date not NULL,
CONSTRAINT fk_cliente_ord FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario),
CONSTRAINT fk_metodoPago_ord FOREIGN KEY (metodoPago) REFERENCES metodo_pago(id_metodo),
CONSTRAINT fk_domicilio_ord FOREIGN KEY (domicilio) REFERENCES domicilio(id_domicilio)
);

/*Tabla orden_detalle*/
CREATE TABLE orden_detalle(
id_det int (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
orden int (10) not null,
producto int (10) not null,
cantidad int (5) not null,
precio int (10) not null,
CONSTRAINT fk_ordende FOREIGN KEY (orden) REFERENCES orden_compra(id_orden),
CONSTRAINT fk_productoo_det FOREIGN KEY (producto) REFERENCES productos(id_producto)
);

/*orden_compra*/
ALTER TABLE `orden_compra` CHANGE `cliente` `cliente` INT(10) NULL, 
CHANGE `total` `total` INT(10) NULL, 
CHANGE `domicilio` `domicilio` INT(10) NULL, 
CHANGE `metodoPago` `metodoPago` INT(10) NULL,
CHANGE `fecha_pedido` `fecha_pedido` TIMESTAMP on 
update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

/*Inserciones en BD---------------------------------------------------*/


/*ROL USUARIOS*/
INSERT INTO rol_usuario (rol_usuario.tipo_usuario) VALUES 

('Administrador'),

('Administrador_Blog'),

('Cliente');

/*Usuarios*/
ALTER TABLE usuarios AUTO_INCREMENT = 1;
INSERT INTO usuarios (usuarios.nombre_usuario, usuarios.nombres, usuarios.ap_paterno,usuarios.ap_materno, usuarios.correo, usuarios.contraseña, usuarios.Rol) 
VALUES 
('Vic_555','Victor Isaac','Rodriguez','Garcia','4abduhosny_2012@gmail.com','papwi123','1'),
('NairaUri1','Naira','Uribe','Macias','zahmadn@gmail.com','dan123','2'),
('xxjuan77','Juan Manuel','Fernandez','Lujan','fosaf47575@gmail.com','santi123','3'),
('AleL55','Alejandra','Luna','Perez','jseham_20@gmail.com','iozo133','3'),
('Leo33','Leon Daniel','Martinez','Hopi','vzlo_1@gmail.com','dan934','3'),
('MariLaiu_5','Maria Rocio','Liu','Sanchez','9hunjun@gmail.com','letan123','3'),
('Jorch123','Jorge','Cisneros','Martinez','qhic_1@gmail.com','fueg_1','3'),
('Pablolike55','Pablo','Contreras','Siller','gsenyoo_5@gmail.com','54senda','3'), 
('ManuGar','Manuel','Garcia','Perez','boussama179@gmail.com','nome35','3'),
('GarayEle23','Elsa Patricia','Garay','Puentes','2ishwarya@gmail.com','spider123','3'),
('77Leslie','Leslie','Cuellar','Oropeza','2reyeslam991@gmail.com','itsjust123','3'),
('Wilv935','Wilbert','Guajardo','Gutierrez','giwanttokilluman@gmail.com','ch123','3'),
('HMigue_75','Hector Miguel','De Santiago','Adame','ospaco.red@gmail.com','desplant123','3'),
('ArtePa_77xx','Paola','Arteaga','Garcia','zakaria12_@gmail.com','bait123','3'),
('DanMP55','Tamara','Plascencia','Lopez','jennifer.mou_@gmail.com','mason123','3'),
('Patrick-bob','Patricio Emanuel','Miron','Perez','ujames_1@gmail.com','papas123','3'),
('ElisaMuro-Rey','Elisa','Muro','Reynoso','elovee_21@gmail.com','cuatra123','3'),
('Tomas-Sylver777','Tomas','Corral','Lazarin','PaloArt55@gmail.com','pali123','3'),
('MariLu-1999','Maria Lucia','Muñoz','De la rosa','ela_ou_55@outlook.es','123mma','3'),
('ImaGamer555','Imanol','Arzate','Rivera','Imas_a_331@outlook.es','inten193','3'),
('WhizMar31','Marcos','Martinez','Jimenez','Maride_la_55@outlook.com','marde123','3'),
('Fel-Ma','Felipe','Macias','Adame','Tom_mas_55@outlook.es','bronce143','3'),
('Josepe:)','Joseph','De la Rosa','Esquivel','Santi_00_2@outlook.es','menis123','3'),
('AxaRyu','Isaac','Lopez','Gonzales','pbito123_4@gmail.com','qatar123','3'),
('JorPe-77','Jorge','Perez','Cuellar','8714369915','9','3'),
('DanBri-Gamerx','Daniel','Brizuela','De la cruz','Luna123_s@gmail.com','delha1','3');

UPDATE usuarios SET fecha_creacion='2021-01-15' WHERE id_usuario = 1;
UPDATE usuarios SET fecha_creacion='2021-01-17' WHERE id_usuario = 2;
UPDATE usuarios SET fecha_creacion='2021-01-20' WHERE id_usuario = 3;
UPDATE usuarios SET fecha_creacion='2021-01-22' WHERE id_usuario = 4;
UPDATE usuarios SET fecha_creacion='2021-01-23' WHERE id_usuario = 5;
UPDATE usuarios SET fecha_creacion='2021-01-25' WHERE id_usuario = 6;
UPDATE usuarios SET fecha_creacion='2021-01-27' WHERE id_usuario = 7;
UPDATE usuarios SET fecha_creacion='2021-01-28' WHERE id_usuario = 8;
UPDATE usuarios SET fecha_creacion='2021-01-29' WHERE id_usuario = 9;
UPDATE usuarios SET fecha_creacion='2021-01-30' WHERE id_usuario = 10;
UPDATE usuarios SET fecha_creacion='2021-02-1' WHERE id_usuario = 11;
UPDATE usuarios SET fecha_creacion='2021-02-1' WHERE id_usuario = 12;
UPDATE usuarios SET fecha_creacion='2021-02-1' WHERE id_usuario = 13;
UPDATE usuarios SET fecha_creacion='2021-02-3' WHERE id_usuario = 14;
UPDATE usuarios SET fecha_creacion='2021-02-4' WHERE id_usuario = 15;
UPDATE usuarios SET fecha_creacion='2021-02-5' WHERE id_usuario = 16;
UPDATE usuarios SET fecha_creacion='2021-02-6' WHERE id_usuario = 17;
UPDATE usuarios SET fecha_creacion='2021-02-6' WHERE id_usuario = 18;
UPDATE usuarios SET fecha_creacion='2021-02-6' WHERE id_usuario = 19;
UPDATE usuarios SET fecha_creacion='2021-02-12' WHERE id_usuario = 20;
UPDATE usuarios SET fecha_creacion='2021-02-16' WHERE id_usuario = 21;
UPDATE usuarios SET fecha_creacion='2021-02-19' WHERE id_usuario = 22;
UPDATE usuarios SET fecha_creacion='2021-02-19' WHERE id_usuario = 23;
UPDATE usuarios SET fecha_creacion='2021-02-24' WHERE id_usuario = 24;
UPDATE usuarios SET fecha_creacion='2021-02-28' WHERE id_usuario = 25;
UPDATE usuarios SET contraseña='pizzas546' WHERE id_usuario = 25;
UPDATE usuarios SET correo='jorgdnz@gmail.com' WHERE id_usuario = 25;

ALTER TABLE domicilio ADD colonia varchar(60) not null;
ALTER TABLE domicilio AUTO_INCREMENT = 1;
insert into domicilio(cliente,calle,colonia,numeroExt,numeroInt,codigo_postal,telefono)
VALUES 
(3,'AZTECAS', 'LAS CAROLINAS',395,null,27040,'8713509720'),
(4,'PEDRO CAMINO', 'AMPLIACION LOS ANGELES',108,null,27260,'8703985297'),
(5,'JUAN E GARCIA', 'TORREON CENTRO',63,null,27000,'8701986529'),
(6,'PASEO DE LA DANZA', 'CAMPESTRE LA ROSITA',506,1,27250,'8715987462'),
(7,'SALTILLO 400', 'CAMPESTRE LA ROSITA',951,null,27250,'2015894537'),
(8,'BERLIN', 'SAN ISIDRO',201,null,27100,'8215453097'),
(9,'AVE JUAREZ', 'FRAC CALIFORNIA',null,null,27089,'8741203698'),
(10,'HIDALGO', 'TORREON CENTRO',1440,4,27000,'8587410398'),
(11,'AV. PRESIDENTE CARRANZA', 'CENTRO',881,null,27000,'8712036592'),
(12,'SALTILLO', 'CAMPESTRE LA ROSITA',400,951,27250,'8745120369'),
(13,'JUAREZ', 'TORREON CENTRO',3254,null,27000,'8745103685'),
(14,'PASEO DE LA DANZA', 'CAMPESTRE LA ROSITA',506,1,27250,'8745120398'),
(15,'PASEO DE LA DANZA', 'CAMPESTRE LA ROSITA',506,2,27250,'8745196320'),
(16,'PASEO DE LA DANZA', 'CAMPESTRE LA ROSITA',506,3,27250,'8745120398'),
(17,'CARR MATAMOROS TORREON', 'LA AMISTAD',309,null,27087,'8695741203'),
(18,'CONSTITUCION', 'LAS MARGARITAS',1111,null,27130,'2987451203'),
(19,'AV PDTE CARRANZA', 'CENTRO',1499,null,27032,'8795698730'),
(20,'DE LAS PAPAS', 'ABASTOS',169,170,27020,'8745129837'),
(21,'HIDALGO', 'TORREON CENTRO',1130,null,27000,'8745120398'),
(22,'PASEO DE LA ROSITA', 'CENTRO',1578,null,27015,'8976541230'),
(23,'CALLE SAN JOAQUIN', 'CENTRO',1710,null,27020,'8754198762'),
(24,'AVENIDA REFORMA', 'CENTRO',878,null,27000,'8749512398'),
(25,'PROLONGACION HIDALGO', 'CENTRO',554,null,27000,'8741520398');

ALTER TABLE publicaciones AUTO_INCREMENT = 1;
INSERT INTO publicaciones (titulo_pub,imagen,tema,me_gusta,fecha_pub,contenido,autor) 
VALUES 
('Conociendo la BIOS para prestar un mejor servicio en la Reparación de la PC','https://hardzone.es/app/uploads-hardzone.es/2020/06/BIOS-2.jpg?x=480&quality=20','informativa','50','2021-06-1','La BIOS es un programa que se carga en la memoria ROM (memoria de solo lectura) , que en el momento de encender la PC o reiniciar la misma realiza un chequeo del hardware que se encuentra conectado a la misma.
Durante este proceso realiza realmente un diagnostico al cual comúnmente se le llama POST o prueba automática de encendido, lo cual entenderás es muy importante a tener en cuenta cuando se trata de establecer fallas en un proceso de reparación de la PC.', 2),
('Solucionando problemas con lo zócalos durante la reparación de la PC','https://previews.123rf.com/images/scanrail/scanrail1210/scanrail121000013/15608534-macro-vista-del-z%C3%B3calo-de-la-cpu-en-la-placa-base-del-ordenador-pc.jpg','informativa','70','2021-06-5','Si alguno de estos componentes presenta problemas  sin duda alguna todo el funcionamiento de la computadora se vera afectado, a continuación me permito explicarte como resolver problemas con la tarjeta principal, específicamente cuando se presenta problemas con los slots o zócalos donde se insertan los diferentes componentes como el procesador, la memoria, tarjetas de interface, entre otros.', 2),
('Solucionando problemas con los drivers','https://www.informaticovitoria.com/wp-content/uploads/2016/03/problemas-drivers.jpg','sugerencias','30','2021-06-5','Cuando un driver genera problemas, nuestro sistema operativo no se carga adecuadamente, se generan mensajes de error y el equipo se reinicia, esto ocurre porque el sistema busca protegerse y comenzar una instancia anterior a la carga del controlador defectuoso. Lo ideal entonces es que durante el proceso de reinicio presionemos la tecla F8 y seleccionemos la opción “volver a la ultima configuración que funciono correctamente”, de esta manera el equipo iniciara correctamente.', 2),
('Solucionando problemas con el teclado','https://articles-images.sftcdn.net/wp-content/uploads/sites/2/2011/06/iStock_000014223237Small.jpg','consejos','25','2021-06-6','Su funcionamiento esta gobernado por el microprocesador y los circuitos de control, cada tecla al ser presionada cierra un circuito, estos son detectados por el microprocesador y acude a la memoria ROM del teclado en donde se encuentran los mapas de caracteres asociados a cada tecla.Sus fallas son muy evidentes, ya que podemos evidenciarlas fácilmente, pero lo mas importante antes de entrar a repararlo es considerar si es mejor adquirir uno nuevo o repararlo.', 2),
('La PC no enciende: ¿Fallas con la Fuente?','https://hardzone.es/app/uploads-hardzone.es/2019/10/Fuente-estropeada.jpg','informativa','65','2021-06-10','Bien,  si prestas atención a lo que te voy a explicar, vas a  conocer el funcionamiento de la fuente de poder y la manera adecuada de detectar y solucionar los diferentes  problemas que se puedan presentar con esta.La función principal de la fuente de poder es convertir la energía del tomacorriente (corriente alterna) de la pared en aquello que sea utilizable por los diferentes circuitos de la computadora (corriente continua), por lo tanto asegura un suministro estable de corriente para que los diferentes componentes del equipo funcionen adecuadamente.', 2),
('Solucionando problemas con programas que se cargan al inicio','https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/01/282111-problemas-windows.jpg?itok=HUwIlE1g','informativa','70','2021-06-15','En muchas ocasiones observamos que se presentan problemas durante la carga del sistema operativo, es decir el sistema no carga adecuadamente y tal vez no sabemos a que se deba, y peor aun no sabemos como abordar esta problemática.Una de las primeras actividades que deberás hacer para abordar esta problemática es deshabilitar los programas que se cargan al inicio del sistema, que pueden estar fallando y generando problemas con el sistema operativo e impiden que este cargue normalmente.', 2),
('Identificando la principales actividades de optimización y mejoramiento de la PC','https://cdn1.josefacchin.com/wp-content/uploads/2019/10/limpiar-acelerar-pc.png','informativa','35','2021-06-15','Es de mucha importancia que dentro del proceso de mantenimiento y reparación de la PC, aprendas a identificar las principales herramientas que existen en el mercado, y que ayudaran a optimizar y mejorar el desempeño de la PC, y los cuales se deben considerar esenciales en cualquier kit de herramientas de toda persona que se dedique a esta actividad ya sea de carácter profesional o a nivel personal.Dentro de las principales actividades de optimización y mejoramiento que se debe realizar a una computadora están:', 2),
('Identificando las herramientas básicas de trabajo','http://3.bp.blogspot.com/_VYzjIRKP4q8/TQhWG1ZGT5I/AAAAAAAAAAM/NO3ZuhXffRE/s320/img.jpg','consejos','15','2021-06-20','Destornilladores de dado de 3/16  y 1/4 de pulgada,Destornilladores de cruz pequeños y medianos,Destornilladores planos pequeños y medianos,Extractores e insertores de chips,Pinzas (sujeta tornillos, común, para circuitos integrados),Sujetadores de pinzas tipo garra,Destornilladores Torx T10 y T15,Linterna pequeña,Cortador / removedor de cable Lima,Pulsera antiestática,Recipiente porta tornillosMultimetro', 2),
('LA MEMORIA RAM: Conociéndola para detectar problemas relacionados con la misma','https://hardzone.es/app/uploads-hardzone.es/2019/10/Velocidad-RAM.jpg','sugerencias','100','2021-06-22','importante conocer el funcionamiento de la memoria RAM en la PC, ya que esta hace parte de de uno de los componentes principales que conforman el sistema de computo, por lo cual un problema  en la misma ocasiona fallas en la computadora.La memoria RAM (Memoria de acceso aleatorio). Es el lugar donde la computadora guarda sus datos de manera temporal, para  luego ser accesados por el procesador  de manera más rápida, es decir estos datos se pierden cuando se apaga la computadora, solo permanecerán aquellos que hallan sido guardados en el disco duro.', 2),
('Problemas con el procesador: efectuando un acertado diagnostico.','https://supportoolsblog.files.wordpress.com/2017/03/microprocesador.jpg','consejos','20','2021-06-23','Entre los principales síntomas que se presentan cuando el procesador esta fallando se encuentran:Al encender  nuestra computadora, no tenemos señal de video en el monitor, y ya hemos descartado las otras dos posibilidades: fallas en la tarjeta madre o fallas en la tarjeta de video, entonces el problema puede estar en el procesador.En algunas ocasiones se inicia la computadora, carga el sistema de video y se muestra la versión de la BIOS, se inicia la rutina POST, pero pueden aparecer letras extrañas en la pantalla y las rutinas no se completan adecuadamente, y el sistema deja de funcionar, este caso podría ser un problema con el procesador, ya sea por fallas de fabrica o por sobrecalentamiento y lo han dañado, en tal situación se deberá adquirir un nuevo microprocesador.', 2),
('Mantenimiento de computadoras: Que debo tener presente antes de desarmar mi PC ?','https://m.media-amazon.com/images/I/51-qvkB0hTL.jpg','consejos','15','2021-06-24','Antes del desarmado de cualquier sistema deberás tener presente varios aspectos:Prevenir las descargas estáticas  en los diferentes componentes de la PC, ya que nuestro cuerpo puede tener una gran carga de voltaje que podría dañar los componentes de la computadora, por lo tanto para evitar esta situación podrías realizar dos cosas:', 2),
('Mantenimiento de la PC: Como protegerte contra los virus informáticos','https://www.muycomputer.com/wp-content/uploads/2017/06/VirusPC.jpg','sugerencias','60','2021-06-25','sadilla.Primero quiero que comprendas que un virus no es mas que un programa con unas características muy particulares que se introducen en los computadores de formas muy diversas como a través del correo electrónico, la Internet, u otras formas y que se reproducen infectando otros archivos o programas, y al ejecutarse realizan acciones molestas y/o dañinas para los usuarios de las computadoras.', 2),
('Reparación de la PC: Entendiendo el proceso de arranque de la computadora.','https://www.softzone.es/app/uploads-softzone.es/2019/02/boton.jpg?x=480&y=375&quality=40','consejos','300','2021-06-25','Desde el momento que en que prendemos la computadora, internamente se están ejecutando una serie de procedimientos que permiten verificar que todos los componentes de la computadora funcionan de manera correcta, estos procedimientos reciben el nombre de POST (Power-On-SelfTest) que no es mas que un sistema de auto prueba que realiza la computadora sobre sus componentes.', 2),
('Reparación de la PC: Entendiendo los elementos que intervienen en el encendido de la computadora','https://descubrecomohacerlo.com/wp-content/uploads/2020/07/lapto-cargador.jpg','informativa','1000','2021-06-28',' La red domiciliaria nos permite obtener  la energía que nuestra  computadora requiere para funcionar, inicialmente llega con tensiones de 110-120 ACV.,Nos encontramos luego con un regulador de voltaje, quien deberá estar entre la red domiciliaria y la fuente de alimentación de la PC, este me permite mantener los niveles de energía estables y de esta manera evitar bajas o altas de tensión que puedan dañar los diferentes componentes de la computadora.,Posteriormente la Fuente de poder que se encuentra en nuestra computadora es quien recibe la corriente de la red domiciliaria desde el regulador de voltaje, en este momento la corriente alterna que esta llegando de la red domiciliaria es transformada en corriente continua a través de un proceso de rectificación. Entonces es enviada a través de los diferentes cables de poder a nuestro PC para alimentar cada uno de sus componentes.', 2),
('Mantenimiento del PC: Respaldando la información','http://2.bp.blogspot.com/-smEgrLD5cCk/Vft1bpNTa4I/AAAAAAAAAEc/IbPeHtX2hrw/s1600/backup-three-laptops-plugged-into-word.jpg','informativa','80','2021-06-25','Es por esto que es  fundamental contar  con un método de respaldo de la información que sea confiable.Existen muchos métodos para realizar respaldos de la información y diferentes medios de  almacenamiento con los que podemos contar  al momento de resguardar los datos, hoy  voy a abordar las herramientas que nos ofrecen los sistemas operativos, para este caso me concentrare la herramienta para la realización de copias de respaldo de Windows XP.', 2),
('Mantenimiento de la Computadora: Identificando la causa de los problemas más comunes que se presentan al inicio del sistema.','https://estaticos-cdn.prensaiberica.es/clip/1f9a9ef5-d6c0-4263-9e9d-ed630714c764_16-9-aspect-ratio_default_0.jpg','sugerencias','35','2021-07-01','Revisa que las conexiones de la red eléctrica estén bien conectadas al computador, si todo anda bien entonces estaremos descartando que el problema proceda de una inadecuada conexión a la red eléctrica.El segundo paso es asegurarte  que el problema no proceda de la Fuente de poder, que suministra corriente regulada a el computador, para este caso deberás hacer los siguientes pasos:Desconecta totalmente el equipo de la energía y con mucho cuidado abre el gabinete de la computadora y verifica que el conector grande de la fuente de poder este bien conectado a la tarjeta principal, y esta sea la razón por la cual no llega la tensión o voltaje adecuado a la computadora para iniciar.De no ser este el problema, muy seguramente el mal funcionamiento provenga de algún componente integrado a la tarjeta principal, de ser así deberás evaluar la conveniencia de repararla o comprar una nueva.', 2),
('Mantenimiento de la PC: Explorando el interior de la Computadora','http://2.bp.blogspot.com/_aLaXCzSH7JU/SjAZN-EEbKI/AAAAAAAAAAg/PXmPZWgElfE/s320/computadora1%5B1%5D.jpg','sugerencias','15','2021-07-01','Tarjeta Principal: es uno de los elementos  más importantes de la PC, es allí donde donde se conectan los diferentes componentes indispensables para el funcionamiento de la PC,  sobre los cuales se realiza el flujo y proceso de la información.En ella encontramos los conectores que permiten la alimentación de energía desde la fuente de poder, las ranuras de expansión o slots que es donde se instalan las tarjetas de interface, las ranuras para la memoria RAM, y los circuitos electrónicos integrados que permiten el procesamiento y control como el procesador y Chipsets  de soporte, por todo lo anterior se constituye en el modulo principal de la computadora.', 2),
('Mantenimiento de la PC: Conociendo como viajan los datos al interior de la Computadora.','https://i0.wp.com/2.bp.blogspot.com/-jWvC12lj_HY/Vrp5ruOdttI/AAAAAAAAA80/nye3kcw2uh0/s640/Esquema-PC.gif?resize=640%2C480&ssl=1','informativa','10','2021-07-05','Al estar sentados frente a nuestro computador y escribir un texto cualquiera, esta informacion viaja a traves del puerto PS2 del teclado (periferico de entrada), y se envia a traves de un CHIP llamado puente sur al Procesador.La informacion viaja por unos BUSES (o caminos) a traves de la TARJETA MADRE intercomunicando todos los dispositivos.Luego esta informacion se encuentra con un CHIP llamado PUENTE NORTE, el cual sirve de conexión entre la PLACA MADRE y los principales componentes de la PC: microprocesador, memoria RAM y tarjeta de vídeo AGP o PCI Express.En la memoria RAM o memoria principal se almacenan los datos temporalmente para luego ser procesados por el Microprocesador.La informacion llega al Microprocesador quien se ancarga de procesarla y enviarla de regreso al CHIP Puente Norte para ser retransmitida al dispositivo de video.', 2),
('Mantenimiento de la PC: identificando las fallas de acuerdo a la etapa en que se manifiesten 2da Parte.','https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2018/01/283105-pc-no-funciona-problemas-soluciones.jpg?itok=RvXcbuKL','sugerencias','60','2021-07-06','computadora de acuerdo a la etapa en que se presenten, ya que el observar el momento en que se presenta el problema es fundamental para poder detectarlo y resolverlo de manera efectiva.En el primer articulo hablamos de la clasificación de las fallas de acuerdo a su comportamiento, y determinamos que existen fallas que se clasifican como evidentes, sistemáticas y aleatorias, y profundizamos un poco en cada uno de ellos, a continuación avanzaremos en esta temática hablando de la importancia de aprender a establecer la falla  de a cuerdo a su etapa de manifestación.', 2),
('Mantenimiento de la PC: identificando las fallas de acuerdo a la etapa en que se manifiesten.','https://reparaciondecomputadoras9.files.wordpress.com/2010/10/fc3c5_1.jpg','informativa','50','2021-05-10',' clasificación de las fallas de acuerdo a su comportamiento, entonces  podremos decir que existen fallas que se clasifican como evidentes, ya que se manifiestan a simple vista, un ejemplo es cuando una PC no enciende ni da “señales de Vida”. Pero también existen las fallas sistemáticas son aquellas que se repiten siempre en el mismo punto de un proceso determinado, por ejemplo cuando al ejecutar una aplicación o programa especifico la PC siempre se queda en su rendimiento normal, no importa cuantas veces hagamos lo mismo. Y por ultimo están las fallas aleatorias es cuando tenemos que la falla se presenta de manera cambiante, es decir no se produce bajo alguna circunstancia especifica, se da en cualquier etapa del proceso de funcionamiento de la computadora: al encenderse, cargar el sistema operativo o simplemente cargar alguna aplicación o programa, generalmente estas fallas se generan por excesos de temperatura o contactos flojos en el cable de datos o de alimentación de energía.', 2);

/*metodo pago*/
  INSERT INTO metodo_pago (nombre) VALUES
('efectivo'),
('tarjeta'),
('transaccion');

 
 /*categoria*/
 INSERT INTO categoria (categoria) VALUES
('accesorios'),
('limpieza'),
('refacciones');

/*productos*/
ALTER TABLE productos AUTO_INCREMENT = 1;
INSERT INTO productos (id_producto, nombre, descripcion, stock, precio_unitario, categoria, imagen) VALUES
(1, 'Disco Duro Interno 1TB WD', 'Disco Duro Interno 1TB 3.5 SATA3 7200RPM Nuevo WD WD10EZEX', 66, 849, 3, "https://http2.mlstatic.com/D_NQ_NP_739774-MLM41788845340_052020-O.webp"),
(2, 'Unidad de estado solido SSD 120GB', 'Unidad de estado solido SSD 120GB 2.5\" SATA3 Kingston A400 / SA400S37/120G', 30, 549, 3, "https://http2.mlstatic.com/D_NQ_NP_833395-MLM31224929502_062019-O.webp"),
(3, 'Aire Comprimido Silimex', 'Aire comprimido Silimex / Teclados y electronicos / Circuitos mecánicos 660Ml', 85, 125.76, 2, "https://http2.mlstatic.com/D_NQ_NP_914353-MLM31216115369_062019-O.webp"),
(4, 'Liquido Limpiador Perfect Choice', 'Liquido Limpiador Alcohol Isopropilico / Para electronicos / PC-033066', 10, 69, 2, "https://http2.mlstatic.com/D_NQ_NP_918964-MLM42771888404_072020-O.webp"),
(5, 'Toallitas Limpiadoras Perfect Choice', 'Toallitas Limpiadoras Perfect Choice / Ideal para pantallas', 8, 49, 2, "https://http2.mlstatic.com/D_NQ_NP_928971-MLM43365407259_092020-O.webp"),
(6, 'Mouse Gamer Logitech G203 Lightsync Black', 'Mouse Gamer Logitech G203 Lightsync Black / Optico / USB / 8000DPI / Led RGB/', 300, 429, 2, "https://http2.mlstatic.com/D_NQ_NP_722445-CBT44513294794_012021-O.webp"),
(7, 'Mouse Gamer Yaguaret Mantis', 'Mouse Gamer Yaguaret Mantis / Optico / USB / 6400DPI / Led RGB/ GMMANTISYGT / 7 Botones', 288, 299.99, 2, "https://http2.mlstatic.com/D_NQ_NP_993397-MLM46197817671_052021-O.webp"),
(8, 'Teclado Mecanico Gamer Naceb Black Cobra RGB', 'Teclado Mecanico Gamer Naceb Black Cobra RGB / USB / NA-0944 / Switch Red / Antighosting / Reposamuñecas desmontable', 26, 399, 2, "https://www.cyberpuerta.mx/img/product/M/CP-NACEBTECHNOLOGY-NA-0944-1.jpg"),
(9, 'Teclado Gamer Naceb', 'Teclado Gamer Naceb NA-0912 Retroiluminado / Antighosting / Efecto rainbow', 205, 219, 2, "https://http2.mlstatic.com/D_NQ_NP_888405-MLA32838362515_112019-O.webp"),
(10, 'Memoria RAM Kingston HyperX DDR3', 'Memoria RAM Kingston HyperX 4GB 1x4GB DDR3L 1866Mhz / Sodimm HX318LS11IB/4/ para Laptop', 12, 518.18, 3, "https://www.cyberpuerta.mx/img/product/M/CP-HYPERX-HX316C10FB8-1.jpg"),
(11, 'Memoria RAM DDR4', 'Memoria RAM DDR4 4GB 2666MHz Kingston HyperX Fury 1 Modulo Negro HX426C16FB3/4', 38, 549, 3, "https://www.cyberpuerta.mx/img/product/M/CP-HYPERX-HX426S15IB28-1.jpg"),
(12, 'Memoria RAM DDR3', 'Memoria RAM DDR3 4GB 1333MHz Kingston Value 1 Modulo / KVR13N9S8/4', 52, 779, 3, "https://http2.mlstatic.com/D_NQ_NP_660596-MLM27515283034_062018-O.webp"),
(13, 'Pasta Termica Cooler Master', 'Pasta Termica Cooler Master MasterGel Pro V2 / MGY-ZOSG-N15M-R3', 235, 299.99, 2, "https://http2.mlstatic.com/D_NQ_NP_616335-MLA47011573086_082021-O.webp"),
(14, 'Fuente de poder 400W EVGA', 'Fuente de poder 400W EVGA Continuous Power Active PFC 75%Ef. / 100-N1-0400-L1', 158, 650.99, 3, "https://www.cyberpuerta.mx/img/product/M/CP-EVGA-100-N1-0400-L1-1.jpg"),
(15, 'Fuente de poder Getttech', 'Fuente de poder Getttech 500W - FG500WBX', 250, 259, 3, "https://http2.mlstatic.com/D_NQ_NP_995839-MLM31954936113_082019-O.webp"),
(16, 'Disipador para CPU Disipador y Ventilador para Procesador', 'Disipador para CPU Disipador y Ventilador para Procesador Thermaltake Contact Silent 12 - 120mm X1 Intel y AMD', 64, 619.66, 3, "https://http2.mlstatic.com/D_NQ_NP_921910-MLM41818863027_052020-O.webp"),
(17, 'Disipador y Ventilador para Procesador', 'Disipador y Ventilador para Procesador Cooler Master Hyper T4 - 120mm X1 Intel y AMD', 55, 300.5, 3, "https://images-na.ssl-images-amazon.com/images/I/41YKdTd0DJL._SX342_SY445_QL70_ML2_.jpg"),
(18, 'Tarjeta Madre Asus', 'Tarjeta Madre Asus PRIME A320M-K Socket AM4 AMD A320 Micro ATX / DDR4', 190, 1379.55, 3, "https://http2.mlstatic.com/D_NQ_NP_808159-MLM46366412591_062021-O.webp"),
(19, 'Tarjeta Madre Intel', 'Tarjeta Madre MSI H310M PRO-VDH PLUS Socket 1151-v2 Intel H310 Micro-ATX', 10, 1299.99, 3, "https://www.cyberpuerta.mx/img/product/M/CP-MSI-7C08-001R-1.jpg"),
(20, 'Tarjeta de video NVIDIA', 'Tarjeta de video NVIDIA GeForce GT 1030 2GB GDDR4 / Gigabyte / HDMI, DVI / GV-N1030D4-2GL', 20, 2499, 3, "https://http2.mlstatic.com/D_NQ_NP_715775-MLA46302132979_062021-O.webp");

/*carrito*/
insert into
  carrito(cliente,producto, cantidad)
VALUES
  (9, 1, 1),
  (20, 1, 2),
  (15, 2, 3),
  (3, 3, 4),
  (16, 11, 11),
  (10, 12, 12),
  (6, 13, 13),
  (7, 14, 14),
  (11, 15, 15),
  (8, 16, 16),
  (12, 14, 17),
  (21, 12, 18),
  (24, 7, 19),
  (19, 3, 20);

 /*orden_compra*/
ALTER TABLE orden_compra AUTO_INCREMENT = 1;
insert into orden_compra(folio,cliente,metodoPago,total,domicilio,fecha_pedido)
values
  (1000,14, 1, 1698, 1, '2021-03-12'),
  (1001,20, 2, 1647, 2, '2021-03-14'),
  (1002,3, 3, '377.28', 3, '2021-03-19'),
  (1003,4, 3, '628.8', 4, '2021-03-24'),
  (1004,5, 2, 2394, 5, '2019-03-29'),
  (1005,6, 1, 17493, 6, '2021-04-3'),
  (1006,7, 2, '9113.86', 7, '2021-04-07'),
  (1007,8, 3, '9914.56', 8, '2021-04-11'),
  (1008,9, 1, 849, 9, '2021-04-20');
  
  /*Actualizacion logica de los registros*/
  UPDATE orden_compra SET orden_compra.domicilio='12' WHERE orden_compra.id_orden='1';
UPDATE orden_compra SET orden_compra.domicilio='18' WHERE orden_compra.id_orden='2';
UPDATE orden_compra SET orden_compra.domicilio='1'WHERE orden_compra.id_orden='3';
UPDATE orden_compra SET orden_compra.domicilio='2' WHERE orden_compra.id_orden='4';
UPDATE orden_compra SET orden_compra.domicilio='3' WHERE orden_compra.id_orden='5';
UPDATE orden_compra SET orden_compra.domicilio='4' WHERE orden_compra.id_orden='6';
UPDATE orden_compra SET orden_compra.domicilio='5' WHERE orden_compra.id_orden='7';
UPDATE orden_compra SET orden_compra.domicilio='6' WHERE orden_compra.id_orden='8';
UPDATE orden_compra SET orden_compra.domicilio='7' WHERE orden_compra.id_orden='9';

 /*orden_detalle*/
insert into
  orden_detalle(orden,producto, cantidad, precio)
VALUES
  (1, 1, 2, 849),
  (2, 2, 3, 549),
  (3, 3, 1, '125.76'),
  (4, 3, 1, '125.76'),
  (5, 8, 3, 399),
  (6, 20, 2, 2499),
  (7, 14, 4,'650.99'),
  (8, 16, 3, '619.66'),
  (9, 1, 1, 849);
  
  
  