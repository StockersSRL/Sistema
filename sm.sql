-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-02-2016 a las 07:59:54
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sm`
--
CREATE DATABASE IF NOT EXISTS `sm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sm`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(16) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `nombre` varchar(32) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `foto` mediumblob NOT NULL,
  `tipoimg` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `proveedor` (`proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo-categoria`
--

CREATE TABLE IF NOT EXISTS `articulo-categoria` (
  `id_articulo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`,`id_categoria`),
  KEY `id_articulo` (`id_articulo`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo-tag`
--

CREATE TABLE IF NOT EXISTS `articulo-tag` (
  `id_articulo` int(11) NOT NULL,
  `tag` varchar(32) NOT NULL,
  PRIMARY KEY (`id_articulo`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `es_cliente` tinyint(1) NOT NULL,
  `telefono` varchar(64) NOT NULL,
  `ci` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `ruc` int(11) NOT NULL,
  `razon_social` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`,`ruc`,`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` char(16) NOT NULL,
  `total` int(11) NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura-detalle`
--

CREATE TABLE IF NOT EXISTS `factura-detalle` (
  `id_factura` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`,`id_articulo`),
  KEY `id_articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `mes` char(8) NOT NULL,
  `registro` longblob NOT NULL,
  PRIMARY KEY (`mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `username` char(16) NOT NULL,
  `password` char(32) NOT NULL,
  `tipo` enum('USR','ADM') NOT NULL DEFAULT 'USR',
  `avatar` mediumblob NOT NULL,
  `tipoimg` char(15) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `cliente` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `articulo-categoria`
--
ALTER TABLE `articulo-categoria`
  ADD CONSTRAINT `articulo-categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulo-categoria_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `articulo-tag`
--
ALTER TABLE `articulo-tag`
  ADD CONSTRAINT `articulo-tag_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura-detalle`
--
ALTER TABLE `factura-detalle`
  ADD CONSTRAINT `factura-detalle_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura-detalle_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
