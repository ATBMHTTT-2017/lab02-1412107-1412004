--connect as sysadmin
----------------------------------1. create tables------------------------------------
--1. PHONGBAN
Create table PHONGBAN_1412107_1412004(
	MAPHG varchar2(15) not null,
	TENPHG nvarchar2(30),
	TRPHG varchar2(15),
  NG_NHANCHUC date,
	soNhanVien int, 
  chiNhanh varchar2(15),
	constraint PK_PHONGBAN_1412107_1412004 primary key (MAPHG)
);

--2. NHANVIEN
Create table NHANVIEN_1412107_1412004(
	MANV varchar2(15) not null,
	HOTEN nvarchar2(50),
  diaChi varchar2(50),
  dienThoai varchar2(15),
  email nvarchar2(50),
  MAPHG varchar2(15),
  chiNhanh varchar2(15),
	LUONG float,
  MATKHAU varchar2(15),
	constraint PK_NHANVIEN_1412107_1412004 primary key (MANV)
);

--3. CHINHANH
Create table CHINHANH_1412107_1412004(
  maCN varchar2(15) null,
  tenCN nvarchar2(50),
  truongChiNhanh varchar2(15),
  constraint PK_CHINHANH_1412107_1412004 primary key (maCN)
);

--4. DUAN
Create table DUAN_1412107_1412004(
  maDA varchar2(15) not null,
  tenDA nvarchar2(50),
  kinhPhi float,
  phongChuTri varchar2(15),
  truongDA varchar2(15),
  constraint PK_DUAN_1412107_1412004 primary key (maDA)
);

--5. CHITIEU
Create table CHITIEU_1412107_1412004(
  maChiTieu varchar2(15) not null,
  tenChiTieu nvarchar2(50),
  soTien float,
  duAn varchar2(15),
  constraint PK_CHITIEU_1412107_1412004 primary key (maChiTieu)
);
--6. PHANCONG
Create table PHANCONG_1412107_1412004(
  MANV varchar2(15) not null,
  maDA varchar2(15) not null,
  vaiTro nvarchar2(50),
  phuCap float,
  constraint PK_PHANCONG_1412107_1412004 primary key (MANV, maDA)
);


-------------------------------2. create foreign key------------------------------------------
--1. PHONGBAN
Alter table PHONGBAN_1412107_1412004 add(
constraint FK_PHONGBAN_NHANVIEN_1412107_1412004 foreign key(TRPHG) references NHANVIEN_1412107_1412004(MANV),
constraint FK_PHONGBAN_CHINHANH_1412107_1412004 foreign key(chiNhanh) references CHINHANH_1412107_1412004(maCN)
);

--2. NHANVIEN
Alter table NHANVIEN_1412107_1412004 add(
constraint FK_NHANVIEN_PHONGBAN_1412107_1412004 foreign key(MAPHG) references PHONGBAN_1412107_1412004(MAPHG),
constraint FK_NHANVIEN_CHINHANH_1412107_1412004 foreign key(chiNhanh) references CHINHANH_1412107_1412004(maCN)
);

--3. CHINHANH
Alter table CHINHANH_1412107_1412004 add(
constraint FK_CHINHANH_NHANVIEN_1412107_1412004 foreign key(truongChiNhanh) references NHANVIEN_1412107_1412004(MANV)
);

--4. DUAN
Alter table DUAN_1412107_1412004 add(
constraint FK_DUAN_PHONGBAN_1412107_1412004 foreign key (phongChuTri) references PHONGBAN_1412107_1412004(MAPHG),
constraint FK_DUAN_NHANVIEN_1412107_1412004 foreign key (truongDA) references NHANVIEN_1412107_1412004(MANV)
);

--5. CHITIEU
Alter table CHITIEU_1412107_1412004 add(
constraint FK_CHITIEU_DUAN_1412107_1412004 foreign key(duAn) references DUAN_1412107_1412004(maDA)
);

--6. PHANCONG
Alter table PHANCONG_1412107_1412004 add(
constraint FK_PHANCONG_DUAN_1412107_1412004 foreign key(maDA) references DUAN_1412107_1412004(maDA),
constraint FK_PHANCONG_NHANVIEN_1412107_1412004 foreign key(MANV) references NHANVIEN_1412107_1412004(MANV)
);
-------------------------------------3. insert data-------------------------------------------
--1. CHINHANH
Insert into CHINHANH_1412107_1412004 values ('CN001', N'TP HCM', null);
Insert into CHINHANH_1412107_1412004 values ('CN002', N'V?ng Tàu', null);
Insert into CHINHANH_1412107_1412004 values ('CN003', N'Hà N?i', null);
Insert into CHINHANH_1412107_1412004 values ('CN004', N'B?c Liêu', null);
Insert into CHINHANH_1412107_1412004 values ('CN005', N'C?n Th?', null);

--update CHINHANH set truongChiNhanh
Update CHINHANH_1412107_1412004 set truongChiNhanh = 'CN001TR' where maCN = 'CN001';
Update CHINHANH_1412107_1412004 set truongChiNhanh = 'CN002TR' where maCN = 'CN002';
Update CHINHANH_1412107_1412004 set truongChiNhanh = 'CN003TR' where maCN = 'CN003';
Update CHINHANH_1412107_1412004 set truongChiNhanh = 'CN004TR' where maCN = 'CN004';
Update CHINHANH_1412107_1412004 set truongChiNhanh = 'CN005TR' where maCN = 'CN005';

--2. PHONGBAN
Insert into PHONGBAN_1412107_1412004 values ('PNS', N'Nhân S?', null, '22/May/1978', null, 'CN001');
Insert into PHONGBAN_1412107_1412004 values ('PKH', N'K? Ho?ch', null, '01/Jan/1985', null, 'CN002');
Insert into PHONGBAN_1412107_1412004 values ('PDA', N'?? Án', null, '19/Jun/1971', null, 'CN003');
Insert into PHONGBAN_1412107_1412004 values ('PKD', N'Kinh Doanh', null, '23/Jul/1972', null, 'CN004');
Insert into PHONGBAN_1412107_1412004 values ('PTT', N'Thông Tin', null, '23/Jul/1972', null, 'CN005');

--Update PHONGBAN set TRPHG
Update PHONGBAN_1412107_1412004 set TRPHG = 'NSTR' where MAPHG = 'PNS';
Update PHONGBAN_1412107_1412004 set TRPHG = 'KHTR' where MAPHG = 'PKH';
Update PHONGBAN_1412107_1412004 set TRPHG = 'DATR' where MAPHG = 'PDA';
Update PHONGBAN_1412107_1412004 set TRPHG = 'KDTR' where MAPHG = 'PKD';
Update PHONGBAN_1412107_1412004 set TRPHG = 'TTTR' where MAPHG = 'PTT';

----3. NHANVIEN
--------------1. truong duan
Insert into NHANVIEN_1412107_1412004 values ('DANS001TR', N'?inh Bá Tiên', N'119 C?ng Qu?nh, Tp HCM', '0123456789', N't@g', 'PNS', 'CN001', 30000,  'DANS001TR');
Insert into NHANVIEN_1412107_1412004 values ('DAKH001TR', N'Nguy?n Thanh Tùng', N'222 Nguy?n V?n C?, Tp HCM', '01343456789', N'tt@g', 'PKH', 'CN002', 23000,  'DAKH001TR');
Insert into NHANVIEN_1412107_1412004 values ('DADA001TR', N'Tr?n Ng?c H?ng ', N'332 Nguy?n Thái H?c, Tp HCM', '01333456789', N'nh@g', 'PDA', 'CN003', 67000,  'DADA001TR');
Insert into NHANVIEN_1412107_1412004 values ('DAKD001TR', N'Lê Qu?nh Nh?', N'291 H? V?n Huê, Tp HCM', '01333456679', N'n@g', 'PKD', 'CN004', 12000,  'DAKD001TR');
Insert into NHANVIEN_1412107_1412004 values ('DATT001TR', N'Nguy?n Minh Hùng', N'95 Bà R?a, V?ng Tàu', '01333456129', N'mh@g', 'PTT', 'CN005', 55000,  'DATT001TR');
--------------2. truong phong
Insert into NHANVIEN_1412107_1412004 values ('NSTR', N'?inh Bá Quyên', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'bq@g', 'PNS', 'CN001', 52000,  'NSTR');
Insert into NHANVIEN_1412107_1412004 values ('KHTR', N'Nguy?n Thái Vinh', N'222 Nguy?n Trãi, Tp HCM', '01673456789', N'tv@g', 'PKH', 'CN002', 41000,  'KHTR');
Insert into NHANVIEN_1412107_1412004 values ('DATR', N'Tr?n H?i Xinh', N'332 Lê Lai, Tp HCM', '06423456789', N'hx@g', 'PDA', 'CN003', 36000,  'DATR');
Insert into NHANVIEN_1412107_1412004 values ('KDTR', N'Lê H?i Tri?u', N'291 H? Hu?, Tp HCM', '0133347869', N'ht@g', 'PKD', 'CN004', 43000,  'KDTR');
Insert into NHANVIEN_1412107_1412004 values ('TTTR', N'Nguy?n Ch??ng Hoàng', N'95 Bà R?a, V?ng Tàu', '01333434529', N'ch@g', 'PTT', 'CN005', 47000,  'TTTR');
-------------3. truong chinhanh
Insert into NHANVIEN_1412107_1412004 values ('CN001TR', N'Tr?n Cao Vân', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'cv@g', 'PNS', 'CN001', 52000,  'CN001TR');
Insert into NHANVIEN_1412107_1412004 values ('CN002TR', N'Nguy?n Quy?n Linh', N'222 Nguy?n Trãi, Tp HCM', '01673456789', N'ql@g', 'PKH', 'CN002', 41000,  'CN002TR');
Insert into NHANVIEN_1412107_1412004 values ('CN003TR', N'Tr?n Vi Linh', N'332 Lê Lai, Tp HCM', '06423456789', N'vl@g', 'PDA', 'CN003', 36000,  'CN003TR');
Insert into NHANVIEN_1412107_1412004 values ('CN004TR', N'Võ Tr??ng Giang', N'291 H? Hu?, Tp HCM', '0133347869', N'tg@g', 'PKD', 'CN004', 43000,  'CN004TR');
Insert into NHANVIEN_1412107_1412004 values ('CN005TR', N'Hoàng V?n Th?nh', N'95 Bà R?a, V?ng Tàu', '01333434529', N'vt@g', 'PTT', 'CN005', 47000,  'CN005TR');
-------------4. nhanvien
Insert into NHANVIEN_1412107_1412004 values ('NS001', N'Hoàng Thái Thành', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'tt@g', 'PNS', null, 52000,  'NS001');
Insert into NHANVIEN_1412107_1412004 values ('KH001', N'Nguy?n V?n Linh', N'222 Nguy?n Trãi, Tp HCM', '01673456789', N'vl@g', 'PKH', null, 41000,  'KH001');
Insert into NHANVIEN_1412107_1412004 values ('DA001', N'Tr?n Linh', N'332 Lê Lai, Tp HCM', '06423456789', N'tl@g', 'PDA', null, 36000,  'DA001');
Insert into NHANVIEN_1412107_1412004 values ('KD001', N'Võ Tr??ng', N'291 H? Hu?, Tp HCM', '0133347869', N'vg@g', 'PKD', null, 43000,  'KD001');
Insert into NHANVIEN_1412107_1412004 values ('TT001', N'Hoàng Th?nh', N'95 Bà R?a, V?ng Tàu', '01333434529', N'ht@g', 'PTT', null, 47000,  'TT001');
--------------5. giam doc
Insert into NHANVIEN_1412107_1412004 values ('GD001', N'Hoàng Thái', N'119 Nguy?n C? Trinh, Tp HCM', '0345456789', N'tt@g', null, null, 52000,  'GD001');
Insert into NHANVIEN_1412107_1412004 values ('GD002', N'Nguy?n Xinh', N'222 Nguy?n Trãi, Tp HCM', '01673456789', N'nx@g', null, null, 41000,  'GD002');
Insert into NHANVIEN_1412107_1412004 values ('GD003', N'Tr?n Phi', N'332 Lê Lai, Tp HCM', '06423456789', N'tp@g', null, null, 36000,  'GD003');
Insert into NHANVIEN_1412107_1412004 values ('GD004', N'Võ H?i', N'291 H? Hu?, Tp HCM', '0133347869', N'vh@g', null, null, 43000,  'GD004');
Insert into NHANVIEN_1412107_1412004 values ('GD005', N'Hoàng Chí', N'95 Bà R?a, V?ng Tàu', '01333434529', N'hc@g', null, null, 47000,  'GD005');

--4. DUAN
Insert into DUAN_1412107_1412004 values ('DANS001', N'Ti?ng Anh ?i Làm', 20, 'PNS', 'DANS001TR');
Insert into DUAN_1412107_1412004 values ('DAKH001', N'Nh?t Ng? Ph? C?p', 15, 'PKH', 'DAKH001TR');
Insert into DUAN_1412107_1412004 values ('DADA001', N'Kinh Doanh Xanh', 18, 'PDA', 'DADA001TR');
Insert into DUAN_1412107_1412004 values ('DAKD001', N'Th?i Trang Tr?', 40, 'PKD', 'DAKD001TR');
Insert into DUAN_1412107_1412004 values ('DATT001', N'NLP ?? Thành Công', 50, 'PTT', 'DATT001TR');

--5. CHITIEU
Insert into CHITIEU_1412107_1412004 values ('CTDANS001001', N'??t chu?n ti?ng anh giao ti?p công s?', 20, 'DANS001');
Insert into CHITIEU_1412107_1412004 values ('CTDAKH001001', N'??t chu?n ti?ng nh?t giao ti?p công s?', 30, 'DAKH001');
Insert into CHITIEU_1412107_1412004 values ('CTDADA001001', N'??t chu?n kinh doanh thân thi?n môi tr??ng', 30, 'DADA001');
Insert into CHITIEU_1412107_1412004 values ('CTDAKD001001', N'Nhân viên toàn công ty có gu th?i trang tr? trung', 30, 'DAKD001');
Insert into CHITIEU_1412107_1412004 values ('CTDATT001001', N'NLP ?? hi?u qu? nh?t có th? trong công vi?c', 30, 'DATT001');

--6. PHANCONG
--truong du an
Insert into PHANCONG_1412107_1412004 values ('DANS001TR', 'DANS001', N'tr??ng', 50);
Insert into PHANCONG_1412107_1412004 values ('DAKH001TR', 'DAKH001', N'tr??ng', 50);
Insert into PHANCONG_1412107_1412004 values ('DADA001TR', 'DADA001', N'tr??ng', 50);
Insert into PHANCONG_1412107_1412004 values ('DAKD001TR', 'DAKD001', N'tr??ng', 50);
Insert into PHANCONG_1412107_1412004 values ('DATT001TR', 'DATT001', N'tr??ng', 50);
--thanh vien du an
Insert into PHANCONG_1412107_1412004 values ('NS001', 'DANS001', N'thành viên', 40);
Insert into PHANCONG_1412107_1412004 values ('KH001', 'DAKH001', N'thành viên', 40);
Insert into PHANCONG_1412107_1412004 values ('DA001', 'DADA001', N'thành viên', 40);
Insert into PHANCONG_1412107_1412004 values ('KD001', 'DAKD001', N'thành viên', 40);
Insert into PHANCONG_1412107_1412004 values ('TT001', 'DATT001', N'thành viên', 40);

