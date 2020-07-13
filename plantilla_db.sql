-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-06-2020 a las 18:34:19
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plantilla_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistente`
--

CREATE TABLE `asistente` (
  `id_asistente` int(255) NOT NULL,
  `id_evento` int(255) DEFAULT NULL,
  `id_persona` int(255) DEFAULT NULL,
  `id_plantilla` int(255) DEFAULT NULL,
  `certificado_id` int(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(255) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_evento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resolucion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(255) NOT NULL,
  `direccion_empresa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_persona` int(255) DEFAULT NULL,
  `nombre_empresa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firma`
--

CREATE TABLE `firma` (
  `id_firma` int(255) NOT NULL,
  `nombre_firma` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `titulo_firma` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `firma` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo`
--

CREATE TABLE `fondo` (
  `id_fondo` int(255) NOT NULL,
  `nombre_fondo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fondo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(255) NOT NULL,
  `id_evento` int(255) DEFAULT NULL,
  `apellidos_persona` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciudad_persona` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `filiacion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres_persona` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pago` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_participante` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla`
--

CREATE TABLE `plantilla` (
  `id_plantilla` int(255) NOT NULL,
  `contenido` varchar(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_fondo` int(255) DEFAULT NULL,
  `nombre_plantilla` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_firma`
--

CREATE TABLE `plantilla_firma` (
  `id_plantilla_firma` int(255) NOT NULL,
  `id_plantilla` int(255) DEFAULT NULL,
  `id_firma` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_sello`
--

CREATE TABLE `plantilla_sello` (
  `id_plantilla_sello` int(255) NOT NULL,
  `id_plantilla` int(255) DEFAULT NULL,
  `id_sello` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sello`
--

CREATE TABLE `sello` (
  `id_sello` int(255) NOT NULL,
  `nombre_sello` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sello` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(50) NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasena` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `correo`, `contrasena`) VALUES
(1, 'cristhian@espoch.edu.ec', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD PRIMARY KEY (`id_asistente`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_evento` (`id_evento`),
  ADD KEY `id_plantilla` (`id_plantilla`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`id_firma`);

--
-- Indices de la tabla `fondo`
--
ALTER TABLE `fondo`
  ADD PRIMARY KEY (`id_fondo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`id_plantilla`),
  ADD KEY `id_fondo` (`id_fondo`);

--
-- Indices de la tabla `plantilla_firma`
--
ALTER TABLE `plantilla_firma`
  ADD PRIMARY KEY (`id_plantilla_firma`),
  ADD KEY `id_plantilla` (`id_plantilla`),
  ADD KEY `id_firma` (`id_firma`);

--
-- Indices de la tabla `plantilla_sello`
--
ALTER TABLE `plantilla_sello`
  ADD PRIMARY KEY (`id_plantilla_sello`),
  ADD KEY `id_plantilla` (`id_plantilla`),
  ADD KEY `id_sello` (`id_sello`);

--
-- Indices de la tabla `sello`
--
ALTER TABLE `sello`
  ADD PRIMARY KEY (`id_sello`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistente`
--
ALTER TABLE `asistente`
  MODIFY `id_asistente` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `firma`
--
ALTER TABLE `firma`
  MODIFY `id_firma` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fondo`
--
ALTER TABLE `fondo`
  MODIFY `id_fondo` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `id_plantilla` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantilla_firma`
--
ALTER TABLE `plantilla_firma`
  MODIFY `id_plantilla_firma` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantilla_sello`
--
ALTER TABLE `plantilla_sello`
  MODIFY `id_plantilla_sello` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sello`
--
ALTER TABLE `sello`
  MODIFY `id_sello` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD CONSTRAINT `asistente_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `asistente_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `asistente_ibfk_3` FOREIGN KEY (`id_plantilla`) REFERENCES `plantilla` (`id_plantilla`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD CONSTRAINT `plantilla_ibfk_1` FOREIGN KEY (`id_fondo`) REFERENCES `fondo` (`id_fondo`);

--
-- Filtros para la tabla `plantilla_firma`
--
ALTER TABLE `plantilla_firma`
  ADD CONSTRAINT `plantilla_firma_ibfk_1` FOREIGN KEY (`id_plantilla`) REFERENCES `plantilla` (`id_plantilla`),
  ADD CONSTRAINT `plantilla_firma_ibfk_2` FOREIGN KEY (`id_firma`) REFERENCES `firma` (`id_firma`);

--
-- Filtros para la tabla `plantilla_sello`
--
ALTER TABLE `plantilla_sello`
  ADD CONSTRAINT `plantilla_sello_ibfk_1` FOREIGN KEY (`id_plantilla`) REFERENCES `plantilla` (`id_plantilla`),
  ADD CONSTRAINT `plantilla_sello_ibfk_2` FOREIGN KEY (`id_sello`) REFERENCES `sello` (`id_sello`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
