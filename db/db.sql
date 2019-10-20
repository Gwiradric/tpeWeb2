-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-10-2019 a las 19:04:35
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

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
-- Estructura de tabla para la tabla `genres`
--

CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`id_genre`, `name`, `description`) VALUES
(1, 'Terror', 'El horror o terror es un género literario que se define por la sensación que causa: miedo'),
(5, 'Aventuras', 'Suceso extraño o poco frecuente que vive una persona, especialmente el que es emocionante'),
(12, 'Comedia', 'Da alegría con momentos de drama'),
(35, 'Ciencia ficción', 'Es la denominación de uno de los géneros derivados de la literatura de ficción'),
(37, 'Acción', 'Este tipo de película son de alta tensión y contienen persecuciones y muchas peleas'),
(38, 'Dramáticas', 'Son películas serias, con personajes y situaciones muy realistas, parecidas a la vida cotidiana'),
(39, 'Suspenso', 'Estas películas contienen un contenido relacionado con asesinatos o con el crimen organizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id_movie`, `id_genre`, `name`, `description`, `year`, `rating`) VALUES
(1, 1, 'Silent Hill', 'Pelicula basasa en el famoso juego de terror', 2005, 4),
(2, 1, 'Resident Evil', 'Un peligroso virus se ha propagado intencionalmente por la Corporación Umbrella', 2000, 10),
(3, 5, 'Tarzan', 'Película estadounidense de animación tradicional de 1999. Se basa en Tarzán de Edgar Rice Burroughs', 1996, 20),
(12, 12, 'Hercules', 'Es una película de comedia estadounidense protagonizada por Dwayne Johnson', 2015, 50),
(20, 35, 'Blade Runner 2049', 'Es una película neo-noir estadounidense', 2017, 8),
(22, 39, 'Shutter Island', 'Leo y Mark Ruffalo interpretan a dos detectives que investigan la desaparición de un paciente', 2010, 87),
(23, 37, 'Géminis', 'Henry Brogan, un asesino a sueldo ya mayor para este tipo de trabajo, decide retirarse.', 2019, 29),
(24, 38, 'Wounds', 'Una serie de sucesos misteriosos comienzan a suceder cuando un camarero contesta una llamada', 2019, 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`) VALUES
(1, 'fedefuhr', '$2y$10$dXO0i0WT3BCQo.bbMovKUekc9Du4Iw3LINi6e4CLnrrVEhy7imyWi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `FK_id_genre` (`id_genre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genres`
--
ALTER TABLE `genres`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
