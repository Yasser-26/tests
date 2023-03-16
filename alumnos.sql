CREATE TABLE alumnos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  primer_nombre VARCHAR(50) NOT NULL,
  segundo_nombre VARCHAR(50),
  apellido_paterno VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  no_folio INT NOT NULL,
  fecha_aplicacion DATE NOT NULL,
  hora_aplicacion TIME NOT NULL,
  ubicacion VARCHAR(100) NOT NULL
);
