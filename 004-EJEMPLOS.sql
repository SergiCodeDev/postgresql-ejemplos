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
	aprellido VARCHAR(40)
);

-- Añadir datos a la tabla personas
INSERT INTO personas VALUES ('1', 'Jose', 'Pons');
INSERT INTO personas VALUES (2, 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre, aprellido) VALUES (3, 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre) VALUES ('4', 'Jose', 'Pons');
INSERT INTO personas (id_persona, nombre) VALUES (5, 'Jose');
INSERT INTO personas (id_persona, aprellido) VALUES (6, 'Milan');

-- Consultar los datos
SELECT * FROM personas;
-- Con maximo de 3
SELECT * FROM personas
LIMIT 3;

-- Actualizar un dato
-- En este caso de personas actualizamos el apellido de todos los de la tabla
UPDATE personas SET aprellido = 'Pons';

-- De persona actualiza
UPDATE personas
-- El aprellido
SET aprellido = 'Mila'
-- Donde id_persona sea 1
WHERE id_persona = '1';

UPDATE personas
SET nombre = 'Sergi'
WHERE nombre IS NULL;

UPDATE personas
SET 
    nombre = 'Sam',
    aprellido = 'Funi'
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
