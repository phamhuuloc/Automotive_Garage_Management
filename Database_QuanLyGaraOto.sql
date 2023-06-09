USE [master]
GO
/****** Object:  Database [GaraOtoTemp]    Script Date: 6/30/2023 10:30:44 AM ******/
CREATE DATABASE [GaraOtoTemp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GaraOtoTemp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GaraOtoTemp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GaraOtoTemp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GaraOtoTemp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GaraOtoTemp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GaraOtoTemp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GaraOtoTemp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET ARITHABORT OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GaraOtoTemp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GaraOtoTemp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GaraOtoTemp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GaraOtoTemp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET RECOVERY FULL 
GO
ALTER DATABASE [GaraOtoTemp] SET  MULTI_USER 
GO
ALTER DATABASE [GaraOtoTemp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GaraOtoTemp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GaraOtoTemp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GaraOtoTemp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GaraOtoTemp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GaraOtoTemp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GaraOtoTemp', N'ON'
GO
ALTER DATABASE [GaraOtoTemp] SET QUERY_STORE = OFF
GO
USE [GaraOtoTemp]
GO
/****** Object:  Table [dbo].[BaoCaoThang]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoThang](
	[id] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[DoanhThu] [money] NULL,
	[NgayLap] [date] NULL,
	[TenNguoiLapBaoCao] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoTon]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoTon](
	[id] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[NgayLap] [date] NULL,
	[TenNguoiLapBaoCao] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoTonChiTiet]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoTonChiTiet](
	[id] [int] NOT NULL,
	[MaVTPT] [int] NOT NULL,
	[MaBaoCaoTon] [int] NOT NULL,
	[TonDau] [int] NULL,
	[PhatSinh] [int] NULL,
	[TonCuoi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietBaoCaoThang]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietBaoCaoThang](
	[id] [int] NOT NULL,
	[MaBaoCao] [int] NOT NULL,
	[MaHangXe] [int] NOT NULL,
	[SoLuotSua] [int] NOT NULL,
	[TongTien] [money] NULL,
	[TiLe] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietChucVu]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietChucVu](
	[id] [int] NOT NULL,
	[MaChucVu] [int] NOT NULL,
	[MaQuyenHan] [int] NOT NULL,
	[ChoPhep] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[id] [int] NOT NULL,
	[TenChucVu] [nvarchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuXe]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuXe](
	[id] [int] NOT NULL,
	[TenChuXe] [nvarchar](max) NULL,
	[DiaChiCX] [nvarchar](max) NULL,
	[SDT] [varchar](50) NULL,
	[Email] [varchar](320) NULL,
	[CMND] [varchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangXe]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangXe](
	[id] [int] NOT NULL,
	[TenHX] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[id] [int] NOT NULL,
	[TenNCC] [nvarchar](max) NULL,
	[SDT] [varchar](20) NULL,
	[DiaChiNhaCungCap] [nvarchar](max) NULL,
	[HotenNDD] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] NOT NULL,
	[MaTTNV] [int] NOT NULL,
	[MaChucVu] [int] NOT NULL,
	[TenTaiKhoan] [varchar](250) NULL,
	[MatKhau] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[NgayLapPhieuNhap] [date] NULL,
	[TenNhaCungCap] [nvarchar](max) NULL,
	[TongTienNhapHang] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapCT]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapCT](
	[id] [int] NOT NULL,
	[MaVTPT] [int] NOT NULL,
	[MaPN] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuSuaCT]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuSuaCT](
	[id] [int] NOT NULL,
	[MaPSX] [int] NOT NULL,
	[MaTienCong] [int] NOT NULL,
	[MaVTPT] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DonGia] [money] NULL,
	[TienCong] [money] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuSuaXe]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuSuaXe](
	[id] [int] NOT NULL,
	[MaTN] [int] NOT NULL,
	[NgaySua] [date] NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[id] [int] NOT NULL,
	[MaPhieuTN] [int] NOT NULL,
	[NgayNhan] [date] NULL,
	[SDT] [varchar](50) NULL,
	[Email] [varchar](320) NULL,
	[SoTienThu] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuTiepNhan]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTiepNhan](
	[id] [int] NOT NULL,
	[MaChuXe] [int] NOT NULL,
	[MaHangXe] [int] NOT NULL,
	[BienSoXe] [varchar](320) NULL,
	[NgayTiepNhan] [date] NULL,
	[TienNo] [money] NULL,
	[Ghichu] [text] NULL,
	[HanGiaoXe] [date] NULL,
	[status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuTung]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuTung](
	[id] [int] NOT NULL,
	[TenVTPT] [nvarchar](max) NULL,
	[DVT] [nvarchar](50) NULL,
	[DonGiaThamKhao] [money] NULL,
	[SoLuongVatTu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenHan]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenHan](
	[id] [int] NOT NULL,
	[TenQuyenHan] [nvarchar](320) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThamSo]    Script Date: 6/30/2023 10:30:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamSo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SoLuongXeToiDa] [int] NULL,
	[PhanTramTienLoiCuaSanPham] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinNhanVien]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinNhanVien](
	[id] [int] NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[GioiTinh] [bit] NULL,
	[CMND] [varchar](320) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TienCong]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TienCong](
	[id] [int] NOT NULL,
	[LoaiTienCong] [nvarchar](max) NULL,
	[GiaTriTienCong] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaoCaoThang] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[BaoCaoTon] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT (getdate()) FOR [NgayLapPhieuNhap]
GO
ALTER TABLE [dbo].[PhieuThu] ADD  DEFAULT (getdate()) FOR [NgayNhan]
GO
ALTER TABLE [dbo].[PhieuTiepNhan] ADD  DEFAULT (getdate()) FOR [NgayTiepNhan]
GO
ALTER TABLE [dbo].[ThamSo] ADD  DEFAULT ((30)) FOR [SoLuongXeToiDa]
GO
ALTER TABLE [dbo].[BaoCaoThang]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[ChiTietBaoCaoThang]  WITH CHECK ADD FOREIGN KEY([MaBaoCao])
REFERENCES [dbo].[BaoCaoThang] ([id])
GO
ALTER TABLE [dbo].[ChiTietBaoCaoThang]  WITH CHECK ADD FOREIGN KEY([MaHangXe])
REFERENCES [dbo].[HangXe] ([id])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([id])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaTTNV])
REFERENCES [dbo].[ThongTinNhanVien] ([id])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([id])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[PhieuNhapCT]  WITH CHECK ADD FOREIGN KEY([MaVTPT])
REFERENCES [dbo].[PhuTung] ([id])
GO
ALTER TABLE [dbo].[PhieuNhapCT]  WITH CHECK ADD FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[PhieuSuaCT]  WITH CHECK ADD FOREIGN KEY([MaPSX])
REFERENCES [dbo].[PhieuSuaXe] ([id])
GO
ALTER TABLE [dbo].[PhieuSuaCT]  WITH CHECK ADD FOREIGN KEY([MaTienCong])
REFERENCES [dbo].[TienCong] ([id])
GO
ALTER TABLE [dbo].[PhieuSuaCT]  WITH CHECK ADD FOREIGN KEY([MaVTPT])
REFERENCES [dbo].[PhuTung] ([id])
GO
ALTER TABLE [dbo].[PhieuSuaXe]  WITH CHECK ADD FOREIGN KEY([MaTN])
REFERENCES [dbo].[PhieuTiepNhan] ([id])
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD FOREIGN KEY([MaPhieuTN])
REFERENCES [dbo].[PhieuTiepNhan] ([id])
GO
ALTER TABLE [dbo].[PhieuTiepNhan]  WITH CHECK ADD FOREIGN KEY([MaChuXe])
REFERENCES [dbo].[ChuXe] ([id])
GO
ALTER TABLE [dbo].[PhieuTiepNhan]  WITH CHECK ADD FOREIGN KEY([MaHangXe])
REFERENCES [dbo].[HangXe] ([id])
GO
/****** Object:  StoredProcedure [dbo].[CalculateClosingInventory]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateClosingInventory](@end_date DATE)
AS
BEGIN
   SELECT PT.id, PT.TenVTPT, 
          COALESCE(SUM(PNCT.SoLuong), 0) - COALESCE(SUM(PSCt.SoLuong), 0) AS closing_inventory
   FROM PhuTung PT
   LEFT JOIN (
      SELECT PNCT.MaVTPT, SUM(PNCT.SoLuong) AS SoLuong
      FROM PhieuNhapCT PNCT
      JOIN PhieuNhap PN ON PNCT.id = PN.MaPN
      WHERE PN.NgayLapPhieuNhap <= @end_date
      GROUP BY PNCT.MaVTPT
   ) PNCT ON PT.id = PNCT.MaVTPT
   LEFT JOIN (
      SELECT PSCt.MaVTPT, SUM(PSCt.SoLuong) AS SoLuong
      FROM PhieuSuaCT PSCt
      JOIN PhieuSuaXe PSX ON PSCt.id = PSX.id
      WHERE PSX.NgaySua <= @end_date
      GROUP BY PSCt.MaVTPT
   ) PSCt ON PT.id = PSCt.MaVTPT
   GROUP BY PT.id, PT.TenVTPT;
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateOpeningInventory]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateOpeningInventory](@start_date DATE)
AS
BEGIN
   SELECT PT.id, PT.TenVTPT, 
          COALESCE(SUM(PNCT.SoLuong), 0) - COALESCE(SUM(PSCt.SoLuong), 0) AS opening_inventory
   FROM PhuTung PT
   LEFT JOIN (
      SELECT PNCT.MaVTPT, SUM(PNCT.SoLuong) AS SoLuong
      FROM PhieuNhapCT PNCT
      JOIN PhieuNhap PN ON PNCT.id = PN.MaPN
      WHERE PN.NgayLapPhieuNhap < @start_date
      GROUP BY PNCT.MaVTPT
   ) PNCT ON PT.id = PNCT.MaVTPT
   LEFT JOIN (
      SELECT PSCt.MaVTPT, SUM(PSCt.SoLuong) AS SoLuong
      FROM PhieuSuaCT PSCt
      JOIN PhieuSuaXe PSX ON PSCt.id = PSX.id
      WHERE PSX.NgaySua < @start_date
      GROUP BY PSCt.MaVTPT
   ) PSCt ON PT.id = PSCt.MaVTPT
   GROUP BY PT.id, PT.TenVTPT;
END
GO
/****** Object:  StoredProcedure [dbo].[CombineResults]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CombineResults](@start_date DATE, @end_date DATE)
AS
BEGIN
    SELECT PT.id, PT.TenVTPT, ISNULL(PS.SoLuongPhatSinh, 0) AS SoLuongPhatSinh,
           ISNULL(COI.opening_inventory, 0) AS opening_inventory,
           ISNULL(CCI.closing_inventory, 0) AS closing_inventory
    FROM PhuTung PT
    LEFT JOIN (
       SELECT PT.id, COUNT(PSCT.MaVTPT) AS SoLuongPhatSinh
       FROM PhuTung PT
       LEFT JOIN PhieuSuaCT PSCT ON PT.id = PSCT.MaVTPT
       LEFT JOIN PhieuSuaXe PSX ON PSCT.MaPSX = PSX.id
       WHERE PSX.NgaySua BETWEEN @start_date AND @end_date
       GROUP BY PT.id
    ) PS ON PT.id = PS.id
    LEFT JOIN (
       SELECT PT.id, 
              COALESCE(SUM(PNCT.SoLuong), 0) - COALESCE(SUM(PSCt.SoLuong), 0) AS opening_inventory
       FROM PhuTung PT
       LEFT JOIN (
          SELECT PNCT.MaVTPT, SUM(PNCT.SoLuong) AS SoLuong
          FROM PhieuNhapCT PNCT
          JOIN PhieuNhap PN ON PNCT.id = PN.MaPN
          WHERE PN.NgayLapPhieuNhap < @start_date
          GROUP BY PNCT.MaVTPT
       ) PNCT ON PT.id = PNCT.MaVTPT
       LEFT JOIN (
          SELECT PSCt.MaVTPT, SUM(PSCt.SoLuong) AS SoLuong
          FROM PhieuSuaCT PSCt
          JOIN PhieuSuaXe PSX ON PSCt.id = PSX.id
          WHERE PSX.NgaySua < @start_date
          GROUP BY PSCt.MaVTPT
       ) PSCt ON PT.id = PSCt.MaVTPT
       GROUP BY PT.id
    ) COI ON PT.id = COI.id
    LEFT JOIN (
       SELECT PT.id, 
              COALESCE(SUM(PNCT.SoLuong), 0) - COALESCE(SUM(PSCt.SoLuong), 0) AS closing_inventory
       FROM PhuTung PT
       LEFT JOIN (
          SELECT PNCT.MaVTPT, SUM(PNCT.SoLuong) AS SoLuong
          FROM PhieuNhapCT PNCT
          JOIN PhieuNhap PN ON PNCT.id = PN.MaPN
          WHERE PN.NgayLapPhieuNhap <= @end_date
          GROUP BY PNCT.MaVTPT
       ) PNCT ON PT.id = PNCT.MaVTPT
       LEFT JOIN (
          SELECT PSCt.MaVTPT, SUM(PSCt.SoLuong) AS SoLuong
          FROM PhieuSuaCT PSCt
          JOIN PhieuSuaXe PSX ON PSCt.id = PSX.id
          WHERE PSX.NgaySua <= @end_date
          GROUP BY PSCt.MaVTPT
       ) PSCt ON PT.id = PSCt.MaVTPT
       GROUP BY PT.id
    ) CCI ON PT.id = CCI.id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_check_TonTai_PhieuNH]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_check_TonTai_PhieuNH] ( @MaPhieuTN  int)
as
begin
	select PhieuSuaXe.id from   PhieuSuaXe  join  PhieuTiepNhan on  PhieuSuaXe.MaTN = PhieuTiepNhan.id  where PhieuTiepNhan.id = @MaPhieuTN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_TonTai_PhieuSX]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_check_TonTai_PhieuSX] ( @MaPhieuTN  int)
as
begin
	select PhieuSuaXe.id from   PhieuSuaXe  join  PhieuTiepNhan on  PhieuSuaXe.MaTN = PhieuTiepNhan.id  where PhieuTiepNhan.id = @MaPhieuTN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_create_car_brand]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_create_car_brand] (
	@TenHX varchar(250)
	)
as
begin
	if not exists ( select * from HangXe where TenHX =  @TenHX ) 
		begin 
			declare @MaHX int;
			set @MaHX = 1;
			while  exists ( select id from HangXe where id = @MaHX)
				set @MaHX = @MaHX + 1
				 insert into  HangXe( id , TenHX ) 
											values (@MaHX , @TenHX)
		end
	else
		begin
		  raiserror ( 'Đã tồn tại tên  hãng xe trong cơ sở dữ liệu!', 16,1)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_create_stuffs]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_create_stuffs] ( 
	@TenVTPT nvarchar(max),
	@DVT nvarchar(50),
	@DonGia money
)
as
begin
	if not exists ( select * from PhuTung where TenVTPT =  @TenVTPT ) 
		begin 
			declare @MaVTPT int;
			set @MaVTPT = 1;
			while  exists ( select id from PhuTung where id = @MaVTPT)
				set @MaVTPT = @MaVTPT + 1
				 insert into  PhuTung( id, TenVTPT, DVT, DonGiaThamKhao, SoLuongVatTu) 
											values ( @MaVTPT, @TenVTPT , @DVT, @DonGia , 0)
		end
	else
		begin
		  raiserror ( 'Đã tồn tại VTPT trong cơ sở dữ liệu!', 16,1)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_create_suppliers]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_create_suppliers] ( 
	@TenNCC nvarchar(max),
	@SDT varchar(20),
	@DiaChiNhaCungCap nvarchar(max),
	@HoTenNDD nvarchar(max)
)
as
begin
	if not exists ( select * from NhaCungCap where TenNCC =  @TenNCC ) 
		begin 
			declare @MaNCC int;
			set @MaNCC = 1;
			while  exists ( select id from NhaCungCap where id = @MaNCC)
				set @MaNCC = @MaNCC + 1
				 insert into  NhaCungCap( id , TenNCC , SDT, DiaChiNhaCungCap , HotenNDD) 
											values ( @MaNCC,@TenNCC , @SDT, @DiaChiNhaCungCap , @HoTenNDD)
		end
	else
		begin
		  raiserror ( 'Đã tồn tại tên nhà cung cấp trong cơ sở dữ liệu!', 16,1)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_create_wage]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_create_wage] ( 
	@LoaiTienCong nvarchar(max),
	@GiaTriTienCong money

)
as
begin
	if not exists ( select * from TienCong where LoaiTienCong =  @LoaiTienCong ) 
		begin 
			declare @MaLoaiTienCong int;
			set @MaLoaiTienCong = 1;
			while  exists ( select id from TienCong where id = @MaLoaiTienCong)
				set @MaLoaiTienCong = @MaLoaiTienCong + 1
				 insert into  TienCong( id , LoaiTienCong,GiaTriTienCong) 
											values ( @MaLoaiTienCong,@LoaiTienCong,@GiaTriTienCong)
		end
	else
		begin
		  raiserror ( 'Đã tồn tại loại tiền công trong cơ sở dữ liệu!', 16,1)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_car_brand]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_delete_car_brand] (@id  int )
as
begin 
	delete from HangXe where [id] = @id
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_prodcut_in_import]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_prodcut_in_import] ( @MaPN int)
as
begin
	delete from   PhieuNhapCT where  MaPN = @MaPN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_prodcut_in_repair]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delete_prodcut_in_repair] ( @MaSP int)
as
begin
	delete from   PhieuSuaCT where  id = @MaSP
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_staff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_staff] (@MaTTNV  int )
as
begin 
	delete from NhanVien where [MaTTNV] = @MaTTNV
	delete from ThongTinNhanVien where id =@MaTTNV
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_stuff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_delete_stuff] (@id  int )
as
begin 
	delete from PhuTung where [id] = @id
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_supplier]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_delete_supplier] (@id  int )
as
begin 
	delete from NhaCungCap where [id] = @id
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_wage]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_delete_wage] (@id  int )
as
begin 
	delete from TienCong where [id] = @id
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_find_CarBrand]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_CarBrand] ( @TenHX  varchar(250))
as
begin 
	select * from HangXe where  TenHX  LIKE '%' + @TenHX + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_staff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_find_staff] ( @TenTaiKhoan  varchar(250))
as
begin 
select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
	where N.TenTaiKhoan   LIKE '%' + @TenTaiKhoan + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_stuff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_stuff] ( @TenVTPT  varchar(250))
as
begin 
	select * from PhuTung where  TenVTPT  LIKE '%' + @TenVTPT + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_supplier]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_supplier] ( @TenNCC  varchar(250))
as
begin 
	select * from NhaCungCap where  TenNCC  LIKE '%' + @TenNCC + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_find_wageType]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_find_wageType] ( @LoaiTienCong  varchar(250))
as
begin 
	select * from TienCong where  LoaiTienCong  LIKE '%' + @LoaiTienCong + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_infor_login]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_infor_login]  
as 
begin
		select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_staff_ByID]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_staff_ByID] ( @MaTTNV  int)
as
begin 
select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
	where n.MaTTNV = @MaTTNV
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_carBrand]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAll_carBrand] 
as
begin
	select * from HangXe
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Import]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAll_Import] 
as
begin
	select * from PhieuNhap
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getall_parameter]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure  [dbo].[sp_getall_parameter]   
as
begin
	select * from ThamSo
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_receptions]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	 [dbo].[sp_getAll_receptions]
as
begin
	  select ChuXe.* , PhieuTiepNhan.id as MaTN ,PhieuTiepNhan.MaChuXe , PhieuTiepNhan.MaHangXe,
	  PhieuTiepNhan.BienSoXe , PhieuTiepNhan.NgayTiepNhan , PhieuTiepNhan.TienNo , PhieuTiepNhan.Ghichu,PhieuTiepNhan.HanGiaoXe, PhieuTiepNhan.[status]
	  from PhieuTiepNhan inner join  ChuXe    on PhieuTiepNhan.MaChuXe = ChuXe.id ORDER BY
	  ChuXe.TenChuXe ASC;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Staff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAll_Staff]
as
begin
	select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_stuff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAll_stuff] 
as
begin
	select * from PhuTung
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_supplier]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAll_supplier] 
as
begin
	select * from NhaCungCap
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_wageType]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAll_wageType] 
as
begin
	select * from TienCong
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getInfo_import_details]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getInfo_import_details]  ( @MaPN int)
as
begin
	select  PhieuNhapCT.MaPN,  PhuTung.TenVTPT,  PhuTung.DVT, PhieuNhapCT.DonGia, PhieuNhapCT.SoLuong,PhieuNhapCT.TongTien
	from PhuTung inner join PhieuNhapCT 
	on PhuTung.id = PhieuNhapCT.MaVTPT 
	inner join PhieuNhap
	on  PhieuNhapCT.MaPN = PhieuNhap.MaPN
	where  PhieuNhap.MaPN =  @MaPN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getInfo_receipt]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_getInfo_receipt] ( @MaCX int)
as
begin
	select ChuXe.TenChuXe,PhieuTiepNhan.BienSoXe,Chuxe.DiaChiCX,chuxe.SDT,PhieuThu.NgayNhan,PhieuSuaXe.TongTien,PhieuThu.SoTienThu from  PhieuThu inner join PhieuTiepNhan 
	on PhieuThu.MaPhieuTN = PhieuTiepNhan.id
	inner join  ChuXe  on PhieuTiepNhan.MaChuXe = ChuXe.id
	inner join PhieuSuaXe on PhieuTiepNhan.id = PhieuSuaXe.id
	where PhieuTiepNhan.MaChuXe = @MaCX
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getInfo_reception]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getInfo_reception]  ( @CMND varchar(320))
as
begin
	select ChuXe.* ,  PhieuTiepNhan.BienSoXe
	from ChuXe inner join  PhieuTiepNhan 
	on ChuXe.id = PhieuTiepNhan.MaChuXe 
	where ChuXe.CMND = @CMND
end	
GO
/****** Object:  StoredProcedure [dbo].[sp_getInfo_repair_details]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getInfo_repair_details]  ( @MaTN int)
as
begin
	select  PhieuSuaCT.id,  PhuTung.TenVTPT,  PhuTung.DVT , PhieuSuaCT.NoiDung,PhieuSuaCT.DonGia,PhieuSuaCT.TienCong,PhieuSuaCT.SoLuong,PhieuSuaCT.TongTien
	from PhuTung inner join PhieuSuaCT 
	on PhuTung.id = PhieuSuaCT.MaVTPT 
	inner join PhieuSuaXe 
	on  PhieuSuaCT.MaPSX = PhieuSuaXe.id
	inner join  PhieuTiepNhan on PhieuTiepNhan.id = PhieuSuaXe.MaTN
	where  PhieuTiepNhan.id =  @MaTN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getRepairByMonth]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Thong ke doanh thu theo tháng
CREATE PROCEDURE [dbo].[sp_getRepairByMonth]
	@month int
AS
BEGIN
   SELECT HX.TenHX, MONTH(PSX.NgaySua) AS 'Month', 
      COUNT(HX.TenHX) AS 'Count', SUM(PSX.TongTien) as 'TongTien', 
      COUNT(HX.TenHX) * 1000 / (SELECT COUNT(*) FROM HangXe WHERE MONTH(NgaySua) = @month) AS 'Ratio'
   FROM PhieuSuaXe PSX INNER JOIN 
   PhieuTiepNhan PTN ON PSX.MaTN = PTN.id INNER JOIN 
   HangXe HX ON PTN.MaHangXe = HX.id 
   WHERE MONTH(PSX.NgaySua) = @month
   GROUP BY HX.TenHX, MONTH(PSX.NgaySua);
END;
exec sp_getRepairByMonth 6
GO
/****** Object:  StoredProcedure [dbo].[sp_getSumCustomer]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getSumCustomer] 
AS
BEGIN
    SELECT COUNT(*) AS 'All Days', COUNT(CASE WHEN CONVERT(date, NgaySua) = CONVERT(date, GETDATE()) THEN 1 END) AS 'Today' 
    FROM PhieuSuaXe;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getSumReceipt]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Thong ke so phieu tiep nhan
CREATE PROCEDURE [dbo].[sp_getSumReceipt]
AS
BEGIN
    SELECT COUNT(*) AS 'All Days', COUNT(CASE WHEN CONVERT(date, NgayTiepNhan) = CONVERT(date, GETDATE()) THEN 1 END) AS 'Today' 
    FROM PhieuTiepNhan;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getSumTurnover]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thong ke doanh thu
CREATE PROCEDURE [dbo].[sp_getSumTurnover]
AS
BEGIN
    SELECT SUM(TongTien) AS 'All Days', SUM(CASE WHEN CONVERT(date, NgaySua) = CONVERT(date, GETDATE()) THEN TongTien END) AS 'Today' 
    FROM PhieuSuaXe;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_import]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----Lập phiếu nhập 
--use GaraOto
CREATE PROCEDURE [dbo].[sp_insert_import] (
	@MaNV int,
	@MaNCC int,
	@NgayLapPhieuNhap date,
	@TenNhaCungCap nvarchar(max),
    @TongTienNhapHang money
)
as
begin
declare @MaPhieuNhap  int;

	set @MaPhieuNhap  = 1;
	while exists ( select MaPN from PhieuNhap where MaPN = @MaPhieuNhap)
		set @MaPhieuNhap = @MaPhieuNhap + 1
		insert into PhieuNhap(MaPN, MaNV, MaNCC, NgayLapPhieuNhap, TenNhaCungCap, TongTienNhapHang)
			values ( @MaPhieuNhap , @MaNV, @MaNCC, @NgayLapPhieuNhap, @TenNhaCungCap, @TongTienNhapHang)
		SELECT @MaPhieuNhap AS NewPrimaryKey
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_import_details]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_import_details] (
	@MaPN int,	
	@MaVTPT int,
	@SoLuong int,
	@DonGia money
)
as
begin
	-- Kiểm tra xem sản phẩm đã tồn tại trong bảng chi tiết hóa đơn hay chưa
		declare @MaPhieuNhapCT  int ;
		set @MaPhieuNhapCT  = 1;
		while exists ( select id from PhieuNhapCT where id = @MaPhieuNhapCT)
			set @MaPhieuNhapCT = @MaPhieuNhapCT + 1
    IF EXISTS (SELECT 1 FROM PhieuNhapCT WHERE MaPN = @MaPN AND MaVTPT = @MaVTPT)
    BEGIN
        -- Tăng số lượng sản phẩm và tính lại tổng tiền chi tiết
        UPDATE PhieuNhapCT
        SET SoLuong = SoLuong + @SoLuong,
            TongTien = (SoLuong + @SoLuong) * @DonGia
        WHERE MaPN = @MaPN AND MaVTPT = @MaVTPT;
    END
    ELSE
			insert into PhieuNhapCT (id, MaVTPT, MaPN, SoLuong , DonGia)
										values ( @MaPhieuNhapCT, @MaVTPT, @MaPN , @SoLuong , @DonGia)	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_receipt]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_insert_receipt] (
	@MaPhieuTN int,
	@SDT varchar(50),
	@Email varchar(320),
	@SoTienThu money
	
)
as
begin
	declare @SoTienNo money;
	set @SoTienNo =  (select TienNo from PhieuTiepNhan where id = @MaPhieuTN)

	if(@SoTienNo = 0)
	begin
	raiserror('Khách hàng  đã hoàn tất thanh toán!' , 16 ,1);
	return;
	end;
	else if( @SoTienThu > @SoTienNo)
	begin 
	raiserror('Số tiền thu vượt quá số tiền nợ ' , 16 ,1);
	return;
	end
	else
	begin
		declare @MaPhieuThu  int ;
			set @MaPhieuThu  = 1;
			while exists ( select id from PhieuThu where id = @MaPhieuThu)
				set @MaPhieuThu = @MaPhieuThu + 1
				insert into PhieuThu(id , MaPhieuTN , SDT,Email,SoTienThu)
											values ( @MaPhieuThu , @MaPhieuTN , @SDT,@Email,@SoTienThu)
	end
end		
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_reception]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_reception] (
	 @TenChuXe  nvarchar(320) ,
	 @DiaChiCX nvarchar(max),
	 @SDT varchar(50),
	 @Email varchar(320),
	 @CMND varchar(320),
	 @MaHangXe int,
	 @BienSoXe  varchar(320),
	 @GhiChu text ,
	 @HanGiaoXe date

)
as
begin
	declare @SoLuongXeToiDa int;
	set @SoLuongXeToiDa = (select SoLuongXeToiDa from ThamSo)

	declare @SoLuongXeHienTai int;
	set @SoLuongXeHienTai = (select count(id) from  PhieuTiepNhan where NgayTiepNhan = GetDate()) + 1
	-- giả định  khi tăng số lượng lên 1 đơn vị vẫn thỏa điều kiện , sử dụng  if để kiểm tra số   lượng xe tối đa
	if ( @SoLuongXeHienTai <= @SoLuongXeToiDa)
	begin 
		declare @MaChuXe  int ;
				set @MaChuXe  = 1;
				while exists ( select id from ChuXe where id = @MaChuXe)
					set @MaChuXe = @MaChuXe + 1
					insert into ChuXe (id , TenChuXe , DiaChiCX, SDT , Email,CMND )
												values ( @MaChuXe , @TenChuXe , @DiaChiCX ,@SDT ,  @Email,@CMND)
				declare @MaTiepNhan int;
				set @MaTiepNhan = 1;
				while  exists ( select id from PhieuTiepNhan where id = @MaTiepNhan)
					set @MaTiepNhan = @MaTiepNhan + 1
						insert into  PhieuTiepNhan( id , MaChuXe , MaHangXe, BienSoXe ,Ghichu,HanGiaoXe,TienNo,[status]) 
												values ( @MaTiepNhan,@MaChuXe , @MaHangXe, @BienSoXe , @GhiChu,@HanGiaoXe,0,'Đã Tiếp Nhận')
						
	end
	else
	begin
			 raiserror ( 'Đã vượt quá số lượng xe có thể tiếp nhận trong ngày!', 16,1)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_repair]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_repair] (
	@MaTN int
)
as
begin
	declare @id int
	declare @MaPhieuSuaXe  int ;
			set @MaPhieuSuaXe  = 1;
			while exists ( select id from PhieuSuaXe where id = @MaPhieuSuaXe)
				set @MaPhieuSuaXe = @MaPhieuSuaXe + 1
				insert into PhieuSuaXe (id , MaTN , TongTien,NgaySua)
											values ( @MaPhieuSuaXe , @MaTN ,0,GETDATE())
				update    PhieuTiepNhan set [status] = 'Đang xử lý'  where id = @MaTN
				set  @id = @MaPhieuSuaXe
				  -- Trả về giá trị khóa chính
				SELECT @id AS NewPrimaryKey
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_repair_details]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_repair_details] (
	@MaPSX int,
	@MaTienCong int,
	@MaVTPT int,
	@NoiDung nvarchar(max),
	@DonGia money,
	@TienCong money,
	@SoLuong int
)
as
begin

	-- kiểm tra  số lượng  vật tư  hiện tại còn đủ để đáp ứng nhu cầu sửa chữa hay không
		declare @SoLuongVatTu  int
		set @SoLuongVatTu = (select  SoLuongVatTu from PhuTung where id = @MaVTPT) 
		if(@SoLuongVatTu < @SoLuong ) 
		begin 
			raiserror('Số lượng vật tư hiện tại không còn đủ số lượng!' ,16,1)
			return;
		end
	-- Kiểm tra xem sản phẩm đã tồn tại trong bảng chi tiết hóa đơn hay chưa
		declare @MaPhieuSuaCT  int ;
		set @MaPhieuSuaCT  = 1;
		while exists ( select id from PhieuSuaCT where id = @MaPhieuSuaCT)
			set @MaPhieuSuaCT = @MaPhieuSuaCT + 1
    IF EXISTS (SELECT 1 FROM PhieuSuaCT WHERE MaPSX = @MaPSX AND MaVTPT = @MaVTPT  )
    BEGIN
		
        -- Tăng số lượng sản phẩm và tính lại tổng tiền chi tiết
        UPDATE PhieuSuaCT
        SET SoLuong = SoLuong + @SoLuong,
            TongTien = (SoLuong + @SoLuong) * @DonGia
        WHERE MaPSX = @MaPSX AND MaVTPT = @MaVTPT;

		--update    PhuTung  set SoLuongVatTu = SoLuongVatTu -  @SoLuong where  id = @MaVTPT;
    END
    ELSE
			insert into PhieuSuaCT (id , MaPSX , MaTiencong ,MaVTPT,NoiDung,DonGia,TienCong,SoLuong)
										values ( @MaPhieuSuaCT,@MaPSX , @MaTienCong , @MaVTPT,@NoiDung,@DonGia,@TienCong,@SoLuong)
			update    PhuTung  set SoLuongVatTu = SoLuongVatTu -  @SoLuong where  id = @MaVTPT;
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_staff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Thêm mới nhân viên
CREATE  proc [dbo].[sp_insert_staff]
(
	@HoTen nvarchar(max),
	@GioiTinh bit ,
	@CMND varchar(320),
	@DiaChi nvarchar(max),
	@SDT varchar(20) ,
	@MaChucVu  varchar(250),
	@TenTaiKhoan varchar(250) ,
	@MatKhau varchar(25)

)
as 
begin 
	if not exists ( select * from [NhanVien] where [TenTaiKhoan] =  @TenTaiKhoan ) 
		begin 
			declare @MaTTNV  int ;
			set @MaTTNV  = 1;
			while exists ( select id from ThongTinNhanVien where id = @MaTTNV)
				set @MaTTNV = @MaTTNV + 1
				insert into ThongTinNhanVien (id , HoTen , GioiTinh, CMND , DiaChi , SDT)
											values ( @MaTTNV , @HoTen , @GioiTinh ,@CMND ,  @DiaChi , @SDT)
			declare @MaNhanVien int;
			set @MaNhanVien = 1;
			while  exists ( select id from NhanVien where id = @MaNhanVien)
				set @MaNhanVien = @MaNhanVien + 1
				 insert into  NhanVien  ( id , MaTTNV , MaChucVu, TenTaiKhoan , MatKhau) 
											values ( @MaNhanVien,@MaTTNV , @MaChucVu, @TenTaiKhoan , @MatKhau)
		end
	else
		begin
		  raiserror ( 'Tên đăng nhập đã tồn tại trong hệ thống!', 16,1)
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_car_brand]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_car_brand](
	@id int,
    @TenHX varchar(max)
)

as
begin
	if not exists (select * from HangXe where TenHX = @TenHX )
		 update HangXe 
		 set TenHX = @TenHX
		 where [id] = @id
	else raiserror ( 'Đã tồn tại tên hãng xe trong Database!', 16,1)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_money_receipt]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[sp_update_money_receipt] (@MaPhieuThu int , @money money)
as
begin
	if exists ( select * from PhieuThu where id = @MaPhieuThu)
	begin
		update PhieuThu  set SoTienThu = @money where id = @MaPhieuThu;
	end
	else
	begin
	 raiserror ( 'update money not success fully', 16,1)
	end	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_parameter]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure  [dbo].[sp_update_parameter] ( @SoLuongXeToiDa  int , @PhamTramTienLoiCuaSanPham float )
as
begin
	  update  ThamSo set SoLuongXeToiDa = @SoLuongXeToiDa ,PhanTramTienLoiCuaSanPham = @PhamTramTienLoiCuaSanPham
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_quantity_in_import]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_quantity_in_import] (@MaSP int, @quantity int)
as
begin
	if exists ( select * from PhieuNhapCT where id = @MaSP)
	begin
		update PhieuNhapCT  set SoLuong = @quantity where MaVTPT = @MaSP;
	end
	else
	begin
	 raiserror ( 'update quantity not success fully', 16,1)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_quantity_in_repair]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_quantity_in_repair] (@MaSP int,@MaVTPT int , @quantity int)
as
begin
-- kiểm tra  số lượng  vật tư  hiện tại còn đủ để đáp ứng nhu cầu sửa chữa hay không
		declare @SoLuongVatTu  int
		set @SoLuongVatTu = (select  SoLuongVatTu from PhuTung where id = @MaVTPT) 
		if(@SoLuongVatTu < @quantity ) 
		begin 
			raiserror('Số lượng vật tư hiện tại không còn đủ số lượng!' ,16,1)
			return;
		end
	if exists ( select * from PhieuSuaCT where id = @MaSP)
	begin
		update PhieuSuaCT  set SoLuong = @quantity where id = @MaSP;
	end
	else
	begin
	 raiserror ( 'Cập nhật không thành công!', 16,1)
	end
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_reception]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_update_reception] (
     @MaCX INT,
	 @TenChuXe NVARCHAR(320),
	 @DiaChiCX NVARCHAR(MAX),
	 @SDT VARCHAR(50),
	 @Email VARCHAR(320),
	 @CMND VARCHAR(320),
	 @MaHangXe INT,
	 @BienSoXe VARCHAR(320),
	 @GhiChu TEXT,
	 @HanGiaoXe VARCHAR(320)
)
AS
BEGIN
    DECLARE @HanGiaoXeDate DATE;

    -- Chuyển đổi giá trị HanGiaoXe từ varchar thành date
    SET @HanGiaoXeDate = CONVERT(DATE, @HanGiaoXe, 103);

    UPDATE ChuXe SET
        TenChuXe = @TenChuXe,
        DiaChiCX = @DiaChiCX,
        SDT = @SDT,
        Email = @Email,
        CMND = @CMND
    WHERE id = @MaCX;

    UPDATE PhieuTiepNhan SET
        MaHangXe = @MaHangXe,
        BienSoXe = @BienSoXe,
        Ghichu = @GhiChu,
        HanGiaoXe = @HanGiaoXeDate
    WHERE MaChuXe = @MaCX;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_staff_info]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[sp_update_staff_info]
(
	@MaTTNV  int,
	@HoTen nvarchar(max),
	@GioiTinh bit ,
	@CMND varchar(320),
	@DiaChi nvarchar(max),
	@SDT varchar(20) ,
	@MaChucVu  varchar(250),
	@TenTaiKhoan varchar(250) ,
	@MatKhau varchar(250)

)
as 
begin 
	if not exists ( select * from [NhanVien] where [TenTaiKhoan] =  @TenTaiKhoan ) 
		begin 
			
			update ThongTinNhanVien set HoTen = @HoTen , GioiTinh = @GioiTinh , CMND = @CMND , DiaChi = @DiaChi , SDT = @SDT where id = @MaTTNV
		
			update NhanVien set MaChucVu = @MaChucVu , TenTaiKhoan = @TenTaiKhoan , MatKhau = @MatKhau where MaTTNV = @MaTTNV
		end
	else
		begin
		  raiserror ( 'Tên đăng nhập đã tồn tại trong hệ thống!', 16,1)
		end	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_stuff]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_stuff]
	@id int,
	@TenVTPT nvarchar(max),
	@DVT nvarchar(50),
	@DonGia money																								
as
begin
	declare @updateSuccess int;
	set @updateSuccess  =  0;

	if exists (select * from PhuTung where TenVTPT = @TenVTPT )
		begin 
		 update PhuTung
		 set TenVTPT = @TenVTPT , DVT = @DVT ,DonGiaThamKhao = @DonGia
		 where [id] = @id
		 set  @updateSuccess = 1;	 
		 end;
	else
	begin 
		raiserror ( 'Đã tồn tại tên VTPT trong cơ sở dữ liệu!', 16,1)
	end
	  --Trả về giá trị khóa chính
	SELECT @updateSuccess AS status;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_supplier]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_supplier](
	@id int,
    @TenNCC nvarchar(max),
	@SDT varchar(20),
	@DiaChiNhaCungCap nvarchar(max),
	@HoTenNDD nvarchar(max) )																										
as
begin
	declare @updateSuccess int;
	set @updateSuccess  =  0;

	if not exists (select * from NhaCungCap where TenNCC = @TenNCC )
		begin 
		 update NhaCungCap 
		 set TenNCC = @TenNCC , SDT = @SDT ,DiaChiNhaCungCap = @DiaChiNhaCungCap, HotenNDD = @HoTenNDD
		 where [id] = @id
		 set  @updateSuccess = 1;	 
		 end;
	else
	begin 
		raiserror ( 'Đã tồn tại tên nhà cung cấp trong cơ sở dữ liệu!', 16,1)
	end
	  --Trả về giá trị khóa chính
	SELECT @updateSuccess AS status;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_wage]    Script Date: 6/30/2023 10:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_wage](
	@id int,
	@LoaiTienCong nvarchar(max),
	@GiaTriTienCong money
)
as
begin
	if not exists (select * from TienCong where LoaiTienCong = @LoaiTienCong )
		 update TienCong 
		 set LoaiTienCong = @LoaiTienCong , GiaTriTienCong = @GiaTriTienCong
		 where [id] = @id
	else raiserror ( 'Đã tồn tại loại tiền công trong cơ sở dữ liệu!', 16,1)

end
GO
USE [master]
GO
ALTER DATABASE [GaraOtoTemp] SET  READ_WRITE 
GO
