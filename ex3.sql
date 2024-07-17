use md3_ss02;
create table phieuXuat(
   sopx int auto_increment primary key,
   ngayxuat datetime
);

create table phieuXuatChiTiet(
  sopx int,
  maVt int,
  donGiaXuat double,
  soLuongXuat int,
  primary key(sopx, maVt),
  constraint fk_phieuxuat foreign key (sopx) references phieuXuat(sopx),
  constraint fk_vattu_xuat foreign key (maVt) references vatTu(maVT)
);

create table vatTu(
  maVT  int auto_increment primary key,
  tenVT varchar(255)
  
);

create table ngayCungCap(
   maNCC int auto_increment primary key,
   tenNCC varchar(255),
   diachi varchar(255),
   sodienthoai varchar(11)
);

create table donDatHang(
  soDH int auto_increment primary key,
  maNCC int,
  ngayDH dateTime,
  constraint fk_ngaycungcap foreign key (maNCC) references ngayCungCap (maNCC)
);


create table chiTietDonHang(
  maVT int,
  soDH int,
  primary key(maVT,soDH),
  constraint fk_vattu_don foreign key (maVT) references vatTu (maVT),
  constraint fk_donhang foreign key (soDH) references donDatHang(soDH)
  
);

create table phieuNhap(
  soPN int auto_increment primary key,
  ngayNhap datetime
);

create table phieuNhapChiTiet(
   soPN int,
   maVT int,
   donGiaNhap double,
   soLuongNhap int,
   primary key(soPN,maVT),
   constraint fk_phieuphap foreign key (soPN) references phieuNhap(soPN),
   constraint fk_vattu_chitiet foreign key (maVT) references vatTu(maVT)
);