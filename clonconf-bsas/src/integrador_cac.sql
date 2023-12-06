-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2023 a las 23:32:14
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `integrador_cac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `dpto` char(2) DEFAULT NULL,
  `codPostal` char(10) DEFAULT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oradores`
--

CREATE TABLE `oradores` (
  `id_orador` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tema` varchar(400) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profesion` varchar(50) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `idDomicilio` int(11) DEFAULT NULL,
  `fotoPerfil` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oradores`
--

INSERT INTO `oradores` (`id_orador`, `nombre`, `apellido`, `email`, `tema`, `fecha_alta`, `profesion`, `telefono`, `dni`, `idDomicilio`, `fotoPerfil`) VALUES
(16, 'Ada', 'Lovelace', 'lovelace@uol.com', 'Ada Lovelace, fue una matemática y escritora británica, célebre sobre todo por su trabajo acerca de la computadora mecánica de uso general de Charles Babbage, la denominada máquina analítica', '2023-12-05 00:39:03', 'Negocios', 12991937, 898763597, NULL, 'https://i.ibb.co/jHw2QJN/ada.png'),
(17, 'Steven', 'Jobs', 'steveJobs@examiner.com', 'Steven Paul Jobs ​​​​ fue un empresario, diseñador industrial, magnate empresarial, propietario de medios e inversor estadounidense. Fue cofundador y presidente ejecutivo de Apple​ y máximo accionista individual de The Walt Disney Company.', '2023-12-05 00:40:51', 'Negocios', 49189360, 729004541, NULL, 'https://i.ibb.co/bbsKVBN/steve.png'),
(18, 'Bill', 'Gates', 'bGates@hotmail.com', 'William Henry Gates III, conocido como Bill Gates, es un magnate empresarial, desarrollador de software, inversor, autor y filántropo estadounidense. Es cofundador de Microsoft.', '2023-12-05 00:43:50', 'Tecno', 12350626, 448100885, NULL, 'https://i.ibb.co/DVr2xyT/bill.png'),
(19, 'Isabel', 'Mary', 'isabelMary@uk.com', 'Isabel II del Reino Unido ​ fue reina de Reino Unido, además de la soberana de los Estados independientes constituidos en reino que forman, o formaron, parte de la Mancomunidad de Naciones.', '2023-12-05 00:48:45', 'Cultura', 63490515, 227619813, NULL, 'https://i.ibb.co/168sCJ1/isabel.jpg'),
(20, 'Barbara', 'Streisand ', 'barbra@blog.com', 'Barbara Joan «Barbra» Streisand es una actriz, cantante, compositora, productora y directora estadounidense. Sus logros en la música, el cine y el teatro la han convertido en un icono de la cultura estadounidense.', '2023-12-05 00:51:32', 'Cultura', 12330626, 898763599, NULL, 'https://i.ibb.co/F56WxgV/barbra.jpg'),
(21, 'Ayrton', 'Senna', 'aSenna@constantcontact.com', 'Ayrton Senna da Silva fue un piloto de automovilismo brasileño. Compitió en Fórmula 1 para los equipos Toleman, Lotus, McLaren y Williams.', '2023-12-05 00:53:00', 'Deporte', 77938682, 532918745, NULL, 'https://i.ibb.co/KhX7ZpP/ayrton.jpg'),
(22, 'Graydon', 'Hoare', 'gHoare@webnode.com', 'Graydon Hoare is a software developer. He is the creator of Rust (programming language) and Swift (programming language). Hoare started working on Rust in 2006 as a hobby and Mozilla where he was working took an interest.', '2023-12-05 00:36:27', 'Tecno', 77738682, 239405021, NULL, 'https://i.ibb.co/nRsP9CX/graydon.jpg'),
(24, 'Carlos', 'Slim', 'cSlim@microsoft.com', 'Carlos Slim Helú es un empresario e ingeniero mexicano. Es el decimoprimer hombre más rico del mundo, ya que posee bienes que ascienden a los 98 300 millones de dólares, ​​ lo convierte en la persona más rica de México y de América Latina', '2023-12-05 00:30:17', 'Negocios', 23862102, 1433357894, NULL, 'https://i.ibb.co/VSKPvt8/slim.webp'),
(25, 'Mark', 'Zuckerberg ', 'mZuckerb@nytimes.com', 'Mark Elliot Zuckerberg es un programador y empresario estadounidense, uno de los creadores y fundadores de Facebook y la red social homónima, y su actual presidente.', '2023-12-05 00:53:17', 'Tecno', 61122415, 951101465, NULL, 'https://i.ibb.co/LSYjdpG/mark-Zuckerberg-1.webp'),
(26, 'Jeffrey', 'Bezos', 'jBezos@hotmail.com', 'Jeffrey Preston Bezos es un empresario, ingeniero y magnate estadounidense, fundador, presidente ejecutivo y exdirector ejecutivo de la empresa de venta en línea Amazon de la cual posee el 7%.', '2023-12-05 00:19:59', 'Tecno', 120199193, 296556478, NULL, 'https://i.ibb.co/5FNTn2t/bezos.jpg'),
(27, 'Marcos', 'Galperín', 'mGalperin@bloglines.com', 'Marcos Eduardo Galperín Lebach es un empresario argentino conocido por ser fundador, presidente y director ejecutivo de Mercado Libre, además de heredero de la curtiembre SADESA.', '2023-12-05 00:16:40', 'Negocios', 77729386, 280717310, NULL, 'https://i.ibb.co/wgBbBLK/771748-marcos-20galperin-20na-201.jpg'),
(31, 'Elon', 'Musk', 'eMusk@gmail.com', 'Elon Reeve Musk (Pretoria, 28 de junio de 1971), conocido como Elon Musk, es un empresario, inversor y magnate sudafricano que también posee las nacionalidades canadiense y estadounidense.', '2023-12-05 00:04:13', 'Tecno', 5254441, 456546556, NULL, 'https://imgdb.net/storage/uploads/62288e608ba1987ed1c85eb5ccb824e8ec410d9aa2bfd3213f5f5d557f728c37.jpg'),
(34, 'Robert', 'DelNiro', 'rDelniro@hotmail.com', 'Es ampliamente conocido por sus papeles de gánster y de personajes conflictivos y turbulentos, destacando sus múltiples colaboraciones con el director Martin Scorsese y por sus primeros trabajos con el director Brian De Palma. Durante su carrera ha interpretado a personajes de toda clase de géneros, así como de terror, drama e incluso de comedia', '2023-12-05 20:54:49', 'Cultura', 1142105, 554654, NULL, 'https://i.ibb.co/XtFW5xH/DeMiro.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` int(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` int(20) NOT NULL,
  `idDomicilio` int(11) DEFAULT NULL,
  `cantticket` int(11) NOT NULL,
  `ocupacion` varchar(25) NOT NULL,
  `estudios` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id`, `nombre`, `apellido`, `dni`, `email`, `telefono`, `idDomicilio`, `cantticket`, `ocupacion`, `estudios`) VALUES
(17, 'Carola', 'Khadir', 729004543, 'ckhadir1@gnu.org', 2147483647, NULL, 18, 'Food Chemist', 'Thaksin University'),
(18, 'Rod', 'Piercy', 448100837, 'rpiercy2@who.int', 2147483647, NULL, 14, 'Software Engineer III', 'NTI University'),
(19, 'Zuka', 'Bliatz', 131018855, 'zbliat@jigsy.com', 1233350626, NULL, 8, 'ocupada', 'University of Peloponnese'),
(20, 'Sawyer', 'Landell', 227619802, 'slandell4@nba.com', 2147483647, NULL, 9, 'Technical Writer', 'Popakademie Baden-Württemberg'),
(21, 'Stephan', 'Chettoe', 898763599, 'schettoe5@springer.com', 2147483647, NULL, 7, 'Business Systems Developm', 'Université Catholique de Louvain'),
(22, 'Tris', 'Gallehock', 532918758, 'tgallehock6@pinterest.com', 2147483647, NULL, 11, 'Occupational Therapist', 'Merz Akademie, Hochschule für Gestaltung Stuttgart'),
(23, 'Regan', 'Stiell', 239405033, 'rstiell7@psu.edu', 2147483647, NULL, 17, 'Statistician IV', 'Institute of Clinical Social Work'),
(24, 'Tull', 'Thraves', 3311384, 'tthraves8@about.me', 2147483647, NULL, 15, 'Assistant Professor', 'Universitas Kediri'),
(25, 'Orsa', 'Baradel', 143335712, 'obaradel9@salon.com', 1201991937, NULL, 17, 'Design Engineer', 'Altai State University'),
(26, 'Herculie', 'Boncore', 951101213, 'hboncorea@kickstarter.com', 2147483647, NULL, 16, 'Office Assistant III', 'Florida Agricultural and Mechanical University'),
(27, 'Dalenna', 'Kondrachenko', 296556419, 'dkondrachenkob@hibu.com', 2147483647, NULL, 12, 'Developer II', 'Medical University of Sofia'),
(28, 'Osmond', 'Gasken', 28071, 'ogaskenc@princeton.edu', 2147483647, NULL, 5, 'Research Nurse', 'University of Science and Technology'),
(29, 'Bambie', 'Skellington', 536844355, 'bskellingtond@hc360.com', 2147483647, NULL, 9, 'Quality Control Specialis', 'University of Bedfordshire'),
(30, 'Nan', 'Lawson', 150457078, 'nlawsone@google.ru', 2147483647, NULL, 8, 'Engineer IV', 'Free International University of Moldova');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `idParticipantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `permisos` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fotoPerfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `pass`, `permisos`, `nombre`, `apellido`, `fotoPerfil`) VALUES
(3, 'gfranses2@zimbio.com', 'segundof4anc1a', 'user', 'Gar', 'Francia', 'https://i.ibb.co/b2bcXMT/iaformer1.jphttps://i.ibb.co/b2bcXMT/iaformer1.jpg'),
(4, 'rbalharry3@oaic.gov.au', 'iV2{|}v)+\"s*', 'user', 'Romona', 'Balharry', 'https://i.ibb.co/pW11gZR/iaformer3.jpg'),
(6, 'amacginley5@barnesandnoble.com', 'fC4+&j2DiaZ$Cl0y', 'user', 'Ambros', 'MacGinley', 'https://i.ibb.co/RCvgcYK/iaformer2.jpg'),
(7, 'nlauritsen6@npr.org', 'kU5/boQ&', 'user', 'Nona', 'Lauritsen', 'https://i.ibb.co/BnhryFw/starwars1.jpg'),
(8, 'dgounel7@hp.com', 'qS0|4v\'YAh%#', 'user', 'Dasie', 'Gounel', 'https://i.ibb.co/rc9fDk2/starwars2.jpg'),
(10, 'edemonge9@google.nl', 'oR0~rz&=#4U~cTqK', 'user', 'Evvie', 'Demonge', 'https://i.ibb.co/GMqwXPv/starwars3.jpg'),
(11, 'nbiswella@surveymonkey.com', 'wX4\"Y~\"%W5,zjTv', 'user', 'Nara', 'Biswell', 'https://i.ibb.co/TqK1H4g/starwars4.jpg'),
(12, 'ldewsb@tmall.com', 'wW0$sv_m5', 'user', 'Lauralee', 'Dews', 'https://i.ibb.co/QM09tWn/avatar1.jpg'),
(13, 'mifflandc@ucsd.edu', 'fY3$&+P\'QDvi&uQd', 'user', 'Mavra', 'Iffland', 'https://i.ibb.co/x71HHHw/avatar2.jpg'),
(14, 'mtodhunterd@intel.com', 'vA5%K!,V?egJzf<)', 'user', 'Margot', 'Todhunter', 'https://i.ibb.co/LPjGLC5/avatar3.jpg'),
(15, 'dchidlere@sciencedirect.com', 'qJ0?Z`8>CI8n_X<', 'user', 'Delilah', 'Chidler', 'https://i.ibb.co/CQtvZ2c/avatar4.jpg'),
(18, 'bill@gmail.com', '1234', 'user', 'Bill', 'Gates', 'https://i.ibb.co/CQ5t76s/iaoptimus.jpg'),
(19, 'steve@gmail.com', '4321', 'admin', 'Steve', 'Jobs', 'https://imgdb.net/storage/uploads/80eee944aad1ca133afd5f64e95069ef411ea60d845497dbc9f5bf2916524ad8.png'),
(22, 'cTevez@hotmail.com', 'carlos456', 'user', 'Carlos', 'Tevez', 'https://depor.com/resizer/amWMWgdiQtUvE_jZ0f6TxD-gnPk=/1200x1200/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/IARNQNUCGNFC3MW46N4JBOK6KI.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProvincia` (`idProvincia`);

--
-- Indices de la tabla `oradores`
--
ALTER TABLE `oradores`
  ADD PRIMARY KEY (`id_orador`),
  ADD KEY `apellido` (`apellido`),
  ADD KEY `dni` (`dni`),
  ADD KEY `idDomicilio` (`idDomicilio`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apellido` (`apellido`),
  ADD KEY `apellido_2` (`apellido`),
  ADD KEY `dni` (`dni`),
  ADD KEY `idDomicilio` (`idDomicilio`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idParticipantes` (`idParticipantes`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oradores`
--
ALTER TABLE `oradores`
  MODIFY `id_orador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `Localidad_ibfk_1` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `oradores`
--
ALTER TABLE `oradores`
  ADD CONSTRAINT `oradores_ibfk_` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`idParticipantes`) REFERENCES `participantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
