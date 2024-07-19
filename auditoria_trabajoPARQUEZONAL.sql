
use equipos;
create table equipos (
id_equipos int not null primary key,
nombre varchar (35) null,
agendado varchar (35) null,
telefono bigint null 
);

create table auditoria_equipos (
is_auditoria int not null primary key auto_increment,
nombre_copia varchar (35) null,
agendado_copia varchar (35) null,
telefono_copia int null ,
usuario varchar (35) null ,
fecha date null
);

create trigger auditoria after insert on equipos
for each row
insert into auditoria_equipos (nombre_copia, agendado_copia, telefono_copia,   usuario, fecha) 
values (new.nombre, new.agendado, new.telefono, current_user(), now())
;
insert into equipos values (1, "vista alegre", "12/07/24", 998113280);
insert into equipos values (2, "la esperanza", "20/08/24", 948854302);

select * from equipos;
select * from auditoria_equipos;
