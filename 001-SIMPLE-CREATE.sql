CREATE TABLE usuarios (
	nombre VARCHAR(50) NOT NULL,
	edad INT,
	descripcion TEXT,
	id_usuario SERIAL,
	PRIMARY KEY (id_usuario)
);

SELECT * FROM usuarios;

CREATE TABLE tareas (
	id_tarea SERIAL PRIMARY KEY,
	titulo VARCHAR(50) NOT NULL,
	fecha DATE DEFAULT CURRENT_DATE, -- fecha actual
	estado BOOLEAN DEFAULT false,
    -- referenciar a la tabla usuarios desde tareas
	id_usuario INT,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- añadir otro campo a la tabla
ALTER TABLE tareas
ADD descripcion TEXT;
DROP descripcion;

-- ELIMINAR campo de la tabla
ALTER TABLE tareas
DROP descripcion;

-- cambiar tipo de dato de un campo
-- PUEDE DAR ERRORES AL CAMBIAR ALGUNOS TIPOS
ALTER TABLE tareas
ALTER COLUMN descripcion SET DATA TYPE VARCHAR(255);

-- cambiar NOMBRE de un campo
ALTER TABLE tareas
RENAME COLUMN titulo TO cabecera;

SELECT * FROM tareas;

-- añadir datos a la tabla
INSERT INTO usuarios (nombre, edad, descripcion)
VALUES (
	'Sam',
	25,
	'Code'
);

-- añadir tareas al usuario
INSERT INTO tareas (cabecera, id_usuario)
VALUES (
	'Desarrollo web',
	1 -- id
);

-- actualizar tareas del usuario
UPDATE tareas
	SET cabecera = 'Postgresql', descripcion = 'Codigo abierto'
	WHERE id_tarea = 1;

-- borrar una tarea
-- MUY IMPORTANTE TENER CUIDADO 
DELETE FROM tareas
	WHERE id_tarea = 1;