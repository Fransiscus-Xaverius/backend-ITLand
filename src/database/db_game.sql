-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 02:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_game`
--
CREATE DATABASE IF NOT EXISTS `db_game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_game`;

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
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `username` varchar(256) NOT NULL,
  `B1_amount` int(11) NOT NULL,
  `B2_amount` int(11) NOT NULL,
  `B3_amount` int(11) NOT NULL,
  `pickaxeLevel` int(11) NOT NULL,
  `shovelLevel` int(11) NOT NULL,
  `swordLevel` int(11) NOT NULL
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
('q_0', 'Jika ada 5 buah rumah, masing-masing memiliki 5 buah jendela, dan dalam setiap jendela ada 5 ekor lalat. Berapa banyak lalat yang ada di total?', '125', '25', '5', '500', 'c'),
('q_1', 'Jika Anda memiliki tiga potongan kawat yang masing-masing membutuhkan waktu satu jam untuk terbakar sepenuhnya. Jika Anda dapat membakar kawat-kawat tersebut tidak teratur dan Anda hanya memiliki dua alat pembakar, berapa lama waktu minimum yang diperlukan untuk membakar semua kawat tersebut?', '1 jam', '1.5 jam', '2 jam', '3 jam', 'a'),
('q_10', 'Sebuah kapal berlayar ke utara. Kaptennya memiliki sepuluh anak laki-laki. Setiap anak memiliki seorang saudara perempuan. Berapa banyak orang di kapal itu?', '10', '11', '12', '21', '11'),
('q_11', 'Jika Anda melemparkan satu dadu, berapa peluang mendapatkan angka genap?', '1/2', '1/3', '1/4', '2/3', '1/2'),
('q_12', 'Dalam urutan Fibonacci (1, 1, 2, 3, 5, 8, ...), berapa hasil dari 10 pangkat 2?', '55', '89', '100', '144', '144'),
('q_13', 'Sebuah ruangan berbentuk segitiga sama sisi dengan panjang sisi 10 meter. Berapa kelilingnya?', '20 meter', '30 meter', '40 meter', '50 meter', '30 meter'),
('q_14', 'Jika Anda berdiri di tengah hutan dan membuang koin ke atas, apa kemungkinan koin tersebut akan mendarat di atas pohon?', '50%', '25%', '0%', '10%', '0%'),
('q_15', 'Berapa jumlah sudut dalam sebuah heptagon?', '5', '7', '9', '11', '11'),
('q_16', 'Dalam dunia matematika, apa nama yang diberikan untuk bilangan yang hanya memiliki dua faktor positif: 1 dan bilangan itu sendiri?', 'Bilangan asli', 'Bilangan bulat', 'Bilangan prima', 'Bilangan rasional', 'c'),
('q_17', 'Apa nama garis yang memotong segmen segitiga dari sudut tumpul ke sisi lawan secara tegak lurus?', 'Garis median', 'Garis tinggi', 'Garis inkruen', 'Garis euler', 'b'),
('q_18', 'Berapa banyak pemain dalam tim sepak bola yang bermain dalam satu pertandingan reguler?', '9', '11', '13', '15', 'b'),
('q_19', 'Dalam teori relativitas khusus, siapa yang merumuskan persamaan ikonik E=mc^2?', 'Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'Galileo Galilei', 'a'),
('q_2', 'Sebuah kapal yang penuh dengan penumpang berlayar melintasi sungai. Jika satu penumpang jatuh ke dalam sungai, berapa banyak penumpang yang tersisa di kapal?', 'Tidak ada yang tersisa', 'Semua penumpang tersisa', 'Setengah penumpang tersisa', 'Tergantung pada ukuran sungai', 'b'),
('q_20', 'Dalam sebuah deret aritmetika, suku pertama adalah 2, dan suku ketiga adalah 10. Berapa suku kedelapan dalam deret tersebut?\r\n', '20', '22', '24', '26', 'c'),
('q_21', 'Jika 5 orang dapat menyelesaikan pekerjaan dalam waktu 10 hari, berapa lama waktu yang dibutuhkan 8 orang untuk menyelesaikan pekerjaan yang sama?', '4 hari', '5 hari', '6 hari', '8 hari', 'c'),
('q_22', 'Sebuah tim sepak bola terdiri dari 11 pemain. Dalam satu pertandingan, setiap pemain mencetak gol satu kali kecuali satu pemain yang mencetak dua gol. Berapa gol total yang dicetak oleh tim tersebut dalam pertandingan?', '11', '12', '13', '14', 'b'),
('q_23', 'Sebuah pesawat terbang dari kota A ke kota B dengan kecepatan 500 km per jam dan kembali dari kota B ke kota A dengan kecepatan 600 km per jam. Berapa rata-rata kecepatan pesawat selama seluruh perjalanan?', '550 km/h', '560 km/h', '570 km/h', '580 km/h', 'a'),
('q_24', 'Jika 6 orang dapat menyelesaikan pekerjaan dalam waktu 12 hari, berapa lama waktu yang dibutuhkan 4 orang untuk menyelesaikan pekerjaan yang sama?', '6 hari', '8 hari', '9 hari', '12 hari', 'b'),
('q_25', 'Jika Anda memiliki dua gelas, salah satunya berisi air dingin dan yang lainnya berisi air panas, dan Anda menuangkan keduanya ke satu gelas, apa suhu akhirnya?', 'Air hangat', 'Air dingin', 'Air suam-suam kuku', 'Air panas', 'c'),
('q_26', 'Seorang petani memiliki 17 ekor domba. Semua kecuali sembilan mati. Berapa domba yang tersisa?', '8', '9', '17', 'Sembilan', 'b'),
('q_27', 'Berapa jumlah sudut tumpul dalam segitiga?', '1', '2', '3', '0', 'd'),
('q_28', 'Jika Anda memiliki 100 apel dan Anda mengambil 98 apel, berapa apel yang Anda miliki sekarang?', '98', '100', '2', '0', 'b'),
('q_29', 'Berapa jumlah planet dalam tata surya kita?', '7', '8', '9', '10', 'b'),
('q_3', 'Anda memasuki sebuah ruangan yang memiliki 3 saklar lampu. Setiap saklar terhubung dengan satu lampu di ruangan yang berbeda. Anda dapat memeriksa ruangan hanya sekali. Bagaimana Anda tahu saklar yang terhubung dengan lampu yang nyala?', 'Tekan saklar pertama', 'Tekan saklar kedua', 'Tekan saklar ketiga', 'Lihat ke dalam ruangan', 'a'),
('q_30', 'Dalam teori relativitas khusus, siapa yang merumuskan persamaan ikonik E=mc^2?', 'Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'Galileo Galilei', 'a'),
('q_31', 'Sebuah kapal berlayar ke utara. Kaptennya memiliki sepuluh anak laki-laki. Setiap anak memiliki seorang saudara perempuan. Berapa banyak orang di kapal itu?', '10', '11', '12', '21', '11'),
('q_32', 'Jika lima burung duduk di pohon dan Anda menembak satu di antaranya, berapa burung yang tersisa di pohon?', '4', '1', '0', '5', '0'),
('q_33', 'Dalam urutan Fibonacci (1, 1, 2, 3, 5, 8, ...), berapa hasil dari 10 pangkat 2?', '55', '89', '100', '144', '144'),
('q_34', 'Apa yang menjadi angka berikutnya dalam deret angka ini: 2, 6, 12, 20, 30, ...?', '40', '42', '44', '46', 'c'),
('q_35', 'Dalam sekelompok orang, setiap pria memiliki seorang anak, dan setiap anak memiliki setengah dari jumlah ayah yang ada. Berapa jumlah orang di dalam kelompok tersebut?', '2', '3', '4', 'Tidak dapat dihitung', 'c'),
('q_36', 'Dalam dunia matematika, apa nama yang diberikan untuk bilangan yang hanya memiliki dua faktor positif: 1 dan bilangan itu sendiri?', 'Bilangan asli', 'Bilangan bulat', 'Bilangan prima', 'Bilangan rasional', 'c'),
('q_37', 'Berapa akar kuadrat dari 144?', '6', '8', '10', '12', 'a'),
('q_38', 'Sebuah ruangan berbentuk segitiga sama sisi dengan panjang sisi 10 meter. Berapa kelilingnya?', '20 meter', '30 meter', '40 meter', '50 meter', '30 meter'),
('q_39', 'Jika Anda melemparkan satu dadu, berapa peluang mendapatkan angka genap?', '1/2', '1/3', '1/4', '2/3', '1/2'),
('q_4', 'Jika Anda memiliki dua kertas berukuran sama dan sejajar satu sama lain, kemudian Anda memotong salah satunya menjadi 10 potongan, berapa banyak potongan kertas yang Anda miliki?', '10', '11', '12', '20', 'c'),
('q_40', 'Dalam 24 jam, berapa kali kedua jarum jam akan bertemu tepat di atas satu sama lain?', '1', '2', '3', '4', 'a'),
('q_41', 'Jika Anda memiliki tiga potongan kawat yang masing-masing membutuhkan waktu satu jam untuk terbakar sepenuhnya. Jika Anda dapat membakar kawat-kawat tersebut tidak teratur dan Anda hanya memiliki dua alat pembakar, berapa lama waktu minimum yang diperlukan untuk membakar semua kawat tersebut?', '1 jam', '1.5 jam', '2 jam', '3 jam', 'a'),
('q_5', 'Sebuah mobil berjalan dengan kecepatan konstan selama 30 mph selama satu jam. Berapa jarak yang telah ditempuh mobil tersebut?', '10 mil', '20 mil', '30 mil', '60 mil', 'c'),
('q_6', 'Dalam sekelompok orang, setiap pria memiliki seorang anak, dan setiap anak memiliki setengah dari jumlah ayah yang ada. Berapa jumlah orang di dalam kelompok tersebut?', '2', '3', '4', 'Tidak dapat dihitung', 'c'),
('q_7', 'Jika lima burung duduk di pohon dan Anda menembak satu di antaranya, berapa burung yang tersisa di pohon?', '4', '1', '0', '5', '0'),
('q_8', 'Berapa akar kuadrat dari 144?', '6', '8', '10', '12', 'a'),
('q_9', 'Dalam 24 jam, berapa kali kedua jarum jam akan bertemu tepat di atas satu sama lain?', '1', '2', '3', '4', 'a');

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
('U001', 'test1', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U002', 'test2', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U003', 'test3', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U004', 'test4', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U005', 'test5', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U006', 'test6', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U007', 'test7', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U008', 'test8', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U009', 'test9', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U010', 'test10', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U011', 'test11', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U012', 'test12', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U013', 'test13', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U014', 'test14', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U015', 'test15', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U016', 'test16', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U017', 'test17', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U018', 'test18', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U019', 'test19', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U020', 'test20', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U021', 'test21', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U022', 'test22', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U023', 'test23', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U024', 'test24', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U025', 'test25', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U026', 'test26', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U027', 'test27', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U028', 'test28', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U029', 'test29', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U030', 'test30', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0);

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
