--Ejercicios dados por Claude AI
--Práctica consultas JOIN

DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS pedido_productos;

CREATE TABLE categorias (
  id_categoria SERIAL,
  nombre VARCHAR(50),
  PRIMARY KEY(id_categoria)
);

CREATE TABLE productos (
  id_producto SERIAL,
  id_categoria INT,
  nombre VARCHAR(100),
  precio DECIMAL(10,2),
  stock INT,

    PRIMARY KEY(id_producto),

  CONSTRAINT fk_id_categoria
  FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
  id_cliente SERIAL,
  nombre VARCHAR(100),
  email VARCHAR(100),
  ciudad VARCHAR(50),
  PRIMARY KEY(id_cliente)
);

CREATE TABLE vendedores (
  id_vendedor SERIAL,
  nombre VARCHAR(100),
  region VARCHAR(50),
  PRIMARY KEY(id_vendedor)
);

CREATE TABLE pedidos (
  id_pedido SERIAL,
  id_cliente INT,
  id_vendedor INT,
  fecha DATE,
  estado VARCHAR(20),

  PRIMARY KEY(id_pedido),

  CONSTRAINT fk_id_cliente
  FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),

  CONSTRAINT fk_id_vendedor
  FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor) 
);

CREATE TABLE pedido_productos (
  id_pedido INT,
  id_producto INT,
  cantidad INT,
  PRIMARY KEY (id_pedido, id_producto),

    CONSTRAINT fk_id_pedido
    FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_id_producto
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);
