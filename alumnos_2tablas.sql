create table alumno(
    id int primary key auto_increment,
    primer_nombre varchar(50),
    segundo_nombre varchar(50),
    apellido_paterno varchar(50),
    apellido_materno varchar(50),
    direccion varchar(150)
);

create table folio(
    no_folio int primary key not null ,
    fecha_aplicacion Date,
    hora_aplicacion Time,
    ubicacion varchar(150),
    id_alumno int not null,
    foreign key (id_alumno) references alumno(id)
);
