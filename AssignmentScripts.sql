
USE [Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Feature]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Group_Feature]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 3/8/2022 8:57:26 PM ******/
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
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/8/2022 8:57:26 PM ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/8/2022 8:57:26 PM ******/
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
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'anh', N'12345', N'Ánh', N'Hà Nội', N'anh@gmail.com', N'0987654123', 1)
INSERT [dbo].[Account] ([username], [password], [displayName], [address], [email], [phone], [gid]) VALUES (N'huy', N'12345', N'Huy', N'Hà Nội', N'huy@gmail.com', N'0904688160', 2)
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
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'User')
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 3)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 4)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 5)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (1, 6)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 1)
INSERT [dbo].[Group_Feature] ([gid], [fid]) VALUES (2, 2)
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
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_created_date]  DEFAULT (getdate()) FOR [created_date]
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
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
