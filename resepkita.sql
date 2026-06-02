-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2026 at 02:59 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resepkita`
--

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int NOT NULL,
  `id_resep` int NOT NULL,
  `id` int NOT NULL,
  `isi_komentar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_resep`, `id`, `isi_komentar`, `created_at`) VALUES
(1, 1, 3, 'jos enak', '2026-06-02 14:41:47'),
(2, 2, 4, 'enak', '2026-06-02 14:43:34'),
(3, 3, 5, 'enak pol', '2026-06-02 14:45:08'),
(4, 4, 6, 'jos mas enak', '2026-06-02 14:46:47'),
(5, 5, 7, 'mie nya sedap', '2026-06-02 14:48:25'),
(6, 6, 8, 'enak', '2026-06-02 14:50:03'),
(7, 7, 9, 'enakk', '2026-06-02 14:51:39'),
(8, 8, 10, 'candu', '2026-06-02 14:53:33'),
(9, 9, 12, 'enak banget', '2026-06-02 14:55:58'),
(10, 8, 12, 'enakkkkkk', '2026-06-02 14:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` int NOT NULL,
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text,
  `kategori_daerah` enum('Jawa','Sumatera','Kalimantan','Sulawesi','Papua','Bali','Nusa Tenggara','Maluku','Lainnya') NOT NULL,
  `foto` varchar(255) NOT NULL,
  `bahan` text NOT NULL,
  `langkah` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `id`, `judul`, `deskripsi`, `kategori_daerah`, `foto`, `bahan`, `langkah`, `created_at`) VALUES
(1, 2, 'Ayam Betutu', 'Khas Bali', 'Bali', '1780411163_ayambetutu-bali.jpg', 'Ayam,bumbu', 'marinasi ayamnya, terus masak ayamnya', '2026-06-02 14:39:23'),
(2, 3, 'Gudeg Yogya', 'Khas Jogja', 'Jawa', '1780411279_gudeg-yogyakarta.jpg', 'Telur, Tempe, Bumbu,Kecap', 'Masak bahan utama, Lalu fermentasi dengan kecap', '2026-06-02 14:41:19'),
(3, 4, 'Kerak Telor', 'Khas Betawi', 'Jawa', '1780411382_keraktelor-jakarta.jpg', 'Telor, Ketan', 'Masak ketan, kemudian tambah telur', '2026-06-02 14:43:02'),
(4, 5, 'Lumpia', 'Khas Jateng', 'Jawa', '1780411489_lumpia-jateng.jpg', 'tepung, isian, bumbu', 'buat kulit dari tepung, masukkan isian', '2026-06-02 14:44:50'),
(5, 6, 'Mie Aceh', 'khas aceh', 'Sumatera', '1780411582_mie aceh.jpg', 'mie , bumbu', 'masak mie, tambahkan bumbu', '2026-06-02 14:46:22'),
(6, 7, 'Papeda', 'khas Papua', 'Papua', '1780411687_papeda-papua.jpg', 'sagu, air panas', 'campur sagu pakai air panas', '2026-06-02 14:48:08'),
(7, 8, 'Pempek', 'palembang', 'Sumatera', '1780411779_pempek-sumatra.jpg', 'tepung kanji, isian', 'buat adonan dari tepung kanji, lalu beri isian', '2026-06-02 14:49:39'),
(8, 9, 'Rendang', 'sumatra', 'Sumatera', '1780411878_rendang-sumbar.jpg', 'daging , bumbu, santan', 'masak daging bersama bumbu dan santan', '2026-06-02 14:51:18'),
(9, 10, 'Sego Gegog', 'Trenggalek', 'Jawa', '1780411984_segogegok-jatim.jpeg', 'nasi, sambel teri', 'masak nasi dan tambahkan sambal teri', '2026-06-02 14:53:04'),
(10, 12, 'Soto Lamongan', 'lamongan', 'Jawa', '1780412111_sotolamongan-jatim.jpg', 'ayam, bumbu', 'rebus ayam dengan kuah berbumbu', '2026-06-02 14:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ROLE` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `PASSWORD`, `ROLE`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$q20stwwLZlZX7b82Msysbe6fl7jckaXrwDLnWJwVV95GojZnT94DS', 'admin'),
(2, 'Eka Rosmala', 'eka@gmail.com', '$2y$10$UbpN4IZKuda1X5ws4CVdZOqQuim8qxuc7tVZwQfNyvnLU/xTH.K7a', 'user'),
(3, 'Siti Rosmala', 'eka1@gmail.com', '$2y$10$Y/MxMtMa2xVgQ4Aup.bRbumukg/KpyZuLFCIyxugynklc5HRVi6nC', 'user'),
(4, 'Budi Handoko', 'budi@gmail.com', '$2y$10$Kh8tHryptIltnYCMNr/SHeNZ/5rALp.dNkgreitAh8E6c7SJCQYia', 'user'),
(5, 'Rudi Suganda', 'rudi@gmail.com', '$2y$10$FwyV.pu2GZredZVZhI6tOuTbCNbXiTsfEUUbadGzX2xbOLM1uN7si', 'user'),
(6, 'Siti Ropiah', 'siti@gmail.com', '$2y$10$myHyRgwdSqxDZoRyrbsSpeRFTG1KIc2i8X1PX40vp6jyYamLwjAhe', 'user'),
(7, 'Lili Wijayanti', 'lili@gmail.com', '$2y$10$bmSiM6baG0BR63Q6DHPu7.xjBygQHgyJLkYUkbgY26b24fm83al9u', 'user'),
(8, 'Repa Epstein', 'repa@gmail.com', '$2y$10$EGi5xGF3rwQIZDcLlhZ9XuDtZv/.N6Zl6CPAcvstgt63IfYREp3NW', 'user'),
(9, 'Irul Umamsah', 'irul@gmail.com', '$2y$10$EnAvkp5IoreqtczeI5C59OrgW7AdNcGP9xjouKt3juxQps55Kn.Bq', 'user'),
(10, 'Aku Suka Makan', 'aku@gmail.com', '$2y$10$zEfUSDbZ19R2RUDQqlofJ..LNn9OZE5O/gBsW3YWx0nCKLTVYO/Eu', 'user'),
(11, 'Bocil Absen', 'bocil@gmail.com', '$2y$10$BX7bSYIcrzbF/JfjTFOMbOMs18xeSDztrEZI3W2kOH/10utRgdZny', 'user'),
(12, 'User', 'user@gmail.com', '$2y$10$/wEeAjcyRkixQFERRqmOQe7raPFVkXbLPRnn504P2PZ006q2dojVC', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`) ON DELETE CASCADE,
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
