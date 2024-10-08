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

-- SUMAR toda la columna de salarios DE LA tabla empleados
SELECT SUM(salario) FROM empleados;

SELECT SUM(salario) 
FROM empleados
WHERE nombre LIKE '%a%';

-- muestra el salario mas bajo de todos
SELECT MIN(salario) FROM empleados;

-- muestra el salario mas alto de todos
SELECT MAX(salario) FROM empleados;

-- SELECIONAR nombre, MAXIMO(salario)
SELECT nombre, MAX(salario)
-- DESDE empleados
FROM empleados
-- AGRUPAR POR nombre (ej Sam 3000, Sam 1500 de todos los Sam 
-- coje el que tenga mayor salario los demas no aparecen si el nombre es igual)
GROUP BY nombre;

-- AVG es promedio de todos los salarios
SELECT AVG(salario)
FROM empleados;

SELECT nombre, AVG(salario)
FROM empleados
GROUP BY nombre;

-- ROUND(AVG(salario), 2): Esta función redondea el promedio del salario a 2 decimales.
SELECT nombre, ROUND(AVG(salario), 2) AS promedio_salario
FROM empleados
GROUP BY nombre;

-- TO_CHAR(AVG(salario), 'FM999999999.00'): Esto convierte el valor numérico a un formato de cadena con exactamente 2 decimales, eliminando ceros innecesarios.
-- FM evita que se muestre espacio en blanco si el número es menor de lo esperado.
-- .00 asegura que siempre se muestren dos decimales, incluso si son ceros.
SELECT nombre, TO_CHAR(AVG(salario), 'FM999999999.00') AS promedio_salario
FROM empleados
GROUP BY nombre;

SELECT nombre, salario
FROM empleados
WHERE nombre = 'Luis'
-- si nombre y salario es igual solo muestra 1
GROUP BY nombre, salario;

SELECT nombre, salario
FROM empleados
WHERE nombre = 'Luis'
GROUP BY nombre, salario
-- muestra los que cumplan la condición ~ WHERE pero de GROUP BY
HAVING salario > 2599;

-- Mostrar todos los salarios mayor a 3000
SELECT nombre, salario
FROM empleados
GROUP BY nombre, salario
HAVING salario > 1500;

SELECT nombre, salario
FROM empleados
GROUP BY nombre, salario
HAVING salario > 1500
-- ORDENAR POR salario ASCENDENTE digamos 1, 2, 3, 4,
-- ORDER BY salario ASC; -- no hace falta poner ASC porque es por defecto
-- 4, 3, 2, 1
-- ORDER BY salario DESC;
-- ORDENAR por nombre
ORDER BY nombre;

-- SELECIONAR los nombres que sean DISTINTOS (que no se repitan)
SELECT DISTINCT nombre
FROM empleados;

-- para contar los nombres diferentes que hay sin que se repitan
SELECT COUNT(DISTINCT nombre)
FROM empleados;

SELECT *
FROM empleados
-- DONDE salario este ENTRE 1800 Y 2200 (ambos numeros incluidos)
-- WHERE salario BETWEEN 1800 AND 2200;
-- DONDE salario NO este ENTRE 1800 Y 2200 (ambos numeros incluidos)
WHERE salario NOT BETWEEN 1800 AND 2200;

-- ALTERAR TABLA
ALTER TABLE empleados
-- AÑADIR RESTRICCIÓN
ADD CONSTRAINT uq_salario
-- UNICA
UNIQUE(salario)

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10, 2),
    -- Definir restricción UNIQUE en la columna salario
    CONSTRAINT uq_salario UNIQUE (salario)
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10, 2),
    -- Definir restricción UNIQUE en la combinación de columnas nombre y salario
    CONSTRAINT uq_nombre_salario UNIQUE (nombre, salario)
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10, 2) UNIQUE -- simple y automatico
);

-- UNIQUE el valor en esa columna no se puede repetir en ninguna otra (usalo en otro lugar mas recomendado como email, id...)

-- ALTERAR TABLA
ALTER TABLE empleados
-- ELIMINAR RESTRICCIÓN
DROP CONSTRAINT uq_salario;
-- uq_salario si no sabes donde esta puedes ir a
-- pgAdmin 4 o a otro DBeaver... y ir a la base de datos
-- Schemas>public(por defecto)>Tables>nombre_de_la_tabla>Constraints
-- Y ahí estaria el nombre (podrian haber muchos)

CREATE TABLE empresas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO empresas2 (nombre, direccion, ciudad, pais, telefono)
VALUES
    ('Tech Solutions', '1234 Calle Falsa', 'Madrid', 'España', '+34 912 345 678'),
    ('Innovative Systems', 'Av. Reforma 123', 'Ciudad de México', 'México', '+52 55 1234 5678'),
    ('Global Enterprises', '100 Main St', 'New York', 'USA', '+1 212 555 1234'),
    ('Soluciones Empresariales', 'Calle 50 No 123', 'Bogotá', 'Colombia', '+57 1 234 5678'),
    ('Future Technologies', '4567 Elm St', 'Toronto', 'Canadá', '+1 416 555 9876');


ALTER TABLE empleados
ADD codigo_empresa INTEGER

ALTER TABLE empleados
ADD CONSTRAINT k_codigo_empresa
FOREIGN KEY (codigo_empresa) -- clave foranea
REFERENCES empresas (id) -- que hace referencia a la tabla empresas a su id

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2),
    codigo_empresa INTEGER,
    CONSTRAINT k_codigo_empresa FOREIGN KEY (codigo_empresa) REFERENCES empresas(id)
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2),
    codigo_empresa INTEGER REFERENCES empresas(id)
);

UPDATE empleados2 SET codigo_empresa = 1

INSERT INTO empleados(nombre , salario, codigo_empresa) 
VALUES ('sam', '656456', 9) -- si la empresa 9 no existe dara un error

-- CREAR UNA FUNCIÓN

CREATE OR REPLACE FUNCTION Suma(num1 INTEGER, num2 INTEGER)
RETURNS INTEGER AS 
$$
BEGIN
    RETURN num1 + num2;
END;
$$
LANGUAGE plpgsql;

-- crear fn
CREATE OR REPLACE FUNCTION Suma( num1 int, num2 integer)
RETURNS INTEGER AS 
$$
    SELECT num1 + num2; -- lo que hace
$$
LANGUAGE SQL;

-- como usarla
SELECT suma (98 , 2)

CREATE FUNCTION buscar_salario(VARCHAR) -- $1
RETURNS INTEGER AS
$$
	SELECT salario FROM empleados
	WHERE nombre = $1; -- $2 , $3 segun los campos que reciba
$$
LANGUAGE SQL;

SELECT buscar_salario('Juan');

-- funcion que retorna nada
CREATE FUNCTION insertar_personas ()
RETURNS VOID AS -- void = no retornar nada
$$
INSERT INTO empleados(nombre, salario, codigo_empresa) 
VALUES('David', 1800, 2);
INSERT INTO empleados (nombre, salario, codigo_empresa)
VALUES
('David2', 1800, 2),
('David3', 1800, 3),
('David4', 1800, 2),
('David5', 1800, 2);
$$
LANGUAGE SQL;

SELECT insertar_personas()

CREATE FUNCTION buscar_info (int)
RETURNS empleados AS
$$
SELECT * FROM empleados
WHERE id = $1;
$$
LANGUAGE SQL;

SELECT buscar_info(1)

SELECT Top(5) * FROM empleados; -- SQL

-- SELECIONAR TODOS DESDE empleados con un LIMITE de 5(maximo, muestra los 5 primeros)
SELECT * FROM empleados LIMIT 5;

-- Seleccionar los siguientes 5 registros (del 6 al 10)
SELECT * FROM empleados
LIMIT 5 OFFSET 5;

-- Seleccionar los siguientes 5 registros (del 11 al 15)
SELECT * FROM empleados
LIMIT 5 OFFSET 10;

-- TRIGGER
CREATE FUNCTION fn_test() 
RETURNS TRIGGER AS
$$
BEGIN
	INSERT INTO "log_triggers_empleados"
	-- VALUES (NEW) -- NUEVA 
	VALUES (OLD.nombre, OLD.salario, OLD.codigo_empresa) -- lo que tiene la tabla en ese momento, antes del update
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tr_update 
BEFORE UPDATE ON empleados
FOR EACH ROW
EXECUTE PROCEDURE fn_test();

-- Paso 1: Crear la Tabla empleados
-- Primero, vamos a definir la tabla empleados con algunos campos de ejemplo:
CREATE TABLE empleados (
    id serial PRIMARY KEY,
    nombre varchar(50),
    salario numeric(10,2),
    codigo_empresa integer
);

-- Paso 2: Crear la Tabla de Auditoría log_triggers_empleados
-- Luego, creamos la tabla de auditoría log_triggers_empleados para registrar cualquier cambio en los campos de empleados. 
-- Esta tabla tendrá los mismos campos que la tabla empleados, más algunos adicionales para registrar la acción realizada y la fecha del cambio.
CREATE TABLE log_triggers_empleados (
    id serial PRIMARY KEY,
    empleado_id integer,
    nombre varchar(50),
    salario numeric(10,2),
    codigo_empresa integer,
    action_type varchar(10), -- INSERT, UPDATE, DELETE
    action_timestamp timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Paso 3: Crear la Función de Trigger
-- La función de trigger que se encargará de insertar registros en log_triggers_empleados cada vez que se realice una operación en empleados.
CREATE OR REPLACE FUNCTION fn_test()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO log_triggers_empleados (
        empleado_id, 
        nombre, 
        salario, 
        codigo_empresa, 
        action_type
    )
    VALUES (
        COALESCE(NEW.id, OLD.id), -- Usa el nuevo ID para INSERT y el viejo para UPDATE/DELETE
        COALESCE(NEW.nombre, OLD.nombre), 
        COALESCE(NEW.salario, OLD.salario),
        COALESCE(NEW.codigo_empresa, OLD.codigo_empresa),
        TG_OP -- Indica la operación: INSERT, UPDATE o DELETE
    );
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Paso 4: Crear el Trigger
-- Finalmente, creamos el trigger para que llame a la función de auditoría en las operaciones de INSERT, UPDATE o DELETE.
CREATE TRIGGER trg_test_empleados
AFTER INSERT OR UPDATE OR DELETE ON empleados
FOR EACH ROW
EXECUTE FUNCTION fn_test();

-- Paso 1: Crear la tabla de logs
CREATE TABLE log_empleados (
    id SERIAL PRIMARY KEY,
    empleado_id INTEGER,
    nombre VARCHAR(50),
    salario NUMERIC(10, 2),
    codigo_empresa INTEGER,
    usuario VARCHAR(250),
    fecha DATE,
    tiempo TIME
);

-- Paso 2: Crear la función

-- Crear o reemplazar una función llamada fn_tr_insert_log que será usada por un trigger
CREATE OR REPLACE FUNCTION fn_tr_insert_log() 
-- La función retornará un tipo TRIGGER
RETURNS TRIGGER AS
$$
DECLARE
    -- Declarar la variable usuario que contendrá el nombre del usuario actual
    usuario VARCHAR(250) := USER;
    -- Declarar la variable fecha para guardar la fecha actual
    fecha DATE := CURRENT_DATE;
    -- Declarar la variable tiempo para guardar la hora actual
    tiempo TIME := CURRENT_TIME;
BEGIN
    -- Insertar los valores en la tabla log_empleados
    INSERT INTO log_empleados (empleado_id, nombre, salario, codigo_empresa, usuario, fecha, tiempo)
    -- Los valores a insertar son: el id, nombre, salario y código de empresa del nuevo registro,
    -- además de las variables usuario, fecha y tiempo capturadas en la función
    VALUES (NEW.id, NEW.nombre, NEW.salario, NEW.codigo_empresa, usuario, fecha, tiempo);

    -- Devolver la nueva fila insertada (esto es necesario para completar el trigger)
    RETURN NEW;
END;
$$
-- El lenguaje usado es PL/pgSQL
LANGUAGE plpgsql;

--Paso 3: Crear el trigger

-- Crear un trigger llamado trg_insert_empleados
CREATE TRIGGER trg_insert_empleados
-- El trigger se activa después de un INSERT en la tabla empleados
AFTER INSERT ON empleados
-- El trigger se ejecutará para cada fila insertada
FOR EACH ROW
-- El trigger usará la función fn_tr_insert_log para insertar en el log
EXECUTE FUNCTION fn_tr_insert_log();

-- Probar trigger:
INSERT INTO empleados (nombre, salario, codigo_empresa) 
VALUES ('María García', 3200.75, 2);

-- SELECIONAR TODOS DESDE empleados
SELECT * FROM empleados
-- DONDE el id sea igual a 1 o 11 o 3 (devuelve todos los que coincidan)
WHERE id = 1 OR id = 11 OR id = 3;

SELECT * FROM empleados
WHERE id = 1 OR id = 11 OR nombre = 'Luis';

SELECT * FROM empleados
-- DONDE id TENGA un 1 , 11 , 3
WHERE id IN (1, 11, 3);

SELECT * FROM empleados
-- DONDE id TENGA un 1 , 11 , 3 O nombre tenga Luis
WHERE id IN (1, 11, 3) OR nombre = 'Luis';

-- CREAR una VISTA
CREATE VIEW view_empleados_id_nombre
AS SELECT id, nombre FROM empleados;

-- USAR VISTA
SELECT * FROM view_empleados_id_nombre;

SELECT empleados.id, empleados.nombre
FROM empleados
UNION -- une las dos tablas
-- UNION ALL -- combinar los resultados y permitir duplicados
SELECT empresas.id, empresas.nombre, 
FROM empresas;

-- en esta hay otra columna donde dice de que tabla proceden
SELECT id, nombre, 'empleados' AS Origen
FROM empleados
UNION
SELECT id, nombre, 'empresas'
FROM empresas;

SELECT id, nombre, 'empleados' AS origen
FROM empleados
UNION
SELECT id, nombre, 'empresas'
FROM empresas
ORDER BY origen; -- ordenar por origen

-- SELECIONAR TODO
SELECT *
-- DESDE empleados
FROM empleados
-- REALIZAR UNA UNIÓN INTERNA
INNER JOIN empresas
-- CONDICIÓN DE UNIÓN
ON empleados.id = empresas.id;

-- SELECIONAR id empleado, nombre empleado, nombre empresa, pais empresa
SELECT p.id, p.nombre, e.nombre , e.pais
-- DESDE empleados RENOMBRAR a p
FROM empleados AS p
-- REALIZAR UNA UNIÓN INTERNA RENOMBRAR empresas a e
INNER JOIN empresas AS e
-- DONDE los id sean iguales
ON p.id = e.id;

-- 1. Unión Interna (INNER JOIN)
-- Descripción: La unión interna devuelve solo las filas que tienen coincidencias en ambas tablas basadas en la condición de unión.

-- Resultado: Solo las filas que cumplen con la condición de unión en ambas tablas se incluyen en el resultado final.

-- Sintaxis:
SELECT columnas
FROM tabla1
INNER JOIN tabla2
ON tabla1.columna = tabla2.columna;

SELECT empleados.id, empleados.nombre, empresas.nombre_empresa
FROM empleados
INNER JOIN empresas
ON empleados.id = empresas.id;
-- Resultado: Solo se mostrarán los empleados que tienen una empresa asociada y viceversa.

-- 2. Unión Externa (OUTER JOIN)
-- La unión externa se divide en tres tipos principales: LEFT OUTER JOIN, RIGHT OUTER JOIN, y FULL OUTER JOIN.

-- LEFT OUTER JOIN (o simplemente LEFT JOIN):

-- Descripción: Devuelve todas las filas de la tabla de la izquierda (tabla1) y las filas coincidentes de la tabla de la derecha (tabla2).
-- Si no hay coincidencias en la tabla de la derecha, se devuelven NULL en las columnas de la tabla de la derecha.

-- Sintaxis:
SELECT columnas
FROM tabla1
LEFT OUTER JOIN tabla2
ON tabla1.columna = tabla2.columna;

SELECT empleados.id, empleados.nombre, empresas.nombre_empresa
FROM empleados
LEFT OUTER JOIN empresas
ON empleados.id = empresas.id;
-- Resultado: Mostraría todos los empleados, incluyendo aquellos que no tienen una empresa asociada (esos empleados tendrán NULL en las columnas de la empresa).

-- RIGHT OUTER JOIN (o simplemente RIGHT JOIN):

-- Descripción: Devuelve todas las filas de la tabla de la derecha (tabla2) y las filas coincidentes de la tabla de la izquierda (tabla1).
-- Si no hay coincidencias en la tabla de la izquierda, se devuelven NULL en las columnas de la tabla de la izquierda.

-- Sintaxis:
SELECT columnas
FROM tabla1
RIGHT OUTER JOIN tabla2
ON tabla1.columna = tabla2.columna;

SELECT empleados.id, empleados.nombre, empresas.nombre_empresa
FROM empleados
RIGHT OUTER JOIN empresas
ON empleados.id = empresas.id;
-- Resultado: Mostraría todas las empresas, incluyendo aquellas que no tienen empleados asociados (esos registros tendrán NULL en las columnas del empleado).

-- FULL OUTER JOIN:

-- Descripción: Devuelve todas las filas cuando hay una coincidencia en una de las tablas. Las filas de la tabla de la izquierda que no tienen
-- coincidencia en la tabla de la derecha y las filas de la tabla de la derecha que no tienen coincidencia en la tabla de la izquierda
-- se muestran con NULL en las columnas de la tabla que no tiene coincidencia.

-- Sintaxis:
SELECT columnas
FROM tabla1
FULL OUTER JOIN tabla2
ON tabla1.columna = tabla2.columna;

SELECT empleados.id, empleados.nombre, empresas.nombre_empresa
FROM empleados
FULL OUTER JOIN empresas
ON empleados.id = empresas.id;
-- Resultado: Mostraría todos los empleados y todas las empresas, independientemente de si hay coincidencias entre ellas. 
-- Las filas sin coincidencias tendrán NULL en las columnas de la tabla que no tiene coincidencias.

-- Resumen

-- INNER JOIN: Devuelve solo las filas con coincidencias en ambas tablas.

-- LEFT OUTER JOIN: Devuelve todas las filas de la tabla de la izquierda y las coincidencias de la tabla de la derecha 
-- (si no hay coincidencias, se devuelven NULL para las columnas de la tabla de la derecha).

-- RIGHT OUTER JOIN: Devuelve todas las filas de la tabla de la derecha y las coincidencias de la tabla de la izquierda 
-- (si no hay coincidencias, se devuelven NULL para las columnas de la tabla de la izquierda).

-- FULL OUTER JOIN: Devuelve todas las filas cuando hay una coincidencia en cualquiera de las tablas, mostrando NULL donde no hay coincidencias.



-- Muestra si se cumple la condición
SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
INNER JOIN empresas AS e -- derecha
-- ON p.codigo_empresa = e.id;
ON p.id = e.id;


-- Muestra la tabla de la izquierda sin importar si los datos de la tabla derecha existen
SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
LEFT JOIN empresas AS e -- derecha
--ON p.codigo_empresa = e.id;
ON p.id = e.id;

SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
LEFT OUTER JOIN empresas AS e -- derecha OUTER cominación externa (opcional)
ON p.id = e.id;


-- Muestra la tabla de la derecha siempre sin importar si los datos de la tabla izquierda existen
SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
RIGHT JOIN empresas AS e -- derecha
ON p.codigo_empresa = e.id;
-- ON p.id = e.id;

-- Muestra las 2 tablas aunque no coincidan
SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
FULL JOIN empresas AS e -- derecha
ON p.codigo_empresa = e.id;
-- ON p.id = e.id;


-- Muestra todas las combinaciones posibles
-- Ej: si hay 5 empresas el nombre aparecera 5 veces con cada una de las empresas en 5 filas 
SELECT p.id, p.nombre, e.nombre , e.pais
FROM empleados AS p -- izquierda 
CROSS JOIN empresas AS e; -- derecha


-- INNER JOIN une las dos tablas donde coiciden las dos
-- LEFT JOIN une la tabla de la izquierda(toda) + la parte donde coincide con la de la derecha
-- RIGHT JOIN une la tabla de la derecha(toda) + la parte donde coincide con la de la izquierda
-- FULL JOIN une la tabla de la izquierda con la de la derecha mostrando todos los datos, si no estan relacionados pondra null en esas partes
-- CROSS JOIN muestra todas las combinaciones posibles entre una y otra

-- CREAR VISTA
CREATE VIEW view_personas AS
SELECT * 
FROM personas
WHERE test = 'JS';

SELECT * FROM view_personas;

-- te deja añadir a la vista C#
INSERT INTO view_personas VALUES (12, 'Carlos', 'Oliver', 'C#');

DROP VIEW view_personas;

-- Para asegurarse de que no genere un error en caso de que la vista no exista
DROP VIEW IF EXISTS view_personas;

CREATE VIEW view_personas AS
SELECT * 
FROM personas
WHERE test = 'JS'
-- garantiza que al añadir se cumpla con la condición JS
WITH CHECK OPTION;

-- aqui ahora dara un error por el campo C# porque la vista tiene WITH CHECK OPTION
INSERT INTO view_personas VALUES (13, 'Carlos', 'Oliver', 'C#');
-- aqui si que deja porque tiene test = JS
INSERT INTO view_personas VALUES (14, 'Carlos', 'Oliver', 'JS');


-- Valor absoluto 30 (devuelve un valor positivo)
SELECT ABS(-30);

--Calcula la raíz cúbica 2.924017738212866
SELECT CBRT(25);

-- REDONDEAR hacia arriba 16
SELECT CEILING(15.33);

-- REDONDEAR hacia ABAJO 15
SELECT FLOOR(15.99);

-- AL CUADRADO 5 * 5 * 5 = 125
SELECT POWER(5,3);

-- 25
SELECT ROUND(24.82);
-- 24.83
SELECT ROUND(24.825, 2);

-- 0
SELECT SIGN(0);
-- 1
SELECT SIGN(244.21);
-- -1
SELECT SIGN(-32123);

-- Raíz cuadrada 5
SELECT SQRT(25);

-- devuelve el resto de una division
SELECT MOD(33, 2);

-- 3.141592653589793
SELECT PI();

-- NUMERO RANDOM entre 0 y 1 ej resultado = 0.6219692815560511
SELECT RANDOM();

-- 57 NO redondea
SELECT TRUNC(57.86);
-- -57
SELECT TRUNC(-57.36);
-- 57.36
SELECT TRUNC(57.36653, 2);
-- -57.36
SELECT TRUNC(-57.36973, 2);

-- 10 CARACTERES
SELECT CHAR_LENGTH('Hola mundo');

-- HOLA MUNDO
SELECT UPPER('Hola mundo');

-- hola mundo
SELECT LOWER('Hola mundo');

-- empieza en la posicion 6
SELECT POSITION('mundo' IN 'Hola mundo');
-- empieza en la posicion 1
SELECT POSITION('Hola' IN 'Hola mundo');
-- 0 es igual a que no se encontro Mundo != mundo
SELECT POSITION('Mundo' IN 'Hola mundo');

-- ola mu
SELECT SUBSTRING('Hola mundo' FROM 2 FOR 6);

-- Hola mundo QUITA LOS ESPACIOS DEL PRINCIPIO Y FINAL
SELECT TRIM(' Hola mundo ');

--  Hola -mundo -- QUITA LOS -- PERO DEJO EL ESPACIO AL PRINCIPIO
SELECT TRIM(LEADING '-' FROM '-- Hola -mundo --');
-- -- Hola -mundo  QUITA LOS -- PERO DEJO EL ESPACIO AL FINAL
SELECT TRIM(TRAILING '-' FROM '-- Hola -mundo --');
--  Hola -mundo  QUITA LOS -- PERO DEJO EL ESPACIOS
SELECT TRIM(BOTH '-' FROM '-- Hola -mundo --');

-- -- Hola -mundo --
SELECT LTRIM('   -- Hola -mundo --');
--  Hola -mundo -- DEJA EL ESPACIO AL PRINCIPIO
SELECT LTRIM('-- Hola -mundo --', '-');
-- -- Hola -mundo  DEJA EL ESPACIO AL FINAL
SELECT RTRIM('-- Hola -mundo --', '-');
-- ola -mundo --
SELECT SUBSTR('-- Hola -mundo --', 5);
-- ola -mun
SELECT SUBSTR('-- Hola -mundo --', 5,8);
-- ________-- Hola -mundo -- 25 es lo que debe ocupar el string
-- si no llega le añade los _, si fuera 5 daria -- Ho
SELECT LPAD('-- Hola -mundo --', 25,'_');
-- -- Hola -mundo --________
SELECT RPAD('-- Hola -mundo --', 25,'_');

-- 2024-09-16 = FECHA ACTUAL
SELECT CURRENT_DATE;

-- 17:37:03.413209+02:00 = TIEMPO ACTUAL horas:minutos:segundos:fracciones_de_segundo y zona horaria
SELECT CURRENT_TIME;
-- 17:41:11.875000+02:00
SELECT CURRENT_TIME(3);  -- Limita la precisión a milisegundos
-- 17:41:19+02:00
SELECT CURRENT_TIME(0);  -- Sin fracciones de segundo

-- 2024-09-16 17:43:46.960746+02 FECHA + HORA ACRUAL
SELECT CURRENT_TIMESTAMP;

-- 2024
SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP);
-- 9
SELECT EXTRACT(MONTH FROM CURRENT_TIMESTAMP);
-- 16
SELECT EXTRACT(DAY FROM CURRENT_TIMESTAMP);
-- 17
SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP);
-- 21 (SIGLO)
SELECT EXTRACT(CENTURY FROM CURRENT_TIMESTAMP);
-- 3 (cuarto del año)
SELECT EXTRACT(QUARTER FROM CURRENT_TIMESTAMP);
-- 50
SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP);
-- 37.933121
SELECT EXTRACT(SECOND FROM CURRENT_TIMESTAMP);
-- 38 (semana del año)
SELECT EXTRACT(WEEK FROM CURRENT_TIMESTAMP);

-- 1 (Día de la semana)
-- Resultados:
-- 0: Domingo
-- 1: Lunes
-- 2: Martes
-- 3: Miércoles
-- 4: Jueves
-- 5: Viernes
-- 6: Sábado
SELECT EXTRACT(DOW FROM CURRENT_TIMESTAMP);

-- Monday
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Day');

-- 260 (Día del año)
SELECT EXTRACT(DOY FROM CURRENT_TIMESTAMP);

-- Seleccionar múltiples partes a la vez
SELECT 
    EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS year,
    EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AS month,
    EXTRACT(DAY FROM CURRENT_TIMESTAMP) AS day,
    EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AS hour,
    EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS minute,
    EXTRACT(SECOND FROM CURRENT_TIMESTAMP) AS second;

-- SELECIONAR TODO DESDE personas
SELECT * FROM personas
-- DONDE test SEA NULO
WHERE test IS NULL;

SELECT * FROM personas
-- DONDE test NO SEA NULO
WHERE test IS NOT NULL;

CREATE SEQUENCE sec_indice -- nombre secuencia
START WITH 1 -- empieza en 1
INCREMENT BY 20 -- va sumando 20 cada vez
-- SI NO SE PONEN LOS VALORES min y max tendran unos por defecto
MINVALUE 1 -- valor minimo
MAXVALUE 100 -- valor maximo
CYCLE; -- evita error y hace que se repita
-- NO CYCLE; -- SI lo quitas o pones NO CYCLE dara un error si se repite (usar para indices)

SELECT * FROM sec_indice;

SELECT NEXTVAL('sec_indice');

-- alterar  sec_indice
ALTER SEQUENCE sec_indice
START WITH 1 -- empieza en 1
INCREMENT BY 1
MINVALUE 1 -- valor minimo
MAXVALUE 100 -- valor maximo
NO CYCLE;

-- ELIMINAR
DROP SEQUENCE sec_indice;

-- SELECIONAR nombre, apellido,
SELECT nombre, apellido,(
    -- SUBCONSULTA: SELECIONAR MAXIMO(salario) RENOMBRAR columna a Salario maximo
	SELECT MAX(salario) AS "Salario maximo"
    -- DESDE empleados renombrar tabla a e
	FROM empleados AS e
    -- DONDE empleados.nombre sea igual a personas.nombre
	WHERE e.nombre = p.nombre
)
-- DESDE personas renombrar tabla a p
FROM personas AS p;

SELECT p.nombre, p.apellido, (
    SELECT MAX(e.salario)
    FROM empleados AS e
    WHERE e.nombre = p.nombre
) AS "Salario maximo"
FROM personas AS p
WHERE (
    SELECT MAX(e.salario)
    FROM empleados AS e
    WHERE e.nombre = p.nombre
) IS NOT NULL;

-- SELECCIONAR las columnas nombre, apellido y pais de la tabla personas
SELECT nombre, apellido, pais
-- DESDE la tabla personas
FROM personas
-- FILTRAR solo las filas donde el pais coincida con el valor devuelto por la subconsulta
WHERE pais = (
    -- SUBCONSULTA: SELECCIONAR la columna pais desde la tabla precios
    SELECT pais
    -- DESDE la tabla precios, ordenando los resultados por la columna precio en orden ascendente
    FROM precios 
    -- LIMITAR los resultados a 1 fila, saltando las primeras 14 filas
    LIMIT 1
    OFFSET 14
);

CREATE TABLE personas2 (
	id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais VARCHAR(50)
);

INSERT INTO personas2 (nombre, apellido, pais) VALUES
('Juan', 'Pérez', 'Argentina'),
('Ana', 'García', 'España'),
('Luis', 'Martínez', 'México'),
('Marta', 'Gómez', 'Colombia'),
('Carlos', 'López', 'Chile'),
('Sofía', 'González', 'Perú'),
('Diego', 'Rodríguez', 'Uruguay'),
('Lucía', 'Fernández', 'Brasil'),
('Pedro', 'Ramírez', 'Paraguay'),
('Valeria', 'Silva', 'Bolivia'),
('Javier', 'Ortiz', 'Ecuador'),
('Camila', 'Morales', 'Venezuela'),
('Tomás', 'Núñez', 'Cuba'),
('Pablo', 'Díaz', 'Panamá'),
('Ricardo', 'Herrera', 'Costa Rica');

CREATE TABLE precios2 (
    pais VARCHAR(50),
    precio DECIMAL(10, 2)
);

INSERT INTO precios2 (pais, precio) VALUES
('Argentina', 500.00),
('España', 700.00),
('México', 650.00),
('Colombia', 550.00),
('Chile', 400.00),
('Perú', 600.00),
('Uruguay', 300.00),
('Brasil', 450.00),
('Paraguay', 350.00),
('Bolivia', 200.00),
('Ecuador', 720.00),
('Venezuela', 640.00),
('Cuba', 550.00),
('Panamá', 500.00),
('Costa Rica', 580.00);

-- SELECCIONAR las columnas nombre, apellido y pais de la tabla personas2
SELECT nombre, apellido, pais
-- DESDE la tabla personas2
FROM personas2
-- FILTRAR solo las filas donde el pais coincida con el valor devuelto por la subconsulta
WHERE pais = (
    -- SUBCONSULTA: SELECCIONAR la columna pais desde la tabla precios2
    SELECT pais
    -- DESDE la tabla precios2, ordenando los resultados por la columna precio en orden ascendente
    FROM precios2 
    -- LIMITAR los resultados a 1 fila, saltando las primeras 14 filas
    LIMIT 1
    OFFSET 14
);

-- SELECCIONAR las columnas nombre, apellido y pais desde la tabla personas2
SELECT nombre, apellido, pais
FROM personas2
-- FILTRAR los resultados donde el pais esté presente en los resultados de la subconsulta
WHERE pais IN (
    -- SUBCONSULTA: SELECCIONAR la columna pais desde la tabla precios2
    SELECT pais
    FROM precios2
    -- FILTRAR los paises que contienen la letra 'C' en cualquier parte del nombre
    WHERE pais LIKE '%C%'
);

ALTER TABLE personas2
ADD COLUMN visa VARCHAR(250);

UPDATE personas2
SET pais = (
SELECT pais 
FROM precios2 
ORDER BY precio 
LIMIT 1 
OFFSET 50
) -- seleciona un pais de precios
WHERE pais IS NULL;

-- ACTUALIZAR la columna visa a 'si' en la tabla personas2
UPDATE personas2
-- ESTABLECER el valor de la columna visa a 'si'
SET visa = 'si'
-- FILTRAR solo las filas donde el pais esté en la lista devuelta por la subconsulta
WHERE pais IN (
    -- SUBCONSULTA: SELECCIONAR la columna pais desde la tabla precios2
    SELECT pais 
    -- DESDE la tabla precios2
    FROM precios2 
    -- FILTRAR los países que contienen 'Esp' en cualquier parte del nombre
    WHERE pais LIKE '%Esp%' 
);

-- ELIMINAR de la tabla personas2
DELETE FROM personas2
-- FILTRAR solo las filas donde el valor de la columna pais esté en la lista devuelta por la subconsulta
WHERE pais IN (
    -- SUBCONSULTA: SELECCIONAR la columna pais desde la tabla precios2
    SELECT pais
    -- DESDE la tabla precios2
    FROM precios2
    -- FILTRAR los países que contienen 'Cu' en cualquier parte del nombre
    WHERE pais LIKE '%Cu%'
);

CREATE TABLE precios_maximos2 (
    pais VARCHAR(100) PRIMARY KEY,
    precio DECIMAL(10, 2)
);

-- INSERTAR los datos en la tabla precios_maximos2
INSERT INTO precios_maximos2
-- SELECCIONAR la columna pais y el valor máximo de la columna precio
SELECT pais, MAX(precio)
-- DESDE la tabla precios2
FROM precios2
-- FILTRAR los datos sin ninguna condición adicional (la condición pais = pais es redundante)
WHERE pais = pais
-- AGRUPAR los datos por la columna pais
GROUP BY pais;

-- VARIABLES SQL
DECLARE @variable int;
SET @variable = 50;

SELECT @variable;
-- VARIABLES SQL

-- INICIAR un bloque anónimo de código PL/pgSQL
DO $$
-- DECLARAR variables locales
DECLARE
    -- Declarar la variable x e inicializarla con el valor 50
    x int := 50;
    -- Declarar la variable y e inicializarla con el valor 500
    y int := 500;
    -- Declarar la variable z sin inicializar
    z int;
BEGIN
    -- CALCULAR el producto de x e y y asignar el resultado a z
    z := x * y;
    -- MOSTRAR un mensaje con el resultado del cálculo
    RAISE NOTICE 'El resultado es: %', z;
END $$;


DO $$
BEGIN
    -- IF codicion THEN
    -- ELSE
    -- END IF;
    IF EXISTS( -- si existe
        SELECT pais 
        FROM precios2
        WHERE pais = 'Paraguay'
    ) THEN
		DELETE FROM precios2
		WHERE pais = 'Paraguay';
        RAISE NOTICE 'El país fue encontrado';
    ELSE
         RAISE NOTICE 'El país no fue encontrado';
    END IF;
END $$;

SELECT pais, precio, 
	CASE -- caso
        -- SI pais es Argentina poner Vuelo con AAA
		WHEN pais = 'Argentina' THEN 'Vuelo con AAA'
		WHEN pais = 'España' THEN 'Vuelo Retrasado'
		ELSE 'Vuelo Normal' -- el resto
	END AS "Tipo de viaje" -- el nombre de la columna
FROM precios2;

DO $$
DECLARE
    -- DECLARAR una variable del tipo registro (record) para almacenar cada fila obtenida del cursor
    registro record;
    -- DECLARAR un cursor llamado cur_precios2 que contiene la consulta SELECT de la tabla precios2
    -- ORDENAR los resultados por la columna "pais"
    cur_precios2 CURSOR FOR 
        SELECT *
        FROM precios2
        ORDER BY pais;
BEGIN
    -- ABRIR el cursor cur_precios2 para comenzar a recorrer los datos de la tabla precios2
    OPEN cur_precios2;
    -- OBTENER la primera fila del cursor cur_precios2 e insertarla en la variable registro
    FETCH cur_precios2 INTO registro;
    -- MOSTRAR un mensaje con el valor de las columnas "pais" y "precio" del registro actual
    RAISE NOTICE 'Pais: %, Precio: %', 
    registro.pais,
    registro.precio;
END $$
-- ESPECIFICAR el lenguaje utilizado en el bloque, en este caso PL/pgSQL
LANGUAGE 'plpgsql';

DO $$
DECLARE
    registro record;
	cur_precios2 CURSOR FOR 
		SELECT *
		FROM precios2
		ORDER BY pais;
BEGIN
	OPEN cur_precios2;
	FETCH cur_precios2 INTO registro;
	WHILE (FOUND) LOOP
    RAISE NOTICE 'Pais: %, Precio: %', 
	registro.pais,
	registro.precio;
	FETCH cur_precios2 INTO registro;
	END LOOP;
END $$
LANGUAGE 'plpgsql';

DO $$
DECLARE
    registro record;
    -- Declarar un cursor que selecciona todos los registros de precios2 ordenados por país
    cur_precios2 CURSOR FOR 
        SELECT *
        FROM precios2
        ORDER BY pais;
BEGIN
    -- Abrir el cursor
    OPEN cur_precios2;
    -- Bucle para iterar sobre cada fila del cursor
    LOOP
        -- Obtener la siguiente fila del cursor
        FETCH cur_precios2 INTO registro;
        -- Salir del bucle si no se encontraron más filas (cuando FOUND es falso)
        EXIT WHEN NOT FOUND;
        -- Mostrar el país y el precio de la fila actual
        RAISE NOTICE 'Pais: %, Precio: %', 
        registro.pais,
        registro.precio;
    END LOOP;
    -- Cerrar el cursor después de procesar todos los registros
    CLOSE cur_precios2;
END $$
LANGUAGE 'plpgsql';

DO $$
DECLARE
    registro record;
	cur_precios2 CURSOR FOR 
		SELECT *
		FROM precios2
		ORDER BY pais;
BEGIN
    -- RECORRER CON for in
	FOR registro IN cur_precios2 LOOP
    	RAISE NOTICE 'Pais: %, Precio: %', 
		registro.pais,
		registro.precio;
	END LOOP;
END $$
LANGUAGE 'plpgsql';