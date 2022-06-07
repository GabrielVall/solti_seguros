-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2022 a las 04:15:29
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `id_estado` int(11) NOT NULL,
  `fax` varchar(500) NOT NULL,
  PRIMARY KEY (`id_info_contacto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
