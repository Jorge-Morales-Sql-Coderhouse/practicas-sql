-- BodegaTech
-- Autor: Jorge Morales
-- 10/18/2026

--Seccion DDL
drop table if exists inventario;
go

create table inventario(
id_producto int not null primary key,
nombre_producto varchar(100) not null,
categoria varchar(50) not null,
precio_unitario decimal(10,2),
stock_actual int not null,
stock_minimo int not null,
fecha_ingreso date not null,
activo int not null
)

--INT (en id_producto, stock actual , stock minimo & activo): Se eligió porque los identificadores suelen ser números enteros secuenciales y únicos. Además, los tipos de datos enteros son los más eficientes en SQL Server para crear índices y realizar búsquedas rápidas como clave primaria.

--DECIMAL(10,2) (en precio_unitario): Se seleccionó este tipo numérico exacto para garantizar la precisión con valores de dinero. A diferencia de tipos como FLOAT o REAL (que usan coma flotante y sufren imprecisiones de redondeo), DECIMAL(10,2) permite hasta 10 dígitos en total con exactamente 2 decimales para los centavos.

--VARCHAR(100) (en nombre_producto & Categoria): Se utilizó para almacenar cadenas de texto de longitud variable. A diferencia de CHAR, solo consume el espacio de memoria real que ocupan las letras ingresadas, y un límite de 100 caracteres da suficiente margen para nombres descriptivos sin desperdiciar almacenamiento.

--DATE (en fecha_ingreso): Se eligió porque almacena exclusivamente el año, mes y día (formato AAAA-MM-DD). Como solo interesa la fecha de ingreso y no la hora exacta, optimiza el espacio de almacenamiento consumiendo únicamente 3 bytes por registro (frente a los 8 bytes de un DATETIME).


-- Comprobacion de tabla
select * from inventario;

--seccion DML
INSERT INTO inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo) VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);
GO

select * from inventario;

-- 1. Actualizar stock de Laptop Pro 15 (id_producto = 1, -3 unidades)
UPDATE inventario
SET stock_actual = stock_actual -3
WHERE id_producto = 1;

-- 2. Actualizar stock de Mouse Inalámbrico (id_producto = 2, -12 unidades)
UPDATE inventario
SET stock_actual = stock_actual -12
WHERE id_producto = 2;

-- 3. Actualizar stock de Auriculares BT Pro (id_producto = 6, -5 unidades)
UPDATE inventario
SET stock_actual = stock_actual -5
WHERE id_producto = 6;
GO

-- Verificar cómo quedó el stock actualizado
SELECT id_producto, nombre_producto, stock_actual, stock_minimo 
FROM inventario
WHERE id_producto IN (1, 2, 6);

--Update adicional sobre la webcam cambiamos pasara a descontinuada es decir pasa de valor 1 a 0
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;
GO

-- Verificar cómo quedó el stock actualizado
SELECT id_producto, nombre_producto, activo
FROM inventario
WHERE id_producto IN (8);

select * from inventario

--



