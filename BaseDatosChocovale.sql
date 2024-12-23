-- Crear base de datos
CREATE DATABASE BaseDatosChocovale;
GO

-- Usar la base de datos
USE BaseDatosChocovale;
GO

-- Tabla Cliente
CREATE TABLE Cliente (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(20),
    Celular VARCHAR(20),
    Departamento VARCHAR(50),
    Distrito VARCHAR(50),
    Direccion VARCHAR(50)
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(20),
    Celular VARCHAR(20),
    Departamento VARCHAR(50),
    Distrito VARCHAR(50),
    Direccion VARCHAR(50)
);

-- Tabla Producto
CREATE TABLE Producto (
    Id INT PRIMARY KEY,
    UnidadMedida VARCHAR(20),
    Nombre VARCHAR(50),
    Costo DECIMAL(10, 2)
);

-- Tabla EmpresaEnvio
CREATE TABLE EmpresaEnvio (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Celular VARCHAR(20),
    Departamento VARCHAR(50),
    Provincia VARCHAR(50),
    Distrito VARCHAR(50),
    Direccion VARCHAR(50),
);

-- Tabla Conductor
CREATE TABLE Conductor (
    Id INT PRIMARY KEY,
    IdEmpresaEnvio INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(20),
    Celular VARCHAR(20),
    Direccion VARCHAR(50),
    Licencia VARCHAR(20),
    FOREIGN KEY (IdEmpresaEnvio) REFERENCES EmpresaEnvio(Id)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    Id INT PRIMARY KEY,
    IdEmpresaEnvio INT,
    IdConductor INT,
    Placa VARCHAR(20),
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    FOREIGN KEY (IdEmpresaEnvio) REFERENCES EmpresaEnvio(Id),
    FOREIGN KEY (IdConductor) REFERENCES Conductor(Id)
);

-- Tabla Picker
CREATE TABLE Picker (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(20),
    Celular VARCHAR(20),
    Dieccion VARCHAR(50)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    Id INT PRIMARY KEY,
    IdCliente INT,
    IdVendedor INT,
    IdEmpresaEnvio INT,
    CodigoFactura VARCHAR(50),
    CodigoBoleta VARCHAR(50),
    UnidadMedida VARCHAR(20),
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    ImporteTotal DECIMAL(10, 2),
    Fecha DATE,
    Hora TIME,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
    FOREIGN KEY (IdVendedor) REFERENCES Vendedor(Id),
    FOREIGN KEY (IdEmpresaEnvio) REFERENCES EmpresaEnvio(Id)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    Id INT PRIMARY KEY,
    IdPedido INT,
    IdCliente INT,
    IdVendedor INT,
    IdProducto INT,
    UnidadMedida VARCHAR(20),
    ModoDeEnvio VARCHAR(50),
    PrecioUnitario DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    ImporteTotal DECIMAL(10, 2),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
    FOREIGN KEY (IdVendedor) REFERENCES Vendedor(Id),
    FOREIGN KEY (IdProducto) REFERENCES Producto(Id)
);

-- Tabla PedidoProducto
CREATE TABLE PedidoProducto (
    Id INT PRIMARY KEY,
    IdPedido INT,
    IdProducto INT,
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdProducto) REFERENCES Producto(Id)
);

-- Tabla PedidoServicio
CREATE TABLE PedidoServicio (
    Id INT PRIMARY KEY,
    IdPedido INT,
    IdServicio INT,
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdServicio) REFERENCES Servicio(Id)
);

-- Tabla PedidoPicker
CREATE TABLE PedidoPicker (
    Id INT PRIMARY KEY,
    IdPedido INT,
    IdPicker INT,
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdPicker) REFERENCES Picker(Id)
);

-- Tabla BoletaElectronica
CREATE TABLE BoletaElectronica (
    Codigo INT PRIMARY KEY,
    IdPedido INT,
    IdCliente INT,
    IdVendedor INT,
    IdProducto INT,
    FechaEmision DATE,
    FechaVencimiento DATE,
    Cantidad INT,
    UnidadMedida VARCHAR(20),
    Descripcion VARCHAR(255),
    ModoEnvio VARCHAR(50),
    Lote VARCHAR(50),
    Serie VARCHAR(50),
    PrecioUnitario DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    RUC VARCHAR(20),
    OpGravadas DECIMAL(10, 2),
    IGV DECIMAL(10, 2),
    CondicionPago VARCHAR(50),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
    FOREIGN KEY (IdVendedor) REFERENCES Vendedor(Id),
    FOREIGN KEY (IdProducto) REFERENCES Producto(Id)
);

-- Tabla FacturaElectronica
CREATE TABLE FacturaElectronica (
    Codigo INT PRIMARY KEY,
    IdPedido INT,
    IdCliente INT,
    IdVendedor INT,
    IdProducto INT,
    FechaEmision DATE,
    FechaVencimiento DATE,
    Cantidad INT,
    UnidadMedida VARCHAR(20),
    Descripcion VARCHAR(255),
    ModoEnvio VARCHAR(50),
    Lote VARCHAR(50),
    Serie VARCHAR(50),
    PrecioUnitario DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    DOC_TRIB_NO_DOM_SIN_RUC VARCHAR(50),
    RUC VARCHAR(20),
    OpGravadas DECIMAL(10, 2),
    IGV DECIMAL(10, 2),
    CondicionPago VARCHAR(50),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(Id),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
    FOREIGN KEY (IdVendedor) REFERENCES Vendedor(Id),
    FOREIGN KEY (IdProducto) REFERENCES Producto(Id)
);