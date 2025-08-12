-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 05:43 AM
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
-- Database: `patobus`
--

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` bigint(20) NOT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `nome_empresa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `cnpj`, `nome_empresa`) VALUES
(1, '12345678000101', 'Empresa Alpha'),
(2, '98765432000199', 'Empresa Beta');

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `id` bigint(20) NOT NULL,
  `hora` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`id`, `hora`) VALUES
(1, '06:00:00.000000'),
(2, '07:00:00.000000'),
(3, '08:00:00.000000'),
(4, '12:00:00.000000'),
(5, '18:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `linha`
--

CREATE TABLE `linha` (
  `id_linha` bigint(20) NOT NULL,
  `nome_linha` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_empresa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `linha`
--

INSERT INTO `linha` (`id_linha`, `nome_linha`, `valor`, `id_empresa`) VALUES
(1, 'Linha Centro - Bairro', 4.50, 1),
(2, 'Linha Bairro - Terminal', 5.00, 2),
(19, 'Sem Linha', 0.00, 1),
(20, 'Sem Linha', 0.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `linha_horario`
--

CREATE TABLE `linha_horario` (
  `id` bigint(20) NOT NULL,
  `horario_id` bigint(20) NOT NULL,
  `linha_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `linha_horario`
--

INSERT INTO `linha_horario` (`id`, `horario_id`, `linha_id`) VALUES
(4, 4, 2),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `onibus`
--

CREATE TABLE `onibus` (
  `id_onibus` bigint(20) NOT NULL,
  `gps_caractere_atual` varchar(255) DEFAULT NULL,
  `placa_de` varchar(255) DEFAULT NULL,
  `id_linha` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onibus`
--

INSERT INTO `onibus` (`id_onibus`, `gps_caractere_atual`, `placa_de`, `id_linha`) VALUES
(1, 'GPS_12.34_56.78', 'ABC-1234', 1),
(2, 'GPS_98.76_54.32', 'XYZ-5678', 2),
(6, 'GPS_00.00_00.00', 'NEW-0000', 19);

-- --------------------------------------------------------

--
-- Table structure for table `paradas`
--

CREATE TABLE `paradas` (
  `id_parada` bigint(20) NOT NULL,
  `lon` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paradas`
--

INSERT INTO `paradas` (`id_parada`, `lon`, `lat`) VALUES
(1, '-35.275297', '-5.925673'),
(2, '-35.275769', '-5.916623'),
(3, '-35.273795', '-5.916922'),
(4, '-35.271800', '-5.917818'),
(5, '-35.271478', '-5.917263'),
(6, '-35.270748', '-5.917434'),
(7, '-35.270641', '-5.917178'),
(8, '-35.268774', '-5.917946'),
(9, '-35.268860', '-5.918395'),
(10, '-35.265169', '-5.920529'),
(11, '-35.265212', '-5.927786'),
(12, '-35.265277', '-5.929472'),
(13, '-35.264869', '-5.929941'),
(14, '-35.264912', '-5.933772'),
(15, '-35.265062', '-5.935640'),
(16, '-35.265126', '-5.936323'),
(17, '-35.265094', '-5.936899'),
(18, '-35.265105', '-5.937240'),
(19, '-35.265116', '-5.937529'),
(20, '-35.265137', '-5.937753'),
(21, '-35.272122', '-5.937795'),
(22, '-35.276327', '-5.937763'),
(23, '-35.277132', '-5.937817'),
(24, '-35.277164', '-5.937902'),
(25, '-35.278773', '-5.937795'),
(26, '-35.278924', '-5.934637'),
(27, '-35.278237', '-5.934594'),
(28, '-35.278409', '-5.930048'),
(29, '-35.275147', '-5.928212'),
(30, '-35.275297', '-5.925587'),
(31, '-5.925673', '-35.275297');

-- --------------------------------------------------------

--
-- Table structure for table `rota`
--

CREATE TABLE `rota` (
  `id_rota` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `nome_rota` varchar(255) DEFAULT NULL,
  `pontos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pontos`)),
  `id_linha` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rota`
--

INSERT INTO `rota` (`id_rota`, `descricao`, `nome_rota`, `pontos`, `id_linha`, `id_empresa`) VALUES
(2, NULL, 'Rota Terminal', NULL, 2, 2),
(4, 'teste', 'teste', '[{\"latitude\":-5.79448,\"longitude\":-35.211},{\"latitude\":-5.79325,\"longitude\":-35.2101}]', 1, 1),
(5, NULL, 'Rota Centro', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rota_paradas`
--

CREATE TABLE `rota_paradas` (
  `id_rtparadas` bigint(20) NOT NULL,
  `id_rota` bigint(20) NOT NULL,
  `id_parada` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rota_paradas`
--

INSERT INTO `rota_paradas` (`id_rtparadas`, `id_rota`, `id_parada`) VALUES
(91, 5, 1),
(92, 5, 2),
(93, 5, 3),
(94, 5, 4),
(95, 5, 5),
(96, 5, 6),
(97, 5, 7),
(98, 5, 8),
(99, 5, 9),
(100, 5, 10),
(101, 5, 11),
(102, 5, 12),
(103, 5, 13),
(104, 5, 14),
(105, 5, 15),
(106, 5, 16),
(107, 5, 17),
(108, 5, 18),
(109, 5, 19),
(110, 5, 20),
(111, 5, 21),
(112, 5, 22),
(113, 5, 23),
(114, 5, 24),
(115, 5, 25),
(116, 5, 26),
(117, 5, 27),
(118, 5, 28),
(119, 5, 29),
(120, 5, 30),
(121, 4, 31);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `adm` tinyint(1) NOT NULL DEFAULT 0,
  `id_empresa` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `senha`, `adm`, `id_empresa`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, 1),
(2, 'admin2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linha`
--
ALTER TABLE `linha`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_linha_empresa` (`id_empresa`);

--
-- Indexes for table `linha_horario`
--
ALTER TABLE `linha_horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linha_horario_horario` (`horario_id`),
  ADD KEY `fk_linha_horario_linha` (`linha_id`);

--
-- Indexes for table `onibus`
--
ALTER TABLE `onibus`
  ADD PRIMARY KEY (`id_onibus`),
  ADD KEY `fk_onibus_linha` (`id_linha`);

--
-- Indexes for table `paradas`
--
ALTER TABLE `paradas`
  ADD PRIMARY KEY (`id_parada`);

--
-- Indexes for table `rota`
--
ALTER TABLE `rota`
  ADD PRIMARY KEY (`id_rota`),
  ADD KEY `fk_rota_empresa` (`id_empresa`),
  ADD KEY `fk_rota_linha` (`id_linha`);

--
-- Indexes for table `rota_paradas`
--
ALTER TABLE `rota_paradas`
  ADD PRIMARY KEY (`id_rtparadas`),
  ADD KEY `fk_rota` (`id_rota`),
  ADD KEY `fk_parada` (`id_parada`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `linha`
--
ALTER TABLE `linha`
  MODIFY `id_linha` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `linha_horario`
--
ALTER TABLE `linha_horario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `onibus`
--
ALTER TABLE `onibus`
  MODIFY `id_onibus` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `paradas`
--
ALTER TABLE `paradas`
  MODIFY `id_parada` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `rota`
--
ALTER TABLE `rota`
  MODIFY `id_rota` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rota_paradas`
--
ALTER TABLE `rota_paradas`
  MODIFY `id_rtparadas` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `linha`
--
ALTER TABLE `linha`
  ADD CONSTRAINT `fk_linha_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Constraints for table `linha_horario`
--
ALTER TABLE `linha_horario`
  ADD CONSTRAINT `fk_linha_horario_horario` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`id`),
  ADD CONSTRAINT `fk_linha_horario_linha` FOREIGN KEY (`linha_id`) REFERENCES `linha` (`id_linha`);

--
-- Constraints for table `onibus`
--
ALTER TABLE `onibus`
  ADD CONSTRAINT `fk_onibus_linha` FOREIGN KEY (`id_linha`) REFERENCES `linha` (`id_linha`);

--
-- Constraints for table `rota`
--
ALTER TABLE `rota`
  ADD CONSTRAINT `fk_rota_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `fk_rota_linha` FOREIGN KEY (`id_linha`) REFERENCES `linha` (`id_linha`);

--
-- Constraints for table `rota_paradas`
--
ALTER TABLE `rota_paradas`
  ADD CONSTRAINT `fk_parada` FOREIGN KEY (`id_parada`) REFERENCES `paradas` (`id_parada`),
  ADD CONSTRAINT `fk_rota` FOREIGN KEY (`id_rota`) REFERENCES `rota` (`id_rota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
