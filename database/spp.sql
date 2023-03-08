-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Mar 2023 pada 06.42
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_siswa` ()  NO SQL
BEGIN
	SELECT `tbl_siswa`.*, `tbl_kelas`.`NAMA_KELAS`, `tbl_spp`.`TAHUN`
                FROM `tbl_siswa` JOIN `tbl_kelas`
                ON `tbl_siswa`.`id_kelas` = `tbl_kelas`.`id_kelas`
                JOIN `tbl_spp` ON `tbl_siswa` .`id_spp` = `tbl_spp`.`id_spp` ORDER BY `tbl_siswa`.`NISN`, `tbl_siswa`.`id_kelas` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kelas_get` ()  NO SQL
BEGIN
	SELECT `tbl_kelas`.*, `tbl_jurusan`.`jurusan` FROM `tbl_kelas` JOIN `tbl_jurusan` ON `tbl_kelas`.`id_jurusan` = `tbl_jurusan`.`id_jurusan` ORDER BY `tbl_kelas`.`id_jurusan` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `level_get` (IN `level` INT)  NO SQL
BEGIN
	SELECT * FROM tbl_level WHERE level = id_level;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check` (IN `user` VARCHAR(100), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_petugas WHERE user = username AND pass = password_petugas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_check` (IN `user` VARCHAR(10), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_siswa WHERE user = nisn AND pass = nis;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `JURUSAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`ID_JURUSAN`, `JURUSAN`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'Teknik Jaringan Dan Komputer'),
(3, 'multimedia'),
(4, 'Agribisnis Tanaman Pangan dan Holtikultura'),
(5, 'Teknik Sepeda Motor'),
(6, 'Teknik Kendaraan Ringan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `ID_JURUSAN` int(11) DEFAULT NULL,
  `NAMA_KELAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`ID_KELAS`, `ID_JURUSAN`, `NAMA_KELAS`) VALUES
(1, 1, 'XII RPL 2'),
(2, 3, 'XII MM 1'),
(4, 1, 'XII RPL 1'),
(9, 5, 'XII  TSM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level`
--

CREATE TABLE `tbl_level` (
  `ID_LEVEL` int(11) NOT NULL,
  `LEVEL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_level`
--

INSERT INTO `tbl_level` (`ID_LEVEL`, `LEVEL`) VALUES
(1, 'Admin'),
(2, 'Petugas'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_user` varchar(50) NOT NULL,
  `log_tipe` varchar(50) NOT NULL,
  `log_aksi` varchar(50) NOT NULL,
  `log_assign_to` varchar(50) NOT NULL,
  `log_assign_type` enum('petugas','siswa','spp','kelas','jurusan','transaksi','cetak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_user`, `log_tipe`, `log_aksi`, `log_assign_to`, `log_assign_type`) VALUES
(9, '2020-02-23 13:07:42', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(10, '2020-02-23 13:08:06', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(11, '2020-02-23 13:15:11', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(12, '2020-02-23 13:15:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(13, '2020-02-23 13:15:19', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(14, '2020-02-23 13:15:27', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(15, '2020-02-23 14:06:44', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(16, '2020-02-23 14:07:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(17, '2020-02-23 14:07:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(18, '2020-02-23 14:08:13', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(19, '2020-02-24 12:38:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(20, '2020-02-24 12:44:24', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(21, '2020-02-25 12:00:19', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(22, '2020-02-26 10:52:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(23, '2020-02-26 10:54:51', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(24, '2020-02-26 10:55:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(25, '2020-02-26 10:56:25', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(26, '2020-02-26 10:58:30', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(27, '2020-02-26 11:01:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(28, '2020-02-26 11:02:05', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(29, '2020-02-26 11:41:33', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(30, '2020-02-26 11:41:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(31, '2020-02-26 11:41:41', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(32, '2020-02-26 11:43:40', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(33, '2020-02-26 12:03:14', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(34, '2020-02-26 12:07:03', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(35, '2020-02-26 12:07:53', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(36, '2020-02-26 15:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(37, '2020-02-26 15:23:43', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(38, '2020-02-26 15:33:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(39, '2020-02-26 15:35:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(40, '2020-02-26 16:26:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(41, '2020-02-26 16:30:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(42, '2020-02-26 16:36:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(43, '2020-02-26 16:37:34', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(44, '2020-02-26 16:39:35', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(45, '2020-02-26 17:21:22', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(46, '2020-02-27 12:05:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(47, '2020-02-27 12:05:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(48, '2020-02-27 12:56:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(49, '2020-02-28 06:53:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(50, '2020-02-28 07:16:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(51, '2020-02-28 07:29:44', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(52, '2020-02-28 07:30:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(53, '2020-02-28 07:31:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(54, '2020-02-28 07:50:13', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(55, '2020-02-28 08:29:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(56, '2020-02-28 08:30:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(57, '2020-02-28 08:31:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(58, '2020-02-28 08:31:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(59, '2020-02-28 08:32:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(60, '2020-02-28 08:35:07', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(61, '2020-02-28 08:35:20', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(62, '2020-02-28 08:35:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(63, '2020-02-28 08:36:10', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(64, '2020-02-28 08:36:21', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(65, '2020-02-28 08:36:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(66, '2020-02-28 08:37:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(67, '2020-02-28 08:37:33', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(68, '2020-02-28 08:38:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(69, '2020-02-28 08:38:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(70, '2020-02-28 09:21:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(71, '2020-02-28 09:21:34', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(72, '2023-02-14 00:46:49', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(73, '2023-02-14 00:46:59', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(74, '2023-02-14 00:47:18', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(75, '2023-02-14 00:48:04', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(76, '2023-02-14 00:49:42', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(77, '2023-02-14 04:23:06', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(78, '2023-02-14 07:57:36', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(79, '2023-02-14 07:58:19', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(80, '2023-02-14 07:58:35', 'elgaa', 'kelas', 'Menghapus data kelas', '', ''),
(81, '2023-02-14 07:58:42', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(82, '2023-02-16 00:24:26', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(83, '2023-02-16 00:24:57', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(84, '2023-02-16 00:25:29', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(85, '2023-02-16 00:25:46', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(86, '2023-02-16 02:11:32', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(87, '2023-02-16 02:13:18', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(88, '2023-02-16 02:13:22', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(89, '2023-02-16 02:13:25', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(90, '2023-02-16 02:13:27', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(91, '2023-02-16 02:13:30', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(92, '2023-02-16 02:13:32', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(93, '2023-02-16 02:13:35', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(94, '2023-02-16 02:13:38', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(95, '2023-02-16 02:13:55', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(96, '2023-02-22 22:30:33', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(97, '2023-02-22 22:30:48', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(98, '2023-02-22 22:32:57', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(99, '2023-02-22 22:33:41', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(100, '2023-02-22 22:34:09', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(101, '2023-02-22 22:34:25', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(102, '2023-02-22 22:37:46', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(103, '2023-02-22 22:40:07', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(104, '2023-02-22 22:40:43', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(105, '2023-02-22 22:42:51', 'elgaa', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(106, '2023-02-23 00:40:08', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(107, '2023-02-23 00:44:07', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(108, '2023-02-23 00:45:13', 'elgaa', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(109, '2023-02-23 01:02:06', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(110, '2023-02-23 01:58:13', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(111, '2023-02-23 02:04:58', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(112, '2023-02-23 02:05:31', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(113, '2023-02-23 02:43:27', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(114, '2023-02-23 02:44:22', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(115, '2023-02-23 02:52:01', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(116, '2023-02-23 02:52:16', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(117, '2023-02-23 02:52:29', 'elgaa', 'spp', 'Menghapus data spp', '', ''),
(118, '2023-02-23 02:52:36', 'elgaa', 'spp', 'Menghapus data spp', '', ''),
(119, '2023-02-23 02:55:17', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(120, '2023-02-23 02:55:40', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(121, '2023-02-23 02:56:09', 'elgaa', 'kelas', 'Mengedit data kelas', '', ''),
(122, '2023-02-23 02:56:17', 'elgaa', 'kelas', 'Menghapus data kelas', '', ''),
(123, '2023-02-23 02:57:17', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(124, '2023-02-23 02:59:36', 'elgaa', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(125, '2023-02-23 03:04:36', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(126, '2023-02-23 03:07:59', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(127, '2023-02-23 03:08:18', 'elgaa', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(128, '2023-02-23 03:08:50', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(129, '2023-02-23 03:10:41', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(130, '2023-02-23 04:04:09', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(131, '2023-02-25 02:11:35', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(132, '2023-02-25 04:23:57', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(133, '2023-02-25 04:24:56', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(134, '2023-02-25 05:05:48', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(135, '2023-02-25 05:08:15', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(136, '2023-02-25 12:58:52', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(137, '2023-02-25 13:00:55', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(138, '2023-02-25 13:01:17', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(139, '2023-02-25 13:08:02', 'elgaa', 'petugas', 'Merubah password petugas', '', ''),
(140, '2023-02-25 13:08:46', 'elgaa', 'petugas', 'Merubah password petugas', '', ''),
(141, '2023-02-25 13:09:23', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(142, '2023-02-25 13:11:02', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(143, '2023-02-25 13:22:28', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(144, '2023-02-25 13:23:32', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(145, '2023-02-25 13:23:50', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(146, '2023-02-25 13:26:46', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(147, '2023-02-25 13:27:52', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(148, '2023-02-25 13:28:20', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(149, '2023-02-25 13:29:31', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(150, '2023-02-25 13:30:06', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(151, '2023-02-25 13:30:31', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(152, '2023-02-26 03:54:33', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(153, '2023-02-26 03:54:52', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(154, '2023-02-26 04:08:08', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(155, '2023-02-26 04:08:53', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(156, '2023-02-26 05:39:01', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(157, '2023-02-26 05:41:18', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(158, '2023-02-26 05:41:40', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(159, '2023-02-27 02:12:44', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(160, '2023-02-27 02:13:52', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(161, '2023-02-27 02:14:25', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(162, '2023-02-27 02:15:29', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(163, '2023-02-27 02:16:31', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(164, '2023-02-27 02:24:10', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(165, '2023-02-27 02:27:16', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(166, '2023-02-27 02:27:31', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(167, '2023-02-27 02:30:22', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(168, '2023-02-27 02:33:03', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(169, '2023-02-27 02:33:20', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(170, '2023-02-27 02:33:40', 'elgaa', 'kelas', 'Mengedit data kelas', '', ''),
(171, '2023-02-27 02:34:37', 'elgaa', 'kelas', 'Mengedit data kelas', '', ''),
(172, '2023-02-27 02:35:36', 'elgaa', 'kelas', 'Mengedit data kelas', '', ''),
(173, '2023-02-27 02:36:03', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(174, '2023-02-27 02:39:03', 'elgaa', 'kelas', 'Menambah data kelas', '', ''),
(175, '2023-02-27 02:51:28', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(176, '2023-02-27 02:56:02', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(177, '2023-02-27 02:57:33', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(178, '2023-02-27 02:58:05', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(179, '2023-02-27 03:05:37', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(180, '2023-02-27 03:06:54', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(181, '2023-02-27 07:13:20', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(182, '2023-02-27 07:13:41', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(183, '2023-02-27 07:15:42', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(184, '2023-02-27 07:16:03', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(185, '2023-02-27 07:17:16', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(186, '2023-02-27 07:20:24', 'elgaa', 'spp', 'Menambah data spp', '', ''),
(187, '2023-02-27 07:20:36', 'elgaa', 'spp', 'Mengedit data spp', '', ''),
(188, '2023-02-27 07:21:22', 'elgaa', 'kelas', 'Mengedit data kelas', '', ''),
(189, '2023-02-27 07:24:53', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(190, '2023-02-27 07:24:59', 'elgaa', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(191, '2023-02-27 07:25:22', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(192, '2023-02-27 07:26:18', 'elgaa', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(193, '2023-02-28 03:52:17', 'elgaa', 'kelas', 'Menghapus data kelas', '', ''),
(194, '2023-02-28 04:35:36', 'elgaa', 'siswa', 'Menghapus data siswa', '', ''),
(195, '2023-02-28 05:09:02', 'elgaa', 'siswa', 'Menghapus data siswa', '', ''),
(196, '2023-03-01 06:22:15', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(197, '2023-03-01 07:12:09', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(198, '2023-03-01 07:12:21', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(199, '2023-03-02 01:06:50', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(200, '2023-03-02 01:07:13', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(201, '2023-03-02 01:38:34', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(202, '2023-03-03 03:00:29', 'elgaa', 'siswa', 'Menghapus data siswa', '', ''),
(203, '2023-03-03 03:12:57', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(204, '2023-03-03 03:13:19', 'elgaa', 'siswa', 'Menghapus data siswa', '', ''),
(205, '2023-03-03 11:57:26', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(206, '2023-03-03 11:57:50', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(207, '2023-03-03 11:59:43', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(208, '2023-03-03 12:00:16', 'elgaa', 'siswa', 'Mengedit data siswa', '', ''),
(209, '2023-03-03 12:30:00', 'elgaa', 'siswa', 'Menambah data siswa', '', ''),
(210, '2023-03-04 03:07:27', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(211, '2023-03-04 03:07:35', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(212, '2023-03-04 03:07:52', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(213, '2023-03-04 03:07:58', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(214, '2023-03-04 03:08:06', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(215, '2023-03-04 03:09:55', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(216, '2023-03-04 03:10:01', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(217, '2023-03-06 00:50:51', 'elgaa', 'jurusan', 'Menambah data jurusan', '', ''),
(218, '2023-03-06 00:50:56', 'elgaa', 'jurusan', 'Menghapus data jurusan', '', ''),
(219, '2023-03-06 03:17:34', 'elgaa', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(220, '2023-03-06 13:30:54', 'elgaa', 'petugas', 'Mengedit data petugas', '', ''),
(221, '2023-03-06 13:43:20', 'elgaa', 'petugas', 'Menambah data petugas', '', ''),
(222, '2023-03-07 00:39:41', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(223, '2023-03-07 00:40:08', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(224, '2023-03-07 00:47:22', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(225, '2023-03-07 00:48:00', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(226, '2023-03-07 00:48:15', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(227, '2023-03-07 00:48:40', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(228, '2023-03-07 00:48:53', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(229, '2023-03-07 00:51:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(230, '2023-03-07 01:32:10', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(231, '2023-03-07 01:41:14', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(232, '2023-03-07 02:23:32', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(233, '2023-03-07 02:47:10', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(234, '2023-03-07 02:48:07', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(235, '2023-03-07 02:50:26', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(236, '2023-03-07 03:30:27', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(237, '2023-03-07 03:30:59', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(238, '2023-03-07 03:33:43', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(239, '2023-03-07 03:36:49', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(240, '2023-03-07 03:40:39', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(241, '2023-03-07 03:43:39', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(242, '2023-03-07 03:44:13', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(243, '2023-03-07 03:46:44', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(244, '2023-03-07 03:47:24', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(245, '2023-03-07 03:57:49', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(246, '2023-03-07 03:59:20', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(247, '2023-03-07 03:59:33', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(248, '2023-03-07 03:59:40', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(249, '2023-03-07 03:59:47', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(250, '2023-03-07 04:42:11', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(251, '2023-03-07 04:44:53', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(252, '2023-03-07 05:04:21', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(253, '2023-03-07 05:15:57', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(254, '2023-03-07 05:19:30', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(255, '2023-03-07 05:24:23', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(256, '2023-03-07 05:24:30', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(257, '2023-03-07 05:27:17', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(258, '2023-03-07 05:36:58', 'Administrator', 'spp', 'Menambah data spp', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NISN` char(10) DEFAULT NULL,
  `TGL_BAYAR` date DEFAULT NULL,
  `JATUH_TEMPO` date NOT NULL,
  `BULAN_DIBAYAR` varchar(9) DEFAULT NULL,
  `TAHUN_DIBAYAR` varchar(4) DEFAULT NULL,
  `ID_SPP` int(11) NOT NULL,
  `JUMLAH_BAYAR` int(11) NOT NULL,
  `KET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`ID_PEMBAYARAN`, `ID_PETUGAS`, `NISN`, `TGL_BAYAR`, `JATUH_TEMPO`, `BULAN_DIBAYAR`, `TAHUN_DIBAYAR`, `ID_SPP`, `JUMLAH_BAYAR`, `KET`) VALUES
(273, 1, '0023457641', '2023-03-07', '2022-01-01', 'Januari', '2022', 9, 430000, 'LUNAS'),
(274, 1, '0023457641', '2023-03-07', '2022-02-01', 'Februari', '2022', 9, 430000, 'LUNAS'),
(275, 1, '0023457641', NULL, '2022-03-01', 'Maret', '2022', 9, 430000, ''),
(276, 1, '0023457641', NULL, '2022-04-01', 'April', '2022', 9, 430000, ''),
(277, 1, '0023457641', NULL, '2022-05-01', 'Mei', '2022', 9, 430000, ''),
(278, 1, '0023457641', NULL, '2022-06-01', 'Juni', '2022', 9, 430000, ''),
(279, 1, '0023457641', NULL, '2022-07-01', 'Juli', '2022', 9, 430000, ''),
(280, 1, '0023457641', NULL, '2022-08-01', 'Agustus', '2022', 9, 430000, ''),
(281, 1, '0023457641', NULL, '2022-09-01', 'September', '2022', 9, 430000, ''),
(282, 1, '0023457641', NULL, '2022-10-01', 'Oktober', '2022', 9, 430000, ''),
(283, 1, '0023457641', NULL, '2022-11-01', 'November', '2022', 9, 430000, ''),
(284, 1, '0023457641', NULL, '2022-12-01', 'Desember', '2022', 9, 430000, ''),
(297, 1, '0026758972', '2023-03-07', '2022-01-01', 'Januari', '2022', 9, 450000, 'LUNAS'),
(298, 1, '0026758972', NULL, '2022-02-01', 'Februari', '2022', 9, 450000, ''),
(299, 1, '0026758972', NULL, '2022-03-01', 'Maret', '2022', 9, 450000, ''),
(300, 1, '0026758972', NULL, '2022-04-01', 'April', '2022', 9, 450000, ''),
(301, 1, '0026758972', NULL, '2022-05-01', 'Mei', '2022', 9, 450000, ''),
(302, 1, '0026758972', NULL, '2022-06-01', 'Juni', '2022', 9, 450000, ''),
(303, 1, '0026758972', NULL, '2022-07-01', 'Juli', '2022', 9, 450000, ''),
(304, 1, '0026758972', NULL, '2022-08-01', 'Agustus', '2022', 9, 450000, ''),
(305, 1, '0026758972', NULL, '2022-09-01', 'September', '2022', 9, 450000, ''),
(306, 1, '0026758972', NULL, '2022-10-01', 'Oktober', '2022', 9, 450000, ''),
(307, 1, '0026758972', NULL, '2022-11-01', 'November', '2022', 9, 450000, ''),
(308, 1, '0026758972', NULL, '2022-12-01', 'Desember', '2022', 9, 450000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `ID_LEVEL` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD_PETUGAS` varchar(225) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `DESKRIPSI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`ID_PETUGAS`, `ID_LEVEL`, `USERNAME`, `PASSWORD_PETUGAS`, `NAMA_PETUGAS`, `DESKRIPSI`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin'),
(3, 2, 'petugas', 'b53fe7751b37e40ff34d012c7774d65f', 'Petugas', 'petugas1'),
(34, 2, 'firoh', '827ccb0eea8a706c4c34a16891f84e7b', 'firoh', 'saya petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `NISN` char(10) NOT NULL,
  `ID_KELAS` int(11) DEFAULT NULL,
  `ID_SPP` int(11) DEFAULT NULL,
  `NIS` char(8) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text DEFAULT NULL,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`) VALUES
('0023457641', 4, 9, '00233687', 'Aniatul', 'karangduren', '083456782330', '2023-03-07 01:41:14'),
('0026758972', 4, 9, '00243657', 'narendra', 'jember', '083456782330', '2023-03-07 04:44:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `ID_SPP` int(11) NOT NULL,
  `TAHUN` varchar(16) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_spp`
--

INSERT INTO `tbl_spp` (`ID_SPP`, `TAHUN`, `NOMINAL`) VALUES
(9, '2022/2023', 450000),
(16, '2015/2016', 120000),
(17, '2022/2023', 430000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`ID_JURUSAN`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `FK_JURUSAN` (`ID_JURUSAN`);

--
-- Indeks untuk tabel `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `FK_SISWA` (`NISN`);

--
-- Indeks untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`),
  ADD KEY `FK_LEVEL` (`ID_LEVEL`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `FK_KELAS` (`ID_KELAS`),
  ADD KEY `FK_SPP` (`ID_SPP`);

--
-- Indeks untuk tabel `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`ID_SPP`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `FK_JURUSAN` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `tbl_jurusan` (`ID_JURUSAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `FK_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `tbl_petugas` (`ID_PETUGAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SISWA` FOREIGN KEY (`NISN`) REFERENCES `tbl_siswa` (`NISN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD CONSTRAINT `FK_LEVEL` FOREIGN KEY (`ID_LEVEL`) REFERENCES `tbl_level` (`ID_LEVEL`);

--
-- Ketidakleluasaan untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `FK_KELAS` FOREIGN KEY (`ID_KELAS`) REFERENCES `tbl_kelas` (`ID_KELAS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPP` FOREIGN KEY (`ID_SPP`) REFERENCES `tbl_spp` (`ID_SPP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
