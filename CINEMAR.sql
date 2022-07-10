-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para cinemar
CREATE DATABASE IF NOT EXISTS `cinemar` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cinemar`;

-- Volcando estructura para tabla cinemar.butacas
CREATE TABLE IF NOT EXISTS `butacas` (
  `idButacas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `idSala` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`idButacas`),
  KEY `FK_butacas_butacas` (`idSala`),
  CONSTRAINT `FK_butacas_butacas` FOREIGN KEY (`idSala`) REFERENCES `sala` (`idSala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.butacas: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `butacas` DISABLE KEYS */;
INSERT INTO `butacas` (`idButacas`, `nombre`, `idSala`, `status`) VALUES
	(1, 'F1C1', 5, 0),
	(2, 'F1C2', 5, 1),
	(3, 'F1C3', 5, 0),
	(4, 'F1C4', 5, 1),
	(5, 'F1C5', 5, 1),
	(6, 'F1C6', 5, 0),
	(7, 'F1C1', 7, 1),
	(8, 'F1C2', 7, 0),
	(9, 'F1C3', 7, 1),
	(10, 'F1C4', 7, 1),
	(11, 'F1C5', 7, 0),
	(12, 'F1CC6', 7, 1),
	(13, 'F1C1', 11, 0),
	(14, 'F1C2', 11, 0),
	(15, 'F1C3', 11, 0),
	(16, 'F1C4', 11, 0),
	(17, 'F1C5', 11, 0),
	(18, 'F1C6', 11, 0),
	(19, 'F1C1', 13, 1),
	(20, 'F1C2', 13, 1),
	(21, 'F1C3', 13, 1),
	(22, 'F1C4', 13, 0),
	(23, 'F1C4', 13, 0),
	(24, 'F1C6', 13, 0),
	(25, 'F1C1', 16, 0),
	(26, 'F1C2', 16, 0),
	(27, 'F1C3', 16, 0),
	(28, 'F1C4', 16, 0),
	(29, 'F1C5', 16, 0);
/*!40000 ALTER TABLE `butacas` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.cartelera
CREATE TABLE IF NOT EXISTS `cartelera` (
  `idCartelera` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(50) DEFAULT NULL,
  `idPelicula` int(11) DEFAULT NULL,
  `idSala` int(11) DEFAULT NULL,
  `precioTotal` int(11) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idCartelera`),
  KEY `FK_cartelera_sala` (`idSala`),
  KEY `FK_cartelera_peliculas` (`idPelicula`),
  CONSTRAINT `FK_cartelera_peliculas` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPeliculas`),
  CONSTRAINT `FK_cartelera_sala` FOREIGN KEY (`idSala`) REFERENCES `sala` (`idSala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.cartelera: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `cartelera` DISABLE KEYS */;
INSERT INTO `cartelera` (`idCartelera`, `hora`, `idPelicula`, `idSala`, `precioTotal`, `estado`) VALUES
	(1, '14:00:00', 5, 5, 1000, 1),
	(3, '17:15:00', 10, 5, 850, 1),
	(4, '14:00:00', 3, 7, 650, 1),
	(5, '17:30:00', 3, 7, 650, 1),
	(6, '19:00:00', 3, 7, 650, 1),
	(7, '19:00:00', 10, 11, 850, 1),
	(8, '21:00:00', 9, 16, 600, 1),
	(9, '21:00:00', 7, 11, 600, 1),
	(10, '23:00:00', 9, 13, 600, 1),
	(11, '23:30:00', 7, 11, 600, 1),
	(12, '21:45:00', 9, 13, 600, 1),
	(14, '22:30:00', 7, 16, 600, 0);
/*!40000 ALTER TABLE `cartelera` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.estado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`idEstado`, `estado`) VALUES
	(1, 'compra');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.genero: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`idGenero`, `descripcion`) VALUES
	(1, 'Comedia'),
	(2, 'Accion'),
	(3, 'Infantil'),
	(4, 'Terror'),
	(5, 'Drama'),
	(6, 'Suspenso');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.peliculas
CREATE TABLE IF NOT EXISTS `peliculas` (
  `idPeliculas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `duracion` varchar(50) NOT NULL,
  `atp` tinyint(4) NOT NULL,
  `idGenero` int(11) NOT NULL,
  `plus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPeliculas`),
  KEY `FK_paliculas_genero` (`idGenero`),
  CONSTRAINT `FK_paliculas_genero` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.peliculas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` (`idPeliculas`, `nombre`, `duracion`, `atp`, `idGenero`, `plus`) VALUES
	(3, 'Lightyear', '1h 58min', 1, 3, NULL),
	(5, 'Jurassic World: Dominion', '2h 10min', 1, 1, NULL),
	(7, 'The Black Phone', '1h 50min', 0, 4, NULL),
	(9, 'Top Gun: Maverick', '1h 56min', 1, 2, NULL),
	(10, 'Thor', '2h45min', 1, 2, 'estreno'),
	(11, 'HarryPotter', '3h10m', 1, 3, 'estreno');
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `idTipoPago` int(11) NOT NULL,
  `idCartelera` int(11) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `FK_reserva_usuario` (`idUsuario`),
  KEY `FK_reserva_estado` (`idEstado`),
  KEY `FK_reserva_tipopago` (`idTipoPago`),
  KEY `FK_reserva_cartelera` (`idCartelera`),
  CONSTRAINT `FK_reserva_cartelera` FOREIGN KEY (`idCartelera`) REFERENCES `cartelera` (`idCartelera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reserva_estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reserva_tipopago` FOREIGN KEY (`idTipoPago`) REFERENCES `tipo_pago` (`id_tipoPago`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reserva_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.reserva: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` (`idReserva`, `idUsuario`, `idEstado`, `idTipoPago`, `idCartelera`) VALUES
	(6, 1, 1, 1, 6),
	(7, 1, 1, 1, 5),
	(8, 1, 1, 1, 6),
	(9, 3, 1, 1, 4),
	(10, 3, 1, 1, 9),
	(11, 3, 1, 1, 10),
	(12, 3, 1, 1, 4),
	(13, 5, 1, 1, 4),
	(17, 7, 1, 1, 11),
	(19, 7, 1, 1, 8);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.reserva_butacas
CREATE TABLE IF NOT EXISTS `reserva_butacas` (
  `idButaca` int(11) NOT NULL,
  `idReserva` int(11) NOT NULL,
  PRIMARY KEY (`idButaca`,`idReserva`),
  KEY `FK__reserva` (`idReserva`),
  CONSTRAINT `FK__butacas` FOREIGN KEY (`idButaca`) REFERENCES `butacas` (`idButacas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__reserva` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.reserva_butacas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reserva_butacas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_butacas` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.rol_usuarios
CREATE TABLE IF NOT EXISTS `rol_usuarios` (
  `id_rol_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_rol_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.rol_usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol_usuarios` DISABLE KEYS */;
INSERT INTO `rol_usuarios` (`id_rol_usuarios`, `descripcion`) VALUES
	(1, 'admin'),
	(2, 'usuario comun');
/*!40000 ALTER TABLE `rol_usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.sala
CREATE TABLE IF NOT EXISTS `sala` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `capacidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idTiposala` int(11) NOT NULL,
  PRIMARY KEY (`idSala`),
  KEY `FK_sala_tiposala` (`idTiposala`),
  CONSTRAINT `FK_sala_tiposala` FOREIGN KEY (`idTiposala`) REFERENCES `tipo_sala` (`id_tipoSala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.sala: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` (`idSala`, `capacidad`, `nombre`, `idTiposala`) VALUES
	(5, 350, 'Sala 1', 1),
	(7, 322, 'Sala 2', 2),
	(11, 320, 'Sala 3', 1),
	(13, 310, 'Sala 4', 1),
	(16, 400, 'Sala 5', 2),
	(17, 290, 'Sala 6 ', 1),
	(18, 300, 'Sala 7', 1),
	(19, 250, 'sala 8', 2);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.tipo_pago
CREATE TABLE IF NOT EXISTS `tipo_pago` (
  `id_tipoPago` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPago` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.tipo_pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` (`id_tipoPago`, `tipoPago`) VALUES
	(1, 'efectivo');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.tipo_sala
CREATE TABLE IF NOT EXISTS `tipo_sala` (
  `id_tipoSala` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipoSala`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.tipo_sala: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_sala` DISABLE KEYS */;
INSERT INTO `tipo_sala` (`id_tipoSala`, `descripcion`) VALUES
	(1, '2D'),
	(2, '3D');
/*!40000 ALTER TABLE `tipo_sala` ENABLE KEYS */;

-- Volcando estructura para tabla cinemar.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idRol` int(11) DEFAULT 2,
  `esFrecuente` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_usuario`),
  KEY `FK__rol_usuarios` (`idRol`),
  CONSTRAINT `FK__rol_usuarios` FOREIGN KEY (`idRol`) REFERENCES `rol_usuarios` (`id_rol_usuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cinemar.usuario: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `apellido`, `nombre`, `email`, `dni`, `password`, `idRol`, `esFrecuente`) VALUES
	(1, 'Palisa', 'Carlos', 'carlospalisa@gmail.com', '25571370', 'admin1', 1, 1),
	(2, 'Moyano', 'Sergio', 'sergio@moyano.com', '22222222', 'admin2', 1, 1),
	(3, 'Valdez', 'Cristian', 'cristian@valdez', '33333333', 'user1', 2, 1),
	(4, 'Rivero', 'Victor Hugo', 'victorhugo@rivero.com', '44444444', 'user2', 2, 1),
	(5, 'perez', 'juan', 'algo@correo.com', '55555', '123', 2, 0),
	(6, 'Chiri', 'Jairo', 'admin', '121212', 'admin', 1, 0),
	(7, 'Chiri', 'Jairo', 'user', '121212', 'user', 2, 0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
