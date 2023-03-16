CREATE TABLE Libro(
    IdLibro INT NOT NULL AUTO_INCREMENT,
    Titulo VARCHAR(50) NOT NULL,
    Editorial VARCHAR(50) NOT NULL,
    Area VARCHAR(50),
    PRIMARY KEY (IdLibro)
);

CREATE TABLE Autor(
    IdAutor INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50),
    PRIMARY KEY(IdAutor)
);

CREATE TABLE Estudiante(
    IdLector INT NOT NULL AUTO_INCREMENT,
    CI INT (5) NOT NULL,
    Nombre VARCHAR(100),
    Direccion VARCHAR(150),
    Carrera VARCHAR(50),
    Edad INT(5) NOT NULL,
    PRIMARY KEY(IdLector)
);

CREATE TABLE LibAut(
    IdAutor INT(10) NOT NULL,
    IdLibro INT(10) NOT NULL,
    FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor),
    FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro)
);

CREATE TABLE Prestamo(
    IdLector INT(10) NOT NULL,
    IdLibro INT(10) NOT NULL,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    Devuelto BOOLEAN,
    FOREIGN KEY (IdLector) REFERENCES Estudiante(IdLector),
    FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro)
);

START TRANSACTION;

INSERT INTO Libro(Titulo, Editorial, Area)
VALUES('Juan', 'Patito','Gestion');

INSERT INTO Libro(Titulo, Editorial, Area)
VALUES('LOTR', 'Panini','Fantasia');

INSERT INTO Libro(Titulo, Editorial, Area)
VALUES('Baldor', 'Si','Matemáticas');

INSERT INTO Autor(Nombre, Nacionalidad)
VALUES('Tolkien','Gringo');

INSERT INTO Autor(Nombre, Nacionalidad)
VALUES('Baldor','Peruano');

INSERT INTO Autor(Nombre, Nacionalidad)
VALUES('Pepe','Mexicana');

INSERT INTO Estudiante(CI, Nombre, Direccion, Carrera, Edad)
VALUES(160,'Yasser','Avenida siempre viva','Software',24);

INSERT INTO Estudiante(CI, Nombre, Direccion, Carrera, Edad)
VALUES(160,'Angel','P Sherman Calle Wallaby 42 Sidney','Informatica',18);

INSERT INTO Estudiante(CI, Nombre, Direccion, Carrera, Edad)
VALUES(160,'Antonio','Poliforum','Software',23);

INSERT INTO LibAut(IdAutor, IdLibro)
VALUES(2,1);

INSERT INTO LibAut(IdAutor, IdLibro)
VALUES(1,2);

INSERT INTO LibAut(IdAutor, IdLibro)
VALUES(2,3);

INSERT INTO Prestamo(IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto)
VALUES(1, 2, "2023-02-15", "2023-03-10", true);

INSERT INTO Prestamo(IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto)
VALUES(2, 3, "2023-03-10", "2023-03-20", false);

INSERT INTO Prestamo(IdLector, IdLibro, FechaPrestamo, FechaDevolucion, Devuelto)
VALUES(3, 1, "2023-02-16", "2023-03-12", true);

COMMIT;



---------------------------------------------------------------------------------------------------

SELECT * FROM Autor;

SELECT Nombre, Edad FROM Estudiante;

SELECT * FROM Estudiante WHERE Carrera = 'Software';

SELECT Nombre from Estudiante WHERE Nombre LIKE 'A%';

SELECT * FROM Autor WHERE Nacionalidad = 'Mexicana';

SELECT * FROM Libro WHERE Area NOT LIKE "Matemáticas";
