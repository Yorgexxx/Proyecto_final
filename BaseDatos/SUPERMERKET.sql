CREATE DATABASE SUPERMERKET character set utf8mb4 collate utf8mb4_spanish_ci;
use SUPERMERKET;

create table RESIDENCIA(
id_RESI char(6) not null,
nombre_municipio varchar(40) not null,
direccion varchar(40),
primary key(id_RESI)
);
alter table RESIDENCIA
  add constraint CK_nombre_municipio_MAYUSCULA 
check (nombre = upper(nombre));

create table CATEGORIA(
id_CATE char(6) not null,
nombre_CATE VARCHAR(40) not null,
descripcion_CATE text not null,
primary key(id_CATE)
);

create table PRODUCTO(
id_PROC char(6) not null,
id_CATE char(6) not null,
descripcion_PROC varchar(50) not null,
fecha_vencimneto date not null,
precio_PROC decimal(12,2) not null,
primary key(id_PROC),
foreign key(id_CATE) references CATEGORIA(id_CATE)
);

alter table PRODUCTO
add stokmin_PROC varchar(100);

select * from PRODUCTO;

create table CLIENTE(
id_CLI char(6) not null,
id_RESI char(6) not null,
nombres_CLI varchar(40)not null,
apellidos_CLI varchar(40) not null,
edad_CLI int not null,
dirreccion_CLI varchar(40)not null,
telefono_CLI varchar(15),
correo_CLI varchar(40),
primary key(id_CLI),
foreign key(id_RESI) references RESIDENCIA(id_RESI)
on delete cascade
on update cascade
);

alter table CLIENTE
  add constraint CK_nombres_CLI_MAYUSCULA 
check (nombre = upper(nombre));

create table CARGO(
id_CARG char(6) not null,
descripcion_CARG varchar(50) not null,
nombre varchar(40) null,
primary key(id_CARG)
);

create table EMPLEADO(
id_EMPLE char(6) not null,
id_RESI char(6) not null,
id_CARG char(6) not null,
nombre_EMPLE varchar(40) not null,
apellido_EMPLE varchar(40) not null,
no_identificacion_EMPLE varchar(40) not null,
telefono_EMPLE varchar(15) not null,
correo_EMPLE varchar(40) not null,
direccion_EMPLE varchar(40) not null,
primary key(id_EMPLE),
foreign key(id_RESI) references RESIDENCIA(id_RESI),
foreign key(id_CARG) references CARGO(id_CARG)
);

create table FACTURA(
id_FACT char(6) not null,
id_CLI char(6) not null,
id_EMPLE char(6) not null,
fecha_FACT date not null,
descripcion_FACT varchar(50),
total_FACT double not null,
primary key(id_FACT),
foreign key(id_CLI) references CLIENTE(id_CLI),
foreign key(id_EMPLE) references EMPLEADO(id_EMPLE)
on delete cascade
on update cascade
);

create table CARRITO(
id_CARRI char(6) not null,
id_FACT char(6) not null,
id_PROC char(6) not null,
cantidad_CARRI int not null,
descripcion_CARRI varchar(50),
total_FACT double not null,
primary key(id_CARRI, id_FACT,id_PROC),
foreign key(id_PROC) references PRODUCTO(id_PROC),
foreign key(id_FACT) references FACTURA(id_FACT)
);

create table MARCA(
id_marca char(6) not null,
id_PROC char(6) not null,
id_CATE char(6) not null,
nombre_marca varchar(50) not null,
descripcion varchar(500) not null,
estado varchar(100) not null,
primary key(id_marca),
foreign key(id_PROC) references PRODUCTO(id_PROC),
foreign key(id_CATE) references CATEGORIA(id_CATE)
on delete cascade
on update cascade
);

create table PROOVEDORES(
id_PROOV char(6) not null,
id_RESI char(6) not null,
id_FACT char(6) not null,
id_PROC char(6) not null,
nombre_PROOV varchar(40) not null,
direccion_PROOV varchar(40) not null,
correo_PROOV varchar(40) not null,
telefono_PROOV varchar(15) not null,
descripcion_proc_PROOV text not null,
primary key(id_PROOV),
foreign key(id_RESI) references RESIDENCIA(id_RESI),
foreign key(id_FACT) references FACTURA(id_FACT),
foreign key(id_PROC) references PRODUCTO(id_PROC)
on delete cascade
on update cascade
);

show full tables from supermerket;



