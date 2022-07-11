-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-07-2022 a las 01:04:59
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reportes`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_delete_abogado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_abogado` (IN `_ID` INT)  BEGIN
SET @id_abogado = _ID;
SET @id_usuario = ( SELECT abogados.id_usuario FROM abogados
                  WHERE abogados.id_abogado = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM abogados WHERE id_abogado = @id_abogado;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_aseguradora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_aseguradora` (IN `_ID` INT)  BEGIN
SET @id_aseguradora = _ID;
SET @id_usuario = ( SELECT id_usuario FROM aseguradoras
                  WHERE id_aseguradora = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM aseguradoras WHERE id_aseguradora = @id_aseguradora;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_asistente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_asistente` (IN `_ID` INT)  BEGIN
SET @id_asistente = _ID;
SET @id_usuario = ( SELECT id_usuario FROM asistentes WHERE id_asistente = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM asistentes WHERE id_asistente = @id_asistente;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cliente` (IN `_ID` INT)  BEGIN
SET @id_cliente = _ID;
SET @id_usuario = ( SELECT clientes.id_usuario FROM clientes
                  WHERE clientes.id_cliente = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM clientes WHERE id_cliente = @id_cliente;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_informante`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_informante` (IN `_ID` INT)  BEGIN
SET @id_informante = _ID;
SET @id_usuario = ( SELECT id_usuario FROM informantes WHERE informantes.id_informante = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM informantes WHERE id_informante = @id_informante;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_medico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_medico` (IN `_ID` INT)  BEGIN
SET @id_medico = _ID;
SET @id_usuario = ( SELECT id_usuario FROM medicos
                  WHERE medicos.id_medico = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM medicos WHERE id_medico = @id_medico;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_proveedor` (IN `_ID` INT)  BEGIN
SET @id_proveedor = _ID;
SET @id_usuario = ( SELECT id_usuario FROM proveedores_medicos
WHERE id_proveedor = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM proveedores_medicos WHERE id_proveedor = @id_proveedor;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_referenciador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_referenciador` (IN `_ID` INT)  BEGIN
SET @id_referenciador = _ID;
SET @id_usuario = ( SELECT id_referenciador FROM referenciadores WHERE id_referenciador = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM referenciadores WHERE id_referenciador = @id_referenciador;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_reporte`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_reporte` (IN `_ID` INT)  BEGIN
UPDATE reportes SET reportes.visible = 0 
WHERE reportes.id_reporte = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_tipo_medico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tipo_medico` (IN `_ID` INT)  BEGIN
DELETE FROM tipos_medicos
WHERE tipos_medicos.id_tipo_medico = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_editar_abogado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_abogado` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT)  BEGIN
SET @id_usuario = ( SELECT abogados.id_usuario FROM abogados
WHERE abogados.id_abogado = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = @id_usuario;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_aseguradora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_aseguradora` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT, IN `_NOMBRE_ASEGURADORA` VARCHAR(500))  BEGIN
SET @id_usuario = ( SELECT aseguradoras.id_usuario FROM aseguradoras
WHERE aseguradoras.id_aseguradora = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = @id_usuario;
UPDATE aseguradoras SET aseguradoras.nombre_aseguradora = _NOMBRE_ASEGURADORA
WHERE aseguradoras.id_usuario = @id_usuario;
UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_asistente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_asistente` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT)  BEGIN
SET @id_usuario = ( SELECT asistentes.id_usuario FROM asistentes
WHERE asistentes.id_asistente = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = @id_usuario;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_cliente` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT)  BEGIN
SET @id_usuario = ( SELECT clientes.id_usuario FROM clientes
WHERE clientes.id_cliente = _ID);

UPDATE usuarios SET usuarios.usuario = _CORREO 
WHERE usuarios.id_usuario = @id_usuario;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_especialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_especialidad` (IN `_ID` INT, IN `_NOMBRE` VARCHAR(500))  BEGIN
UPDATE tipos_medicos SET nombre_tipo_medico = _NOMBRE WHERE id_tipo_medico = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_editar_informante`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_informante` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_CODIGO` VARCHAR(500), IN `_GANANCIA` VARCHAR(500), IN `_ID` INT)  BEGIN
SET @id_usuario = ( SELECT informantes.id_usuario FROM informantes
WHERE informantes.id_informante = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = _ID;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

UPDATE informantes SET informantes.codigo = _CODIGO, informantes.porcentaje_ganancia = _GANANCIA WHERE informantes.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_medico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_medico` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT, IN `_ID_PROVEEDOR` INT, IN `_ID_ESPECIALIDAD` INT)  BEGIN
SET @id_usuario = ( SELECT medicos.id_usuario FROM medicos
WHERE medicos.id_medico = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = _ID;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

UPDATE medicos SET medicos.id_proveedor = _ID_PROVEEDOR, medicos.id_tipo_medico =  _ID_ESPECIALIDAD WHERE medicos.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_proveedor` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_ID` INT, IN `_NOMBRE_PROVEEDOR` VARCHAR(500))  BEGIN
SET @id_usuario = ( SELECT proveedores_medicos.id_usuario FROM proveedores_medicos
WHERE proveedores_medicos.id_proveedor = _ID);

UPDATE usuarios SET usuarios.usuario = _USUARIO 
WHERE usuarios.id_usuario = @id_usuario;
UPDATE proveedores_medicos SET proveedores_medicos.nombre_proveedor = _NOMBRE_PROVEEDOR
WHERE proveedores_medicos.id_usuario = @id_usuario;
UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_editar_referenciador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_referenciador` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_CODIGO` VARCHAR(500), IN `_ID` INT)  BEGIN
SET @id_usuario = ( SELECT referenciadores.id_usuario FROM referenciadores
WHERE referenciadores.id_referenciador = _ID);

UPDATE usuarios SET usuarios.usuario = _CORREO 
WHERE usuarios.id_usuario = _ID;

UPDATE info_contacto SET 
info_contacto.nombre = _NOMBRE,
info_contacto.apellido_paterno = _APELLIDO_PATERNO,
info_contacto.apellido_materno = _APELLIDO_MATERNO,
info_contacto.telefono = _TEL,
info_contacto.mail = _CORREO,
info_contacto.direccion = _DIR,
info_contacto.id_ciudad = _ID_CIUDAD,
info_contacto.fax = _FAX
WHERE info_contacto.id_usuario = @id_usuario;

UPDATE referenciadores SET referenciadores.codigo = _CODIGO WHERE referenciadores.id_usuario = @id_usuario;

END$$

DROP PROCEDURE IF EXISTS `sp_insertar_abogado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_abogado` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO abogados(abogados.id_usuario)
VALUES(@ID);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_aseguradora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_aseguradora` (IN `_NOMBRE_ASEGURADORA` VARCHAR(500), IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO aseguradoras(id_usuario,nombre_aseguradora)
VALUES(@ID,_NOMBRE_ASEGURADORA);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_asistente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_asistente` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO asistentes(asistentes.id_usuario)
VALUES(@ID);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_cliente` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_CORREO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO clientes(clientes.id_usuario)
VALUES(@ID);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_especialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_especialidad` (IN `_NOMBRE` VARCHAR(500))  BEGIN
INSERT INTO tipos_medicos(nombre_tipo_medico)
VALUES(_NOMBRE);
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_informante`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_informante` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), IN `_CODIGO` VARCHAR(500), IN `_GANANCIA` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO informantes(id_usuario,codigo,porcentaje_ganancia)
VALUES(@ID,_CODIGO,_GANANCIA);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_medico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_medico` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), IN `_ID_ASEGURADORA` INT, IN `_ID_ESPECIALIDAD` INT, OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO medicos(id_proveedor,id_usuario,id_tipo_medico)
VALUES(_ID_ASEGURADORA,@ID,_ID_ESPECIALIDAD);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_proveedor` (IN `_NOMBRE_PROVEEDOR` VARCHAR(500), IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO proveedores_medicos(id_usuario,nombre_proveedor)
VALUES(@ID,_NOMBRE_PROVEEDOR);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_referenciador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_referenciador` (IN `_NOMBRE` VARCHAR(500), IN `_APELLIDO_PATERNO` VARCHAR(500), IN `_APELLIDO_MATERNO` VARCHAR(500), IN `_TEL` VARCHAR(20), IN `_CORREO` VARCHAR(500), IN `_DIR` VARCHAR(500), IN `_ID_CIUDAD` INT, IN `_FAX` VARCHAR(50), IN `_USUARIO` VARCHAR(500), IN `_PASS` VARCHAR(500), IN `_CODIGO` VARCHAR(500), OUT `_ID` INT)  BEGIN

SET @ID = _ID;

INSERT INTO usuarios(usuario,usuarios.password,id_estado_usuario)
VALUES(_CORREO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO referenciadores(referenciadores.id_usuario,referenciadores.codigo)
VALUES(@ID,_CODIGO);
SET _ID = @ID;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_reporte`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_reporte` (IN `_ID_CLIENTE` INT, IN `_FECHA` DATE, IN `_HORA` TIME, IN `_CIUDAD` INT, IN `_COMENTARIOS` VARCHAR(500), IN `_REF` VARCHAR(500), IN `_TIPO` VARCHAR(500), IN `_ESTADO` VARCHAR(500), IN `_ID_ABOGADO` INT, IN `_ID_ASISTENTE` INT, IN `_POLIZA` VARCHAR(500), IN `_ID_ASEGURADORA` INT, IN `_REPORTE` VARCHAR(500), IN `_RECLAMO` VARCHAR(500))  BEGIN
INSERT INTO reportes(
    reportes.fecha_reporte,
    reportes.fecha_accidente,
    reportes.id_cliente,
    reportes.id_ciudad,
    reportes.hora_accidente,
    reportes.comentarios,
    reportes.referenciado,
    reportes.tipo,
    reportes.status,
    reportes.id_abogado,
    reportes.id_asistente,
    reportes.numero_poliza,
    reportes.id_aseguradora,
    reportes.reporte_policia,
    reportes.numero_reclamo
)
VALUES(
    NOW(),
    _FECHA,
    _ID_CLIENTE,
    _CIUDAD,
    _HORA,
    _COMENTARIOS,
    _REF,
    _TIPO,
    _ESTADO,
    _ID_ABOGADO,
    _ID_ASISTENTE,
    _POLIZA,
    _ID_ASEGURADORA,
    _REPORTE,
    _RECLAMO
);
END$$

DROP PROCEDURE IF EXISTS `sp_select_abogado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_abogado` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario
FROM abogados
INNER JOIN usuarios ON usuarios.id_usuario = abogados.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE abogados.id_abogado = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_abogados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_abogados` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,abogados.id_abogado
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN abogados ON abogados.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_aseguradora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_aseguradora` (IN `_ID` INT)  BEGIN
SELECT aseguradoras.nombre_aseguradora,
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario
FROM aseguradoras
INNER JOIN usuarios ON usuarios.id_usuario = aseguradoras.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE aseguradoras.id_aseguradora = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_aseguradoras`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_aseguradoras` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,aseguradoras.id_aseguradora,aseguradoras.nombre_aseguradora
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN aseguradoras ON aseguradoras.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_asistente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_asistente` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario
FROM asistentes
INNER JOIN usuarios ON usuarios.id_usuario = asistentes.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE asistentes.id_asistente = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_asistentes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_asistentes` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,asistentes.id_asistente
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN asistentes ON asistentes.id_usuario =
usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_cliente` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario
FROM clientes
INNER JOIN usuarios ON usuarios.id_usuario = clientes.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE clientes.id_cliente = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_clientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_clientes` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,clientes.id_cliente
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN clientes ON clientes.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_especialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_especialidad` (IN `_ID` INT)  BEGIN
SELECT id_tipo_medico,nombre_tipo_medico
FROM tipos_medicos WHERE id_tipo_medico = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_especialidades`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_especialidades` ()  BEGIN
SELECT id_tipo_medico,nombre_tipo_medico
FROM tipos_medicos;
END$$

DROP PROCEDURE IF EXISTS `sp_select_informante`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_informante` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario,
informantes.codigo,informantes.porcentaje_ganancia
FROM informantes
INNER JOIN usuarios ON usuarios.id_usuario = informantes.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE informantes.id_informante = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_informantes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_informantes` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,informantes.id_informante
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN informantes ON informantes.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_medico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_medico` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario,
id_proveedor,id_tipo_medico
FROM medicos
INNER JOIN usuarios ON usuarios.id_usuario = medicos.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE medicos.id_medico = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_medicos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_medicos` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,medicos.id_medico,medicos.id_proveedor,medicos.id_tipo_medico
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN medicos ON medicos.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_proveedor` (IN `_ID` INT)  BEGIN
SELECT proveedores_medicos.nombre_proveedor,
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario
FROM proveedores_medicos
INNER JOIN usuarios ON usuarios.id_usuario = proveedores_medicos.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE proveedores_medicos.id_proveedor = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_proveedores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_proveedores` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,proveedores_medicos.id_proveedor,proveedores_medicos.nombre_proveedor
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN proveedores_medicos ON proveedores_medicos.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_referenciador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_referenciador` (IN `_ID` INT)  BEGIN
SELECT 
info_contacto.nombre,info_contacto.apellido_paterno,
info_contacto.apellido_materno,info_contacto.telefono,
info_contacto.mail,info_contacto.direccion,
info_contacto.id_ciudad,info_contacto.fax,usuarios.usuario,
referenciadores.codigo
FROM referenciadores
INNER JOIN usuarios ON usuarios.id_usuario = referenciadores.id_usuario
INNER JOIN info_contacto ON info_contacto.id_usuario = usuarios.id_usuario
WHERE referenciadores.id_referenciador = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_referenciadores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_referenciadores` ()  BEGIN
SELECT info_contacto.id_info_contacto,info_contacto.nombre,
info_contacto.apellido_paterno,info_contacto.apellido_materno,
info_contacto.telefono,info_contacto.mail,
info_contacto.direccion,info_contacto.id_ciudad,
info_contacto.fax,referenciadores.id_referenciador,
referenciadores.codigo
FROM info_contacto
INNER JOIN usuarios ON usuarios.id_usuario = info_contacto.id_usuario
INNER JOIN referenciadores ON referenciadores.id_usuario = usuarios.id_usuario;
END$$

DROP PROCEDURE IF EXISTS `sp_select_reporte`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_reporte` (IN `_ID` INT)  BEGIN
SELECT
reportes.id_reporte,
reportes.fecha_reporte,
reportes.fecha_accidente,
FN_NOMBRE_CLIENTE(reportes.id_cliente),
reportes.id_ciudad,
reportes.hora_accidente,
reportes.estado,
reportes.comentarios,
reportes.referenciado,
reportes.tipo,
reportes.status,
reportes.id_abogado,
reportes.id_asistente,
reportes.numero_poliza,
reportes.id_aseguradora,
reportes.reporte_policia,
reportes.numero_reclamo,
FN_NOMBRE_ABOGADO(reportes.id_abogado) as 'nombre_abogado',
FN_NOMBRE_ASISTENTE(reportes.id_asistente) as 'nombre_asistente',
FN_NOMBRE_ASEGURADORA(reportes.id_aseguradora) as 'nombre_aseguradora',
reportes.id_cliente
FROM reportes
WHERE reportes.id_reporte = _ID;
END$$

DROP PROCEDURE IF EXISTS `sp_select_reportes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_reportes` ()  BEGIN
SELECT
reportes.id_reporte,
reportes.fecha_reporte,
reportes.fecha_accidente,
FN_NOMBRE_CLIENTE(reportes.id_cliente),
reportes.id_ciudad,
reportes.hora_accidente,
reportes.estado,
reportes.comentarios,
reportes.referenciado,
reportes.tipo,
reportes.status,
FN_NOMBRE_ABOGADO(reportes.id_abogado),
FN_NOMBRE_ASISTENTE(reportes.id_asistente),
reportes.numero_poliza,
FN_NOMBRE_ASEGURADORA(reportes.id_aseguradora),
reportes.reporte_policia,
reportes.numero_reclamo
FROM reportes
WHERE reportes.visible = 1;
END$$

DROP PROCEDURE IF EXISTS `sp_select_tipos_medicos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_tipos_medicos` ()  BEGIN
SELECT id_tipo_medico,nombre_tipo_medico
FROM tipos_medicos;
END$$

DROP PROCEDURE IF EXISTS `sp_select_usuario_login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_usuario_login` (IN `_USUARIO` VARCHAR(500))  BEGIN
SELECT 
usuarios.id_usuario,usuarios.usuario,usuarios.password,usuarios.id_estado_usuario
FROM usuarios 
WHERE usuarios.usuario = _USUARIO;
END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `FN_NOMBRE_ABOGADO`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NOMBRE_ABOGADO` (`_ID` INT(11)) RETURNS VARCHAR(500) CHARSET latin1 BEGIN
SET @NOMBRE = (SELECT info_contacto.nombre FROM abogados
INNER JOIN info_contacto ON info_contacto.id_usuario = abogados.id_usuario
WHERE abogados.id_abogado = _ID);
RETURN @NOMBRE;
END$$

DROP FUNCTION IF EXISTS `FN_NOMBRE_ASEGURADORA`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NOMBRE_ASEGURADORA` (`_ID` INT(11)) RETURNS VARCHAR(500) CHARSET latin1 BEGIN
SET @NOMBRE = (SELECT aseguradoras.nombre_aseguradora FROM aseguradoras WHERE aseguradoras.id_aseguradora = _ID);
RETURN @NOMBRE;
END$$

DROP FUNCTION IF EXISTS `FN_NOMBRE_ASISTENTE`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NOMBRE_ASISTENTE` (`_ID` INT(11)) RETURNS VARCHAR(500) CHARSET latin1 BEGIN
SET @NOMBRE = (SELECT info_contacto.nombre FROM asistentes
INNER JOIN info_contacto ON info_contacto.id_usuario = asistentes.id_usuario
WHERE asistentes.id_asistente = _ID);
RETURN @NOMBRE;
END$$

DROP FUNCTION IF EXISTS `FN_NOMBRE_CLIENTE`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_NOMBRE_CLIENTE` (`_ID` INT(11)) RETURNS VARCHAR(500) CHARSET latin1 BEGIN
SET @NOMBRE = (SELECT info_contacto.nombre FROM clientes
INNER JOIN info_contacto ON info_contacto.id_usuario = clientes.id_usuario
WHERE clientes.id_cliente = _ID);
RETURN @NOMBRE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abogados`
--

DROP TABLE IF EXISTS `abogados`;
CREATE TABLE IF NOT EXISTS `abogados` (
  `id_abogado` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_abogado`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abogados`
--

INSERT INTO `abogados` (`id_abogado`, `id_usuario`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afectados`
--

DROP TABLE IF EXISTS `afectados`;
CREATE TABLE IF NOT EXISTS `afectados` (
  `id_afectado` int(11) NOT NULL AUTO_INCREMENT,
  `id_reporte` int(11) NOT NULL,
  PRIMARY KEY (`id_afectado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aseguradoras`
--

DROP TABLE IF EXISTS `aseguradoras`;
CREATE TABLE IF NOT EXISTS `aseguradoras` (
  `id_aseguradora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_aseguradora` varchar(500) NOT NULL,
  PRIMARY KEY (`id_aseguradora`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aseguradoras`
--

INSERT INTO `aseguradoras` (`id_aseguradora`, `id_usuario`, `nombre_aseguradora`) VALUES
(1, 7, 'aseg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
CREATE TABLE IF NOT EXISTS `asistentes` (
  `id_asistente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_asistente`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistentes`
--

INSERT INTO `asistentes` (`id_asistente`, `id_usuario`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_reporte`
--

DROP TABLE IF EXISTS `estados_reporte`;
CREATE TABLE IF NOT EXISTS `estados_reporte` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(500) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_reporte`
--

INSERT INTO `estados_reporte` (`id_estado`, `info`) VALUES
(1, 'En proceso'),
(2, 'Enviado a pase medico'),
(3, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informantes`
--

DROP TABLE IF EXISTS `informantes`;
CREATE TABLE IF NOT EXISTS `informantes` (
  `id_informante` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `codigo` varchar(500) NOT NULL,
  `porcentaje_ganancia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_informante`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informantes`
--

INSERT INTO `informantes` (`id_informante`, `id_usuario`, `codigo`, `porcentaje_ganancia`) VALUES
(1, 4, '123', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_contacto`
--

DROP TABLE IF EXISTS `info_contacto`;
CREATE TABLE IF NOT EXISTS `info_contacto` (
  `id_info_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `apellido_paterno` varchar(500) NOT NULL,
  `apellido_materno` varchar(500) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `mail` varchar(500) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `fax` varchar(500) NOT NULL,
  PRIMARY KEY (`id_info_contacto`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `info_contacto`
--

INSERT INTO `info_contacto` (`id_info_contacto`, `id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `mail`, `direccion`, `id_ciudad`, `fax`) VALUES
(1, 2, 'Gabriel', 'Vallejo', 'San Miguel', '8781383809', 'gabrielvallejo2000@gmail.com', 'Sin Valor', 1, 'Sin Valor'),
(2, 3, 'Invest', 'ap', 'apm', '12312', 'asd', 'Sin Valor', 1, 'Sin Valor'),
(3, 4, 'info', '123', '123', '1', 'Sin Valor', 'Sin Valor', 2, 'Sin Valor'),
(4, 5, 'asd', 'da', 'das', '123', 'asd', 'asd', 2, '123'),
(5, 6, 'asd', 'asd', 'asd', '123', 'asd', 'Sin Valor', 1, '123'),
(6, 7, 'Sin Valor', 'Sin Valor', 'Sin Valor', '123', 'Sin Valor', 'Sin Valor', 0, 'Sin Valor'),
(7, 8, 'Sin Valor', 'Sin Valor', 'Sin Valor', '123', 'asd', '123', 1, 'Sin Valor'),
(8, 9, 'test', 'asd', 'ads', '123', 'asd', 'asd', 1, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_medico` int(11) NOT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `id_proveedor`, `id_usuario`, `id_tipo_medico`) VALUES
(1, 1, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_medicos`
--

DROP TABLE IF EXISTS `proveedores_medicos`;
CREATE TABLE IF NOT EXISTS `proveedores_medicos` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_proveedor` varchar(500) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_medicos`
--

INSERT INTO `proveedores_medicos` (`id_proveedor`, `id_usuario`, `nombre_proveedor`) VALUES
(1, 8, 'asd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciadores`
--

DROP TABLE IF EXISTS `referenciadores`;
CREATE TABLE IF NOT EXISTS `referenciadores` (
  `id_referenciador` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  PRIMARY KEY (`id_referenciador`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referenciadores`
--

INSERT INTO `referenciadores` (`id_referenciador`, `id_usuario`, `codigo`) VALUES
(1, 3, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciados`
--

DROP TABLE IF EXISTS `referenciados`;
CREATE TABLE IF NOT EXISTS `referenciados` (
  `id_referenciado` int(11) NOT NULL AUTO_INCREMENT,
  `id_referenciador` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_referenciado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

DROP TABLE IF EXISTS `reportes`;
CREATE TABLE IF NOT EXISTS `reportes` (
  `id_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reporte` datetime NOT NULL,
  `fecha_accidente` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `hora_accidente` time NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '0',
  `comentarios` varchar(500) NOT NULL,
  `referenciado` varchar(500) NOT NULL,
  `tipo` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL,
  `id_abogado` int(11) NOT NULL,
  `id_asistente` int(11) NOT NULL,
  `numero_poliza` varchar(500) NOT NULL,
  `id_aseguradora` int(11) NOT NULL,
  `reporte_policia` varchar(500) NOT NULL,
  `numero_reclamo` varchar(500) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_reporte`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `fecha_reporte`, `fecha_accidente`, `id_cliente`, `id_ciudad`, `hora_accidente`, `estado`, `comentarios`, `referenciado`, `tipo`, `status`, `id_abogado`, `id_asistente`, `numero_poliza`, `id_aseguradora`, `reporte_policia`, `numero_reclamo`, `visible`) VALUES
(1, '2022-07-10 19:35:04', '2022-07-11', 1, 1, '00:34:00', 0, 'asd', 'Calle', 'Comercio', 'Proceso', 4, 5, 'asd', 6, '123', '213', 0),
(2, '2022-07-10 19:40:54', '2022-07-11', 1, 1, '00:40:00', 0, 'asd', 'Calle', 'Comercio', 'Proceso', 4, 5, '123', 1, '123', '123', 0),
(3, '2022-07-10 19:53:36', '2022-07-11', 1, 1, '00:53:00', 0, 'asd', 'Calle', 'Comercio', 'Proceso', 1, 1, '123', 1, '213', '123', 0),
(4, '2022-07-10 19:54:12', '2022-07-11', 1, 1, '00:54:00', 0, ' ', 'Calle', 'Comercio', 'Proceso', 1, 1, ' ', 1, ' ', ' ', 0),
(5, '2022-07-10 20:04:15', '2022-07-11', 1, 1, '01:04:00', 0, ' ', 'Calle', 'Comercio', 'Proceso', 1, 1, ' ', 1, ' ', ' ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_medicos`
--

DROP TABLE IF EXISTS `tipos_medicos`;
CREATE TABLE IF NOT EXISTS `tipos_medicos` (
  `id_tipo_medico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_medico` varchar(500) NOT NULL,
  PRIMARY KEY (`id_tipo_medico`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipos_medicos`
--

INSERT INTO `tipos_medicos` (`id_tipo_medico`, `nombre_tipo_medico`) VALUES
(1, 'Alergología'),
(2, 'Anestesiología y reanimación'),
(3, 'Aparato digestivo'),
(4, 'Cardiología'),
(5, 'Endocrinología y nutrición'),
(6, 'Geriatría'),
(7, 'Hematología y hemoterapia'),
(8, 'Medicina de la educación física y del deporte'),
(9, 'Medicina espacial'),
(10, 'Medicina intensiva'),
(11, 'Medicina interna'),
(12, 'Medicina legal y forense'),
(13, 'Medicina preventiva y salud pública'),
(14, 'Medicina del trabajo'),
(15, 'Nefrología'),
(16, 'Neumología'),
(17, 'Neurología'),
(18, 'Neurofisiología Clínica'),
(19, 'Oncología médica'),
(20, 'Oncología radioterápica'),
(21, 'Pediatría'),
(22, 'Psiquiatría'),
(23, 'Rehabilitación'),
(24, 'Reumatología'),
(25, 'Medicina familiar y comunitaria'),
(26, 'Cirugía cardiovascular'),
(27, 'Cirugía general y del aparato digestivo'),
(28, 'Cirugía oral y maxilofacial'),
(29, 'Cirugía ortopédica y traumatología'),
(30, 'Cirugía pediátrica'),
(31, 'Cirugía plástica, estética y reparadora'),
(32, 'Cirugía torácica'),
(33, 'Neurocirugía'),
(34, 'Angiología y cirugía vascular'),
(35, 'Dermatología médico-quirúrgica y venereología'),
(36, 'Obstetricia y ginecología'),
(37, 'Oftalmología'),
(38, 'Otorrinolaringología'),
(39, 'Urología'),
(40, 'Análisis clínicos'),
(41, 'Anatomía patológica'),
(42, 'Bioquímica clínica'),
(43, 'Farmacología clínica'),
(44, 'Inmunología'),
(45, 'Medicina nuclear'),
(46, 'Microbiología y parasitología'),
(47, 'Neurofisiología clínica'),
(48, 'Radiodiagnóstico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_estado_usuario` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `id_estado_usuario`) VALUES
(1, 'ADMIN', '$2y$10$SIVolPK0pN78NLtuHP1UiOstMJhjQhNB7Fw0DNA/ocuti7kLo9Vl6', 1),
(2, 'gabrielvallejo2000@gmail.com', '$2y$10$iVY8m2oRC91/teEdHUndMOZsDLmAxSdubgVV9Mw1sCWTjK/lc154y', 1),
(3, 'asd', '$2y$10$CszPFK7odk71SYsFcS3BBuouEKa3LmCAWiP5Dog7B5ixiGYMUkaoW', 1),
(4, 'i_1230116', '$2y$10$nGm3GXNlwqi7Kb5RaGlOWeBUOofHn/OcKVlh60JjCMTKXjy0QRd32', 1),
(5, 'a_da4816123', '$2y$10$V1cgUUsNtUphg0GDQMWpV.jXASJvSgM5VrxmFB1g6FN3Z59jTnx3u', 1),
(6, 'a_asd3716', '$2y$10$kxm03vI7r742.nO/g/fwQulei8/dnqcAgE32VE2FyDlJy0jo.osXq', 1),
(7, 'Sin Valor', '$2y$10$juKmrK3uBpTeKLEYCLlhluXkWBKoJQOb2.kRoe.ozW3KjrYRnmJQK', 1),
(8, 'Sin Valor', '$2y$10$te1LI8pIg/UJ/cI4FTUueOtmYVgmliWD8m3owJrB73ZUOVEmkd6pW', 1),
(9, 't_asd5816asd', '$2y$10$XVERvtsIp99FVkcjwX.9nOCihZFRzJrprz9E7GqXA6EJ0tE4ACowG', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
