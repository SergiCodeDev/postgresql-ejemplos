-- Crear base de datos
CREATE DATABASE ejemplos;

-- PostgreSQL
CREATE DATABASE ejemplos
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Eliminar base de datos (desde otra base de datos)
DROP DATABASE IF EXISTS "ejemplos";

-- Crear una tabla 
CREATE TABLE personas (
    -- nombre_columna | entero | no puede ser nulo
	id_persona INT NOT NULL,
    -- Tipo de dato string(texto) con un máximo de 30 caracteres con tamaño variable
	nombre VARCHAR(30),
	apellido VARCHAR(40)
);

-- Añadir datos a la tabla personas
INSERT INTO personas VALUES ('1', 'Jose', 'Pons');
INSERT INTO personas VALUES (2, 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre, apellido) VALUES (3, 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre) VALUES ('4', 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre) VALUES (5, 'Jose');
INSERT INTO personas (id_persona, apellido) VALUES (6, 'Milan');

-- Consultar los datos
SELECT * FROM personas;
-- Con maximo de 3
SELECT * FROM personas
LIMIT 3;

-- Actualizar un dato
-- En este caso de personas actualizamos el apellido de todos los de la tabla
UPDATE personas SET apellido = 'Pons';

-- De persona actualiza
UPDATE personas
-- El apellido
SET apellido = 'Mila'
-- Donde id_persona sea 1
WHERE id_persona = '1';

UPDATE personas
SET nombre = 'Sergi'
WHERE nombre IS NULL;

UPDATE personas
SET 
    nombre = 'Sam',
    apellido = 'Funi'
WHERE id_persona = '1';

-- Borrar tabla personas
DROP TABLE personas;



-- Tipos de Datos en PostgreSQL

-- Tipos de Datos Numéricos
-- Enteros con signo (pueden ser negativos)
-- INT o INTEGER: Entero de 4 bytes
-- BIGINT: Entero de 8 bytes
-- SMALLINT: Entero de 2 bytes
-- SERIAL: Entero autoincrementable (equivalente a INT)
-- BIGSERIAL: Entero autoincrementable (equivalente a BIGINT)
-- SMALLSERIAL: Entero autoincrementable (equivalente a SMALLINT)
-- DECIMAL o NUMERIC: Número con precisión exacta, especificar número de dígitos
-- FLOAT o REAL: Número en punto flotante de 4 bytes
-- DOUBLE PRECISION: Número en punto flotante de 8 bytes
-- MONEY: Tipo para representar valores monetarios con precisión

-- Ejemplos
-- id_persona INT NOT NULL; -- Entero de 4 bytes
-- saldo DECIMAL(10,2); -- Número con hasta 10 dígitos, 2 después del punto decimal
-- costo MONEY; -- Valor monetario con precisión

-- Tipos de Datos de Texto
-- VARCHAR(n): Cadena de texto con un máximo de n caracteres
-- CHAR(n) o CHARACTER(n): Cadena de texto de longitud fija de n caracteres
-- TEXT: Cadena de texto de longitud variable, sin límite explícito
-- BYTEA: Datos binarios (blob)

-- Ejemplos
-- nombre VARCHAR(50); -- Cadena con un máximo de 50 caracteres
-- codigo CHAR(10); -- Cadena de longitud fija de 10 caracteres
-- descripcion TEXT; -- Cadena de texto sin límite específico
-- archivo BYTEA; -- Datos binarios

-- Tipos de Datos de Fecha y Hora
-- DATE: Fecha (año, mes, día)
-- TIME: Hora (hora, minuto, segundo)
-- TIMESTAMP: Fecha y hora (año, mes, día, hora, minuto, segundo)
-- TIMESTAMPTZ: Fecha y hora con zona horaria
-- INTERVAL: Intervalo de tiempo

-- Ejemplos
-- fecha_nacimiento DATE; -- Fecha de nacimiento
-- hora_entrada TIME; -- Hora de entrada
-- fecha_registro TIMESTAMP; -- Fecha y hora de registro
-- fecha_registro_tz TIMESTAMPTZ; -- Fecha y hora con zona horaria
-- duracion INTERVAL; -- Duración de un evento

-- Tipos de Datos Booleanos
-- BOOLEAN: Representa valores lógicos TRUE o FALSE

-- Ejemplo
-- activo BOOLEAN; -- Indica si algo está activo o no

-- Tipos de Datos de Identificador
-- UUID: Identificador único universal

-- Ejemplo
-- uuid_usuario UUID; -- Identificador único de usuario

-- Tipos de Datos de Red
-- CIDR: Dirección de red
-- INET: Dirección IP (IPv4 o IPv6)
-- MACADDR: Dirección MAC

-- Ejemplos
-- red_subnet CIDR; -- Dirección de red
-- ip_cliente INET; -- Dirección IP del cliente
-- direccion_mac MACADDR; -- Dirección MAC de un dispositivo

-- Tipos de Datos de Enumeración
-- ENUM: Tipo de datos que permite definir un conjunto de valores posibles

-- Ejemplo
-- CREATE TYPE estado_pedido AS ENUM ('pendiente', 'enviado', 'entregado');
-- estado_estado estado_pedido; -- Estado del pedido usando enumeración

-- Tipos de Datos de Array
-- ARRAY: Permite almacenar una colección de valores del mismo tipo

-- Ejemplo
-- etiquetas TEXT[]; -- Array de cadenas de texto

-- Tipos de Datos Geoespaciales (requiere extensión PostGIS)
-- POINT: Coordenada de punto en un sistema de referencia cartesiano
-- LINESTRING: Línea compuesta por una secuencia de puntos
-- POLYGON: Área definida por una serie de puntos que forman un polígono

-- Ejemplos (requiere PostGIS)
-- ubicacion POINT; -- Ubicación en coordenadas
-- trayectoria LINESTRING; -- Trayectoria en línea
-- zona POLYGON; -- Zona geográfica

-- Tipos de Datos JSON
-- JSON: Datos en formato JSON (JavaScript Object Notation)
-- JSONB: Datos en formato JSON binario (más eficiente para consultas)

-- Ejemplos
-- datos JSON; -- Datos en formato JSON
-- datos_jsonb JSONB; -- Datos en formato JSON binario

-- Tipos de Datos XML
-- XML: Datos en formato XML (eXtensible Markup Language)

-- Ejemplo
-- documento XML; -- Datos en formato XML

-- Todos los tipos en https://www.postgresql.org/docs/16/datatype.html



-- Renombrar nombre de una columna de una tabla
ALTER TABLE nombre_tabla RENAME COLUMN nombre_columna_actual TO nuevo_nombre_columna;

-- Traerse todas las columnas de una tabla
SELECT * FROM personas;

-- Selecionar nombre, apellido en una sola columna AS renombra la columna para que no tenga un nombre por defecto DESDE personas
SELECT (nombre, apellido) AS "Nombre Completo" FROM personas;

-- SELECIONAR nombre, apellido en dos columnas separadas DESDE la tabla personas
SELECT nombre, apellido FROM personas;

-- SELECIONAR de la columna nombre
SELECT nombre
-- DESDE la tabla personas
FROM personas
-- DONDE la id_persona sea igual a 3
WHERE id_persona = '3';

SELECT *
FROM personas
-- != no sea igual
WHERE nombre != 'Jose';

SELECT *
FROM personas
-- id_persona mayor que 2
WHERE id_persona > '2';

-- = , != , > , < , >= , <=

SELECT *
FROM personas
-- Se debe cumplir la primera condición Y la segunda
WHERE id_persona > '2' AND nombre = 'Sergi';

-- ELIMINAR DESDE la tabla personas
DELETE FROM personas
-- DONDE nombre sea Jose
WHERE nombre = 'Jose';


-- COMENTARIO

/* 
    COMENTARIO
    COMENTARIO
    COMENTARIO
    COMENTARIO
    COMENTARIO 
*/

-- ALTERA la TABLA personas
ALTER TABLE personas
-- AÑADIENDO una COLUMNA test con el tipo VARCHAR(20)
ADD COLUMN test VARCHAR(20);

ALTER TABLE personas
-- RENOMBRAR COLUMNA test(nombre actual) A test2
RENAME COLUMN test TO test2;

ALTER TABLE personas
-- ELIMINAR COLUMNA con el nombre
DROP COLUMN test2;

-- ACTUALIZAR tabla persona COLOCAR en la columna test el campo JS
UPDATE personas SET test = 'JS';

-- Ahora podemos hacer que la columna test no tenga valores nulos
ALTER TABLE personas
-- ALTERAR COLUMNA test PONER que NO pueda tener valores NULOS
ALTER COLUMN test SET NOT NULL;

ALTER TABLE personas
-- QUITAR el NOT NULL
ALTER COLUMN test DROP NOT NULL;

ALTER TABLE personas
-- cambiar tipo de DATO de la columna test
ALTER COLUMN test TYPE VARCHAR(50); -- CUIDADO!!! CON LO QUE QUIERAS CONVERTIR O CAMBIAR

/* 
CREATE TABLE personas (
    id_persona SERIAL PRIMARY KEY,-- ID INCREMENTAL + PRIMARY KEY
); 
*/

ALTER TABLE personas
--AÑADIR CLAVE PRIMARIA a id_persona
ADD PRIMARY KEY (id_persona);

-- PRIMARY KEY llave unica que no puede ser nula

CREATE TABLE test (
	-- id SERIAL PRIMARY KEY NOT NULL, -- NOT NULL no aria falta ponerlo en PRIMARY KEY porque lo hace por defecto 
	-- SERIAL 1, 2, 3, 4
    id SERIAL PRIMARY KEY,
	nombre VARCHAR(20),
	telefono VARCHAR(10)	
);

-- SMALLSERIAL
-- Tipo de Datos: SMALLINT.
-- Rango: De -32,768 a 32,767.

-- SERIAL
-- Tipo de Datos: INTEGER.
-- Rango: De -2,147,483,648 a 2,147,483,647

-- BIGSERIAL
-- Tipo de Datos: BIGINT.
-- Rango: De -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807.

SELECT * FROM test;

INSERT INTO test (nombre, telefono) VALUES ('Sam','666666666');

-- ELIMINA todos los datos de test
DELETE FROM test; -- Elimina fila por fila registrando cada operación y activando triggers

-- ELIMINA la TABLA test por completo
DROP TABLE test;

-- Elimina todos los datos rápidamente sin registrar cada eliminación ni activar triggers
TRUNCATE TABLE test; -- En MySQL seria como TRUNCATE TABLE test RESTART IDENTITY;

-- Elimina los registros y reinicia los contadores de las columnas con auto-incremento
TRUNCATE TABLE test RESTART IDENTITY;

CREATE TABLE test (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
    -- DEFAULT = VALOR POR DEFECTO es 'Desconocido'
	telefono VARCHAR(20) DEFAULT 'Desconocido'
);

-- SELECIONAR nombre, salario, nueva columna solo para optener los datos (no se crea la columna en la base de datos) 
-- (salario + 500) RENOMBRAR A bono DESDE empleados
SELECT nombre, salario, (salario + 500) AS bono FROM empleado

-- ACTUALIZAR empleados
UPDATE empleados
-- CAMBIAR slario a salario + 500
SET slario = salario + 500
-- DONDE nombre sea igual a Sam
WHERE nombre = 'Sam';

-- SELECIONAR *(TODOS) DESDE personas ORDENAR POR nombre 
SELECT * FROM personas ORDER BY nombre;

-- ASC = ASCENDENTE, que ya era la manera predeterminada y no haria falta ponerlo
SELECT * FROM personas ORDER BY nombre ASC;

-- DESC odenar por nombre DESCENDENTE
SELECT * FROM personas ORDER BY nombre DESC;

-- SELECIONAR TODOS DESDE personas ORDENAR POR la segunda columna que tenga la tabla en este caso seria nombre
SELECT * FROM personas ORDER BY 2;

-- ORDENAR por nombre ASCENDENTE y después por id_persona DESCENDENTE
-- ORDER BY nombre ASC: Ordena los resultados primero por el campo nombre en orden ascendente (de la A a la Z).
-- id_persona DESC: Luego, para los registros que tienen el mismo valor en el campo nombre,
-- los ordena por el campo id_persona en orden descendente (del valor más alto al más bajo).
SELECT * FROM personas ORDER BY nombre ASC, id_persona DESC;

-- SELECIONAR TODOS
SELECT * 
-- DESDE la tabla personas
FROM personas
-- DONDE nombre TENGA una a y en su izquierda y derecha pueda tener más texto o no, tiene en cuenta las a A á Á à À
WHERE nombre LIKE '%a%'; -- texto? a texto? 

SELECT * 
FROM personas
WHERE nombre LIKE 'S%'; -- S texto? , Sam Stexto?

SELECT * 
FROM personas
WHERE nombre LIKE '%m'; -- texto? m, 

SELECT * 
FROM personas
WHERE apellido LIKE '%n_'; -- texto? n 1caracter

SELECT * 
FROM personas
WHERE apellido LIKE '%__n_'; -- texto? 1caracter 1caracter n 1caracter

-- % = puede tener todo el texto atras o delante (caracteres del tipo que sea)
-- _ = tiene que tener 1 caracter, simbolo, numero... obligatorio en esa posición

SELECT * 
FROM personas
WHERE apellidos LIKE '%__n_%io';

SELECT * 
FROM tabla
-- que se cumplan las dos
WHERE descripcion LIKE '%manzana%' 
  AND descripcion LIKE '%rojo%';

-- ILIKE (insensible a mayúsculas y minúsculas)
SELECT * 
FROM tabla 
WHERE columna ILIKE '%texto%';

-- SIMILAR TO (Patrones con expresiones regulares simples)
SELECT * 
FROM tabla 
WHERE columna SIMILAR TO 'a[0-9]+b';

-- POSIX Expresiones Regulares (Usando ~, ~*, !~, !~*)
SELECT * 
FROM tabla 
-- ~: Coincidencia de expresión regular que distingue entre mayúsculas y minúsculas.
-- WHERE columna ~ 'patron';
-- ~*: Coincidencia de expresión regular que no distingue entre mayúsculas y minúsculas.
-- WHERE columna ~* 'patron';
-- !~: Verifica que no coincida la expresión regular (distingue mayúsculas/minúsculas).
-- WHERE columna !~ 'patron';
-- !~*: Verifica que no coincida la expresión regular (no distingue entre mayúsculas/minúsculas).
WHERE columna !~* 'patron';

-- Contar el numero de filas o registros de una tabla
SELECT COUNT(*) FROM personas;

SELECT COUNT(nombre) FROM personas;

-- SELECIONAR nombre para CONTAR
SELECT COUNT(nombre) -- Contar el número de registros en la tabla personas
-- DESDE personas
FROM personas
-- DONDE nombre TENGA en algun lugar la a
WHERE nombre LIKE '%a%';