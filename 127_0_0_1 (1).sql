-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 21, 2020 at 02:22 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cadastro`
--
CREATE DATABASE IF NOT EXISTS `cadastro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cadastro`;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `idcurso` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` text,
  `carga` int(10) UNSIGNED DEFAULT NULL,
  `aulastotais` int(11) DEFAULT NULL,
  `anoinicio` year(4) DEFAULT '2020',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`idcurso`, `nome`, `descricao`, `carga`, `aulastotais`, `anoinicio`) VALUES
(1, 'HTML5', 'Curso de HTML5', 40, 37, 2014),
(2, 'JavaScript', 'Curso de JavaScript', 80, 56, 2019),
(3, 'Java', 'Curso de Java', 10, 2, 2010),
(4, 'C#', 'Curso de C#', 24, 22, 2018),
(5, 'F#', 'Curso de F#', 16, 20, 2018),
(6, 'Node.js', 'Curso de node.js para bot de discord', 128, 79, 2019),
(7, 'Algoritmos', 'Curso de lógica de programação', 37, 15, 2017),
(8, 'Unity', 'Curso de jogos em Unity', 8, 2, 2019),
(9, 'MySQL', 'Curso de banco de dados MySQL', 19, 10, 2020),
(10, 'Git', 'Curso de git para github', 2, 1, 2020),
(11, 'TADS', 'faculdade', 3000, 400, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `profissao` varchar(50) NOT NULL DEFAULT 'desempregado(a)',
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `nascimento`, `profissao`, `sexo`, `peso`, `altura`, `nacionalidade`) VALUES
(1, 'Godofredo', '1984-01-02', 'Jornalista', 'M', '78.50', '1.83', 'Brasil'),
(2, 'Maria', '1999-12-13', 'Jardineira', 'F', '68.53', '1.62', 'México'),
(3, 'Felipe', '2002-03-17', 'Pedreiro', 'M', '73.15', '1.74', 'Brasil'),
(4, 'José Samuel', '2001-01-07', 'Biólogo', 'M', '85.85', '1.64', 'Congo'),
(5, 'Ana', '1989-05-25', 'Engenheiro Civíl', 'F', '71.40', '1.69', 'EUA'),
(6, 'Pedro', '2000-03-30', 'Engenheiro Civíl', 'M', '70.99', '1.81', 'Portugal'),
(7, 'Kirito', '1998-05-01', 'Espadachin', 'M', '75.70', '1.79', 'Japão'),
(8, 'Rodrigo', '2000-01-01', 'desempregado(a)', 'M', '83.45', '1.90', 'Brasil'),
(9, 'Jéssica', '1997-06-06', 'desempregado(a)', 'F', '70.10', '1.70', 'Brasil'),
(10, 'Gabriela', '1998-07-07', 'Bibliotecária', 'F', '64.40', '1.66', 'Brasil');
--
-- Database: `pessoas1`
--
CREATE DATABASE IF NOT EXISTS `pessoas1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `pessoas1`;

-- --------------------------------------------------------

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `nome` varchar(30) DEFAULT NULL,
  `idade` tinyint(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
CREATE TABLE IF NOT EXISTS `amigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `nascimento` date DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `telefone` (`telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amigos`
--

INSERT INTO `amigos` (`id`, `nome`, `sexo`, `nascimento`, `telefone`) VALUES
(1, 'Leonardo', 'M', '2002-01-08', '4133495713'),
(2, 'José Samuel', 'M', '2001-04-06', '4157864879'),
(3, 'Ana Joaquim', 'F', '1999-01-03', '4166666667'),
(4, 'Rigzara', 'M', '2012-01-22', '415846843518465'),
(5, 'Felipe', 'M', '1567-11-03', '44445579');
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
CREATE TABLE IF NOT EXISTS `amigos` (
  `a` int(11) NOT NULL,
  `s` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `f` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
