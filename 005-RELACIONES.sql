-- 1. Relación Uno a Uno (1:1)
-- En una relación uno a uno, cada fila en una tabla A está asociada con una fila en una tabla B, y viceversa.

-- Ejemplo:

-- Crear la tabla `personas`
CREATE TABLE personas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla `detalles_persona`
CREATE TABLE detalles_persona (
    id SERIAL PRIMARY KEY,
    id_persona INTEGER UNIQUE REFERENCES personas(id) ON DELETE CASCADE,
    fecha_nacimiento DATE,
    direccion TEXT
);

-- Insertar datos en `personas`
INSERT INTO personas (nombre) VALUES
('Juan Pérez'),
('Ana Gómez');

-- Insertar datos en `detalles_persona`
INSERT INTO detalles_persona (id_persona, fecha_nacimiento, direccion) VALUES
(1, '1985-07-15', 'Calle Falsa 123'),
(2, '1990-11-20', 'Avenida Siempre Viva 742');

-- 2. Relación Uno a Muchos (1)
-- En una relación uno a muchos, una fila en una tabla A puede estar asociada con muchas filas en una tabla B, 
-- pero cada fila en la tabla B está asociada con solo una fila en la tabla A.

-- Ejemplo:

-- Crear la tabla `empresas`
CREATE TABLE empresas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla `empleados`
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2),
    codigo_empresa INTEGER REFERENCES empresas(id) ON DELETE SET NULL
);

-- Insertar datos en `empresas`
INSERT INTO empresas (nombre) VALUES
('Tech Solutions'),
('Innovative Systems');

-- Insertar datos en `empleados`
INSERT INTO empleados (nombre, salario, codigo_empresa) VALUES
('Ana Pérez', 3000.00, 1),
('Luis Gómez', 2500.00, 1),
('María López', 3200.00, 2);

-- 3. Relación Muchos a Muchos (N)
-- En una relación muchos a muchos, varias filas en una tabla A pueden estar asociadas con varias filas en una tabla B. Para gestionar esta relación se utiliza una tabla intermedia.

-- Ejemplo:

-- Crear la tabla `cursos`
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla `estudiantes`
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla intermedia `estudiantes_cursos`
CREATE TABLE estudiantes_cursos (
    id_estudiante INTEGER REFERENCES estudiantes(id) ON DELETE CASCADE,
    id_curso INTEGER REFERENCES cursos(id) ON DELETE CASCADE,
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Insertar datos en `cursos`
INSERT INTO cursos (nombre) VALUES
('Matemáticas'),
('Historia'),
('Ciencias');

-- Insertar datos en `estudiantes`
INSERT INTO estudiantes (nombre) VALUES
('Pedro Martínez'),
('Lucía Fernández'),
('Carlos Ruiz');

-- Insertar datos en `estudiantes_cursos`
INSERT INTO estudiantes_cursos (id_estudiante, id_curso) VALUES
(1, 1),  -- Pedro Martínez está inscrito en Matemáticas
(1, 2),  -- Pedro Martínez está inscrito en Historia
(2, 2),  -- Lucía Fernández está inscrita en Historia
(2, 3),  -- Lucía Fernández está inscrita en Ciencias
(3, 1);  -- Carlos Ruiz está inscrito en Matemáticas

----------------------------------- extensiones -----------------------------------

-- Relación Auto-referencial (Self-Referential)
-- Una tabla puede tener una relación consigo misma, conocida como relación auto-referencial.
-- Esto es útil cuando los registros dentro de una tabla tienen una relación jerárquica.

-- Ejemplo:

-- Crear la tabla `empleados` con una relación jerárquica (supervisor-subordinado)
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2),
    supervisor_id INTEGER REFERENCES empleados(id) ON DELETE SET NULL
);

-- Insertar datos
INSERT INTO empleados (nombre, salario, supervisor_id) VALUES
('Ana Pérez', 3000.00, NULL),  -- Ana Pérez es el jefe
('Luis Gómez', 2500.00, 1),    -- Luis Gómez reporta a Ana Pérez
('María López', 3200.00, 1);   -- María López reporta a Ana Pérez

-- Relación N con Datos Adicionales (Many-to-Many with Additional Attributes)
-- En algunos casos, la relación muchos a muchos incluye atributos adicionales que describen la relación entre las dos entidades. 
-- Esto se maneja mediante una tabla intermedia que no solo actúa como un conector, sino que también almacena información adicional.

-- Ejemplo:

-- Crear la tabla `proyectos`
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla `trabajadores`
CREATE TABLE trabajadores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla intermedia con atributos adicionales
CREATE TABLE trabajadores_proyectos (
    id_trabajador INTEGER REFERENCES trabajadores(id) ON DELETE CASCADE,
    id_proyecto INTEGER REFERENCES proyectos(id) ON DELETE CASCADE,
    rol VARCHAR(50),
    fecha_inicio DATE,
    PRIMARY KEY (id_trabajador, id_proyecto)
);

-- Insertar datos
INSERT INTO proyectos (nombre) VALUES
('Proyecto Alpha'),
('Proyecto Beta');

INSERT INTO trabajadores (nombre) VALUES
('Pedro Martínez'),
('Lucía Fernández');

INSERT INTO trabajadores_proyectos (id_trabajador, id_proyecto, rol, fecha_inicio) VALUES
(1, 1, 'Líder de Equipo', '2024-01-10'),
(2, 1, 'Desarrollador', '2024-01-15'),
(2, 2, 'Analista', '2024-02-01');

-- Relaciones de Agregación o Composición (Aggregation/Composition)
-- En el contexto de modelado de datos orientado a objetos o diseño de bases de datos con características más avanzadas,
-- puedes encontrar relaciones de agregación o composición. Estas relaciones representan una asociación entre entidades 
-- donde una entidad "contiene" otra. Aunque no es estrictamente un tipo de relación en SQL, 
-- se puede modelar utilizando tablas y claves foráneas.

-- Ejemplo:

-- Crear la tabla `ordenes`
CREATE TABLE ordenes (
    id SERIAL PRIMARY KEY,
    fecha DATE
);

-- Crear la tabla `articulos`
CREATE TABLE articulos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio NUMERIC(10,2)
);

-- Crear la tabla intermedia para representar la relación de composición
CREATE TABLE ordenes_articulos (
    id_orden INTEGER REFERENCES ordenes(id) ON DELETE CASCADE,
    id_articulo INTEGER REFERENCES articulos(id) ON DELETE CASCADE,
    cantidad INTEGER,
    PRIMARY KEY (id_orden, id_articulo)
);

-- Insertar datos
INSERT INTO ordenes (fecha) VALUES
('2024-09-01'),
('2024-09-02');

INSERT INTO articulos (nombre, precio) VALUES
('Laptop', 1500.00),
('Teclado', 50.00);

INSERT INTO ordenes_articulos (id_orden, id_articulo, cantidad) VALUES
(1, 1, 1),  -- 1 Laptop en la orden 1
(1, 2, 2),  -- 2 Teclados en la orden 1
(2, 1, 1);  -- 1 Laptop en la orden 2

-- Relación Jerárquica
-- Este tipo de relación se usa para representar datos que tienen una estructura jerárquica o de árbol. 
-- En bases de datos relacionales, a menudo se implementa mediante una relación auto-referencial.

-- Ejemplo:

-- Crear la tabla `categorias` con una relación jerárquica
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_padre INTEGER REFERENCES categorias(id) ON DELETE SET NULL
);

-- Insertar datos
INSERT INTO categorias (nombre, id_padre) VALUES
('Electrónica', NULL),         -- Categoría raíz
('Computadoras', 1),           -- Subcategoría de Electrónica
('Teléfonos', 1),              -- Subcategoría de Electrónica
('Laptops', 2),                -- Subcategoría de Computadoras
('Tabletas', 2);               -- Subcategoría de Computadoras

-- Relación Temporal
-- Esta relación se utiliza para modelar datos que cambian a lo largo del tiempo, como históricos o versiones de datos. 
-- A menudo se gestionan mediante el uso de tablas adicionales para almacenar datos históricos o mediante la inclusión de columnas de fecha.

-- Ejemplo:

-- Crear la tabla `empleados` con historial de cambios
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2)
);

-- Crear la tabla de historial
CREATE TABLE empleados_historial (
    id SERIAL PRIMARY KEY,
    id_empleado INTEGER REFERENCES empleados(id) ON DELETE CASCADE,
    salario NUMERIC(10,2),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Insertar datos en `empleados`
INSERT INTO empleados (nombre, salario) VALUES
('Ana Pérez', 3000.00),
('Luis Gómez', 2500.00);

-- Insertar datos en `empleados_historial`
INSERT INTO empleados_historial (id_empleado, salario, fecha_inicio, fecha_fin) VALUES
(1, 3000.00, '2024-01-01', '2024-06-30'),
(1, 3200.00, '2024-07-01', NULL),  -- Salario actual
(2, 2500.00, '2024-01-01', NULL);  -- Salario actual

-- Relación de Composición
-- En la composición, una entidad (componente) forma parte de otra entidad (agregador) y no puede existir independientemente. 
-- Es una relación más fuerte que la agregación y se usa a veces en bases de datos orientadas a objetos, pero puede ser modelada en SQL.

-- Ejemplo:

-- Crear la tabla `ordenes`
CREATE TABLE ordenes (
    id SERIAL PRIMARY KEY,
    fecha DATE
);

-- Crear la tabla `articulos` (no se puede existir sin una orden)
CREATE TABLE articulos (
    id SERIAL PRIMARY KEY,
    id_orden INTEGER NOT NULL REFERENCES ordenes(id) ON DELETE CASCADE,
    nombre VARCHAR(100),
    precio NUMERIC(10,2),
    cantidad INTEGER
);

-- Insertar datos
INSERT INTO ordenes (fecha) VALUES
('2024-09-01');

INSERT INTO articulos (id_orden, nombre, precio, cantidad) VALUES
(1, 'Laptop', 1500.00, 1),
(1, 'Teclado', 50.00, 2);

-- Relaciones de Agregación (con Datos Adicionales)
-- En la agregación, una entidad puede estar compuesta por varias otras entidades. 
-- La tabla intermedia puede tener atributos adicionales que describen la relación entre las entidades.

-- Ejemplo:

-- Crear la tabla `proyectos`
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla `trabajadores`
CREATE TABLE trabajadores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla intermedia con atributos adicionales
CREATE TABLE proyectos_trabajadores (
    id_proyecto INTEGER REFERENCES proyectos(id) ON DELETE CASCADE,
    id_trabajador INTEGER REFERENCES trabajadores(id) ON DELETE CASCADE,
    horas_trabajadas NUMERIC(10,2),
    fecha DATE,
    PRIMARY KEY (id_proyecto, id_trabajador, fecha)
);

-- Insertar datos
INSERT INTO proyectos (nombre) VALUES
('Proyecto A'),
('Proyecto B');

INSERT INTO trabajadores (nombre) VALUES
('Pedro Martínez'),
('Lucía Fernández');

INSERT INTO proyectos_trabajadores (id_proyecto, id_trabajador, horas_trabajadas, fecha) VALUES
(1, 1, 10.5, '2024-09-10'),
(1, 2, 7.0, '2024-09-10'),
(2, 2, 8.0, '2024-09-11');

-- Relaciones de Herencia (Inheritance)
-- En algunos sistemas de bases de datos, puedes modelar la herencia como en bases de datos orientadas a objetos. 
-- Aunque PostgreSQL soporta herencia de tablas, no es tan común en muchos sistemas SQL.

-- Ejemplo en PostgreSQL:

-- Crear la tabla `empleados` base
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10,2)
);

-- Crear la tabla `directores` que hereda de `empleados`
CREATE TABLE directores (
    bonus NUMERIC(10,2)
) INHERITS (empleados);

-- Insertar datos en `empleados`
INSERT INTO empleados (nombre, salario) VALUES
('Ana Pérez', 3000.00);

-- Insertar datos en `directores` (también aparece en `empleados`)
INSERT INTO directores (nombre, salario, bonus) VALUES
('Luis Gómez', 3500.00, 500.00);
