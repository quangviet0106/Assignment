
USE [Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[gid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[url] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group_Feature]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Feature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [int] NULL,
	[productColor] [nvarchar](255) NULL,
	[productSize] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[totalPrice] [int] NULL,
	[note] [nvarchar](255) NULL,
	[created_date] [date] NULL CONSTRAINT [DF_Orders_created_date]  DEFAULT (getdate()),
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] NOT NULL,
	[pname] [nvarchar](255) NULL,
	[pdescription] [nvarchar](max) NULL,
	[pimage] [nvarchar](255) NULL,
	[price] [int] NULL,
	[pcolor] [nvarchar](255) NULL,
	[size] [int] NULL,
	[pquantity] [int] NULL,
	[cid] [int] NULL,
 CONSTRAINT [PK__Product__DD37D91A841125D8] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rate]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rate](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rate1] [int] NULL,
	[rate2] [int] NULL,
	[rate3] [int] NULL,
	[rate4] [int] NULL,
	[rate5] [int] NULL,
	[username] [varchar](255) NULL,
	[productid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WishList]    Script Date: 3/20/2022 8:35:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WishList](
	[wid] [int] IDENTITY(1,1) NOT NULL,
	[wname] [nvarchar](255) NULL,
	[wimage] [nvarchar](255) NULL,
	[price] [int] NULL,
	[pcolor] [nvarchar](255) NULL,
	[size] [int] NULL,
	[username_id] [varchar](255) NULL,
	[productid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[wid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'anh', N'12345', N'Ánh', N'Hà Nội', N'anh@gmail.com', N'0987654123', 1)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'huy', N'12345', N'Huy', N'Hà Nội', N'huy@gmail.com', N'0904688160', 2)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'khai', N'123456', N'Khải', N'Hà Nội', N'khai01@gmail.com', N'0935468793', 2)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'namanh', N'12345678', N'Nam Anh', N'Hồ Chí Minh', N'nama@gmail.com', N'0932456789', 2)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'viet', N'123456', N'Việt', N'Hà Nội', N'quangviet0106@gmail.com', N'0902234406', 1)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'vu', N'1234567', N'Vũ', N'Hà Nội', N'vu@gmail.com', N'0923456478', 2)
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Adidas')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Nike')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Uniqlo')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Jordan')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Pirates Sock')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (1, N'ListCart', N'/listcart')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (2, N'AddToCart', N'/addcart')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (3, N'InsertProduct', N'/addproduct')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (4, N'DeleteProduct', N'/deleteproduct')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (5, N'UpdateProduct', N'/editproduct')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (6, N'ManagerProduct', N'/manager')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (7, N'ManagerOrderDetail', N'/managerorderdetails')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (8, N'ManagerOrder', N'/managerorder')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (9, N'ManagerShipping', N'/managershipping')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (10, N'DeleteOrderDetail', N'/deleteorderdetail')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (11, N'DeleteOrder', N'/deleteorder')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (12, N'DeleteShipping', N'/deleteshipping')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (13, N'ManagerCategory', N'/managercategory')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (14, N'InsertCategory', N'/insertcategory')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (15, N'UpdateCategory', N'/updatecategory')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (16, N'DeleteCategory', N'/deletecategory')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (17, N'Home', N'/home')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (18, N'AddWishList', N'/addwishlist')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (19, N'DeleteWishList', N'/deletewishlist')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (20, N'WishList', N'/wishlist')
INSERT [dbo].[Feature] ([fid], [description], [url]) VALUES (21, N'Rate', N'/rate')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'User')
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 3)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 4)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 5)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 6)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 7)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 8)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 9)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 10)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 11)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 12)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 13)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 14)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 15)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 16)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 17)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 1)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 2)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 17)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 18)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 19)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 20)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 21)
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (10, 4, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (11, 4, N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100', N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png', 30000, N'Trắng', 34, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (12, 4, N'Tất thể thao Jordan Jumpman No-Show Socks Trắng Pack 3', N'https://sneakerdaily.vn/wp-content/uploads/2021/09/Thiet-ke-khong-ten-23-1.png', 35000, N'Trắng', 37, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (13, 4, N'TẤT CỔ CHÂN TOUR 360', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f350498d7ed3424bb313ad800144f9f4_9366/Tat_Co_Chan_Tour_360_trang_HB3670_03_standard.jpg', 45000, N'Trắng', 36, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (18, 6, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (19, 6, N'Tất Cổ Chân Chạy Bộ Performance', N'https://i.imgur.com/wxWIB2I.jpg', 28000, N'Đen', 36, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (20, 6, N'Tất Jordan Dri-Fit Long White', N'https://2.pik.vn/2022312e91fd-9b7d-4bbc-9e45-6d99809189aa.png', 35000, N'Trắng', 38, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (21, 7, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (22, 7, N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100', N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png', 30000, N'Trắng', 34, 3)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (23, 7, N'TẤT ĐỆM CỔ CHÂN', N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg', 20000, N'Đen', 36, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (26, 9, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (27, 9, N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100', N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png', 30000, N'Trắng', 34, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (28, 10, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (29, 10, N'TẤT ĐỆM CỔ CHÂN', N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg', 20000, N'Đen', 36, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [productColor], [productSize], [quantity]) VALUES (30, 10, N'BỘ 3 ĐÔI TẤT CỔ TRUNG', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/739699c6cf8f498990c8aaca00d4e9c8_9366/Bo_3_djoi_tat_co_trung_DJen_FM0643_03_standard.jpg', 41000, N'Đen', 39, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [totalPrice], [note], [created_date], [shipping_id]) VALUES (4, N'vu', 138000, N'Ship nhanh', CAST(N'2022-03-09' AS Date), 8)
INSERT [dbo].[Orders] ([id], [username], [totalPrice], [note], [created_date], [shipping_id]) VALUES (6, N'huy', 91000, N'', CAST(N'2022-03-13' AS Date), 10)
INSERT [dbo].[Orders] ([id], [username], [totalPrice], [note], [created_date], [shipping_id]) VALUES (7, N'huy', 138000, N'', CAST(N'2022-03-13' AS Date), 11)
INSERT [dbo].[Orders] ([id], [username], [totalPrice], [note], [created_date], [shipping_id]) VALUES (9, N'huy', 58000, N'', CAST(N'2022-03-13' AS Date), 13)
INSERT [dbo].[Orders] ([id], [username], [totalPrice], [note], [created_date], [shipping_id]) VALUES (10, N'khai', 137000, N'Ship nhanh', CAST(N'2022-03-16' AS Date), 14)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (1, N'Tất Cổ Chân Chạy Bộ Performance', N'TẤT CỔ CHÂN CHẠY BỘ PERFORMANCEĐÔI. TẤT CHẠY BỘ HIỆU NĂNG CAO CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.Cảm giác khó chịu lúc xuất phát sẽ thành ra không thể chịu nổi khi về đích. Tận hưởng sự thoải mái không chút phân tâm trên từng bước chạy nhờ chất vải mỏng, ôm và co giãn của đôi tất adidas này. Công nghệ HEAT.RDY tăng cường lưu thông khí tối đa, cùng đường may phẳng ở phần mũi chân giúp tránh cọ xát. Làm từ một nhóm chất liệu tái chế và có chứa ít nhất 60% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, 100, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (2, N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike U Snkr Sox Crew Rayguns. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png', 30000, N'Trắng', 34, 150, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (3, N'TẤT ĐỆM CỔ CHÂN', N'Đôi tất dài tới mắt cá này có lớp đệm từ mũi tới gót chân mang đến cảm giác siêu thoải mái. Thiết kế nâng đỡ vòm bàn chân và đường may mượt mà ở phần mũi chân mang lại cảm giác vừa vặn thoải mái. Chất liệu chủ yếu làm từ cotton với logo adidas đậm chất thể thao.', N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg', 20000, N'Đen', 36, 200, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (4, N'Tất Jordan Dri-Fit Long White', N'Mức độ vừa vặn khá cao, tất/vớ Jordan Dri-Fit Long White tốt hơn những đôi vớ bình thường. Bạn có thể cảm thấy rằng những đôi vớ Jordan được làm để phù hợp cho hình dạng bàn chân của bạn với hỗ trợ vòm ở bàn chân. Những đôi tất này cũng thấm mồ hôi và giữ cho đôi chân bạn không ra mồ hôi quá nhiều.', N'https://2.pik.vn/2022312e91fd-9b7d-4bbc-9e45-6d99809189aa.png', 35000, N'Trắng', 38, 300, 4)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (5, N'Tất Nike Air SNEAKR Sox SK0202-100', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Air SNEAKR Sox. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://2.pik.vn/20220f4ee196-9464-4e41-b07a-08a8e4a818fa.png', 38000, N'Đen', 40, 200, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (6, N'Tất Nike Everyday Essential Crew Socks “Just Do It” White CT0539-100', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Everyday Essential Crew Socks “Just Do It”. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://2.pik.vn/20223c9b9149-1842-4128-a755-ac0ec9e2056f.jpg', 24000, N'Trắng', 35, 600, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (7, N'Tất Cổ Chân Chạy Bộ Performance', N'TẤT CỔ CHÂN CHẠY BỘ PERFORMANCEĐÔI. TẤT CHẠY BỘ HIỆU NĂNG CAO CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.Cảm giác khó chịu lúc xuất phát sẽ thành ra không thể chịu nổi khi về đích. Tận hưởng sự thoải mái không chút phân tâm trên từng bước chạy nhờ chất vải mỏng, ôm và co giãn của đôi tất adidas này. Công nghệ HEAT.RDY tăng cường lưu thông khí tối đa, cùng đường may phẳng ở phần mũi chân giúp tránh cọ xát. Làm từ một nhóm chất liệu tái chế và có chứa ít nhất 60% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', N'https://i.imgur.com/wxWIB2I.jpg', 28000, N'Đen', 36, 450, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (8, N'TẤT CỔ CHÂN CHẠY BỘ PHẢN QUANG', N'Bất kể bạn đang rèn luyện tốc độ hay đơn giản là ngắm nhìn khung cảnh xung quanh khi chạy bộ — bạn sẽ không muốn phải bận tâm về đôi tất của mình. Chính vì vậy đôi tất adidas này sẽ loại bỏ mọi xao lãng nhờ thiết kế siêu nhẹ, vừa khít cùng công nghệ HEAT.RDY giúp đôi chân bạn luôn mát mẻ. Nếu bạn ra đường trước lúc bình minh? Đã có các chi tiết phản quang tỏa sáng nổi bật. Đôi tất này thực sự ghi điểm tuyệt đối.', N'https://i.imgur.com/0ILi35y.jpg', 42000, N'Đen', 37, 350, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (9, N'TẤT TREFOIL CAO ĐẾN CỔ CHÂN 3 ĐÔI', N'TẤT TREFOIL CAO ĐẾN CỔ CHÂN 3 ĐÔI
KIỂU DÁNG BÓ SÁT, PHONG CÁCH THỂ THAO.
Mẫu tất cổ cao đến mắt cá chân này có đường may ở gót và ngón chân cho kiểu dáng thanh thoát. Logo Trefoil huyền thoại được dệt lên tất, cùng với 3 Sọc trên cổ tất. Mỗi set gồm ba đôi tất thể thao.', N'https://i.imgur.com/v2IXURy.jpg', 40000, N'Trắng', 39, 330, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (10, N'Tất Nike Everyday Essential Crew Socks “Just Do It” Black CT0539-010', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Everyday Essential Crew Socks “Just Do It”. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://i.imgur.com/1Wkc5Zt.png', 24000, N'Đen', 34, 390, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (11, N'Tất cổ dài Pirate Socks Thor Pack', N'Tất cổ dài Pirate Socks Thor Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.', N'https://i.imgur.com/2sTbNZq.jpg', 19000, N'Vàng', 37, 200, 5)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (12, N'Tất cổ dài Pirate Socks Superman Pack', N'Tất cổ dài Pirate Socks Superman Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.', N'https://i.imgur.com/wgFebcH.jpg', 25000, N'Xanh', 36, 100, 5)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (13, N'Tất cổ dài Pirate Socks PUBG ‘Winner Winner Chicken Dinner’ Pack', N'Tất cổ dài Pirate Socks PUBG ‘Winner Winner Chicken Dinner’ Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.', N'https://i.imgur.com/BFjoW0g.jpg', 30000, N'Trắng', 37, 150, 5)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (14, N'Tất cổ dài Pirate Socks Street Fighter Pack', N'Tất cổ dài Street Fighter là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game gắn liền với tuổi thơ của rất nhiều những bạn trẻ 8x, 9x Việt Nam.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.', N'https://i.imgur.com/kMGKPeq.jpg', 20000, N'Trắng', 41, 100, 5)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (15, N'Tất Lười 3 Đôi (Vải Pile Mắt Lưới)', N'Tất làm từ vải nhung len tạo cảm giác thoải mái. Cũng có thể được sử dụng như tất thể thao.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/439026/item/goods_09_439026.jpg?width=1600&impolicy=quality_75', 30000, N'Đen', 39, 150, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (16, N'Tất Cổ Ngắn 3 Đôi (Gân)', N'Tất gân vừa vặn tuyệt vời.Thoải mái và dễ phối với giày thể thao.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/439019/item/goods_01_439019.jpg?width=1600&impolicy=quality_75', 35000, N'Trắng,Nâu,Xanh', 37, 200, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (17, N'Tất Cổ Ngắn 3 Đôi (Gân)', N'Tất gân vừa vặn tuyệt vời.Thoải mái và dễ phối với giày thể thao.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/439019/item/goods_09_439019.jpg?width=1600&impolicy=quality_75', 35000, N'Đen', 39, 200, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (18, N'BỘ 3 ĐÔI TẤT CỔ THẤP', N'BỘ BA ĐÔI TẤT ẨN CHO CẢM GIÁC DỄ CHỊU.
Đảm bảo cho đôi chân bạn luôn thoải mái trên sân golf là điều tối quan trọng. Mẫu tất cổ thấp adidas này chính là giải pháp hoàn hảo. Bất kể bạn đang chinh phục fairway hay nỗ lực giảm số gậy putt, hãy tập trung vào từng cú đánh nhờ sự kết hợp hoàn hảo giữa độ nâng đỡ và êm ái.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5f9eeba77f3a4ac59cf1aca60117e80a_9366/Bo_3_djoi_tat_co_thap_trang_GJ7327_03_standard.jpg', 40000, N'Trắng', 38, 100, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (19, N'TẤT CAO CỔ TÁI CHẾ ADIDAS X UB22', N'ĐÔI TẤT CHẠY BỘ SIÊU THOẢI MÁI CÓ SỬ DỤNG SỢI PARLEY OCEAN PLASTIC.
Đôi tất tuyệt vời nhất sẽ khiến bạn quên mất rằng mình đang mang tất. Chính vì vậy đôi tất chạy bộ adidas này sử dụng công nghệ HEAT.RDY giúp đôi chân bạn luôn mát mẻ, đường may phẳng ở mũi chân giảm thiểu cọ xát, tăng cường nâng đỡ vòm bàn chân và công nghệ FORMOTION linh hoạt theo cấu trúc bàn chân. Chỉ là tất chân thôi mà có thật nhiều công nghệ phải không? Đúng vậy.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/643c57673f6d42dcb29cada0010a4d99_9366/Tat_Cao_Co_Tai_Che_adidas_x_UB22_trang_HA0109_03_standard.jpg', 42000, N'Trắng', 38, 200, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (20, N'TẤT CỔ CHÂN TOUR 360', N'ĐÔI TẤT GOLF CÓ VÂN BÁM, SỬ DỤNG CHẤT LIỆU TÁI CHẾ.
Nâng niu đôi chân bạn y như golf thủ chuyên nghiệp với đôi tất golf cổ chân adidas này. Thiết kế bó cơ nâng đỡ vòm bàn chân và phần gót chân lót đệm đảm bảo cảm giác thoải mái khi di chuyển suốt 18 lỗ và hơn thế nữa. Chất vải lưới thoáng khí tăng cường thoáng mát. Vân bám dập nổi ở lòng bàn chân cho độ ôm cố định khi bạn vung gậy và xoay người trong suốt vòng golf.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f350498d7ed3424bb313ad800144f9f4_9366/Tat_Co_Chan_Tour_360_trang_HB3670_03_standard.jpg', 45000, N'Trắng', 36, 150, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (21, N'Tất thể thao Jordan Jumpman No-Show Socks Trắng Pack 3', N'Được làm từ chất liệu vải cao cấp, mềm mịn. Kháng khuẩn, khử mùi, thấm hút mồ hôi nhanh, co giãn tốt.', N'https://sneakerdaily.vn/wp-content/uploads/2021/09/Thiet-ke-khong-ten-23-1.png', 35000, N'Trắng', 37, 200, 4)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (22, N'TẤT MILANO 16 (1 ĐÔI)', N'ĐÔI TẤT BÓNG ĐÁ CHO CẢM GIÁC THOẢI MÁI TRÊN SÂN CỎ.
Trong bóng đá, từng phần của trang phục đều rất quan trọng, bao gồm cả đôi tất dưới chân bạn. Hãy gây ấn tượng với đôi tất đầu gối nam này, kết hợp đệm lót bố trí hợp lý và các mảng phối lưới thoáng khí.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0833cfb2192d431c94caa80300072f5b_9366/Tat_Milano_16_(1_DJoi)_Mau_xanh_da_troi_AJ5907_03_standard.jpg', 30000, N'Xanh đậm', 37, 100, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (23, N'BỘ 3 ĐÔI TẤT CỔ TRUNG', N'BA ĐÔI TẤT MỀM MẠI, THOẢI MÁI VỚI ĐỘ DÀI NGANG BẮP CHÂN LINH HOẠT.
Tìm nơi hạnh phúc nhất cho mình ngay giữa gót chân và bắp chân. Không quá ngắn cũng không quá dài, đôi tất adidas cổ trung mang đến diện mạo tuyệt vời cả khi luyện tập lẫn lúc nghỉ ngơi. Tất có cảm giác mềm như bông cho độ thoải mái và vừa vặn hoàn hảo.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/739699c6cf8f498990c8aaca00d4e9c8_9366/Bo_3_djoi_tat_co_trung_DJen_FM0643_03_standard.jpg', 41000, N'Đen', 39, 200, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (24, N'TẤT CỔ THẤP TOUR', N'ĐÔI TẤT GOLF CHO CẢM GIÁC THOẢI MÁI SUỐT CẢ NGÀY.
Cảm giác thoải mái trên sân golf là yếu tố then chốt giúp bạn đạt đỉnh cao phong độ. Chinh phục fairway đầy tự tin với đôi tất adidas này. Nâng niu đôi chân bạn từ cú phát bóng đầu tiên tới green thứ 18 nhờ sự kết hợp hoàn hảo giữa độ mềm mại và nâng đỡ.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4aa2487f4f2e4b458086aca601184d78_9366/Tat_co_thap_Tour_DJen_GJ7582_03_standard.jpg', 35000, N'Đen', 38, 150, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (25, N'TẤT CỔ CHÂN TOUR 360', N'ĐÔI TẤT GOLF CÓ VÂN BÁM, SỬ DỤNG CHẤT LIỆU TÁI CHẾ.
Nâng niu đôi chân bạn y như golf thủ chuyên nghiệp với đôi tất golf cổ chân adidas này. Thiết kế bó cơ nâng đỡ vòm bàn chân và phần gót chân lót đệm đảm bảo cảm giác thoải mái khi di chuyển suốt 18 lỗ và hơn thế nữa. Chất vải lưới thoáng khí tăng cường thoáng mát. Vân bám dập nổi ở lòng bàn chân cho độ ôm cố định khi bạn vung gậy và xoay người trong suốt vòng golf.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d8286dddacba46a2a25cad800143b96a_9366/Tat_Co_Chan_Tour_360_DJen_HB6508_03_standard.jpg', 45000, N'Đen', 36, 350, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (26, N'TẤT SÂN NHÀ ARSENAL 21/22', N'ĐÔI TẤT DÀI NGANG GỐI MANG MÀU SẮC SÂN NHÀ CLB.
Niềm tự hào CLB từ đầu xuống chân. Thể hiện tinh thần Arsenal với đôi tất bóng đá adidas này. Nằm trong bộ trang phục sân nhà của CLB, đôi tất này có họa tiết graphic kỹ thuật và lớp đệm tăng cường tại những vị trí cần thiết nhất. Công nghệ AEROREADY đánh bay hơi ẩm giúp bạn luôn khô ráo.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d466f8ebb8cd4f2a9452acd200d85c98_9366/Tat_San_Nha_Arsenal_21-22_trang_GM0200_03_standard.jpg', 42000, N'Sọc đỏ trắng', 40, 100, 1)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (27, N'Tất Nike Unisex Nike Everyday Cushioned Pack 3 Đôi SX7670-010', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Everyday Cushioned Crew. Những đôi tất thể thao cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://sneakerdaily.vn/wp-content/uploads/2021/03/tat-nike-unisex-nike-everyday-cushioned-pack-3-sx7670-010.png', 45000, N'Đen', 39, 150, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (28, N'Tất Nike Elite Basketball Crew White SX7627-100', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Elite Basketball Crew White. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://sneakerdaily.vn/wp-content/uploads/2021/03/tat-nike-elite-basketball-crew-white-sx7627-100-1-1.png', 38000, N'Trắng', 40, 150, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (29, N'Tất Nike Everyday Max Cushioned Black SX5571-010', N'Giữ đôi chân của bạn luôn thoải mái với tất Tất Nike Everyday Max Cushioned Black . Những đôi tất thể thao cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://sneakerdaily.vn/wp-content/uploads/2021/03/tat-nike-everyday-max-cushioned-black-sx5571-010-1-1.png', 50000, N'Đen', 36, 200, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (30, N'Tất Nike Dri-Fit Everyday Cotton Cushioned Crew Trắng', N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Dri-Fit Everyday Cotton Cushioned Crew Trắng. Những đôi tất thể thao cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.', N'https://sneakerdaily.vn/wp-content/uploads/2020/11/tat-nike-dri-fit-everyday-cotton-cushioned-crew-sock-trang-sx7664-100-1.png', 18000, N'Trắng', 37, 350, 2)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (31, N'Tất bóng rổ Lebron', N'Hoàn hảo nhất là giành cho những người có cỡ chân đi giày size 42,43 bời tất sẽ đạt độ co giãn vửa phải, ngược lại cũng không bị cảm giác trùng cho nên đem lại cảm giác tốt hơn, bền hơn.', N'https://giaybongro.vn/upload/img/4817_1538991853.jpg', 45000, N'Đen', 42, 150, 4)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (32, N'Tất bóng rổ NBA Brooklyn Nets', N'Hoàn hảo nhất là giành cho những người có cỡ chân đi giày size 42,43 bời tất sẽ đạt độ co giãn vửa phải, ngược lại cũng không bị cảm giác trùng cho nên đem lại cảm giác tốt hơn, bền hơn.', N'https://giaybongro.vn/upload/images/1000918800/83/8714_1621772940.jpg', 28000, N'Đen', 43, 200, 4)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (33, N'Tất bóng rổ NBA Jordan', N'Hoàn hảo nhất là giành cho những người có cỡ chân đi giày size 42,43 bời tất sẽ đạt độ co giãn vửa phải, ngược lại cũng không bị cảm giác trùng cho nên đem lại cảm giác tốt hơn, bền hơn.', N'https://giaybongro.vn/upload/images/1000918800/83/9388_1621866541.jpg', 43000, N'Đen', 42, 180, 4)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (34, N'Tất Cổ Trung Vải Pile Kẻ Sọc', N'Hoàn hảo cho các môn thể thao, được làm bằng vải pile, vừa vặn thoải mái và chắc chắn.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/436967/item/goods_00_436967.jpg?width=1600&impolicy=quality_75', 48000, N'Trắng', 37, 300, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (35, N'Tất Cổ Ngắn Thể Thao', N'Tất thể thao vừa vặn đa chức năng với lớp vải lưới thoáng khí.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/441887/item/goods_00_441887.jpg?width=1600&impolicy=quality_75', 50000, N'Trắng', 39, 180, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (36, N'Tất Vải Pile', N'Sự lựa chọn hoàn hảo khi chơi thể thao, sản phẩm được làm từ vải nhung len mang lại cảm giác vừa vặn thoải mái và bền chắc.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/436970/item/goods_09_436970.jpg?width=1600&impolicy=quality_75', 52000, N'Đen', 40, 200, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (37, N'Tất Supima Cotton Chấm Bi', N'Kết cấu và thiết kế trang nhã tạo cảm giác thon gọn cho phần chân của người mặc. Cảm giác thoải mái và mịn màng khi chạm vào.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/436954/item/goods_03_436954.jpg?width=1600&impolicy=quality_75', 43000, N'Xám', 39, 300, 3)
INSERT [dbo].[Product] ([pid], [pname], [pdescription], [pimage], [price], [pcolor], [size], [pquantity], [cid]) VALUES (38, N'Tất Thể Thao Cổ Ngắn', N'Sports socks with excellent breathability. With anti-slip soles and cushioning to support your ankles.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450288/item/goods_67_450288.jpg?width=1600&impolicy=quality_75', 29000, N'Xanh lam', 37, 150, 3)
SET IDENTITY_INSERT [dbo].[Rate] ON 

INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (4, 0, 0, 0, 1, 0, N'huy', 1)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (5, 0, 0, 1, 0, 0, N'huy', 2)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (6, 0, 0, 0, 0, 1, N'khai', 1)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (7, 0, 0, 0, 1, 0, N'khai', 2)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (8, 0, 0, 0, 0, 1, N'vu', 1)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (9, 0, 0, 1, 0, 0, N'vu', 4)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (10, 0, 0, 0, 0, 1, N'namanh', 1)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (11, 0, 0, 0, 0, 1, N'huy', 6)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (12, 0, 0, 0, 1, 0, N'huy', 5)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (13, 0, 0, 0, 0, 1, N'huy', 7)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (14, 0, 0, 0, 0, 1, N'huy', 5)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (15, 0, 0, 0, 1, 0, N'huy', 8)
INSERT [dbo].[Rate] ([rid], [rate1], [rate2], [rate3], [rate4], [rate5], [username], [productid]) VALUES (16, 1, 0, 0, 0, 0, N'huy', 6)
SET IDENTITY_INSERT [dbo].[Rate] OFF
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (8, N'Nguyễn Bá Vũ', N'0987654321', N'Hồ Chí Minh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (10, N'Quang Huy', N'0935545647', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (11, N'Nam Anh', N'0987654321', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (13, N'Viet', N'0935545647', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (14, N'Khải', N'0935545647', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
SET IDENTITY_INSERT [dbo].[WishList] ON 

INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (6, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, N'khai', 1)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (7, N'Tất Thể Thao Cổ Ngắn', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450288/item/goods_67_450288.jpg?width=1600&impolicy=quality_75', 29000, N'Xanh lam', 37, N'khai', 38)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (8, N'TẤT ĐỆM CỔ CHÂN', N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg', 20000, N'Đen', 36, N'khai', 3)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (29, N'TẤT MILANO 16 (1 ĐÔI)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0833cfb2192d431c94caa80300072f5b_9366/Tat_Milano_16_(1_DJoi)_Mau_xanh_da_troi_AJ5907_03_standard.jpg', 30000, N'Xanh đậm', 37, N'huy', 22)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (30, N'Tất Cổ Chân Chạy Bộ Performance', N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg', 28000, N'Trắng', 39, N'huy', 1)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (31, N'TẤT ĐỆM CỔ CHÂN', N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg', 20000, N'Đen', 36, N'huy', 3)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (32, N'TẤT TREFOIL CAO ĐẾN CỔ CHÂN 3 ĐÔI', N'https://i.imgur.com/v2IXURy.jpg', 40000, N'Trắng', 39, N'huy', 9)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (33, N'TẤT CỔ CHÂN TOUR 360', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d8286dddacba46a2a25cad800143b96a_9366/Tat_Co_Chan_Tour_360_DJen_HB6508_03_standard.jpg', 45000, N'Đen', 36, N'huy', 25)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (34, N'Tất cổ dài Pirate Socks PUBG ‘Winner Winner Chicken Dinner’ Pack', N'https://i.imgur.com/BFjoW0g.jpg', 30000, N'Trắng', 37, N'huy', 13)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (35, N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100', N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png', 30000, N'Trắng', 34, N'huy', 2)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (36, N'Tất cổ dài Pirate Socks Street Fighter Pack', N'https://i.imgur.com/kMGKPeq.jpg', 20000, N'Trắng', 41, N'huy', 14)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (37, N'TẤT CAO CỔ TÁI CHẾ ADIDAS X UB22', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/643c57673f6d42dcb29cada0010a4d99_9366/Tat_Cao_Co_Tai_Che_adidas_x_UB22_trang_HA0109_03_standard.jpg', 42000, N'Trắng', 38, N'huy', 19)
INSERT [dbo].[WishList] ([wid], [wname], [wimage], [price], [pcolor], [size], [username_id], [productid]) VALUES (38, N'TẤT SÂN NHÀ ARSENAL 21/22', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d466f8ebb8cd4f2a9452acd200d85c98_9366/Tat_San_Nha_Arsenal_21-22_trang_GM0200_03_standard.jpg', 42000, N'Sọc đỏ trắng', 40, N'huy', 26)
SET IDENTITY_INSERT [dbo].[WishList] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Feature]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Group]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__cid__1273C1CD] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__cid__1273C1CD]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([username_id])
REFERENCES [dbo].[Account] ([username])
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
