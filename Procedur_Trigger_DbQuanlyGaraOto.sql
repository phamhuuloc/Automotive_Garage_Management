alter table   PhieuTiepNhan
add [status] nvarchar (max)

alter  table ChuXe
add CMND varchar(320)
-- login
alter procedure sp_get_infor_login  
as 
begin
		select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
end

--Thêm mới nhân viên
alter  proc [dbo].[sp_insert_staff]
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
--- update thông tin nhân viên
alter  proc sp_update_staff_info
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


-- xóa nhân viên
alter PROCEDURE sp_delete_staff (@MaTTNV  int )
as
begin 
	delete from NhanVien where [MaTTNV] = @MaTTNV
	delete from ThongTinNhanVien where id =@MaTTNV
end;

-- lấy ra  toàn bộ nhân viên đang có trong cơ sở dữ liệu
alter PROCEDURE sp_getAll_Staff
as
begin
	select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
end

-- Tìm kiếm nhân viên theo tên , hoặc trong tên chứa ký tự được nhập vào để tìm kiếm 
alter PROCEDURE sp_find_staff ( @TenTaiKhoan  varchar(250))
as
begin 
select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
	where N.TenTaiKhoan   LIKE '%' + @TenTaiKhoan + '%';
end
-- lấy thông tin nhân viên thông qua id
alter PROCEDURE sp_get_staff_ByID ( @MaTTNV  int)
as
begin 
select n.MaTTNV , c.TenChucVu, n.TenTaiKhoan , n.MatKhau, t.HoTen ,t.GioiTinh , T.CMND , t.DiaChi ,t.SDT
	from  NhanVien n inner join ThongTinNhanVien t on n.MaTTNV  = t.id 
	inner join ChucVu  c on  c.id = n.MaChucVu
	where n.MaTTNV = @MaTTNV
end
 exec sp_get_staff_ByID 3
--Lập  phiếu tiếp nhận xe 
alter PROCEDURE sp_insert_reception (
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

--exec sp_insert_reception 'Phạm Hữu Lộc','Long An','09342234','khoi@gmail.com',1,'60-N-0343','sau khi sửa xong thì đánh bóng lại xe','6/6/2023'


-- kiểm tra xem đã tồn tại phiếu sửa chữa của xe có biển số @BienSoXe chưa 
alter PROCEDURE [dbo].[sp_check_TonTai_PhieuSX] ( @MaPhieuTN  int)
as
begin
	select PhieuSuaXe.id from   PhieuSuaXe  join  PhieuTiepNhan on  PhieuSuaXe.MaTN = PhieuTiepNhan.id  where PhieuTiepNhan.id = @MaPhieuTN
end
exec sp_check_TonTai_PhieuSX 1
--Lập phiếu  sửa chữa 

 alter PROCEDURE sp_insert_repair (
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


--exec sp_insert_repair 1


--tạo bảng chi tiết phiếu sửa chữa từ các  vtpt đã được lựa chọn


 alter PROCEDURE sp_insert_repair_details (
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

 --kiểm thử procedure
--exec sp_insert_repair_details 1,1,2,'Vệ sinh buồn đốt',30000,20000,1



--Lập phiếu  thu tiền

 alter PROCEDURE [dbo].[sp_insert_receipt] (
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



--Lẩy ra thông tin của  phiếu tiếp nhận thông qua mã chủ xe

alter PROCEDURE [dbo].[sp_getInfo_reception]  ( @CMND varchar(320))
as
begin
	select ChuXe.* ,  PhieuTiepNhan.BienSoXe
	from ChuXe inner join  PhieuTiepNhan 
	on ChuXe.id = PhieuTiepNhan.MaChuXe 
	where ChuXe.CMND = @CMND
end	


--Lẩy ra chi tiết thông tin của phiếu sửa xe thông qua mã  tiếp nhận
alter PROCEDURE [dbo].[sp_getInfo_repair_details]  ( @MaTN int)
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




--Lẩy ra chi tiết thông tin của phiếu thu tiền thông qua mã chủ xe 


alter PROCEDURE sp_getInfo_receipt ( @MaCX int)
as
begin
	select ChuXe.TenChuXe,PhieuTiepNhan.BienSoXe,Chuxe.DiaChiCX,chuxe.SDT,PhieuThu.NgayNhan,PhieuSuaXe.TongTien,PhieuThu.SoTienThu from  PhieuThu inner join PhieuTiepNhan 
	on PhieuThu.MaPhieuTN = PhieuTiepNhan.id
	inner join  ChuXe  on PhieuTiepNhan.MaChuXe = ChuXe.id
	inner join PhieuSuaXe on PhieuTiepNhan.id = PhieuSuaXe.id
	where PhieuTiepNhan.MaChuXe = @MaCX
end



--================================================================================UPDATE AND DELETE ================================================
-- update thông tin phiếu tiếp nhận và thông  tin chủ xe
ALTER PROCEDURE sp_update_reception (
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

-- xóa  vật tư phụ tùng trong phiếu sửa chữa
alter PROCEDURE sp_delete_prodcut_in_repair ( @MaSP int)
as
begin
	delete from   PhieuSuaCT where  id = @MaSP
end
-- update số lượng vật tư phụ tùng trong phiếu sửa chữa
alter PROCEDURE sp_update_quantity_in_repair (@MaSP int,@MaVTPT int , @quantity int)
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

-- update số tiền thu  từ khách hàng 
alter PROCEDURE  sp_update_money_receipt (@MaPhieuThu int , @money money)
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



--================================================================================  Quản Lý Chung ==================================================


-- alter a new supplier 
alter PROCEDURE sp_alter_suppliers ( 
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


																										

-- update supplier profile 

alter PROCEDURE sp_update_supplier(
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

alter PROCEDURE sp_create_car_brand (
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


-- delete supplier
alter PROCEDURE sp_delete_supplier (@id  int )
as
begin 
	delete from NhaCungCap where [id] = @id
end;
-- lấy ra toàn bộ các hãng xe đang có trong cơ sở dữ liệu 
alter PROCEDURE sp_getAll_supplier 
as
begin
	select * from NhaCungCap
end

create    
-- Tìm kiếm hãng xe theo tên , hoặc trong tên chứa ký tự được nhập vào để tìm kiếm 
alter PROCEDURE sp_find_supplier ( @TenNCC  varchar(250))
as
begin 
	select * from NhaCungCap where  TenNCC  LIKE '%' + @TenNCC + '%';
end

--====================================================== Hang Xe ============================================

-- alter  Car brand
alter PROCEDURE sp_alter_car_brand ( 
	@TenHX varchar(max)

)
as
begin
	if not exists ( select * from HangXe where TenHX =  @TenHX ) 
		begin 
			declare @MaHangXe int;
			set @MaHangXe = 1;
			while  exists ( select id from HangXe where id = @MaHangXe)
				set @MaHangXe = @MaHangXe + 1
				 insert into  HangXe( id , TenHX) 
											values ( @MaHangXe,@TenHX)
		end
	else
		begin
		  raiserror ( 'Đã tồn tại hãng xe trong Database', 16,1)
		end
end



-- update car branch

alter PROCEDURE sp_update_car_brand(
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




-- Delete car branch 
alter PROCEDURE sp_delete_car_brand (@id  int )
as
begin 
	delete from HangXe where [id] = @id
end;

-- lấy ra toàn bộ các hãng xe đang có trong cơ sở dữ liệu 
alter PROCEDURE sp_getAll_carBrand 
as
begin
	select * from HangXe
end

-- Tìm kiếm hãng xe theo tên , hoặc trong tên chứa ký tự được nhập vào để tìm kiếm 
alter PROCEDURE sp_find_CarBrand ( @TenHX  varchar(250))
as
begin 
	select * from HangXe where  TenHX  LIKE '%' + @TenHX + '%';
end

--====================================================== Tien cong============================================

-- alter Wage
alter PROCEDURE sp_alter_wage ( 
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



-- update car branch

alter PROCEDURE sp_update_wage(
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

	


-- Delete car branch 
alter PROCEDURE sp_delete_wage (@id  int )
as
begin 
	delete from TienCong where [id] = @id
end;



-- lấy ra toàn bộ loại tiền công đang có trong cơ sở dữ liệu 
alter PROCEDURE sp_getAll_wageType 
as
begin
	select * from TienCong
end

-- Tìm kiếm loại tiền công theo tên , hoặc trong tên chứa ký tự được nhập vào để tìm kiếm 
alter PROCEDURE sp_find_wageType ( @LoaiTienCong  varchar(250))
as
begin 
	select * from TienCong where  LoaiTienCong  LIKE '%' + @LoaiTienCong + '%';
end

--=============================================================================== TRIGGER ===========================================================


-- Tạo trigger sau khi thêm, sửa, hoặc xoá dữ liệu trong bảng  chi tiết phiếu sửa chữa 

alter TRIGGER update_total_money
ON PhieuSuaCT
AFTER INSERT, UPDATE
AS
BEGIN
	 declare @PhanTramTienLoiCuaSanPham float;
	 set @PhanTramTienLoiCuaSanPham = (select  PhanTramTienLoiCuaSanPham from ThamSo)
    -- Cập nhật tổng tiền trong bảng phiếu sửa xe 
    UPDATE PhieuSuaXe
    SET TongTien = (
        SELECT SUM((DonGia + (DonGia * @PhanTramTienLoiCuaSanPham/100)) * SoLuong + TienCong)
        FROM PhieuSuaCT
        WHERE MaPSX  = (SELECT MaPSX
        FROM INSERTED)
    )
    WHERE id IN (
        SELECT MaPSX
        FROM INSERTED
    );
END;





alter TRIGGER update_total_Money_Delete
ON PhieuSuaCT
AFTER DELETE
AS
BEGIN
    DECLARE @MaPSX INT;
    
    -- Lấy mã hóa đơn từ bảng DELETED
    SELECT @MaPSX = MaPSX FROM DELETED;
    
    -- Kiểm tra xem có cần cập nhật tổng tiền thành 0 hay không
    IF NOT EXISTS (SELECT 1 FROM PhieuSuaCT WHERE MaPSX = @MaPSX)
    BEGIN
        -- Cập nhật tổng tiền thành 0 trong bảng hóa đơn
        UPDATE PhieuSuaXe
        SET TongTien = 0
        WHERE id  = @MaPSX;
    END;
END;




alter TRIGGER before_insert_PhieuSuaCT
ON PhieuSuaCT
after INSERT
AS
BEGIN
    DECLARE @MaPSX INT;
    DECLARE @MaVTPT INT;
    DECLARE @MaTienCong INT;
	DECLARE @NoiDung nvarchar(max);
	DECLARE @DonGia money;
	DECLARE @TienCong money;
	DECLARE @SoLuong INT;

    -- Lấy thông tin từ bảng INSERTED
	select @MaPSX = MaPSX , @MaVTPT = MaVTPT , @MaTienCong = MaTienCong , @NoiDung = NoiDung , @DonGia = DonGia , @TienCong = TienCong , @SoLuong = SoLuong -1
	from inserted;

    -- Gọi stored procedure để kiểm tra và chèn dữ liệu
    EXEC sp_insert_repair_details @MaPSX , @MaTienCong ,@MaVTPT , @NoiDung , @DonGia , @TienCong ,@SoLuong;
END;


alter TRIGGER calculate_total_money
ON PhieuSuaCT
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	declare @PhanTramTienLoiCuaSanPham  float;
	set @PhanTramTienLoiCuaSanPham = (select  PhanTramTienLoiCuaSanPham from ThamSo)
    -- Cập nhật tổng tiền chi tiết trong bảng chi tiết hóa đơn
    UPDATE PhieuSuaCT
    SET TongTien = (SELECT SUM((DonGia + (DonGia * @PhanTramTienLoiCuaSanPham/100)) * SoLuong + TienCong) FROM PhieuSuaCT   WHERE id  = (SELECT id
        FROM INSERTED))
    FROM PhieuSuaCT
    INNER JOIN INSERTED ON PhieuSuaCT.id = ( SELECT id
        FROM INSERTED)
END;


-- viết trigger  update số tiền nợ 

alter TRIGGER update_total_debtMoney
ON PhieuSuaCT
AFTER INSERT, UPDATE
AS
BEGIN
	declare @PhanTramTienLoiCuaSanPham  float;
	set @PhanTramTienLoiCuaSanPham = (select  PhanTramTienLoiCuaSanPham from ThamSo)
    -- Cập nhật tổng tiền  nợ của chủ xe khi thực hiện tạo  phiếu sửa xe thành công 
    UPDATE PhieuTiepNhan
    SET TienNo = (
        SELECT SUM((DonGia + (DonGia * @PhanTramTienLoiCuaSanPham/100)) * SoLuong + TienCong)
        FROM PhieuSuaCT
        WHERE MaPSX  = (SELECT MaPSX
        FROM INSERTED)
    )
    WHERE id IN (
		select PhieuTiepNhan.id from  PhieuTiepNhan inner join PhieuSuaXe 
		on PhieuTiepNhan.id = PhieuSuaXe.id 
		where PhieuSuaXe.id in (SELECT MaPSX
        FROM INSERTED)
        
    );
END;

--- update lại số tiền nợ khi  thực hiện xóa các vật tư phụ tùng trong bảng  chi tiết hóa đơn
alter TRIGGER update_total_debtMoney_Delete
ON PhieuSuaCT
AFTER DELETE
AS
BEGIN
    DECLARE @MaPSX INT;
    
    -- Lấy mã hóa đơn từ bảng DELETED
    SELECT @MaPSX = MaPSX FROM DELETED;
    
    -- Kiểm tra xem có cần cập nhật tổng tiền thành 0 hay không
    IF NOT EXISTS (SELECT 1 FROM PhieuSuaCT WHERE MaPSX = @MaPSX)
    BEGIN
        -- Cập nhật tổng tiền thành 0 trong bảng hóa đơn
        UPDATE  PhieuTiepNhan
        SET TienNo = 0
       WHERE id IN (
		select PhieuTiepNhan.id from  PhieuTiepNhan inner join PhieuSuaXe 
		on PhieuTiepNhan.id = PhieuSuaXe.id 
		where PhieuSuaXe.id in (SELECT MaPSX
        FROM deleted)
        
    );
    END;
END;


-- khi thực hiện lập phiếu thu tiền thì giảm số tiền nợ xuống 

alter TRIGGER update_total_debtMoney_with_receipts
ON PhieuThu
AFTER INSERT
AS
BEGIN
    -- Cập nhật tổng tiền  nợ của chủ xe khi thực hiện tạo  phiếu  thu thành công.
    UPDATE PhieuTiepNhan
    SET TienNo = TienNo - (
        SELECT top 1 SoTienThu
        FROM PhieuThu
        WHERE MaPhieuTN  = (SELECT MaPhieuTN
        FROM INSERTED)
		order by id desc
    )
    WHERE id IN (
		select PhieuTiepNhan.id from  PhieuTiepNhan inner join PhieuThu 
		on PhieuTiepNhan.id = PhieuThu.MaPhieuTN
		where PhieuTiepNhan.id in (SELECT MaPhieuTN
        FROM INSERTED)
        
    );
	declare @TienNo money;
	set @TienNo = (select TienNo from  PhieuTiepNhan where  id in (SELECT MaPhieuTN
        FROM INSERTED)  )
	if(@TienNo = 0)
	begin
		update PhieuTiepNhan   set  [status] = 'Hoàn Thành' where  id in (SELECT MaPhieuTN
        FROM INSERTED) 
	end
END;

alter TRIGGER update_total_debtMoney_with_receipts_update
ON PhieuThu
AFTER UPDATE
AS
BEGIN
    -- Tạo bảng tạm thời để lưu trữ giá trị SoTienThu
    create TABLE #PreviousReceipts (
        id INT,
        SoTienThu MONEY
    );

    -- Lưu trữ giá trị SoTienThu trước khi cập nhật vào bảng tạm thời
    INSERT INTO #PreviousReceipts (id, SoTienThu)
    SELECT id, SoTienThu
    FROM deleted;

   -- Cập nhật tiền nợ trong bảng PhieuTiepNhan
UPDATE PTN
SET TienNo = PTN.TienNo + PR.SoTienThu - I.SoTienThu
FROM PhieuTiepNhan PTN
INNER JOIN inserted I ON PTN.id = I.MaPhieuTN
INNER JOIN #PreviousReceipts PR ON PTN.id = PR.id;

-- Cập nhật trạng thái của phiếu tiếp nhận
UPDATE PTN
SET [status] = CASE
    WHEN PTN.TienNo = 0 THEN 'Hoàn Thành'
    ELSE 'Đang Xử Lý'
    END
FROM PhieuTiepNhan PTN
INNER JOIN inserted I ON PTN.id = I.MaPhieuTN;

    -- Xóa bảng tạm thời
    DROP TABLE #PreviousReceipts;
END;



alter PROCEDURE	 sp_getAll_receptions
as
begin
	  select ChuXe.* , PhieuTiepNhan.id as MaTN ,PhieuTiepNhan.MaChuXe , PhieuTiepNhan.MaHangXe,
	  PhieuTiepNhan.BienSoXe , PhieuTiepNhan.NgayTiepNhan , PhieuTiepNhan.TienNo , PhieuTiepNhan.Ghichu,PhieuTiepNhan.HanGiaoXe
	  from PhieuTiepNhan inner join  ChuXe    on PhieuTiepNhan.MaChuXe = ChuXe.id ORDER BY
	  ChuXe.TenChuXe ASC;
end

--============== test  trigger 

--delete from  PhieuTiepNhan
--delete from ChuXe

--	select * from PhieuTiepNhan
--	select  * from PhieuSuaXe
--	select * from  PhieuSuaCT

--	select * from PhuTung
--	select * from PhieuThu	

--delete from PhieuSuaCT
--delete from PhieuSuaXe
--delete from PhieuThu
--delete from  PhieuSuaXe

--update PhuTung set SoLuongVatTu = 10



alter TRIGGER update_total_quantity_product
ON  PhieuSuaCT
AFTER  UPDATE
AS
BEGIN
    -- Tạo bảng tạm thời để lưu trữ giá trị SoTienThu
    create TABLE #PreviousReceipts (
        id INT,
        SoLuong int
		);

    -- Lưu trữ giá trị SoTienThu trước khi cập nhật vào bảng tạm thời
    INSERT INTO #PreviousReceipts (id,SoLuong)
    SELECT id, SoLuong
    FROM deleted;

    -- Cập nhật tiền nợ trong bảng PhieuTiepNhan
    UPDATE PhuTung
    SET SoLuongVatTu = SoLuongVatTu + PR.SoLuong - I.SoLuong
    FROM PhuTung PT
    INNER JOIN inserted I ON PT.id = I.MaVTPT
    INNER JOIN #PreviousReceipts PR ON PT.id = PR.id;

    -- Xóa bảng tạm thời
    DROP TABLE #PreviousReceipts;
END;
  drop trigger update_total_quantity_product


---  Lấy  ra tất cả các thông số đang có trong cơ sở dữ liệu

--alter table ThamSo 
--add PhanTramTienLoiCuaSanPham float

update ThamSo set PhanTramTienLoiCuaSanPham = 15

create  procedure  sp_getall_parameter   
as
begin
	select * from ThamSo
end

create  procedure  sp_update_parameter ( @SoLuongXeToiDa  int , @PhamTramTienLoiCuaSanPham float )
as
begin
	  update  ThamSo set SoLuongXeToiDa = @SoLuongXeToiDa ,PhanTramTienLoiCuaSanPham = @PhamTramTienLoiCuaSanPham
end