-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 07 Bulan Mei 2025 pada 10.25
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `map_sekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `schools`
--

CREATE TABLE `schools` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `accreditation` varchar(10) DEFAULT NULL,
  `established_year` int DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `history` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `latitude`, `longitude`, `accreditation`, `established_year`, `rating`, `image_path`, `history`) VALUES
(2, 'SMA Negeri 1 Payakumbuh', 'Jl. Soekarno Hatta, Payakumbuh\r\n\r\n', -0.223384321857079, 100.65500008322, 'A', 1965, 4.4, 'smanpyk.jpeg', 'asdasdasdasdasdasdasdasdasdasdasdasdsa'),
(3, 'SMA Negeri 1 Padang', 'Jl. Belanti Raya No. 11, Padang Barat', -0.919381895077196, 100.35366975198842, 'A', 1950, 4.5, 'smanpadang.jpg', 'sman 1 padang adalah sma yang berdiri dari tahun 1950'),
(4, 'SMA Negeri 2 Padang', 'Jl. Musi No. 2, Padang Barat', -0.9297133136024786, 100.35370221363799, 'A', 1960, 4.4, 'sman2padang.jpg', 'sman 2 padang adalah sma yang berdiri sejak 1960.....'),
(5, 'SMA Negeri 1 Bukittinggi', 'Jl. Syekh M. Jamil Jambek No. 36, Guguk Panjang', -0.3027478972887777, 100.3739043538332, 'A', 1955, 4.6, 'sman1bukik.jpg', 'sman 1 bukik adalah sman semenjak dari tahun 1955..'),
(6, 'SMAN 1 TILATANG KAMANG', 'P9XW+JF5, Jl. Raya Pakan Kamih, Koto Tangah, Kec. Tilatang Kamang, Kabupaten Agam, Sumatera Barat 26152', -0.2513594101658857, 100.39719431150334, 'A', 1970, 5.5, 'smantika.jpg', 'smantika adalah sman saya'),
(7, 'SMAN 5 BUKITTINGGI', 'Jl.dt.mangkuto ameh,kelurahan garegeh, koto salayan, Kec. Mandiangin Koto Selayan, Kota Bukittinggi, Sumatera Barat 26117', -0.30107595300640067, 100.39377926732811, 'A', 1965, 5.0, 'sman5bukik.png', 'sman 5 adalah sman fav'),
(8, 'SMAN 2 BUKITINGGI', 'Jl. Sudirman No.5, Sapiran, Kec. Aur Birugo Tigo Baleh, Kota Bukittinggi, Sumatera Barat 2612681', -0.3163049393947093, 100.37450587522251, 'A', 1965, 5.0, 'sman2bukik.jpg', 'sman 2 bukitinggii.....'),
(9, 'SMAN 3 BUKITINGGI', 'Jl. M. Yamin, Tarok Dipo, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26181', -0.3148001115110906, 100.385043609658, 'A', 1960, 5.0, 'smantitel.jpg', 'sman tiga teladan'),
(10, 'SMAN 4 BUKITTINGGI', 'Jl. Pabidikan, Puhun Pintu Kabun, Kec. Mandiangin Koto Selayan, Kota Bukittinggi, Sumatera Barat 26123', -0.2839066256323012, 100.34360514218363, 'A', 1955, 4.0, 'sman4bukik.jpg', 'sman 4 bukik adalah.........'),
(11, 'SMAN 1 SUMATERA BARAT', 'Jalan Syekh Ibrahim Musa, Sigando, Kec. Padang Panjang Tim., Kota Padang Panjang, Sumatera Barat 27126', -0.46176431522795497, 100.42714224638787, 'A', 1950, 4.0, 'sman1sumbar.jpg', 'sman 1 sumbar adalah ........');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, '2201162009', '123456');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
