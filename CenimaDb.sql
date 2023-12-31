USE [CenimaDB]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 7/30/2023 5:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/30/2023 5:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Year] [int] NULL,
	[Image] [nvarchar](255) NULL,
	[Description] [ntext] NULL,
	[GenreID] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 7/30/2023 5:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](200) NULL,
	[Gender] [nvarchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Type] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 7/30/2023 5:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[MovieID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[Comment] [ntext] NULL,
	[NumericRating] [float] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [Description]) VALUES (2, N'Tình cảm ')
INSERT [dbo].[Genres] ([GenreID], [Description]) VALUES (3, N'Kinh Dị')
INSERT [dbo].[Genres] ([GenreID], [Description]) VALUES (2006, N'Hành Động')
INSERT [dbo].[Genres] ([GenreID], [Description]) VALUES (2007, N'Viễn Tưởng')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Image], [Description], [GenreID]) VALUES (1004, N'QUỶ QUYỆT: CỬA ĐỎ VÔ ĐỊNH', 2023, N'https://ocwckgy6c1obj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_8_.jpg', N'Phần tiếp theo của loạt phim kinh dị Insidious', 3)
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Image], [Description], [GenreID]) VALUES (1005, N'XỨ SỞ CÁC NGUYÊN TỐ', 2023, N'https://ocwckgy6c1obj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_official_preiview.jpg', N'Xứ Sở Các Nguyên Tố từ Disney và Pixar lấy bối cảnh tại thành phố các nguyên tố, nơi lửa, nước, đất và không khí cùng chung sống với nhau. ', 2)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (1, N'Nguyen Khang', N'Male', N'khang@hmail.com', N'123', 1, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (2, N'Lại Mai Quảng', N'Male', N'khang1904@hmail.com', N'1234', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (3, N'Lưu Hoàng Tùng ', N'Male', N'Tung@gmail.com', N'123', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (1002, N'Trịnh Việt Tiến', N'Male', N'Tien@gmail.com', N'123', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (1004, N'Nguyen Huu Kh', N'Ma', N'khang19041@hmail.com', N'123', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (2002, N'Lại Mai Quảngtg', N'Male', N'raxexav798@kameili.com', N'123', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (2003, N'Nguyen Huu H', N'Male', N'khang190402@hmail.com', N'1234', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (2004, N'Nguyen Huu Khanhhh', N'Male', N'khangnhhh@hmail.com', N'1234', 2, 1)
INSERT [dbo].[Persons] ([PersonID], [Fullname], [Gender], [Email], [Password], [Type], [IsActive]) VALUES (2005, N'Nguyen Huu Khanghhh', N'Male', N'khang1902@hmail.com', N'123', 2, 1)
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Genres]
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD  CONSTRAINT [FK_Rates_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Movies]
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD  CONSTRAINT [FK_Rates_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Persons]
GO
