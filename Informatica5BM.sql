Drop Database if exists Informatica5BM;
Create Database Informatica5BM;
use Informatica5BM;

-- ---------- Entidades ----------
Create table TiposInmuebles (
    codigoTipoInmueble int auto_increment,
    nombreTipoInmueble varchar(50) not null,
    descripcion varchar(200),
	 primary key PK_codigoTipoInmueble (codigoTipoInmueble)
);


CREATE TABLE Propietarios (
    codigoPropietario int auto_increment,
    nombrePropietario varchar(100) not null,  
    telefonoPropietario varchar(20) not null,
    correoPropietario varchar(150) not null,
    direccionPropietario varchar(200),
    primary key PK_codigoPropietario (codigoPropietario)
);
-- ---------- Procedimientos Almacenados ----------
Delimiter //
Create procedure sp_AgregarTipoInmueble(
    in _nombreTipoInmueble varchar(50),
    in _descripcion varchar(200)
)
begin
    insert into TiposInmuebles(nombreTipoInmueble, descripcion)
    values(_nombreTipoInmueble, _descripcion);
end //
Delimiter ;
-- 
call sp_AgregarTipoInmueble('Casa', 'Vivienda unifamiliar');
call sp_AgregarTipoInmueble('Apartamento', 'Unidad en edificio residencial');
call sp_AgregarTipoInmueble('Local Comercial', 'Espacio para negocio');
call sp_AgregarTipoInmueble('Terreno', 'Lote para construcción');
call sp_AgregarTipoInmueble('Oficina', 'Espacio para trabajo');
call sp_AgregarTipoInmueble('Bodega', 'Almacén');
call sp_AgregarTipoInmueble('Casa de Playa', 'Vivienda en zona costera');
call sp_AgregarTipoInmueble('Casa de Campo', 'Vivienda en zona rural');
call sp_AgregarTipoInmueble('Edificio', 'Conjunto de apartamentos');
call sp_AgregarTipoInmueble('Duplex', 'Vivienda de dos plantas');

Delimiter //
create procedure sp_ListarTiposInmuebles()
begin
    select codigoTipoInmueble, nombreTipoInmueble, descripcion from TiposInmuebles;
end //
Delimiter ;
call sp_ListarTiposInmuebles();

Delimiter //
Create Procedure sp_EliminarTipoInmueble(
    in _codigoTipoInmueble int
)
begin
    set FOREIGN_KEY_CHECKS = 0;
    delete from TiposInmuebles where codigoTipoInmueble = _codigoTipoInmueble;
    select row_count() as filasEliminadas;
    set FOREIGN_KEY_CHECKS = 1;
end //
Delimiter ;

Delimiter //
Create procedure sp_BuscarTipoInmueble(
    in _codigoTipoInmueble int
)
begin
    select codigoTipoInmueble, nombreTipoInmueble, descripcion from TiposInmuebles
    where codigoTipoInmueble = _codigoTipoInmueble;
end //
Delimiter ;
call sp_BuscarTipoInmueble(1);

Delimiter //
create procedure sp_EditarTipoInmueble(
    in _codigoTipoInmueble int,
    in _nombreTipoInmueble varchar(50),
    in _descripcion varchar(200)
)
begin
    update TiposInmuebles
    set nombreTipoInmueble = _nombreTipoInmueble,
        descripcion = _descripcion
    where codigoTipoInmueble = _codigoTipoInmueble;
end //
Delimiter ;
call sp_EditarTipoInmueble(1, 'Casa Residencial', 'Vivienda unifamiliar con jardín');

--                      --------Propietarios --------
Delimiter //
Create procedure sp_AgregarPropietario(
    in _nombrePropietario varchar(100),
    in _telefonoPropietario varchar(20),
    in _correoPropietario varchar(150),
    in _direccionPropietario varchar(200)
)
begin
    insert into Propietarios(nombrePropietario, telefonoPropietario, correoPropietario, direccionPropietario)
    values(_nombrePropietario, _telefonoPropietario, _correoPropietario, _direccionPropietario);
end //
Delimiter ;

-- Llamadas de ejemplo
call sp_AgregarPropietario('Juan Pérez', '12345678', 'juan.perez@email.com', '7a Avenida 3-40, Zona 1, Guatemala');
call sp_AgregarPropietario('María López', '87654321', 'maria.lopez@email.com', 'Calle 10-25, Zona 10, Guatemala');
call sp_AgregarPropietario('Carlos Gómez', '55555555', 'carlos.gomez@email.com', 'Avenida Reforma 10-50, Zona 9');
call sp_AgregarPropietario('Ana Martínez', '66666666', 'ana.martinez@email.com', 'Calle 5-10, Zona 14');
call sp_AgregarPropietario('Luis Rodríguez', '44444444', 'luis.rodriguez@email.com', 'Boulevard Los Próceres 20-15');
call sp_AgregarPropietario('Sofía Hernández', '33333333', 'sofia.hernandez@email.com', 'Calle 15-30, Zona 5');
call sp_AgregarPropietario('Pedro Sánchez', '22222222', 'pedro.sanchez@email.com', 'Avenida 6-25, Zona 4');
call sp_AgregarPropietario('Laura García', '99999999', 'laura.garcia@email.com', 'Calle 8-12, Zona 2');
call sp_AgregarPropietario('Jorge Ramírez', '77777777', 'jorge.ramirez@email.com', 'Avenida 1-10, Zona 15');
call sp_AgregarPropietario('Isabel Castro', '11111111', 'isabel.castro@email.com', 'Calle 12-18, Zona 7');


Delimiter //
Create procedure sp_ListarPropietarios()
begin
    select codigoPropietario, nombrePropietario, telefonoPropietario, correoPropietario, direccionPropietario FROM Propietarios;
end //
Delimiter ;
call sp_ListarPropietarios();

Delimiter //
Create procedure sp_EliminarPropietario(
    in _codigoPropietario int
)
begin
    set FOREIGN_KEY_CHECKS = 0;
    delete from Propietarios where codigoPropietario = _codigoPropietario;
    select row_count() as filasEliminadas;
    set FOREIGN_KEY_CHECKS = 1;
end //
Delimiter ;

Delimiter //
create procedure sp_BuscarPropietario(
    in _codigoPropietario int
)
begin
    select codigoPropietario, nombrePropietario, telefonoPropietario, correoPropietario, direccionPropietario from Propietarios
    where codigoPropietario = _codigoPropietario;
end //
Delimiter ;
call sp_BuscarPropietario(1);

Delimiter //
create procedure sp_EditarPropietario(
    in _codigoPropietario int,
    in _nombrePropietario varchar(100),
    in _telefonoPropietario varchar(20),
    in _correoPropietario varchar(150),
    in _direccionPropietario varchar(200)
)
begin
    update Propietarios
    set nombrePropietario = _nombrePropietario,
        telefonoPropietario = _telefonoPropietario,
        correoPropietario = _correoPropietario,
        direccionPropietario = _direccionPropietario
    where codigoPropietario = _codigoPropietario;
end //
Delimiter ;
call sp_EditarPropietario(1, 'Juan Pérez López', '12345678', 'juan.perez.lopez@email.com', '7a Avenida 3-40, Zona 1, Guatemala');






