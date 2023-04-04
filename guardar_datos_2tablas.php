<?php

$mysqli = new mysqli("aws-mysql.cqh1qzdyllnh.us-east-1.rds.amazonaws.com","yasser","Juanchacal12","test");

if($mysqli->connect_errno){
    echo "La conexión a MySQL ha fallado" . $mysqli->connect_errno;
    exit();
}

$primer_nombre = $_POST["primer_nombre"] ?? null;
$segundo_nombre = $_POST["segundo_nombre"] ?? null;
$apellido_paterno = $_POST["apellido_paterno"] ?? null;
$apellido_materno = $_POST["apellido_materno"] ?? null;
$direccion = $_POST["direccion"] ?? null;
$no_folio = $_POST["no_folio"] ?? null;
$fecha_aplicacion = $_POST["fecha_aplicacion"] ?? null;
$hora_aplicacion = $_POST["hora_aplicacion"] ?? null;
$ubicacion = $_POST["ubicacion"] ?? null;

$alumno_sql = "INSERT INTO alumno (primer_nombre, segundo_nombre, apellido_paterno, apellido_materno,direccion) VALUES('$primer_nombre','$segundo_nombre','$apellido_paterno','$apellido_materno','$direccion')";

if($mysqli->query($alumno_sql) === TRUE){
    $alumno_id = $mysqli->insert_id;
    $folio_sql = "INSERT INTO folio (no_folio, fecha_aplicacion,hora_aplicacion, ubicacion, id_alumno) VALUES('$no_folio','$fecha_aplicacion','$hora_aplicacion','$ubicacion','$alumno_id')";
    if($mysqli->query($folio_sql) === TRUE){
        echo "Registro exitoso. ";
    }


}else{
    echo "Error al registrar al alumno: " . $mysqli->error;
}

$sql = "SELECT COUNT(*) as total from alumno";
$resultado = $mysqli->query($sql);
$fila = $resultado->fetch_assoc();
$total_alumnos = $fila["total"];

echo "Total de alumnos registrados: " . $total_alumnos;

$mysqli->close();
