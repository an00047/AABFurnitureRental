USE [master]
GO
/****** Object:  Database [cs6232-g4]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE DATABASE [cs6232-g4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test_db_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test_db_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_db_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test_db_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cs6232-g4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cs6232-g4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cs6232-g4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cs6232-g4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cs6232-g4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cs6232-g4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cs6232-g4] SET ARITHABORT OFF 
GO
ALTER DATABASE [cs6232-g4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cs6232-g4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cs6232-g4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cs6232-g4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cs6232-g4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cs6232-g4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cs6232-g4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cs6232-g4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cs6232-g4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cs6232-g4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cs6232-g4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cs6232-g4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cs6232-g4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cs6232-g4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cs6232-g4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cs6232-g4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cs6232-g4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cs6232-g4] SET RECOVERY FULL 
GO
ALTER DATABASE [cs6232-g4] SET  MULTI_USER 
GO
ALTER DATABASE [cs6232-g4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cs6232-g4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cs6232-g4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cs6232-g4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cs6232-g4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cs6232-g4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cs6232-g4', N'ON'
GO
ALTER DATABASE [cs6232-g4] SET QUERY_STORE = OFF
GO
USE [cs6232-g4]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](45) NOT NULL,
	[lname] [varchar](45) NOT NULL,
	[sex] [varchar](1) NULL,
	[dob] [datetime2](7) NOT NULL,
	[address] [varchar](45) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[active] [smallint] NULL,
	[city] [varchar](45) NOT NULL,
	[state] [varchar](2) NOT NULL,
	[zip] [varchar](5) NOT NULL,
	[login_data_username] [varchar](20) NOT NULL,
	[admin] [smallint] NOT NULL,
 CONSTRAINT [pk_employee] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[furniture]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[furniture](
	[furnitureID] [int] IDENTITY(1,1) NOT NULL,
	[style_type] [varchar](45) NOT NULL,
	[category_type] [varchar](45) NOT NULL,
	[description] [varchar](45) NOT NULL,
	[daily_rental_rate] [decimal](4, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[fine_rate] [decimal](4, 2) NOT NULL,
 CONSTRAINT [pk_furniture] PRIMARY KEY CLUSTERED 
(
	[furnitureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[furniture_categories]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[furniture_categories](
	[category_type] [varchar](45) NOT NULL,
 CONSTRAINT [pk_furniture_categories] PRIMARY KEY CLUSTERED 
(
	[category_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[furniture_style]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[furniture_style](
	[style_type] [varchar](45) NOT NULL,
 CONSTRAINT [pk_furniture_style] PRIMARY KEY CLUSTERED 
(
	[style_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is_rented]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is_rented](
	[transactionID] [int] NOT NULL,
	[quantityOut] [int] NOT NULL,
	[furnitureID] [int] NOT NULL,
 CONSTRAINT [pk_is_rented] PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC,
	[furnitureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is_returned]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is_returned](
	[quantityIn] [bigint] NOT NULL,
	[is_rented_transactionID] [int] NOT NULL,
	[is_rented_furnitureID] [int] NOT NULL,
	[returns_returnTransactionID] [int] NOT NULL,
 CONSTRAINT [pk_is_returned] PRIMARY KEY CLUSTERED 
(
	[is_rented_transactionID] ASC,
	[is_rented_furnitureID] ASC,
	[returns_returnTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_data]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_data](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](100) NOT NULL,
 CONSTRAINT [pk_login_data] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[memberID] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](45) NOT NULL,
	[lname] [varchar](45) NOT NULL,
	[sex] [varchar](max) NULL,
	[dob] [datetime2](7) NOT NULL,
	[address] [varchar](45) NOT NULL,
	[phone] [varchar](45) NOT NULL,
 CONSTRAINT [pk_member] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentals]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentals](
	[rentalTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[memberID] [int] NOT NULL,
	[employeeID] [int] NOT NULL,
	[datetime_created] [datetime2](7) NOT NULL,
	[datetime_due] [datetime2](7) NOT NULL,
 CONSTRAINT [pk_rentals] PRIMARY KEY CLUSTERED 
(
	[rentalTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[returns]    Script Date: 4/19/2022 4:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returns](
	[returnTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[datetime_created] [datetime2](7) NOT NULL,
	[employee_employeeID] [int] NOT NULL,
 CONSTRAINT [pk_returns] PRIMARY KEY CLUSTERED 
(
	[returnTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employeeID], [fname], [lname], [sex], [dob], [address], [phone], [active], [city], [state], [zip], [login_data_username], [admin]) VALUES (3, N'Dade', N'Wilson', N'M', CAST(N'1985-03-30T09:32:31.8200000' AS DateTime2), N'123 Somewhere', N'770 123 4567', 1, N'Reno', N'NV', N'12345', N'zeroCool', 1)
INSERT [dbo].[employee] ([employeeID], [fname], [lname], [sex], [dob], [address], [phone], [active], [city], [state], [zip], [login_data_username], [admin]) VALUES (5, N'Kate', N'Libby', N'F', CAST(N'1978-03-30T09:32:31.8200000' AS DateTime2), N'456 SomewhereElse', N'678 987 1234', 0, N'Reno', N'NV', N'12345', N'AcidBurn', 0)
INSERT [dbo].[employee] ([employeeID], [fname], [lname], [sex], [dob], [address], [phone], [active], [city], [state], [zip], [login_data_username], [admin]) VALUES (8, N'Wade', N'Watts', N'M', CAST(N'1994-03-30T09:32:31.8200000' AS DateTime2), N'654 ElseWhere Road', N'987 321 4567', 1, N'Atlanta', N'GA', N'34567', N'wade_the_great', 0)
INSERT [dbo].[employee] ([employeeID], [fname], [lname], [sex], [dob], [address], [phone], [active], [city], [state], [zip], [login_data_username], [admin]) VALUES (17, N'Johnny', N'Bravo', N'M', CAST(N'2022-04-19T04:25:32.2266667' AS DateTime2), N'1', N'234 234 2345', 1, N'1', N'AL', N'12345', N'wake', 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[furniture] ON 

INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (2, N'Contemporary', N'Bed', N'A really big bed.', CAST(10.95 AS Decimal(4, 2)), 0, CAST(2.00 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (3, N'Contemporary', N'Chair', N'A really big chair', CAST(2.95 AS Decimal(4, 2)), 2, CAST(0.50 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (4, N'Rustic Farmhouse', N'Bed', N'A wooden bed that squaks a lot', CAST(8.75 AS Decimal(4, 2)), 4, CAST(1.75 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (9, N'Mid-Century Modern', N'Bed', N'More modern.. lots fo excess buttons', CAST(11.25 AS Decimal(4, 2)), 4, CAST(2.25 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (10, N'Mid-Century Modern', N'chair', N'Mint green chair; comfortable', CAST(3.25 AS Decimal(4, 2)), 5, CAST(0.25 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (11, N'Mid-Century Modern', N'Dinner Table', N'round, heavy 5ft. across', CAST(10.25 AS Decimal(4, 2)), 5, CAST(2.25 AS Decimal(4, 2)))
INSERT [dbo].[furniture] ([furnitureID], [style_type], [category_type], [description], [daily_rental_rate], [quantity], [fine_rate]) VALUES (12, N'Mid-Century Modern', N'Couch', N'no buttons, but it plugs into the wall', CAST(8.25 AS Decimal(4, 2)), 5, CAST(3.25 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[furniture] OFF
GO
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Bed')
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Chair')
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Coffee Table')
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Couch')
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Dinner Table')
INSERT [dbo].[furniture_categories] ([category_type]) VALUES (N'Shelf')
GO
INSERT [dbo].[furniture_style] ([style_type]) VALUES (N'Casual')
INSERT [dbo].[furniture_style] ([style_type]) VALUES (N'Contemporary')
INSERT [dbo].[furniture_style] ([style_type]) VALUES (N'Mid-Century Modern')
INSERT [dbo].[furniture_style] ([style_type]) VALUES (N'Rustic Farmhouse')
INSERT [dbo].[furniture_style] ([style_type]) VALUES (N'Traditional')
GO
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (8, 1, 2)
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (8, 1, 3)
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (9, 1, 4)
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (9, 1, 9)
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (10, 1, 3)
INSERT [dbo].[is_rented] ([transactionID], [quantityOut], [furnitureID]) VALUES (11, 1, 3)
GO
INSERT [dbo].[login_data] ([username], [password]) VALUES (N'', N'')
INSERT [dbo].[login_data] ([username], [password]) VALUES (N'AcidBurn', N'QbMcN/x5PmgA76rUO5pCEA==')
INSERT [dbo].[login_data] ([username], [password]) VALUES (N'wade_the_great', N'QbMcN/x5PmgA76rUO5pCEA==')
INSERT [dbo].[login_data] ([username], [password]) VALUES (N'wake', N'QbMcN/x5PmgA76rUO5pCEA==')
INSERT [dbo].[login_data] ([username], [password]) VALUES (N'zeroCool', N'QbMcN/x5PmgA76rUO5pCEA==')
GO
SET IDENTITY_INSERT [dbo].[member] ON 

INSERT [dbo].[member] ([memberID], [fname], [lname], [sex], [dob], [address], [phone]) VALUES (1, N'John', N'Green', N'M', CAST(N'1989-07-13T10:44:39.0000000' AS DateTime2), N'1234 Fake St. Green, OH 55555', N'555 555 5555')
INSERT [dbo].[member] ([memberID], [fname], [lname], [sex], [dob], [address], [phone]) VALUES (2, N'Jesse', N'Green', N'F', CAST(N'1987-07-01T10:48:10.0000000' AS DateTime2), N'1235 Fake St Green, OH 55555', N'222 222 2222')
INSERT [dbo].[member] ([memberID], [fname], [lname], [sex], [dob], [address], [phone]) VALUES (3, N'Diamond', N'Fears', N'F', CAST(N'1976-10-01T11:05:23.0000000' AS DateTime2), N'666 Summerville Dr Charleston, NC 77777', N'888 888 8888')
INSERT [dbo].[member] ([memberID], [fname], [lname], [sex], [dob], [address], [phone]) VALUES (4, N'KC', N'Cunningham', N'F', CAST(N'2022-03-01T11:23:29.0000000' AS DateTime2), N'145 Baxter Dr Salem, OR 77777', N'222 222 2222')
INSERT [dbo].[member] ([memberID], [fname], [lname], [sex], [dob], [address], [phone]) VALUES (5, N'r', N'q', N'M', CAST(N'2022-04-19T03:34:45.7200000' AS DateTime2), N'q', N'123 123 1234')
SET IDENTITY_INSERT [dbo].[member] OFF
GO
SET IDENTITY_INSERT [dbo].[rentals] ON 

INSERT [dbo].[rentals] ([rentalTransactionID], [memberID], [employeeID], [datetime_created], [datetime_due]) VALUES (8, 2, 3, CAST(N'2022-04-19T00:48:37.9200000' AS DateTime2), CAST(N'2023-04-19T00:48:29.8500000' AS DateTime2))
INSERT [dbo].[rentals] ([rentalTransactionID], [memberID], [employeeID], [datetime_created], [datetime_due]) VALUES (9, 2, 3, CAST(N'2022-04-19T00:49:48.7033333' AS DateTime2), CAST(N'2021-04-19T00:49:38.0800000' AS DateTime2))
INSERT [dbo].[rentals] ([rentalTransactionID], [memberID], [employeeID], [datetime_created], [datetime_due]) VALUES (10, 2, 3, CAST(N'2022-04-19T01:31:55.7166667' AS DateTime2), CAST(N'2022-04-19T01:31:46.1433333' AS DateTime2))
INSERT [dbo].[rentals] ([rentalTransactionID], [memberID], [employeeID], [datetime_created], [datetime_due]) VALUES (11, 2, 3, CAST(N'2022-04-19T03:01:51.2333333' AS DateTime2), CAST(N'2022-04-22T03:01:39.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[rentals] OFF
GO
/****** Object:  Index [employeeid_unique]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [employeeid_unique] ON [dbo].[employee]
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_employee_login_data1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_employee_login_data1_idx] ON [dbo].[employee]
(
	[login_data_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_furniture_furniture_categories1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_furniture_furniture_categories1_idx] ON [dbo].[furniture]
(
	[category_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_furniture_furniture_style1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_furniture_furniture_style1_idx] ON [dbo].[furniture]
(
	[style_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [furnitureid]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [furnitureid] ON [dbo].[furniture]
(
	[furnitureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_is_rented_furniture1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_is_rented_furniture1_idx] ON [dbo].[is_rented]
(
	[furnitureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_is_returned_is_rented1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_is_returned_is_rented1_idx] ON [dbo].[is_returned]
(
	[is_rented_transactionID] ASC,
	[is_rented_furnitureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_is_returned_returns1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_is_returned_returns1_idx] ON [dbo].[is_returned]
(
	[returns_returnTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [username_unique]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [username_unique] ON [dbo].[login_data]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [memberid_unique]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [memberid_unique] ON [dbo].[member]
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_rentals_employee1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_rentals_employee1_idx] ON [dbo].[rentals]
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_rentals_member1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_rentals_member1_idx] ON [dbo].[rentals]
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [transactionid_unique]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [transactionid_unique] ON [dbo].[rentals]
(
	[rentalTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_returns_employee1_idx]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE NONCLUSTERED INDEX [fk_returns_employee1_idx] ON [dbo].[returns]
(
	[employee_employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [transactionid_unique1]    Script Date: 4/19/2022 4:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [transactionid_unique1] ON [dbo].[returns]
(
	[returnTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF__employee__admin__2E1BDC42]  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[rentals] ADD  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[returns] ADD  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [fk_employee_login_data1] FOREIGN KEY([login_data_username])
REFERENCES [dbo].[login_data] ([username])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [fk_employee_login_data1]
GO
ALTER TABLE [dbo].[furniture]  WITH CHECK ADD  CONSTRAINT [fk_furniture_furniture_categories1] FOREIGN KEY([category_type])
REFERENCES [dbo].[furniture_categories] ([category_type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[furniture] CHECK CONSTRAINT [fk_furniture_furniture_categories1]
GO
ALTER TABLE [dbo].[furniture]  WITH CHECK ADD  CONSTRAINT [fk_furniture_furniture_style1] FOREIGN KEY([style_type])
REFERENCES [dbo].[furniture_style] ([style_type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[furniture] CHECK CONSTRAINT [fk_furniture_furniture_style1]
GO
ALTER TABLE [dbo].[is_rented]  WITH CHECK ADD  CONSTRAINT [fk_is_rented_furniture1] FOREIGN KEY([furnitureID])
REFERENCES [dbo].[furniture] ([furnitureID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[is_rented] CHECK CONSTRAINT [fk_is_rented_furniture1]
GO
ALTER TABLE [dbo].[is_rented]  WITH CHECK ADD  CONSTRAINT [fk_is_rented_rentals1] FOREIGN KEY([transactionID])
REFERENCES [dbo].[rentals] ([rentalTransactionID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[is_rented] CHECK CONSTRAINT [fk_is_rented_rentals1]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [fk_rentals_employee1] FOREIGN KEY([employeeID])
REFERENCES [dbo].[employee] ([employeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [fk_rentals_employee1]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [fk_rentals_member1] FOREIGN KEY([memberID])
REFERENCES [dbo].[member] ([memberID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [fk_rentals_member1]
GO
ALTER TABLE [dbo].[returns]  WITH CHECK ADD  CONSTRAINT [fk_returns_employee1] FOREIGN KEY([employee_employeeID])
REFERENCES [dbo].[employee] ([employeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[returns] CHECK CONSTRAINT [fk_returns_employee1]
GO
USE [master]
GO
ALTER DATABASE [cs6232-g4] SET  READ_WRITE 
GO
