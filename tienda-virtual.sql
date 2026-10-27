CREATE DATABASE tienda_virtual;
USE tienda_virtual;

CREATE TABLE usuarios(
id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
nombre_usuario VARCHAR(100) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
telefono_usuario VARCHAR(10) NOT NULL,
tipo_usuario VARCHAR(20) NOT NULL,
fecha_registro DATE NOT NULL
);

CREATE TABLE categorias(
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(20)
);

CREATE TABLE ordenes(
id_orden INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT NOT NULL,
fecha_orden DATE NOT NULL,
estado_orden VARCHAR(20) NOT NULL,
total_orden INT NOT NULL,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
id_vendedor INT NOT NULL,
id_categoria INT NOT NULL,
nombre_producto VARCHAR(100) NOT NULL,
precio INT NOT NULL,
stock INT NOT NULL,
fecha_publicacion DATE NOT NULL,

FOREIGN KEY (id_vendedor) REFERENCES usuarios(id_usuario),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE detalle_orden(
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_orden INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario INT NOT NULL,

FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pagos(
id_pago INT AUTO_INCREMENT PRIMARY KEY,
id_orden INT NOT NULL,
metodo_pago VARCHAR(50),
monto INT NOT NULL,
fecha_pago DATE NOT NULL,
estado_pago VARCHAR(20),

FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
);

INSERT INTO usuarios(nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, fecha_registro) VALUES
('pedro sanchez','pepesanchez@gmail.com','3187293401','comprador','2026-01-07'),
('carlos perez','carlosperez@gmail.com','3128374659','vendedor','2026-01-22'),
('david gonzalez','davidgonzalez@gmail.com','3128762534','vendedor','2025-08-06'),
('daniela romero','danielaromero@gmail.com','3127394859','comprador','2026-02-17'),
('alejandra montero','alejandramontero@gmail.com','3128376230','comprador','2025-12-15'),
('luis suarez','luissuarezlasd9@gmail.com','3128764021','vendedor','2025-07-09'),
('jose mourinho','thespecialone@gmail.com','3128736402','comprador','2025-11-11'),
('danna lopez','dannalopez@gmail.com','3128930234','vendedor','2026-01-29'),
('alvaro montero','alvaromontero@gmail.com','3128034523','comprador','2026-04-20'),
('daniel ruiz','danielruiz@gmail.com','3128734012','comprador','2026-01-13');
SELECT*FROM usuarios;

INSERT INTO categorias(nombre_categoria) VALUES
('tecnologia'),
('hogar'),
('deportes'),
('accesorios'),
('calzado'),
('decoracion'),
('ropa deportiva'),
('audio y electronica'),
('cocina'),
('deportes de combate');
SELECT*FROM categorias;

INSERT INTO ordenes(id_usuario, fecha_orden, estado_orden, total_orden) VALUES
('1','2026-06-24','entregado','850000'),
('8','2026-09-15','pendiente','120000'),
('7','2026-05-21','entregado','75000'),
('2','2026-09-08','pendiente','210000'),
('6','2026-07-07','enviado','1200000'),
('8','2026-08-26','entregado','95000'),
('5','2026-07-22','entregado','980000'),
('9','2026-08-31','pendiente','45000'),
('10','2026-09-01','enviado','35000'),
('4','2026-09-02' ,'enviado','78000');
SELECT*FROM ordenes;

ALTER TABLE pagos MODIFY fecha_pago DATE NULL;

INSERT INTO productos (id_vendedor, id_categoria, nombre_producto, precio, stock, fecha_publicacion) VALUES
(2,1,'celular samsung',850000,15,'2026-01-05'),
(3,2,'lampara de mesa',95000,20,'2025-06-20'),
(6,3,'balon de futbol',50000,50,'2026-04-22'),
(8,4,'cargador usb-c',30000,100,'2026-05-28'),
(2,5,'camiseta nike',75000,60,'2026-04-21'),
(3,6,'audifonos bluetooth',120000,40,'2026-01-22'),
(6,7,'gorra deportiva',35000,80,'2026-05-19'),
(8,8,'espejo decorativo',80000,10,'2025-12-31'),
(2,9,'guantes de boxeo',90000,22,'2025-10-02'),
(3,10,'juego de cuchillos',95000,30,'2026-01-20');
SELECT*FROM productos;

INSERT INTO detalle_orden (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1,1,1,850000),
(2,2,2,120000),
(3,3,3,75000),
(4,4,4,210000),
(5,5,5,1200000),
(6,6,6,95000),
(7,7,7,65000),
(8,8,8,45000),
(9,9,9,310000),
(10,10,10,320000);
SELECT*FROM detalle_orden;

INSERT INTO pagos (id_orden, metodo_pago, monto, fecha_pago, estado_pago) VALUES
(1,'tarjeta_credito',850000,'2026-06-24','aprobado'),
(2,'pse',0,NULL,'pendiente'),
(3,'tarjeta_debito',75000,'2026-05-21','aprobado'),
(4,'pse',0,NULL,'pendiente'),
(5,'tarjeta_credito',1200000,'2026-07-07','aprobado'),
(6,'pse',95000,'2026-08-26','aprobado'),
(7,'tarjeta_debito',980000,'2026-07-22','aprobado'),
(8,'tarjeta_credito',0,NULL,'pendiente'),
(9,'tarjeta_credito',35000,'2026-09-01','aprobado'),
(10,'pse',78000,'2026-09-02','aprobado');
SELECT*FROM pagos;