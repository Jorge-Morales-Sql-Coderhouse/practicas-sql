-- Script de diseño de base de datos para tienda en línea
-- Módulo 2 - Unidad 1: Definición de tablas (DDL)

-- 1. Tabla de clientes
create table clientes (
id_cliente int primary key,
nombre varchar(100) not null,
perfil_bio text,
fecha_registro date not null
);


-- Comentarios de tipos de datos en CLIENTES:
-- id_cliente: INT se utiliza para un número entero único que identifica a cada cliente (Clave Primaria).
-- nombre: VARCHAR(100) es ideal para nombres de personas, limitando a 100 caracteres para optimizar espacio y mantener integridad.
-- perfil_bio: TEXT permite almacenar textos largos sin un límite estricto de caracteres para biografías o notas extensas.
-- fecha_registro: DATE se selecciona porque solo necesitamos almacenar la fecha (año, mes, día) en que el cliente se registró, sin requerir hora exacta.

-- 2. Tabla de productos
Create table productos (
id_producto int primary key,
descripcion varchar(255) not null,
precio decimal(10,2) not null,
esta_activo smallint not null
);

-- Comentarios de tipos de datos en PRODUCTOS:
-- id_producto: INT como identificador numérico entero único para cada producto (Clave Primaria).
-- descripcion: VARCHAR(255) permite una descripción detallada del producto con un límite razonable para índices.
-- precio: DECIMAL(10, 2) es obligatorio para datos monetarios; soporta hasta 10 dígitos en total con exactamente 2 decimales, evitando los errores de redondeo típicos de FLOAT.
-- esta_activo: SMALLINT (o BOOLEAN según el motor) se usa como indicador de estado numérico pequeño (ej. 1 para activo, 0 para inactivo) para representar si el producto está a la venta.