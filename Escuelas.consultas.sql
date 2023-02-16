USE sakila;
CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_escuela` int(11) DEFAULT NULL,
  `legajo` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `nota` decimal(10,0) DEFAULT NULL,
  `grado` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_escuela`) REFERENCES `escuelas`(`id`)
);

INSERT INTO escuelas VALUES
(1, 'Normal 1', 'Quilmes', 'Buenos Aires', 250),
(2, 'Gral. San Martín','San Salvador', 'Jujuy', 100),
(3, 'Belgrano', 'Belgrano','Córdoba', 150),
(4, 'EET Nro 2', 'Avellaneda', 'Buenos Aires', 500),
(5, 'Esc.Nro 2 Tomás Santa Coloma', 'Capital Federal', 'Buenos Aires', 250);

INSERT INTO alumnos VALUES
(NULL,2,1000,'Ramón Mesa',8,1,'rmesa@rmail.com'),
(NULL,2,1002,'Tamara Smith',8,1,''),
(NULL,1,101,'Juan Pérez', 10,3,''),
(NULL,1,105,'Pedro González',9,3,''),
(NULL, 5,190, 'Roberto Luis Sánchez',8,3,'robertoluissanchez@rumail.com'),
(NULL, 4,106, 'Martina Bossio', NULL,3,''),
(NULL, 4,100, 'Jaime Jaramillo',3,1,'jj2021@pirimail.com'),
(NULL, 4, 1234,'Susana Gómez',6,2,'');

SELECT * FROM alumnos;
SELECT * FROM escuelas;
SELECT legajo, nombre FROM alumnos;
SELECT * FROM alumnos WHERE nota >= 7;
SELECT id, nombre FROM escuelas WHERE capacidad < 200;
SELECT nombre, nota FROM alumnos WHERE nota BETWEEN 8 AND 10;
SELECT nombre, localidad, provincia FROM escuelas WHERE provincia =  "Buenos Aires" OR provincia = "Jujuy";
SELECT * FROM alumnos WHERE nombre = "Pedro González";
SELECT * FROM alumnos WHERE nombre LIKE "Pedro González";
SELECT * FROM alumnos WHERE NOT nombre = "Pedro González";
SELECT * FROM alumnos WHERE nombre NOT LIKE "Pedro González";
SELECT * FROM alumnos WHERE nombre LIKE"R%";
SELECT * FROM alumnos WHERE nombre LIKE "%a";
SELECT * FROM alumnos WHERE nombre LIKE "%z";
SELECT * FROM alumnos WHERE nombre LIKE "%m%";
SELECT alumnos.legajo, alumnos.nombre, escuelas.nombre FROM alumnos INNER JOIN escuelas ON alumnos.id_escuela = escuelas.id;
SELECT alumnos.legajo AS "Nro.Legajo" , alumnos.nombre AS "Nombre y Apellido" , escuelas.nombre AS "Nombre de Escuela" FROM alumnos INNER JOIN escuelas ON alumnos.id_escuela = escuelas.id;
SELECT alumnos.nombre AS "Nombre y Apellido", escuelas.nombre AS "Nombre de Escuela" FROM alumnos LEFT JOIN escuelas ON alumnos.id_escuela = escuelas.id;
SELECT escuelas.nombre AS "Nombre de Escuela", alumnos.nombre AS "Nombre y Apellido" FROM escuelas LEFT JOIN alumnos ON escuelas.id = alumnos.id_escuela;
SELECT alumnos.nombre AS "Nombre y Apellido", escuelas.nombre AS "Escuela" FROM alumnos RIGHT JOIN escuelas ON alumnos.id_escuela = escuelas.id;
SELECT alumnos.nombre AS "Nombre y Apellido", escuelas.* FROM alumnos RIGHT JOIN escuelas ON alumnos.id_escuela = escuelas.id;
SELECT * FROM alumnos WHERE nota IS NOT NULL;
SELECT * FROM alumnos WHERE nota IS NULL;
ALTER TABLE escuelas ADD COLUMN partido VARCHAR(20) DEFAULT " " AFTER localidad;
ALTER TABLE escuelas DROP COLUMN partido;
SELECT * FROM escuelas;
CREATE TABLE alumnos_2 AS SELECT id, id_escuela, legajo, nombre, nota, grado, email FROM alumnos;
SELECT * FROM alumnos_2;
SELECT * FROM alumnos;
SHOW COLUMNS FROM alumnos;
SELECT * FROM escuelas ORDER BY capacidad DESC LIMIT 3;
SELECT COUNT(id) AS "Cantidad de alumnos" FROM alumnos;
SELECT COUNT(id) AS "Cantidad de alumnos" FROM alumnos WHERE nota < 7;
SELECT SUM(capacidad) AS "Capacidad total de Escuelas de Buenos Aires" FROM escuelas WHERE provincia = "Buenos Aires";
SELECT SUM(capacidad) AS "Capacidad total de Escuelas de Córdoba y Jujuy" FROM escuelas WHERE provincia = "Córdoba" OR provincia = "Jujuy";
SELECT SUM(capacidad) AS "Capacidad total" FROM escuelas WHERE provincia IN ("Córdoba","Jujuy","Buenos Aires");
SELECT AVG(nota) AS "Promedio de nota de alumnos aprobados con más de 7" FROM alumnos WHERE nota > 7;
SELECT MAX(capacidad) AS "Capacidad máxima", MIN(capacidad) AS "Capacidad mínima" FROM escuelas;
SELECT provincia, SUM(capacidad) AS "Suma de Capacidad" FROM escuelas GROUP BY provincia ORDER BY capacidad;
SELECT grado, COUNT(id) AS "Cantidad de alumnos" FROM alumnos GROUP BY grado ORDER BY grado;
SELECT grado, COUNT(grado) AS "Cantidad de alumnos" FROM alumnos GROUP BY grado ORDER BY grado;
SELECT * FROM alumnos;