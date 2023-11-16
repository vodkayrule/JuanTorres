drop table personajes cascade constraints;
drop table actores cascade constraints;
drop table planetas cascade constraints;
drop table visita cascade constraints;
drop table peliculas cascade constraints;
drop table capitulos cascade constraints;
drop table aparece cascade constraints;
drop table naves cascade constraints;

create table actores (
    id int,
    nombre_completo varchar(100),
    f_nacimiento date,
    nacionalidad varchar(50),
    id_personajes int
);
alter table actores add primary key (id);
create table personajes (
    id int, 
    raza varchar(50),
    nombre varchar(50),
    jefe int
);
alter table personajes add primary key (id);

alter table actores add foreign key(id_personajes) references personajes(id);

alter table personajes add foreign key(jefe) references personajes(id);

create table capitulos (
    orden int,
    temporada int,
    titulo varchar(50),
    fecha_de_emision date
);
alter table capitulos add primary key (orden, temporada);
create table participa (
    id int,
    temporada int,
    orden int
);

alter table participa add foreign key(id) references personajes(id);

alter table participa add foreign key(temporada, orden) references capitulos(temporada,orden);

alter table participa add primary key (orden, temporada, id);

create table planetas (
    codigo int,
    nombre varchar(100),
    galaxia varchar (50)
);
alter table planetas add primary key (codigo);
create table visita (
    temporada int,
    orden int,
    codigo int,
    problema_resuelto varchar(50),
    codigo_naves number
);    
alter table visita add foreign key(temporada, orden) references capitulos(orden, temporada);
    
alter table visita add foreign key(codigo) references planetas(codigo);

create table naves (
    codigo_naves int,
    nombre varchar(100),
    num_tripulantes number
);
alter table naves add primary key (codigo_naves);
alter table visita add foreign key(codigo_naves) references naves(codigo_naves);
alter table visita add primary key (codigo_naves,orden,temporada,codigo);

create table peliculas (
    id_pelicula int,
    director varchar (50),
    titulo varchar (50),
    anyo_lanzamiento date,
    id_personajes int
);
alter table peliculas add primary key (id_pelicula);
alter table peliculas add foreign key(id_personajes) references personajes(id);

create table aparece (
    id_pelicula int,
    id int
);
alter table aparece add foreign key(id) references personajes(id);
alter table aparece add foreign key(id_pelicula) references peliculas(id_pelicula);
alter table aparece add primary key (id_pelicula, id);

