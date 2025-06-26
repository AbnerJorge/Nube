CREATE SCHEMA IF NOT EXISTS practica;
USE practica;

-- Eliminamos tablas si existen (Spanner aún no permite DROP IF EXISTS, se simula lógicamente en SQL estándar)
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Distrito;

-- Crear tabla Distrito
CREATE TABLE Distrito (
  codigo            INT64 NOT NULL,
  nombre            STRING(1024) NOT NULL,
  CONSTRAINT distrito_pk PRIMARY KEY (codigo)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
  dni               STRING(8) NOT NULL,
  razon_social      STRING(1024) NOT NULL,
  direccion         STRING(1024),
  telefono          STRING(9),
  monto             FLOAT64,
  cod_distrito      INT64,
  CONSTRAINT cliente_pk PRIMARY KEY (dni),
  CONSTRAINT cliente_monto_ck CHECK (monto >= 0)
);

-- Insertar datos en la tabla Distrito
INSERT INTO Distrito (codigo, nombre) VALUES
  (1001, "Chimbote"),
  (1002, "Coishco"),
  (1003, "Huarmey");

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (dni, razon_social, direccion, telefono, monto, cod_distrito) VALUES
  ("47402210", "Pepito SA", "Av Proceres", "999888777", 30.5, 1003),
  ("47402211", "Mitzuki SA", "Av Regional", "999666555", 65.5, 1001),
  ("47402212", "Intel EIRL", "Jr Union", "999444333", 93.0, 1002);

COMMIT;
