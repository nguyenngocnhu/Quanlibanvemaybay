USE [master]
GO

CREATE DATABASE [QuanlyBanVe]
GO
USE [QuanlyBanVe]
GO

CREATE TABLE [dbo].[CCHUYENBAY](
	[MACHUYENBAY] [nvarchar](50) NOT NULL,
	[SANBAYDI] [nvarchar](50) NULL,
	[SANBAYDEN] [nvarchar](50) NULL,
	[NGAYGIO] [date] NULL,
	[THOIGIANBAY] [int] NULL,
	[SOLUONGGHEHANG1] [int] NULL,
	[SOLUONGGHEHANG2] [int] NULL,
	CONSTRAINT PK_CHUYENBAY PRIMARY KEY ([MACHUYENBAY])
)
GO

CREATE TABLE [dbo].[DATCHO](
	[MAPHIEU] [nvarchar](50) NOT NULL,
	[MAKH] [nvarchar](50) NULL,
	[MACHUYENBAY] [nvarchar](50) NULL,
	[MATUYENBAY] [nvarchar](50) NULL,
	[MAHANGVE] [nvarchar](10) NULL,
	[SOGHEDAT] [int] NULL,
	[NGAYDAT] [date] NULL,
	[GIATIEN] [int] NULL,
	CONSTRAINT PK_DATCHO PRIMARY KEY ([MAPHIEU]) 
)
GO

CREATE TABLE [dbo].[HANGVE](
	[mahangve] [nvarchar](10) NOT NULL,
	[tenhangve] [nvarchar](50) NULL,
	CONSTRAINT PK_HANGVE PRIMARY KEY ([mahangve])
)
GO

CREATE TABLE [dbo].[KKHACHHANG](
	[MAKH] [nvarchar](50) NOT NULL,
	[CMND] [nvarchar](50) NULL,
	[TENKH] [nvarchar](50) NULL,
	[DIENTHOAI] [nvarchar](50) NULL,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY ([MAKH])
)
GO

CREATE TABLE [dbo].[NHANVIEN](
	[manv] [nvarchar](10) NOT NULL,
	[tennv] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](12) NULL,
	[diachi] [nvarchar](255) NULL,
	[matkhau] [nvarchar](50) NULL,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY ([manv])
)
GO

CREATE TABLE [dbo].[SANBAY](
	[masanbay] [nvarchar](10) NOT NULL,
	[tensanbay] [nvarchar](255) NULL,
	CONSTRAINT PK_SANBAY PRIMARY KEY ([masanbay])
)
GO

CREATE TABLE [dbo].[TTHAMSO](
	[ThoiGianBayToiThieu] [nvarchar](50) NULL,
	[SoSanBayTrungGianToiDa] [nvarchar](50) NULL,
	[ThoiGianDungToiThieu] [nvarchar](50) NULL,
	[ThoiGianDungToiDa] [nvarchar](50) NULL,
	[TGChamNhatDatVe] [nvarchar](50) NULL,
	[TGChamNhatHuyDatVe] [nvarchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TUYENBAY](
	[matuyenbay] [nvarchar](50) NOT NULL,
	[masanbaydi] [nvarchar](10) NULL,
	[masanbayden] [nvarchar](10) NULL,
	CONSTRAINT PK_TUYENBAY PRIMARY KEY ([matuyenbay])
)
GO

ALTER TABLE [dbo].[DATCHO] ADD
	CONSTRAINT FK_DCMACHUYENBAY FOREIGN KEY ([MACHUYENBAY]) REFERENCES [dbo].[CCHUYENBAY] (MACHUYENBAY),
	CONSTRAINT FK_DCMAKHACHHANG FOREIGN KEY ([MAKH]) REFERENCES [dbo].[KKHACHHANG] (MAKH),
	CONSTRAINT FK_DCMATUYENBAY FOREIGN KEY ([MATUYENBAY]) REFERENCES [dbo].[TUYENBAY] (matuyenbay),
	CONSTRAINT FK_DCMAHANGVE FOREIGN KEY ([MAHANGVE]) REFERENCES [dbo].[HANGVE] (MAHANGVE)
GO

ALTER TABLE [dbo].[TUYENBAY] ADD
	CONSTRAINT FK_TBMASANBAYDI FOREIGN KEY ([MASANBAYDI]) REFERENCES [dbo].[SANBAY] (MASANBAY),
	CONSTRAINT FK_TBMASANBAYDEN FOREIGN KEY ([MASANBAYDEN]) REFERENCES [dbo].[SANBAY] (MASANBAY)
GO

INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'QH214', N'Nội Bài', N'Cần Thơ', CAST(N'2020-07-08' AS Date), 1, 55, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'QH290', N'Đà Nẵng', N'Pleiku', CAST(N'2020-11-06' AS Date), 3, 55, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VJ260', N'Điện Biên Phủ', N'Thọ Xuân', CAST(N'2020-01-01' AS Date), 1, 50, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VNA1336', N'Tân Sơn Nhất', N'Đồng Hới', CAST(N'2020-11-12' AS Date), 2, 50, 60)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VNA2001', N'Thọ Xuân', N'Cà Mau', CAST(N'2020-04-19' AS Date), 4, 55, 65)
GO
INSERT [dbo].[HANGVE] ([mahangve], [tenhangve]) VALUES (N'HANG1', N'Vé hạng 1')
INSERT [dbo].[HANGVE] ([mahangve], [tenhangve]) VALUES (N'HANG2', N'Vé hạng 2')
GO
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'1', N'11111', N'lê hồng quân', N'1111')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'abcxyz', N'044301001666', N'Phạm Thị Trang Thu', N'0372024845')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'avab', N'044301001444', N'Nguyễn Văn A', N'0372024843')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'kien123', N'044301001222', N'Nguyễn Phạm Trung Kiên', N'0372024841')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'maihoa116', N'044301001333', N'Nguyễn Thị Mai Hoa', N'0372024842')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'maybay', N'044301001555', N'Nguyễn Văn B', N'0372024844')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'thu456', N'044301001666', N'Nguyễn Văn C', N'0372024845')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'trangthu123', N'044301001305', N'Phạm Thị Trang Thu', N'0372024840')
GO
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'admin', N'admin', N'0399087024', N'86/40 Âu Cơ', N'0x21232F297A57A5A743894A0E4A801FC3') 
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'nthau', N'Nguyễn Trọng Hậu', N'0913717808', N'351A Lạc Long Quân', N'0xE10ADC3949BA59ABBE56E057F20F883E')
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'nhuy', N'Nguyễn Ngọc Như Ý', N'0365815001', N'10 Trần Thiện Chánh', N'0x8E8FE632000E47E05EEF419BE7762A3D')
GO
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'BMV', N'Buôn Ma Thuột')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'CAH', N'Cà Mau')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'CXR', N'Cam Ranh')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DAD ', N'Đà Nẵng')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DIN', N'Điện Biên Phủ')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DLI', N'Liên Khương')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HAN', N'Nội Bài')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HPH', N'Cát Bi')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HUI', N'Phú Bài')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'PQC', N'Phú Quốc')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'PXU', N'Pleiku')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'SGN', N'Tân Sơn Nhất')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'TBB', N'Tuy Hòa')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'THD', N'Thọ Xuân')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'UIH', N'Phù Cát')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCA', N'Cần Thơ')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCL', N'Chu Lai')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCS', N'Côn Đảo')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VDH', N'Đồng Hới')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VDO', N'Vân Đồn')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VII', N'Vinh')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VKG', N'Rạch Giá')
GO
INSERT [dbo].[TTHAMSO] ([ThoiGianBayToiThieu], [SoSanBayTrungGianToiDa], [ThoiGianDungToiThieu], [ThoiGianDungToiDa], [TGChamNhatDatVe], [TGChamNhatHuyDatVe]) VALUES (N'1 giờ', N'2', N'0.5 giờ', N'2 giờ', N'Trước 1 ngày', N'Trước 2 ngày')
GO
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DAD -PXU', N'DAD ', N'PXU')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-DAD ', N'DIN', N'DAD ')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-THD', N'DIN', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-VCL', N'DIN', N'VCL')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DLI-DIN', N'DLI', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HAN-VCA', N'HAN', N'VCA')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HPH-HUI', N'HPH', N'HUI')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HPH-THD', N'HPH', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'PQC-VCL', N'PQC', N'VCL')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'PXU-DIN', N'PXU', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-BMV', N'SGN', N'BMV')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-HAN', N'SGN', N'HAN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-PQC', N'SGN', N'PQC')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-VCA', N'SGN', N'VCA')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-VDH', N'SGN', N'VDH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'TBB-DIN', N'TBB', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'TBB-VCS', N'TBB', N'VCS')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'THD-CAH', N'THD', N'CAH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-DIN', N'VCA', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-HPH', N'VCA', N'HPH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-VDH', N'VCA', N'VDH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDH-THD', N'VDH', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDO-CXR', N'VDO', N'CXR')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDO-DAD ', N'VDO', N'DAD ')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VII-CXR', N'VII', N'CXR')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VKG-DLI', N'VKG', N'DLI')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VKG-VII', N'VKG', N'VII')
GO
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'001', N'kien123', N'QH290', N'SGN-VDH', N'HANG1', 4, CAST(N'2020-12-10' AS Date), 4480808)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'002', N'trangthu123', N'VNA2001', N'HAN-VCA', N'HANG1', 3, CAST(N'2020-12-10' AS Date), 4155000)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'003', N'maihoa116', N'VJ260', N'DAD -PXU', N'HANG2', 1, CAST(N'2020-12-10' AS Date), 1300000)
GO