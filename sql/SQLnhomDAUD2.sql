CREATE DATABASE QLCH;
USE QLCH;

-- Bảng khách hàng
CREATE TABLE TBL_User (
UserID INT NOT NULL PRIMARY KEY,
AdminID INT NOT NULL,
HoTen NVARCHAR(50) NOT NULL,
SDT INT NOT NULL,
Email NVARCHAR(50) NOT NULL,
MatKhau NVARCHAR(50) NOT NULL,
CONSTRAINT fk_User_AdminID FOREIGN KEY (AdminID) REFERENCES TBL_Admin(AdminID)
);

-- Bảng admin
CREATE TABLE TBL_Admin (
AdminID INT NOT NULL PRIMARY KEY,
HoTen NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
MatKhau NVARCHAR(50) NOT NULL,
SDT INT NOT NULL
);

-- Bảng sản phẩm
CREATE TABLE TBL_SanPham (
ProductID INT NOT NULL PRIMARY KEY,
ProductGroupID INT NOT NULL,
TenSP NVARCHAR(50) NOT NULL,
SoLuong INT NOT NULL,
GiaTien INT NOT NULL,
ThongSoKyThuat NVARCHAR(200) NOT NULL,
HinhAnh IMAGE NOT NULL,
AdminID INT NOT NULL,
CONSTRAINT fk_SanPham_ProductGroupID FOREIGN KEY (ProductGroupID) REFERENCES TBL_NhomSP(ProductGroupID),
CONSTRAINT fk_SanPham_AdminID FOREIGN KEY (AdminID) REFERENCES TBL_Admin(AdminID)
);

-- Bảng nhóm sản phẩm
CREATE TABLE TBL_NhomSP (
ProductGroupID INT NOT NULL PRIMARY KEY,
TenNhom NVARCHAR(50) NOT NULL
);

-- Bảng đơn hàng
CREATE TABLE TBL_DonHang (
OrderID INT NOT NULL PRIMARY KEY,
UserID INT NOT NULL,
ProductID INT NOT NULL,
SoLuong INT NOT NULL,
TongGiaTien INT NOT NULL,
CONSTRAINT fk_UserID FOREIGN KEY (UserID) REFERENCES TBL_User(UserID),
CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES TBL_SanPham(ProductID)
);
GO

-- Bảng showroom
CREATE TABLE TBL_Showroom (
ShowroomID INT NOT NULL PRIMARY KEY,
AdminID INT NOT NULL,
TenShowroom NVARCHAR(50) NOT NULL,
TenFanpage NVARCHAR(50) NOT NULL,
GioHanhChinh DATETIME NOT NULL,
DiaChi NVARCHAR(50) NOT NULL,
CONSTRAINT fk_AdminID FOREIGN KEY (AdminID) REFERENCES TBL_Admin(AdminID)
);








---dữ liệu admin
insert into Admin(AdminID,hoten,Matkhau,Email,SDT) Values 
(001,N'Nguyễn Văn Minh','Summer2023!','minh237@gmail.com','0984563902'),
(002,N'Trần Khang','Hello123#','khang125@gmail.com','0902103848'), 
(003,N'Thái Ngọc Nga','MyPassword1$','nga390@gmail.com','0918774639'), 
(004,N'Huỳnh Chấn Khang','123456Abc!','Ckhang357@gmail.com','0971584236'), 
(005,N'Hồ Văn Cường','SecurePass1#','cuong00@gmail.com','0963901475');

---dữ liệu nhomsp
 insert into nhomsp(ProductgroupID,tennhom) Values 
(01,N'Laptop'),
(02,N'PC đồ họa'),
(03,N'Linh kiện PC'),
(04,N'Tai nghe+ loa'),
(05,N'Màn hình'),
(06,N'Chuột+ lót chuột'),
(07,N'Ghế+ bàn'),
(08,N'Phần mềm & mạng'),
(09,N'Phụ kiện');

---dữ liệu khachhang
insert into khachhang(UserID,AdminID,hoten,SDT,Email,Matkhau ) Values 
(0001, 001, N'Trần Ngọc Long','0968563412','long206@gmail.com','P@ssword123'),
(0002, 002,N'Đinh Thị Loan','0893455091','loan357@gmail.com','Letmein2023!'),
(0003, 003, N'Vũ Hoàng My', '0215378091','my091@gmail.com','Qwerty123@'),
(0004, 001,N'Vỹ Thái Hồ','075600189','ho870@gmail.com','ChangeMe2023'),
(0005, 001, N'Trần Quân', '0936682541','quan356@gmail.com','Sunshine#1'),
(0006, 001,N'Đỗ Hà', '0945370128','ha333@gmail.com','Welcome2023!'),
(0007, 001, N'Huỳnh Kim Duyên','0987502316','duyen091@gmail.com','HappyDay2023@'),
(0008, 001, N'Thái Vân', '0922809735','van220@gmail.com','MyNameIs123#'),
(0009, 001,N'Lê Thị Mỹ', '0972493015','my901@gmail.com','Password1234!'),
(0010, 001,N'Phạm Dung', '0956241387','dung202@gmail.com','Abcd1234!');

---dữ liệu showroom
insert into showroom(showroomID,tenshowroom,giohanhchinh,AdminID,tenFanpage,diachi) Values 
(1, N'HOÀNG HOA THÁM',GETDATE(),001, N'Fanpage Hoàng Hoa Thám',N'78-80-82 Hoàng Hoa Thám, Phường 12, Quận Tân Bình'),
(2, N'KHA VẠN CÂN',GETDATE(),002,N'Fanpage Kha Vạn Cân',N'905 Kha Vạn Cân, Phường Linh Tây, TP. Thủ Đức'),
(3, N'TRẦN HƯNG ĐẠO',GETDATE(),003,N'Fanpage Trần Hưng Đạo',N'1081-1083 Trần Hưng Đạo, Phường 5, Quận 5'),
(4, N'AN DƯƠNG VƯƠNG',GETDATE(),004,N'Fanpage Hoàng Hoa Thám',N'415 An Dương Vương, Phường 10, Quận 6')


----dữ liệu sản phẩm 

insert into sanpham(ProductID,ProductGroupID,tensp,soluong,giatien,thongsokythuat,hinhanh) Values 
(011, 01,'LaptopMSIModern14C11M011VN', 21,10990000,
N'CPU Intel,Core i3,1115G4 ;RAM 8 GB, DDR4,3200 MHz,SSD 512 GB,Đồ họa Intel UHD Graphics' ,
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LaptopMSIModern14C11M011VN.png' ,SINGLE_BLOB) AS IMAGE) ) ,

(012, 01,'LaptopAsusVivobook15XOLEDA1503ZAL1422W',12,17490000,
N'CPU Intel,Core i5,RAM 8 GB, DDR4,3200 MHz,SSD 512 GB,Đồ họa Intel UHD Graphics' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LaptopASUSVivobook14.jpg' ,SINGLE_BLOB) AS IMAGE) ),

(013, 01,'LaptopLGGramStyle14Z90RSGAH54A5', 15,36990000,
N'CPU Intel,Core i9,RAM 32 GB, DDR5,4800 MHz,SSD 1 TB,Đồ họa Intel UHD Graphics' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LaptopLGGramStyle.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(014,01,'LaptopASUSVivobook14XOLEDA1403ZAKM066W',10,16990000,
N'CPU Intel,Core i12,RAM 64 GB, DDR5,4800 MHz,SSD 1 TB,Đồ họa Intel UHD Graphics' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LaptopAsusVivobook.png' ,SINGLE_BLOB) AS IMAGE) ),


(015,01,'LaptopDellInspiron153520N5I5122W1Black',20,16290000,
N'CPU Intel,Core i5,RAM 8 GB, DDR4,3200 MHz,SSD 512 TB,Đồ họa Intel UHD Graphics' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LaptopDellInspiron15.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(016, 02,'GVNG-Studio9Plusa7900XTX',20,99990000,
N'Mainboard:ASUS ProArt X670E-CREATOR WIFI (DDR5), CPU:AMD Ryzen 9 7950X3D/4.2GHz Boost 5.7GHz/16 nhân 32 luồng/144MB/AM5' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\GVNG-Studio9Plusa7900XTX.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(017,02,'GVNG-Studio9Plusa4090', 5,107000000,
N'Mainboard:ASUS ProArt X770E-CREATOR WIFI (DDR4), CPU:AMD Ryzen 9 7950X4D/4.2GHz Boost 6.0GHz/16 nhân 32 luồng/145MB/AM6' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\GVNG-Studio9Plusa4090.png' ,SINGLE_BLOB) AS IMAGE) ),


(018,02,'GVNG-Studio9Plusa4070Ti',15,78000000,
N'Mainboard:ASUS ProArt X880E-CREATOR WIFI (DDR5),CPU:Intel 9 7950X4D/6.0GHz Boost 8.0GHz/32 nhân 64 luồng/512MB/Core12' ,
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\GVNG-Studio9Plusa4070Ti.png' ,SINGLE_BLOB) AS IMAGE) ),


(019,02,'GVNG-Studio9Plusi4070Ti',13,78000000,
N'Mainboard:ASUS ProArt X50E-CREATOR WIFI (DDR5),CPU:AMD Ryzen 9 4070X2D/7.0GHz Boost 5.7GHz/8 nhân 16 luồng/256MB/AM4',
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\GVNG-Studio9Plusi4070Ti.png',SINGLE_BLOB) AS IMAGE) ),


(021,03,'ASUSROGStrixGeForce',35,64990000,
N'CPU:Intel Core i9-12900H.GPU: NVIDIA GeForce RTX 3070 Ti.Disk:1TB M. 2 NVMe PCIe 4.0 SSD.',
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\ASUSROGStrixGeForceRTX4090OCWhiteEdition24GBGDDR6X.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(022, 03,'ASUSROGStrixB660-IGamingWiFiS', 10,5290000,
N'B660-I Gaming Wifi DDr5 Intel, Intel® 12th Gen Processors 1 x PCIe 5.0 x16 slot,Wi-Fi 6 ,RAM :2 x DIMM, Max. 64GB, DDR5' ,
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\ASUSROGStrixB660-IGamingWiFiS.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(023,03,'CaseJETEKEM1',2,330000,
N'Size:355x170x295 mm ,1xỔ cứng SSD 2.5 1xỔ cứng SSD/HDD 3.5, 2xUSB 2.0 1xGiắc âm thanh 3.5mm 1xGiắc micro ' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\CaseJETEKEM1.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(025,03,'ASUSROGMAXIMUSZ790APEDDR5',29,19690000,
N'Tản nhiệt AI COOLING II,GEN 5.2 khe PCIe 5.0 x16 ,WIFI 6E,PCIE 5.0 M.2.Cung cấp khe cắm PCIe 5.0,Speed:8000+ MT/s ' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\ASUSROGMAXIMUSZ790APEDDR5.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(026,04,'TaingheGamingLogitechGProGen2',18,1690000,
N'Kiểu tai nghe:Over-ear,Tần số:20Hz-20kHz,Khả năng cách âm:Tách tiếng ồn lên tới 16dB,Chất liệu đệm tai nghe:Giả da' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\TaingheGamingLogitechGProGen2.png' ,SINGLE_BLOB) AS IMAGE) ),


(027,04,'Loa SoundMax A600/2.1',28,390000 ,
N'Hệ thống loa 2.1 kênh không dây,Công suất tổng 16W ,Tín hiệu vào:AUX, Hỗ trợ USB/TF Card 128GB, Bluetooth-Điều chỉnh âm thanh: Volume, Bass,Treble,' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\LoaSoundMaxA6002.1.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(028,04,'GiátreotaingheRazerBaseStationV2Chroma-Mercury',10,2290000,
N'Thiết bị treo tai nghe,Cổng kết nối:USB 3.1 Type-A và 3.5mm ,Đèn nền: Chroma RGB,Chất liệu: Nhôm' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\GiatreotaingheRazerBaseStationV2Chroma-Mercury.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(029,04,'TaingheHPHYPERXCloudEarbudsIRed',11,1090000,
N'Tần số đáp ứng 20Hz–20.000Hz,Chiều dài dây 1,2m ,Mức áp suất âm:116dBSPL/mW ở 1kHz; Màng loa:Động,14mm với nam châm đất hiếm,Khối lượng 19g' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\TaingheHPHYPERXCloudEarbudsIRed.jpg' ,SINGLE_BLOB) AS IMAGE) ),


(030,04,'TaingheCorsairHS55WirelessCoreBlack(CA-9011290-AP)',4,1590000,
N'Tai nghe:32000 Ohms Micro:1 kHz,Tần số 20Hz-20.000Hz Micro:100Hz-10.000Hz.Chất lượng âm thanh Stereo' , 
(SELECT BulkColumn FROM OPENROWSET (Bulk 'D:\Image_Device\TaingheCorsairHS55WirelessCoreBlack(CA-9011290-AP).jpg' ,SINGLE_BLOB) AS IMAGE) )


---dữ liệu donhang
insert into donhang(OrderID,UserID,ProductID,soluong,tonggiatien) Values 
(10, 0001, 011,24,10000),
(20, 0002, 012,10,9000),
(30, 0003, 029,16,8000),
(40, 0004, 028,40,7500),
(50, 0005, 025,30,32000),
(60, 0006, 015,12,9000),
(70, 0007, 013,10,6900),
(80, 0008, 019,9,3100),
(90, 0009, 030,34,90000),
(100, 0001, 021,21,23400);


