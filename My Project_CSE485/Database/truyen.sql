-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2018 at 04:14 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webtruyen`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LayToanBoTruyen` ()  BEGIN
   DROP TABLE IF EXISTS `Xoa`;
   CREATE TABLE `Xoa` 
   (   
     TenTruyen varchar(200), 
     NhomDich varchar(200),
     TenCHuong varchar(200), 
     NgayDang date, 
     TacGia varchar(200)
   );  
   INSERT INTO Xoa SELECT TenTruyen, NhomDich, TenCHuong, NgayDang, TacGia FROM Truyen, ChuongTruyen WHERE chuongtruyen.IDTruyen=truyen.IDTruyen ORDER BY truyen.IDTruyen DESC LIMIT 1;
   SELECT TenTruyen, NhomDich, TenCHuong, NgayDang, TacGia FROM Xoa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `anh`
--

CREATE TABLE `anh` (
  `IDAnh` int(11) NOT NULL,
  `URLAnh` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `IDChuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chuongtruyen`
--

CREATE TABLE `chuongtruyen` (
  `IDChuong` int(11) NOT NULL,
  `TenChuong` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `IDTruyen` int(11) DEFAULT NULL,
  `NgayDang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `chuongtruyen`
--

INSERT INTO `chuongtruyen` (`IDChuong`, `TenChuong`, `IDTruyen`, `NgayDang`) VALUES
(12, 'dsfasdf', 12, '2018-03-29'),
(13, 'adsfasf', 12, '2018-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TaiKhoan` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MatKhau` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `LoaiTaiKhoan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`TaiKhoan`, `MatKhau`, `Email`, `LoaiTaiKhoan`) VALUES
('Admin', '1', 'admin@gmail.com', 0),
('NguoiDung', '1', 'nguoidung@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `truyen`
--

CREATE TABLE `truyen` (
  `IDTruyen` int(11) NOT NULL,
  `TenTruyen` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MoTa` text COLLATE utf8mb4_vietnamese_ci,
  `URLAnhBia` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TheLoai` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TacGia` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NhomDich` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `LuotDoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `truyen`
--

INSERT INTO `truyen` (`IDTruyen`, `TenTruyen`, `MoTa`, `URLAnhBia`, `TheLoai`, `TacGia`, `NhomDich`, `LuotDoc`) VALUES
(1, 'test', 'moTa', 'vu nguyen', 'Kinh dị', 'dsfadsf', 'vÅ© nguyÃªn', 100),
(2, 'áº¥dkjfasdfkasf', 'moTa', 'sdfasdfasf', 'Hành động', 'Ã¡dfas', 'Ã¡dfasfasffdasf', 100),
(5, 'naruto', 'moTa', 'vu_4', 'Siêu nhiên', '', 'vÅ© nguyÃªn', 100),
(6, 'naruto', 'moTa', 'vu_5', 'Tình cảm', '', 'vÅ© nguyÃªn', 100),
(7, 'BỎUTO', 'moTa', 'vu nguyen', 'Hành động', '', 'vÅ© nguyÃªn', 100),
(8, 'naruto', 'moTa', 'vu nguyen', 'Hành động', '', 'vÅ© nguyÃªn', 100),
(9, 'naruto', 'moTa', 'vu nguyen', 'Hành động', '', 'vÅ© nguyÃªn', 100),
(10, 'naruto', 'moTa', 'vu nguyen', 'Viễn tưởng', '', 'vÅ© nguyÃªn', 100),
(11, 'naruto', 'moTa', 'vu nguyen', 'asdfas', '', 'vÅ© nguyÃªn', NULL),
(12, 'naruto', 'moTa', 'vu nguyen', 'asdfas', '', 'vÅ© nguyÃªn', NULL),
(13, 'naruto', 'moTa', 'vu nguyen', 'sdfas', '', 'vÅ© nguyÃªn', NULL),
(14, 'naruto', 'moTa', 'vu nguyen', 'sdfas', '', 'vÅ© nguyÃªn', NULL),
(15, 'naruto', 'moTa', 'vu nguyen', 'sdfgds', '', 'vÅ© nguyÃªn', NULL),
(16, 'naruto', 'moTa', 'vu nguyen', 'dammau', '', 'vÅ© nguyÃªn', NULL),
(17, 'naruto', 'moTa', 'vu nguyen', 'dammau', '', 'vÅ© nguyÃªn', NULL),
(18, 'naruto', 'moTa', 'vu nguyen', 'dammau', '', 'vÅ© nguyÃªn', NULL),
(19, 'dam nhau', 'fadadsf', '', 'dam mau', 'hiden', 'daf', NULL),
(22, 'vuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', 'fadadsf', '', 'dam mau', 'hiden', 'daf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `truyentheodoi`
--

CREATE TABLE `truyentheodoi` (
  `IDTruyen` int(11) DEFAULT NULL,
  `TaiKhoan` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `truyentheodoi`
--

INSERT INTO `truyentheodoi` (`IDTruyen`, `TaiKhoan`) VALUES
(1, 'NguoiDung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anh`
--
ALTER TABLE `anh`
  ADD PRIMARY KEY (`IDAnh`),
  ADD KEY `IDChuong` (`IDChuong`);

--
-- Indexes for table `chuongtruyen`
--
ALTER TABLE `chuongtruyen`
  ADD PRIMARY KEY (`IDChuong`),
  ADD KEY `IDTruyen` (`IDTruyen`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TaiKhoan`);

--
-- Indexes for table `truyen`
--
ALTER TABLE `truyen`
  ADD PRIMARY KEY (`IDTruyen`);

--
-- Indexes for table `truyentheodoi`
--
ALTER TABLE `truyentheodoi`
  ADD KEY `IDTruyen` (`IDTruyen`),
  ADD KEY `TaiKhoan` (`TaiKhoan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anh`
--
ALTER TABLE `anh`
  MODIFY `IDAnh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chuongtruyen`
--
ALTER TABLE `chuongtruyen`
  MODIFY `IDChuong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `truyen`
--
ALTER TABLE `truyen`
  MODIFY `IDTruyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anh`
--
ALTER TABLE `anh`
  ADD CONSTRAINT `anh_ibfk_1` FOREIGN KEY (`IDChuong`) REFERENCES `chuongtruyen` (`IDChuong`);

--
-- Constraints for table `chuongtruyen`
--
ALTER TABLE `chuongtruyen`
  ADD CONSTRAINT `chuongtruyen_ibfk_1` FOREIGN KEY (`IDTruyen`) REFERENCES `truyen` (`IDTruyen`);

--
-- Constraints for table `truyentheodoi`
--
ALTER TABLE `truyentheodoi`
  ADD CONSTRAINT `truyentheodoi_ibfk_1` FOREIGN KEY (`IDTruyen`) REFERENCES `truyen` (`IDTruyen`),
  ADD CONSTRAINT `truyentheodoi_ibfk_2` FOREIGN KEY (`TaiKhoan`) REFERENCES `taikhoan` (`TaiKhoan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
