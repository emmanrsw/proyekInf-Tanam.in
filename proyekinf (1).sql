-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 07:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyekinf`
--

-- --------------------------------------------------------

--
-- Table structure for table `datakaryawan`
--

CREATE TABLE `datakaryawan` (
  `idKywn` int(11) NOT NULL,
  `peran` varchar(255) NOT NULL,
  `gaji` decimal(25,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaksijual`
--

CREATE TABLE `detailtransaksijual` (
  `idTJual` int(11) NOT NULL,
  `idTanaman` int(11) NOT NULL,
  `jmlTJual` int(20) NOT NULL,
  `hargaTJual` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `idKywn` int(11) NOT NULL,
  `namaKywn` varchar(255) NOT NULL,
  `alamatKywn` varchar(255) NOT NULL,
  `emailKywn` varchar(255) NOT NULL,
  `usernameKywn` varchar(20) NOT NULL,
  `passwordKywn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`idKywn`, `namaKywn`, `alamatKywn`, `emailKywn`, `usernameKywn`, `passwordKywn`) VALUES
(1, 'Cahyo', 'Paingan', 'cahyokumolonugroho@gmail.com', 'cahyokumolo', 'cahyo123');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `idKeranjang` int(10) NOT NULL,
  `idTanaman` int(11) NOT NULL,
  `idCust` int(11) DEFAULT NULL,
  `kuantitas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idCust` int(11) NOT NULL,
  `namaCust` varchar(255) NOT NULL,
  `gambarCust` varchar(255) NOT NULL,
  `alamatCust` varchar(255) NOT NULL,
  `notlpCust` int(11) NOT NULL,
  `emailCust` varchar(255) NOT NULL,
  `usernameCust` varchar(20) NOT NULL,
  `passwordCust` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `idTanaman` int(11) NOT NULL,
  `namaTanaman` varchar(255) NOT NULL,
  `jmlTanaman` int(20) NOT NULL,
  `hargaTanaman` decimal(20,0) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksijual`
--

CREATE TABLE `transaksijual` (
  `idTJual` int(11) NOT NULL,
  `idCust` int(11) NOT NULL,
  `idKywn` int(11) NOT NULL,
  `tglTJual` date NOT NULL,
  `waktuTJual` time NOT NULL,
  `metodeByr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datakaryawan`
--
ALTER TABLE `datakaryawan`
  ADD UNIQUE KEY `idKywn` (`idKywn`);

--
-- Indexes for table `detailtransaksijual`
--
ALTER TABLE `detailtransaksijual`
  ADD UNIQUE KEY `idTJual` (`idTJual`,`idTanaman`),
  ADD KEY `idTanaman` (`idTanaman`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`idKywn`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idKeranjang`),
  ADD UNIQUE KEY `idTanaman` (`idTanaman`),
  ADD UNIQUE KEY `idCust` (`idCust`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idCust`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`idTanaman`);

--
-- Indexes for table `transaksijual`
--
ALTER TABLE `transaksijual`
  ADD PRIMARY KEY (`idTJual`),
  ADD UNIQUE KEY `idKywn` (`idKywn`),
  ADD KEY `idCust` (`idCust`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datakaryawan`
--
ALTER TABLE `datakaryawan`
  MODIFY `idKywn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detailtransaksijual`
--
ALTER TABLE `detailtransaksijual`
  MODIFY `idTJual` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `idKywn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `idKeranjang` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idCust` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `idTanaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksijual`
--
ALTER TABLE `transaksijual`
  MODIFY `idTJual` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datakaryawan`
--
ALTER TABLE `datakaryawan`
  ADD CONSTRAINT `datakaryawan_ibfk_1` FOREIGN KEY (`idKywn`) REFERENCES `karyawan` (`idKywn`);

--
-- Constraints for table `detailtransaksijual`
--
ALTER TABLE `detailtransaksijual`
  ADD CONSTRAINT `detailtransaksijual_ibfk_1` FOREIGN KEY (`idTanaman`) REFERENCES `tanaman` (`idTanaman`),
  ADD CONSTRAINT `detailtransaksijual_ibfk_2` FOREIGN KEY (`idTJual`) REFERENCES `transaksijual` (`idTJual`);

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`idTanaman`) REFERENCES `tanaman` (`idTanaman`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`idCust`) REFERENCES `pelanggan` (`idCust`);

--
-- Constraints for table `transaksijual`
--
ALTER TABLE `transaksijual`
  ADD CONSTRAINT `transaksijual_ibfk_1` FOREIGN KEY (`idCust`) REFERENCES `pelanggan` (`idCust`),
  ADD CONSTRAINT `transaksijual_ibfk_2` FOREIGN KEY (`idKywn`) REFERENCES `karyawan` (`idKywn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
