-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 26, 2024 at 02:00 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_galerifoto`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `albumid` int NOT NULL AUTO_INCREMENT,
  `namaalbum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggalbuat` date NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`albumid`),
  KEY `UserID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggalbuat`, `userid`) VALUES
(11, 'teknologi', 'keyborad', '2024-08-20', 3),
(9, 'teknologi', 'Iphone 13', '2024-08-20', 3),
(8, 'Otomotif', 'mobil', '2024-08-20', 3),
(21, 'Teknologi', 'Iphone 13', '2024-08-22', 22),
(23, 'Otomotif', 'Mobil', '2024-08-22', 22),
(22, 'Teknologi', 'keyborad', '2024-08-22', 22);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `fotoid` int NOT NULL AUTO_INCREMENT,
  `judulfoto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsifoto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggalunggah` date NOT NULL,
  `lokasifile` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `albumid` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`fotoid`),
  KEY `AlbumID` (`albumid`),
  KEY `UserID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `albumid`, `userid`) VALUES
(47, 'keyborad', 'bagus', '2024-08-22', '1931085448-keyboard.jpeg', 22, 22),
(48, 'mobil', '                                    keren                                  ', '2024-08-22', '1468211870-mobil.jpeg', 23, 22),
(46, 'Iphone 13', 'hijau', '2024-08-22', '2141512975-Iphone 13.jpeg', 21, 22),
(35, 'keyborad', 'bagus', '2024-08-20', '1895960065-keyboard.jpeg', 11, 3),
(34, 'mobil', 'lucu', '2024-08-20', '45679523-mobil.jpeg', 8, 3),
(33, 'Iphone 13', 'hijau', '2024-08-20', '832503232-Iphone 13.jpeg', 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

DROP TABLE IF EXISTS `komentarfoto`;
CREATE TABLE IF NOT EXISTS `komentarfoto` (
  `komentarid` int NOT NULL AUTO_INCREMENT,
  `fotoid` int NOT NULL,
  `userid` int NOT NULL,
  `isikomentar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggalkomentar` date NOT NULL,
  PRIMARY KEY (`komentarid`),
  KEY `FotoID` (`fotoid`),
  KEY `UserID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 35, 3, 'KREN', '2024-08-22'),
(2, 34, 3, 'keren sekali broo', '2024-08-22'),
(3, 34, 3, 'bagus', '2024-08-22'),
(4, 35, 3, 'keren sekali broo', '2024-08-22'),
(5, 43, 22, 'keren sekali broo', '2024-08-22'),
(6, 47, 22, 'keren sekali broo', '2024-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

DROP TABLE IF EXISTS `likefoto`;
CREATE TABLE IF NOT EXISTS `likefoto` (
  `likeid` int NOT NULL AUTO_INCREMENT,
  `fotoid` int NOT NULL,
  `userid` int NOT NULL,
  `tanggallike` date NOT NULL,
  PRIMARY KEY (`likeid`),
  KEY `FotoID` (`fotoid`),
  KEY `UserID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(38, 48, 22, '2024-08-22'),
(32, 35, 3, '2024-08-22'),
(34, 44, 22, '2024-08-22'),
(40, 47, 22, '2024-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `namalengkap` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(22, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'aa@gmail.com', 'admin', 'tg.selor'),
(34, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'adm@gamail.com', 'admin', 'tg.selor'),
(33, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'adm@gamail.com', 'admin', 'tg.selor'),
(26, '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'admin', 'tg.selor'),
(27, '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'admin', 'tg.selor'),
(28, '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'admin', 'tg.selor'),
(29, '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'admin', 'tg.selor'),
(30, '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'admin', 'tg.selor'),
(31, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'adm@gamail.com', 'admin', 'tg.selor'),
(32, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'adm@gamail.com', 'admin', 'tg.selor');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
