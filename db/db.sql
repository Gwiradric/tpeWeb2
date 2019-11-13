-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-11-2019 a las 22:56:36
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_movies`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id_img` int(11) NOT NULL,
  `fk_id_movie` int(11) NOT NULL,
  `path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id_img`, `fk_id_movie`, `path`) VALUES
(21, 3, 'img/5dc77d4d8a7dc.jpg'),
(22, 12, 'img/5dc77d66a9650.jpg'),
(23, 20, 'img/5dc77d7908418.jpg'),
(24, 22, 'img/5dc77d9dcb4c4.jpg'),
(25, 23, 'img/5dc77db038a93.jpg'),
(26, 24, 'img/5dc77ddecb3b3.jpg'),
(27, 28, 'img/5dc77df3d99d0.jpg'),
(28, 37, 'img/5dc77ef455d24.jpg'),
(29, 3, 'img/5dc77f75c9b15.jpg'),
(30, 12, 'img/5dc77f7d90147.jpg'),
(31, 22, 'img/5dc77fe7cc424.jpg'),
(32, 20, 'img/5dc77ffa5f520.jpg'),
(33, 24, 'img/5dc780385ac35.jpg'),
(39, 2, 'img/5dc82419235e0.jpg'),
(43, 55, 'img/5dc8b56f2dbe7.jpg'),
(44, 55, 'img/5dc8b56f2dc5a.jpg'),
(45, 55, 'img/5dc8b56f2dc88.jpg'),
(46, 55, 'img/5dc8b56f2dcb2.jpg'),
(47, 55, 'img/5dc8b56f2dcdb.jpg'),
(192, 74, 'img/5dcc79a8234bd.jpg'),
(193, 74, 'img/5dcc79a823511.jpg'),
(194, 74, 'img/5dcc79a8236c8.jpg'),
(195, 74, 'img/5dcc79a823713.jpg'),
(196, 74, 'img/5dcc79a823733.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_img`),
  ADD KEY `fk_id_movie` (`fk_id_movie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id_img` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`fk_id_movie`) REFERENCES `movies` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
