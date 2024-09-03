-- DROP TABLE IF EXISTS cliente_ordenes_productos;
-- DROP TABLE IF EXISTS cliente_ordenes;
-- DROP TABLE IF EXISTS clientes;
-- DROP TABLE IF EXISTS productos;

CREATE TABLE clientes (
	cliente_id SERIAL PRIMARY KEY,
	cliente_nombre VARCHAR(60) NOT NULL
);

CREATE TABLE productos (
	producto_id SERIAL PRIMARY KEY,
	producto_nombre VARCHAR(80) NOT NULL,
	producto_precio	NUMERIC(6,2) CHECK(producto_precio > 0),
	producto_stock SMALLINT CHECK(producto_stock >= 0) DEFAULT 0,
	producto_tipo VARCHAR(80)
);

CREATE TABLE cliente_ordenes (
	cliente_orden_id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES clientes(cliente_id),
	orden_fecha DATE DEFAULT NOW()
);

CREATE TABLE cliente_ordenes_productos (
	cliente_orden_id INT REFERENCES cliente_ordenes(cliente_orden_id),
	producto_id INT REFERENCES productos(producto_id),
	cantidad SMALLINT DEFAULT 1
);

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

INSERT INTO clientes (cliente_nombre)
VALUES
	('María'),
	('Carmen'),
	('Josefa'),
	('Antonio'),
	('José'),
	('Manuel'),
	('David'),
	('Daniel');

SELECT * FROM clientes;
SELECT * FROM productos;

-- Paso a paso
INSERT INTO cliente_ordenes (cliente_id)
VALUES (3);

SELECT * FROM cliente_ordenes;


INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
VALUES (1, 11, 2);

UPDATE productos
SET producto_stock = producto_stock - 2
WHERE productos.producto_id = 11;

-- error stock
INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
VALUES (1, 17, 1);

UPDATE productos
SET producto_stock = producto_stock - 1
WHERE productos.producto_id = 17;
-- ERROR:  La fila que falla contiene (17, Pie de Berries, 5.50, -1, postre).el nuevo registro para la relación «productos»
-- viola la restricción «check» «productos_producto_stock_check»
-- ERROR:  el nuevo registro para la relación «productos» viola la restricción «check» «productos_producto_stock_check»
-- SQL state: 23514
-- Detail: La fila que falla contiene (17, Pie de Berries, 5.50, -1, postre).

SELECT * FROM cliente_ordenes_productos;

-- JOIN
-- La unión o join de PostgreSQL se utiliza para combinar columnas de una o más tablas, en función de los valores de las columnas comunes entre tablas relacionadas.
-- Existen diferentes tipos de join:
-- INNER JOIN o JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN o FULL OUTER JOIN
-- y otros...

-- INNER JOIN ¿Si quisieramos pintar, el nombre del producto y la cantidad comprada?
SELECT *
FROM productos AS p
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

SELECT p.producto_nombre, cop.cantidad
FROM productos AS p
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

SELECT 
	p.producto_nombre, 
	cop.cantidad,
	cop.cantidad * p.producto_precio AS "precio total"
FROM productos AS p
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

SELECT 
	SUM(cop.cantidad * p.producto_precio) "precio total"
FROM productos AS p
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

-- LEFT JOIN
SELECT 
	*
FROM productos AS p
LEFT JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

SELECT 
	p.producto_nombre
FROM productos AS p
LEFT JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id
WHERE cop.cliente_orden_id IS NULL;

-- RIGHT JOIN
SELECT 
	p.producto_nombre
FROM productos AS p
RIGHT JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

-- FULL JOIN
SELECT 
	p.producto_nombre
FROM productos AS p
FULL JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

-- JOIN * N TABLAS

SELECT
	*
FROM cliente_ordenes AS co
JOIN cliente_ordenes_productos cop
ON co.cliente_orden_id = cop.cliente_orden_id;

SELECT
	co.orden_fecha,
	p.producto_nombre
FROM cliente_ordenes AS co
JOIN cliente_ordenes_productos cop
ON co.cliente_orden_id = cop.cliente_orden_id
JOIN productos p
ON p.producto_id = cop.producto_id;

SELECT 
	c.cliente_nombre,
	co.orden_fecha,
	cop.cantidad,
	p.producto_nombre,
	cop.cantidad * p.producto_precio total
FROM clientes c -- desde clientes
JOIN cliente_ordenes co -- relacionamos con la tabla cliente_ordenes
ON c.cliente_id = co.cliente_id -- la relacion que tienen las dos tablas (cliente_id)
JOIN cliente_ordenes_productos cop -- tabla a relacionar
ON co.cliente_orden_id = cop.cliente_orden_id -- id relacionado entre tablas
JOIN productos p
ON p.producto_id = cop.producto_id;

-- ej-- 
INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
VALUES (1, 11, 2);

UPDATE productos
SET producto_stock = producto_stock - 2
WHERE productos.producto_id = 11;

INSERT INTO cliente_ordenes (cliente_id)
VALUES(6);

SELECT * FROM cliente_ordenes;

-- subconsultas

INSERT INTO
cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
VALUES(2,8,1);

UPDATE productos
SET producto_stock = producto_stock - (
	SELECT cantidad
	FROM cliente_ordenes_productos AS cop
	JOIN productos AS p
	ON cop.producto_id = p.producto_id
	WHERE p.producto_id = 8
)
WHERE productos.producto_id = 8;


-- Transacción
BEGIN;

INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
VALUES(2,8,1);

UPDATE productos
SET producto_stock = producto_stock - (
    SELECT cantidad
    FROM cliente_ordenes_productos AS cop
    WHERE cop.cliente_orden_id = 2 AND cop.producto_id = 8
)
WHERE productos.producto_id = 8;

COMMIT;

-- Verificación de Stock y Manejo de Transacción con Control de Errores
DO $$
BEGIN
    -- Verifica si hay suficiente stock
    IF (SELECT producto_stock FROM productos WHERE producto_id = 8) < 1 THEN
        RAISE EXCEPTION 'No hay suficiente stock para el producto 8';
    END IF;

    -- Inicia una transacción
    BEGIN
        -- Inserta la orden de producto
        INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
        VALUES(2, 8, 1);

        -- Actualiza el stock del producto
        UPDATE productos
        SET producto_stock = producto_stock - (
            SELECT cantidad
            FROM cliente_ordenes_productos
            WHERE cliente_orden_id = 2 AND producto_id = 8
        )
        WHERE producto_id = 8;

        -- Confirma la transacción
        COMMIT;
    EXCEPTION
        -- Captura cualquier error y revierte los cambios
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE NOTICE 'Se produjo un error y la transacción se ha revertido: %', SQLERRM;
    END;
END $$;



-- Explicación del Código
-- Verificación del Stock:

-- La primera parte del bloque DO verifica si hay suficiente stock para el producto. Si no hay suficiente stock, lanza una excepción con un mensaje específico.

-- Bloque de Transacción:

-- BEGIN: Inicia un bloque de transacción. Esto asegura que todas las operaciones se realicen de manera atómica.
-- INSERT y UPDATE: Ejecuta las operaciones INSERT y UPDATE dentro de la transacción.
-- COMMIT: Si no hay errores, confirma la transacción para que los cambios sean aplicados.

-- Manejo de Errores:

-- EXCEPTION: Captura cualquier error que ocurra durante la ejecución de las operaciones dentro del bloque BEGIN.
-- ROLLBACK: Revierte todos los cambios realizados durante la transacción si ocurre un error.
-- RAISE NOTICE: Muestra un mensaje con el error específico (SQLERRM) para facilitar la depuración.

-- Notas Adicionales
-- Transacción Interna: El uso de BEGIN y COMMIT dentro del bloque DO puede parecer redundante porque el bloque DO ya ejecuta todo en una transacción.
-- Sin embargo, es una buena práctica asegurarte de que todas las operaciones se manejan correctamente y puedes ajustar la lógica según sea necesario para tus casos específicos.

-- Condición de Stock: Asegúrate de que la lógica para verificar el stock se alinee con las reglas de negocio que necesitas. En el ejemplo proporcionado,
-- se verifica antes de la transacción para evitar realizar cambios innecesarios si el stock es insuficiente.

-- Este enfoque garantiza que, en caso de cualquier problema durante las operaciones de INSERT o UPDATE, los cambios no se aplicarán y se notificará el error,
-- facilitando la depuración y asegurando la integridad de los datos.



DO $$
BEGIN
    BEGIN
        -- Inicio de la transacción
        INSERT INTO cliente_ordenes_productos(cliente_orden_id, producto_id, cantidad)
        VALUES(2,8,1);

        UPDATE productos
        SET producto_stock = producto_stock - (
            SELECT cantidad
            FROM cliente_ordenes_productos AS cop
            WHERE cop.cliente_orden_id = 2 AND cop.producto_id = 8
        )
        WHERE productos.producto_id = 8;

        -- Finalización de la transacción
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- En caso de error, se deshacen los cambios
            ROLLBACK;
            RAISE NOTICE 'Se produjo un error y la transacción se ha revertido.';
    END;
END $$;



-- Ejemplo de Uso de Transacciones
BEGIN;
-- Primera consulta
INSERT INTO cliente_ordenes (cliente_id)
VALUES (6);
-- Segunda consulta
UPDATE productos
SET producto_stock = producto_stock - 1
WHERE producto_id = 8;
-- Si ambas consultas se ejecutan correctamente, se confirma la transacción
COMMIT;



-- Manejo de Errores y Rollback
DO $$
BEGIN
    BEGIN
        -- Primera consulta
        INSERT INTO cliente_ordenes (cliente_id)
        VALUES (6);

        -- Segunda consulta
        UPDATE productos
        SET producto_stock = producto_stock - 1
        WHERE producto_id = 8;

        -- Si ambas consultas se ejecutan correctamente, se confirma la transacción
        COMMIT;
    EXCEPTION
        -- Captura cualquier error y revierte los cambios
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE NOTICE 'Se produjo un error y la transacción se ha revertido: %', SQLERRM;
    END;
END $$;
