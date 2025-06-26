CREATE SCHEMA IF NOT EXISTS practica;
use practica;
CREATE TABLE
  Cliente ( dni STRING(8) NOT NULL,
    razon_social STRING(1024),
    direccion STRING(1024),
    telefono STRING(9),
    monto FLOAT64,
    cod_distrito INT64,
    )
PRIMARY KEY
  (dni);
CREATE TABLE
  Distrito ( codigo INT64 NOT NULL,
    nombre STRING(1024),
    )
PRIMARY KEY
  (codigo);
ALTER TABLE
  Cliente
ADD CONSTRAINT
  fk_cliente_distrito
FOREIGN KEY
  (cod_distrito)
REFERENCES
  Distrito(codigo);

INSERT INTO
  Distrito (codigo,
    nombre)
VALUES
  (1001, -- type: INT64
    "Chimbote" -- type: STRING(1024)
    ),
    (1002, -- type: INT64
    "Coishco" -- type: STRING(1024)
    ),
    (1003, -- type: INT64
    "Huarmey" -- type: STRING(1024)
    )
THEN RETURN
  codigo,
  nombre;

INSERT INTO
  Cliente (cod_distrito,
    dni,
    razon_social,
    direccion,
    telefono,
    monto)
VALUES
  (1003, -- type: INT64
    "47402210", -- type: STRING(8)
    "Pepito SA", -- type: STRING(1024)
    "Av Proceres", -- type: STRING(1024)
    "999888777", -- type: STRING(9)
    30.5 -- type: FLOAT64
    ),
    (1001, -- type: INT64
    "47402211", -- type: STRING(8)
    "Mitzuki SA", -- type: STRING(1024)
    "Av Regional", -- type: STRING(1024)
    "999666555", -- type: STRING(9)
    65.5 -- type: FLOAT64
    ),
    (1002, -- type: INT64
    "47402212", -- type: STRING(8)
    "Intel EIRL", -- type: STRING(1024)
    "Jr Union", -- type: STRING(1024)
    "999444333", -- type: STRING(9)
    93.0 -- type: FLOAT64
    )
THEN RETURN
  cod_distrito,
  dni,
  razon_social,
  direccion,
  telefono,
  monto;
COMMIT;