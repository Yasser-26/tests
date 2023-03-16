<?php
// Conexión a la base de datos
$mysqli = new mysqli("localhost", "yasser", "Juanchacal12", "ito");

// Verificar la conexión
if ($mysqli->connect_errno) {
	echo "Falló la conexión a MySQL: " . $mysqli->connect_error;
	exit();
}

// Obtener los valores del formulario
$primer_nombre = $_POST["primer_nombre"];
$segundo_nombre = $_POST["segundo_nombre"];
$apellido_paterno = $_POST["apellido_paterno"];
$apellido_materno = $_POST["apellido_materno"];
$direccion = $_POST["direccion"];
$folio = $_POST["folio"];
$fecha = $_POST["fecha"];
$hora = $_POST["hora"];
$ubicacion = $_POST["ubicacion"];

// Insertar los valores en la base de datos
$sql = "INSERT INTO alumnos (primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, direccion, no_folio, fecha_aplicacion, hora_aplicacion, ubicacion) VALUES ('$primer_nombre', '$segundo_nombre', '$apellido_paterno', '$apellido_materno', '$direccion', '$folio', '$fecha', '$hora', '$ubicacion')";

if ($mysqli->query($sql) === TRUE) {
	echo "Registro exitoso";
} else {
	echo "Error al registrar el alumno: " . $mysqli->error;
}

// Obtener el total de alumnos registrados
$sql = "SELECT COUNT(*) as total FROM alumnos";
$resultado = $mysqli->query($sql);
$fila = $resultado->fetch_assoc();
$total_alumnos = $fila["total"];

echo "Total de alumnos registrados: " . $total_alumnos;

// Cerrar la conexión a la base de datos
$mysqli->close();
?>
