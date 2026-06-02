-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2026 at 04:22 PM
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
(10, 8, 12, 'enakkkkkk', '2026-06-02 14:56:25'),
(11, 10, 2, 'enakk', '2026-06-02 16:21:25');

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
(1, 2, 'Ayam Betutu', 'Khas Bali', 'Bali', '1780411163_ayambetutu-bali.jpg', '1 ekor ayam ukuran sedang, 10 siung bawang merah, 6 siung bawang putih, 8 buah cabai merah keriting, 5 buah cabai rawit merah, 4 butir kemiri sangrai, 3 cm kunyit, 3 cm jahe, 3 cm lengkuas, 2 cm kencur, 1 sendok teh ketumbar, 2 batang serai yang dimemarkan, 4 lembar daun jeruk, 2 lembar daun salam, garam secukupnya, gula secukupnya, dan minyak secukupnya untuk menumis bumbu.', 'haluskan bawang merah, bawang putih, cabai merah, cabai rawit, kemiri, kunyit, jahe, lengkuas, kencur, dan ketumbar. Tumis bumbu halus hingga harum, kemudian masukkan serai, daun jeruk, dan daun salam. Setelah bumbu matang, lumuri seluruh bagian ayam, termasuk bagian dalam rongga ayam, dengan bumbu tersebut hingga merata. Diamkan selama sekitar satu jam agar bumbu meresap. Setelah itu, masukkan ayam ke dalam panci atau kukusan dan masak dengan api kecil selama 2–3 jam hingga daging menjadi sangat empuk. Jika menggunakan oven, ayam dapat dipanggang sebentar setelah dikukus untuk memberikan aroma yang lebih khas. Setelah matang, Ayam Betutu siap disajikan bersama nasi putih hangat, sambal matah, dan sayuran pelengkap.', '2026-06-02 14:39:23'),
(2, 3, 'Gudeg Yogya', 'Khas Jogja', 'Jawa', '1780411279_gudeg-yogyakarta.jpg', '1 kilogram nangka muda yang dipotong-potong, 1 liter santan encer, 500 ml santan kental, 8 siung bawang merah, 5 siung bawang putih, 5 butir kemiri, 2 cm ketumbar, 4 lembar daun salam, 3 cm lengkuas yang dimemarkan, 150 gram gula merah, dan garam secukupnya.', 'haluskan bawang merah, bawang putih, kemiri, dan ketumbar. Susun nangka muda dalam panci, lalu masukkan bumbu halus, daun salam, lengkuas, gula merah, dan garam. Tuangkan santan encer hingga semua bahan terendam, kemudian masak dengan api kecil hingga nangka empuk dan bumbu meresap. Setelah kuah mulai menyusut, tambahkan santan kental dan lanjutkan memasak sambil sesekali diaduk perlahan agar santan tidak pecah. Masak selama beberapa jam hingga gudeg berwarna cokelat kemerahan, kuah hampir habis, dan teksturnya menjadi lembut. Setelah matang, gudeg siap disajikan bersama nasi hangat, ayam kampung opor, telur pindang, tahu atau tempe bacem, serta sambal krecek.', '2026-06-02 14:41:19'),
(3, 4, 'Kerak Telor', 'Khas Betawi', 'Jawa', '1780411382_keraktelor-jakarta.jpg', '100 gram beras ketan putih yang telah direndam selama beberapa jam, 2 butir telur bebek atau telur ayam, 2 sendok makan ebi yang telah disangrai dan dihaluskan, 1 sendok makan bawang merah goreng, 1 sendok makan kelapa parut sangrai, 1 sendok teh cabai bubuk, garam secukupnya, merica secukupnya, dan gula secukupnya.', 'panaskan wajan datar, lalu masukkan beras ketan yang telah ditiriskan dan tambahkan sedikit air hingga setengah matang. Setelah air menyusut, tuangkan telur yang telah dikocok bersama ebi, garam, merica, dan gula di atas ketan, kemudian ratakan. Masak hingga bagian bawah mengering dan terbentuk kerak. Taburkan kelapa sangrai, bawang merah goreng, dan cabai bubuk di atasnya. Setelah matang, angkat dan sajikan selagi hangat.', '2026-06-02 14:43:02'),
(4, 5, 'Lumpia', 'Khas Jateng', 'Jawa', '1780411489_lumpia-jateng.jpg', '15 lembar kulit lumpia, 300 gram rebung yang diiris tipis dan direbus terlebih dahulu, 150 gram daging ayam cincang atau udang cincang, 4 siung bawang putih yang dihaluskan, 2 siung bawang merah yang dihaluskan, 2 butir telur, 2 batang daun bawang yang diiris halus, garam secukupnya, gula secukupnya, merica secukupnya, dan minyak goreng secukupnya. Siapkan juga larutan tepung terigu dan air sebagai perekat kulit lumpia.', 'tumis bawang putih dan bawang merah hingga harum. Masukkan daging ayam atau udang cincang, lalu masak hingga matang. Tambahkan rebung, garam, gula, dan merica, kemudian aduk hingga semua bahan tercampur rata dan bumbu meresap. Masukkan telur yang telah dikocok dan daun bawang, lalu aduk hingga isian matang dan agak kering. Setelah dingin, ambil selembar kulit lumpia dan letakkan isian secukupnya di bagian tengah. Lipat kedua sisi kulit ke dalam, lalu gulung hingga rapat dan rekatkan ujungnya menggunakan larutan tepung. Goreng lumpia dalam minyak panas hingga berwarna kuning keemasan dan renyah. Setelah matang, angkat dan tiriskan', '2026-06-02 14:44:50'),
(5, 6, 'Mie Aceh', 'khas aceh', 'Sumatera', '1780411582_mie aceh.jpg', '500 gram mi kuning basah, 200 gram daging sapi atau udang, 5 siung bawang merah, 3 siung bawang putih, 5 buah cabai merah, 2 buah cabai rawit, 1 sendok teh ketumbar, 1/2 sendok teh jintan, 2 butir kapulaga, 2 cm kunyit, 2 cm jahe, 300 ml kaldu, 100 gram kol yang diiris tipis, 1 buah tomat yang dipotong-potong, 2 batang daun bawang yang diiris, 2 sendok makan kecap manis, garam secukupnya, dan minyak untuk menumis.', 'haluskan bawang merah, bawang putih, cabai merah, cabai rawit, ketumbar, jintan, kunyit, dan jahe. Tumis bumbu halus hingga harum, lalu masukkan kapulaga dan daging sapi atau udang. Masak hingga daging berubah warna dan bumbu meresap. Tambahkan kaldu, kecap manis, garam, kol, dan tomat, kemudian aduk hingga mendidih. Masukkan mi kuning dan masak sambil diaduk hingga bumbu meresap serta kuah sedikit menyusut. Setelah matang, tambahkan irisan daun bawang dan aduk sebentar. Sajikan Mie Aceh selagi hangat dengan taburan bawang goreng, acar mentimun, dan emping sebagai pelengkap.', '2026-06-02 14:46:22'),
(6, 7, 'Papeda', 'khas Papua', 'Papua', '1780411687_papeda-papua.jpg', '250 gram tepung sagu, 700 ml air, dan sedikit garam. Untuk pelengkap berupa ikan kuah kuning, siapkan 500 gram ikan tongkol atau ikan kakap, 1 liter air, 6 siung bawang merah, 4 siung bawang putih, 3 cm kunyit, 2 cm jahe, 2 batang serai yang dimemarkan, 3 lembar daun jeruk, garam secukupnya, gula secukupnya, dan perasan jeruk nipis.', 'larutkan tepung sagu menggunakan sebagian air hingga tidak menggumpal. Sisa air direbus hingga mendidih, kemudian dituangkan sedikit demi sedikit ke dalam larutan sagu sambil terus diaduk hingga berubah menjadi bening, kental, dan lengket. Untuk membuat ikan kuah kuning, haluskan bawang merah, bawang putih, kunyit, dan jahe, lalu tumis hingga harum. Masukkan serai dan daun jeruk, kemudian tambahkan air dan masak hingga mendidih. Setelah itu, masukkan ikan dan bumbui dengan garam serta gula secukupnya. Masak hingga ikan matang dan bumbu meresap, lalu tambahkan perasan jeruk nipis untuk memberikan rasa segar. Papeda disajikan dengan cara mengambil adonan sagu menggunakan dua sendok atau sumpit khusus, kemudian diletakkan di mangkuk dan disiram dengan ikan kuah kuning', '2026-06-02 14:48:08'),
(7, 8, 'Pempek', 'palembang', 'Sumatera', '1780411779_pempek-sumatra.jpg', '500 gram daging ikan tenggiri yang telah dihaluskan, 250 ml air es, 1 sendok makan garam, 1 sendok teh gula pasir, dan 300 gram tepung sagu. Untuk kuah cuko, siapkan 500 ml air, 200 gram gula merah, 50 gram asam jawa, 5 siung bawang putih yang dihaluskan, 10 buah cabai rawit yang dihaluskan, dan garam secukupnya.', 'campurkan daging ikan, air es, garam, dan gula hingga merata. Setelah itu, masukkan tepung sagu sedikit demi sedikit sambil diaduk hingga menjadi adonan yang dapat dibentuk. Bentuk adonan sesuai selera, bisa berbentuk lenjer, kapal selam, atau bulat. Rebus pempek dalam air mendidih hingga mengapung, kemudian angkat dan tiriskan. Agar lebih nikmat, pempek dapat digoreng sebentar hingga bagian luarnya berwarna keemasan. Untuk membuat cuko, rebus air bersama gula merah dan asam jawa hingga larut, lalu masukkan bawang putih, cabai rawit, dan garam. Masak hingga mendidih, kemudian saring dan dinginkan.', '2026-06-02 14:49:39'),
(8, 9, 'Rendang', 'sumatra', 'Sumatera', '1780411878_rendang-sumbar.jpg', '1 kilogram daging sapi yang dipotong menjadi beberapa bagian, 1,5 liter santan dari 2 butir kelapa, 12 siung bawang merah, 6 siung bawang putih, 10 buah cabai merah keriting, 5 buah cabai rawit merah, 3 cm jahe, 3 cm lengkuas, 2 cm kunyit, 2 batang serai yang dimemarkan, 5 lembar daun jeruk, 2 lembar daun kunyit yang disimpulkan, 2 lembar daun salam, garam secukupnya, dan gula secukupnya.', 'haluskan bawang merah, bawang putih, cabai merah, cabai rawit, jahe, lengkuas, dan kunyit. Masukkan santan ke dalam wajan besar, lalu tambahkan bumbu halus, serai, daun jeruk, daun kunyit, dan daun salam. Masak sambil diaduk hingga santan mendidih. Setelah itu, masukkan potongan daging sapi dan masak dengan api sedang. Aduk sesekali agar santan tidak pecah dan bumbu meresap ke dalam daging. Tambahkan garam dan gula sesuai selera, kemudian lanjutkan memasak selama 3–4 jam hingga kuah santan mengering, berubah menjadi bumbu berwarna cokelat kehitaman, dan melapisi seluruh permukaan daging. Setelah daging empuk dan bumbu meresap sempurna, angkat dan sajikan rendang bersama nasi hangat. Rendang akan semakin nikmat setelah didiamkan beberapa jam karena bumbunya semakin meresap ke dalam daging.', '2026-06-02 14:51:18'),
(9, 10, 'Sego Gegog', 'Trenggalek', 'Jawa', '1780411984_segogegok-jatim.jpeg', '500 gram nasi putih matang, 150 gram ikan teri yang sudah dicuci bersih, 10 buah cabai rawit merah, 5 buah cabai merah keriting, 6 siung bawang merah, 4 siung bawang putih, 2 lembar daun salam, 2 cm lengkuas yang dimemarkan, garam secukupnya, gula secukupnya, penyedap rasa sesuai selera, beberapa lembar daun pisang untuk membungkus, dan lidi atau tusuk gigi untuk menyemat bungkus.', 'haluskan cabai rawit, cabai merah, bawang merah, dan bawang putih. Tumis bumbu halus hingga harum, lalu masukkan daun salam, lengkuas, dan ikan teri. Aduk hingga ikan teri matang dan bumbu meresap, kemudian tambahkan garam, gula, dan penyedap sesuai selera. Ambil selembar daun pisang, letakkan nasi secukupnya di atasnya, tambahkan tumisan ikan teri pedas di bagian tengah, lalu bungkus rapat dan semat kedua ujungnya menggunakan lidi. Lakukan hingga semua bahan habis. Setelah itu, susun bungkusan sego gegog dalam kukusan dan kukus selama sekitar 20–30 menit agar aroma daun pisang menyatu dengan nasi dan lauk.', '2026-06-02 14:53:04'),
(10, 12, 'Soto Lamongan', 'lamongan', 'Jawa', '1780412111_sotolamongan-jatim.jpg', '1 ekor ayam kampung atau sekitar 700 gram ayam potong, 2 liter air, 8 siung bawang merah, 5 siung bawang putih, 4 butir kemiri sangrai, 2 cm kunyit, 2 cm jahe, 1 sendok teh ketumbar, 2 batang serai yang dimemarkan, 3 lembar daun salam, 4 lembar daun jeruk, garam secukupnya, gula secukupnya, dan merica secukupnya. Sebagai pelengkap, siapkan soun, kol yang diiris tipis, telur rebus, daun bawang, seledri, jeruk nipis, serta taburan koya yang terbuat dari kerupuk udang dan bawang putih goreng yang dihaluskan.', 'rebus ayam dalam air hingga matang dan kaldu terbentuk. Sementara itu, haluskan bawang merah, bawang putih, kemiri, kunyit, jahe, dan ketumbar, lalu tumis hingga harum. Masukkan serai, daun salam, dan daun jeruk ke dalam tumisan, kemudian aduk hingga bumbu matang sempurna. Tuangkan bumbu tumis ke dalam rebusan ayam, lalu tambahkan garam, gula, dan merica sesuai selera. Masak kembali hingga kuah mendidih dan bumbu meresap. Setelah ayam matang, angkat lalu suwir-suwir dagingnya. Untuk penyajian, letakkan soun, kol, suwiran ayam, dan irisan telur rebus ke dalam mangkuk, kemudian siram dengan kuah panas. Tambahkan irisan daun bawang, seledri, perasan jeruk nipis, dan taburan koya di atasnya. Soto Lamongan siap disajikan dengan nasi hangat dan sambal sesuai selera.', '2026-06-02 14:55:11');

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
  MODIFY `id_komentar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
