-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-06-2022 a las 06:19:55
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
DROP PROCEDURE IF EXISTS `sp_delete_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cliente` (IN `_ID` INT)  BEGIN
SET @id_cliente = _ID;
SET @id_usuario = ( SELECT clientes.id_usuario FROM clientes
                  WHERE clientes.id_usuario = _ID);
SET @id_info_contacto = ( SELECT info_contacto.id_info_contacto FROM info_contacto WHERE info_contacto.id_usuario = @id_usuario);
DELETE FROM clientes WHERE id_cliente = @id_cliente;
DELETE FROM usuarios WHERE usuarios.id_usuario = @id_usuario;
DELETE FROM info_contacto WHERE info_contacto.id_info_contacto = @id_info_contacto;
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
(1, 14);

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
  PRIMARY KEY (`id_aseguradora`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
CREATE TABLE IF NOT EXISTS `asistentes` (
  `id_asistente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_asistente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`) VALUES
(9, 10),
(11, 13),
(10, 11);

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `info_contacto`
--

INSERT INTO `info_contacto` (`id_info_contacto`, `id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `mail`, `direccion`, `id_ciudad`, `fax`) VALUES
(13, 13, 'asd12', 'asd', 'asd', '123', 'ads', 'asd', 1, 'asad'),
(14, 14, 'test22354', 'test', 'teasd', '213', 'asd', 'asd', 1, '21321332'),
(9, 9, 'asd22', 'asd', 'asd', '123', 'ad', 'asd', 1, '2132'),
(10, 10, 'asd223', 'asd', 'asd', '123', 'ad', 'asd', 1, '2132'),
(11, 11, 'ads33', 'asd', 'asd', '123', 'ads', 'ads', 1, '123'),
(12, 12, 'asd33', 'asd', 'asad', 'das', 'das', 'asd', 1, 'asd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_medicos`
--

DROP TABLE IF EXISTS `proveedores_medicos`;
CREATE TABLE IF NOT EXISTS `proveedores_medicos` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referenciadores`
--

INSERT INTO `referenciadores` (`id_referenciador`, `id_usuario`, `codigo`) VALUES
(1, 9, 'hg2'),
(2, 12, 'asd');

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
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_estado_usuario` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `id_estado_usuario`) VALUES
(13, 'asd', '$2y$10$3MspfnrMwfVS5S2Pg7txq.rKUH3HJiuXkXY9ruRx9ZCuQr00C6OvK', 1),
(9, 'asd', '$2y$10$GHYo8VzdpKGAqibm0LlpBuCXhtqTaVguXJCHTz3X7343uDp8cQnbK', 1),
(10, 'asd', '$2y$10$p.nRHq/VZTHAWoJofVFt0eT9KPKOARbgQ5gVY.tZjzRu9Cq6e0ANO', 1),
(11, 'ads', '$2y$10$lWxDmurhXA9aT6Jyand4iuWGEz5tnClbiDu7iwMm/s3bL5acvZs8K', 1),
(12, 'asd', '$2y$10$MBLMd22EmWVlrjLk/b3qEOGgb.r0eiqUVmNFjW82OmGUx96ACGHgK', 1),
(14, 'ads', '$2y$10$qbRsb8zkx1x5D3pdhEXjPu3r8QYhB4lJrXDOmjT9yxiVUOpoxkrb2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_medicos`
--

DROP TABLE IF EXISTS `usuarios_medicos`;
CREATE TABLE IF NOT EXISTS `usuarios_medicos` (
  `id_usuario_medico` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_medico` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_medico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
