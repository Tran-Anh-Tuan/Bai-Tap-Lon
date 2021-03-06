create table `TaiKhoan`
(
   `TaiKhoan` varchar(100) primary key,
   `MatKhau` varchar(100),
   `LoaiTaiKhoan` int
);


create table Truyen
(
   `IDTruyen` int AUTO_INCREMENT primary key,
   `TenTruyen` varchar(200),
   `ThongTin` text,
   `URLAnhBia` varchar(500),
   `TheLoai` varchar(100),
   `TacGia` varchar(500),
   `NhomDich` varchar(500),
   `LuotDoc` int
);

create table `ChuongTruyen`
(
   `IDChuong` int AUTO_INCREMENT primary key,
   `TenChuong` varchar(500),
   `IDTruyen` int,  
   `NgayDang` date,
   
   foreign key (IDTruyen) references Truyen(IDTruyen)
);


create table DanhSachAnh
(
   `IDAnh` int AUTO_INCREMENT primary key,
   `URL` varchar(500),
   `IDChuong` int,
   
   foreign key (IDChuong) references ChuongTruyen(IDChuong)
);


create table TruyenTheoDoi
(
  `IDTruyen` int,
  `TaiKhoan` varchar(100),
  
  foreign key (IDTruyen) references Truyen(IDTruyen),
  foreign key (TaiKhoan) references TaiKhoan(TaiKhoan)
);
