//EJEMPLO 1

CREATE DATABASE Empresa_Discografica; 
USE Empresa_Discografica; 

CREATE TABLE Manager(
    identificador INT PRIMARY KEY,
    nombre VARCHAR(100)
); 

CREATE TABLE Artista(
    NIF VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    id_gerente INT,

    FOREIGN KEY (id_gerente)
    REFERENCES Manager(identificador)
); 

CREATE TABLE Evento(
    identificador INT PRIMARY KEY,
    fecha DATE,
    asiste VARCHAR(50)
);

CREATE TABLE Artista_Evento(
    PRIMARY KEY(id_artista,id_evento),

    id_artista VARCHAR(20),
    id_evento INT,

    FOREIGN KEY(id_artista)
    REFERENCES Artista(NIF),

    FOREIGN KEY(id_evento)
    REFERENCES Evento(identificador)
); 

//EJEMPLO 2

CREATE DATABASE Tienda_Informatica; 
USE Tienda_Informatica;  

CREATE TABLE Proveedor(
    codigo_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    provincia VARCHAR(50)
);

CREATE TABLE Producto(
    codigo_producto INT PRIMARY KEY,
    descripcion VARCHAR(200),
    numero_existencias INT,
    precio DECIMAL(10,2),

    codigo_proveedor INT,

    FOREIGN KEY(codigo_proveedor)
    REFERENCES Proveedor(codigo_proveedor)
);

CREATE TABLE Cliente(
    codigo_cliente INT PRIMARY KEY,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(100),
    provincia VARCHAR(50)
);

//EJEMPLO 3

CREATE DATABASE Discos_Musicales; 
USE Discos_Musicales;  

CREATE TABLE Cantante (
    Id_cantante INT NOT NULL,
    Nombre_cantante VARCHAR(100) NOT NULL,
    Pais VARCHAR(50),
    PRIMARY KEY (Id_cantante)
);

CREATE TABLE Disco (
    Id_disco INT NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2),
    Id_cantante INT,
    PRIMARY KEY (Id_disco),
    FOREIGN KEY (Id_cantante) REFERENCES Cantante(Id_cantante) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Cancion (
    Id_cancion INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Genero VARCHAR(50),
    PRIMARY KEY (Id_cancion)
); 

CREATE TABLE Disco_Cancion (
    Id_disco INT NOT NULL,
    Id_cancion INT NOT NULL,
    PRIMARY KEY (Id_disco, Id_cancion),
    FOREIGN KEY (Id_disco) REFERENCES Disco(Id_disco) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_cancion) REFERENCES Cancion(Id_cancion) ON DELETE CASCADE ON UPDATE CASCADE
);

//Ejemplo 4

CREATE DATABASE Camiones; 
USE Camiones;  

CREATE TABLE Provincia (
    Codigo_provincia INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (Codigo_provincia)
);

CREATE TABLE Camionero (
    Cedula VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(150),
    Salario DECIMAL(10, 2),
    PRIMARY KEY (Cedula)
);

CREATE TABLE Camion (
    Matricula VARCHAR(20) NOT NULL,
    Color VARCHAR(30),
    Modelo VARCHAR(50),
    PRIMARY KEY (Matricula)
);

CREATE TABLE Paquetes (
    Codigo_paquete INT NOT NULL,
    Descripcion TEXT,
    Destinatario VARCHAR(100),
    Direccion_Destinatario VARCHAR(150),
    Codigo_provincia INT,
    Cedula_camionero VARCHAR(20),
    PRIMARY KEY (Codigo_paquete),
    FOREIGN KEY (Codigo_provincia) REFERENCES Provincia(Codigo_provincia),
    FOREIGN KEY (Cedula_camionero) REFERENCES Camionero(Cedula
);

CREATE TABLE Camion_camionero (
    Matricula_camion VARCHAR(20) NOT NULL,
    Cedula_camionero VARCHAR(20) NOT NULL,
    PRIMARY KEY (Matricula_camion, Cedula_camionero),
    FOREIGN KEY (Matricula_camion) REFERENCES Camion(Matricula),
    FOREIGN KEY (Cedula_camionero) REFERENCES Camionero(Cedula
); 

//Ejemplo 5

CREATE TABLE Personal (
    Codigo INT NOT NULL,
    Cedula VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (Codigo)
);

CREATE TABLE Veterinario (
    Codigo_personal INT NOT NULL,
    Fecha_alta DATE,
    Especialidad VARCHAR(100),
    PRIMARY KEY (Codigo_personal),
    FOREIGN KEY (Codigo_personal) REFERENCES Personal(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Auxiliar (
    Codigo_personal INT NOT NULL,
    Base_cotizacion DECIMAL(10,2),
    PRIMARY KEY (Codigo_personal),
    FOREIGN KEY (Codigo_personal) REFERENCES Personal(Codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Propietario (
    Cedula VARCHAR(20) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Telefonos VARCHAR(50),
    Direccion VARCHAR(150),
    PRIMARY KEY (Cedula)
);

CREATE TABLE Contacto_Familiar (
    Cedula VARCHAR(20) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Cedula_propietario VARCHAR(20) UNIQUE, -- El UNIQUE asegura el 1:1
    PRIMARY KEY (Cedula),
    FOREIGN KEY (Cedula_propietario) REFERENCES Propietario(Cedula) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Mascota (
    Identificador INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Tipo VARCHAR(50),
    Fecha_nacimiento DATE,
    Cedula_propietario VARCHAR(20),
    PRIMARY KEY (Identificador),
    FOREIGN KEY (Cedula_propietario) REFERENCES Propietario(Cedula) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Veterinario_Mascota (
    Codigo_veterinario INT NOT NULL,
    Identificador_mascota INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Diagnostico TEXT,
    PRIMARY KEY (Codigo_veterinario, Identificador_mascota, Fecha),
    FOREIGN KEY (Codigo_veterinario) REFERENCES Veterinario(Codigo_personal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Identificador_mascota) REFERENCES Mascota(Identificador) ON DELETE CASCADE ON UPDATE CASCADE
); 





