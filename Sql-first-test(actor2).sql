USE sakila;
CREATE TABLE actor2 ( actor_id INTEGER PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL); 
DESCRIBE actor2;
INSERT INTO actor2 VALUE (1, "PENELOPE", "GUINESS", "olavarria", "D", "F");
INSERT INTO actor2 VALUE (2, "NICK", "WHALBERG");
INSERT INTO actor2 VALUE (3, "GUIDO", "RONALDO");
ALTER TABLE actor2 ADD localidad VARCHAR(50);
ALTER TABLE actor2 ADD Sexo VARCHAR(50);
ALTER TABLE actor2 ADD Razon VARCHAR(50);
INSERT INTO actor2 VALUE (4, "Hola", "Chau", "olavarria", "S", "e");
INSERT INTO actor2 VALUE (5,"" ,"" , "gAD","" ,"");
UPDATE actor2 SET first_name = "PENELOPE G" WHERE actor_id=1;
DELETE FROM actor2 WHERE actor_id = 2;
INSERT INTO actor2 VALUE (2, "NICK", "WHELBERG", "LA PLATA", "M", "De");
SELECT * FROM actor2;
SELECT first_name, last_name FROM actor2;
SELECT first_name FROM actor2 WHERE NOT last_name= "GUINESS";
SELECT COUNT(DISTINCT first_name) FROM actor2;