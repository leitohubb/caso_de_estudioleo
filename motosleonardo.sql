DROP DATABASE IF exists motos;
CREATE DATABASE IF NOT EXISTS motos;
USE motos;
CREATE TABLE Clientes (
  ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Correo_Electronico VARCHAR(100),
  Telefono VARCHAR(20),
  Direccion VARCHAR(150),
  Fecha_Registro DATE,
  Estado ENUM('activo', 'inactivo')
);

CREATE TABLE Motocicletas (
  ID_moto VARCHAR(8) PRIMARY KEY,
  Modelo VARCHAR(50),
  Marca VARCHAR(50),
  Año_Fabricacion YEAR,
  Tipo ENUM('deportiva', 'multiproposito', 'otra'),
  ID_Cliente INT,
  Estado ENUM('en mantenimiento', 'sin arreglo'),
  FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Servicios (
  ID_Servicio INT AUTO_INCREMENT PRIMARY KEY,
  Descripcion VARCHAR(200),
  Costo DECIMAL(10, 2),
  Duracion INT,
  Tipo_Servicio ENUM('Revision General', 'Reparacion', 'Otro'),
  Fecha_Registro DATE
);

CREATE TABLE Reservas (
  ID_Reserva INT AUTO_INCREMENT PRIMARY KEY,
  ID_Cliente INT NOT NULL,
  ID_Moto VARCHAR(8) NOT NULL,
  ID_Servicio INT NOT NULL,
  Fecha_Reserva DATE,
  Fecha_Cita DATE,
  Estado_Reserva ENUM('confirmado', 'pendiente', 'cancelada', 'completado'),
  FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
  FOREIGN KEY (ID_Moto) REFERENCES Motocicletas(ID_Moto),
  FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio)
);

CREATE TABLE Empleados (
  ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Cargo ENUM('mecanico', 'administrador'),
  ID_sucursal INT
);

CREATE TABLE Sucursales (
  ID_Sucursal INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Sucursal VARCHAR(100),
  Direccion VARCHAR(150),
  Ciudad VARCHAR(50),
  Telefono VARCHAR(20)
);

CREATE TABLE Historial (
  ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
  ID_Moto VARCHAR(8),
  ID_Servicio INT,
  ID_Empleado INT,
  Fecha_Servicio DATE,
  Descripcion_Servicio VARCHAR(250),
  FOREIGN KEY (ID_Moto) REFERENCES Motocicletas(ID_Moto),
  FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio),
  FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

INSERT INTO Clientes ( Nombre, Apellido, Correo_Electronico, Telefono, Direccion, Fecha_Registro, Estado) VALUES ( 'Juan', 'Pérez', 'juanperez@email.com', '320234567', 'Calle bosa 123', '2023-09-01', 'activo'),
( 'María', 'López', 'maria.lopez@email.com', '330234567', 'Av. cali 32c', '2023-09-02', 'activo');

INSERT INTO Motocicletas (ID_Moto, Modelo, Marca, Año_Fabricacion, Tipo, ID_Cliente, Estado) 
VALUES 
('MTU004', 'MT-07', 'Yamaha', 2021, 'multiproposito', 1, 'en mantenimiento'),
('', 'R1200GS', 'BMW', 2020, 'multiproposito', 2, 'sin arreglo');

INSERT INTO Servicios (Descripcion, Costo, Duracion, Tipo_Servicio, Fecha_Registro) 
VALUES 
('Ajuste de frenos', 100.00, 2, 'Reparacion', '2023-10-01'),
('Cambio de aceite', 50.00, 1, 'Revision General', '2023-10-02');

INSERT INTO Reservas (ID_Cliente, ID_Moto, ID_Servicio, Fecha_Reserva, Fecha_Cita, Estado_Reserva) 
VALUES 
(1, 'MTU004', 1, '2023-10-03', '2023-10-10', 'pendiente'),
(2, 'KLJ005', 2, '2023-10-04', '2023-10-11', 'confirmado');

INSERT INTO Empleados (Nombre, Apellido, Cargo, ID_Sucursal) 
VALUES 
('Nelson', 'Pérez', 'mecanico', 1),
('Laura', 'Rodríguez', 'administrador', 2);

INSERT INTO Sucursales (Nombre_Sucursal, Direccion, Ciudad, Telefono) 
VALUES 
('Sucursal sur', 'Av. de cali 123', 'Ciudad 3', '328387873'),
('Taller Norte', 'Calle del sena 45', 'Ciudad 4', '324525252');

INSERT INTO Historial (ID_Moto, ID_Servicio, ID_Empleado, Fecha_Servicio, Descripcion_Servicio) 
VALUES 
('MTU004', 1, 1, '2023-10-12', 'Ajuste de frenos completado. Todo en orden.'),
('KLJ005', 2, 2, '2023-10-13', 'Cambio de aceite realizado. Se recomienda una revisión del sistema de escape.');





