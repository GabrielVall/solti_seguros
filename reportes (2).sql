-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-06-2022 a las 20:04:27
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
VALUES(_USUARIO,_PASS,1);

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
VALUES(_USUARIO,_PASS,1);

SET @ID = @@IDENTITY;

INSERT INTO info_contacto(id_usuario,nombre,
apellido_paterno,apellido_materno,telefono,mail,direccion,id_ciudad,fax)
VALUES(@ID,_NOMBRE,_APELLIDO_PATERNO,_APELLIDO_MATERNO,_TEL,_CORREO,
_DIR,_ID_CIUDAD,_FAX);

INSERT INTO referenciadores(referenciadores.id_usuario,referenciadores.codigo)
VALUES(@ID,_CODIGO);
SET _ID = @ID;
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
info_contacto.fax,aseguradoras.id_aseguradora
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

DROP PROCEDURE IF EXISTS `sp_select_reportes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_reportes` ()  BEGIN
SELECT * FROM reportes;
END$$

DROP PROCEDURE IF EXISTS `sp_select_tipos_medicos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_tipos_medicos` ()  BEGIN
SELECT id_tipo_medico,nombre_tipo_medico
FROM tipos_medicos;
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abogados`
--

INSERT INTO `abogados` (`id_abogado`, `id_usuario`) VALUES
(14, 38);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aseguradoras`
--

INSERT INTO `aseguradoras` (`id_aseguradora`, `id_usuario`, `nombre_aseguradora`) VALUES
(2, 42, 'Aseguradora 1'),
(3, 44, 'asd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
CREATE TABLE IF NOT EXISTS `asistentes` (
  `id_asistente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_asistente`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistentes`
--

INSERT INTO `asistentes` (`id_asistente`, `id_usuario`) VALUES
(9, 39),
(10, 40);

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
(1, 62);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informantes`
--

INSERT INTO `informantes` (`id_informante`, `id_usuario`, `codigo`, `porcentaje_ganancia`) VALUES
(2, 64, '123', '15');

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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `info_contacto`
--

INSERT INTO `info_contacto` (`id_info_contacto`, `id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `mail`, `direccion`, `id_ciudad`, `fax`) VALUES
(46, 46, 'test2', 'kjh', 'kj', '123', 'ads', 'asd', 1, '2314'),
(48, 48, 'ref delete', 'fgd', 'gf', 'dgf', 'dfg', 'd', 1, '213'),
(38, 38, 'Abogado 1 Edit2', 'Abogado Apellido Paterno', 'Abogado Apellido Materno', '8781231233', 'abogado1@correo.com', 'abogado 1 direccion', 1, '123 123 132'),
(9, 9, 'asd22', 'asd', 'asd', '123', 'ad', 'asd', 1, '2132'),
(12, 12, 'asd33', 'asd', 'asad', 'das', 'das', 'asd', 1, 'asd'),
(39, 39, 'Asistente12', 'Asistente1 Apellido P', 'Asistente1 Apellido M', '87123123', 'asistente1@correo.com', 'asd', 1, 'asd'),
(40, 40, 'test', 'jgf', 'jhg', 'jhg', 'jhg', 'jhg', 1, '586'),
(42, 42, 'N aseg 1', 'a p aseg 1', 'a m aseg 1', '878', 'aseg1@aseg.com', 'asd', 1, '132213'),
(43, 43, 'Cliente2', 'asd', 'ad', '123', 'asd', 'ads', 1, '123'),
(44, 44, 'asd', 'asd', 'asd', '213', 'asd', 'ads', 1, '123'),
(47, 47, 'ref12', 'asd', 'jhg', 'jhg', 'hjg', 'jhg', 1, '213'),
(26, 26, 'asd', 'asd', 'asd', '213', 'asd', 'asd', 1, '213'),
(62, 62, 'Gabriel', 'Vallejo', 'San Miguel', '8781383809', 'gabrielvallejo2000@gmail.com', 'Francisco coss 1187 Real del Norte', 350, '123456789'),
(64, 64, 'asd', 'das', 'asd', '123', 'asd', '123', 3, '123'),
(60, 60, 'asd', 'asd', 'asd', '123', 'asd', 'asd', 1, '1234'),
(55, 55, 'ref2w2', 'sasd', 'das', '213', 'ads', 'ads', 1, '231');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `id_proveedor`, `id_usuario`, `id_tipo_medico`) VALUES
(2, 1, 60, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_medicos`
--

INSERT INTO `proveedores_medicos` (`id_proveedor`, `id_usuario`, `nombre_proveedor`) VALUES
(1, 46, 'proveedor nombre');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referenciadores`
--

INSERT INTO `referenciadores` (`id_referenciador`, `id_usuario`, `codigo`) VALUES
(4, 47, '2407');

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
  `fecha_accidente` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `hora_accidente` time NOT NULL,
  `estado` int(11) NOT NULL,
  `comentarios` varchar(500) NOT NULL,
  `referenciado` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_abogado` int(11) NOT NULL,
  `id_asistente` int(11) NOT NULL,
  `numero_poliza` varchar(500) NOT NULL,
  `id_aseguradora` int(11) NOT NULL,
  `reporte_policia` varchar(500) NOT NULL,
  `numero_reclamo` varchar(500) NOT NULL,
  PRIMARY KEY (`id_reporte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `fecha_reporte`, `fecha_accidente`, `id_cliente`, `id_ciudad`, `hora_accidente`, `estado`, `comentarios`, `referenciado`, `tipo`, `status`, `id_abogado`, `id_asistente`, `numero_poliza`, `id_aseguradora`, `reporte_policia`, `numero_reclamo`) VALUES
(1, '2022-06-07 03:30:28', '2022-06-07 03:30:28', 1, 1, '16:30:28', 1, 'Sin comentarios', 1, 1, 1, 1, 1, '123123231123', 1, '1231231231', '21231123312');

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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `id_estado_usuario`) VALUES
(64, 'a_das4616', '$2y$10$a77PTSCNivMGiDxqgW3zzO8821OUk1HlnLIrgLVo37hPMN56gmK1q', 1),
(9, 'asd', '$2y$10$GHYo8VzdpKGAqibm0LlpBuCXhtqTaVguXJCHTz3X7343uDp8cQnbK', 1),
(62, 'va_gabriel4616', '$2y$10$VftIMUO./o80LJ8.SkmWZuow6CSguhMr7TmMpKpWlEAHyjabVBIYa', 1),
(60, 'sad', '$2y$10$akeyCPqqaniZVVevAKyh3u6v2fUGr0GobU6DwHjiVEi42KOb0mvYK', 1),
(12, 'asd', '$2y$10$MBLMd22EmWVlrjLk/b3qEOGgb.r0eiqUVmNFjW82OmGUx96ACGHgK', 1),
(38, 'abogado1', '$2y$10$Lt.QEjS.Zf5sGs0x5WkbDOBQok0cy2uCXVWqZMCvQYoUyvz2wrtMW', 1),
(39, 'sad', '$2y$10$MmkQcXgR.knFKEQZf6IxW.jdH2e/Ogq.U/ae.HqLI01rkkFLp9Vza', 1),
(40, 'ghj', '$2y$10$WUYZeZwHlvs7o3zrmYU8OeRkW2sIT8QjeBZDgJm2qSigdLjZ68Sw2', 1),
(42, 'aseg', '$2y$10$/JdWmtT0nD0VzSJSIt4tF.NvqZ9W25nasaPPKBRlFmec4OrLNx0Eq', 1),
(43, 'asd', '$2y$10$AwTdF4X0HxjG1vJF56wysus1w2/dGcTYPN3hZ65UF2XQ31FgxIQla', 1),
(44, 'asd', '$2y$10$w4l7TlL786dr6hkMLWN2.e9yE5iScaceFIVZqt223H5lIyosDauvG', 1),
(47, 'sad', '$2y$10$H3oU3H.WGPB2VCnGWbss1Oj03qQls2anoDCWjyyq7nBugJpjxsFnm', 1),
(46, 'das', '$2y$10$VOsNNeXSp1.UekpuKJjh5O9J7STtiqmOGTeirICqblKtEXi34dHAu', 1),
(48, 'asd', '$2y$10$Q6fpWENvfqzM1Bm7.qN72.jBRcrqzdxZiTf5/iRsvGjsE1buu9n4q', 1),
(55, '32', '$2y$10$bBH4z3MZZmV3lAZpd0cZC.ZQU3RSJRMvUOTDHcoL4T.O7kcibBxVu', 1),
(26, 'asd', '$2y$10$i03oP2PRvos3Es7lA44mquMhdXFYMZgOciHMHP1ZXqrW0KTn9GwkK', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
