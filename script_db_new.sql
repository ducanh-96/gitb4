USE [master]
GO
/****** Object:  Database [dbEcommerceRookies]    Script Date: 5/2/2022 5:30:56 PM ******/
CREATE DATABASE [dbEcommerceRookies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbEcommerceRookies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbEcommerceRookies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbEcommerceRookies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbEcommerceRookies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbEcommerceRookies] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbEcommerceRookies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbEcommerceRookies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbEcommerceRookies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbEcommerceRookies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbEcommerceRookies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbEcommerceRookies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbEcommerceRookies] SET  MULTI_USER 
GO
ALTER DATABASE [dbEcommerceRookies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbEcommerceRookies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbEcommerceRookies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbEcommerceRookies] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbEcommerceRookies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbEcommerceRookies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbEcommerceRookies', N'ON'
GO
ALTER DATABASE [dbEcommerceRookies] SET QUERY_STORE = OFF
GO
USE [dbEcommerceRookies]
GO
/****** Object:  User [adn]    Script Date: 5/2/2022 5:30:56 PM ******/
CREATE USER [adn] FOR LOGIN [adn] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[TotalMoney] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitsInStock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 5/2/2022 5:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[Phone] [nchar](10) NULL,
	[Company] [nvarchar](150) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [Published]) VALUES (5, N'Truyện tranh', N'Truyện', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Staff', N'Nhân viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Shipper', N'Nhân viên giao hàng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [dbEcommerceRookies] SET  READ_WRITE 
GO
