-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2023 at 07:52 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database if not exists db_game;
use db_game;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_game`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` varchar(128) NOT NULL,
  `text` mediumtext NOT NULL,
  `a` mediumtext NOT NULL,
  `b` mediumtext NOT NULL,
  `c` mediumtext NOT NULL,
  `d` mediumtext NOT NULL,
  `answer` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `text`, `a`, `b`, `c`, `d`, `answer`) VALUES
('q_0', 'Dalam sebuah deret aritmetika, suku pertama adalah 2, dan suku ketiga adalah 10. Berapa suku kedelapan dalam deret tersebut?\r\n', '20', '22', '24', '26', 'c'),
('q_1', 'Jika 5 orang dapat menyelesaikan pekerjaan dalam waktu 10 hari, berapa lama waktu yang dibutuhkan 8 orang untuk menyelesaikan pekerjaan yang sama?', '4 hari', '5 hari', '6 hari', '8 hari', 'c'),
('q_2', 'Sebuah tim sepak bola terdiri dari 11 pemain. Dalam satu pertandingan, setiap pemain mencetak gol satu kali kecuali satu pemain yang mencetak dua gol. Berapa gol total yang dicetak oleh tim tersebut dalam pertandingan?', '11', '12', '13', '14', 'b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
