-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2023 at 09:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

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
-- Table structure for table `entity`
--

CREATE TABLE `entity` (
  `entity_name` varchar(128) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `energy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `tile`
--

CREATE TABLE `tile` (
  `tile_name` varchar(128) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `score`) VALUES
('U001', 'test1', '12345678', 0),
('U002', 'test2', '12345678', 0),
('U003', 'test3', '12345678', 0),
('U004', 'test4', '12345678', 0),
('U005', 'test5', '12345678', 0),
('U006', 'test6', '12345678', 0),
('U007', 'test7', '12345678', 0),
('U008', 'test8', '12345678', 0),
('U009', 'test9', '12345678', 0),
('U010', 'test10', '12345678', 0),
('U011', 'test11', '12345678', 0),
('U012', 'test12', '12345678', 0),
('U013', 'test13', '12345678', 0),
('U014', 'test14', '12345678', 0),
('U015', 'test15', '12345678', 0),
('U016', 'test16', '12345678', 0),
('U017', 'test17', '12345678', 0),
('U018', 'test18', '12345678', 0),
('U019', 'test19', '12345678', 0),
('U020', 'test20', '12345678', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
