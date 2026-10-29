/* Creo la base de datos VentasTechDB */
CREATE DATABASE VentasTechDB;

-- La ponemos en uso
USE VentasTechDB;

-- Eliminamos tablas en caso que ya existan
 DROP TABLE IF EXISTS ventas;
 
 DROP TABLE IF EXISTS productos;

 DROP TABLE IF EXISTS clientes;

 DROP TABLE IF EXISTS categorias;

 /* ========================================================
            PASO 1: Crear tablas normalizadas: 
===========================================================*/
CREATE TABLE Categoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(200)
);

-- Tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) UNIQUE,
    Ciudad NVARCHAR(50),
    FechaRegistro DATE NOT NULL
);

-- Tabla Productos
CREATE TABLE Productos (
    ProductID INT PRIMARY KEY,
    NombreProducto NVARCHAR(100) NOT NULL,
    CategoriaID INT
         FOREIGN KEY REFERENCES Categoria(CategoriaID),
     Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY ,
    ClienteID INT
        FOREIGN KEY REFERENCES Clientes(ClienteID),
    ProductID INT
        FOREIGN KEY REFERENCES Productos(ProductID),
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FechaVenta DATE NOT NULL
    );


    /* ========================================================
            PASO 2: CARGAR DATOS: 
===========================================================*/
INSERT INTO Categoria (CategoriaID, NombreCategoria, Descripcion)
   VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

 INSERT INTO clientes (ClienteID, Nombre, Email, Ciudad, FechaRegistro) 
 VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

  INSERT INTO productos (ProductID, NombreProducto, CategoriaID, Precio, Stock, Activo) 
  VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);

  SET IDENTITY_INSERT Ventas ON;
  INSERT INTO Ventas (VentaID, ClienteID, ProductID, Cantidad, PrecioUnitario, FechaVenta) 
  VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');
  SET IDENTITY_INSERT Ventas OFF;


  /* ========================================================
            PASO 3: VALIDACION DE DATOS: 
===========================================================*/
  SELECT * 
  FROM Categoria;

  SELECT * 
  FROM Clientes;

  SELECT * 
  FROM Productos;

  SELECT * 
  FROM Ventas;

  