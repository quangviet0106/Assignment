﻿USE Assignment
CREATE TABLE [dbo].[Group](
	[gid] [int]  NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




CREATE TABLE [dbo].[Account](
	
	[username] [varchar](255) NOT NULL Primary key,
	[password] [varchar](255) NOT NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[gid] [int] NOT NULL
	FOREIGN KEY (gid) REFERENCES [Group](gid),
)

CREATE TABLE [dbo].[Group_Feature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[url] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Feature]
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Group]



CREATE TABLE Category(
cid int not null primary key,
cname nvarchar(255)
)

CREATE TABLE Product (
    pid int not null Primary key,
    pname nvarchar(255),
    pdescription nvarchar(MAX),
	pimage nvarchar(255),
	price int,
	pcolor nvarchar(255),
	size int,
	pquantity int,
	cid int,
	FOREIGN KEY (cid) REFERENCES Category(cid),
	
	
);

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
CREATE TABLE [dbo].[Group_Feature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
INSERT INTO [dbo].[Category]([cid],[cname])VALUES (1,'Adidas')
INSERT INTO [dbo].[Category]([cid],[cname])VALUES (2,'Nike')
INSERT INTO [dbo].[Category]([cid],[cname])VALUES (3,'Uniqlo')
INSERT INTO [dbo].[Category]([cid],[cname])VALUES (4,'Jordan')
INSERT INTO [dbo].[Category]([cid],[cname])VALUES (5,'Pirates Sock')

select * from Product
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(1,N'Tất Cổ Chân Chạy Bộ Performance',N'TẤT CỔ CHÂN CHẠY BỘ PERFORMANCEĐÔI. TẤT CHẠY BỘ HIỆU NĂNG CAO CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.Cảm giác khó chịu lúc xuất phát sẽ thành ra không thể chịu nổi khi về đích. Tận hưởng sự thoải mái không chút phân tâm trên từng bước chạy nhờ chất vải mỏng, ôm và co giãn của đôi tất adidas này. Công nghệ HEAT.RDY tăng cường lưu thông khí tối đa, cùng đường may phẳng ở phần mũi chân giúp tránh cọ xát. Làm từ một nhóm chất liệu tái chế và có chứa ít nhất 60% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.',N'https://2.pik.vn/202222fd5e04-f3b7-4bf2-bf13-e776ea9d8494.jpg',28000,N'Trắng',39,100,1)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(2,N'Tất Nike U Snkr Sox Crew Rayguns CU5856-100',N'Giữ đôi chân của bạn luôn thoải mái với tất Nike U Snkr Sox Crew Rayguns. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.',N'https://2.pik.vn/202246a75ea9-3bf0-4559-8d94-de25a27f022a.png',30000,N'Trắng',34,150,2)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(3,N'TẤT ĐỆM CỔ CHÂN',N'Đôi tất dài tới mắt cá này có lớp đệm từ mũi tới gót chân mang đến cảm giác siêu thoải mái. Thiết kế nâng đỡ vòm bàn chân và đường may mượt mà ở phần mũi chân mang lại cảm giác vừa vặn thoải mái. Chất liệu chủ yếu làm từ cotton với logo adidas đậm chất thể thao.',N'https://2.pik.vn/20221e0d5c81-a4aa-485f-be03-3a22210efd29.jpg',20000,N'Đen',36,200,1)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(4,N'Tất Jordan Dri-Fit Long White',N'Mức độ vừa vặn khá cao, tất/vớ Jordan Dri-Fit Long White tốt hơn những đôi vớ bình thường. Bạn có thể cảm thấy rằng những đôi vớ Jordan được làm để phù hợp cho hình dạng bàn chân của bạn với hỗ trợ vòm ở bàn chân. Những đôi tất này cũng thấm mồ hôi và giữ cho đôi chân bạn không ra mồ hôi quá nhiều.',N'https://2.pik.vn/2022312e91fd-9b7d-4bbc-9e45-6d99809189aa.png',35000,N'Trắng',38,300,4)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(5,N'Tất Nike Air SNEAKR Sox SK0202-100',N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Air SNEAKR Sox. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.',N'https://2.pik.vn/20220f4ee196-9464-4e41-b07a-08a8e4a818fa.png',38000,N'Đen',40,200,2)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(6,N'Tất Nike Everyday Essential Crew Socks “Just Do It” White CT0539-100',N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Everyday Essential Crew Socks “Just Do It”. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.',N'https://2.pik.vn/20223c9b9149-1842-4128-a755-ac0ec9e2056f.jpg',24000,N'Trắng',35,600,2)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(7,N'Tất Cổ Chân Chạy Bộ Performance',N'TẤT CỔ CHÂN CHẠY BỘ PERFORMANCEĐÔI. TẤT CHẠY BỘ HIỆU NĂNG CAO CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ.Cảm giác khó chịu lúc xuất phát sẽ thành ra không thể chịu nổi khi về đích. Tận hưởng sự thoải mái không chút phân tâm trên từng bước chạy nhờ chất vải mỏng, ôm và co giãn của đôi tất adidas này. Công nghệ HEAT.RDY tăng cường lưu thông khí tối đa, cùng đường may phẳng ở phần mũi chân giúp tránh cọ xát. Làm từ một nhóm chất liệu tái chế và có chứa ít nhất 60% thành phần tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.',N'https://i.imgur.com/wxWIB2I.jpg',28000,N'Đen',36,450,1)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(8,N'TẤT CỔ CHÂN CHẠY BỘ PHẢN QUANG',N'Bất kể bạn đang rèn luyện tốc độ hay đơn giản là ngắm nhìn khung cảnh xung quanh khi chạy bộ — bạn sẽ không muốn phải bận tâm về đôi tất của mình. Chính vì vậy đôi tất adidas này sẽ loại bỏ mọi xao lãng nhờ thiết kế siêu nhẹ, vừa khít cùng công nghệ HEAT.RDY giúp đôi chân bạn luôn mát mẻ. Nếu bạn ra đường trước lúc bình minh? Đã có các chi tiết phản quang tỏa sáng nổi bật. Đôi tất này thực sự ghi điểm tuyệt đối.',N'https://i.imgur.com/0ILi35y.jpg',42000,N'Đen',37,350,1)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(9,N'TẤT TREFOIL CAO ĐẾN CỔ CHÂN 3 ĐÔI',N'TẤT TREFOIL CAO ĐẾN CỔ CHÂN 3 ĐÔI
KIỂU DÁNG BÓ SÁT, PHONG CÁCH THỂ THAO.
Mẫu tất cổ cao đến mắt cá chân này có đường may ở gót và ngón chân cho kiểu dáng thanh thoát. Logo Trefoil huyền thoại được dệt lên tất, cùng với 3 Sọc trên cổ tất. Mỗi set gồm ba đôi tất thể thao.',N'https://i.imgur.com/v2IXURy.jpg',40000,N'Trắng',39,330,1)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(10,N'Tất Nike Everyday Essential Crew Socks “Just Do It” Black CT0539-010',N'Giữ đôi chân của bạn luôn thoải mái với tất Nike Everyday Essential Crew Socks “Just Do It”. Những đôi tất thể thao Nike cực kỳ thoải mái này của Nike sẽ rất phù hợp cho mọi dịp. Hãy thử chúng, đôi chân của bạn sẽ cảm ơn bạn sau này.',N'https://i.imgur.com/1Wkc5Zt.png',24000,N'Đen',34,390,2)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(11,N'Tất cổ dài Pirate Socks Thor Pack',N'Tất cổ dài Pirate Socks Thor Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.',N'https://i.imgur.com/2sTbNZq.jpg',19000,N'Vàng',37,200,5)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(12,N'Tất cổ dài Pirate Socks Superman Pack',N'Tất cổ dài Pirate Socks Superman Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.',N'https://i.imgur.com/wgFebcH.jpg',25000,N'Xanh',36,100,5)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(13,N'Tất cổ dài Pirate Socks PUBG ‘Winner Winner Chicken Dinner’ Pack',N'Tất cổ dài Pirate Socks PUBG ‘Winner Winner Chicken Dinner’ Pack là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game Battle Royale đình đám nhất trong những năm gần đây.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.',N'https://i.imgur.com/BFjoW0g.jpg',30000,N'Trắng',37,150,5)
INSERT INTO [dbo].[Product] ([pid],[pname],[pdescription],[pimage],[price],[pcolor],[size],[pquantity],[cid])
VALUES(14,N'Tất cổ dài Pirate Socks Street Fighter Pack',N'Tất cổ dài Street Fighter là một trong những thiết kế mới nhất đến từ thương hiệu Pirate Socks với cảm hứng được lấy từ tựa game gắn liền với tuổi thơ của rất nhiều những bạn trẻ 8x, 9x Việt Nam.
Với tinh thần vui vẻ, tích cực, lạc quan, lấy cảm hứng từ phong cách streetwear hơi hướng sportwear và hip-hop, Pirate Socks là thương hiệu tất thời trang nổi tiếng tại Việt Nam từ năm 2017 với các sản phẩm bít tất, vớ đầy cá tính và chất lượng tốt.',N'https://i.imgur.com/kMGKPeq.jpg',20000,N'Trắng',41,100,5)



