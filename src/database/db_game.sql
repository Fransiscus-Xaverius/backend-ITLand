-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 04:52 AM
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
('q_1', 'Jika Anda berdiri di tengah hutan dan membuang koin ke atas, apa kemungkinan koin tersebut akan mendarat di atas pohon?', '50%', '25%', '0%', '10%', 'c'),
('q_10', 'Jika 6 orang dapat menyelesaikan pekerjaan dalam waktu 12 hari, berapa lama waktu yang dibutuhkan 4 orang untuk menyelesaikan pekerjaan yang sama?', '6 hari', '8 hari', '9 hari', '12 hari', 'b'),
('q_100', 'Sebuah balok berukuran panjang 8 cm, lebar 6 cm dan tinggi 4 cm dimasukkan ke dalam sebuah kotak berbentuk kubus. Sisi dalam kotak yang paling kecil agar balok muat di dalamnya adalah', '4 cm', '6 m', '8 m', '12 m', 'c'),
('q_101', 'Segitiga siku-siku memiliki sisi siku-siku 3 cm dan 4 cm. Jika luas segitiga 24 cm2, maka panjang sisi miringnya adalah', '5 cm', '6 m', '7 m', '8 m', 'a'),
('q_102', 'Sebuah kubus memiliki volume 64 cm3. Luas permukaan kubus tersebut adalah', '24 cm2', '48 cm2', '96 cm2', '192 cm2', 'c'),
('q_103', 'grafik fungsi f(x) = 2x + 3 memotong sumbu Y di', '(0,3)', ' (3,0)', '(-3,0)', '(0,-3)', 'a'),
('q_104', 'Luas lingkaran dengan keliling 44 cm adalah', '154 cm2', '77 cm2', '38,5 cm2', '19,25 cm2', 'a'),
('q_105', 'Volume kerucut dengan jari-jari alas 7 cm dan tinggi 14 cm adalah', ' 343 cm3', '294 cm3', '718 cm3', '98 cm3', 'c'),
('q_106', 'Luas permukaan kubus dengan panjang rusuk 7 cm adalah', '294 cm2', '196 cm2', '147 cm2', '98 cm2', 'a'),
('q_107', 'Dalam segitiga siku-siku ABC dengan sudut A = 90°, nilai cos A adalah', '0', '1/2', '1', '2', 'a'),
('q_108', 'Jika diketahui luas lingkaran adalah 78,5 cm2, maka jari-jari lingkaran tersebut adalah', '5 cm', '6 cm', '7 cm', ' 8 cm', 'a'),
('q_109', 'Volume kerucut dengan jari-jari alas 10 cm dan tinggi 15 cm adalah', '3070 cm3', '1570 cm3', '1560 cm3', ' 570 cm3', 'b'),
('q_11', 'Jika Anda memiliki dua gelas, salah satunya berisi air dingin dan yang lainnya berisi air panas, dan Anda menuangkan keduanya ke satu gelas, apa suhu akhirnya?', 'Air hangat', 'Air dingin', 'Air suam-suam kuku', 'Air panas', 'c'),
('q_110', 'Akar kuadrat dari 169 adalah', '9', '12', '13', '16', 'c'),
('q_111', 'Luas segitiga dengan alas 8 cm dan tinggi 10 cm adalah', '40 cm2', '48 cm2', '50 cm2', '80 cm2', 'a'),
('q_112', 'Sebuah persegi panjang mempunyai luas 120 cm2. Jika panjangnya 30 cm, lebarnya adalah', '2 cm', '3 cm', '4 cm', '5 cm', 'c'),
('q_113', 'Luas permukaan tabung dengan diameter 14 cm dan tinggi 21 cm adalah', '924 cm2', '1134 cm2', '1230 cm2', '1568 cm2', 'c'),
('q_114', 'Volume bola dengan jari-jari 7 cm adalah', '693 cm3', '1436 cm3', '2744 cm3', '4186 cm3', 'b'),
('q_115', 'Panjang sisi persegi yang luasnya sama dengan luas lingkaran berjari-jari 10 cm adalah', '15.72 cm', '16.72 cm', '12.72 cm', '17.72 cm', 'd'),
('q_116', 'Volume tabung dengan jari-jari alas 7 cm dan tinggi 30 cm adalah', '2450 cm3', '4620 cm3', '1225 cm3', ' 615 cm3', 'b'),
('q_117', 'Jika diketahui sin A = 0,8 maka nilai A adalah', '36°', '37°', '53°', '63°', 'c'),
('q_118', 'Luas permukaan balok dengan ukuran 10 cm x 8 cm x 6 cm adalah', '344 cm2', '376 cm2', '520 cm2', '600 cm2', 'b'),
('q_119', 'Volume kerucut dengan jari-jari alas 14 cm dan tinggi 15 cm adalah', '3080 cm^3', '1680 cm3', '1120 cm3', '560 cm3', 'a'),
('q_12', 'Seorang petani memiliki 17 ekor domba. Semua kecuali sembilan mati. Berapa domba yang tersisa?', '8', '9', '17', 'Sembilan', 'b'),
('q_120', 'Dalam deret aritmatika, suku ke-5 adalah 15 dan suku ke-11 adalah 39. Suku pertama deret tersebut adalah', '-1', '5', '7', '9', 'a'),
('q_121', 'Luas permukaan balok dengan panjang 5 m, lebar 3 m, dan tinggi 2 m adalah', '52 m2', '62 m2', '72 m2', '82 m2', 'b'),
('q_122', 'Keliling lingkaran dengan diameter 28 cm adalah', '44 cm', '66 cm', '88 cm', '132 cm', 'c'),
('q_123', 'Jika sin A = 0,6 dan cos A = 0,8, maka nilai tan A adalah', '0,4', '0,5', '0,75', '1,5', 'c'),
('q_124', 'Volume limas segiempat beraturan dengan panjang sisi alas 10 cm dan tinggi 15 cm adalah', '500 cm3', '750 cm3', '1000 cm3', '1250 cm3', 'a'),
('q_125', 'Dalam sebuah kelas, jumlah siswa laki-laki 16 orang dan perempuan 28 orang. Rasio siswa laki-laki dan perempuan adalah', '4:7', '3:5', '2:3', '4:5', 'a'),
('q_126', 'Volume kerucut dengan tinggi 30 cm dan jari-jari alas 14 cm adalah', '3080 cm3', '2520 cm3', '1680 cm3', '6160 cm3', 'd'),
('q_127', 'Luas permukaan limas segiempat beraturan dengan sisi alas 10 cm dan tinggi 12 cm adalah', '240 cm2', '340 cm2', '480 cm2', '600 cm2', 'b'),
('q_128', 'Sebuah tangga bersandar pada tembok dengan sudut elevasi 45°. Jika panjang tangga 16 m, maka jarak kaki tangga dari tembok adalah', '8√2 m', '10√2 m', '12√2 m', '16√2 m', 'a'),
('q_129', 'Luas permukaan tabung dengan jari-jari alas 7 cm dan tinggi 30 cm adalah', '1225 cm2', '2450 cm2', '1628 cm2', '4900 cm2', 'c'),
('q_13', 'Berapa jumlah sudut tumpul dalam segitiga?', '1', '2', '3', '0', 'd'),
('q_130', 'Volume limas segitiga dengan alas berbentuk segitiga sama sisi dengan sisi 10 cm dan tinggi 15 cm adalah', '250 cm3', '1000 cm3', '1250 cm3', '1500 cm3', 'a'),
('q_14', 'Jika Anda memiliki 100 apel dan Anda mengambil 98 apel, berapa apel yang Anda miliki sekarang?', '98', '100', '2', '0', 'b'),
('q_15', 'Berapa jumlah planet dalam tata surya kita?', '7', '8', '9', '10', 'b'),
('q_16', 'Anda memasuki sebuah ruangan yang memiliki 3 saklar lampu. Setiap saklar terhubung dengan satu lampu di ruangan yang berbeda. Anda dapat memeriksa ruangan hanya sekali. Bagaimana Anda tahu saklar yang terhubung dengan lampu yang nyala?', 'Tekan saklar pertama', 'Tekan saklar kedua', 'Tekan saklar ketiga', 'Lihat ke dalam ruangan', 'a'),
('q_17', 'Dalam teori relativitas khusus, siapa yang merumuskan persamaan ikonik E=mc^2?', 'Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'Galileo Galilei', 'a'),
('q_18', 'Sebuah kapal berlayar ke utara. Kaptennya memiliki sepuluh anak laki-laki. Setiap anak memiliki seorang saudara perempuan. Berapa banyak orang di kapal itu?', '10', '11', '12', '21', 'b'),
('q_19', 'Dalam urutan Fibonacci (1, 1, 2, 3, 5, 8, ...), berapa hasil dari 10 pangkat 2?', '55', '89', '100', '144', 'd'),
('q_2', 'Berapa jumlah sudut dalam sebuah heptagon?', '5', '7', '9', '11', 'd'),
('q_20', 'Apa yang menjadi angka berikutnya dalam deret angka ini: 2, 6, 12, 20, 30, ...?', '40', '42', '44', '46', 'c'),
('q_21', 'Dalam dunia matematika, apa nama yang diberikan untuk bilangan yang hanya memiliki dua faktor positif: 1 dan bilangan itu sendiri?', 'Bilangan asli', 'Bilangan bulat', 'Bilangan prima', 'Bilangan rasional', 'c'),
('q_22', 'Sebuah ruangan berbentuk segitiga sama sisi dengan panjang sisi 10 meter. Berapa kelilingnya?', '20 meter', '30 meter', '40 meter', '50 meter', 'b'),
('q_23', 'Jika Anda melemparkan satu dadu, berapa peluang mendapatkan angka genap?', '1/2', '1/3', '1/4', '2/3', 'a'),
('q_24', 'Jika Anda memiliki dua kertas berukuran sama dan sejajar satu sama lain, kemudian Anda memotong salah satunya menjadi 10 potongan, berapa banyak potongan kertas yang Anda miliki?', '10', '11', '12', '20', 'c'),
('q_25', 'Jika Anda memiliki tiga potongan kawat yang masing-masing membutuhkan waktu satu jam untuk terbakar sepenuhnya. Jika Anda dapat membakar kawat-kawat tersebut tidak teratur dan Anda hanya memiliki dua alat pembakar, berapa lama waktu minimum yang diperlukan untuk membakar semua kawat tersebut?', '1 jam', '1.5 jam', '2 jam', '3 jam', 'a'),
('q_26', 'Sebuah mobil berjalan dengan kecepatan konstan selama 30 mph selama satu jam. Berapa jarak yang telah ditempuh mobil tersebut?', '10 mil', '20 mil', '30 mil', '60 mil', 'c'),
('q_27', 'Dalam sekelompok orang, setiap pria memiliki seorang anak, dan setiap anak memiliki setengah dari jumlah ayah yang ada. Berapa jumlah orang di dalam kelompok tersebut?', '2', '3', '4', 'Tidak dapat dihitung', 'c'),
('q_28', 'Jika lima burung duduk di pohon dan Anda menembak satu di antaranya, berapa burung yang tersisa di pohon?', '4', '1', '0', '5', 'c'),
('q_29', 'Berapa akar kuadrat dari 144?', '6', '8', '10', '12', 'a'),
('q_3', 'Apa nama garis yang memotong segmen segitiga dari sudut tumpul ke sisi lawan secara tegak lurus?', 'Garis median', 'Garis tinggi', 'Garis inkruen', 'Garis euler', 'b'),
('q_30', 'Dalam 24 jam, berapa kali kedua jarum jam akan bertemu tepat di atas satu sama lain?', '1', '2', '3', '4', 'a'),
('q_31', 'Jika sebuah segitiga memiliki panjang sisi 3 cm, 4 cm, dan 5 cm, maka segitiga tersebut adalah segitiga apa?', 'Siku-siku', 'Sama sisi', 'Sama kaki', 'Sembarang', 'a'),
('q_32', 'Jika sebuah lingkaran memiliki jari-jari sepanjang 7 cm, berapakah keliling lingkaran tersebut?', '14 cm', '22 cm', '44 cm', '154 cm', 'c'),
('q_33', ' 20% dari 80 adalah berapa?', '8', '16', '24', '32', 'b'),
('q_34', '2/3 dari sebuah jumlah adalah 18, berapakah jumlah tersebut?', '12', '24', '27', '36', 'c'),
('q_35', 'Berapakah hasil dari 5 pangkat 3?', '10', '15', '25', '125', 'd'),
('q_36', 'Jika sebuah segitiga memiliki keliling 24 cm dan panjang dua sisinya adalah 8 cm dan 10 cm, berapakah panjang sisinya yang tersisa?', '4', '6', '8', '12', 'b'),
('q_37', 'Jika harga sebuah buku adalah $15 dan diskon 20%, berapa harga akhirnya?', '$12', '$13', '$14', '$15', 'a'),
('q_38', 'Jika sebuah persegi panjang memiliki panjang 12 cm dan lebar 5 cm, berapakah luasnya?', '17 cm^2', ' 30 cm^2', '60 cm^2', '72 cm^2', 'c'),
('q_39', 'Jika sebuah kubus memiliki panjang sisi 4 cm, berapakah volume kubus tersebut?', '8 cm^3', '16 cm^3', '32 cm^3', '64 cm^3', 'd'),
('q_4', 'Berapa banyak pemain dalam tim sepak bola yang bermain dalam satu pertandingan reguler?', '9', '11', '13', '15', 'b'),
('q_40', 'Jika sebuah jam menunjukkan pukul 3:45, berapa sudut antara jarum jam dan jarum menit?', '120 derajat', '145 derajat', '157 derajat', '175 derajat', 'c'),
('q_41', 'Jika 3/4 dari sebuah jumlah adalah 15, berapakah jumlah tersebut?', '10', '15', '20', '25', 'c'),
('q_42', 'Jika sebuah segitiga sama sisi memiliki panjang sisi 6 cm, berapakah kelilingnya?', '12 cm', '18 cm', '24 cm', '36 cm', 'b'),
('q_43', 'Dalam segitiga ABC, sudut B = 45 derajat, sudut A = 60 derajat, dan panjang sisi AC = 8 cm. Berapakah panjang sisi BC?', '9,70 cm', '9,76 cm', '9,78 cm', '9,79 cm', 'd'),
('q_44', 'Sebuah kelas memiliki 20 siswa. Jumlah skor ujian matematika mereka adalah 500. Berapakah nilai rata-rata skor ujian kelas ini?', '20', '25', '50', '100', 'b'),
('q_45', 'Dalam sebuah deret aritmatika, suku pertama (a₁) adalah 3, suku kedua (a₂) adalah 7, dan selisih antar suku adalah 4. Berapakah suku ke-10 (a₁₀) dalam deret ini?', '27', '30', '39', '42', 'c'),
('q_46', 'Sebuah persegi panjang memiliki luas 60 cm2. Jika panjangnya adalah 6 cm, berapakah lebarnya?', '5 cm', '8 cm', '10 cm', '12 cm', 'c'),
('q_47', ' Sebuah tabung memiliki jari-jari alas 5 cm dan tinggi 10 cm. Berapakah volume tabung tersebut?', '150 cm³', '500 cm³', '300 cm³', '785 cm³', 'd'),
('q_48', 'Diketahui sin(A) = 0.6 dan cos(A) = 0.8. Berapakah nilai A?', ' 36°', '53°', '1100°', ' 43°', 'a'),
('q_49', 'Akar pangkat tiga dari 64 adalah', ' 2', '4', '8', ' 16', 'b'),
('q_5', 'Sebuah kapal yang penuh dengan penumpang berlayar melintasi sungai. Jika satu penumpang jatuh ke dalam sungai, berapa banyak penumpang yang tersisa di kapal?', 'Tidak ada yang tersisa', 'Semua penumpang tersisa', 'Setengah penumpang tersisa', 'Tergantung pada ukuran sungai', 'b'),
('q_50', 'Jika sebuah lingkaran dibagi menjadi 8 bagian yang sama besar, berapakah besar sudut pusat pada setiap bagian', ' 22.5°', '45°', ' 90°', '180°', 'b'),
('q_51', 'Sebuah segitiga siku-siku memiliki sisi siku-siku berukuran 3 cm dan 4 cm. Jika luas segitiga tersebut adalah 6 cm2, berapakah panjang sisi miringnya?', '2 cm', '3 cm', '5 cm', '6 cm', 'c'),
('q_52', 'Jika 4x - 3 = 7, maka nilai x adalah', '3/2', ' 10/4', '5/4', '8/5', 'b'),
('q_53', 'Sebuah balok memiliki panjang 10 cm, lebar 6 cm, dan tinggi 4 cm. Berapakah volume balok tersebut?', '120 cm3', '240 cm3', '360 cm3', '480 cm3', 'b'),
('q_54', 'Harga sebuah barang semula Rp200.000,00. Jika harganya naik 10%, berapakah harga baru barang tersebut?', 'Rp220.000,00', 'Rp225.000,00', 'Rp230.000,00', 'Rp240.000,00', 'a'),
('q_55', 'Sebuah persegi memiliki keliling 28 cm. Berapakah panjang sisi persegi tersebut?', '4 cm', ' 5 cm', '6 cm', '7 cm', 'd'),
('q_56', 'Pak Amir berangkat dari rumah pukul 07.00 dan tiba di kantor pukul 07.30. Jika kecepatan rata-rata Pak Amir adalah 40 km/jam, berapakah jarak rumah Pak Amir ke kantornya?', '10 km', '15 km', '20 km', '25 km', 'c'),
('q_57', 'Sebuah tongkat panjang 120 cm diletakkan tegak lurus di tanah. Jika bayangan tongkat tersebut adalah 80 cm, berapakah tinggi sumber cahaya?', ' 60 cm', '80 cm', '100 cm', '160 cm', 'c'),
('q_58', 'Dalam sebuah kotak terdapat 5 apel merah, 4 apel hijau dan 3 apel kuning. Jika sebuah apel diambil secara acak, peluang apel yang diambil berwarna merah adalah', '5/12', '1/3', ' 1/2', '2/3', 'a'),
('q_59', 'Sebuah balok memiliki volume 1000 cm3. Jika panjang balok 10 cm dan lebarnya 5 cm, maka tinggi balok tersebut adalah...', '10 cm', ' 20 cm', ' 50 cm', '100 cm', 'b'),
('q_6', 'Dalam sebuah deret aritmetika, suku pertama adalah 2, dan suku ketiga adalah 10. Berapa suku kedelapan dalam deret tersebut?\r\n', '20', '22', '24', '26', 'c'),
('q_60', 'Dalam deret geometri dengan rasio 2, suku pertama adalah 4 dan suku kelima adalah 128. Suku kesepuluh dalam deret tersebut adalah', '1024', '2048', '4096', '8192', 'b'),
('q_61', 'Sebuah perusahaan mengalami kenaikan penjualan dari Rp50 juta menjadi Rp80 juta dalam kurun waktu 2 tahun. Kenaikan rata-rata penjualan per tahun adalah', '15%', '20%', ' 25%', '30%', 'd'),
('q_62', 'Sebuah kaleng berbentuk silinder dengan diameter 10 cm dan tinggi 15 cm diisi penuh dengan minyak. Berapakah volume minyak dalam kaleng tersebut?', '755 cm3', '1177.5 cm3', '1577 cm3', '7500 cm3', 'b'),
('q_63', 'Jarak antara dua kota A dan B adalah 120 km. Sebuah mobil berangkat dari A ke B dengan kecepatan 60 km/jam. Berapakah waktu yang dibutuhkan mobil tersebut untuk mencapai B?', '1 jam', '1,5 jam', '2 jam', ' 2,5 jam', 'c'),
('q_64', 'Diketahui luas persegi panjang adalah 30 cm2 dan lebarnya adalah 5 cm. Maka panjang persegi panjang tersebut adalah', '3 cm', '4 cm', '5 cm', '6 cm', 'd'),
('q_65', 'Sebuah balok memiliki volume 48 cm3. Jika panjang balok 6 cm dan lebarnya 4 cm, maka tinggi balok adalah', ' 2 cm', '3 cm', '4 cm', '8 cm', 'a'),
('q_66', 'Sebuah tabung memiliki diameter alas 7 cm dan tinggi 14 cm. Volume tabung tersebut adalah', '539 cm3', '308 cm3', '154 cm3', '77 cm3', 'a'),
('q_67', 'Diketahui luas segitiga siku-siku adalah 24 cm2. Jika sisi siku-sikunya berukuran 6 cm dan 8 cm, maka panjang sisi miringnya adalah', '4 cm', '6 cm', '10 cm', '12 cm', 'c'),
('q_68', 'Sebuah keran air dapat mengisi bak mandi bervolume 300 liter dalam waktu 15 menit. Laju aliran air dari keran tersebut adalah', '12 liter/menit', '15 liter/menit', '20 liter/menit', '25 liter/menit', 'c'),
('q_69', 'Jumlah 2 bilangan bulat positif adalah 15. Jika selisih kedua bilangan tersebut adalah 3, maka bilangan yang lebih kecil adalah', '5', '6', '7', '8', 'b'),
('q_7', 'Jika 5 orang dapat menyelesaikan pekerjaan dalam waktu 10 hari, berapa lama waktu yang dibutuhkan 8 orang untuk menyelesaikan pekerjaan yang sama?', '4 hari', '5 hari', '6 hari', '8 hari', 'c'),
('q_70', 'Dalam sebuah kelas, rasio siswa laki-laki dan perempuan adalah 3:5. Jika jumlah siswa laki-laki 12 orang, maka banyaknya siswa perempuan adalah', '15', '18', '20', '25', 'c'),
('q_71', 'Sebuah persegi panjang mempunyai keliling 28 cm. Jika panjangnya 7 cm, maka lebarnya adalah', '3,5 cm', '4 cm', '25 cm', '7 cm', 'd'),
('q_72', 'Pak Amir membeli 5 karung beras dengan berat masing-masing 50 kg. Jika 1 kg beras harganya Rp10.000,00, maka total yang harus dibayar Pak Amir adalah', 'Rp250.000,00', 'Rp500.000,00', 'Rp2.500.000,00', 'Rp5.000.000,00', 'c'),
('q_73', 'Sebuah bak mandi berbentuk balok dengan ukuran panjang 150 cm, lebar 75 cm, dan tinggi 60 cm akan diisi air. Jika massa jenis air 1 gr/cm3, berat air yang diperlukan untuk mengisi bak mandi penuh adalah', ' 675 kg', ' 540 kg', '405 kg', '270 kg', 'a'),
('q_74', 'Diketahui sin A = 0,8 dan tan A = 1,2. Nilai cos A adalah', '0,5', '0,7', '0,9', '0,67', 'd'),
('q_75', 'Sebuah tabung memiliki jari-jari alas 7 cm dan tinggi 20 cm. Volume tabung tersebut kurang lebih adalah', '1.400 cm3', '700 cm3', '3080 cm3', '4.200 cm3', 'c'),
('q_76', 'Seorang siswa mendapatkan nilai ujian sebagai berikut: Matematika: 90 IPA: 80 IPS: 75 Bahasa: 85 Nilai rata-rata siswa tersebut adalah', '80.5', '83.5', '82.5', '85.5', 'c'),
('q_77', 'Sebuah kubus mempunyai volume 64 cm3. Panjang rusuk kubus tersebut adalah', '2 cm', '4 cm', '8 cm', '16 cm', 'b'),
('q_78', 'Sebuah tangga bersandar pada dinding dengan sudut elevasi 60°. Jika panjang tangga adalah 8 m, maka jarak dari kaki tangga ke dinding adalah', '4√3 m', '6√3 m', '8√3 m', '10√3 mm', 'a'),
('q_79', 'Seorang investor meminjam uang sebesar Rp5.000.000,00 dengan bunga majemuk 2% per bulan. Setelah 3 bulan, total hutangnya adalah', 'Rp5.300.000,00', ' Rp5.306.000,00', 'Rp5.603.000,00', 'Rp5.600.000,00', 'b'),
('q_8', 'Sebuah tim sepak bola terdiri dari 11 pemain. Dalam satu pertandingan, setiap pemain mencetak gol satu kali kecuali satu pemain yang mencetak dua gol. Berapa gol total yang dicetak oleh tim tersebut dalam pertandingan?', '11', '12', '13', '14', 'b'),
('q_80', 'Luas permukaan kubus dengan panjang rusuk 12 cm adalah', '144 cm2', '288 cm2', '576 cm2', '864 cm2', 'd'),
('q_81', 'Sebuah bola memiliki volume 524 cm3. Jari-jari bola tersebut adalah', '6 cm', '7 cm', '5 cm', '9 cm', 'c'),
('q_82', 'Pak Budi memiliki uang Rp750.000,00. Ia menggunakan 3/8 uang itu untuk membeli buku dan sisanya dipakai untuk membayar listrik. Uang Pak Budi yang dipakai untuk membayar listrik adalah', 'Rp298.000,00', 'Rp368.000,00', 'Rp478.000,00', 'Rp468.750,00', 'd'),
('q_83', 'Luas permukaan kubus dengan volume 64 cm3 adalah', '24 cm2', '48 cm2', '96 cm2', '144 cm2', 'c'),
('q_84', 'Sebuah kolam berbentuk persegi panjang dengan ukuran 5 m x 8 m akan diisi air setinggi 2 m. Jika massa jenis air 1 gr/cm3, massa air yang dibutuhkan untuk mengisi kolam adalah', '80.000 kg', '160.000 kg', ' 320.000 kg', ' 640.000 kg', 'a'),
('q_85', 'Sebuah kotak berisi 4 bola merah, 5 bola biru dan 6 bola hijau. Jika sebuah bola diambil secara acak, peluang bola yang diambil berwarna biru adalah', '5/15', '1/3', '1/2', '2/3', 'b'),
('q_86', 'Sebuah prisma segitiga memiliki alas berbentuk segitiga sama sisi dengan panjang sisi 6 cm dan tinggi prisma 12 cm. Volume prisma tersebut adalah', '144 cm3', ' 288 cm3', '216 cm3', '576 cm3', 'c'),
('q_87', 'Sebuah pekerjaan dapat diselesaikan oleh 6 orang dalam waktu 12 hari. Jika jumlah pekerja ditambah menjadi 9 orang, dalam berapa hari pekerjaan itu dapat diselesaikan?', '6 hari', '7 hari', '8 hari', '9 hari', 'c'),
('q_88', 'Sebuah bak mandi berisi air setinggi 60 cm. Jika bak itu berbentuk kubus dengan panjang sisi 1 m, maka volume air dalam bak tersebut adalah', ' 600 liter', '300 liter', '200 liter', '100 liter', 'a'),
('q_89', 'Harga sebuah sepeda Rp750.000,00. Pedagang memberi diskon 25%. Berapakah harga sepeda setelah didiskon?', 'Rp562.500,00', 'Rp625.000,00', 'Rp675.000,00', 'Rp712.500,00', 'a'),
('q_9', 'Sebuah pesawat terbang dari kota A ke kota B dengan kecepatan 500 km per jam dan kembali dari kota B ke kota A dengan kecepatan 600 km per jam. Berapa rata-rata kecepatan pesawat selama seluruh perjalanan?', '550 km/h', '560 km/h', '570 km/h', '580 km/h', 'a'),
('q_90', 'Dalam sebuah kantong berisi kelereng warna merah, biru dan hijau. Jumlah kelereng merah adalah 5, kelereng biru 4 dan kelereng hijau 3 buah. Jika sebuah kelereng diambil secara acak, peluang mendapatkan kelereng warna biru adalah', '4/5', '4/12', '3/5', '1/3', 'd'),
('q_91', 'Sebuah bak mandi berbentuk balok dengan ukuran panjang 2 m, lebar 1,5 m, dan tinggi 1 m diisi penuh air. Jika massa jenis air 1000 kg/m3, massa air dalam bak mandi adalah', '1500 kg', '2000 kg', '2500 kg', '3000 kg', 'd'),
('q_92', 'Tiga bilangan berbanding lurus dengan rasio 3:5:15. Jika bilangan pertama 30, maka bilangan ketiga adalah', '45', '50', '90', '150', 'd'),
('q_93', 'Seorang pedagang membeli 2 karung beras @50 kg dengan harga Rp60.000,00 per kg. Ia menjualnya kembali dengan keuntungan 20%. Harga jual per kg nya adalah', ' Rp66.000,00', 'Rp70.000,00', 'Rp72.000,00', 'Rp75.000,00', 'c'),
('q_94', 'Luas permukaan kubus dengan volume 512 cm3 adalah', ' 96 cm2', '144 cm2', '192 cm2', '384 cm2', 'd'),
('q_95', 'Dalam kelas yang berisi 30 siswa, perbandingan siswa laki-laki dan perempuan adalah 2:3. Banyak siswa perempuan adalah', '12 orang', '15 orang', '18 orang', '20 orang', 'c'),
('q_96', '√81 + √49 = ?', '10', '12', '14', '16', 'd'),
('q_97', 'Sebuah kereta api melaju dari stasiun A ke stasiun B sejauh 120 km dalam waktu 1 jam 20 menit. Kecepatan rata-rata kereta api tersebut adalah', '60 km/jam', '72 km/jam', '80 km/jam', '90 km/jam', 'd'),
('q_98', 'Luas permukaan tabung dengan jari-jari 7 cm dan tinggi 14 cm adalah', '924 cm2', '154 cm2', '308 cm2', '77 cm2', 'a'),
('q_99', 'Sebuah tangga bersandar pada tembok dengan sudut elevasi 30°. Jika panjang tangga 12 meter, maka jarak kaki tangga dari tembok adalah', '6 m', '8 m', '10 m', '12 m', 'b'),
('q_131', 'Sebuah mobil melaju dengan kecepatan 60 km/jam. Jika mobil tersebut berjalan selama 135 menit, berapa jarak yang ditempuhnya?', '125 km', '135 km', '140 km', '115 km', 'b'),
('q_132', 'Sebuah kotak berisi 12 buah bola, dengan 3 bola berwarna merah, 4 bola berwarna biru, dan 5 bola berwarna hijau. Jika satu bola dipilih secara acak, berapa peluangnya untuk mendapatkan bola berwarna biru?', '1/4', '1/3', '1/2', '2/3', 'b'),
('q_133', 'Jika hari ini tanggal 1 Januari 2023 dan Anda menambahkan 100 hari, tanggal berapa Anda sekarang?', '11 Mei', '11 April', '11 Juni', '11 Juli', 'b'),
('q_134', 'Jika Anda memiliki kantong yang berisi 3 apel, 5 jeruk, dan 2 pisang, berapa peluang Anda mengambil sebuah pisang secara acak?', '1/2', '1/3', '1/5', '2/9', 'c'),
('q_135', 'Jika sebuah kubus memiliki panjang sisi 3 cm, berapa volume kubus tersebut?', '9 cm³', '18 cm³', '27 cm³', '36 cm³', 'c'),
('q_136', 'Sebuah lingkaran memiliki jari-jari sepanjang 7 cm. Berapa keliling lingkaran tersebut?', '34 cm', '31 cm', '38 cm', '44 cm', 'd'),
('q_137', 'Jika Anda mengalikan 15 dengan dirinya sendiri, berapa hasilnya?', '225', '150', '30', '15', 'a'),
('q_138', 'Jika Anda memiliki $500 dan Anda menginvestasikan 20% dari uang tersebut, berapa jumlah uang yang diinvestasikan?', '$100', '$200', '$250', '$300', 'a'),
('q_139', 'Sebuah trapesium memiliki panjang dua sisi sejajar masing-masing 8 cm dan 12 cm. Tinggi trapesium tersebut adalah 5 cm. Berapa luas trapesium tersebut?', '40 cm²', '50 cm²', '60 cm²', '70 cm²', 'b'),
('q_140', 'Jika Anda membeli sebuah buku seharga $25 dengan diskon 20%, berapa harga akhir buku tersebut?', '$15', '$20', '$22', '$25', 'b'),
('q_141', 'Jika Anda memiliki 2 gelas air, masing-masing berisi 200 ml air, dan Anda menuangkan keduanya ke dalam satu gelas, berapa total volume airnya?', '200 ml', '300 ml', '400 ml', '500 ml', 'c'),
('q_142', 'Jika suatu bilangan ganjil dikalikan dengan bilangan ganjil lainnya, hasilnya pasti...', 'Ganjil', 'Genap', 'Nol', 'Negatif', 'a'),
('q_143', 'Jika sebuah persegi panjang memiliki panjang 6 cm dan lebar 4 cm, berapa kelilingnya?', '14 cm', '20 cm', '24 cm', '28 cm', 'b'),
('q_144', 'Sebuah mobil pergi dari kota A ke kota B dengan kecepatan 80 km/jam dan kembali dari kota B ke kota A dengan kecepatan 120 km/jam. Berapa rata-rata kecepatan mobil selama seluruh perjalanan?', '90 km/h', '96 km/h', '100 km/h', '110 km/h', 'c'),
('q_145', 'Jika 2/5 dari sebuah jumlah dibagi 2, hasilnya adalah 12. Berapa jumlah tersebut?', '45', '40', '50', '60', 'd'),
('q_146', 'Jika 3 buah apel dan 5 buah jeruk memiliki massa total 1 kg, dan 1 buah apel memiliki massa 150 gram, berapa massa 1 buah jeruk?', '100 gram', '110 gram', '120 gram', '115 gram', 'b'),
('q_147', 'Jika 20% dari suatu bilangan adalah 30, berapa nilai bilangan tersebut?', '120', '140', '150', '160', 'c'),
('q_148', 'Sebuah trapesium memiliki panjang dua sisi sejajar masing-masing 15 cm dan 9 cm. Tinggi trapesium tersebut adalah 8 cm. Berapa luas trapesium tersebut?', '72 cm²', '96 cm²', '108 cm²', '120 cm²', 'b'),
('q_149', 'Seorang pengusaha membeli sebuah komputer seharga $800 dan menjualnya dengan keuntungan 20%. Berapa harga jualnya?', '$900', '$960', '$1000', '$1100', 'b'),
('q_150', 'Sebuah lingkaran memiliki diameter sepanjang 14 cm. Berapa panjang jari-jari lingkaran tersebut?', '3.5 cm', '7 cm', '5.5 cm', '14 cm', 'b'),
('q_151', 'Seorang siswa memiliki nilai ujian matematika 85, nilai ujian bahasa 90, dan nilai ujian sains 88. Rata-rata nilai siswa tersebut adalah...', '87.6', '88.6', '89.6', '90.6', 'a'),
('q_152', 'Jika suatu bilangan genap dikalikan dengan bilangan ganjil, hasilnya pasti...', 'Genap', 'Ganjil', 'Nol', 'Negatif', 'a'),
('q_153', 'Jika 15% dari suatu bilangan adalah 45, berapa nilai bilangan tersebut?', '200', '250', '300', '350', 'c'),
('q_154', 'Seorang pedagang menjual sebuah barang seharga $120 dengan diskon 25%. Berapa harga akhir barang tersebut?', '$80', '$90', '$100', '$110', 'b'),
('q_155', 'Sebuah trapesium memiliki panjang dua sisi sejajar masing-masing 10 cm dan 15 cm. Tinggi trapesium tersebut adalah 12 cm. Berapa luas trapesium tersebut?', '120 cm²', '150 cm²', '180 cm²', '210 cm²', 'b'),
('q_156', 'Jika suatu bilangan genap dikalikan dengan bilangan genap lainnya, hasilnya pasti...', 'Genap', 'Ganjil', 'Nol', 'Negatif', 'a'),
('q_157', 'Jika sebuah persegi memiliki panjang sisi 5 cm, berapa luasnya?', '20 cm²', '25 cm²', '30 cm²', '35 cm²', 'b'),
('q_158', 'Sebuah silinder memiliki jari-jari 4 cm dan tinggi 8 cm. Berapa volume silinder tersebut?', '296.12 cm³', '328.12 cm³', '402.12 cm³', '256.12 cm³', 'c'),
('q_159', 'Sebuah mobil melaju dengan kecepatan rata-rata 70 km/jam. Jika mobil tersebut bergerak selama 4 jam, berapa jarak yang ditempuhnya?', '220 km', '280 km', '320 km', '360 km', 'b'),
('q_160', 'Seorang pelari berlari sejauh 12 km pada kecepatan rata-rata 8 km/jam. Berapa lama waktu yang diperlukan pelari tersebut?', '1.5 jam', '2 jam', '2.5 jam', '3 jam', 'a'),
('q_161', 'Sebuah trapesium memiliki panjang dua sisi sejajar masing-masing 12 cm dan 20 cm. Tinggi trapesium tersebut adalah 10 cm. Berapa luas trapesium tersebut?', '150 cm²', '160 cm²', '170 cm²', '140 cm²', 'b'),
('q_162', 'Seorang pedagang menjual sebuah barang seharga $150 dengan diskon 30%. Berapa harga akhir barang tersebut?', '$90', '$105', '$120', '$135', 'b'),
('q_163', 'Sebuah mobil pergi dari kota A ke kota B dengan kecepatan 90 km/jam dan kembali dari kota B ke kota A dengan kecepatan 120 km/jam. Berapa rata-rata kecepatan mobil selama seluruh perjalanan?', '100 km/h', '105 km/h', '110 km/h', '115 km/h', 'b'),
('q_164', 'Jika 10% dari suatu bilangan adalah 50, berapa nilai bilangan tersebut?', '500', '550', '600', '650', 'a'),
('q_165', 'Jika Anda memiliki 3 buah tas, masing-masing berisi 10 buah buku, dan Anda memberikan 1 tas ke teman Anda, berapa total buku yang Anda miliki sekarang?', '20', '22', '24', '26', 'b');


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
('U030', 'test30', '$2y$12$2Dtkr2xrY1vZQ2PvnJd.J.A0sZkOuDblmjwLpr6gCNUtw8kBMoj1q', 0),
('U031', 'LATAKHDOB', '$2y$10$U9bTKrsgGz..DXTNDW2zA.o2tgmjL2qUI5UEiVM8J2WuAcoOqkSoK', 0),
('U032', 'OMEGA 3', '$2y$10$b.ZGgip2W4WS6VPAn2SFyOEEdiYkZcHRfnxMbEjIbb6pEbWK80jFG', 0),
('U033', 'CLAVENFORE', '$2y$10$B7SgIhcL0F.6WwluuRhfXuIfaOovaj4YH/epGa0e9ri05aoCR12Ha', 0),
('U034', 'RAY', '$2y$10$1e6Ge.LnsudgG82lFsQPGetT2g2/dYxpe72uCtQKx4LCCaKQdn552', 0),
('U035', 'HOMSAP 3.0', '$2y$10$Bm66AnNMPKojryV8.cYhoeDRWjWGl3kK/ZCdJ128LPD.czrS1dDi.', 0),
('U036', 'PCHRIS', '$2y$10$WrM6SzsMPcDF.2UWSMDxJOdfo7BYKpZJAjmIUcTXGB9K664QH13be', 0),
('U037', 'QWERTS', '$2y$10$mjn9zNm/pYUNmV47d6sKa.cWUurCnfcbSi62jHO9adm1vE3Xw2b7y', 0),
('U038', 'BIG BRAIN', '$2y$10$S.VKdoenI71uLQFDabsa7O3anEfNSJ/f2hG3pFlawYv3NcrYnGitm', 0),
('U039', 'TELAT DAFTAR', '$2y$10$0fUXxlLGtzBsrxSmkWTtjOwaYOqLXPQ/wNsjhu6SXgNfIG/KxfGGy', 0),
('U040', 'CLAVERS', '$2y$10$ziw1gh9FukjcZa9ewwMwp.QoimeGnJIbPVATLoEIygSFv6AQ/4lfy', 0),
('U041', 'TIM EDU', '$2y$10$mEY0Q/gRxxBut43L919CROw9015uyMIJ6SpBoIzS5jHMMzBd0Jd8m', 0),
('U042', 'ASTRAGACOR', '$2y$10$SoK2MSsYYB22j790pSGgeutmgGNp8bG3ma3s9Z4x6gL4tmD60CWee', 0),
('U043', 'HBICS BPK', '$2y$10$mDczif1xTyNIp.9AWug4R.VNLhEcIHOxxhZdcNRTGjGvl9wqm4W/.', 0),
('U044', 'FIRST', '$2y$10$xK.zWsaoYzZfW91smSww5uzMaaAJRiO.kiGrwjpUS9RKHZaWlkrfe', 0),
('U045', 'ORANG KEREN', '$2y$10$oVNKSKf.nOf2Z3f0b7.zd.oXw0ZZrUXmEsrsFGRIQ2DQZECkdwJAK', 0),
('U046', 'SCALLOP TERBANG', '$2y$10$9Ne2lS4QXcRP/XXsR.Kib.zmu6wdkD4U0noJp6ReNkIn2gQh6S6FG', 0),
('U047', 'SLAYY', '$2y$10$hBqQwBGJ8Dz57DF22FRHbOYDJ.AJrJ78/RtkXzeQbhpbCUvanNlPu', 0),
('U048', 'TIGATRIO', '$2y$10$TNYX9g2lPtLqGLUm8OgoQO3aGMKSpH4wRoBfbUljUtwzcFKf3GYD2', 0),
('U049', 'K3', '$2y$10$LSkH40qd9U5fAWf9TKtvaeCMhv6YT24mgCSfTqBRf6k1vQsJmEFE6', 0),
('U050', 'CUANBANYAK', '$2y$10$DrmS3iihZmkMO5EFLA8Nb.JDjtncc3btUIY.U3lfx4uYWhT4wYlLG', 0),
('U051', 'BCN CITY', '$2y$10$NI.S34C.wIHjO.eVHbm8puj5UDwbbvIokYKJCja0igb1hZtb.q1fi', 0),
('U052', 'DOLINE', '$2y$10$t4xv2yBFiBAvSy2AQNb2QuZRLl6Q2FxgrIHbnUofKLaAAeSSeB1G2', 0),
('U053', 'UNDEAD', '$2y$10$PNIfjpGA.cV.m1Z7Ts1L8.JkowM7nr0aCs57I/cz.3F1afzqFCwLS', 0),
('U054', 'D2C', '$2y$10$VBL95dz7cMO.IOL8AJ9ZCulvaGDEXVarxRUDId0/RECdRmSftwVL6', 0),
('U055', 'BEBEK RENANG', '$2y$10$xdwEHY7qbRq8zHPkayhfJub/rdZqbk7/ZwOEbAdkn5pw5Ad03trvK', 0),
('U056', 'NYANPASU', '$2y$10$PdaNIu5qVckHHtWYfnJigOu4NfB13Xn16x4f6nSCXq3T21mlQvQFG', 0),
('U057', 'MAPANNN', '$2y$10$E0ppCDqHkTwYntxkM9vuDex49DUmKO3WMlHqqMISgnXnBcp2Cm1Pm', 0),
('U058', 'BEBAS', '$2y$10$.J12/MjNZUSI0QKplNsLuOYYrBNf5tiyTZu0RcswUu4X3SPj1yi6C', 0),
('U059', 'INTER MIEAYAM', '$2y$10$pDRaanF1PGBRwGfdk2KwuuO2p3dY/g5H1CxszDkOIskHDRCHfYJtS', 0),
('U060', 'TEAMNAA', '$2y$10$f0NYl8pxoMLi2bKVJexDa.ssD9qN.7qI91665wb2Sjw7/pdPaX.0W', 0);

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
