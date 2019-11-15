-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-11-2019 a las 03:15:59
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
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `comment` varchar(300) NOT NULL,
  `score` int(1) NOT NULL,
  `fk_id_movie` int(11) NOT NULL,
  `fk_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id_comment`, `comment`, `score`, `fk_id_movie`, `fk_id_user`) VALUES
(1, 'This movie is amazing!', 5, 55, 28),
(5, 'Wow! I love it 2 UPDATED', 5, 55, 28);

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
(65, 58, 'img/5dcca1a707fa7.jpg'),
(66, 58, 'img/5dcca1a70802f.jpg'),
(67, 58, 'img/5dcca1a70806c.jpg'),
(68, 58, 'img/5dcca1a7080a3.jpg'),
(69, 58, 'img/5dcca1a7080d9.jpg');

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
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id_movie`, `id_genre`, `name`, `description`, `year`, `rating`) VALUES
(2, 1, 'Resident Evil', 'Resident Evil is a 2002 action horror film written and directed by Paul W. S. Anderson. The film stars Milla Jovovich, Michelle Rodriguez, Eric Mabius, James Purefoy, Martin Crewes, and Colin Salmon. It is the first installment in the Resident Evil film series, which is loosely based on the video game series of the same name.', 2002, 49),
(3, 5, 'Tarzan', 'Tarzan, a fictional character created by Edgar Rice Burroughs, first appeared in the 1912 novel Tarzan of the Apes, and then in twenty-three sequels. The character proved immensely popular and quickly made the jump to other media, first and most notably to comics and film. This article concerns Tarzan\'s appearance in film and other non-print media.', 1929, 21),
(12, 12, 'Hercules', 'Hercules is a 1997 American animated musical fantasy comedy film produced by Walt Disney Feature Animation for Walt Disney Pictures. The 35th Disney animated feature film and the eighth animated film produced during the Disney Renaissance, the film was directed by Ron Clements and John Musker. The film is loosely based on the legendary hero Heracles (known in the film by his Roman name, Hercules), the son of Zeus, in Greek mythology. ', 1997, 61),
(20, 35, 'Blade Runner 2049', 'Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what’s left of society into chaos. K’s discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.', 2017, 67),
(22, 1, 'Shutter Island', 'Shutter Island is a 2010 American neo-noir psychological thriller film directed by Martin Scorsese and written by Laeta Kalogridis, based on Dennis Lehane\'s 2003 novel of the same name. Leonardo DiCaprio stars as U.S. Marshal Edward \"Teddy\" Daniels who is investigating a psychiatric facility on Shutter Island after one of the patients goes missing.', 2010, 87),
(23, 1, 'Géminis', 'Lucia and Daniel have three children: Ezequiel, who has gone to live in Spain, Jeremias and, their youngest, Meme. Lucia, a pretentious woman, believes she can control everything according to the criteria and habits of a typical wealthy Argentinean family. She is blind to the fact that Jeremias and Meme are conducting an illicit relationship under her own roof. Ezequiel arrives home from Spain with his fiancée, Montse, to get married, much to the great joy of his proud parents. The young couple\'s presence reveals the fragility of the order of things that had seemed so perfect. Love becomes a s', 2010, 29),
(24, 39, 'Wounds', 'Wounds is a 2019 psychological horror film written and directed by Babak Anvari and starring Armie Hammer, Dakota Johnson, and Zazie Beetz. The film is based on the novella The Visible Filth by Nathan Ballingrud.', 2019, 62),
(28, 1, 'Silent Hill', 'Silent Hill is a 2006 French-Canadian psychological horror film directed by Christophe Gans and written by Roger Avary, Gans, and Nicolas Boukhrief. The film is an adaptation of Konami\'s 1999 video game Silent Hill. It stars Radha Mitchell, Sean Bean, Laurie Holden, Deborah Kara Unger, Kim Coates, Tanya Allen, Alice Krige, and Jodelle Ferland.', 2006, 78),
(37, 1, 'Resident Evil: Apocalypse', 'Is a 2004 action horror film[9] directed by Alexander Witt and written by Paul W. S. Anderson. A direct sequel to Resident Evil (2002), it is the second installment in the Resident Evil film series, which is loosely based on the video game series of the same name. The film marks Witt\'s feature directorial debut; Anderson, the director of the first film, turned down the job due to other commitments, though stayed on as one of its producers. Milla Jovovich reprises her role as Alice, and is joined by Sienna Guillory as Jill Valentine and Oded Fehr as Carlos Oliveira. ', 2004, 76),
(55, 1, 'Kingdom Hearts', 'Su historia marca la continuación de la trama principal de la saga. Con una introducción algo desconcertante para algunos en la que controlamos a un personaje llamado Roxas en la ciudad de Crepúsculo hasta que conseguimos despertar a Sora y seguir con su aventura. Mientras que Riku avanza por su lado y Kairi permance secuestrada. Controlando a Sora durante toda la trama principal del juego iremos avanzando de la mano de Donald y Goofy. Seguiremos avanzando y viajando a bordo de la habitual nave Gumi para visitar mundos conocidos y mundos nuevos.', 2008, 100),
(58, 5, 'Jojo Bizarre Adventure', 'Each of series\' eight protagonists is a member of the Joestar family, whose mainline descendants invariably possess a star-shaped birthmark above their left shoulder blade and a name that can be abbreviated to the titular \"JoJo\". The plot of each part generally consists of this JoJo gathering a group of allies, mastering their supernatural ability, battling various enemies, and ultimately confronting the part\'s powerful main villain.', 1984, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `admin`, `code`) VALUES
(28, 'federico.fuhr.ff@gmail.com', '$2y$10$o6TvAbOAZIpY8mciUbxNyuQ1byB5.MUqIWT.SAMdyIrTUp7HaRyQG', 1, '1573339079EdQGbfLZ'),
(30, 'gwiradric.ps3@gmail.com', '$2y$10$Z9dQYYwRT.Vz0sp1HTuFGuDoJZun5nv9DXRvq24puxMzYeRLmNkR2', 1, '1573333455IKWMURLY');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `fk_id_movie` (`fk_id_movie`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Indices de la tabla `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_img`),
  ADD KEY `fk_id_movie` (`fk_id_movie`);

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
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `genres`
--
ALTER TABLE `genres`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id_img` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_id_movie` FOREIGN KEY (`fk_id_movie`) REFERENCES `movies` (`id_movie`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`fk_id_movie`) REFERENCES `movies` (`id_movie`);

--
-- Filtros para la tabla `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
