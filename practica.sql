CREATE DATABASE IF NOT EXISTS practica;
USE practica;

DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Distrito;

CREATE TABLE Distrito (
  codigo BIGINT NOT NULL,
  nombre VARCHAR(1024) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE Cliente (
  dni CHAR(8) NOT NULL,
  razon_social VARCHAR(1024) NOT NULL,
  direccion VARCHAR(1024),
  telefono VARCHAR(9),
  monto DECIMAL(10,2),
  cod_distrito BIGINT,
  PRIMARY KEY (dni),
  CHECK (monto >= 0)
);

INSERT INTO Distrito (codigo, nombre) VALUES
  (1001, 'Chimbote'),
  (1002, 'Coishco'),
  (1003, 'Huarmey');

INSERT INTO Cliente (dni, razon_social, direccion, telefono, monto, cod_distrito) VALUES
  ('47402210', 'Pepito SA', 'Av Proceres', '999888777', 30.50, 1003),
  ('47402211', 'Mitzuki SA', 'Av Regional', '999666555', 65.50, 1001),
  ('47402212', 'Intel EIRL', 'Jr Union', '999444333', 93.00, 1002);

COMMIT;
