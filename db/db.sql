-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2019 a las 01:38:59
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

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
  `description` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`id_genre`, `name`, `description`) VALUES
(1, 'Horror', 'The distinction between horror and terror is a standard literary and psychological concept applied especially to Gothic and horror fiction. Terror is usually described as the feeling of dread and anticipation that precedes the horrifying experience. By contrast, horror is the feeling of revulsion that usually follows a frightening sight, sound, or otherwise experience.'),
(5, 'Adventures', 'An adventure is an event or series of events that happens outside the course of the protagonist\'s ordinary life, usually accompanied by danger, often by physical action. Adventure stories almost always move quickly, and the pace of the plot is at least as important as characterization, setting and other elements of a creative work.'),
(12, 'Comedy', 'Comedy may be divided into multiple genres based on the source of humor, the method of delivery, and the context in which it is delivered.  These classifications overlap, and most comedians can fit into multiple genres. For example, deadpan comics often fall into observational comedy, or into black comedy or blue comedy to contrast the morbidity, or offensiveness of the joke with a lack of emotion. '),
(35, 'Science fiction', 'Is a genre of speculative fiction that typically deals with imaginative and futuristic concepts such as advanced science and technology, time travel, parallel universes, fictional worlds, space exploration, and extraterrestrial life. It has been called the '),
(37, 'Action', ' Is a film genre in which the protagonist or protagonists are thrust into a series of events that typically include violence, extended fighting, physical feats, and frantic chases. Action films tend to feature a resourceful hero struggling against incredible odds, which include life-threatening situations, a villain, or a pursuit which usually concludes in victory for the hero (though a small number of films in this genre have ended in the victory for the villain instead). '),
(38, 'Drama', 'The drama genre is strongly based in a character, or characters, that are in conflict at a crucial moment in their lives. Most dramas revolve around families and often have tragic or painful resolutions.'),
(39, 'Suspense', 'Suspense is a feeling of fascination and excitement mixed with apprehension, tension, and anxiety developed from an unpredictable, mysterious, and rousing source of entertainment. The term most often refers to an audience\'s perceptions in a dramatic work. Suspense is not exclusive to fiction.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(600) NOT NULL,
  `year` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `img` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id_movie`, `id_genre`, `name`, `description`, `year`, `rating`, `img`) VALUES
(2, 1, 'Resident Evil', 'Resident Evil is a 2002 action horror film written and directed by Paul W. S. Anderson. The film stars Milla Jovovich, Michelle Rodriguez, Eric Mabius, James Purefoy, Martin Crewes, and Colin Salmon. It is the first installment in the Resident Evil film series, which is loosely based on the video game series of the same name.', 2002, 49, 2),
(3, 5, 'Tarzan', 'Tarzan, a fictional character created by Edgar Rice Burroughs, first appeared in the 1912 novel Tarzan of the Apes, and then in twenty-three sequels. The character proved immensely popular and quickly made the jump to other media, first and most notably to comics and film. This article concerns Tarzan\'s appearance in film and other non-print media.', 1929, 21, 3),
(12, 12, 'Hercules', 'Hercules is a 1997 American animated musical fantasy comedy film produced by Walt Disney Feature Animation for Walt Disney Pictures. The 35th Disney animated feature film and the eighth animated film produced during the Disney Renaissance, the film was directed by Ron Clements and John Musker. The film is loosely based on the legendary hero Heracles (known in the film by his Roman name, Hercules), the son of Zeus, in Greek mythology. ', 1997, 61, 4),
(20, 35, 'Blade Runner 2049', 'Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what’s left of society into chaos. K’s discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.', 2017, 67, 5),
(22, 39, 'Shutter Island', 'Shutter Island is a 2010 American neo-noir psychological thriller film directed by Martin Scorsese and written by Laeta Kalogridis, based on Dennis Lehane\'s 2003 novel of the same name. Leonardo DiCaprio stars as U.S. Marshal Edward \"Teddy\" Daniels who is investigating a psychiatric facility on Shutter Island after one of the patients goes missing.', 2010, 87, 6),
(23, 37, 'Géminis', 'Lucia and Daniel have three children: Ezequiel, who has gone to live in Spain, Jeremias and, their youngest, Meme. Lucia, a pretentious woman, believes she can control everything according to the criteria and habits of a typical wealthy Argentinean family. She is blind to the fact that Jeremias and Meme are conducting an illicit relationship under her own roof. Ezequiel arrives home from Spain with his fiancée, Montse, to get married, much to the great joy of his proud parents. The young couple\'s presence reveals the fragility of the order of things that had seemed so perfect. Love becomes a s', 2010, 29, 7),
(24, 38, 'Wounds', 'Wounds is a 2019 psychological horror film written and directed by Babak Anvari and starring Armie Hammer, Dakota Johnson, and Zazie Beetz. The film is based on the novella The Visible Filth by Nathan Ballingrud.', 2019, 62, 8),
(28, 1, 'Silent Hill', 'Silent Hill is a 2006 French-Canadian psychological horror film directed by Christophe Gans and written by Roger Avary, Gans, and Nicolas Boukhrief. The film is an adaptation of Konami\'s 1999 video game Silent Hill. It stars Radha Mitchell, Sean Bean, Laurie Holden, Deborah Kara Unger, Kim Coates, Tanya Allen, Alice Krige, and Jodelle Ferland.', 2006, 78, 1),
(37, 1, 'Resident Evil: Apocalypse', 's a 2004 action horror film[9] directed by Alexander Witt and written by Paul W. S. Anderson. A direct sequel to Resident Evil (2002), it is the second installment in the Resident Evil film series, which is loosely based on the video game series of the same name. The film marks Witt\'s feature directorial debut; Anderson, the director of the first film, turned down the job due to other commitments, though stayed on as one of its producers. Milla Jovovich reprises her role as Alice, and is joined by Sienna Guillory as Jill Valentine and Oded Fehr as Carlos Oliveira. ', 2004, 76, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `admin`) VALUES
(1, 'fedefuhr', '$2y$10$dXO0i0WT3BCQo.bbMovKUekc9Du4Iw3LINi6e4CLnrrVEhy7imyWi', 1),
(24, 'test', '$2y$10$UDttfIbeZ60vdiKzaHL1XOMnhWiy4wFAoHsG3fFBTn3Q6.yOL52eK', 1);

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
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
