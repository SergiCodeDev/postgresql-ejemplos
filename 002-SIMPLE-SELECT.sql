-- ELIMINAR TABLAS SI EXISTEN
-- DROP TABLE IF EXISTS ordenes;
-- DROP TABLE IF EXISTS productos;
-- DROP TABLE IF EXISTS clientes;
-- DROP TABLE IF EXISTS ordenes, productos, clientes;

CREATE TABLE clientes (
	cliente_id SERIAL PRIMARY KEY,
	cliente_nombre VARCHAR(60) NOT NULL
);

CREATE TABLE productos (
	producto_id SERIAL PRIMARY KEY,
	producto_nombre VARCHAR(80) NOT NULL,
	-- 9999.99 NUMERIC(6,2) TOTAL 6 NUMEROS DECIMALES 2
	-- CHECK comprobacion
	producto_precio	NUMERIC(6,2) CHECK(producto_precio > 0),
	producto_stock SMALLINT CHECK(producto_precio >= 0) DEFAULT 0,
	producto_tipo VARCHAR(80)
);

CREATE TABLE ordenes (
	orden_id SERIAL PRIMARY KEY,
	-- claves foraneas
	cliente_id INT REFERENCES clientes(cliente_id),
	producto_id INT REFERENCES productos(producto_id)
);

INSERT INTO clientes
	(cliente_nombre)
VALUES
	('Sam'),
	('Carlos'),
	('Jose'),
	('Daniel'),
	('Katy'),
	('Dari');

INSERT INTO productos
	(producto_nombre, producto_precio, producto_stock, producto_tipo)
VALUES
	('Latte', 2.50, 100, 'café'),
	('Cappuccino', 1.90, 100, 'café'),
	('Dulce de leche Latte', 20.50, 100, 'café'),
	('Café Americano', 3.50, 100, 'café'),
	('Iced Café Americano', 0.50, 100, 'ice café'),
	('Café Mocha', 50, 100, 'café'),
	('Caramel Macchiato', 3.2, 100, 'café'),
	('Iced Mocha', 2.50, 100, 'ice café'),
	('Mocha Blanco', 2.50, 0, null),
	('Vanilla Latte', 2.50, 100, 'té'),
	('Flat White', 2.50, 100, 'té'),
	('Espresso', 2.50, 100, 'café'),
	('Espresso Macchiato', 0.90, 0, 'café'),
	('Espresso Con Panna', 1.50, 100, 'café'),
	('Café Cortado', 3.50, 100, 'café'),
	('Torta Cuatro Leches', 4.50, 100, 'postre'),
	('Pie de Berries', 5.50, 0, 'postre'),
	('Bagel', 2.50, 100, 'postre'),
	('Donut Rellena', 6.50, 100, 'donut'),
	('Scone de 4 quesos', 7.50, 100, 'sandwich'),
	('Muffin Zanahoria Nuez', 8.50, 100, 'muffin'),
	('Media luna', 9.50, 100, 'donut'),
	('Pan de Queso', 11.50, 100, 'sandwich'),
	('Praline Cake', 12.50, 100, 'sandwich'),
	('Lemon Cake', 22.50, 100, null),
	('Muffin con Chips', 33.50, 100, 'muffin'),
	('Muffin de Arándano', 454.50, 10, 'muffin');

-- Todos
SELECT * FROM productos;

-- Solo todos los nombres
SELECT producto_nombre
FROM productos;

-- Solo todos los nombres y precios
SELECT 
	producto_nombre,
	producto_precio
FROM productos;

-- Concatenar frases con ||
SELECT
    producto_nombre || ' ' || producto_precio || ' €',
	-- producto_nombre || ' ' || producto_precio || ' €' AS precio -- renombrar columna a precio
	-- producto_nombre || ' ' || producto_precio || ' €' AS "nombre y precio"
    producto_id
FROM productos;

-- Operaciones
SELECT
	producto_nombre,
	producto_precio * 100 -- ejemplo
	-- producto_precio * 100 AS "valor por cien"
	-- producto_precio * 100 "valor por cien" -- Se puede quitar el AS para simplificar
FROM productos;

-- Cuando consulta datos de una tabla, la declaración SELECT devuelve filas en un orden no especificado.
-- ORDER BY: Para ordenar las filas del conjunto de resultados, use la cláusula ORDER BY en la SELECT declaración.

SELECT 
	producto_nombre,
	producto_stock,
	producto_precio
FROM productos
ORDER BY producto_nombre ASC; -- ordenar de manera ascendente
-- ORDER BY producto_nombre; -- manera por defecto es ASC
-- ORDER BY producto_nombre DESC; -- descendiente

SELECT
	producto_nombre,
	LENGTH(producto_nombre) AS len -- LENGTH contar caracteres AS renombrar columna
FROM productos
ORDER BY len DESC;

-- DISTINCT: se utiliza en la declaración SELECT para eliminar filas duplicadas de un conjunto de resultados.
SELECT
	DISTINCT producto_tipo
FROM productos;
-- devuleve los tipos no repetidos (sin duplicar)

-- WHERE: SELECT devuelve todas las filas de una o más columnas en una tabla. Para seleccionar filas que satisfagan una condición específica, use una WHERE.
-- Operadores: =, >, <, >=, <=, <>, !=, AND, OR,
	-- IN: Devuelve verdadero si un valor coincide con cualquier valor en una lista.
	-- BETWEEN: Devuelve verdadero si un valor está entre un rango de valores.
	-- LIKE: Devuelve verdadero si un valor coincide con un patrón.
	-- IS NULL: Devuelve verdadero si un valor es NULL.
	-- NOT: Negar el resultado de otros operadores.

SELECT
	-- campos a devolver
	producto_nombre,
	producto_tipo,
	producto_precio,
	producto_stock
FROM productos -- desde la tabla 
WHERE producto_tipo = 'café'; -- donde producto_tipo es café

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio,
	producto_stock
FROM productos
WHERE producto_tipo = 'café' AND producto_stock > 0; -- lo que se debe cumplir

-- Buscar en un rago de coincidencias: (con IN nos evitamos estar utilizando diferentes OR)
SELECT
	producto_nombre,
	producto_tipo,
	producto_precio,
	producto_stock
FROM productos
WHERE producto_tipo IN ('té', 'café', 'ice café');
-- Devuelve todo lo que no tenga ('té', 'café', 'ice café')
-- WHERE producto_tipo NOT IN ('té', 'café', 'ice café');

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio,
	producto_stock
FROM productos
WHERE producto_tipo NOT IN ('té', 'café', 'ice café')
ORDER BY producto_tipo;

-- Buscar una cadena según un patrón específico:
SELECT
	producto_nombre,
	producto_tipo,
	producto_precio,
	producto_stock
FROM productos
WHERE producto_nombre LIKE 'Espresso%';

-- LIKE: Busca datos que coincidan con un patrón específico, utilizando % para cualquier secuencia de caracteres y _ para un solo carácter.
-- Ejemplo: first_name LIKE 'Jen%' encuentra nombres que empiezan con "Jen".
-- NOT LIKE: Encuentra datos que no coinciden con un patrón específico.

-- ILIKE: Similar a LIKE, pero realiza una búsqueda sin distinguir entre mayúsculas y minúsculas.
-- Ejemplo: first_name ILIKE 'bar%' encuentra "Bar", "bar", "BAR", etc.
-- NOT ILIKE: Encuentra datos que no coinciden con un patrón específico sin distinguir entre mayúsculas y minúsculas.

-- ESCAPE: Permite usar caracteres especiales como % y _ como literales en lugar de comodines.
-- Ejemplo: message LIKE '%10$%%' ESCAPE '$' busca la cadena "10%" donde % se trata como un carácter literal gracias al carácter de escape $.

-- Frase "La zanahoria cuesta 3,50€ en el supermercado"

-- Palabra al principio:
-- LIKE 'La zanahoria%': Encuentra frases que comienzan con "La zanahoria".
-- LIKE 'La _anahoria%': Encuentra frases que comienzan con "La" seguido de cualquier carácter y luego "anahoria".

-- Palabra al final:
-- LIKE '%supermercado': Encuentra frases que terminan con "supermercado".
-- LIKE '%mercado_': Encuentra frases que terminan con "mercado" seguido de exactamente un carácter adicional.

-- Palabra en el centro:
-- LIKE '%cuesta%': Encuentra frases que contienen "cuesta" en cualquier parte.
-- LIKE '%cue_t%': Encuentra frases que contienen "cue" seguido de exactamente un carácter y luego "t".

-- Estos ejemplos demuestran cómo usar % y _ para buscar patrones específicos en diferentes partes de una frase.

-- El signo de porcentaje % coincide con cualquier secuencia de cero o más caracteres.
-- El signo de subrayado _ coincide con cualquier carácter.
SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 3; -- entre 1 y 3

-- LIMIT: restringe el número de filas devueltas por la consulta.
SELECT
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 3
-- LIMIT 3; -- LIMITA A 3 
LIMIT 3 OFFSET 3; -- TRAE 3 NUEVAS PERO OMITE LAS 3 PRIMERAS

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 4
ORDER BY producto_precio
LIMIT 3 OFFSET 0;

-- IS NULL
-- En el mundo de las bases de datos, NULL significa información faltante o no aplicable.
-- NULL no es un valor, por lo tanto, no puede compararlo con otros valores como números o cadenas.
-- La comparación de NULL con un valor siempre dará como resultado NULL, lo que significa un resultado desconocido.
-- Además, NULL no es igual a NULL.

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_tipo IS NULL; -- comparar con NULL
-- WHERE producto_tipo IS NOT NULL;

-- GROUP BY: Devuelve las filas en grupos.
-- Para cada grupo, puede aplicar una función agregada, por ejemplo, SUM() para calcular la suma de elementos o COUNT() para obtener el número de elementos en los grupos.

SELECT
	producto_tipo
FROM productos
GROUP BY producto_tipo; -- agrupa los producto_tipo (sin que se repitan)

SELECT
	producto_tipo,
	COUNT(producto_nombre) AS "cantidad de productos" -- contar productos que tiene cada producto_tipo
FROM productos
GROUP BY producto_tipo;

-- HAVING
-- La cláusula WHERE le permite filtrar filas según una condición específica. Sin embargo, la cláusula HAVING le permite filtrar grupos de filas de acuerdo con una condición específica.
-- En otras palabras, la cláusula WHERE se aplica a filas mientras que la cláusula HAVING se aplica a grupos de filas.

SELECT
	producto_tipo,
	COUNT(producto_nombre) AS "cantidad de productos"
FROM productos
GROUP BY producto_tipo
HAVING COUNT(producto_nombre) > 2; -- donde