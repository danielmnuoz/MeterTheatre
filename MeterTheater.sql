USE [master]
GO
/****** Object:  Database [MeterTheaterDB]    Script Date: 8/2/2022 2:33:50 PM ******/
CREATE DATABASE [MeterTheaterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeterTheaterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MeterTheaterDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MeterTheaterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MeterTheaterDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MeterTheaterDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeterTheaterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeterTheaterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeterTheaterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeterTheaterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MeterTheaterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeterTheaterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MeterTheaterDB] SET  MULTI_USER 
GO
ALTER DATABASE [MeterTheaterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeterTheaterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeterTheaterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeterTheaterDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MeterTheaterDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MeterTheaterDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MeterTheaterDB', N'ON'
GO
ALTER DATABASE [MeterTheaterDB] SET QUERY_STORE = OFF
GO
USE [MeterTheaterDB]
GO
/****** Object:  Table [dbo].[Lab]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab](
	[labID] [int] IDENTITY(1,1) NOT NULL,
	[labName] [varchar](128) NULL,
 CONSTRAINT [PK_Lab] PRIMARY KEY CLUSTERED 
(
	[labID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[locationID] [int] IDENTITY(1,1) NOT NULL,
	[locationRow] [int] NOT NULL,
	[locationCol] [int] NOT NULL,
	[locationTableID] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[logID] [int] IDENTITY(1,1) NOT NULL,
	[logUserID] [int] NULL,
	[logTime] [datetime] NULL,
	[logDescription] [varchar](1024) NULL,
	[logMeterID] [int] NULL,
	[logSocketID] [int] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[logID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meter]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meter](
	[meterID] [int] IDENTITY(1,1) NOT NULL,
	[meterUserID] [int] NULL,
	[meterLanID] [varchar](20) NULL,
	[meterSerialNumber] [int] NULL,
 CONSTRAINT [PK_Meter] PRIMARY KEY CLUSTERED 
(
	[meterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socket]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socket](
	[socketID] [int] IDENTITY(1,1) NOT NULL,
	[socketMeterID] [int] NULL,
	[socketUserID] [int] NULL,
	[socketForm] [varchar](20) NULL,
	[socketVoltage] [int] NULL,
	[socketLocationID] [int] NOT NULL,
	[socketCheckOutTime] [datetime] NULL,
	[socketCheckInTime] [datetime] NULL,
	[socketDuration] [int] NULL,
	[socketComment] [varchar](128) NULL,
 CONSTRAINT [PK_Socket] PRIMARY KEY CLUSTERED 
(
	[socketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[tableID] [int] IDENTITY(1,1) NOT NULL,
	[tableName] [varchar](128) NULL,
	[tableLabID] [int] NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/2/2022 2:33:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[userFullName] [varchar](128) NULL,
	[userEmail] [varchar](128) NULL,
	[userIsAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lab] ON 

INSERT [dbo].[Lab] ([labID], [labName]) VALUES (1, N'2nd Floor Lab')
INSERT [dbo].[Lab] ([labID], [labName]) VALUES (2, N'6th Floor Lab')
SET IDENTITY_INSERT [dbo].[Lab] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (6, 1, 6, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (7, 1, 7, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (8, 1, 8, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (9, 2, 1, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (10, 2, 2, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (11, 2, 3, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (12, 2, 4, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (13, 2, 5, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (14, 2, 7, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (15, 2, 8, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (16, 3, 1, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (17, 3, 2, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (18, 3, 3, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (19, 3, 4, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (20, 3, 5, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (21, 3, 6, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (22, 4, 1, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (23, 4, 2, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (24, 4, 3, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (25, 4, 4, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (26, 4, 6, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (27, 4, 7, 1)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (28, 1, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (29, 1, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (30, 1, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (31, 1, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (32, 1, 5, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (33, 1, 6, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (34, 1, 7, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (35, 1, 8, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (36, 1, 9, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (37, 1, 10, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (38, 2, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (39, 2, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (40, 2, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (41, 2, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (42, 2, 5, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (43, 2, 6, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (44, 2, 7, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (45, 2, 8, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (46, 2, 9, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (47, 2, 10, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (48, 3, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (49, 3, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (50, 3, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (51, 3, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (52, 3, 5, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (53, 3, 6, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (54, 3, 7, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (55, 3, 8, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (56, 3, 9, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (57, 3, 10, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (58, 4, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (59, 4, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (60, 4, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (61, 4, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (62, 4, 5, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (63, 4, 6, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (64, 4, 7, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (65, 4, 8, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (66, 4, 9, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (67, 4, 10, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (68, 5, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (69, 5, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (70, 5, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (71, 5, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (72, 6, 1, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (73, 6, 2, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (74, 6, 3, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (75, 6, 4, 2)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (76, 1, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (77, 1, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (78, 1, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (79, 1, 4, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (80, 1, 5, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (81, 1, 6, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (82, 2, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (83, 2, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (84, 2, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (85, 2, 4, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (86, 2, 5, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (87, 2, 6, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (88, 3, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (89, 3, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (90, 3, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (91, 3, 4, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (92, 3, 5, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (93, 3, 6, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (94, 4, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (95, 4, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (96, 4, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (97, 4, 4, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (98, 4, 5, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (99, 4, 6, 3)
GO
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (100, 5, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (101, 5, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (102, 5, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (103, 5, 4, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (104, 6, 1, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (105, 6, 2, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (106, 6, 3, 3)
INSERT [dbo].[Location] ([locationID], [locationRow], [locationCol], [locationTableID]) VALUES (107, 6, 4, 3)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Socket] ON 

INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (1, NULL, NULL, N'2S', 208, 1, CAST(N'2022-08-02T11:50:04.260' AS DateTime), CAST(N'2022-08-02T12:40:41.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (2, NULL, NULL, N'2S', 208, 2, CAST(N'2022-07-29T09:08:31.423' AS DateTime), CAST(N'2022-08-01T10:20:15.627' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (3, NULL, NULL, N'2S', 208, 3, CAST(N'2022-08-02T11:40:24.837' AS DateTime), CAST(N'2022-08-02T12:40:36.447' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (4, NULL, NULL, N'2S', 208, 4, CAST(N'2022-08-01T16:51:04.377' AS DateTime), CAST(N'2022-08-01T16:55:25.120' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (5, NULL, NULL, N'2S', 208, 5, CAST(N'2022-07-29T10:58:39.943' AS DateTime), CAST(N'2022-07-29T10:59:13.413' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (6, NULL, NULL, N'2S', 208, 6, CAST(N'2022-08-02T10:13:38.720' AS DateTime), CAST(N'2022-08-02T14:01:03.890' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (7, NULL, NULL, N'1S', 208, 7, CAST(N'2022-07-29T12:26:59.013' AS DateTime), CAST(N'2022-08-01T10:19:07.130' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (8, NULL, NULL, N'1S', 208, 8, CAST(N'2022-07-29T12:26:57.127' AS DateTime), CAST(N'2022-08-01T10:19:10.620' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (9, NULL, NULL, N'9S', 120, 9, CAST(N'2022-07-28T16:26:47.497' AS DateTime), CAST(N'2022-07-29T00:00:00.923' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (10, NULL, NULL, N'9S', 120, 10, CAST(N'2022-07-28T16:26:46.123' AS DateTime), CAST(N'2022-07-28T16:26:56.690' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (11, NULL, NULL, N'9S', 120, 11, CAST(N'2022-08-02T11:24:23.300' AS DateTime), CAST(N'2022-08-02T11:24:53.020' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (12, NULL, NULL, N'6S', 120, 12, CAST(N'2022-07-29T12:39:35.777' AS DateTime), CAST(N'2022-08-01T10:22:29.737' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (13, NULL, NULL, N'6S', 120, 13, CAST(N'2022-07-29T12:47:43.827' AS DateTime), CAST(N'2022-07-29T12:47:45.020' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (14, NULL, NULL, N'2S', 208, 14, CAST(N'2022-08-01T14:39:56.007' AS DateTime), CAST(N'2022-08-01T16:16:45.937' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (15, NULL, NULL, N'2S', 208, 15, CAST(N'2022-07-29T12:26:52.590' AS DateTime), CAST(N'2022-08-01T10:22:30.683' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (16, NULL, NULL, N'12S', 120, 16, CAST(N'2022-07-15T10:33:09.690' AS DateTime), CAST(N'2022-07-15T10:47:01.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (17, NULL, NULL, N'12S', 120, 17, CAST(N'2022-07-22T09:42:01.220' AS DateTime), CAST(N'2022-07-22T09:46:35.270' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (18, NULL, NULL, N'12S', 120, 18, CAST(N'2022-07-29T09:48:44.390' AS DateTime), CAST(N'2022-07-29T09:49:33.457' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (19, NULL, NULL, N'16S', 120, 19, CAST(N'2022-08-02T11:24:37.083' AS DateTime), CAST(N'2022-08-02T11:24:56.743' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (20, NULL, NULL, N'16S', 120, 20, CAST(N'2022-07-29T12:32:17.130' AS DateTime), CAST(N'2022-08-01T10:22:31.023' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (21, NULL, NULL, N'16S', 120, 21, CAST(N'2022-08-02T14:25:01.390' AS DateTime), CAST(N'2022-08-01T10:22:31.373' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (22, NULL, NULL, N'5S', 120, 22, CAST(N'2022-08-02T14:25:09.690' AS DateTime), CAST(N'2022-08-02T14:25:59.500' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (23, NULL, NULL, N'5S', 120, 23, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (24, NULL, NULL, N'3S', 120, 24, CAST(N'2022-07-29T09:48:41.110' AS DateTime), CAST(N'2022-07-29T09:49:34.103' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (25, NULL, NULL, N'3S', 120, 25, CAST(N'2022-07-29T09:48:33.237' AS DateTime), CAST(N'2022-07-29T09:49:34.263' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (26, NULL, NULL, N'4S', 208, 26, CAST(N'2022-07-29T12:27:01.337' AS DateTime), CAST(N'2022-08-01T10:22:31.553' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (27, NULL, NULL, N'4S', 208, 27, CAST(N'2022-08-01T14:40:11.167' AS DateTime), CAST(N'2022-08-01T16:16:45.700' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (28, NULL, NULL, N'2S', 240, 28, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (29, NULL, NULL, N'2S', 240, 29, CAST(N'2022-07-28T14:22:49.143' AS DateTime), CAST(N'2022-07-28T14:41:38.923' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (30, NULL, NULL, N'2S', 240, 30, CAST(N'2022-07-25T13:34:00.853' AS DateTime), CAST(N'2022-07-25T13:34:19.873' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (31, NULL, NULL, N'2S', 240, 31, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (32, NULL, NULL, N'2S', 240, 32, CAST(N'2022-07-25T09:08:58.353' AS DateTime), CAST(N'2022-07-25T09:10:22.953' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (33, NULL, NULL, N'2S', 240, 33, CAST(N'2022-07-25T09:09:05.810' AS DateTime), CAST(N'2022-07-25T09:10:23.123' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (34, NULL, NULL, N'2S', 240, 34, CAST(N'2022-07-25T09:09:07.950' AS DateTime), CAST(N'2022-07-25T09:10:23.443' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (35, NULL, NULL, N'2S', 240, 35, CAST(N'2022-07-25T09:09:09.920' AS DateTime), CAST(N'2022-07-25T09:10:23.593' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (36, NULL, NULL, N'2S', 240, 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (37, NULL, NULL, N'2S', 240, 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (38, NULL, NULL, N'2S', 240, 38, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (39, NULL, NULL, N'2S', 240, 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (40, NULL, NULL, N'2S', 240, 40, CAST(N'2022-07-26T11:18:31.130' AS DateTime), CAST(N'2022-07-28T09:11:00.893' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (41, NULL, NULL, N'2S', 240, 41, CAST(N'2022-07-25T09:09:24.347' AS DateTime), CAST(N'2022-07-25T09:10:23.773' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (42, NULL, NULL, N'2S', 240, 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (43, NULL, NULL, N'2S', 240, 43, CAST(N'2022-07-29T10:58:47.897' AS DateTime), CAST(N'2022-07-29T10:59:13.690' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (44, NULL, NULL, N'2S', 240, 44, CAST(N'2022-07-29T10:58:49.793' AS DateTime), CAST(N'2022-07-29T10:59:13.820' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (45, NULL, NULL, N'2S', 240, 45, CAST(N'2022-07-29T10:58:54.877' AS DateTime), CAST(N'2022-07-29T10:59:13.960' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (46, NULL, NULL, N'2S', 240, 46, CAST(N'2022-07-29T10:58:57.717' AS DateTime), CAST(N'2022-07-29T10:59:14.090' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (47, NULL, NULL, N'2S', 240, 47, CAST(N'2022-07-29T10:59:00.830' AS DateTime), CAST(N'2022-07-29T10:59:14.377' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (48, NULL, NULL, N'2S', 240, 48, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (49, NULL, NULL, N'2S', 240, 49, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (50, NULL, NULL, N'2S', 240, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (51, NULL, NULL, N'2S', 240, 51, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (52, NULL, NULL, N'2S', 240, 52, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (53, NULL, NULL, N'2S', 240, 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (54, NULL, NULL, N'2S', 240, 54, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (55, NULL, NULL, N'2S', 240, 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (56, NULL, NULL, N'2S', 240, 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (57, NULL, NULL, N'2S', 240, 57, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (58, NULL, NULL, N'2S', 240, 58, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (59, NULL, NULL, N'2S', 240, 59, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (60, NULL, NULL, N'2S', 240, 60, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (61, NULL, NULL, N'2S', 240, 61, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (62, NULL, NULL, N'2S', 240, 62, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (63, NULL, NULL, N'2S', 240, 63, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (64, NULL, NULL, N'2S', 240, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (65, NULL, NULL, N'2S', 240, 65, CAST(N'2022-07-28T14:24:02.897' AS DateTime), CAST(N'2022-07-28T14:24:04.103' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (66, NULL, NULL, N'2S', 240, 66, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (67, NULL, NULL, N'2S', 240, 67, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (68, NULL, NULL, N'3S', 240, 68, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (69, NULL, NULL, N'3S', 240, 69, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (70, NULL, NULL, N'3S', 240, 70, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (71, NULL, NULL, N'3S', 240, 71, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (72, NULL, NULL, N'4S', 240, 72, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (73, NULL, NULL, N'4S', 240, 73, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (74, NULL, NULL, N'4S', 240, 74, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (75, NULL, NULL, N'4S', 240, 75, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (76, NULL, NULL, N'6S', 120, 76, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (77, NULL, NULL, N'6S', 120, 77, CAST(N'2022-07-21T16:47:05.217' AS DateTime), CAST(N'2022-07-21T16:47:19.817' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (78, NULL, NULL, N'5S', 120, 78, CAST(N'2022-08-01T16:55:34.663' AS DateTime), CAST(N'2022-08-01T16:55:43.897' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (79, NULL, NULL, N'5S', 120, 79, CAST(N'2022-07-25T13:33:54.813' AS DateTime), CAST(N'2022-07-25T13:33:58.470' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (80, NULL, NULL, N'5S', 120, 80, CAST(N'2022-07-25T09:48:12.873' AS DateTime), CAST(N'2022-07-25T10:02:51.433' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (81, NULL, NULL, N'5S', 120, 81, CAST(N'2022-07-25T09:49:02.760' AS DateTime), CAST(N'2022-07-25T10:03:11.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (82, NULL, NULL, N'9S', 120, 82, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (83, NULL, NULL, N'9S', 120, 83, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (84, NULL, NULL, N'9S', 120, 84, CAST(N'2022-07-25T10:02:42.800' AS DateTime), CAST(N'2022-07-25T10:03:11.620' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (85, NULL, NULL, N'9S', 120, 85, CAST(N'2022-07-25T09:58:44.223' AS DateTime), CAST(N'2022-07-25T10:03:11.800' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (86, NULL, NULL, N'9S', 120, 86, CAST(N'2022-07-27T16:19:05.167' AS DateTime), CAST(N'2022-07-27T16:19:08.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (87, NULL, NULL, N'9S', 120, 87, CAST(N'2022-07-25T10:01:17.537' AS DateTime), CAST(N'2022-07-25T10:02:48.663' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (88, NULL, NULL, N'12S', 120, 88, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (89, NULL, NULL, N'12S', 120, 89, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (90, NULL, NULL, N'12S', 120, 90, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (91, NULL, NULL, N'12S', 120, 91, CAST(N'2022-08-01T16:17:05.540' AS DateTime), CAST(N'2022-08-01T16:17:14.237' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (92, NULL, NULL, N'12S', 120, 92, CAST(N'2022-07-25T10:01:24.547' AS DateTime), CAST(N'2022-07-25T10:03:12.140' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (93, NULL, NULL, N'12S', 120, 93, CAST(N'2022-07-25T10:01:58.157' AS DateTime), CAST(N'2022-07-25T10:03:12.320' AS DateTime), NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (94, NULL, NULL, N'16S', 120, 94, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (95, NULL, NULL, N'16S', 120, 95, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (96, NULL, NULL, N'16S', 120, 96, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (97, NULL, NULL, N'16S', 120, 97, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (98, NULL, NULL, N'16S', 120, 98, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (99, NULL, NULL, N'16S', 120, 99, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (100, NULL, NULL, N'1S', 120, 100, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (101, NULL, NULL, N'1S', 120, 101, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (102, NULL, NULL, N'1S', 120, 102, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (103, NULL, NULL, N'1S', 120, 103, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (104, NULL, NULL, N'3S', 120, 104, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (105, NULL, NULL, N'3S', 120, 105, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (106, NULL, NULL, N'3S', 120, 106, NULL, NULL, NULL, NULL)
INSERT [dbo].[Socket] ([socketID], [socketMeterID], [socketUserID], [socketForm], [socketVoltage], [socketLocationID], [socketCheckOutTime], [socketCheckInTime], [socketDuration], [socketComment]) VALUES (107, NULL, NULL, N'3S', 120, 107, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Socket] OFF
GO
SET IDENTITY_INSERT [dbo].[Table] ON 

INSERT [dbo].[Table] ([tableID], [tableName], [tableLabID]) VALUES (1, N'Front Wall', 1)
INSERT [dbo].[Table] ([tableID], [tableName], [tableLabID]) VALUES (2, N'Right Wall', 2)
INSERT [dbo].[Table] ([tableID], [tableName], [tableLabID]) VALUES (3, N'Left Wall', 2)
SET IDENTITY_INSERT [dbo].[Table] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7176, N'Daniel Rodriguez', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7177, N'Magdalena Aguilar', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7178, N'Joe Francis', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7179, N'Iain MacIver', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7180, N'Sue Min', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7181, N'Ali Rokarya', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7182, N'Justin Lyon', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7183, N'Brandon Cook', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7184, N'Pedro Lozada', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7185, N'Sabrina Hasnath', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7186, N'Jahsi Conn', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7187, N'Chris Wallace', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7188, N'Juan Henao', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7189, N'Khoa Nguyen', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7190, N'Daniel Munoz-lara', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7191, N'Grant McKechnie', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7192, N'Brandon Edmunds', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7193, N'Mitchell Cassaday', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7194, N'Jonathan Rivera', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7195, N'Lauren Bigham', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7196, N'Grant Hiriak', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7197, N'Vivek Kannan', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7198, N'Shirin Udwadia', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7199, N'Krupexa Nakrani', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7200, N'James Davis', NULL, NULL, NULL)
INSERT [dbo].[User] ([userID], [userName], [userFullName], [userEmail], [userIsAdmin]) VALUES (7201, N'BusPI', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_meterLanID_notnull]    Script Date: 8/2/2022 2:33:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_meterLanID_notnull] ON [dbo].[Meter]
(
	[meterLanID] ASC
)
WHERE ([meterLanID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_meterSerialNumber_notnull]    Script Date: 8/2/2022 2:33:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_meterSerialNumber_notnull] ON [dbo].[Meter]
(
	[meterSerialNumber] ASC
)
WHERE ([meterSerialNumber] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_userName]    Script Date: 8/2/2022 2:33:50 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [unique_userName] UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [location_table] FOREIGN KEY([locationTableID])
REFERENCES [dbo].[Table] ([tableID])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [location_table]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [log_meter] FOREIGN KEY([logMeterID])
REFERENCES [dbo].[Meter] ([meterID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [log_meter]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [log_socket] FOREIGN KEY([logSocketID])
REFERENCES [dbo].[Socket] ([socketID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [log_socket]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [log_user] FOREIGN KEY([logUserID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [log_user]
GO
ALTER TABLE [dbo].[Meter]  WITH CHECK ADD  CONSTRAINT [meter_user] FOREIGN KEY([meterUserID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Meter] CHECK CONSTRAINT [meter_user]
GO
ALTER TABLE [dbo].[Socket]  WITH CHECK ADD  CONSTRAINT [socket_location] FOREIGN KEY([socketLocationID])
REFERENCES [dbo].[Location] ([locationID])
GO
ALTER TABLE [dbo].[Socket] CHECK CONSTRAINT [socket_location]
GO
ALTER TABLE [dbo].[Socket]  WITH CHECK ADD  CONSTRAINT [socket_meter] FOREIGN KEY([socketMeterID])
REFERENCES [dbo].[Meter] ([meterID])
GO
ALTER TABLE [dbo].[Socket] CHECK CONSTRAINT [socket_meter]
GO
ALTER TABLE [dbo].[Socket]  WITH CHECK ADD  CONSTRAINT [socket_user] FOREIGN KEY([socketUserID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Socket] CHECK CONSTRAINT [socket_user]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [table_lab] FOREIGN KEY([tableLabID])
REFERENCES [dbo].[Lab] ([labID])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [table_lab]
GO
USE [master]
GO
ALTER DATABASE [MeterTheaterDB] SET  READ_WRITE 
GO
