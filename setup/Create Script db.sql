USE [master]
GO
/****** Object:  Database [TrashPlusPlus]    Script Date: 29-06-2021 10:10:56 ******/
CREATE DATABASE [TrashPlusPlus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrashPlusPlus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrashPlusPlus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrashPlusPlus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrashPlusPlus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TrashPlusPlus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrashPlusPlus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrashPlusPlus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrashPlusPlus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrashPlusPlus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrashPlusPlus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrashPlusPlus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET RECOVERY FULL 
GO
ALTER DATABASE [TrashPlusPlus] SET  MULTI_USER 
GO
ALTER DATABASE [TrashPlusPlus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrashPlusPlus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrashPlusPlus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrashPlusPlus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrashPlusPlus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrashPlusPlus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrashPlusPlus', N'ON'
GO
ALTER DATABASE [TrashPlusPlus] SET QUERY_STORE = OFF
GO
USE [TrashPlusPlus]
GO
/****** Object:  User [UserCreator]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [UserCreator] FOR LOGIN [UserCreator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UserComplexReader]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [UserComplexReader] FOR LOGIN [UserComplexReader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UserBasicReader]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [UserBasicReader] FOR LOGIN [UserBasicReader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TrashCreator]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [TrashCreator] FOR LOGIN [TrashCreator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TrashComplexReader]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [TrashComplexReader] FOR LOGIN [TrashComplexReader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RWUserCreater]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [RWUserCreater] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[RWUserCreater]
GO
/****** Object:  User [RefreshTokenCreater]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [RefreshTokenCreater] FOR LOGIN [RefreshTokenCreater] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RefreshTokenBasicReader]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [RefreshTokenBasicReader] FOR LOGIN [RefreshTokenBasicReader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ErrorLoggingUser]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [ErrorLoggingUser] FOR LOGIN [ErrorLoggingUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BinTypeComplexReader]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [BinTypeComplexReader] FOR LOGIN [BinTypeComplexReader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BinTypeAllSelect]    Script Date: 29-06-2021 10:10:56 ******/
CREATE USER [BinTypeAllSelect] FOR LOGIN [BinTypeAllSelect] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [RWUserCreater]    Script Date: 29-06-2021 10:10:56 ******/
CREATE SCHEMA [RWUserCreater]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [varchar](250) NULL,
	[Username] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAuthentication]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuthentication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_FK_Users_Id] [int] NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Salt] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AuthUsersView]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AuthUsersView]
AS
	SELECT
		u.Id AS ID,
		u.Mail as Mail,
		u.Username as Username,
		Auth.[Password] as [Password],
		Auth.Salt as Salt
	FROM Users as u
	INNER JOIN UserAuthentication as Auth
	on u.Id = Auth.User_FK_Users_Id
GO
/****** Object:  Table [dbo].[BinTypes]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [varchar](250) NOT NULL,
	[ExceptionType] [varchar](250) NULL,
	[ExceptionMessage] [varchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Expires] [datetime2](7) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[CreatedByIp] [nvarchar](max) NULL,
	[Revoked] [datetime2](7) NULL,
	[RevokedByIp] [nvarchar](max) NULL,
	[ReplacedByToken] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trash]    Script Date: 29-06-2021 10:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [varchar](50) NOT NULL,
	[BinId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BinTypes] ON 
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (2, N'Farligt Affald')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (11, N'Glas')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (6, N'Mad- & Drikke-kartoner')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (4, N'Madaffald')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (3, N'Metal')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (9, N'Pap')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (5, N'Papir')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (10, N'Plast')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (7, N'Restaffald')
GO
INSERT [dbo].[BinTypes] ([Id], [Name]) VALUES (8, N'Tekstiler')
GO
SET IDENTITY_INSERT [dbo].[BinTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLogs] ON 
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (1, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T01:21:35.103' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (2, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T01:21:35.127' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (3, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T01:21:35.133' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (4, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T01:21:35.140' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (5, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T01:22:13.740' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (6, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T01:22:20.220' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (7, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T01:22:21.343' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (8, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T01:22:22.187' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (9, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:23:36.480' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (10, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:23:48.970' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (11, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:25:19.657' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (12, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:26:26.037' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (13, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:44:12.463' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (14, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:45:30.383' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (15, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:46:14.650' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (16, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:46:30.433' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (17, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:46:43.210' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (18, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:47:10.280' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (19, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:48:43.653' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (20, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:49:44.957' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (21, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:50:14.047' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (22, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:52:05.700' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (23, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:52:34.173' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (24, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:53:39.740' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (25, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:53:56.377' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (26, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:54:33.000' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (27, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:56:31.473' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (28, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:56:59.057' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (29, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:57:22.417' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (30, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T01:59:13.847' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (31, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:00:09.290' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (32, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:00:50.310' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (33, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:01:22.850' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (34, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:01:32.167' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (35, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:03:39.567' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (36, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:04:02.823' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (37, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T02:49:44.470' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (38, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.450' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (39, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.470' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (40, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.480' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (41, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.487' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (42, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.490' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (43, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.497' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (44, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:28:34.500' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (45, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.173' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (46, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.190' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (47, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.193' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (48, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.200' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (49, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.207' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (50, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.220' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (51, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.227' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (52, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:13.237' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (53, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.270' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (54, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.277' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (55, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.280' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (56, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.287' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (57, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.293' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (58, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.297' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (59, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.303' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (60, N'An inputted value was incorrect.', N'ArgumentException', N'Password must not be empty. (Parameter ''Password'')', CAST(N'2021-06-28T03:39:15.307' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (61, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T03:39:15.313' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (62, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be password. (Parameter ''Password'')', CAST(N'2021-06-28T03:39:15.317' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (63, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be Password. (Parameter ''Password'')', CAST(N'2021-06-28T03:39:15.323' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (64, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T03:39:15.330' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (65, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T03:39:15.333' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (66, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T03:39:15.340' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (67, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T03:39:15.343' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (68, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T03:39:15.350' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (69, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T03:39:15.353' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (70, N'An unkown error occured.', N'DuplicateNameException', N'A user with these credentials already exist.', CAST(N'2021-06-28T03:39:15.363' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (71, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:50.197' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (72, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.840' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (73, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.863' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (74, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.873' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (75, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.877' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (76, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.883' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (77, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.887' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (78, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:53:54.893' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (79, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.120' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (80, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.143' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (81, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.150' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (82, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.157' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (83, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.160' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (84, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.167' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (85, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:54:24.170' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (86, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.290' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (87, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.313' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (88, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.320' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (89, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.327' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (90, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.343' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (91, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.350' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (92, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T03:56:50.353' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (93, N'An inputted value was incorrect.', N'ArgumentException', N'Password must not be empty. (Parameter ''Password'')', CAST(N'2021-06-28T03:58:37.017' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (94, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T03:58:37.047' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (95, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be password. (Parameter ''Password'')', CAST(N'2021-06-28T03:58:37.050' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (96, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be Password. (Parameter ''Password'')', CAST(N'2021-06-28T03:58:37.057' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (97, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T03:58:37.063' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (98, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T03:58:57.267' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (99, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T03:58:57.290' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (100, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T03:58:57.297' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (101, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T03:58:57.303' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (102, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.160' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (103, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.173' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (104, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.180' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (105, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.187' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (106, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.193' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (107, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.200' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (108, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.210' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (109, N'An inputted value was incorrect.', N'ArgumentException', N'Password must not be empty. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:23.217' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (110, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:23.220' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (111, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be password. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:23.227' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (112, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be Password. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:23.230' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (113, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:23.237' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (114, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:23.243' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (115, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:23.250' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (116, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:23.260' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (117, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:23.267' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (118, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:23.287' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (119, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.567' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (120, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.580' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (121, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.583' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (122, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.590' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (123, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.593' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (124, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.607' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (125, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.613' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (126, N'An inputted value was incorrect.', N'ArgumentException', N'Password must not be empty. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:44.620' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (127, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:44.623' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (128, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be password. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:44.630' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (129, N'An inputted value was incorrect.', N'ArgumentException', N'Password can''t be Password. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:44.633' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (130, N'An inputted value was incorrect.', N'ArgumentException', N'Password must be atleast 8. (Parameter ''Password'')', CAST(N'2021-06-28T04:01:44.643' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (131, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not be empty. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:44.653' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (132, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:44.660' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (133, N'An inputted value was incorrect.', N'ArgumentException', N'Username contains illegal characters. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:44.670' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (134, N'An inputted value was incorrect.', N'ArgumentException', N'Username must not contain any spaces. (Parameter ''Username'')', CAST(N'2021-06-28T04:01:44.683' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (135, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T04:01:44.717' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (136, N'An unkown error occured.', N'DuplicateNameException', N'A user with these credentials already exist.', CAST(N'2021-06-28T04:28:14.787' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (137, N'An inputted value was incorrect.', N'ArgumentException', N'Mail must not be empty. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.123' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (138, N'An inputted value was incorrect.', N'ArgumentException', N'mail test is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.147' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (139, N'An inputted value was incorrect.', N'ArgumentException', N'mail is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.150' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (140, N'An inputted value was incorrect.', N'ArgumentException', N'mail.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.157' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (141, N'An inputted value was incorrect.', N'ArgumentException', N',.--12/()(/(&%&%(/,3-213123.com is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.163' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (142, N'An inputted value was incorrect.', N'ArgumentException', N'105 OR 1=1 is not a valid Mail. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.170' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (143, N'An inputted value was incorrect.', N'ArgumentException', N'Mail contains illegal characters. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.173' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (144, N'The inputted value can not be null.', N'ArgumentNullException', N'Mail must not be null. (Parameter ''Mail'')', CAST(N'2021-06-28T04:29:55.180' AS DateTime))
GO
INSERT [dbo].[ErrorLogs] ([Id], [ErrorMessage], [ExceptionType], [ExceptionMessage], [CreatedAt]) VALUES (145, N'An unexpected error occured. User could not be validated.', N'CryptographicException', N'The provided XML could not be read.', CAST(N'2021-06-28T08:30:39.853' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ErrorLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (11, N'ZSnlqSM7TxZtzdjXQygWzFDdbxtwtkh3afocuzHJgAG83JRNALEec/XBMVG3kpkJj8iD8G2T79EkeKeTwAsB/w==', CAST(N'2021-06-21T19:47:37.0766667' AS DateTime2), CAST(N'2021-06-14T19:47:37.0766667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 29)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (12, N'GpJp5DedfLDHKIY6wRp1X/K8ixORhClMyP+d/HFkBmgLDxFuznlX1lNrv5ThYWkgUb5mDlBaLWv0wSQyyalLjw==', CAST(N'2021-06-22T06:36:40.1366667' AS DateTime2), CAST(N'2021-06-15T06:36:40.1366667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 30)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (13, N'WFII3SNYhEm6oBsZKKS64pglSKOSPFKoghu5txDQTmHspGZ8PxaFKnJKZ9tdY/2KiCsnzeylNkuXaPcpOOSjMA==', CAST(N'2021-06-22T06:37:22.7066667' AS DateTime2), CAST(N'2021-06-15T06:37:22.7066667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 35)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (14, N'cEdPoAkrdp2OjiYrK8dWmCU7dEw4yHl9NsioSgnbn6psCTOHMZGyKhtVGkoNhYTuD+cNx+S91BPeRLOxxahJJw==', CAST(N'2021-06-22T06:40:05.6500000' AS DateTime2), CAST(N'2021-06-15T06:40:05.6500000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 39)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (15, N'baMpb56zSnOQ9+6n1S2dc6wDt7rJsf9dHPaSOskCG3zHJ5gChx4gkZZvcWopSSA6kFXw5aoyBYVk0SbMIIulHA==', CAST(N'2021-06-22T06:41:21.0266667' AS DateTime2), CAST(N'2021-06-15T06:41:21.0266667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 43)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (16, N'wohZVDvgQIuYHz+alE8zIV6GfSL3FmBy9QZqLAb/O36ZCcNGqQ3e2CG0YPXI37SaquOb52fwFDuCoWJUGztxzg==', CAST(N'2021-06-22T07:04:02.1633333' AS DateTime2), CAST(N'2021-06-15T07:04:02.1633333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (17, N'/SpD95bSLWaUuWR5PAjNvnwHW1zE8YIw/rnQuOCNl+rWfn+Mnv3gl239XVkNyDBM5RYT9ag74YDGhleD6hA5rA==', CAST(N'2021-06-22T07:04:07.4766667' AS DateTime2), CAST(N'2021-06-15T07:04:07.4766667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (18, N'B/X0HyToCdr05lYvIIZBbtIAoB4x9Poip2BvYayDVGCD/95TwPSmEcXhStCGejGYDEgJUo2aiVtUKHZTVglWuQ==', CAST(N'2021-06-22T07:16:06.3266667' AS DateTime2), CAST(N'2021-06-15T07:16:06.3266667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (19, N'aFzpHAXVN3837yu9BCIrQs0DoFNtAV/NpcA6B2upsBmgReo/qhqrp5OPu7ipZyRLDSWRworMsB/DzuoS2ROevw==', CAST(N'2021-06-22T07:25:53.9633333' AS DateTime2), CAST(N'2021-06-15T07:25:53.9633333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (20, N'GjFyqhoRb8r03A8HE4p+A5T0v0MVZex82hjzF1zmpfbcYGkyKW53ij532zUy9EMg04zfF6X9/Rg+QKGEFF5nUA==', CAST(N'2021-06-22T07:25:58.7566667' AS DateTime2), CAST(N'2021-06-15T07:25:58.7566667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (21, N'mE0ikFiMNPc/hww3iuNK7wOBMHlzXboat6RroYplNDd7sDhBGtex7ln1IeOGl2v163BsmyN+8U2QT0/ricvlxA==', CAST(N'2021-06-22T07:26:02.2500000' AS DateTime2), CAST(N'2021-06-15T07:26:02.2500000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (22, N'wjK5hypzdUAbfo25ETPm87ynzmfRxNHRBcZLntXBePwSRb67wsjWBAdqhA87e05pDpv95aUQ8Y1u+Rg+qrB3Og==', CAST(N'2021-06-22T07:26:14.0566667' AS DateTime2), CAST(N'2021-06-15T07:26:14.0566667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (23, N'sNzv4SUT1GXsNT3L0dxo76sq/7QulqWqXhUmelwSdJhk+88BrRRgzq5NdLAF6ty00nezDndZGyT6ctCXEfdxuQ==', CAST(N'2021-06-22T07:42:49.9933333' AS DateTime2), CAST(N'2021-06-15T07:42:49.9933333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (24, N'eh165/Ar8xaUrefGnESHI2hQs/mMAsSt8exnBXnTawGTscUSpcMhfoOTxdPOjGVtT/nKKWXGZ7SEgKhO1NjmBw==', CAST(N'2021-06-22T07:45:56.7633333' AS DateTime2), CAST(N'2021-06-15T07:45:56.7633333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 47)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (25, N'p0j5IM7beaSSXiyeNeNiJvrbZEdsNU/1OYx8NGdxaQIHV9hiSdPc63bgFf5pgBo7Z1Gv2phd81ZjJr37UUjqGw==', CAST(N'2021-06-22T08:16:37.7333333' AS DateTime2), CAST(N'2021-06-15T08:16:37.7333333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 68)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (26, N'x8mXUZn8erzKCS2HphTHmm6BGFfkZq7mr+lWber0g0X9kibcHyWKWNMfNV50GMCjoOTF2xT4Is5hfCRJ2EjzeQ==', CAST(N'2021-06-22T08:18:10.2533333' AS DateTime2), CAST(N'2021-06-15T08:18:10.2533333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 74)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (27, N'Po6quOmkEfX3v/eb60dKK0gvm3prdKhQQRpVcgJjI9hXJ0zYXmrqYzRyFA6ykimsoFvZWBu+FaTfOe6Q7yWtPQ==', CAST(N'2021-06-22T08:44:45.8266667' AS DateTime2), CAST(N'2021-06-15T08:44:45.8266667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 91)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (28, N'00898XXfr1BIwhtv7mxgGbkE4mkP8ahjoHxidATSex8XQh7tC7FRd/GWCejuewAidEb9zg7Wu3I596AFdZxEfA==', CAST(N'2021-06-22T08:44:59.7166667' AS DateTime2), CAST(N'2021-06-15T08:44:59.7166667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 97)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (29, N'hvffFRS4DJhs0PziZT7sUTl1Il4VzzCPLaglR+pzVcgdm8pH6eg31xa/EL62SOHhmvU884akFrEQOB07dTdCmA==', CAST(N'2021-06-22T08:47:37.7333333' AS DateTime2), CAST(N'2021-06-15T08:47:37.7333333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 107)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (30, N'+h34qpiklam+Tko6wSeO9/QLEMqy+N4L3ah6v5FUqkeGGPTrNnYBr1VQmHar6HgBE7hwNSUAc6RgFCFWldHgCg==', CAST(N'2021-06-22T10:41:27.5433333' AS DateTime2), CAST(N'2021-06-15T10:41:27.5433333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 112)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (31, N'kfr2aAHXPidgfn9J5+ePY9p59ADu44lMRhSoNb3YVwyWt74Jmd9rGYG09zTDj0KjUkpDD7bBBxkkrToenYpbDw==', CAST(N'2021-06-22T12:00:16.4066667' AS DateTime2), CAST(N'2021-06-15T12:00:16.4066667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 122)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (32, N'r8dN9l5WpxKfm/o3/AeKzSGQFuqLPR2XSlU3m7MSjM/LQfLfkpPMeRb83x1Xb8URkG1Ey/qaDG87AIm3mS75rg==', CAST(N'2021-06-22T12:05:06.3333333' AS DateTime2), CAST(N'2021-06-15T12:05:06.3333333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 126)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (33, N'LOiR0kPoKFfRGMSjGmDlMi+3lA79quQ3D8tWW/+8vJkCo06WB6tq2khDLSd7Hvqpf6MU6sOTjbpHbhuBb3Jh0A==', CAST(N'2021-06-22T12:05:50.4533333' AS DateTime2), CAST(N'2021-06-15T12:05:50.4533333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 127)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (34, N'iuyIsVYCVYHDgWYzBVmN+1Eftg+dVPMLtWyjuTYUnUwuRZBshcWuOS5KT2WyzYT7A12ET8ofTnpY7jOHN94zDQ==', CAST(N'2021-06-22T12:07:00.3800000' AS DateTime2), CAST(N'2021-06-15T12:07:00.3800000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 129)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (35, N'/hU9O0Ux3YW5/Nd3KlhlBNfZl7wd4ehs8T061W+FypLjqj2EwF0ttZ23ohhZtJhzjormqLr+lXiGhzqZvsI1Tg==', CAST(N'2021-06-22T12:37:45.8866667' AS DateTime2), CAST(N'2021-06-15T12:37:45.8866667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 134)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (36, N'srsTPIv1wB0k0xgenGP4bIZEs8wWWxAvcaWRGDBoBEBEbNp2B7vbbfobp+QwS7AhplziUAO8ksQwcNHWVxIfUw==', CAST(N'2021-06-22T12:40:01.3166667' AS DateTime2), CAST(N'2021-06-15T12:40:01.3166667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 138)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (37, N'dehfj9g0ATZgNA7zByzcSOuO+KTuhzc8Vy7GS0sP1ZG+3ZqWJ7lrOP1+P3NS3zBkwFdQr7EvkthoQDJBH7WhUQ==', CAST(N'2021-06-22T12:40:45.7166667' AS DateTime2), CAST(N'2021-06-15T12:40:45.7166667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 139)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (38, N'KG7KZ7gHAOzXXeYsiadjvkF3eLHXKZqWf8OMvL0AUDCsuTHys2iKlKO/zv3w/i11oOx2ebjlX1B8M3ukFZrriQ==', CAST(N'2021-06-22T12:41:21.3866667' AS DateTime2), CAST(N'2021-06-15T12:41:21.3866667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 140)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (39, N'inuSTlU7QaGON9rFXuX19Oyul8sqbJJY6MeXiJbKTZk0FxzN7X2WEtgEpLxqB+C0Pwch12nKV5HtJp0JT2N5Tg==', CAST(N'2021-06-22T12:42:28.0666667' AS DateTime2), CAST(N'2021-06-15T12:42:28.0666667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 141)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (40, N'6mSIFXxVIQY1Yah+bL56+HCFcoMdx4uYXTGxwOI3zCo6jco40acya1PKcnzFMKSkR79sWlV3tHPp+7CkS6OOqA==', CAST(N'2021-06-22T12:43:38.2466667' AS DateTime2), CAST(N'2021-06-15T12:43:38.2466667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 142)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (41, N'cpoHHFRZ7nqqTIAWql8o4vsh3yzCenSe8Crz//ElFGq5qQjTgYcp6rg0DuwUKlEoUB6gvbaKb/4U+Y05J0jPdQ==', CAST(N'2021-06-22T12:43:53.3000000' AS DateTime2), CAST(N'2021-06-15T12:43:53.3000000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 143)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (42, N'wZyKojVrn6nQ3UpLnDoZuvKUYC13IycnQKFr56GMO462iG++4HEtBEjHPpqOAhH2qMN5fOoc/r+nY5J9Sk/kLw==', CAST(N'2021-06-22T12:44:59.2500000' AS DateTime2), CAST(N'2021-06-15T12:44:59.2500000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 144)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (43, N'99NWQCAHzVueDtDx4se8R4aSuR7OnwvQ9DAjjmBX++tSrmyPzD8hofuNW1cWkZzCRk6DcYeFv3PBfLxDgVMKjw==', CAST(N'2021-06-22T12:50:51.6800000' AS DateTime2), CAST(N'2021-06-15T12:50:51.6800000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-15T12:50:51.7700000' AS DateTime2), N'0.0.0.0', NULL, 148)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (44, N'oUAnXdwdX75qfQJg49VOq3EUAdLbjQjhnvEzVcCChomKxZeKj2LON0yN8TW3uKzYy27GzUo+0q6ShJBLfLBASQ==', CAST(N'2021-06-22T12:52:38.8733333' AS DateTime2), CAST(N'2021-06-15T12:52:38.8733333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-15T12:52:38.9866667' AS DateTime2), N'0.0.0.0', NULL, 149)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (45, N'elqPDUpfvJLHcaqYGvDo6jw57t5xFj2HzxaxNV5T//v/2MW4PZ1ffCWIBLR/y0AygmMVbIxOO8oNj7jkkrto8w==', CAST(N'2021-06-22T12:52:49.1800000' AS DateTime2), CAST(N'2021-06-15T12:52:49.1833333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-15T12:53:26.9766667' AS DateTime2), N'0.0.0.0', NULL, 150)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (46, N'P6BgTxDqpCntpL4ZUSyi53KBQRmNtP0hske1tdltkDpnvUrGd9xshNXW1nBf13szFEBs4XSzw2hZNh50Yu6lYw==', CAST(N'2021-06-22T12:54:11.6966667' AS DateTime2), CAST(N'2021-06-15T12:54:11.6966667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-15T12:54:11.7866667' AS DateTime2), N'0.0.0.0', NULL, 151)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (47, N'ZCNqZCQyiHkVjJ2GCG8wX9b5FyvYZUF7uVqnSzGH0yufQY3tQAhtd6t3Yc+gH5NNqrzLjVWqoWsMDgVCXKYiSA==', CAST(N'2021-06-22T13:00:43.6900000' AS DateTime2), CAST(N'2021-06-15T13:00:43.6900000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 152)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (48, N'rcqVyalb8XAmBVR1iatYUyLTcuOi1kcaWVrzWgsG0evHyfREVKARqMlQIcqg72m5Vy4sUp3Q2GKpDnQBUNiAdQ==', CAST(N'2021-06-22T13:00:43.8800000' AS DateTime2), CAST(N'2021-06-15T13:00:43.8800000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 153)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (49, N'2wI1/nl/P4VLCLU9kWGbpGO+3lUUXS4SxxlthhXuSCHdbVwfNxsPK7w+HmPvimBM0uCZbfCh2qdJSdqMVn852w==', CAST(N'2021-06-22T13:04:37.8733333' AS DateTime2), CAST(N'2021-06-15T13:04:37.8733333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 155)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (50, N'ANxyzOJ6Ra7zoyZx3yDJcci/Psl4d1i3mRFJbgt9FqGr4nQCwW3evO4lSOSc59/fvjYYh4pR50SNXGwiHg5vWA==', CAST(N'2021-06-22T13:04:38.3166667' AS DateTime2), CAST(N'2021-06-15T13:04:38.3166667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-15T13:04:38.3366667' AS DateTime2), N'0.0.0.0', NULL, 159)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (51, N'XD5mOnHtpEeryTekEJ8YWe8oj52bobN5Uw+wTAdsQVm8B51Uk1lDcZiVEn5YB1klfrv0/MUy2jTQWBQp3vQxEw==', CAST(N'2021-06-22T13:04:52.7533333' AS DateTime2), CAST(N'2021-06-15T13:04:52.7533333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 160)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (52, N'ikuJ8o9qb4TVkA3ok1M2qWjqptjoOCu/2gMw3mVy9OVLWIL/WH6kQRB0XFLt/eziKQnupCaCy9isrQYFTMsK7Q==', CAST(N'2021-06-23T06:27:34.7900000' AS DateTime2), CAST(N'2021-06-16T06:27:34.7900000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 162)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (53, N'baq5ULfp83zqe/vqg5PH70I0bNr044JwnrYjRgx/rft/hdH4k3HH4yMk0HcTjrS6X+L/2fPheE0JMFxNvYaaMQ==', CAST(N'2021-06-23T06:27:35.3200000' AS DateTime2), CAST(N'2021-06-16T06:27:35.3200000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T06:27:35.3466667' AS DateTime2), N'0.0.0.0', NULL, 166)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (54, N'CqvRgwMGrL/dA0G5dWm8ofldQEy9DEcgrOz8YsnseBIapSF2jBH9P3Yr1YQLq42MrkeIINcBCrkFWiqgraugKQ==', CAST(N'2021-06-23T06:32:10.7600000' AS DateTime2), CAST(N'2021-06-16T06:32:10.7600000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T06:32:15.2700000' AS DateTime2), N'0.0.0.0', NULL, 167)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (55, N'5TulpQxGb8jbrb/iLYJM0sf5R6cwF3IpC9c1ug77KAyysfF02TFpTSM+qlxnPCIGgWYRQ+yQGMkUxpMm/SDheQ==', CAST(N'2021-06-23T06:38:55.2200000' AS DateTime2), CAST(N'2021-06-16T06:38:55.2200000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 169)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (56, N'G2LKjwomvQ3Z7CUHyzOkGrf208t5ZM8qbNcLLzm599Vm5mBjqz2YiqBrYInqM68cjCBJmQWJciNVI4lPEAWjIw==', CAST(N'2021-06-23T06:38:55.7033333' AS DateTime2), CAST(N'2021-06-16T06:38:55.7033333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 173)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (57, N'gaxNo+s69GsTzsDv+S2CQJ5fm7oo+cecbgRIqkOGZ2C4OclhyBAHm1cOZ3qFNDZYeJ4I9OH8oh/C/PJp1HIGvw==', CAST(N'2021-06-23T06:39:21.1000000' AS DateTime2), CAST(N'2021-06-16T06:39:21.1000000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 175)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (58, N'UfOxanMOtpOj13eebCNBCVkoL7s9ye2e5rPwnkzpLRs4rEAXWPi/rV4+KiAA5zcb0PIssq/p/KIrMhHY5VB+RQ==', CAST(N'2021-06-23T06:39:21.5866667' AS DateTime2), CAST(N'2021-06-16T06:39:21.5866667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T06:39:21.6233333' AS DateTime2), N'0.0.0.0', NULL, 179)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (59, N'iQnUkeAGOHGEqF/OGHvwqYHMP4HKquUdF4A5RBhCf3kYnkiRk0xQZftDka/BQrhxDhh0MTlvpG9YtF6dLuvkNg==', CAST(N'2021-06-23T06:40:40.5500000' AS DateTime2), CAST(N'2021-06-16T06:40:40.5500000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 181)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (60, N'9AMNixkXbXinKUG/odjcc2mC+7lBOPiIWe111uJugCWkZGswkSPuLGTh8JdgDWxq/eLujkuDahxbzYqHCkVGjg==', CAST(N'2021-06-23T06:40:40.9400000' AS DateTime2), CAST(N'2021-06-16T06:40:40.9400000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T06:40:40.9800000' AS DateTime2), N'0.0.0.0', NULL, 185)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (61, N'RJlbUrVz5i6shqA30c9fmxhylpdEtSDe/DVht5oKXx86hhcp4NlJaqbK3Za2GuTJT2BwjDRL/td5GplxCAA5gg==', CAST(N'2021-06-23T06:49:47.0800000' AS DateTime2), CAST(N'2021-06-16T06:49:47.0800000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 187)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (62, N'1opaiDjwd8Bo/C5cl/feyiveeT7qeTMg+LZ2D6/XtZQ8rP+hrsl9SAiIQeh7mLpS9PLw7x95LOMvZKCis6PPig==', CAST(N'2021-06-23T06:49:47.4800000' AS DateTime2), CAST(N'2021-06-16T06:49:47.4800000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T06:49:47.5066667' AS DateTime2), N'0.0.0.0', NULL, 191)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (63, N'W1J//80bqCMB9nCS9xZvl6P35RGVdIXOCKVsKsZEdnHTSUntyqfNAxHFs6MuO1l1wHN2AbG8BZPHMZYt2cqmcQ==', CAST(N'2021-06-23T08:37:53.1600000' AS DateTime2), CAST(N'2021-06-16T08:37:53.1600000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 205)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (64, N'IkcteYjGmeZUMa2+tArOCBTr/0FS8CyN7mCa+nsIGpVJuu6AM/vRwoabmAueiFLxA8MGO0u59yxePr8a++/9xg==', CAST(N'2021-06-23T08:39:10.5533333' AS DateTime2), CAST(N'2021-06-16T08:39:10.5533333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 206)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (65, N'Iq/vveVWZEJYGeUYwHiy/gJ00clcgBr1cBWAQC6CwFvCwwD9vNSlF9j82XHVaoJiZSm4S1C4CX9uAoddX93sKQ==', CAST(N'2021-06-23T08:40:07.4166667' AS DateTime2), CAST(N'2021-06-16T08:40:07.4166667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 207)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (66, N'fYBTuFlaOf7TzNh78JkhABvNzxQYVAF/8o9ewk4NbTtSUYiut2iq+SBAnWWiYndKQSFYS8e3SohGzUEepWnSPQ==', CAST(N'2021-06-23T08:50:00.8433333' AS DateTime2), CAST(N'2021-06-16T08:50:00.8433333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 208)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (67, N'dcG1HYtQVvB28WQCIkc2zPLPWxnyDxUMSd0s/6vNXRZwoYkSiMSlOYupZx4KuQOlzTESrR9wUn0XTJnjvzvLEg==', CAST(N'2021-06-23T08:52:11.1033333' AS DateTime2), CAST(N'2021-06-16T08:52:11.1033333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 210)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (68, N'X5H2SWthXH/c02VW+PwRTLVqQof2VuJoSte8e7sBs+CR4MmstE/FtUV+UubeEhd9gnG9NFa8XpF0CGRdJ8C0Eg==', CAST(N'2021-06-23T08:53:03.2033333' AS DateTime2), CAST(N'2021-06-16T08:53:03.2033333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 211)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (69, N'kHDtGkFW9TG+Gowhn21XM7qHKD/c4WeDYVUFgwdRby3D9ESQ8nRyrjSKQqJS0RwQs0raZ3VMObVFlgT8EcWHrA==', CAST(N'2021-06-23T08:55:50.0200000' AS DateTime2), CAST(N'2021-06-16T08:55:50.0200000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 212)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (70, N'IwHhNSnQW3Vyu8EINZvspl/UlSAZNLs6IdZmTVE5iJw3UuwMNqWHV8CeliGt1z9aUJkU4LKBipxZl/84RL7Ydg==', CAST(N'2021-06-23T09:01:31.9933333' AS DateTime2), CAST(N'2021-06-16T09:01:31.9933333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 213)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (71, N'GjrWpF/CXqtU5+wkrtY/r/iIMhyND1IFpPZnIYsLZUSOF08BQfuymkaMTcu9FgmN6pguskzFGhPwbEUgV7zwaw==', CAST(N'2021-06-23T09:54:26.6766667' AS DateTime2), CAST(N'2021-06-16T09:54:26.6800000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 214)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (72, N'4fTwTYdy2qMOUNBKymhRvx1h6Ldg2MVKGuI3RhWUtpQ9F8EAyxaFaJbp+mceatFUVie4beSGIPi2I1SW1Lt3WQ==', CAST(N'2021-06-23T09:54:54.9000000' AS DateTime2), CAST(N'2021-06-16T09:54:54.9000000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 215)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (73, N'0XBIH0PGmn1UoHGrDi+IjO50P+2MnaP52r2yHRBi21m9oKm5md3JCCueCedr/M0ITdX/ff4RiCCxv2GE9+vmow==', CAST(N'2021-06-23T09:56:13.3566667' AS DateTime2), CAST(N'2021-06-16T09:56:13.3566667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 216)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (74, N'CU3wYbqApMms6uNh9CvfE66UrF5tvlj4kZMX5dfbJojdMU60Zqj31dHhnGMHwO6HqItTP0/1LJJZzXgyxdGz3w==', CAST(N'2021-06-23T09:56:55.3933333' AS DateTime2), CAST(N'2021-06-16T09:56:55.3933333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 217)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (75, N'qo4PZEBVkoOQG/6gkImGRVi1cAiw+dodn+qqdlMn/EBNEf6AkXepRTqhnrAc0XoO8FyY5yI1ehWQVgAbJmRiRQ==', CAST(N'2021-06-23T10:00:09.4233333' AS DateTime2), CAST(N'2021-06-16T10:00:09.4233333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 218)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (76, N'IxztwKFWRtnywI2KJXtPsOyt+4CEQx7YVKAmlS0TOdQ15f9sLodmpfw+fzpU5JvudAQYsQNEveeYVtdZ+vix2Q==', CAST(N'2021-06-23T10:00:27.0966667' AS DateTime2), CAST(N'2021-06-16T10:00:27.0966667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 219)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (77, N'csa7TUttZ/LmuGBesGDZ5EnzFvAbymnZzMI+KU5keKeVKRdqr2gD76UzJkPmDqqamytcaQe+XthmxYnTya/PBg==', CAST(N'2021-06-23T10:00:42.4933333' AS DateTime2), CAST(N'2021-06-16T10:00:42.4933333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 220)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (78, N'cgvbQTMhUcGuB74wFy06voq9/iDaRD6TMZ8IH3vLnSBpDF0OxvH8L8cvJLQu8jE+Zofaxa0IYgyiApc/eF0ZfA==', CAST(N'2021-06-23T10:03:12.3733333' AS DateTime2), CAST(N'2021-06-16T10:03:12.3733333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 221)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (79, N'yekNwad+YoWY0pdA+GaJftp3GfI9UOXUZtgdljBygtwtUIf4g0GS5+rKVg/wECXMtMSOhIl5Sq6f51yJ4EO6sA==', CAST(N'2021-06-23T10:04:21.4633333' AS DateTime2), CAST(N'2021-06-16T10:04:21.4633333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 222)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (80, N'TMOBMjyOc6ErOLTUVBeZGoAX0Kcc6sfU9jhM9o2fVSiBrnnzEfOIvI0prvMpIevcMv+1GeFW4qnBRaLvYftmcA==', CAST(N'2021-06-23T10:06:49.4166667' AS DateTime2), CAST(N'2021-06-16T10:06:49.4166667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 223)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (81, N'JQHtdytbZp0n55LFEQgKgL97DVeWE059k6ro7lJK0dCR1m9v3/Cx1LRwxku6l7dan79+NAUxFp0w6t0L+4GtNw==', CAST(N'2021-06-23T10:07:22.3733333' AS DateTime2), CAST(N'2021-06-16T10:07:22.3733333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 224)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (82, N'lfGIZODNY3KPsqdKdweQdYeZ0hDKtKirq2Pq9iXniTDVmJRlNc23MC3H0pQr42stEa5hf4xCf37xIg+OwTspJA==', CAST(N'2021-06-23T10:08:12.7733333' AS DateTime2), CAST(N'2021-06-16T10:08:12.7733333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 225)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (83, N'QQbOM1FrgLGtUy4oBp0nL9TvhexURT/N8kIdd9pp9DD8eCOemXzecPQcej05kO8N+hP4A4alaw52EzrDyBVf1w==', CAST(N'2021-06-23T10:10:45.0733333' AS DateTime2), CAST(N'2021-06-16T10:10:45.0733333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 226)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (84, N'TmK7fEnOu4ArCkHqesC9bkp0QdxWCrt5aKluj+x5TtpTD4sTrjqVfmGPPgfHjx5PkbafS4GFyCa8fwVx8EAf/Q==', CAST(N'2021-06-23T10:25:50.1066667' AS DateTime2), CAST(N'2021-06-16T10:25:50.1066667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 227)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (85, N'zbkWOqHsPwlSHFzA3g56nLnJrp9NG8s9x/c027ykDAYWHlEVF1wnsu5XRXyVx8ML+xFZd2aZEK0JeA4DuLBIqA==', CAST(N'2021-06-23T10:29:22.8800000' AS DateTime2), CAST(N'2021-06-16T10:29:22.8800000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 228)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (86, N'2VUZkgxs+IELD0BtoMvVazfdVhu7FEErLPe9hj8jMdU4QJOAkIMIJ6u+8F2teOKixZD/+69+Ljkz923d8JHyIw==', CAST(N'2021-06-23T10:30:20.6300000' AS DateTime2), CAST(N'2021-06-16T10:30:20.6300000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 229)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (87, N'yAXK1ytPaTYolE2P/zTgfXhtnnaP8W4XTtasDg+eb1D++FNa3MHe8ft7eRZHVkGzscccsShMAcHvNGgqnqD4oA==', CAST(N'2021-06-23T10:31:31.2666667' AS DateTime2), CAST(N'2021-06-16T10:31:31.2666667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 230)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (88, N'RRxq4xGGDwWAPJK5ql3d7rUpnJPQP2JdXFgF+UNPKyCilnAT5Xcs4AxxwhaeWTC1jVRpfAzEWDhWSQgS7oOBzQ==', CAST(N'2021-06-23T10:32:11.0666667' AS DateTime2), CAST(N'2021-06-16T10:32:11.0666667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 227)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (89, N'IgaoB8izwTAH8IJ+LN/exvtnWbsh8kROhAR2BwSsa20iEACNgdfQaVam26aeawXl6XeHNFFBV/0i7Kqdum5fhg==', CAST(N'2021-06-23T10:34:01.1666667' AS DateTime2), CAST(N'2021-06-16T10:34:01.1666667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 231)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (90, N'bzLCWQ4WwmXYKCFlHK4LCQGD4uYnUJr9LRjLFf46SHWq/TLXnWxgrokJktd2A12t9PSyEyhfaUCob2ZeBCMmVw==', CAST(N'2021-06-23T10:34:23.4533333' AS DateTime2), CAST(N'2021-06-16T10:34:23.4533333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 232)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (91, N'KMFuap4vTbymjnJzfJNq1C2N5XSdhuE0MOluWxlYRIYFisOgpPXC5dHQPfaStFraoqYyxy5gX5zj/8emkvnUfA==', CAST(N'2021-06-23T10:47:51.4233333' AS DateTime2), CAST(N'2021-06-16T10:47:51.4233333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 233)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (92, N'AcTNCBAeXlFKba5M7Q2Rv/A+azVZIxqDHF+b/AKG9GH3yN0xL23g44Iq1QF4rRtsG1U6G4Srfc+4d+Th33tyxQ==', CAST(N'2021-06-23T10:47:53.3900000' AS DateTime2), CAST(N'2021-06-16T10:47:53.3900000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 235)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (93, N'LuhQ4zkmTlBVJj8WbWaeAbSCbtMmR0l99SFuT3b2Lr6fGbRdRMOFHo9cobTBfV5/aXscVDaKRVAnWS9frKpWew==', CAST(N'2021-06-23T10:47:53.8733333' AS DateTime2), CAST(N'2021-06-16T10:47:53.8733333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T10:47:53.9033333' AS DateTime2), N'0.0.0.0', NULL, 239)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (94, N'oo3g0WB9Rg5lILqVSbrY6iw7TiZw5x/pt+uarzxGcYk2Ix8pmbGzJKCB05z3OCgPFpEr1E/UGlhld/7qEVHuww==', CAST(N'2021-06-23T10:48:14.1266667' AS DateTime2), CAST(N'2021-06-16T10:48:14.1266667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 240)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (95, N'6t7KWEMoJNb7DQzZ980Xflnf0aEMxdpY1p25PjBUrFNCVKxQIsqN3E1y4afIJ3/sMjukDCkjamI8qDlJ+ihpvQ==', CAST(N'2021-06-23T10:48:14.6933333' AS DateTime2), CAST(N'2021-06-16T10:48:14.6933333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 242)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (96, N'+vsRUkzRLhEeBQuD3CR15yTvo8IeMuPYufvsFN7Ty2lVtviW05xpXphnguNsKzR5EHcMwQpKqk3fHBu/p5e5rg==', CAST(N'2021-06-23T10:48:15.5633333' AS DateTime2), CAST(N'2021-06-16T10:48:15.5633333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 244)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (97, N'MnyvO1LNpvcIBiMMC34xYX/OKYn6qcW5aF0l6TEOsRktHPK2trkTTR9ffo7gtrg1TzlK7le7w+T3WnDydcIwYQ==', CAST(N'2021-06-23T10:48:16.0766667' AS DateTime2), CAST(N'2021-06-16T10:48:16.0766667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-16T10:48:16.1100000' AS DateTime2), N'0.0.0.0', NULL, 248)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (98, N'kIpuSI7VTOCBRcfVif/w+r6K8i/fXHhVmnG02T/ufEQs1JYWi3ghvISu1vs+q97b3e2PbR5RiUxOELJLJhsbGw==', CAST(N'2021-06-24T06:46:24.7866667' AS DateTime2), CAST(N'2021-06-17T06:46:24.7866667' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 249)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (99, N'5getwvRFrR6B62Ic01wYajbiNtMM4IRnALikndAfeCG2fyq5JdpD1VeN2xt7dJ4EeWz7NP/J4dNb30GrLxDkYw==', CAST(N'2021-06-24T06:46:40.4333333' AS DateTime2), CAST(N'2021-06-17T06:46:40.4333333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 250)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (100, N'QoEbZS9/JuU2Aidhq27hmEza6zKfjYLhCNjzWuvk3VzARSauwn8/ihtY7RKMFSlT3FL9k7sYky+pNMEJzsn/tw==', CAST(N'2021-06-24T08:08:56.7533333' AS DateTime2), CAST(N'2021-06-17T08:08:56.7533333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 253)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (101, N'lRXRO6WLoQrQHwWee6j4Wigejc+6yzhAkYXLnUmO++rzFBVGro0dzxYrADEY3z0HTch2V4L94CXlqCMrHuwWMw==', CAST(N'2021-06-24T08:08:58.7833333' AS DateTime2), CAST(N'2021-06-17T08:08:58.7833333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 255)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (102, N'd18velofRRgeGWdYxXBsgfvqNwDCZMPqVj3YfBxF7Fx4Y4ur15d6BOA+LoBETPX4aE7Gr5fL9Nm2028U4EGCww==', CAST(N'2021-06-24T08:09:54.0300000' AS DateTime2), CAST(N'2021-06-17T08:09:54.0300000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (103, N'yM4CfUq6gJdZSnMk2i+lyGFova5OQ+gH9dZqbu5NYxslxeKDHxSfZ8s9yazFuuJdYYmSSmwWWrc6uVzmYMx1eg==', CAST(N'2021-06-24T08:11:04.5000000' AS DateTime2), CAST(N'2021-06-17T08:11:04.5000000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (104, N'cWIZzhIQLwsWN5qzclovpXyb5SO/l9V/bBd72NYNgmGNbiHzQmh5kQ6g2JcAH5sX0C+Lb5s+luOAw9uqZn2qxA==', CAST(N'2021-06-24T08:11:40.1966667' AS DateTime2), CAST(N'2021-06-17T08:11:40.1966667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (105, N'wGz4q1xMZh/IK0D4ROQXBCltrhfIMTNrRBiG09BibdiBqo8VdWox8tV+/9XogKaK0Bml7Tq+lgVaO5Oez+suVA==', CAST(N'2021-06-24T08:15:41.4400000' AS DateTime2), CAST(N'2021-06-17T08:15:41.4400000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (106, N'hYsZf+3sUjvmc2eivoWkTRX7iF+DTj6EVJKDxz3q4XlRc19bOOgLy4nOtlL0kGRlvg0rbvZWZ/otW0DaDf8hYA==', CAST(N'2021-06-24T08:15:56.4900000' AS DateTime2), CAST(N'2021-06-17T08:15:56.4900000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (107, N'sKt8bUokrP/rjkgMc5jAG6q6Q0K/85aDNZCID2d+attWR526MmMLZAS+pZ0YZzaZP88JKvcJtzaRQJpYXdj6IA==', CAST(N'2021-06-24T08:32:12.4600000' AS DateTime2), CAST(N'2021-06-17T08:32:12.4600000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (108, N'gueTOdHvhz8IhFIKHdxe6F3+1Mv110rhho1la96x29rk6JNB/jAxet91IJdtp0r1AUeoXmVTzmghmgEUMFbUFw==', CAST(N'2021-06-24T08:48:53.3500000' AS DateTime2), CAST(N'2021-06-17T08:48:53.3500000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 256)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (109, N'xuLUvRo6Eq+zd/Er9K50SibkVJ2n2UCrx0ATbg1Wu834WJVGwgKXbvwbyfmI3VB0piPo52vR+6DUpNvTGvdAow==', CAST(N'2021-06-24T08:48:55.4366667' AS DateTime2), CAST(N'2021-06-17T08:48:55.4366667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 258)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (110, N'qZxTlA9UjB/zmFInybD95aZEhSrhJTsq8QCDBbY6vvUTmw0c8nbsM3NzM1x3BDXRLjYHTjZEAHseIeQCSF9OnQ==', CAST(N'2021-06-24T08:48:57.1966667' AS DateTime2), CAST(N'2021-06-17T08:48:57.1966667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 260)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (111, N'gF1rGj80TG9WlyE6M46pVl3v5vfEZFbZiVSOaT9TyNAEXoVHYYHKSjY8S+6IaEZBTs5gO/vLnyGGpmS/0aBjuQ==', CAST(N'2021-06-24T08:48:57.7066667' AS DateTime2), CAST(N'2021-06-17T08:48:57.7066667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-17T08:48:57.7300000' AS DateTime2), N'0.0.0.0', NULL, 264)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (112, N'0hstJdLGsoS8z4rRaoeBDZbylRo62syyoBBFktUDlLPE27MAWgg8E1EX/fUUVN9BbhpRaTwLndrK/LkqpNMHMA==', CAST(N'2021-06-24T08:51:27.5666667' AS DateTime2), CAST(N'2021-06-17T08:51:27.5666667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (113, N'leShp/0r/dNQ0lD2GHAFb99Kbgg07wll2J4F1uzqNtPuSGdSxL8SlpAIx0//liMG2zh1mp2Ddo8avjGLXS2lLQ==', CAST(N'2021-06-24T08:57:06.1266667' AS DateTime2), CAST(N'2021-06-17T08:57:06.1266667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 265)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (114, N'bdcQvATYrGOM9Jaw+tdRRCYOqIcYHkeEU9pllVvRjtg/hTIqCgu7fdov+AxAVwpnTkxRTxyC4W36KA/xX48law==', CAST(N'2021-06-24T08:57:08.0566667' AS DateTime2), CAST(N'2021-06-17T08:57:08.0566667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 267)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (115, N'NOa9qr6J/8Ui4GUkrzKLR7aDXBIOrZZwcVhHIa+mwYu992Dthy07m4ZqeSkCRaCLg8H/q8BCOs75vJBHdALn/Q==', CAST(N'2021-06-24T08:58:02.2166667' AS DateTime2), CAST(N'2021-06-17T08:58:02.2166667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 252)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (116, N'8craiEfbliXGg3Wbt/GzjcwXxlrWR4+dmpS5ea4ZjWYboVBIKE8zy68dbO+xp5UCQtXsjZ5mcSO5FxZgnzoGfw==', CAST(N'2021-06-25T07:31:34.6366667' AS DateTime2), CAST(N'2021-06-18T07:31:34.6366667' AS DateTime2), N'0.0.0.1', CAST(N'2021-06-18T07:32:46.8866667' AS DateTime2), N'0.0.0.1', N'vBc1aWTmVVFQk3nVI35epiWatG7tRWCBNkLPpDbbmM/hXX0uSk8Ht5bLQx/Ua9OP7QeiL0vEzHdzlUvGxS2uUA==', 227)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (117, N'vBc1aWTmVVFQk3nVI35epiWatG7tRWCBNkLPpDbbmM/hXX0uSk8Ht5bLQx/Ua9OP7QeiL0vEzHdzlUvGxS2uUA==', CAST(N'2021-06-25T07:32:46.8533333' AS DateTime2), CAST(N'2021-06-18T07:32:46.8533333' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 227)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (118, N'L6ZcH09qE1VvEbSRfg0P/QcVc2xKuX/1CYDTYr/nJwUlTlGSoEUI7U9ZivjZC4r2nHwmR1UextIrW+KRfANPhA==', CAST(N'2021-06-25T08:24:38.7533333' AS DateTime2), CAST(N'2021-06-18T08:24:38.7533333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 268)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (119, N'47tVLI3vn1niMXT9Rg9n4+gKF+pKi5ePrzY3KUFPfos/3oKjKrNGIShRsT8005YEpcV7Z88Ya9bhRnrBwgg/RA==', CAST(N'2021-06-25T08:24:40.8700000' AS DateTime2), CAST(N'2021-06-18T08:24:40.8700000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 270)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (120, N'tolU88fJLVSbvvJn1WPLFwYsYWt4PPPNzND98Z6+PUrfn5VP57iXPqiVajt9mt+O/LVBVOzPD+h2I/Bcu56cig==', CAST(N'2021-06-25T08:24:42.4666667' AS DateTime2), CAST(N'2021-06-18T08:24:42.4666667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 272)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (121, N'3UOiCoj8dwfjvipTlFEAPphrhC10pkDK+PyC0QDRlmthR50KF8sLOGF7kcTmCrDbzlwrV/SYDkjUGuUZB21eHg==', CAST(N'2021-06-25T08:24:42.9000000' AS DateTime2), CAST(N'2021-06-18T08:24:42.9000000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-18T08:24:42.9300000' AS DateTime2), N'0.0.0.0', NULL, 276)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (122, N'JZ8oQMfo4u6quMVdRaPplUtpJTTJ1/xsGLJyPl2xmxmZsFtfkfydtxDxPrSspMoEdPjYULk4c6EBFZqDUckdKA==', CAST(N'2021-06-25T08:29:45.5400000' AS DateTime2), CAST(N'2021-06-18T08:29:45.5400000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (123, N'14sWbEipE8rKn8TYK4Cp9j/ZqciUZnCE/ADcDO/WVdOPIMmRDxNuNVLb50tPAPIAEwBNvUA28HMhU3LgPLetfw==', CAST(N'2021-06-25T08:31:30.4866667' AS DateTime2), CAST(N'2021-06-18T08:31:30.4866667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (124, N'whxm+k1cMJiyg650pOcLNMl9/6r/AOe2wafnj21JB++uWqqlJjnG/jCnHg6sfI/CmfevUHOmkfp2smoEFr9H9Q==', CAST(N'2021-06-25T08:49:23.7866667' AS DateTime2), CAST(N'2021-06-18T08:49:23.7866667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 279)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (125, N'eiph3eqrwkakLeJO/Uo7dGWn5VdpWmI+riCTj6dRrEQVTPVRkDuD/fdN6qz+z2gH7TfCFiEb/kdgJhDdd2L4MQ==', CAST(N'2021-06-25T08:49:25.8500000' AS DateTime2), CAST(N'2021-06-18T08:49:25.8500000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 281)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (126, N'+MzLmxM1OH+QCsDee33DHhrLpE+5auq2sPpfM7i3GlE3qw9wkUtyclnkhRA/p/bkTYv9pLAJbSddjSJg1mTYSw==', CAST(N'2021-06-25T10:02:17.3733333' AS DateTime2), CAST(N'2021-06-18T10:02:17.3733333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 282)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (127, N'g49w5rnAIxSt2gL4/N7uHl+qC8fl/uJwnVOA6iBDdNhPD+6QdfZb8efWGaSeFJgyyGeGdwCFY/4X+80mngulSg==', CAST(N'2021-06-25T10:02:19.4500000' AS DateTime2), CAST(N'2021-06-18T10:02:19.4500000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 284)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (128, N'7GJR8amCvyn340YbH5k/JCNaSYSfTNgcG7aJAMGnY0LOBA5tMgVCP6zmLuCAu7WeApUeV6FsKvHlhfLsvFQfAg==', CAST(N'2021-06-25T10:02:57.8433333' AS DateTime2), CAST(N'2021-06-18T10:02:57.8433333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:03:17.4133333' AS DateTime2), N'87.116.23.185', N'LuV4Ej3i7RkXmrgINJcpOEzwermlkCP2PUlYsK1N7pNSVx0JW3+TKCoxNLBj9wfCrZn+kkfWGe4WQYD3tI5zuA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (129, N'LuV4Ej3i7RkXmrgINJcpOEzwermlkCP2PUlYsK1N7pNSVx0JW3+TKCoxNLBj9wfCrZn+kkfWGe4WQYD3tI5zuA==', CAST(N'2021-06-25T10:03:17.4033333' AS DateTime2), CAST(N'2021-06-18T10:03:17.4033333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:04:15.8666667' AS DateTime2), N'87.116.23.185', N'Za6dwfDkDL/xj6IbZIqXLLuQZG52DDstNYi21SqQY2rsnOgkE++kQq1WuQzUCebh+c9E6NBxZ26D02jPfUHxRw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (130, N'Za6dwfDkDL/xj6IbZIqXLLuQZG52DDstNYi21SqQY2rsnOgkE++kQq1WuQzUCebh+c9E6NBxZ26D02jPfUHxRw==', CAST(N'2021-06-25T10:04:15.8600000' AS DateTime2), CAST(N'2021-06-18T10:04:15.8600000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:04:37.3566667' AS DateTime2), N'87.116.23.185', N'pPVbNX00MmMIXDXfY7fJ8qPrEhPhIdruSoGYBMQVLwKDhtxf7D5OxRAZnIoXw1ccy/HYo9CXIEuwLHRGhGPz5g==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (131, N'pPVbNX00MmMIXDXfY7fJ8qPrEhPhIdruSoGYBMQVLwKDhtxf7D5OxRAZnIoXw1ccy/HYo9CXIEuwLHRGhGPz5g==', CAST(N'2021-06-25T10:04:37.3500000' AS DateTime2), CAST(N'2021-06-18T10:04:37.3500000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:05:16.3733333' AS DateTime2), N'87.116.23.185', N'P3Hl42rn3i+W0+FuXVA60uyuJ70m+vfa0ZUHhP6W0P7/e3aDz1mFGIZsf8uzSlqqSNTLBEfoOuRLgJprK/FNDg==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (132, N'ZcLeP3rx4vpcw/y5KENh94Qw85Ef+Sds3F65J7K/XKGzQATvdxTl5QbyjlyHto9kdr1GwTQtsm5KH6DnSSrWbw==', CAST(N'2021-06-25T10:04:42.7733333' AS DateTime2), CAST(N'2021-06-18T10:04:42.7733333' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (133, N'P3Hl42rn3i+W0+FuXVA60uyuJ70m+vfa0ZUHhP6W0P7/e3aDz1mFGIZsf8uzSlqqSNTLBEfoOuRLgJprK/FNDg==', CAST(N'2021-06-25T10:05:16.3666667' AS DateTime2), CAST(N'2021-06-18T10:05:16.3666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:05:30.7733333' AS DateTime2), N'87.116.23.185', N'vty3LZEf379eS5Ar8CF8/XG+oO3koraro2neLxlsZb2fBf1M2DBQLDyt5FgwiGPqqagGlVzfg0TPOzs1ebLIAg==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (134, N'vty3LZEf379eS5Ar8CF8/XG+oO3koraro2neLxlsZb2fBf1M2DBQLDyt5FgwiGPqqagGlVzfg0TPOzs1ebLIAg==', CAST(N'2021-06-25T10:05:30.7666667' AS DateTime2), CAST(N'2021-06-18T10:05:30.7666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:07:21.0833333' AS DateTime2), N'87.116.23.185', N'fSEiZChDBUHKJTRMotGYbs3s4mBrWost641y0XXlLyPzDVjXg11szInBsqMO3SwvcV7/W+Yc8efeQdkA5v3qKQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (135, N'fSEiZChDBUHKJTRMotGYbs3s4mBrWost641y0XXlLyPzDVjXg11szInBsqMO3SwvcV7/W+Yc8efeQdkA5v3qKQ==', CAST(N'2021-06-25T10:07:21.0766667' AS DateTime2), CAST(N'2021-06-18T10:07:21.0766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:10:32.3066667' AS DateTime2), N'87.116.23.185', N'bskLxaeO/O1EzWKWpn6+X4QZaPU8/d9gI9wV/cbCO8nR0q41hD3EMyW/cIqAxMGDu+5sBw/VU65exRi3oPxuqQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (136, N'bskLxaeO/O1EzWKWpn6+X4QZaPU8/d9gI9wV/cbCO8nR0q41hD3EMyW/cIqAxMGDu+5sBw/VU65exRi3oPxuqQ==', CAST(N'2021-06-25T10:10:32.2800000' AS DateTime2), CAST(N'2021-06-18T10:10:32.2800000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:13:06.2166667' AS DateTime2), N'87.116.23.185', N'h+ErIenkVMlSfGJRxK0xHTSpIThkic1NxkA0UgbpKIFhBvhiCMkt1Q19V2cD9yZPAq5Oh3hgPOEZM24wjThC4A==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (137, N'h+ErIenkVMlSfGJRxK0xHTSpIThkic1NxkA0UgbpKIFhBvhiCMkt1Q19V2cD9yZPAq5Oh3hgPOEZM24wjThC4A==', CAST(N'2021-06-25T10:13:06.2100000' AS DateTime2), CAST(N'2021-06-18T10:13:06.2100000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:21:10.0100000' AS DateTime2), N'87.116.23.185', N'ueh2edvZlgjDpTHQzPFUA3csDxhqlagjEW+EoCRC1+KhGy4H+OHRqc/UakheTP+aEs0341bXyNnBpxgFtZ+54Q==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (138, N'ueh2edvZlgjDpTHQzPFUA3csDxhqlagjEW+EoCRC1+KhGy4H+OHRqc/UakheTP+aEs0341bXyNnBpxgFtZ+54Q==', CAST(N'2021-06-25T10:21:09.9700000' AS DateTime2), CAST(N'2021-06-18T10:21:09.9700000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-18T10:21:13.4600000' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (139, N'Jqz91VoiMY3GOKgkUGUZukC1h2YmLiDja/tCEHlrZQL8RsUg/ovTJkz8F+bpSOWMGL9N5tkaHN4E4A5joQEsww==', CAST(N'2021-06-25T10:31:47.6200000' AS DateTime2), CAST(N'2021-06-18T10:31:47.6200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 285)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (140, N'R83XcIZ3aZWaDW6+le4QKoe691CtFi7ZubAFNCA7ClJSiosUKyQex+VzHnlzWqN9zWJ901VTLnKDbR+O8v7emA==', CAST(N'2021-06-25T10:31:49.7133333' AS DateTime2), CAST(N'2021-06-18T10:31:49.7133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 287)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (141, N'MaPtRrexqP0Bo9jod4UTrSJu0v7e0c2YlAK6UuJNvOx0hcI2J5YV2M2ETDAz+tnW+7yWYOkrh83aCAGoviM8BQ==', CAST(N'2021-06-25T10:31:51.2100000' AS DateTime2), CAST(N'2021-06-18T10:31:51.2100000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 289)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (142, N'OEzeK2WPushQa6cxUHb2IGNoSOTa/ZAkU9LWuCvZZyA011moSoMuXdnH8qJvhmBRx4C9TjLan5NJz+jdgTYWdg==', CAST(N'2021-06-25T10:31:51.6166667' AS DateTime2), CAST(N'2021-06-18T10:31:51.6166667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-18T10:31:51.6433333' AS DateTime2), N'0.0.0.0', NULL, 293)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (143, N'BTjNvJNFyJzS3SHBXmekL24XGdA6qmwgGvexdu2fG+/Oqvnu03NYixi40LreC4usSIdZydFYw+/KRaM5PvdaJg==', CAST(N'2021-06-28T06:31:50.5466667' AS DateTime2), CAST(N'2021-06-21T06:31:50.5466667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 295)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (144, N'6F6OmrhumD8+eI2w/J65Ap7BvW/BTu/PteZ6o7EAOHNGb7iP92JH1pjxHta2CzDnjagh1e+y8J42Yn0zE/PGCw==', CAST(N'2021-06-28T06:31:50.9133333' AS DateTime2), CAST(N'2021-06-21T06:31:50.9133333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-21T06:31:50.9366667' AS DateTime2), N'0.0.0.0', NULL, 298)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (145, N'PURFOkdOKkdHKknjz6Qz5Uv+PLJt8YGIH4KCnb+CERYZy1/8sMvG7hxylfYAhi21SxgQHORWGQcMm0UzKht9Mg==', CAST(N'2021-06-28T06:58:28.4933333' AS DateTime2), CAST(N'2021-06-21T06:58:28.4933333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 300)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (146, N'Vz+iq43sVy7M3T7Mqsu9pOeBWsklx0EfyDy1HUKnswqbuSXPDyYrFa7IyKUuLmCrcX4TpzPIdNJz+8p9qR8u0Q==', CAST(N'2021-06-28T06:58:30.6000000' AS DateTime2), CAST(N'2021-06-21T06:58:30.6000000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 302)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (147, N'IYKuBYnO3P/3J9j9FGS7qdIRXcDQKxlaolO+jqaRd4VRdWqAi67cUfyjdocab2a44aQBJxMCduKbL9cdKtoo4w==', CAST(N'2021-06-28T07:03:37.5033333' AS DateTime2), CAST(N'2021-06-21T07:03:37.5033333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 303)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (148, N'TE0UxwyfWpEafcJIeMGInObFwe6NbQg4xOlO0uGId+VOKWlKriScjcryMXZXOzXB+PCv23zIo3enmxGo3iCBGw==', CAST(N'2021-06-28T07:03:39.6233333' AS DateTime2), CAST(N'2021-06-21T07:03:39.6233333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 305)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (149, N'nPWZq0+Pm2UXwgVTIhKndPk6aarmK8vT6g4tRGi7yej4wzlmPwm5M0bOGjdvWimjOtH4E4CM1SBmKj72p6bUVA==', CAST(N'2021-06-28T07:16:42.9700000' AS DateTime2), CAST(N'2021-06-21T07:16:42.9700000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (150, N'NpGS1kxpWi90+qIGEpghwUUK8YIbtknTpi0/ykOdX7iDg755yU9iG4vBKJP8FEz92Aypl59yrxiLuvWlPxhdxQ==', CAST(N'2021-06-28T08:43:31.5066667' AS DateTime2), CAST(N'2021-06-21T08:43:31.5066667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (151, N'/78GVULHSyzG7MLALmk6Fb+vkKDUNTFL2kig6MRE5GuzJAgiJ7uV73UjQK88c+Uq0cZXtmxI2pku8omZCXZESw==', CAST(N'2021-06-28T08:46:23.5633333' AS DateTime2), CAST(N'2021-06-21T08:46:23.5633333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (152, N'cM4mzMmTJMPkcxaJx5EufwbbTZSG10mgYy6GfeKd/jOnnUMfhp7BQO6aV8XYz5ZuKVD963V17IPZtLhHJPl87g==', CAST(N'2021-06-28T08:49:00.8266667' AS DateTime2), CAST(N'2021-06-21T08:49:00.8266667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (153, N'cw/4et88ThhFJmukhiHwYVRLwYjWJBg60V+cE5Pgny4rhz1feE6VjmPiabloBmetzVAMByWgq2JQpWTD3YhztQ==', CAST(N'2021-06-28T08:55:49.9400000' AS DateTime2), CAST(N'2021-06-21T08:55:49.9400000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 306)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (154, N'O7SawSTbtkQR5TiVdqvntFI4jg91WXz7vWAL/1ARGLQUSnAjEIttRBpp2Mm3IN3B/IDLS/rkRuG3Sh7u/sgamQ==', CAST(N'2021-06-28T08:55:52.0466667' AS DateTime2), CAST(N'2021-06-21T08:55:52.0466667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 308)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (155, N'M1Od3CiCv3foXsMaBmAnOogNP7iHW8tW595dNh/5BHPn9EVLn8Pc8WhooJ5t2NiTg4ZVRgEnTkCV2+65/Xj4Wg==', CAST(N'2021-06-28T08:55:53.2333333' AS DateTime2), CAST(N'2021-06-21T08:55:53.2333333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 310)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (156, N'h5bqOHhT+DPkG+k1tsk5rEQ3HQVtAhHaorjmqgygLGUSqOg++MRDbKqEblxCkYAkMFpB/c6FdKftE8nrEXqE1Q==', CAST(N'2021-06-28T08:55:53.6266667' AS DateTime2), CAST(N'2021-06-21T08:55:53.6266667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-21T08:55:53.6466667' AS DateTime2), N'0.0.0.0', NULL, 314)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (157, N'64mHkfdpmNSf4ivfKGSGWRGuulZ/OgUa2Noz8A0/BB+sTxAZdv8EVf9tHyUwl249CRXvemvtsynDVSqSL2Ofcw==', CAST(N'2021-06-28T10:02:45.4266667' AS DateTime2), CAST(N'2021-06-21T10:02:45.4266667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 315)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (158, N'wFj+aC4xnUvF5qlh8s3PW6waPC3R0kKJcunWcmam61WA+48tnR+JRfDxcebPQ3hty9acJzVPipRXr84xwEYDvQ==', CAST(N'2021-06-28T10:02:47.5800000' AS DateTime2), CAST(N'2021-06-21T10:02:47.5800000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 317)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (159, N'L/NVa++7Wnf/ILRlGoBAbfK4jSQDUIBXk4ztK8z0Qw/gyl5scpVafmQWzaOEoj4L1FrjNMYPc8B9RD1N1sE+fQ==', CAST(N'2021-06-28T10:02:48.8366667' AS DateTime2), CAST(N'2021-06-21T10:02:48.8366667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 319)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (160, N'JryItia8ubfjzMDH9t2PLBD5g3W26sk8IxHvf2bT274cCJ57BKrBZy9oWZBUuiYoghe/wmjs2HXoXumU0ppE/w==', CAST(N'2021-06-28T10:02:49.2500000' AS DateTime2), CAST(N'2021-06-21T10:02:49.2500000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-21T10:02:49.2733333' AS DateTime2), N'0.0.0.0', NULL, 323)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (161, N'OINuY3O6Vpfpv1nJUTR/7Ru6ybClRFyS0dDuNTrrt4kxGkVV52UcZ+Sh4MEvkKPPc7+7bUaCkk8elxC37a5ZvA==', CAST(N'2021-06-28T10:33:38.4566667' AS DateTime2), CAST(N'2021-06-21T10:33:38.4566667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (162, N'e0xgiKsm1dXVulqaP6uSM4I2A+elLADipWV35kc0n3fNUvyO6HRRe58tYuCo2IyXQkCCxLNzZYQTLFKRqOaI7g==', CAST(N'2021-06-28T10:34:37.9700000' AS DateTime2), CAST(N'2021-06-21T10:34:37.9700000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (163, N'0ZEGmI3DtOc1UbhKfbS26AVANk6nPhf1m75D2s2+dDhJ+z5ssIkpyDDeVtUw1U2DD18QTmTz2ZQG6FvdK99lrQ==', CAST(N'2021-06-28T10:35:27.3466667' AS DateTime2), CAST(N'2021-06-21T10:35:27.3466667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (164, N'oI2p8jYuAA6r3w8vENh2LCWQzC1yInHEUZJAffPP1y4CjtjrVxZri5+O2/JOI92aBBpw4u3JIQtqlY+ec3KlUA==', CAST(N'2021-06-28T10:35:28.0900000' AS DateTime2), CAST(N'2021-06-21T10:35:28.0900000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (165, N'R9dmZcZQLjbgJDH+ZeuGjKsMM+2dVSlnYLFDtFKOo0fYSQEYzfQwLy6XPQn7IY0Rl6Wy8zwCVNe4bz2hFH5m8A==', CAST(N'2021-06-28T10:35:28.7900000' AS DateTime2), CAST(N'2021-06-21T10:35:28.7900000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (166, N'Ku05oGpbC+l/U2S5swPU+J9aIxV4vEoGSa2aoBWOvbmhKGJV41vJk8T/gcveSbMa+cIFDMzhip000lBTPLHL2Q==', CAST(N'2021-06-28T10:35:29.4833333' AS DateTime2), CAST(N'2021-06-21T10:35:29.4833333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (167, N'c3GJHJ5hxhq3s8eh8s8e8+3L5WAbaHD37uftxISyEU/eiQP0MKVImowjO2XEyXZ6JXmE6TqWA7sKbAF4wij5iA==', CAST(N'2021-06-28T10:35:30.1533333' AS DateTime2), CAST(N'2021-06-21T10:35:30.1533333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (168, N'VX0CSHRkeMuFVaJqAdEoyXnm8NF5TC0RZpSxJS8U978Cp1IAdx7NI1wvFsvJV/pSvVmSDRw0pMVVyi0tU0+o9w==', CAST(N'2021-06-28T10:35:30.9333333' AS DateTime2), CAST(N'2021-06-21T10:35:30.9333333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (169, N'2+8MZsrFkoOl0l7GgSXPIkcGzekRJx6se+gIzvU4fWv+cu1Kk5okuidRTCUenXUeaeZvSPXmtilNK44D3nelog==', CAST(N'2021-06-28T10:35:32.3800000' AS DateTime2), CAST(N'2021-06-21T10:35:32.3800000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (170, N'Rrm6EJlaDOAFQbx++bYWefRMFhwrRUwA+UBuYFJT8jgE0IM6BKUPqbJ39Zu+7RcXY78oQr2HchZWPyrDEKdgjw==', CAST(N'2021-06-28T10:35:33.4633333' AS DateTime2), CAST(N'2021-06-21T10:35:33.4633333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (171, N'bZ3JAVbBrJ9OiqNtlSMbhjThklmfojoYrtpwsZoCN4jdOvBQv00QjxpYO/3mSzP6vub69EgEFPvNnMjWUKatfA==', CAST(N'2021-06-28T10:35:34.1800000' AS DateTime2), CAST(N'2021-06-21T10:35:34.1800000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (172, N'4SS2CmQixapeOEodhyoffkbXF8rBoQgMvu+WBN6orFGuVFFXRgTBd8Z1SwgTlbgpnX5KobveoiPoJ09PNjCc8Q==', CAST(N'2021-06-28T10:35:35.4533333' AS DateTime2), CAST(N'2021-06-21T10:35:35.4533333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (173, N'wRIDuIcYGkZtOzoNJWdrPl0yYJKqRmrKwNiosRBALSPr2GegbEXm3+64KAeTTqBZy62KoY5wyiou0Ujc7UFYAg==', CAST(N'2021-06-28T10:35:36.1700000' AS DateTime2), CAST(N'2021-06-21T10:35:36.1700000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (174, N'Wy23r1Tu1SN41oz+BqGXkYhh+ewoFo09r3Xy8wlXf5qnk3hjolBWOUqIPJqExbzPVqOXphno6KoescEcnlKLBQ==', CAST(N'2021-06-29T06:48:06.1700000' AS DateTime2), CAST(N'2021-06-22T06:48:06.1700000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (175, N'9t4r93TR0oIRQ7/Ny9knkO1lETVEVYDMLnTJzwagnfhMmFp4Irl8zSIXVIel5WtJvaoy29MXuyWK0rKG6XeHBw==', CAST(N'2021-06-29T06:48:07.1033333' AS DateTime2), CAST(N'2021-06-22T06:48:07.1033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (176, N'5q/o11DeqWCRMTHmEZ7Zvbsx8VmzhTQW2utwtEKHYk+J8jhaQGXJtzV9UW18VqY1Riv8ViECFkiYM/G17isKFQ==', CAST(N'2021-06-29T06:48:07.8433333' AS DateTime2), CAST(N'2021-06-22T06:48:07.8433333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (177, N's0fNYLnxRjOQTLOM5A0EyJnSsfUAf1pY+rnTFs7gUmze2DqY/yrAu/v/ZjTecm8/njEpAGBAPqnGGyKKDr6/HQ==', CAST(N'2021-06-29T06:48:08.5733333' AS DateTime2), CAST(N'2021-06-22T06:48:08.5733333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (178, N'HALbquYfSAHKcrz0nzG8vWewoY1YkK+BUg0SQYmNf2kbveQfZycqsTQOQQm6sH5ZHVdz3lTlOhMexlslq2SfDw==', CAST(N'2021-06-29T06:48:09.2900000' AS DateTime2), CAST(N'2021-06-22T06:48:09.2900000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (179, N'u+kilV6R61E8gJmIHHTdEm00guNAImbg1N8CBnBSLPLQptyJIE0C4cPkFwkhgMN9Eq6fgDwnOpsqmdcP1EJcqA==', CAST(N'2021-06-29T06:48:10.0733333' AS DateTime2), CAST(N'2021-06-22T06:48:10.0733333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (180, N'VJoWQi66Y3JnGL5WtllTL0vi6smItflZKRl2VnCNsxfST4OxBDFctUatN0H1VapLfAjD1vQk67bOxRKEdszE2w==', CAST(N'2021-06-29T06:48:11.9333333' AS DateTime2), CAST(N'2021-06-22T06:48:11.9333333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (181, N'lRXMNdC/NL5cDiZpjuiP0sHjOZjwg+As5OWcqtBcRjcOGue7R5TS8z6zvAQaKFKQgl3ACjgdpW+W4Q/AOsDfKQ==', CAST(N'2021-06-29T06:48:13.1866667' AS DateTime2), CAST(N'2021-06-22T06:48:13.1866667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (182, N'OWaC18UCIL4NsuHX2ulndVt4W+swH0SeFlffCxi04GM1PUtMzVGfUOvYtv/+rwmq0zA1vFn09rQfRnWmwwl5OQ==', CAST(N'2021-06-29T06:48:14.4333333' AS DateTime2), CAST(N'2021-06-22T06:48:14.4333333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (183, N'VhESSKxvITr+sr6nRRsmOtKwoyWN46v+ATZrZFZg+nAKyPEUiAI3i5EZ/Ta51GgFBPiGzPotI+9RhmOY7lBlDg==', CAST(N'2021-06-29T06:48:15.8200000' AS DateTime2), CAST(N'2021-06-22T06:48:15.8200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (184, N'VWLkrDA6NbV1w4683bT3k1gux/Kfb72YDp/7JaqgR4H/CL6QQCkZ4UMH9gysYASi/vA9iGXtnfdgOLK+GkuRRQ==', CAST(N'2021-06-29T06:48:16.5266667' AS DateTime2), CAST(N'2021-06-22T06:48:16.5266667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (185, N'74J7Eee4yBbnTm3Pl7z8l3BJPrsB9jw61HSgcH/oln8PmjNCds2oUkY8khX6F7qM5xwWWQWm5HRUoZQnOOVXRQ==', CAST(N'2021-06-29T06:48:19.9133333' AS DateTime2), CAST(N'2021-06-22T06:48:19.9133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 324)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (186, N'YxQX/Rtk+GqqGDo5/18luf5tZ907WPDEHUsCRnAhT7GShjneZKLkNFo+i3BFFVMiV67nAuqEvPgvwxl1RG4Lig==', CAST(N'2021-06-29T06:48:21.9566667' AS DateTime2), CAST(N'2021-06-22T06:48:21.9566667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 326)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (187, N'eP1j/ooJbPHZo/S5THCISUG2KpA6b+cUSvhpvMhkgUDERdD8qkCWBkjM7nFp4XylxYXkPlEwQ54fX3P28aVttQ==', CAST(N'2021-06-29T06:48:23.4400000' AS DateTime2), CAST(N'2021-06-22T06:48:23.4400000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 328)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (188, N'W830ZLfXRLbdvsHCP6L5W/bym2Owvnbnjy8vaEniRCA2hqJouJc/ZXxv/K8rbWWo4X/MMhNdJGW9CHDeWJdnrg==', CAST(N'2021-06-29T06:48:23.8300000' AS DateTime2), CAST(N'2021-06-22T06:48:23.8300000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T06:48:23.8533333' AS DateTime2), N'0.0.0.0', NULL, 332)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (189, N'wUNKjPMyBU/I9PX6epuDp9WVNqSoWMoGymNGWrctKAeg8gwWXhqUjnOCKrxzSV/pEYdOxax2oSiNB16kjV73EA==', CAST(N'2021-06-29T06:49:12.5633333' AS DateTime2), CAST(N'2021-06-22T06:49:12.5633333' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (190, N'qHSUwoVMUoovSUMiww5r9A/Cik7zbOXqv3JIUi4Er9p9W0vM4iBL3OoJTRdjLQ9rXrRq6wNN1tzYbzu1YGIW9g==', CAST(N'2021-06-29T06:49:13.2700000' AS DateTime2), CAST(N'2021-06-22T06:49:13.2700000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (191, N'YE7efB41BE6WzZWhWXvEHJvC15yyR3YnK42YCjUTBnI+Ey+Yy0FkklR2Rhl5Qx+CxxNbq+N3FcCas9QgthJNBA==', CAST(N'2021-06-29T06:49:13.9600000' AS DateTime2), CAST(N'2021-06-22T06:49:13.9600000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (192, N'POQPrNsUgrWkdYro+uHpWJ3BgEhyA2sGk2FzwwWerxwNiTBoXWe+Ox/QS4J5atxjudHSI6ta71RuvjK0oxlpCQ==', CAST(N'2021-06-29T06:49:14.6600000' AS DateTime2), CAST(N'2021-06-22T06:49:14.6600000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (193, N'ry9BWynqMSPGLBxCYdxE+tPZHAK/1/+secJ6vpaRIs79NDg6rCAjk9l4sGUS62evnaz8w8RMo21AS6PDkjhUcA==', CAST(N'2021-06-29T06:49:15.3400000' AS DateTime2), CAST(N'2021-06-22T06:49:15.3400000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (194, N'HzbpQo7qWI3pTACbi+JPf3Fb77NPxQh0AIYbpzB36kX97TeeRzUdpWU+aySJoX8lm9UmMcAN+Xr2TOj5STGk5g==', CAST(N'2021-06-29T06:49:16.0366667' AS DateTime2), CAST(N'2021-06-22T06:49:16.0366667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (195, N'RlTjYQXbSwIRXxRzKmAhTGh5UbpkAbjBny6e7OB3PqJpJCeGEd5yO31tJwHlrZMGqloZQ/LoJjLsFw6Jrrur7g==', CAST(N'2021-06-29T06:49:17.3200000' AS DateTime2), CAST(N'2021-06-22T06:49:17.3200000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (196, N'x2JO5BrRANGoTTOPRIm9skeOlcwQf36RUlXo8QHLXtqvwlZRU9JBbX6CvdyLrtzu0OWPr7E1zAqfkQE8HeNj2A==', CAST(N'2021-06-29T06:49:17.9866667' AS DateTime2), CAST(N'2021-06-22T06:49:17.9866667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (197, N'bVGQLfwpjhwmwHDDDgccnn2a4v0uvrjtVKQf0zJrLTzLzE9Z5hHLrqRhi2AOUU/URiY3vMlPEymQE+Z2DwTCIw==', CAST(N'2021-06-29T06:49:18.6866667' AS DateTime2), CAST(N'2021-06-22T06:49:18.6866667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (198, N'1yzHl1D80g2L9lxjo0BpL5fVnR0yny6Tw+iDOwCHAI8FXstfyoC5kP5WO9HeJN9muE8V4sxv6gDi4XXIKpJiOQ==', CAST(N'2021-06-29T06:49:19.9533333' AS DateTime2), CAST(N'2021-06-22T06:49:19.9533333' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (199, N'd9CcJ8qmY2TwlPvd/PFZDwYVdaEFYAfVdewAaSPx6HPCjK/4hXEztOhyaZzp+lsBEIn+cEO1COx2F3DV6CcAhQ==', CAST(N'2021-06-29T06:49:20.6566667' AS DateTime2), CAST(N'2021-06-22T06:49:20.6566667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (200, N'7DbrRRToG8VvkUQB14S7DZf32QWC9pPdj5k0CQp4nb53M1cufabIUhw/O8183U1+FN28ryKcbG8vQ7Yab2ZqGg==', CAST(N'2021-06-29T06:49:23.7800000' AS DateTime2), CAST(N'2021-06-22T06:49:23.7800000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 333)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (201, N'yuTQIANZVf0YtvXke+FR9zl5I735A6dRK8POq9wIAAnmGVMoLkj9d6/KVcxxIf+3See+QmWGO9JIGt/a5xBDaw==', CAST(N'2021-06-29T06:49:25.7000000' AS DateTime2), CAST(N'2021-06-22T06:49:25.7000000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 335)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (202, N'4nqY2o+DJIEnKTlsWgVfI3rYmohHPQOT+dYMOMd7n18Sump6jSBqL7YT9AqAxdJnDlOdk//RBNhYnsuPnDoROA==', CAST(N'2021-06-29T08:15:41.1300000' AS DateTime2), CAST(N'2021-06-22T08:15:41.1300000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (203, N'oAl8PTvHFHvGcNaEMbXaSKGxu4KxlJesnN1PJbNHHZjriFAKNgIdKuPkp/99+lr+3EbpbmeVMB2jIGB1eFjB6g==', CAST(N'2021-06-29T08:57:38.7300000' AS DateTime2), CAST(N'2021-06-22T08:57:38.7300000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (204, N's0Ivp9bJ2CUAImiQeNPs/14NDtyknNWfCuntva2MT7Ls+GFJXMrJmAdsGhpTwLtReS9JTzmPCSWDjSOH7G9HGg==', CAST(N'2021-06-29T08:57:39.6833333' AS DateTime2), CAST(N'2021-06-22T08:57:39.6833333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (205, N'QembNyNNx6dxtzSoVASPIZTTKvXcuhl3kkBHK9kP3SDXRippFkWAttF+z0pECpydUe3P3orkQl7IgALL8t6Niw==', CAST(N'2021-06-29T08:57:40.4033333' AS DateTime2), CAST(N'2021-06-22T08:57:40.4033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (206, N'BcjZg1kBU2Xy7IPbviqzUp9NCI5z371GTM+nblEbS21NlOykAwnwPM5UvYLa5uzbT80iVztdMLsSU8VpIm3uDw==', CAST(N'2021-06-29T08:57:41.0966667' AS DateTime2), CAST(N'2021-06-22T08:57:41.0966667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (207, N'R9WzJy2bA4m1Yl4mqFcJFrtjfrv2X9kj1q5UkIY1y0OQasv9VMbn/upB7acjyeUMsvTCOBEoS3F5khvuVUJ/8Q==', CAST(N'2021-06-29T08:57:41.8133333' AS DateTime2), CAST(N'2021-06-22T08:57:41.8133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (208, N'gQRA0uA2aIbQNDOddKvnJB6kvqav9eKoYwCMKwqRF1h0oP38toQlxRKNsh3KaeAyoBRCDh+H8sMxEB3Licun+A==', CAST(N'2021-06-29T08:57:42.5666667' AS DateTime2), CAST(N'2021-06-22T08:57:42.5666667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (209, N'1tHIXLNh0P3ZbYbRCl9LPJUZ2UD4Q9rWVyD4eujvvATDvwJ9WnmWkd8mnpsLt5rfgBe9CtGnK5jy6NuwpzekHA==', CAST(N'2021-06-29T08:57:44.0333333' AS DateTime2), CAST(N'2021-06-22T08:57:44.0333333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (210, N'P8a2fBvZXRVnY4vyIa8Ro9L2yXKfGCD2eTngBN5gseB+d02bTnRe5yLxhGPSp8EWGb2uCWUKeoVUYKwxmdeG1Q==', CAST(N'2021-06-29T08:57:44.7966667' AS DateTime2), CAST(N'2021-06-22T08:57:44.7966667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (211, N'wnn51kjcz0rW/yuCqYQIy3OJv7+UWZ9lB+DMTTZ457I6MRKZZhWqZ5cdJfQJYU97dLHns4rPVp/mliAWR3sscw==', CAST(N'2021-06-29T08:57:45.5533333' AS DateTime2), CAST(N'2021-06-22T08:57:45.5533333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (212, N'ofB0i3HZi8SlmGNt8zOjGUx6RpbpdsHJKOcjCZRd2FAz2b4i9v+K0hcbYfA+lbhEfuo4GzqsC5ng+VuPT51I4g==', CAST(N'2021-06-29T08:57:46.9033333' AS DateTime2), CAST(N'2021-06-22T08:57:46.9033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (213, N'0oqJfGgL+zuRY8CzjSFc2/Y6NDRbVZ20yr3asjpGs1M1DM2xiG657Y4g4m5i4lHRZVavISEE7v2/zO6eXXzVFQ==', CAST(N'2021-06-29T08:57:47.6166667' AS DateTime2), CAST(N'2021-06-22T08:57:47.6166667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (214, N'H8e4BkvD43PdYjZ9Ol8O+N7YXulKXvSC+vbMx2SZYiDqboSTHU3ITxlqX8NIjKf6jNNOmc7hOOV7RkInzgDfRA==', CAST(N'2021-06-29T08:57:51.0200000' AS DateTime2), CAST(N'2021-06-22T08:57:51.0200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 336)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (215, N'7/OmW9LGlRBKuUjCB2WyXRPom9KI5gJgXjAsHmmMn8MXr23SvhfL2TvLpw2PPGKM+PIYjb1vWz1VyFIUgBel/A==', CAST(N'2021-06-29T08:57:53.0533333' AS DateTime2), CAST(N'2021-06-22T08:57:53.0533333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 338)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (216, N'T2faf7eq2vCdHDmsQghay5svMIELaAjMB84IqjZzonwKi3EC7uHFO/wEQYHdVebBZhkeXJ138ONOz+TMvZ5sQg==', CAST(N'2021-06-29T08:57:54.1966667' AS DateTime2), CAST(N'2021-06-22T08:57:54.1966667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 340)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (217, N'cEaHRJ+36rXRYikNdr0/ivR/mT2jo0fmrjyvf7TXuXFIYumjUas6U5aCyILgja07wMVzwWmcN896ee0qcFpMhw==', CAST(N'2021-06-29T08:57:54.6566667' AS DateTime2), CAST(N'2021-06-22T08:57:54.6566667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T08:57:54.6900000' AS DateTime2), N'0.0.0.0', NULL, 344)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (218, N'wDKf06gadoSeOpJAiUx/k+OiEHdwmkH+ie9fkJvIdjcFX3aAFohjs8tPR3yIxaeqYKUm+x8FjC89jyu6EJr5gw==', CAST(N'2021-06-29T09:26:53.5866667' AS DateTime2), CAST(N'2021-06-22T09:26:53.5866667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (219, N'1n8u+vLCd5mIxuYebe8Q4qexNWTuIUKCZ+Gnl5vSMzLivyF96q9mcK8KTZeSMvJL+/Lwv3EyoGbrkv3AYO+bvg==', CAST(N'2021-06-29T09:26:54.4000000' AS DateTime2), CAST(N'2021-06-22T09:26:54.4000000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (220, N'XnSHlBnjl0/cB4zGRVyzVBHuq/2I9q8JN6kPRBgbm9mamJNA4eMBdQwqKQirrrMMr93h0N4l1LYC0zjHUbZiUQ==', CAST(N'2021-06-29T09:26:55.1066667' AS DateTime2), CAST(N'2021-06-22T09:26:55.1066667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (221, N'4V1zr60PgoES1kcJPp0kPcDxpVRlY2PvN48a1dwp2P7CsvgkA09OT5twhYm1TS4gUWn8GfZeQLdg54ldrTLUJw==', CAST(N'2021-06-29T09:26:55.8133333' AS DateTime2), CAST(N'2021-06-22T09:26:55.8133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (222, N'GVxuQvYe5VpzMCezeQjXSAn3nNiUwZxmuana4d7w7C/KRPSgrqCnCIXXD1BoszEapGRNPOlcNRU2vW2PQoIdDw==', CAST(N'2021-06-29T09:26:56.5200000' AS DateTime2), CAST(N'2021-06-22T09:26:56.5200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (223, N'zUBiYWqg8QZ4w3JtgcYTh1Tajfzbf76k0vZj5N0OK2bwFyOICyDFxNdeDSEW+Y8T+kval4d+CL9TE0KzFN6R/Q==', CAST(N'2021-06-29T09:26:57.2400000' AS DateTime2), CAST(N'2021-06-22T09:26:57.2400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (224, N'/KZ7KFyjrmpDeSAOLsabpubaOK1bflQfv+OLz7kDjLHmLIIGsHa1DKJVYnOW01qIy4JeuCAg7YwQ2ZEWj07UZg==', CAST(N'2021-06-29T09:26:58.5900000' AS DateTime2), CAST(N'2021-06-22T09:26:58.5900000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (225, N'227MbtgbVrSxKZcJ5X+YqEtah9Ilu5IyAwat4LYxITWOUD2sIOm/Bhsr50LlqlG1UzviyotKPAp2Shl4NDs8cw==', CAST(N'2021-06-29T09:26:59.3233333' AS DateTime2), CAST(N'2021-06-22T09:26:59.3233333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (226, N'/EIxPyKEiUJVyddVNzG78zTDwCT+lJ0kRbBoQPJwcjXi2d6AKwbP+Vpt+cQUdEiGieX7l2Myxgm2jgCijEWorw==', CAST(N'2021-06-29T09:27:00.0400000' AS DateTime2), CAST(N'2021-06-22T09:27:00.0400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (227, N'5fCaLEtzQXIk9UwdiJH90ZR+Xkz0Hyn+Dv/Vco/FRZbs6NrVsIE6AfbFf/Y2OxeWxyQnYacW5/PJeGum+ECEKw==', CAST(N'2021-06-29T09:27:01.3366667' AS DateTime2), CAST(N'2021-06-22T09:27:01.3366667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (228, N'VapQv6RRi9UWrlw+5ao7DHfS4dNOC01gyu7WMbsWRV7FxLHmWymn9jCpKSlF1JO8fRCWm+4JmhwcSd0cR9i9dg==', CAST(N'2021-06-29T09:27:02.0900000' AS DateTime2), CAST(N'2021-06-22T09:27:02.0900000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (229, N'JsP0vKRA8JxLtRjIQeFxniBkZr5KYnA+cIRx1Inw3F0wYanWMAcfkllxq2vRwh22TUHYJG6Tj5VJGGJhG7Dy0g==', CAST(N'2021-06-29T09:27:05.3633333' AS DateTime2), CAST(N'2021-06-22T09:27:05.3633333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 345)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (230, N'D3uvP7fa8iCKZfTKKaeQtx9/SI2hax2RiJt1zx/ICvL6u2ci8tx236rxQkZTlAEfTrPTWm2VmiHBq5u04KuhPg==', CAST(N'2021-06-29T09:27:07.3300000' AS DateTime2), CAST(N'2021-06-22T09:27:07.3300000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 347)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (231, N'8NiqG7crhj+MPrcSYed5W6GOq/mjeX+hhuWx49gdVovx2n9sPuMFOXy1q6HNebzh1KfTgYDCTv4k0DKz5X60oQ==', CAST(N'2021-06-29T09:27:08.4033333' AS DateTime2), CAST(N'2021-06-22T09:27:08.4033333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 348)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (232, N'fKv6doh0qdmIdnvSnCQynVVvEKsLFVyVXP8ezn4aH2EvYzFjNAYcYAUJ9KRHBtZqWMqfxMKp08cKvaNjm/FtSA==', CAST(N'2021-06-29T09:27:08.7966667' AS DateTime2), CAST(N'2021-06-22T09:27:08.7966667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T09:27:08.8233333' AS DateTime2), N'0.0.0.0', NULL, 352)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (233, N'N3zaX3Qo8fCYwNniELO7pXDa9Gyo+xnF0XMLG4wR7QRjp6E/o6MpCSCYu1Ubh5XB0kRTrv+n4F2JXL6GeHfrzw==', CAST(N'2021-06-29T10:34:29.8233333' AS DateTime2), CAST(N'2021-06-22T10:34:29.8233333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T10:44:17.5300000' AS DateTime2), N'87.116.23.185', N'q0EsVaOYqb9YgY0ypRGpSwLUuSGVch/SKHDUvzZeYkdQlTuu+XVS/TpCDPe7ALKV0QrnlRCeSMQSZuyjcUb75w==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (234, N'q0EsVaOYqb9YgY0ypRGpSwLUuSGVch/SKHDUvzZeYkdQlTuu+XVS/TpCDPe7ALKV0QrnlRCeSMQSZuyjcUb75w==', CAST(N'2021-06-29T10:44:17.4966667' AS DateTime2), CAST(N'2021-06-22T10:44:17.4966667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:22:20.8633333' AS DateTime2), N'87.116.23.185', N'eE0WgqLkMMAXtt5BxFQ6Cgo8BAmT+hc4trnaPCL2iMu4/YG4onhEFt3PAis5eeNbWcukUcuPb0Ws9rLry89pbQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (235, N'Ik4mmJl1i0Ik+xWAvLfJqw0FLDOFIpIwn0+gPAugINkCzi1fZlpC+K1KHgC+9QmlIywztmSwytsL2LvIN4qbnQ==', CAST(N'2021-06-29T11:14:29.3800000' AS DateTime2), CAST(N'2021-06-22T11:14:29.3800000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (236, N'UeUyCyHsBegbNcPIVpPFTz6dO1YG2+t9QsLsDebzos7qSgR8Tt4rGxnraTpI2h1FbndcCF7Ae7n6/6avUc2gGQ==', CAST(N'2021-06-29T11:14:30.1333333' AS DateTime2), CAST(N'2021-06-22T11:14:30.1333333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (237, N'1pqypsN9/edwT+1Hy8d0THq9Tzc8Uu9g9hQa3plhuxqj3iRuPnZk0kAUa4pvCqbHI5ljBfqcDX875nIE5UNtzQ==', CAST(N'2021-06-29T11:14:30.8600000' AS DateTime2), CAST(N'2021-06-22T11:14:30.8600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (238, N'inh5mAvu3rnaycU98O3pn0hi51G1psisF/OjHkQCu4ROWScmqcSHZDBvWywLtCK+potyP+uIFbis4O4gY3lzdQ==', CAST(N'2021-06-29T11:14:31.5866667' AS DateTime2), CAST(N'2021-06-22T11:14:31.5866667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (239, N'fGvpzR6hITAJfIIIfweKi1zt+Id+50woISK7YhnF+n97elk9+8/Iw4MHx/ZsVtfsOYWTOIEZjuvV2QsKwHNYvQ==', CAST(N'2021-06-29T11:14:32.3200000' AS DateTime2), CAST(N'2021-06-22T11:14:32.3200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (240, N'rwHsKTrZ+sfrT/3yenRoKKWe3+/RuP+5M/yG5nsrXAbfeik+3Tt2j06RFHsH1mmxbL9e4jwZaIcCCzgMocSvKA==', CAST(N'2021-06-29T11:14:33.1133333' AS DateTime2), CAST(N'2021-06-22T11:14:33.1133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (241, N'MBH4a42CyFjKrWHzl3k1NElbsfR3C/3kREgEGPQJPHqVnMzZh8xyYHkCBdwkO/tph4s2U8SScFUnGj/gbyTSfA==', CAST(N'2021-06-29T11:14:34.4233333' AS DateTime2), CAST(N'2021-06-22T11:14:34.4233333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (242, N'cqqObnIqUjGmAiY6oFBoXqJLzs2sYPJepx39sKI/20WwT4aMNB+admew4T7mjROgsg1x2+e0wWsQbn9wEk6iZg==', CAST(N'2021-06-29T11:14:35.1200000' AS DateTime2), CAST(N'2021-06-22T11:14:35.1200000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (243, N'LgZ2rKanb3sdkVTlaNyqm7sA0Ls2w/j86SGw+XaRmWlO0CUv2hzSOWjjzDe7l9N8M+41Bw0ZPILuWQU9sG+k3Q==', CAST(N'2021-06-29T11:14:35.8333333' AS DateTime2), CAST(N'2021-06-22T11:14:35.8333333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (244, N'Kuy2BkEKVG6CBVGIdXjg1Nh6iATR+eEtDxHv6fuWFSH88n8jxS5oIWpjORrwcotBLuoNJ83P64Bw1rhpj+1fOg==', CAST(N'2021-06-29T11:14:37.1066667' AS DateTime2), CAST(N'2021-06-22T11:14:37.1066667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (245, N'FYkzmrW7FXBknV2YbiAL0aQ1OkgGeWOlHJaoygFQ3+lECXELHdT1V5CONmSnB/iEbrEf89eZM0g2NDpvD//rFg==', CAST(N'2021-06-29T11:14:37.8733333' AS DateTime2), CAST(N'2021-06-22T11:14:37.8733333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (246, N'V5+NmsXUIqhBqlt63yFiwrXaiT6h86gUJSeVT5TY2llrpQFg+/GFoI5ghgMCVoIOXjwxnxhm4kYFHgF6r/Qu5A==', CAST(N'2021-06-29T11:14:41.3000000' AS DateTime2), CAST(N'2021-06-22T11:14:41.3000000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 354)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (247, N'1u8n5XJSBvdsn+PfVmZUfoRUqQPKoTHXByRnsJW7/jHTfdAWMsFFjPayO+OIKD+7sBJeIf/xIPyRa9MpR0OTIg==', CAST(N'2021-06-29T11:14:43.3266667' AS DateTime2), CAST(N'2021-06-22T11:14:43.3266667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 356)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (248, N'ReC9u8+cakwSDuyU6iPPQrb8I4ITHSJOpVHV6oRCAl6FCxXKqtkXzI6uKJK26pyshoCYIC7w8Two8QhpeTynGA==', CAST(N'2021-06-29T11:14:44.5233333' AS DateTime2), CAST(N'2021-06-22T11:14:44.5233333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 358)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (249, N'5jEfCK26/DWfNdxXKslNriDmHWzItJ4JSV1zYtzjI68R8gPQ4yEcDv4DBN6gM/4nOYSW7bP/kGKcCqRWWqrRQg==', CAST(N'2021-06-29T11:15:04.1666667' AS DateTime2), CAST(N'2021-06-22T11:15:04.1666667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T11:15:04.2566667' AS DateTime2), N'0.0.0.0', NULL, 362)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (250, N'jpiiDbG+Ybyr9JgJIdP4JESTuFjIfghy2O5vQariennkhwB5WGULdZiP6PCK1SPfZldBzlN3L9CdlledXw+gTA==', CAST(N'2021-06-29T11:15:11.7233333' AS DateTime2), CAST(N'2021-06-22T11:15:11.7233333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (251, N'4ngrFS4COIZnhyQX+GUOo3T4N+Il779HGIOlGGF7p+OzrLhG48u8Jr1exPC6eHWG+0eBjtR92jp3JSfLU8M1OA==', CAST(N'2021-06-29T11:15:12.4466667' AS DateTime2), CAST(N'2021-06-22T11:15:12.4466667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (252, N'TgTgT7sPpoMsNY5SUC9d45+xlZ+GO4br9uJzqFGEQN57qbtZRwtlsHzl11xzuKXBS7TNW8TKLX1xrW2AwQrs8Q==', CAST(N'2021-06-29T11:15:13.1366667' AS DateTime2), CAST(N'2021-06-22T11:15:13.1366667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (253, N'hwid9b8lddl7EHl8PqH9wLASyyRgHi1amO0uFbKXGYlGTqdh4xo5Wd67+DkHYFOV/R+3cVERrOwKtVLufbeWgQ==', CAST(N'2021-06-29T11:15:13.8400000' AS DateTime2), CAST(N'2021-06-22T11:15:13.8400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (254, N'PbY+av95zA/Tfiu36tapDcGVpEdN6z4Myu9yHlIvq4MxdVi2M9e4HKzDRm7ME/dQfdA3q9QjdoIUjsdOlKP6fg==', CAST(N'2021-06-29T11:15:14.5366667' AS DateTime2), CAST(N'2021-06-22T11:15:14.5366667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (255, N'Y9dpnGLm0K/fXgp4zq+wdeK3y35GgBAoxF5rX2mJukZ4S1dAaZLVmdHQ4M3ep+3oOdT0dRv0NixaqKB8TvP8yw==', CAST(N'2021-06-29T11:15:15.2600000' AS DateTime2), CAST(N'2021-06-22T11:15:15.2600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (256, N'LUa5ZvQ/I1b6AZROKDVzqlRXqpJ3agQ0E90GM3kiDsSZfo2IvphUQrVYA5NYjRdwdpEANH/Bg1rSE2jA9ozFuA==', CAST(N'2021-06-29T11:15:16.6300000' AS DateTime2), CAST(N'2021-06-22T11:15:16.6300000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (257, N'cHS8Q/SX8s4Wy2SMbs8SELktXAWLiTt+E5ZRVmJ0xRaXICNzyKoM0toX16al4JaYI6H9Q4Xb26c9B6Qp4Ml6OQ==', CAST(N'2021-06-29T11:15:17.3600000' AS DateTime2), CAST(N'2021-06-22T11:15:17.3600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (258, N'gWIP9M+1cAcjvtntC9BDFWWvZKq4WPtLaWaD/9qjamSurfKneu2pzO9+i4hefrRC2OohS5dgljHS50SxcM15UA==', CAST(N'2021-06-29T11:15:18.0500000' AS DateTime2), CAST(N'2021-06-22T11:15:18.0500000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (259, N'MdNbRbUxAxF+bl79fYuX/D1EqIw8rLKbCG6d0d5wwjjjdatxHoWfHIBOK1eLyUKJY4zbodMs3s4DiX2RZRsygw==', CAST(N'2021-06-29T11:15:19.3600000' AS DateTime2), CAST(N'2021-06-22T11:15:19.3600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (260, N'zQJ3e3/ecC0k5r9Ed06fRA6zQj4kPghKhT6ZllDrAc7mn9yPVtgqTXH26u12Qza+EmsOqNghX4UpixMjAdn1wA==', CAST(N'2021-06-29T11:15:20.1000000' AS DateTime2), CAST(N'2021-06-22T11:15:20.1000000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (261, N'qXcUngWXvy+rk8jwLaAxlPZSdgKqNF6hQkwRhfHcfz5D60obyhbktxcECKxD4ONkB8xMVfLRB2jGfZAb8ifKBA==', CAST(N'2021-06-29T11:15:23.3400000' AS DateTime2), CAST(N'2021-06-22T11:15:23.3400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 363)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (262, N'QwOeB4XYvyM/Hfw7aPZZT22RSAkQN2LT5StZMENIGY6kxYqarqai0ptxkWG+4Z0v/zBQNpbpIIcF58qc4B2stA==', CAST(N'2021-06-29T11:15:25.3633333' AS DateTime2), CAST(N'2021-06-22T11:15:25.3633333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 365)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (263, N'xpoN4qC/eysWwmJypeJ2T3V5EsgKb/rV+d77pfJNswa7vNc83QT0Q8YOvYzKMmr5w+cSF0V2FlCHcT3LbN/AHA==', CAST(N'2021-06-29T11:15:26.5466667' AS DateTime2), CAST(N'2021-06-22T11:15:26.5466667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 367)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (264, N'V20mI0J57ZcXoWQj7tBWdUFlDj0aodSlT26rXV2oF/jXJ/KWNcrKE9oGNqeB0/x5hQuU6wPbh/nXmoCx13G9jg==', CAST(N'2021-06-29T11:15:26.9900000' AS DateTime2), CAST(N'2021-06-22T11:15:26.9900000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T11:15:27.0133333' AS DateTime2), N'0.0.0.0', NULL, 371)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (265, N'eE0WgqLkMMAXtt5BxFQ6Cgo8BAmT+hc4trnaPCL2iMu4/YG4onhEFt3PAis5eeNbWcukUcuPb0Ws9rLry89pbQ==', CAST(N'2021-06-29T11:22:20.8066667' AS DateTime2), CAST(N'2021-06-22T11:22:20.8066667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:29:08.7000000' AS DateTime2), N'87.116.23.185', N'uwSevCWVX5dcxi0X9zJ9/ZArkAowxUdCNiz4wY/n2jhXPjSYa9diq3N3W9TyCfBa+6LghKA5akXai8pUL6e+nw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (266, N'JCfQlN4AT0g/VP94vq3ZjUubGfT6X2YdwArItR5aitFw2NMj3EY65JaoVYtP1TLo797A2s+8bR5MnKf+VMK++w==', CAST(N'2021-06-29T11:23:11.2500000' AS DateTime2), CAST(N'2021-06-22T11:23:11.2500000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (267, N'yBUmf6AI+YxYJ+nDWQlJ+5IaWB1BsufSPkFBdgVch7SGv7o1okcjjn9YiZ2LKvjSH2lJ3exf42EunPXyfZ0hlA==', CAST(N'2021-06-29T11:23:12.0266667' AS DateTime2), CAST(N'2021-06-22T11:23:12.0266667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (268, N'XmyrOHhkdEdV/oD50Dd1/DJubOZllMPKZ5/Q5gnZB9bxHRL4E8Hrs3JmyMtuPcYX9UOOVDTDfphy8CLkkoIdzA==', CAST(N'2021-06-29T11:23:12.7566667' AS DateTime2), CAST(N'2021-06-22T11:23:12.7566667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (269, N'0y/nPIwS7othe4lvMufYvyRColk17zv8s+aDoyNnFAWwIWfk/qDAp3odR3pt2oBCCI2UPV+W02OyB8Ha0/IN1w==', CAST(N'2021-06-29T11:23:13.4866667' AS DateTime2), CAST(N'2021-06-22T11:23:13.4866667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (270, N't9bccQFTeuH2ZDCfFlRLtGYmnuHWrTQ8Q49md9q9g+41tADhyMdUjQlUqbaUbfelqZUAHEy25lRH7XrNidtr8g==', CAST(N'2021-06-29T11:23:14.2600000' AS DateTime2), CAST(N'2021-06-22T11:23:14.2600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (271, N'uFWyxkKw6kLWmvLODu0uZDX4wtEwaCAsTgH8yQ2GVY408mWuY0hkIwCJMJprQDkm4OrMQu/YxqG8WCoH1NDXUw==', CAST(N'2021-06-29T11:23:14.9966667' AS DateTime2), CAST(N'2021-06-22T11:23:14.9966667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (272, N'J6fSJsfVMEovQ16YsxQY0ScgvzgM63H2VcDfvwwn3F66Zdkx8jNnUR20WUfkYg/P/Br9XnzLcG+J1aBv67LR9A==', CAST(N'2021-06-29T11:23:16.4033333' AS DateTime2), CAST(N'2021-06-22T11:23:16.4033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (273, N'hZDMwVZ5KhjGwQs9b9ev9B7YUqdZEdZoHg7fOQN6WI8Hd1rFo5ke2zBzWTHZ/cj2GHGW4l160axILR09FgZWIg==', CAST(N'2021-06-29T11:23:17.1400000' AS DateTime2), CAST(N'2021-06-22T11:23:17.1400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (274, N'YPM7rKtbzzScC/CCedDn35Puh+p+1Ns5dpi7mYOx6UBSQxvuTzs6X+iz0p3RYUA044D01L2V7ftUWTKfBAzhJg==', CAST(N'2021-06-29T11:23:17.8933333' AS DateTime2), CAST(N'2021-06-22T11:23:17.8933333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (275, N'wL1rfTVMkVxnKVvyZPYyaxQCMnkUOQ/Z6i7dUebr2kztNkaI9iR2/y07UChLdpLhMLcQa8gsU8BX5qpy3tH6LA==', CAST(N'2021-06-29T11:23:19.2166667' AS DateTime2), CAST(N'2021-06-22T11:23:19.2166667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (276, N'IVXbpn7R8fkvDyPbCHW8CV8vj3v+ta3mgVd22OdH7ShpqWWj+v5ooeRUtcpW0whGeJult+z/6oR7MoQO/qHdlA==', CAST(N'2021-06-29T11:23:20.0033333' AS DateTime2), CAST(N'2021-06-22T11:23:20.0033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (277, N'/Iunf7ab0bWCmbjd7EWs92bd8b38nhK4AOjuX60bYywFKbbaicjbeMkjcfYiaagjh99kWoazZYx3ggdagWXPFg==', CAST(N'2021-06-29T11:23:23.3966667' AS DateTime2), CAST(N'2021-06-22T11:23:23.3966667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 372)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (278, N'b2Cur5CKB20wWnebcRm2Ii2CXJ+jklEehdkvesW2huJ0rtY4U6+wvUPPU6AZca0UpGkCW7fYZ2fT6h6zSZvg1w==', CAST(N'2021-06-29T11:23:25.3600000' AS DateTime2), CAST(N'2021-06-22T11:23:25.3600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 374)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (279, N'n0d5Cy4yyYr9l6i/OYXRSaSeCwOlOYkvsTDeScgb37z2ah3Ig4dXZN3vmArlvxNztARKfHZZ2eYUixu1j2qpDA==', CAST(N'2021-06-29T11:23:26.5600000' AS DateTime2), CAST(N'2021-06-22T11:23:26.5600000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 376)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (280, N'daoLEMIt+hx2vi0o3zO3Zo1eld+pXVTxMfTlyMknxeu1UWZyZHXBveMApiSfV3nukQF5puG/Yqru2SbZI6GFzA==', CAST(N'2021-06-29T11:23:27.0066667' AS DateTime2), CAST(N'2021-06-22T11:23:27.0066667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-22T11:23:27.0266667' AS DateTime2), N'0.0.0.0', NULL, 380)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (281, N'uwSevCWVX5dcxi0X9zJ9/ZArkAowxUdCNiz4wY/n2jhXPjSYa9diq3N3W9TyCfBa+6LghKA5akXai8pUL6e+nw==', CAST(N'2021-06-29T11:29:08.6966667' AS DateTime2), CAST(N'2021-06-22T11:29:08.6966667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:42:55.8733333' AS DateTime2), N'87.116.23.185', N'c9RdT+CjvQ24AiL3m8SA4y0/O50FYKkiK5MXk0Jf3SrC66re5mfKH+gP9+R4PJvzpJ5mdq9+lVTWlZ5EidbT0Q==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (282, N'c9RdT+CjvQ24AiL3m8SA4y0/O50FYKkiK5MXk0Jf3SrC66re5mfKH+gP9+R4PJvzpJ5mdq9+lVTWlZ5EidbT0Q==', CAST(N'2021-06-29T11:42:55.8366667' AS DateTime2), CAST(N'2021-06-22T11:42:55.8366667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:44:11.5766667' AS DateTime2), N'87.116.23.185', N'FY2i5WYlgVshdnpLHO587eBVmwnO++H/dykgWGOLXMLxjaf8vG6nPNbdRk2JQ6hdz2o5HlqVg3j9xrElUAIu8w==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (283, N'FY2i5WYlgVshdnpLHO587eBVmwnO++H/dykgWGOLXMLxjaf8vG6nPNbdRk2JQ6hdz2o5HlqVg3j9xrElUAIu8w==', CAST(N'2021-06-29T11:44:11.5733333' AS DateTime2), CAST(N'2021-06-22T11:44:11.5733333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:44:49.7833333' AS DateTime2), N'87.116.23.185', N'jjyJsurA7KB8F7oQpfsoXR4nyzr8hU3fpc9A2m5hOiENqzCt2KoeLsOt1VJjbM4YoPOehev4Vxb68hHxaxy3Zg==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (284, N'jjyJsurA7KB8F7oQpfsoXR4nyzr8hU3fpc9A2m5hOiENqzCt2KoeLsOt1VJjbM4YoPOehev4Vxb68hHxaxy3Zg==', CAST(N'2021-06-29T11:44:49.7766667' AS DateTime2), CAST(N'2021-06-22T11:44:49.7766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:46:17.7200000' AS DateTime2), N'87.116.23.185', N'4Yv49s27wawu+sBRF2kBDMsI30ZnQembEL5H2pYTjBg0gI1s40822I/JxRVyUJTrewzgnhiOXiMKgNCAk4hjnQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (285, N'4Yv49s27wawu+sBRF2kBDMsI30ZnQembEL5H2pYTjBg0gI1s40822I/JxRVyUJTrewzgnhiOXiMKgNCAk4hjnQ==', CAST(N'2021-06-29T11:46:17.7166667' AS DateTime2), CAST(N'2021-06-22T11:46:17.7166667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:48:00.4466667' AS DateTime2), N'87.116.23.185', N'Ml9le9vw9ClvB43mvSOtSP0yugujbtL+x/bMSJFHuPnEqXlOSR0wR7OGvbMXOaNVKxvtISnVje2WUPdatQydQQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (286, N'Ml9le9vw9ClvB43mvSOtSP0yugujbtL+x/bMSJFHuPnEqXlOSR0wR7OGvbMXOaNVKxvtISnVje2WUPdatQydQQ==', CAST(N'2021-06-29T11:48:00.4433333' AS DateTime2), CAST(N'2021-06-22T11:48:00.4433333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:50:50.9600000' AS DateTime2), N'87.116.23.185', N'IE9Hk278BBI2e12DhVvfdMyJN7SxgnmWu/ro1jX2sPOiv1duv/63s6s9l7TwW89mZNYBHFyPghbIZRBflyiSng==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (287, N'IE9Hk278BBI2e12DhVvfdMyJN7SxgnmWu/ro1jX2sPOiv1duv/63s6s9l7TwW89mZNYBHFyPghbIZRBflyiSng==', CAST(N'2021-06-29T11:50:50.9566667' AS DateTime2), CAST(N'2021-06-22T11:50:50.9566667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:51:56.8366667' AS DateTime2), N'87.116.23.185', N'Di4X08w+z7NF7g2WqPpsFzyFQ3deANdkcao2cUoBtsvlQGx25CGxPUMo0DmFPh7RS/qPHmi43MGtE6rsdVFIXQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (288, N'Di4X08w+z7NF7g2WqPpsFzyFQ3deANdkcao2cUoBtsvlQGx25CGxPUMo0DmFPh7RS/qPHmi43MGtE6rsdVFIXQ==', CAST(N'2021-06-29T11:51:56.8233333' AS DateTime2), CAST(N'2021-06-22T11:51:56.8233333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:53:49.7733333' AS DateTime2), N'87.116.23.185', N'k26RVjpYtyGWlx6QPabprqfA9RO5iEGNFLFxVts2skXdCb0ZrDBNChnlyO4rlz7wm1AxLDnWMkuAnW3ULSdMsQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (289, N'k26RVjpYtyGWlx6QPabprqfA9RO5iEGNFLFxVts2skXdCb0ZrDBNChnlyO4rlz7wm1AxLDnWMkuAnW3ULSdMsQ==', CAST(N'2021-06-29T11:53:49.7666667' AS DateTime2), CAST(N'2021-06-22T11:53:49.7666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T11:59:26.5700000' AS DateTime2), N'87.116.23.185', N'fTreWWuT4Foii3T4K6p/x6bcSnm1qUarB8MBAn4/PMJ9PoDePFY5a/odyGwGMyRYrmHomrhM84obCtfD3vYxCA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (290, N'fTreWWuT4Foii3T4K6p/x6bcSnm1qUarB8MBAn4/PMJ9PoDePFY5a/odyGwGMyRYrmHomrhM84obCtfD3vYxCA==', CAST(N'2021-06-29T11:59:26.5433333' AS DateTime2), CAST(N'2021-06-22T11:59:26.5433333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:02:30.2466667' AS DateTime2), N'87.116.23.185', N'e0mkNQJjFQhZo67WDyBHBemwB2vXqu1nRk6B9yprW1NP4vYsWnc7qRCJUOFQUPztkBkFg5GynjFOZMLVafdESA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (291, N'e0mkNQJjFQhZo67WDyBHBemwB2vXqu1nRk6B9yprW1NP4vYsWnc7qRCJUOFQUPztkBkFg5GynjFOZMLVafdESA==', CAST(N'2021-06-29T12:02:30.2400000' AS DateTime2), CAST(N'2021-06-22T12:02:30.2400000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:04:46.2500000' AS DateTime2), N'87.116.23.185', N'5K0crYZbB8XllA2fxQEwlP/QKi65RhVU1zo7YUovkVVWJyp2UVMEoeImr4s6j8YMgMU93okR1sQ2zd54Xe1riw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (292, N'5K0crYZbB8XllA2fxQEwlP/QKi65RhVU1zo7YUovkVVWJyp2UVMEoeImr4s6j8YMgMU93okR1sQ2zd54Xe1riw==', CAST(N'2021-06-29T12:04:46.2466667' AS DateTime2), CAST(N'2021-06-22T12:04:46.2466667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:06:05.3833333' AS DateTime2), N'87.116.23.185', N'oVJjfPfPLYNd1OMcZTAh5WiqHdwRTUDKTHfU/U2OvoeTCYCz2E5PFeRu8VKfLc1R8+f9ZrWokz+7UNtCW3WrRw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (293, N'oVJjfPfPLYNd1OMcZTAh5WiqHdwRTUDKTHfU/U2OvoeTCYCz2E5PFeRu8VKfLc1R8+f9ZrWokz+7UNtCW3WrRw==', CAST(N'2021-06-29T12:06:05.3766667' AS DateTime2), CAST(N'2021-06-22T12:06:05.3766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:10:51.5500000' AS DateTime2), N'87.116.23.185', N'nAWqwyBuPmyUeWM3PvdA1IOtXMn1FEi4jRK2OSYgbVJCfH/wnQX61rTpx4Q6WLDyWmgR83VisgOTQCsUxeqeQA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (294, N'nAWqwyBuPmyUeWM3PvdA1IOtXMn1FEi4jRK2OSYgbVJCfH/wnQX61rTpx4Q6WLDyWmgR83VisgOTQCsUxeqeQA==', CAST(N'2021-06-29T12:10:51.5266667' AS DateTime2), CAST(N'2021-06-22T12:10:51.5266667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:37:49.9766667' AS DateTime2), N'87.116.23.185', N'1mrOSgSHgB+dgQGm8UrN5pGTRx13VlsGhBOd445j2ef+ILU3eC/G/SaTvFBX8KAaiYmUZQlUDlhDCiUkWrzukw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (295, N'1mrOSgSHgB+dgQGm8UrN5pGTRx13VlsGhBOd445j2ef+ILU3eC/G/SaTvFBX8KAaiYmUZQlUDlhDCiUkWrzukw==', CAST(N'2021-06-29T12:37:49.9500000' AS DateTime2), CAST(N'2021-06-22T12:37:49.9500000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:52:09.2033333' AS DateTime2), N'87.116.23.185', N'abuCcNiV5wSuvRo3A+rXVo0AcN1Pbob66+12hyPgKb6LmovQCvO4QOHoWd9QyhlfPmwuWvvs8d7lkra9Ckl9WA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (296, N'abuCcNiV5wSuvRo3A+rXVo0AcN1Pbob66+12hyPgKb6LmovQCvO4QOHoWd9QyhlfPmwuWvvs8d7lkra9Ckl9WA==', CAST(N'2021-06-29T12:52:09.1766667' AS DateTime2), CAST(N'2021-06-22T12:52:09.1766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:53:20.3566667' AS DateTime2), N'87.116.23.185', N'O6kdwtQ+YW+JOHzAwgvlKcrQD7dAmKXA3O7+4Tw0nnYUNL/zJ/U3a0Eu4aLko5X5nzqcI37RjO0TPivRBkiR+Q==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (297, N'O6kdwtQ+YW+JOHzAwgvlKcrQD7dAmKXA3O7+4Tw0nnYUNL/zJ/U3a0Eu4aLko5X5nzqcI37RjO0TPivRBkiR+Q==', CAST(N'2021-06-29T12:53:20.3533333' AS DateTime2), CAST(N'2021-06-22T12:53:20.3533333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:57:29.6766667' AS DateTime2), N'87.116.23.185', N'Bph1jKy5EPMpHcNvlpI45XHLyv9AtMx3IbboHlTrMeJnJEerLlUUXT3OxNCdWnjpGl68NyzGPMyoMUPeFsahxA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (298, N'Bph1jKy5EPMpHcNvlpI45XHLyv9AtMx3IbboHlTrMeJnJEerLlUUXT3OxNCdWnjpGl68NyzGPMyoMUPeFsahxA==', CAST(N'2021-06-29T12:57:29.6466667' AS DateTime2), CAST(N'2021-06-22T12:57:29.6466667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T12:59:20.8566667' AS DateTime2), N'87.116.23.185', N'1qA7KikFomRVIDuJbNVUpVszX868osZUSItH3eJKOCebkGRKWvA/CZ+AnifgENs45eG8dgj0KYrq4dtaixQV2A==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (299, N'1qA7KikFomRVIDuJbNVUpVszX868osZUSItH3eJKOCebkGRKWvA/CZ+AnifgENs45eG8dgj0KYrq4dtaixQV2A==', CAST(N'2021-06-29T12:59:20.8533333' AS DateTime2), CAST(N'2021-06-22T12:59:20.8533333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T13:01:29.3333333' AS DateTime2), N'87.116.23.185', N'Ors9IEY9TXiyznynlYvlrmHQxKRU0j0afYCqfNhs3zg8Mad9aWLghtgAGuZuaeJQ0Co4WqVicA58vJS0/06rDw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (300, N'Ors9IEY9TXiyznynlYvlrmHQxKRU0j0afYCqfNhs3zg8Mad9aWLghtgAGuZuaeJQ0Co4WqVicA58vJS0/06rDw==', CAST(N'2021-06-29T13:01:29.3233333' AS DateTime2), CAST(N'2021-06-22T13:01:29.3233333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T13:02:28.3800000' AS DateTime2), N'87.116.23.185', N'OlVvgk1EFDKHDbc0zZvz0F4GrG5O9xJPchL2u4wJpCrpq6CCeGfmIVbSDD3xLhj0kMvGflesD2QL0hiQfR8+Kg==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (301, N'OlVvgk1EFDKHDbc0zZvz0F4GrG5O9xJPchL2u4wJpCrpq6CCeGfmIVbSDD3xLhj0kMvGflesD2QL0hiQfR8+Kg==', CAST(N'2021-06-29T13:02:28.3766667' AS DateTime2), CAST(N'2021-06-22T13:02:28.3766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T13:04:17.9633333' AS DateTime2), N'87.116.23.185', N'39k8GZFposwKQTAZ+Cfh+R4vroAU1LyRt7GBYljiEo20/UUe5tRHGO18LWhoTNkvVa771NrmUk92F7bQ1lqbbQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (302, N'39k8GZFposwKQTAZ+Cfh+R4vroAU1LyRt7GBYljiEo20/UUe5tRHGO18LWhoTNkvVa771NrmUk92F7bQ1lqbbQ==', CAST(N'2021-06-29T13:04:17.9466667' AS DateTime2), CAST(N'2021-06-22T13:04:17.9466667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T13:06:48.6600000' AS DateTime2), N'87.116.23.185', N'XoCnUw2Xc7ffnIR87TWCCZ8F7ZAuA5g0TzOb1687l84QyvwWtF0UepSXMr36wBjxug9Qi25u/aAWr4PL2c4h8w==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (303, N'XoCnUw2Xc7ffnIR87TWCCZ8F7ZAuA5g0TzOb1687l84QyvwWtF0UepSXMr36wBjxug9Qi25u/aAWr4PL2c4h8w==', CAST(N'2021-06-29T13:06:48.6533333' AS DateTime2), CAST(N'2021-06-22T13:06:48.6533333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-22T13:07:37.7900000' AS DateTime2), N'87.116.23.185', N'IWHi/ONPaS2cNHn95qQ3I+TBapb8Vp+8ZvSSy1QP0YXbMkfd7iB2S0jL+Qa9t8fNsAzDM+IJ4TDJy0wcThAz1A==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (304, N'IWHi/ONPaS2cNHn95qQ3I+TBapb8Vp+8ZvSSy1QP0YXbMkfd7iB2S0jL+Qa9t8fNsAzDM+IJ4TDJy0wcThAz1A==', CAST(N'2021-06-29T13:07:37.7866667' AS DateTime2), CAST(N'2021-06-22T13:07:37.7866667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:13:21.6166667' AS DateTime2), N'87.116.23.185', N'p2i2ZcbaG07RBKysfE9OrN5V1Id9/hViKE9jHkY6aoboQyI6c9bBh7Rp7bud7wloBcTCXgZOFIfU5C3M0t92pw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (305, N'D56pufStdmISDuM7Ef2DMHHZXHSO4ByVWHZ1WwcNK3EvNsrel9SQccYdYJ1RpgfUd5EnJlk8CUxhQq4XhTcyRA==', CAST(N'2021-07-04T12:14:50.8066667' AS DateTime2), CAST(N'2021-06-27T12:14:50.8066667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 382)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (306, N'Vp13A4OY8lVTHAXLJgZQ5cWHUK/FqdOayi6RZUTQZD++IMEouh5oS+C4NUDrIgQF9d/sCwrhUZ/ZvRaVjrmvnw==', CAST(N'2021-07-04T12:15:21.7233333' AS DateTime2), CAST(N'2021-06-27T12:15:21.7233333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 384)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (307, N'FAvaUk2ZAUqMn+hcLrCF1FtJDC89O+i0e/KkBvvFZ6+HYhPYAMjcWs8ofw13J+cuHlfRxWYLfsbKPijYu/6stw==', CAST(N'2021-07-04T12:18:18.6333333' AS DateTime2), CAST(N'2021-06-27T12:18:18.6333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 385)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (308, N'SxKXw50rQa1hW3MrN5pJkPDYHyAxbur79V/qkwm5lVPa/k+qvUPWclAF8CwOFhw6tWtYqAw0J/Abm0xZ2C0gbQ==', CAST(N'2021-07-04T12:37:36.9366667' AS DateTime2), CAST(N'2021-06-27T12:37:36.9366667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (309, N'ICyj+k3S+B4qZwq9ftGym2dwVQWNcMhG6Ke89IXXU2WDuELHApL8f3CyCwX9JAtBzj1Icb9NCIew3gsJo5MpXA==', CAST(N'2021-07-04T12:37:38.1133333' AS DateTime2), CAST(N'2021-06-27T12:37:38.1133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (310, N'ohr+55ftW+AXBf869NTsZg0iXZ3nWj+4tn2k0gyNArPzDcPp5zQKqqenF9PdoN2GLZCasQ/u1F3CVpUKf1jI9w==', CAST(N'2021-07-04T12:37:39.0100000' AS DateTime2), CAST(N'2021-06-27T12:37:39.0100000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (311, N'oHnxswjROb8Hl9Vc1IfD8iKEQpnWgnoMsyGbU2WPkutUiRbsEFelJCb7I7W4bNkePq+ig1YeeHZAY32Qo0vBfg==', CAST(N'2021-07-04T12:37:39.8333333' AS DateTime2), CAST(N'2021-06-27T12:37:39.8333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (312, N'qYD7P4SrhpZtZA9bLV2HmMaZoNDFJ/nEU0D3/CUFk8MPvLVzkIWVipFt2eSTaoXXR56oJTvMHtMAiIDRHKIl+w==', CAST(N'2021-07-04T12:37:40.6800000' AS DateTime2), CAST(N'2021-06-27T12:37:40.6800000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (313, N'TQlfi/vs94ZVQkFMoJg6HJCP139S8tLUItMS2BOInf77gW+NtIXnvvJQ83HtPAWEMHoifzWtTQ3VOaaZsyQKYA==', CAST(N'2021-07-04T12:37:41.4900000' AS DateTime2), CAST(N'2021-06-27T12:37:41.4900000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (314, N'O/XtoXHJLS+r3YOLc0nyZynUgX/WxsfG/fjcgxfUcALK4UsD5m1RqH2HFY1IQfufgT40OBHqASfmYWbmqzva2g==', CAST(N'2021-07-04T12:37:43.1266667' AS DateTime2), CAST(N'2021-06-27T12:37:43.1266667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (315, N'0u9NTMdMOyy2Ccx4PzajYka14W1XF4pfI2zlnrwMZCLc6lZiTS3eshegS24ILDQs/uTSXKLZLWSGpLw0rRBZHQ==', CAST(N'2021-07-04T12:37:44.0200000' AS DateTime2), CAST(N'2021-06-27T12:37:44.0200000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (316, N'ADFuh9MUnx4orb2GKqanWWrmksFxAI15k7r4lQQAHIF6tF3EP2QF24Vl5My8A9e1Wj0BLxIRINAOeoz5U4wyOA==', CAST(N'2021-07-04T12:37:44.9333333' AS DateTime2), CAST(N'2021-06-27T12:37:44.9333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (317, N'LzaVt/heXm4x31u/Ki6t7NO2ChVxfnSkYhRcXsPmXTepjKn5wbTHFYuIPA0ZiG/aNT9PBsRLTSiAI10URU+2RA==', CAST(N'2021-07-04T12:37:46.4966667' AS DateTime2), CAST(N'2021-06-27T12:37:46.4966667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (318, N'zajZB30aDTiO+ZmJz2byRZelmoxf5T1KEfdIsI114ruqn8Uae+h9/2iiqU+FmOp7wul76uAzBi3LlhBuNlBW6w==', CAST(N'2021-07-04T12:37:47.3566667' AS DateTime2), CAST(N'2021-06-27T12:37:47.3566667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (319, N'TxxWAPsoUXgSsE6UwCNdAbzKzX6nTPZLYx+4INH/hPz5YHryGMNQUqY3dwIVDrKF5Yz2Qi7QBS8jyK/RUlK7ng==', CAST(N'2021-07-04T12:37:51.5066667' AS DateTime2), CAST(N'2021-06-27T12:37:51.5066667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 386)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (320, N'HLpamwAR9xSHnSJ904OS4JJrfiRo9RAefQ+U/bWOtCVma1TfOeB+NR8f3ft7lgYKDkXS9H39HFJtEBQTp0afcQ==', CAST(N'2021-07-04T12:37:53.9433333' AS DateTime2), CAST(N'2021-06-27T12:37:53.9433333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 388)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (321, N'5n6GFd8TjfjV2UyAUmMIdVbILRK6mac2XC42GeRfzd67TTddwjFiJsP3seORIwvgUdGSFyCfjCwXF16pXl9YVA==', CAST(N'2021-07-04T12:37:55.4400000' AS DateTime2), CAST(N'2021-06-27T12:37:55.4400000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 390)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (322, N'WxpHsETQnl1gngtLep5uRZ4ZEXR6oQjP3SNGWEFca+qnSdB+JLgehcadz/DaIIFpt/V5LocR5+vlJ6+iabbptA==', CAST(N'2021-07-04T12:37:56.1666667' AS DateTime2), CAST(N'2021-06-27T12:37:56.1666667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-27T12:37:56.2300000' AS DateTime2), N'0.0.0.0', NULL, 394)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (323, N'KHREUFi8MidedOzJURkgYh1VpvUhF67BuaatVd/xEm0hnmPUwI8QsHD6JcDppOebGMy1l4spVp853d5Rn8garA==', CAST(N'2021-07-04T13:11:57.5000000' AS DateTime2), CAST(N'2021-06-27T13:11:57.5000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (324, N'ddUDKKn5vLNxNoy+9YFv/8uEsSuHtYTuWnmDDXSnP7RRnlRhNzxXh3TPGyh7bsyHZOXuN/3PW/4E8S/knAkLAw==', CAST(N'2021-07-04T13:12:50.2733333' AS DateTime2), CAST(N'2021-06-27T13:12:50.2733333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (325, N'4PyyuZSEkg68KZRORaMya2GdaDmNL2bL+MVVf15swL/dYjpgp5579Q3CyDo59rQe4U3+wAyk1ATzEvr+8PcMxQ==', CAST(N'2021-07-04T13:17:12.9633333' AS DateTime2), CAST(N'2021-06-27T13:17:12.9633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (326, N'p1kpbnx1owYlpJ9bXulEzVZGG0P/dMCs5QdVbe6TKljrBMCCYD4Uxf1Bo0eGCwuuPDt1fidAH7y6mTgaa6ASeg==', CAST(N'2021-07-04T13:20:31.0166667' AS DateTime2), CAST(N'2021-06-27T13:20:31.0166667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (327, N'P0Q15jKkAYYoenvjTEAUzN24TUNQ56TnSCaSVBhRBpiE8HITYWT2Ar2owU+xR+iWWkXBRiUDskuXwDeB7h6n1A==', CAST(N'2021-07-04T13:22:42.0133333' AS DateTime2), CAST(N'2021-06-27T13:22:42.0133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (328, N'jXdfi2wXKM2ukYYfIODrDcDktZmO/xdPyyKIacpC04P8TMAZEV+1guu7PbV7YurYopXIsh4y53XQK7exeuQnNA==', CAST(N'2021-07-04T13:23:09.4100000' AS DateTime2), CAST(N'2021-06-27T13:23:09.4100000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-27T13:23:30.6833333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (329, N'SLaeS0+IguAcvT+dGSc2Tgl6QIU2rcHzgUjJ1QPFw0XHaMC6MflPjQYWPjRCnoqguaJ7jy8eaQcptttHAUzvvA==', CAST(N'2021-07-05T06:49:43.0000000' AS DateTime2), CAST(N'2021-06-28T06:49:43.0000000' AS DateTime2), N'0.0.0.1', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (330, N'zKWswcC6n95EmfSW0J0yP0ihbiG1QwQqrKkqU5PYqHgUdkeXHLoQFC3lOgX8YzgFIW8XXbSoINRjRABumjKXeA==', CAST(N'2021-07-05T07:06:59.3400000' AS DateTime2), CAST(N'2021-06-28T07:06:59.3400000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (331, N'LZZH2YAHUzJv4LB1zIN/jeV+6OdMYch5GXIAqlDq/OcjkY5gqbroSIbn03mtAIfDx+aJIqNW+D1uMKSB60br4g==', CAST(N'2021-07-05T07:07:24.1233333' AS DateTime2), CAST(N'2021-06-28T07:07:24.1233333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (332, N'p2i2ZcbaG07RBKysfE9OrN5V1Id9/hViKE9jHkY6aoboQyI6c9bBh7Rp7bud7wloBcTCXgZOFIfU5C3M0t92pw==', CAST(N'2021-07-05T07:13:21.5833333' AS DateTime2), CAST(N'2021-06-28T07:13:21.5833333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:13:24.3000000' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (333, N'bpbd/+jOnfvHvn4eeGsCz6uM8OZSw7MUvQc7uLtCp03Fmc/1VgTRfNgR8t95ia0PcGT4g0Py7xwdObl+2zag5Q==', CAST(N'2021-07-05T07:14:00.2000000' AS DateTime2), CAST(N'2021-06-28T07:14:00.2000000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (334, N'jwftyGNut0DiA96LPZG1GHVOCk7HVfZFnMubxO0WQOrRbx2omQtm2Iijl58FuNBB4QF88ulKrkay3haW36aLeg==', CAST(N'2021-07-05T07:15:35.4400000' AS DateTime2), CAST(N'2021-06-28T07:15:35.4400000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (335, N'45t2JEzSXiGUHenpCiVox30FCa4v2tQIjbcykLQTkweq9K2UjRZ2WVamqoG0RNJLDs/dRRph7rQXsIFRwFrByg==', CAST(N'2021-07-05T07:17:16.1933333' AS DateTime2), CAST(N'2021-06-28T07:17:16.1933333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:17:33.8166667' AS DateTime2), N'87.116.23.185', N'1Otlx/9EeA9f0tE2hzXD8NwJfUJfP68vDF+QvKC/3D1AsgV9Bi/w36XEWSdRHpV3rHVz/1a+inzz//261qMekQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (336, N'1Otlx/9EeA9f0tE2hzXD8NwJfUJfP68vDF+QvKC/3D1AsgV9Bi/w36XEWSdRHpV3rHVz/1a+inzz//261qMekQ==', CAST(N'2021-07-05T07:17:33.8066667' AS DateTime2), CAST(N'2021-06-28T07:17:33.8066667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (337, N'j/KHxO0ddajRtyZycVIsod03Iesd8XfhcgU3/TIkU4l7XD6WuffR55NU4tsvrnEFrCq1kuAr/x4KJzKeqYRfEQ==', CAST(N'2021-07-05T07:18:23.6500000' AS DateTime2), CAST(N'2021-06-28T07:18:23.6500000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (338, N'OxB3dd1sAsAvtZupxlLCqtua8xXeydi9fMyk8B+ZB83uk6gDhV0OUgQPcCsuWfNrT8Ch9FFrKzrROvDNlBeRdA==', CAST(N'2021-07-05T07:25:08.6200000' AS DateTime2), CAST(N'2021-06-28T07:25:08.6200000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (339, N'agsFrW6+aRgYZfLupbezzWNOyaq0+4khGPgSA0Oi9nIsdAcXozUHrYkXT11mhePMH1ojuLj9tHpzJB1gLYRNEA==', CAST(N'2021-07-05T07:26:29.3600000' AS DateTime2), CAST(N'2021-06-28T07:26:29.3600000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (340, N'On8phzxDFEW6SGBGz+8BCi+XF59Ajz9oRBszs5fBM/QQtaDNvlgw9M9A8Yts/NjFPD9z6gtrMii46RtMbPQ1uQ==', CAST(N'2021-07-05T07:31:47.1700000' AS DateTime2), CAST(N'2021-06-28T07:31:47.1700000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:31:52.3133333' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (341, N'86yz3DDca7dJcbijS8/rhj4BLQiIoU5HuHHOUfqdfTpgzSObSkot8vIpcnDGM6smgWc5NIYiZAuALPBx6mnIAQ==', CAST(N'2021-07-05T07:33:45.8066667' AS DateTime2), CAST(N'2021-06-28T07:33:45.8066667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (342, N'ASt8up3xJiSMYBj7WmWw/XMHoegAhcr5dPIXwcSFcpMCVHIokuHv4FzvCPKxAlc0K5kbn4im2BrgRPVdeg9yrA==', CAST(N'2021-07-05T07:37:42.7966667' AS DateTime2), CAST(N'2021-06-28T07:37:42.7966667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:37:52.5233333' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (343, N'gPzZkpX3tcMS/PF/B8E4kRqFpzRwstY3dtbzzvN5dJIy6qm8BLSIzm1YBOm4+Ca74n2l37oR2H8Slh6s68bO2g==', CAST(N'2021-07-05T07:38:31.2033333' AS DateTime2), CAST(N'2021-06-28T07:38:31.2033333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T07:38:37.7833333' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (344, N'CtmUU+0LAD25EJsmLqWu3VVB4HuwinpXy0Qmeqo2chHV5WIppLPSLxUcAesGkEZfs+5uH3sE8YA7l9CIDLIstg==', CAST(N'2021-07-05T09:01:03.3066667' AS DateTime2), CAST(N'2021-06-28T09:01:03.3066667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 402)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (345, N'j9h7Wymr4Fey3+rKQKmm4VX790hV7oUCUIlLH3C5lz6Ijx2RqYNmAiwiy4vPo7hYbWeM+FBbDAtBdaoyPvHfdA==', CAST(N'2021-07-05T09:01:09.9433333' AS DateTime2), CAST(N'2021-06-28T09:01:09.9433333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 403)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (346, N'9CP5Ktrkordgw1mPjwtVfTeQRe1bR740q/BZ9uhatSwQETWeBqf6/2digjUfjopfoCrS9tm0C1TisqsuzC35Fg==', CAST(N'2021-07-05T09:01:18.2166667' AS DateTime2), CAST(N'2021-06-28T09:01:18.2166667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (347, N'HAv8JZ4ba0Z62YRk9LAyjGtq2+2K787du3wY8q7cAGQtg/p+GxXiSFdwjTp0XGG/vBUJzOKm2O0MeI5Dh1lCHA==', CAST(N'2021-07-05T09:01:19.4933333' AS DateTime2), CAST(N'2021-06-28T09:01:19.4933333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (348, N'AQBhAYdZACty8ktnsZhJyDqUWXbPsZwjzXJjAUPfwkKyLnzWDomAIA03s4hVc0X4F86Rvs1qspUF6Tw3BEAFDA==', CAST(N'2021-07-05T09:01:20.7333333' AS DateTime2), CAST(N'2021-06-28T09:01:20.7333333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (349, N'C/2D/HpeqWQF9LVYlEiinyflQkhn2xcIgoAoB5+Uk/ICMEVuNdySQZLR7p59FxePuT2QWiaqG7li8nugWv3bqg==', CAST(N'2021-07-05T09:01:22.0366667' AS DateTime2), CAST(N'2021-06-28T09:01:22.0366667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (350, N'5cZlZRfXUz4fnRyfpVJMco9Pa8elTK1M5SwA2775iE18DCRJ1E1aPz6liCs9IpOnrp3GxNwof9Rmea1+Fk/bFg==', CAST(N'2021-07-05T09:01:23.2933333' AS DateTime2), CAST(N'2021-06-28T09:01:23.2933333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (351, N'dmA2n/Xxg0b4zIrUGEJCjdNf/RaGdgvwc9n45eJUrDjtOtROyt9l5wDuk+HoblH3KQqj5w5wbnJldRbGICVoGw==', CAST(N'2021-07-05T09:01:24.5700000' AS DateTime2), CAST(N'2021-06-28T09:01:24.5700000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (352, N'iXPbNKhAA1Q7/aL8bU5YTm2XkiuojrISR652qkjJOPlG0ahewS/+ne8SXPnq405hx7efosYcQklIW8q+fOx5Dw==', CAST(N'2021-07-05T09:01:26.4866667' AS DateTime2), CAST(N'2021-06-28T09:01:26.4866667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (353, N'luIY1Yt6leLN7Cyb0dMoTLo+8fB/V0bvMtEUEAmVjhXPg5F/jM9oL9gNsN6XZGyvRoJKJO3r5hF6yRCdWFy0zg==', CAST(N'2021-07-05T09:01:27.7533333' AS DateTime2), CAST(N'2021-06-28T09:01:27.7533333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (354, N'uSh0zZaiOv9HtAFqtC9oznRiJnoaAISu2ixsgU830jSQtsLhm/Or/hNTZzcIZ6cruj7Ghyy4Nl+9MfUDpYHFug==', CAST(N'2021-07-05T09:01:29.0366667' AS DateTime2), CAST(N'2021-06-28T09:01:29.0366667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (355, N'Zti4a5mwnP/KWceLgj8gDFOJkeR3Dg2/7ltdS8L0p3+0hUMOSVfdJZF1eNtms9ZjC/nmS+N/o9coObtUQbMXkQ==', CAST(N'2021-07-05T09:01:30.8933333' AS DateTime2), CAST(N'2021-06-28T09:01:30.8933333' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (356, N'JoOyulWW/KdmPNMa3A6PYmn7U3YZwWpvXJ9+HtJuEYUy80I4UOfV2KazWvHJEDqHT1lVfEoZsXIzjnHhkKa9ag==', CAST(N'2021-07-05T09:01:32.1766667' AS DateTime2), CAST(N'2021-06-28T09:01:32.1766667' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (357, N'u7Nu11tOoT0KLMslq00E401lFMawYu5NFf+epRwzei6L3pw4ELy4NjyfGtCGzD4fMFLWTJ+vtjE7WAn+gqTEng==', CAST(N'2021-07-05T09:01:36.6100000' AS DateTime2), CAST(N'2021-06-28T09:01:36.6100000' AS DateTime2), N'93.176.82.58', NULL, NULL, NULL, 405)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (358, N'Do008mJsuGIs4qo7a5vBR5RuYtvLQW+SJLVwBW2QxFW6JI/epH9GllK4mZcPjhwijeCaMBDZ5z8c34SuZ0OKyw==', CAST(N'2021-07-05T09:01:38.4733333' AS DateTime2), CAST(N'2021-06-28T09:01:38.4733333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 408)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (359, N'lgrNvlsvaLsQjfwvhWfoscQXd8DwuzE1FdMd8lubtqLY5NNBrebo5ybCnKsnJBOdp3w0NzbTZYjjp/bqhMo7uw==', CAST(N'2021-07-05T09:01:38.9466667' AS DateTime2), CAST(N'2021-06-28T09:01:38.9466667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T09:01:38.9733333' AS DateTime2), N'0.0.0.0', NULL, 412)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (360, N'1tVaaQmT9cA371ZI6vuoFDW2VDUTroCtlPr7PSHqgf7vBrAlyAD+DSOiCtQGOLPxucRg5WHu+WLPiRXGCgsrOw==', CAST(N'2021-07-05T09:02:57.5166667' AS DateTime2), CAST(N'2021-06-28T09:02:57.5166667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (361, N'7NrdyAGLX/tyRprH5lhbWv+atST92o0M1o2MPKlNUogQ3OOu2V0ePGCd5ssC+d83jF8CZXMMdx7ayJP5B0mPug==', CAST(N'2021-07-05T09:31:19.6666667' AS DateTime2), CAST(N'2021-06-28T09:31:19.6666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:32:40.5233333' AS DateTime2), N'87.116.23.185', N'Fu2191uHUW7IHGGsyCJPTGvO5A+pdxc9QQOkpJ8XStXN2ZXIbGU7+PXCP8T5NA0Q0KfxUUfSogsf5GMeDWTpdA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (362, N'Fu2191uHUW7IHGGsyCJPTGvO5A+pdxc9QQOkpJ8XStXN2ZXIbGU7+PXCP8T5NA0Q0KfxUUfSogsf5GMeDWTpdA==', CAST(N'2021-07-05T09:32:40.5133333' AS DateTime2), CAST(N'2021-06-28T09:32:40.5133333' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (363, N'fNePbFLINpAlP3uQZtK2tYqGjwaWfIBd5RwuIg1DhryLqzI36ammBVfLzfIiU4XmALathHIgQsX/eFF/aG2HAg==', CAST(N'2021-07-05T09:37:02.1666667' AS DateTime2), CAST(N'2021-06-28T09:37:02.1666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:44:17.5266667' AS DateTime2), N'87.116.23.185', N'WFeoG5osF+X/JUvi7X5N/bDSJpIYb8w8czH2/ZoM8J1rVjtpCKEwMaUbdwoyDEKD7FEhHYuqgY0A2PmJ+rzKnw==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (364, N'WFeoG5osF+X/JUvi7X5N/bDSJpIYb8w8czH2/ZoM8J1rVjtpCKEwMaUbdwoyDEKD7FEhHYuqgY0A2PmJ+rzKnw==', CAST(N'2021-07-05T09:44:17.4866667' AS DateTime2), CAST(N'2021-06-28T09:44:17.4866667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (365, N'sxRuo9g++2uze4f2C+hWIoVDAhmoh0NiU+GqDXRqVhzshxZX1g2zznqF1OJ+jzPturL4v71iMMZFrKbN8lewUg==', CAST(N'2021-07-05T09:46:41.2166667' AS DateTime2), CAST(N'2021-06-28T09:46:41.2166667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:48:02.2666667' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (366, N'hGAhiYkE5NuC3w6hYJXiSYk2TSzHMfTadwuv7LwdAbGjKW6SnhKKGnQS8NRsCJUhN+DEv+wATqe49y8Uv8g07w==', CAST(N'2021-07-05T09:53:03.9233333' AS DateTime2), CAST(N'2021-06-28T09:53:03.9233333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:53:16.0200000' AS DateTime2), N'87.116.23.185', N'GHyA6B/fWs1jYX7Bq7IVEegkQVp8CfwHrev8azhNAqRf72ZKsRq/BA+CX4SMR3FOfcO+2cK/InGvgCkAG/D8qA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (367, N'GHyA6B/fWs1jYX7Bq7IVEegkQVp8CfwHrev8azhNAqRf72ZKsRq/BA+CX4SMR3FOfcO+2cK/InGvgCkAG/D8qA==', CAST(N'2021-07-05T09:53:16.0133333' AS DateTime2), CAST(N'2021-06-28T09:53:16.0133333' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (368, N'QcO49jHr8zWSaaFCpLAHlFDcG3jwh0aH0v/JNNdBn19oopppj5Mm5XZZYbVptuCwqizZ5bqvvC2aKXXjodN9bw==', CAST(N'2021-07-05T09:54:34.6133333' AS DateTime2), CAST(N'2021-06-28T09:54:34.6133333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:54:42.5500000' AS DateTime2), N'87.116.23.185', N'eUX/y7ZFZDGG2eYEmULqAnqqAbopW1Sxra1WT7RoGBCIfCdjFDaeoC8e+/CZNUiqzBsPRe0UO5xlXyXzAewuqA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (369, N'eUX/y7ZFZDGG2eYEmULqAnqqAbopW1Sxra1WT7RoGBCIfCdjFDaeoC8e+/CZNUiqzBsPRe0UO5xlXyXzAewuqA==', CAST(N'2021-07-05T09:54:42.5466667' AS DateTime2), CAST(N'2021-06-28T09:54:42.5466667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (370, N'LsN+Q3fL7RJAgxmq9bbxw2VixbVQ2fQ56wl+l4AkZwfTcvd76gb3m96vsJ0v5G/GCmr3J68LWbpKYrbvabCxtw==', CAST(N'2021-07-05T09:55:32.4766667' AS DateTime2), CAST(N'2021-06-28T09:55:32.4766667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:55:39.5033333' AS DateTime2), N'87.116.23.185', N'Z0KnJyy3wLNoJwDkTOUuYmZUfgxNl7DdyOWXzxaYloYtDzjJQymLkzE0z4G1fQVt2hqU4H2RJLjbmfij3ZaDNQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (371, N'Z0KnJyy3wLNoJwDkTOUuYmZUfgxNl7DdyOWXzxaYloYtDzjJQymLkzE0z4G1fQVt2hqU4H2RJLjbmfij3ZaDNQ==', CAST(N'2021-07-05T09:55:39.4966667' AS DateTime2), CAST(N'2021-06-28T09:55:39.4966667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (372, N'M03yCXd86OVyiLnGihAxb0HtbBhqDy1Z3DCqaSt/M4f0jk0c0WyijWkiQoHiGWxEgmXNxJQcuuV/vJfnuYXjeA==', CAST(N'2021-07-05T09:57:15.5633333' AS DateTime2), CAST(N'2021-06-28T09:57:15.5633333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:58:03.5666667' AS DateTime2), N'87.116.23.185', N'ZV6nrvKYNrG8qLUkpaUxUc6+th+GutQfyVia+8tmH4cwOMGBI68qbJKmUvPFVC2v8veEkldRDxylQU/+MBYgeQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (373, N'ZV6nrvKYNrG8qLUkpaUxUc6+th+GutQfyVia+8tmH4cwOMGBI68qbJKmUvPFVC2v8veEkldRDxylQU/+MBYgeQ==', CAST(N'2021-07-05T09:58:03.5600000' AS DateTime2), CAST(N'2021-06-28T09:58:03.5600000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (374, N'fFVvdn5ixZVW2n2txDz9wEb2uL9hujIxDZv6jlALSBDv7KcsJn52wPge2yTq+5Ef2+4lSuAN7mtv0yHioF/jKw==', CAST(N'2021-07-05T09:59:40.2866667' AS DateTime2), CAST(N'2021-06-28T09:59:40.2866667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T09:59:53.7966667' AS DateTime2), N'87.116.23.185', N'1RA6RmCgUwGj+9pg22IN5Rkexxuh+4dwf+eKjj8nQG87z8ZXblmbWN9oPtKL8wwNhuF7PfkK9OhrOkz4Gy7fLQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (375, N'1RA6RmCgUwGj+9pg22IN5Rkexxuh+4dwf+eKjj8nQG87z8ZXblmbWN9oPtKL8wwNhuF7PfkK9OhrOkz4Gy7fLQ==', CAST(N'2021-07-05T09:59:53.7900000' AS DateTime2), CAST(N'2021-06-28T09:59:53.7900000' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (376, N'bEp/ZZZU/aISEjQiZcVtecScyLyrEv/+FGwQsh+tS3Nnm8SrcKLCZqEAYuK/8zt7VivfB5ggC4sUfodDDKBrlQ==', CAST(N'2021-07-05T10:01:28.8666667' AS DateTime2), CAST(N'2021-06-28T10:01:28.8666667' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T10:01:42.4600000' AS DateTime2), N'87.116.23.185', N'g8kP+iiBvs8aUIf7UVtpgHRUro+9Z/lLj73mXScQvszAbCL+YKWqE3P92rNYKiGNmNitXe8sDT3/7qk3Vnd7hQ==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (377, N'g8kP+iiBvs8aUIf7UVtpgHRUro+9Z/lLj73mXScQvszAbCL+YKWqE3P92rNYKiGNmNitXe8sDT3/7qk3Vnd7hQ==', CAST(N'2021-07-05T10:01:42.4533333' AS DateTime2), CAST(N'2021-06-28T10:01:42.4533333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-28T10:01:56.7200000' AS DateTime2), N'87.116.23.185', N'skefwgdILMO9cfxloxVNJNlB1FqxmDokAxAMzMeJoQJ470pFmyY0EKOTGQAd/g57Ks2f0bLK0in9hiuaS3t+aA==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (378, N'skefwgdILMO9cfxloxVNJNlB1FqxmDokAxAMzMeJoQJ470pFmyY0EKOTGQAd/g57Ks2f0bLK0in9hiuaS3t+aA==', CAST(N'2021-07-05T10:01:56.7100000' AS DateTime2), CAST(N'2021-06-28T10:01:56.7100000' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-29T07:00:18.1600000' AS DateTime2), N'87.116.23.185', N'AI9m0OAit6Cgeiqn2Zg/R4TfvSxxHAmsTJdyzN8zbZX/p79ByZ67ceXU19pO9iLHM0R9ce4ErnxG7574bGTwIg==', 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (379, N'oMnnoLM5xumh6VAUSpUER69mVf4q+Rg3UJKwKw3h3/slg/SLLsGu4YyKaWjR20P47LDnG/L0QGQtDb5rw4W40Q==', CAST(N'2021-07-05T10:38:54.3033333' AS DateTime2), CAST(N'2021-06-28T10:38:54.3033333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (380, N'NjP3+gCYQOOIjBhmBEOmssdtk3pzz8YSVg8FcM2dYMF1K0ZNqqvZnriKdX+HOw4sM1zpzSLAPQ94u80Ccp9QUg==', CAST(N'2021-07-05T10:38:55.8100000' AS DateTime2), CAST(N'2021-06-28T10:38:55.8100000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (381, N'cOn43X/edWd1EHVuW+iRCbeZStW9hlJEIoJsaCtlDpoFqy07bUQWAoO4xa4rvMnNEl7OiBk5LnHvIphUIs++PA==', CAST(N'2021-07-05T10:38:57.0733333' AS DateTime2), CAST(N'2021-06-28T10:38:57.0733333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (382, N'3cURwNkGHx1PSPUFTj0Gnuh+6ZyXhHXrJXrw+yH8fDDK+9rFx6DHVu4s8pL7+TkZvpX45PP0mbuljLx7JVNzFg==', CAST(N'2021-07-05T10:38:58.3400000' AS DateTime2), CAST(N'2021-06-28T10:38:58.3400000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (383, N'9zF0+T7nTv3kVwsSnjmvW06UDqy/jjfTvgqz9wATSB00OTzQnqxDXhrmxw++Pee2c5K49qRbBN/So9Ee1MDjLA==', CAST(N'2021-07-05T10:38:59.7466667' AS DateTime2), CAST(N'2021-06-28T10:38:59.7466667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (384, N'PwmfJh81SrDNbRCu97am9e9lev4EPSN+9DyBPHWGYsgt/+VRGDYSo/cue74dgmzuECoFNgjSTX0hPUl8SZfurg==', CAST(N'2021-07-05T10:39:01.0833333' AS DateTime2), CAST(N'2021-06-28T10:39:01.0833333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (385, N'RI8FsAdRYVNKvYsVJ1uFJI3lpTiNWEGOvstASAn1BNsyOmE+QgvHAkzSTeSjKsbVX3s2lVvqmgAS1b3HMBCamg==', CAST(N'2021-07-05T10:39:03.0133333' AS DateTime2), CAST(N'2021-06-28T10:39:03.0133333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (386, N'Q0h/HRNshxYgo9pIxzpVKh54NiG1u4M954IMRMc74dSsMXRxTHybS/zf+nPxnjNTDqIthowHs3Nf9V8qjTU5MQ==', CAST(N'2021-07-05T10:39:04.3166667' AS DateTime2), CAST(N'2021-06-28T10:39:04.3166667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (387, N'sF2wodiWWkchH0yEGruo/ol6zkyFZaQzm0tSXPFvJw13/edl0O7VZXETOp8d57KTSnJ52UzvV2CfaK2p/6Kziw==', CAST(N'2021-07-05T10:39:05.5766667' AS DateTime2), CAST(N'2021-06-28T10:39:05.5766667' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (388, N'gXgTBxyLWI03MMebo0C7K8rzvSi61p3TbLeKjcXho2a/YisWtGRcSD7rWWhcnB9+WY2aXE9oJUYGwUx39bVflw==', CAST(N'2021-07-05T10:39:07.4533333' AS DateTime2), CAST(N'2021-06-28T10:39:07.4533333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (389, N'kJIyrd3G5b0MUuv55z8Nvn/VuwOudEJMoQ9lst7zYADPB+IRlI8XkCuatNbN2T4hJgJd3CA6tXaLEkTCpCG0OA==', CAST(N'2021-07-05T10:39:08.7233333' AS DateTime2), CAST(N'2021-06-28T10:39:08.7233333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (390, N'mIlVHxulF0cinvk5e4m6b5ivw46TwtcxqUAe041PUtpZZOrSn8lfsr4xhW62beZpiglG/S5JY5SItgdTAMCYxQ==', CAST(N'2021-07-05T10:39:13.1600000' AS DateTime2), CAST(N'2021-06-28T10:39:13.1600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 413)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (391, N'zbNEkNJr7lR6CFdgOGADJuTda14K/1m0PT1E51MkbzhY17eLrFaJKt5VBXGgc7sQmVqiOZpAGW3MkAJOrTMD5g==', CAST(N'2021-07-05T10:39:15.3100000' AS DateTime2), CAST(N'2021-06-28T10:39:15.3100000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 416)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (392, N'6d23HX0o9VHCCn866mjidnCOdIYPm6A9Aq8hGtozCXzzcew1p1ZKv8xn4K/y1UV0qL7eI0lFFVMeFoutMtZWHQ==', CAST(N'2021-07-05T10:39:16.9533333' AS DateTime2), CAST(N'2021-06-28T10:39:16.9533333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T10:39:16.9766667' AS DateTime2), N'0.0.0.0', NULL, 420)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (393, N'dj/9H7DsBCImZvgxtXW2VZuDQElffyC0nKXEwKA55nacv9EPhSmDtmTu3LpvoSXYbfR/qdbth2Hqm+af3zeYNQ==', CAST(N'2021-07-05T11:01:23.1933333' AS DateTime2), CAST(N'2021-06-28T11:01:23.1933333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 422)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (394, N'vYRgnzOYnYSFCW7cEdtANBJh3MCtKi5GzwTT5aIzDNlEib17zOedah/+pjwmSU8DkmDkgMbW7raGmXZbqNpNMQ==', CAST(N'2021-07-05T11:01:23.8300000' AS DateTime2), CAST(N'2021-06-28T11:01:23.8300000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T11:01:23.8533333' AS DateTime2), N'0.0.0.0', NULL, 426)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (395, N'gHxMCPScZKmBDQyBuX0jHAYloBiFAn8Mc1krQKd5pSdBI/4riiiTAC3dh5gD3YbuVzrC07Pe/0lOt1mzl6SITQ==', CAST(N'2021-07-05T11:01:44.6233333' AS DateTime2), CAST(N'2021-06-28T11:01:44.6233333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 428)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (396, N'mSdGoonBOD3kTAub6ADff20e8JpQYpCJoH4jCG4/Kaefdvf9NaSfbGnqqe5wxVMyncZNyEwdMyGoZ3Ht+S49tQ==', CAST(N'2021-07-05T11:01:45.2133333' AS DateTime2), CAST(N'2021-06-28T11:01:45.2133333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T11:01:45.2466667' AS DateTime2), N'0.0.0.0', NULL, 432)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (397, N'C7TzqI4jzKoD8bnnsGBamteOnaCUi9dPGJx4cUHSkdj2LPSVlLeYzyJXy5whhy92jyZvMjyyHnJdUwD43Zx01g==', CAST(N'2021-07-05T11:28:16.8200000' AS DateTime2), CAST(N'2021-06-28T11:28:16.8200000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T11:28:16.9600000' AS DateTime2), N'0.0.0.0', NULL, 437)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (398, N'J2ko/V0Vqvl7qxKDnEe/FBW123WaiDL1JpePyBQipxpXLDuFjfrEiEsH0A1WQN3fLhPBJKlqyc2DCiVSfLNBPA==', CAST(N'2021-07-05T11:28:26.5566667' AS DateTime2), CAST(N'2021-06-28T11:28:26.5566667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 438)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (399, N'bTxue5UzO5+mE8YvvzlES2tUuLRJAmmPgEG4BQn0VYqGdci68HxngIrHnEqRtiIVEr2QPFd9At6mYRU3d+QbPA==', CAST(N'2021-07-05T11:28:31.9766667' AS DateTime2), CAST(N'2021-06-28T11:28:31.9766667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 440)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (400, N'hrPnwA8lOJhO8W+fMzM7S8lC5Rk917d3yJ1U0IHnA0zfGpSa9ghD5JxzlSDsvC7wfGTi3mrOyLRorOGD/siZwA==', CAST(N'2021-07-05T11:28:32.8166667' AS DateTime2), CAST(N'2021-06-28T11:28:32.8166667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T11:28:32.8700000' AS DateTime2), N'0.0.0.0', NULL, 444)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (401, N'/DROsECLYtsQ1E+MDtt2ERER/GW6ZDRO2gigQ7cRb2z2hDfmkq5WvDwwNS7F9xmPopRGw11DCLKrbg2qFR/uOA==', CAST(N'2021-07-05T12:17:28.4800000' AS DateTime2), CAST(N'2021-06-28T12:17:28.4800000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 446)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (402, N'CiorCgwDeTc6vXYGUDMT4IIjOCwLFWenty5wx+c5ZfbrVV8dyQNCYMDCmThEN+wKTyRmmAgXklkja+OYoNWcuw==', CAST(N'2021-07-05T14:02:46.6900000' AS DateTime2), CAST(N'2021-06-28T14:02:46.6900000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (403, N'iM5a19syWWfs10nBYqeMZNXxEKqAy6dZSFOsJBMD/9sfAcZAHrbuffVd8DlLAR+R+0DV9EO6C/yPjrLv6gzebQ==', CAST(N'2021-07-05T14:02:48.6633333' AS DateTime2), CAST(N'2021-06-28T14:02:48.6633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (404, N'8i0kcBiGeqDWgnOwJfz0O9E1Ic9SOwrKRGOG0Napxb4jUjv8AsIj2XimYr0WpG6SAZbuGL1H/j0dQM5zLVVkNg==', CAST(N'2021-07-05T14:02:50.2233333' AS DateTime2), CAST(N'2021-06-28T14:02:50.2233333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (405, N'o1Jj8l9x3FlUYbXYRt8RiEcWMlFhdLT5cZ9/RV0+3LqyFMovPkpDbgAlhVUxJ7YDmDLOtUPOXhfhXiFdbKzqNA==', CAST(N'2021-07-05T14:02:51.8000000' AS DateTime2), CAST(N'2021-06-28T14:02:51.8000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (406, N'kYvYPZKmjWPwRPWAxNlhgWI7fIghZWAH61+gcCtl9SCETqA6OgqKuTTjybhAg8pVBDqWFfQIw0gE+XMyiKHGsg==', CAST(N'2021-07-05T14:02:53.2800000' AS DateTime2), CAST(N'2021-06-28T14:02:53.2800000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (407, N'tw4h8giQKXobp2+XXmE+NNpn5uRV8MIZ4CRamSHpPIFbC+zSxWEQSVIsfQ3RW7+5Wi6hDPOVPAsD6CXp4654BQ==', CAST(N'2021-07-05T14:02:54.8533333' AS DateTime2), CAST(N'2021-06-28T14:02:54.8533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (408, N'JeZmmfvsPwQdpFLFAb0eAbtresRJFlV1uelh/pFhvWEJkHOzGMrz0W6xTO+f2bjwZN00DiDGG40HSrqTP+TGGg==', CAST(N'2021-07-05T14:02:57.1666667' AS DateTime2), CAST(N'2021-06-28T14:02:57.1666667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (409, N'co3NLVTp8EZuierd3a2/KNPcOfySOPSCGyytJbYBMgPJU2nGNSPdExaye3OK/eQGCmqTNRS2LTjQlHPZeVxaww==', CAST(N'2021-07-05T14:02:58.7566667' AS DateTime2), CAST(N'2021-06-28T14:02:58.7566667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (410, N'qdZe3GOFg8AbNpIoA/m9eA/zjtuiqO14xAa+rURbbwpKF1TLPq5AW/kHF53SYxSeARkC0DAskMOQYS6kDSHpEQ==', CAST(N'2021-07-05T14:03:00.2900000' AS DateTime2), CAST(N'2021-06-28T14:03:00.2900000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (411, N'Tlcvl8wW8y0X0FP6DGJ3ddfNYRxwVbH+DuRFyMAo3b/6lcdo4HNGqeFk8+mT6J8xV4fDXnAW9sVqJ0nZNbvMzQ==', CAST(N'2021-07-05T14:03:02.5366667' AS DateTime2), CAST(N'2021-06-28T14:03:02.5366667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (412, N'dZ9yHpWotiEl4jE2s2nO+XdMoVCHjjepo1xK7xxp0CjcJMY+Mcx991Su/wuLC2f+njvof3ft+cjdl1Mp5HfcXw==', CAST(N'2021-07-05T14:03:04.0900000' AS DateTime2), CAST(N'2021-06-28T14:03:04.0900000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (413, N'9EZlt+ghsTHVsVdKBgljJ7pW107bPQBwQDnRRAd62Z/UpQbxp8dTamQrfDPoTmB2ODgRzUz35A9HHc28i/WNtQ==', CAST(N'2021-07-05T14:03:09.5000000' AS DateTime2), CAST(N'2021-06-28T14:03:09.5000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 448)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (414, N'kmwuHWndxoTAEQL1hVuxFHYyhh2aJ5/CpFNO86a72XTCkzHVuK8etz1oczi79Jcow07+Zv0JUhqOqo9vEs6Cvg==', CAST(N'2021-07-05T14:03:12.1333333' AS DateTime2), CAST(N'2021-06-28T14:03:12.1333333' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 451)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (415, N'IwpiIle/HS6Y/CutSNb95GKO0hyv8SshANFzVoqnpGxcP8Tko18+VGKpP1VihSDiV/eBHipqsEljCXPkodrsXQ==', CAST(N'2021-07-05T14:03:12.9800000' AS DateTime2), CAST(N'2021-06-28T14:03:12.9800000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:03:13.0400000' AS DateTime2), N'0.0.0.0', NULL, 455)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (416, N'Jivjez1O9eLREaYwQgJrJXbRHwIl9IgkoeorwCOwNWjBfsRP/U6rfZF99Wr/fyiiyW1Px2Rj8efKfWcOxh5Ouw==', CAST(N'2021-07-05T14:10:06.6066667' AS DateTime2), CAST(N'2021-06-28T14:10:06.6066667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 457)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (417, N'BIiq2XV+gMpqwqJjcHkO0xc2SiyBajymkxQJX6FFdM6VsC0Ktcrk0gOPYBpQrODb3FNWnRj+5X4Jxxlg2hZyhQ==', CAST(N'2021-07-05T14:10:07.3466667' AS DateTime2), CAST(N'2021-06-28T14:10:07.3466667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:10:07.4166667' AS DateTime2), N'0.0.0.0', NULL, 461)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (418, N'jrQMtzwiBfPUt8ox6PlXee1RBnccUy8i+EW5dqYJTTdUBQmbxV8HBJsecD9btDLv17Niu6JEj3YJyD7zzeN3aA==', CAST(N'2021-07-05T14:12:58.6300000' AS DateTime2), CAST(N'2021-06-28T14:12:58.6300000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 462)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (419, N'8X3tOZS/UesNDAXm9udOp0YHRZddF4m7hetq46c7d4L7HR2JNKB0IYIvQIcE0nfoWLAe5rsQd5nvNRDBpIx7hw==', CAST(N'2021-07-05T14:13:39.4133333' AS DateTime2), CAST(N'2021-06-28T14:13:39.4133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (420, N'qG12wUX6gDFu5OnzwvAvgzqK0XPCVNAXwoeS2441XbmgnhMewPTO2jCQbZ4Knq5tDaGAQ8K4mUe/NyXztAXqTQ==', CAST(N'2021-07-05T14:13:41.0866667' AS DateTime2), CAST(N'2021-06-28T14:13:41.0866667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (421, N'rWPZxdPihEaxSCCnIK7HTyLG6vESYotXePX5EyD9om6LgrhhrUegwoSJ8Cnk4mGtLqMVDS5d+nev3jj2EoDJVw==', CAST(N'2021-07-05T14:13:42.6366667' AS DateTime2), CAST(N'2021-06-28T14:13:42.6366667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (422, N'JarzBThwO41C/Jr3r77+xzsXLSbS20FsP5geLiIZuO0ysexV0+OmrHrrYM14bE0BQI9P3AKKiw+js7tUF9L4YA==', CAST(N'2021-07-05T14:13:44.1533333' AS DateTime2), CAST(N'2021-06-28T14:13:44.1533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (423, N'gSAlWYSJbGXo+4uTMJQzjM8NgHq7vHSPf82QeKvbrYEaM7+cBvIr2bRU8Jhs17U2khXGB6Ce+H6T3y/+OF7N8g==', CAST(N'2021-07-05T14:13:45.6233333' AS DateTime2), CAST(N'2021-06-28T14:13:45.6233333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (424, N'3Po6o+jbIPZodxK3mDRTMCu0qxam6fAzK97F6kqko+FalZElwylEs6BhoFcinoZYYYtcvYwLqH/7Nx/U/DGvyA==', CAST(N'2021-07-05T14:13:47.1233333' AS DateTime2), CAST(N'2021-06-28T14:13:47.1233333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (425, N'F8NBOs5ZzuN/rEKXpw/e5ZWxbJiMofX3iOwzVTgyZrzUb91zh+CkAiVHeqRlfC9x2jXNyD1ejfWAa178SMXLiA==', CAST(N'2021-07-05T14:13:49.4100000' AS DateTime2), CAST(N'2021-06-28T14:13:49.4100000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (426, N'1FmZKorkGmjqWjrwcYdVo/p7OjPOguI4V57jzU3O8IZxA6r2Q+gePQwiqi3fw2ig5f5Ns0voh5yoAnWWtKK5vQ==', CAST(N'2021-07-05T14:13:50.9233333' AS DateTime2), CAST(N'2021-06-28T14:13:50.9233333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (427, N'Y4C6cWDaI3UnkEqFIXsRKnolhJCLJclLnHZ5LaJP33OSbUk5RV/aaeOJhPkX6iIjhhMgiUSkt3wdpC4aBuTAuA==', CAST(N'2021-07-05T14:13:52.4633333' AS DateTime2), CAST(N'2021-06-28T14:13:52.4633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (428, N'/wf6l5iuy1Dv920rN/uzexsv1twKyXYBSpunBbvzYonkqBPHxvKwdxqKoo2YvJv98ykbzoUqmVZgOu+MqIuUqw==', CAST(N'2021-07-05T14:13:54.6633333' AS DateTime2), CAST(N'2021-06-28T14:13:54.6633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (429, N'Vlx2xPUI6a3xLZO9pHdG+CDWPk5/yFyMHErpUQbknsR6w5kL2cVAYf0M8N/CGx8ziQ8gIZ2Hi5FYiQKwhBTT/Q==', CAST(N'2021-07-05T14:13:56.2233333' AS DateTime2), CAST(N'2021-06-28T14:13:56.2233333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (430, N'Rc3iG1EouXKmi7egLh/5GWcHL6l/IWR25FUaJUmpMyXT6EZa7U9cm32/sNxE/J9w5/XO3CLg9ECUfhjcjdtWpQ==', CAST(N'2021-07-05T14:14:01.4766667' AS DateTime2), CAST(N'2021-06-28T14:14:01.4766667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 464)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (431, N'kv/GLsF7fYr0vV/UL3QXPNtjWbDWy3dTLnNMTSj3OnnUF04VUULDWAWup5nF6HHys3c+xGGvlnQzjUbVItBD6g==', CAST(N'2021-07-05T14:14:03.7466667' AS DateTime2), CAST(N'2021-06-28T14:14:03.7466667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 467)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (432, N'kXAihA6p0BdAAS+iKuiqmIXtnfnGQOjI/xe7l6/CXkVigGbm6Lr+m7y3Epe1xyul4QX4i9m5vX8So8yAqoYlqw==', CAST(N'2021-07-05T14:14:04.5466667' AS DateTime2), CAST(N'2021-06-28T14:14:04.5466667' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:14:04.6066667' AS DateTime2), N'0.0.0.0', NULL, 471)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (433, N'3IGR+PZ1i7ZqxQVSATgXXQgmUibaZvZRDSm4xcwCXrqz9bD+OQRJo8eqRI1tPSiYzvIWZbmwkHaILAqdV8Ihkg==', CAST(N'2021-07-05T14:18:07.8466667' AS DateTime2), CAST(N'2021-06-28T14:18:07.8466667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 472)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (434, N'lg1JAMVqpVqrBYS6yXeqz7igMt2bt9HYLZCrAzczXDSJkrERvf5vYmMKR51jGcqC6LPCAjeLl1SNiBUmA2kfrw==', CAST(N'2021-07-05T14:29:47.0066667' AS DateTime2), CAST(N'2021-06-28T14:29:47.0066667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (435, N'mEEs9a2x2v3hFiRwjzc21UYoEsjv6IaTHlM42H9PdsLTxTewki0eQeYBnib9XtCfitcN4VRh0oQxUEbrgDlRuw==', CAST(N'2021-07-05T14:29:48.8066667' AS DateTime2), CAST(N'2021-06-28T14:29:48.8066667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (436, N'3lnyqKD9Eomi6kyiQNU7LMnyciMQefc5u8k+T4vDEVQD49gtlop0IsHHbZciw7A3C87vXyDr1v2pPGTjGcc+NA==', CAST(N'2021-07-05T14:29:50.3133333' AS DateTime2), CAST(N'2021-06-28T14:29:50.3133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (437, N'gg0viFJzGeVM085Fckn9XeK6/8mhOPryvus4FjxW+L1Jly08k8F8tF3nt8i0qzJ3fNtsGMxaGcp5QLpMplLr3w==', CAST(N'2021-07-05T14:29:51.8000000' AS DateTime2), CAST(N'2021-06-28T14:29:51.8000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (438, N'nFbXWAsD3GXBwJwfZx2Yi2QP/YpyUNn4lI6f6iQatkuixu+d4sGQ1HPgWN7RWtYEAR63opdJuu/IdmTefoxyYA==', CAST(N'2021-07-05T14:29:53.3200000' AS DateTime2), CAST(N'2021-06-28T14:29:53.3200000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (439, N'gG8uQa4tTMe6QBztkVz0ikU9VPW+PQNPZ9ag/p2k3PZ9CG+iZfsMdA9CTsMGC86buyJMoHm2/62KrxUs/1aTmA==', CAST(N'2021-07-05T14:29:54.8666667' AS DateTime2), CAST(N'2021-06-28T14:29:54.8666667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (440, N'fwEEil5pwM70vkguK5cuzZhXVbI17m2nvihh9mNkiLNDbpQ70Ddv2IuyK0uvSJpPXdvYIE3Sya+SzM/e/bOm1A==', CAST(N'2021-07-05T14:29:57.2300000' AS DateTime2), CAST(N'2021-06-28T14:29:57.2300000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (441, N'8ho5ldy2a9bPhKMdlsyvB8SWvr09WGyOMM8FUlZWgxb2QdOhm+4Z/uKr4SSDu7bwP2jgmNEElprL8uCqhtyi9A==', CAST(N'2021-07-05T14:29:58.7533333' AS DateTime2), CAST(N'2021-06-28T14:29:58.7533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (442, N'7SdLNnXKpBTAeQi2piXnzzWxJx1T7bnUgs3XVt/eoy8eiSkAmYo0tblg2MN9mw6M0UHpdnVZ4ZCfLCoM/aFTuQ==', CAST(N'2021-07-05T14:30:00.2466667' AS DateTime2), CAST(N'2021-06-28T14:30:00.2466667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (443, N'e6o0DMMMdBMJF0G5amwFB7EFdR+YioyRNTXgk7ZH8BFOSJQntiH2xDmDNfIt9KeC5h8hn1cbouzaafuUwiTgkg==', CAST(N'2021-07-05T14:30:02.5000000' AS DateTime2), CAST(N'2021-06-28T14:30:02.5000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (444, N'pF0uqn8gRbLsij4Vok+W/OU8m+o545LeSugktIVanmI14FMPcjYb7Qo9pOoGiMr4uyfGe3l/ThoV16I7YR60sQ==', CAST(N'2021-07-05T14:30:04.0000000' AS DateTime2), CAST(N'2021-06-28T14:30:04.0000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (445, N'9xEtqujbHWnunTze/R6zOa8YFQaMKV6syJFtiuIOwUUA9p+TMN8Uq/OXrdcWRsDlIXGo+RxnfLsN5VjK1dWqvQ==', CAST(N'2021-07-05T14:30:09.6700000' AS DateTime2), CAST(N'2021-06-28T14:30:09.6700000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 474)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (446, N'DCMGIOpFkxYyFZptbxVJU9ic1g/rBBR6TR+re2cDof55WpjAPqK7sL9KC8qfKOs/eh/HsoKwnzrCpeXNiJsgGA==', CAST(N'2021-07-05T14:30:12.0966667' AS DateTime2), CAST(N'2021-06-28T14:30:12.0966667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 477)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (447, N'b2AJ/X1oey4iL0FaDdr15lS7dfu/8j988VkIl/jewOEwkUIf27TrDjW/nNz7PCug4+RM6wHPM9DDPl57B0Y88g==', CAST(N'2021-07-05T14:30:12.8000000' AS DateTime2), CAST(N'2021-06-28T14:30:12.8000000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:30:12.8666667' AS DateTime2), N'0.0.0.0', NULL, 480)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (448, N'o/3mw1Yeh3S+FQaJ/Ceid2PIwf3b8MDdkzcoyJFNNSxBXuQIkvjcodkCD+N1aMMkjZsvZ85yrGk3oI3udhfJFQ==', CAST(N'2021-07-05T14:34:45.3166667' AS DateTime2), CAST(N'2021-06-28T14:34:45.3166667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (449, N'8O7yLxhKOZetSUc0zQKSftuW61v1YJLWnoP2EwSLEwheC2pvQNZawMhu7YpyYEu8WwPh+vEItrypdzA+ubtlhg==', CAST(N'2021-07-05T14:34:46.9666667' AS DateTime2), CAST(N'2021-06-28T14:34:46.9666667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (450, N'0FaWa0s5n+RTz+0Z2r/HjNhYlMBC86JC4FyQ2EaBz3iv/SK8nNpgpJUfbQILvM6RXMq96IEEDa7heEmQzUxeDQ==', CAST(N'2021-07-05T14:34:48.4800000' AS DateTime2), CAST(N'2021-06-28T14:34:48.4800000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (451, N'dQ4ExLbSXX4LwWoZM1/vEwW+WkqA76wMFPs1K/6qMX9DHIllWmNJYlhj9zzX3JRcZeXBj1R4M7fJY/3ySdI1tg==', CAST(N'2021-07-05T14:34:49.9966667' AS DateTime2), CAST(N'2021-06-28T14:34:49.9966667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (452, N'9FgD8jHG1fY4bpTuzGAZB3s3nUrPK3SbSuRElzk6E6RvF2J8Y+HlM4VPrA7e5E1q8kRDXQ8zer4wUSxqrPXwcA==', CAST(N'2021-07-05T14:34:51.5066667' AS DateTime2), CAST(N'2021-06-28T14:34:51.5066667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (453, N'O8czGYHieUIyCRX/YkhKRRzhK1VQbNtEGN5sz5tbpuVm33wbdB85YTAFU+Srp44ruVC8J4cG4elvAkg5AibYdQ==', CAST(N'2021-07-05T14:34:53.0066667' AS DateTime2), CAST(N'2021-06-28T14:34:53.0066667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (454, N'SmO5+FpyNzbM6rzSVCu9E4HpYHYVbu/6on+4CRgNjuN03rWaRh2ZScI8XNhg1v5coRbSJ8cy8FCpwsr0cv2XOw==', CAST(N'2021-07-05T14:34:55.2533333' AS DateTime2), CAST(N'2021-06-28T14:34:55.2533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (455, N'P+xKuVWxfupUnIKXeVNzbFSve6zSTHhE0yoM1pfs1xGCyCLiyzEIqY3QLjdXcXLgPPNuHAhRksCsfMSTsNcHqg==', CAST(N'2021-07-05T14:34:56.7700000' AS DateTime2), CAST(N'2021-06-28T14:34:56.7700000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (456, N'J02yLquFPZoR4aHu2Ne/JOEruBYbyGHv/3HQwua6qv2JAzBh7KM3TXrKfwyllGvtQv7R8hU+lNQx9SQffH1oSw==', CAST(N'2021-07-05T14:34:58.4100000' AS DateTime2), CAST(N'2021-06-28T14:34:58.4100000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (457, N'K/gMmlUxNC8z5qyO39IezkHxbpGfeY+c6e1xFjdujs3F/2gC4G8DKr5+4HT4zxdp/6s4MQK68MvR3gx/RjzdRw==', CAST(N'2021-07-05T14:35:00.6033333' AS DateTime2), CAST(N'2021-06-28T14:35:00.6033333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (458, N'Qgf94H+RajDKCbB1MDs5t+byKfnvJ0thlVAUwW4QWfwQwXBVKj4fWOqJ9sUwlKw0Ga17MC1ifrSiN283Lla3mQ==', CAST(N'2021-07-05T14:35:02.1466667' AS DateTime2), CAST(N'2021-06-28T14:35:02.1466667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (459, N'/F113noFV2nyGY07duqmgxXwxS/jztjdU2PWcXDu9tJVW2bY0Z8Cw9zj2yBnUvoDXtBdeh8D/i/gdRPzf5qGxg==', CAST(N'2021-07-05T14:35:07.7466667' AS DateTime2), CAST(N'2021-06-28T14:35:07.7466667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 482)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (460, N'TrVVJhEpyGOv7gHcMB+6IQKQl1KxrY2+lahNNeX5JhJaSkXMIsdhXkNE4IHcqiyc1AyedOvtS1gTmEaorPakjw==', CAST(N'2021-07-05T14:35:10.3966667' AS DateTime2), CAST(N'2021-06-28T14:35:10.3966667' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 485)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (461, N'pKxIy8D/7mD4UB568kDeWs5On5Nz6Ywf2W/1mSZtBgrzeUkxo39FtbiDq1LPk0SwFzua+GhAXv8A3vl7HcAZnQ==', CAST(N'2021-07-05T14:35:11.9633333' AS DateTime2), CAST(N'2021-06-28T14:35:11.9633333' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:35:12.0366667' AS DateTime2), N'0.0.0.0', NULL, 489)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (462, N'OPYGwet+RYGtSXkk0gXBL9wyOk8rKxzn+2F/t04ak3ZdvqlAFGTYet6Yye7ROpE81g9DypxasdTZWg69faAdSg==', CAST(N'2021-07-05T14:42:05.3833333' AS DateTime2), CAST(N'2021-06-28T14:42:05.3833333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (463, N'ReIYEyhc1/35qr33kPD/FtGQj5VeNgo7wIDRzS1NAb6dt4uImth5/IefKHMGWxZrMS+jlEQu6qN2IYXkT13Kzg==', CAST(N'2021-07-05T14:42:07.3633333' AS DateTime2), CAST(N'2021-06-28T14:42:07.3633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (464, N'9QokLqP1rDTCM6Qk6Wu2xsglp8iSgAd/5wM4f4950efmKw8aa/46oN7eJ4JybP7ucXR5WgrTWtPYSpm3AqRmZg==', CAST(N'2021-07-05T14:42:09.0333333' AS DateTime2), CAST(N'2021-06-28T14:42:09.0333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (465, N'NTUdUJT4y6EvNn9uJNGUj5sA/HA0jVniNm73n6Dl1418pXHnM3Jph0xJsl6PAW6oPWcl15l1kxU6VedLNE6tHA==', CAST(N'2021-07-05T14:42:10.6633333' AS DateTime2), CAST(N'2021-06-28T14:42:10.6633333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (466, N'd8nmVpdK371FkFUU+uThx+MgspSMwz7jSKlmeIgxoW+oEqaeucGgrTrYXi9luOArI9RQlbCRsE6++5S9XxVpBw==', CAST(N'2021-07-05T14:42:12.1800000' AS DateTime2), CAST(N'2021-06-28T14:42:12.1800000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (467, N'9v+21ParwhveoPPAwHU1KcmkPX79O112YIlCNChPDTfUv55L/NzG3gWPHcwInXcmFD2ETqIpF3tVhnaVI3htuw==', CAST(N'2021-07-05T14:42:13.7400000' AS DateTime2), CAST(N'2021-06-28T14:42:13.7400000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (468, N'jICaQy+bLychx+K8Ao3RYH7n2rhSsifiWEdVdo9nmrMxSnnJaqjZABbrvcNLlvUghTccySt1zKy+DofeaBhJkQ==', CAST(N'2021-07-05T14:42:16.0866667' AS DateTime2), CAST(N'2021-06-28T14:42:16.0866667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (469, N'Cv0XjAUwthyZFQYW03TfO2U4TM7+25z6tUVntqhm+DmCe/iMHO9CmZ1dw4k2a+qFbb7wwGoepi4n9l8mi2jiJw==', CAST(N'2021-07-05T14:42:17.6600000' AS DateTime2), CAST(N'2021-06-28T14:42:17.6600000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (470, N'C95yNFqJ9bLtBKSDi3j8OhuQv2R4ZbCgtFYSb30EmbavDCGuy4vSA7GZUzaS9AhXZ7V0dW2mBi4Nzfx2SVbwOg==', CAST(N'2021-07-05T14:42:19.2300000' AS DateTime2), CAST(N'2021-06-28T14:42:19.2300000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (471, N'H4cTT65teVXIR099sLlorGN0+i3dopdbd3DdxXfD9idL5Rf5YQx0Tripl0VM3eWk1/obr0myhf3g4/t/s9GJQQ==', CAST(N'2021-07-05T14:42:21.5533333' AS DateTime2), CAST(N'2021-06-28T14:42:21.5533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (472, N'87Ru4Dm88hQyFENoch/oYNb9P/U7ceh4x9pDvM8Yhw6UBJXQuo6LkHW0Bi8H3D74FHWQfGdLodpOVTGIBtSLfw==', CAST(N'2021-07-05T14:42:23.1133333' AS DateTime2), CAST(N'2021-06-28T14:42:23.1133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (473, N'iCq3wWF9DK7Z+AEOfzxEBiQIFy3tDyUYZRvgr82RXpTVnn+cjy0AVHLuR21UYUL7g1tJ0XbWAf93hWO9rGDN2A==', CAST(N'2021-07-05T14:42:28.6533333' AS DateTime2), CAST(N'2021-06-28T14:42:28.6533333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 490)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (474, N'jdpNJBBW4Z1PgeocyPXqJi+a2kpJstxwqYLuf6nIDre1nbG21u8zcLlmC8vP/SapMFng5FPDIPfncmrFCRSy0A==', CAST(N'2021-07-05T14:42:31.0500000' AS DateTime2), CAST(N'2021-06-28T14:42:31.0500000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 493)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (475, N'A6WXslBhwgpX/u8wkyHzmvMHOvQ930FyNr27kMGnsyyuVcFCEh8Wq3FU+lnLO9hESIu6+Gh7zheG3Pv60DnjnQ==', CAST(N'2021-07-05T14:42:31.8100000' AS DateTime2), CAST(N'2021-06-28T14:42:31.8100000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:42:31.8733333' AS DateTime2), N'0.0.0.0', NULL, 497)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (476, N'XHq3xyjiGuQM3+StpDZwaE5wx7G5AsuyWMTup0QGBt7mQ63FL/DXI+KCK36VtfrnCWHLcEH+uz8UuM/HqP4Nkg==', CAST(N'2021-07-05T14:43:40.2866667' AS DateTime2), CAST(N'2021-06-28T14:43:40.2866667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (477, N'uyvgxeIiZOekVSpJRzTLVTZZCPTTanNd03IGiSMr+WL9xQnyHZbDmmIg3RLJ+zPyA5byAEOZNnVkwsN8v7KhIw==', CAST(N'2021-07-05T14:43:42.0833333' AS DateTime2), CAST(N'2021-06-28T14:43:42.0833333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (478, N'rmpdwAGst7OoLOAiqvaPjalp5P3zZJR5hzJU+eQKtvQvaQX5qD9DTjC93qBcZiOVe5DSqMNq4dk8EHHpAMK3+A==', CAST(N'2021-07-05T14:43:43.6833333' AS DateTime2), CAST(N'2021-06-28T14:43:43.6833333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (479, N'e4taZi2VRUMLycCzbhVnS5ORxYl8y4qBjNn5dchx2mf3QlxUEhVol+CFfZy/oiR4BKjXRbevIEe8xksvDIZs6Q==', CAST(N'2021-07-05T14:43:45.2500000' AS DateTime2), CAST(N'2021-06-28T14:43:45.2500000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (480, N'Z9O9BBxWBnL0BjYb1KypMf8CaGgqpXjJUw2EYJ2SkGahDtIKPRd7sw8P6K8EdMmU9ff65tol7WJXXLzAnRk0ug==', CAST(N'2021-07-05T14:43:46.8800000' AS DateTime2), CAST(N'2021-06-28T14:43:46.8800000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (481, N'+lD/Auq7nCyne/idkemQGw2NQoHg+QuZkhgOqXzLI29r6a/V5BwtWWAk5HXzW6qsgZ/MaGMMsxNklu12Cz/ZYQ==', CAST(N'2021-07-05T14:43:48.6400000' AS DateTime2), CAST(N'2021-06-28T14:43:48.6400000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (482, N'We5Jyhx7QDnO+r22LkRsz24pHU8uQEVM76XczTkHiqRNvyXQPMIYB8hQ8Gs8HgyaBnyhOjGz/UJWNKFp9nt4Zw==', CAST(N'2021-07-05T14:43:51.3266667' AS DateTime2), CAST(N'2021-06-28T14:43:51.3266667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (483, N'NuHvBMrvqbB6GBZOF9kf0RJStiwDaLIO9uEfX3SkFqTVv4ZSYsZOUNoAUvSKfHujcdfWkBInpNVgKo0VtbZA2A==', CAST(N'2021-07-05T14:43:52.8333333' AS DateTime2), CAST(N'2021-06-28T14:43:52.8333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (484, N'lNvYUbj0OwKW1QNhVcJBlBkTbA9RuCMS9ztvvS4aVdK5+jji5UOZUbUXxtg2oU5oWsch8YKZRhECt7d2BJZ1/w==', CAST(N'2021-07-05T14:43:54.4133333' AS DateTime2), CAST(N'2021-06-28T14:43:54.4133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (485, N'GFYAbvtslGBBZnKUNwtwFzw4oBjpCfe7r5jB9hqTbio8hQa0MHhspcdLjrfI1T4swZCNY+pp/c6O8X0WAahcVA==', CAST(N'2021-07-05T14:43:56.6966667' AS DateTime2), CAST(N'2021-06-28T14:43:56.6966667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (486, N'4dr2gUveGcwxX8dM/8t2SbgsrIHoPb6PwSMsP34A5G3JdaDwwb85ZRhx3LCvGg/YLTSkbtyoINsuTW2MdAMxcQ==', CAST(N'2021-07-05T14:43:58.2266667' AS DateTime2), CAST(N'2021-06-28T14:43:58.2266667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (487, N'T2/pdf14DyKgbjKkCN/5SRwEUn8TwBF7IyufTHoveVXLnKrVZonpiOoeeotK3zNgDrqK5d3BP5DiGy/M0bmTAg==', CAST(N'2021-07-05T14:44:03.7166667' AS DateTime2), CAST(N'2021-06-28T14:44:03.7166667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 498)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (488, N'z/zF1HKA7tRFCldG9SOVJ/vw/G5IeLceUXpFmg50FwKdN3y5hjrt6pwqeUZNCgQne+wTMSZ1ntZ5tIvQCApwFA==', CAST(N'2021-07-05T14:44:06.1500000' AS DateTime2), CAST(N'2021-06-28T14:44:06.1500000' AS DateTime2), N'0.0.0.0', NULL, NULL, NULL, 501)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (489, N'YovX4LJHZTW37vYbpMEY6LGUNEym0AzWt6NvmCabkeO3X8479Cuk0sfHQq+Et6Msq7AIhXj3weJY4+tww+6lVQ==', CAST(N'2021-07-05T14:44:06.9700000' AS DateTime2), CAST(N'2021-06-28T14:44:06.9700000' AS DateTime2), N'0.0.0.0', CAST(N'2021-06-28T14:44:07.0300000' AS DateTime2), N'0.0.0.0', NULL, 505)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (490, N'W0tHRZKs6sAlUG2BE3b8fbxod4TdYXXJDngq/vqXZd5P842G06Ro+f1YxEG13j8GJluiLveOQX6XaltwTWD9jg==', CAST(N'2021-07-05T15:09:47.8633333' AS DateTime2), CAST(N'2021-06-28T15:09:47.8633333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:10:04.1533333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (491, N'Cl0EddS8bzp3ZExJeRLhZ3cijV/jUpBiRgv4D3+Stp0dwK2NherN+EVAaZe1LPc6tpATYJa3+yetxIw6+fwFmA==', CAST(N'2021-07-05T15:10:35.2366667' AS DateTime2), CAST(N'2021-06-28T15:10:35.2366667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (492, N'Kz+kYcQVScdouK/COp+mWim3ztWdWUAttouDmxDA/rWEkiVaRzq53o8CVfkjY7pzW+PKBRn3T1/OCOQ8lXk9qg==', CAST(N'2021-07-05T15:12:06.6200000' AS DateTime2), CAST(N'2021-06-28T15:12:06.6200000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:13:55.4266667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (493, N'Y8+sj3fbkgTV4T7t9V4ogGRV4ZF2jBz82jvaJpEn6wVo44sqmvTC82dzD79KiJtgQlG6EnYP9JFukPxUDqwoHw==', CAST(N'2021-07-05T15:17:50.4800000' AS DateTime2), CAST(N'2021-06-28T15:17:50.4800000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:17:56.7133333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (494, N'AGqIElarjL5nGtA9qFg5BFmlJevp38zqJMqBoO1wS/K+gKwhFq6Wy6P/tIL8+o2PeLXkaLbrIFQtfNMCeMShhQ==', CAST(N'2021-07-05T15:26:31.2866667' AS DateTime2), CAST(N'2021-06-28T15:26:31.2866667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:26:46.4866667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (495, N'p0qbjz7sA7fdMbEd21BAeEitFjcojAVctW4jHCcIqdnqW1CQP/xQNdpmsLgyO1Ir5W50giLA7e4d1wwqGOUO8g==', CAST(N'2021-07-05T15:26:58.9433333' AS DateTime2), CAST(N'2021-06-28T15:26:58.9433333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (496, N'Ye5Sh+nLJ02hvPXVcUmv1efuldrmwb1al9zwKzZiE38ATvy/BhOO+UmelRT2VVnJd9fjT1ZAd7AEFscxU4XZsg==', CAST(N'2021-07-05T15:30:39.2333333' AS DateTime2), CAST(N'2021-06-28T15:30:39.2333333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (497, N'3iMW7yE4muprtMdtOpYz9aBLAZNX3Pwmb9VTZ754Ztes931qAOfDGhl/LRRTDOBkd9KuukVEhTANS84c7YoaQA==', CAST(N'2021-07-05T15:34:09.2866667' AS DateTime2), CAST(N'2021-06-28T15:34:09.2866667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:34:13.3766667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (498, N'tovOaEbQ1SCy2dpXsuQ2AiSBxbn/suRcXmsOdcUMtJz1nuQlXc9wBQvCOTLGAUrvCXq6iofHvUQ8+vy5GNxNPg==', CAST(N'2021-07-05T15:35:36.4433333' AS DateTime2), CAST(N'2021-06-28T15:35:36.4433333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (499, N'e1AoVoHfdvHB3y12mtaAN8Bkk1GexSBqtHERameqwcHvdXRbuqzGMLHg3bXRYQzEVBL9/zHBKTPBlJyaaHA38g==', CAST(N'2021-07-05T15:38:46.4266667' AS DateTime2), CAST(N'2021-06-28T15:38:46.4266667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:40:18.2733333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (500, N'6bZIKm3bIKzgceWWw/S/DbFLlbOIvzmLos8F1MsRaQ1+iJ24bLE2LZsy7fFI2zG0rL0ik1c6F3PSwpSTfmz+vA==', CAST(N'2021-07-05T15:49:48.2866667' AS DateTime2), CAST(N'2021-06-28T15:49:48.2866667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T15:50:46.0900000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (501, N'yt89oFQgtmfmrXGKL/XQH4R57IjslPny9tUEnviLvApbQhoxTVNKw0vWPOM1VsjEhCeUFMEHmOLxr/9D/z5GKw==', CAST(N'2021-07-05T16:34:33.6433333' AS DateTime2), CAST(N'2021-06-28T16:34:33.6433333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (502, N'P5PgpBHiK3fwXlJLlukphQXLrTqj7I/umAKku+oIwIOTBSEk3eAKFARxSyKBrvcmsNG53Lu4/tliTczt6Jjpsg==', CAST(N'2021-07-05T16:42:16.2133333' AS DateTime2), CAST(N'2021-06-28T16:42:16.2133333' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (503, N'V/2705iTah/96619iR8/5ilICgSt3kSQX8ZvBDjn6bd29/uLyo7IxrqvRU8EHVcgPsaE+xY6LFWzokfH2y9dWw==', CAST(N'2021-07-05T16:44:20.8533333' AS DateTime2), CAST(N'2021-06-28T16:44:20.8533333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T16:45:50.4500000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (504, N'0dgLJrVsOa37gWuaKORz6Sr54mWpjIVuLG8QCq8vQpJKm8A2xxlXopEFN3qtovkdi5DrBMCsaW++28dwClFLTQ==', CAST(N'2021-07-05T16:50:15.9366667' AS DateTime2), CAST(N'2021-06-28T16:50:15.9366667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T16:50:19.7300000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (505, N'pU5V5rKHdKtRYinFRNoEBCD2n10zCiE1uT7kZwPsJhMcSvPJrt98kwep8DZeMswIdaxekhIuk42aaEp0Pr8NWw==', CAST(N'2021-07-05T16:51:16.1700000' AS DateTime2), CAST(N'2021-06-28T16:51:16.1700000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (506, N'vZf1PUPnA8FkoTfaBE9ty5iSbOKz/fKkSm4xKTX311a9wUD2WcrNZdBj8NztEtkkEO8yXAnXGyxdZxgqoaNQBg==', CAST(N'2021-07-05T16:56:00.9933333' AS DateTime2), CAST(N'2021-06-28T16:56:00.9933333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T16:56:16.2500000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (507, N'/KcXnWj6AW/ZhT4g/ufMRixswbyAAZU6otZ2rB2kIQ9S+S48IOgFZf8lxtk2Kb2BXiQjEsnDTKpHNPKVpkxexw==', CAST(N'2021-07-05T16:57:46.3633333' AS DateTime2), CAST(N'2021-06-28T16:57:46.3633333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T16:58:14.9033333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (508, N'hLtcE6N6KeIx4Hh0kfJ6j8Pi2HD1WE2vHTZCmlmmWbzABMRGUv1oe/kSGfD32yU8AZpUgnYkSKXoSUEv4fy4+A==', CAST(N'2021-07-05T16:58:36.5433333' AS DateTime2), CAST(N'2021-06-28T16:58:36.5433333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T16:58:45.9033333' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (509, N'M38yzsw2dNI0WyqiqatBqrABmFaSPx0wFm2rlqGpYDxsgEf5XL2cEvsyQiRE0g59K3+W5XW/Dpyv+eNS+hesSg==', CAST(N'2021-07-05T17:00:01.0900000' AS DateTime2), CAST(N'2021-06-28T17:00:01.0900000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:00:04.9166667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (510, N'xWxXB++tUXSklZ6HPMrgs96rarMxlVGfOfGVlPpm/VNbTQIHFYIRyiqCtm9gmCTffwkcgIEVutZoEYWUxqSfGQ==', CAST(N'2021-07-05T17:01:14.3400000' AS DateTime2), CAST(N'2021-06-28T17:01:14.3400000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:01:18.0966667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (511, N'JKurSNXXOZx3GKN9GwnxUXfyp3sOgCk6Fq4cr53lkV46kkcktN0SLPHEIPE1dWVs08kwyPHde7+czCU4Kt+/0w==', CAST(N'2021-07-05T17:02:38.0000000' AS DateTime2), CAST(N'2021-06-28T17:02:38.0000000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (512, N'qEqVI2yOdHkARmGNX8YHv8sN8dk+ToyAyRrqJDkzKK0gdPn6NKSPksKnjgB6zIwAZLBt0HFvC2ldkbsfXm5cAQ==', CAST(N'2021-07-05T17:05:12.0700000' AS DateTime2), CAST(N'2021-06-28T17:05:12.0700000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (513, N'GptsyTMKa3sb2wXb8kxtMn3y3jeDczfhSBozyQS85CvqUBtYbRE70I7YMmbpJ0jbiKLFBcDAmjYX1weh7FbOZQ==', CAST(N'2021-07-05T17:05:29.0900000' AS DateTime2), CAST(N'2021-06-28T17:05:29.0900000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:05:32.8000000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (514, N'76bfDfE2fUrTPFr2Mildd57c7TIyVh9Yfv15wK4qVt1/k9fKvz5tUHy4JQIhuMEt9DUuKX14pj7LKYGpCaiNnA==', CAST(N'2021-07-05T17:05:51.0100000' AS DateTime2), CAST(N'2021-06-28T17:05:51.0100000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:05:54.8800000' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (515, N'pzassM85n7YNjoUhS6UGJDJp4bb5C9ijCNCivXJ3WYdGX5MI1Mp1j3OJSZByYEMIS3hoJCvB4Scghj+2ZXwpRA==', CAST(N'2021-07-05T17:11:25.4100000' AS DateTime2), CAST(N'2021-06-28T17:11:25.4100000' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (516, N'NSDsDBxQ3gS4wHodFRuNkyfcpHp0IaZu7VU00ocU+ISCqk9NeB3jUHEq8oxHTB6VgMDmHcUn1T1Zm94EaQEjeA==', CAST(N'2021-07-05T17:11:42.3566667' AS DateTime2), CAST(N'2021-06-28T17:11:42.3566667' AS DateTime2), N'86.52.243.32', NULL, NULL, NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (517, N'jyWveqpqFoakgCLySjzBO2aCBg3X4zNjm3LcAtERz6rPPR7h2fU816YF99DTh07DtGGbNXx1qJJd91GgqovNVA==', CAST(N'2021-07-05T17:12:15.6633333' AS DateTime2), CAST(N'2021-06-28T17:12:15.6633333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:12:19.3766667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (518, N'QyGnI1FX2mUu2WnlbfumG6/kXw3FzCt7wULnfdDfh+lXwGJjOLqQUBeGxe+1iPLKMsf65+ijvNb/ukBFb1WhUQ==', CAST(N'2021-07-05T17:15:27.3700000' AS DateTime2), CAST(N'2021-06-28T17:15:27.3700000' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:15:31.2466667' AS DateTime2), N'86.52.243.32', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (519, N'9yI+o6uHTTuicm2tLjekYDSOgLQgt9zRGtiyTWjtpWBOxBrE+Wy71sNXcoctSGXoWD3EInAPkAutFKUVVjMBpw==', CAST(N'2021-07-05T17:19:32.6266667' AS DateTime2), CAST(N'2021-06-28T17:19:32.6266667' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:19:35.8533333' AS DateTime2), N'86.52.243.32', NULL, 507)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (520, N'jx7SXewAeRdWjwhVYsHSx4MSwj4Dm9M6N8xQ6Wb4ufv6QAJuhLESYNOhlzd0UcVjH70B1vMGaQfc8Nz/eQY4Qw==', CAST(N'2021-07-05T17:22:19.4833333' AS DateTime2), CAST(N'2021-06-28T17:22:19.4833333' AS DateTime2), N'86.52.243.32', CAST(N'2021-06-28T17:22:22.1366667' AS DateTime2), N'86.52.243.32', NULL, 508)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (521, N'lh5yw153cE7mBIFB/K+CuM+Alazy8WPcP35uDvNh1lK7UHI5FVd44JBeC2gTagEbtWgEM9EI7+qYEh0STTLK9w==', CAST(N'2021-07-06T06:56:18.2600000' AS DateTime2), CAST(N'2021-06-29T06:56:18.2600000' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 507)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (522, N'SA6upPRFaAS0jxU4JgXz0ec3p1cbJMf7+XMbMR4KmBCa5ZH0riQQfLwZgAycBi2ALbNMPlBN6B23s2D9PJIk6g==', CAST(N'2021-07-06T06:57:23.0633333' AS DateTime2), CAST(N'2021-06-29T06:57:23.0633333' AS DateTime2), N'93.176.82.57', NULL, NULL, NULL, 507)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (523, N'AI9m0OAit6Cgeiqn2Zg/R4TfvSxxHAmsTJdyzN8zbZX/p79ByZ67ceXU19pO9iLHM0R9ce4ErnxG7574bGTwIg==', CAST(N'2021-07-06T07:00:18.1533333' AS DateTime2), CAST(N'2021-06-29T07:00:18.1533333' AS DateTime2), N'87.116.23.185', CAST(N'2021-06-29T07:00:20.6666667' AS DateTime2), N'87.116.23.185', NULL, 278)
GO
INSERT [dbo].[RefreshToken] ([Id], [Token], [Expires], [Created], [CreatedByIp], [Revoked], [RevokedByIp], [ReplacedByToken], [UserId]) VALUES (524, N'12wJO2PKYJugWsLGaahZPve1Ad8A1SzqH4NU1ldifxN0tBt26v7deN6LJ2p3+ECFrnK6VfBh+tDxH8q6i13JXw==', CAST(N'2021-07-06T07:01:51.6666667' AS DateTime2), CAST(N'2021-06-29T07:01:51.6666667' AS DateTime2), N'87.116.23.185', NULL, NULL, NULL, 278)
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Trash] ON 
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (51, N'5703538417214', 9, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (52, N'57045399', 10, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (53, N'5703896237028', 2, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (54, N'866007525', 8, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (55, N'2003498859', 4, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (56, N'1136982048', 4, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (57, N'1880041692', 3, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (58, N'574009037', 6, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (59, N'18412944', 7, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (60, N'1015445487', 3, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (61, N'1625465158', 5, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (62, N'7350042716920', 10, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (63, N'595536571', 5, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (64, N'127515095', 9, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (65, N'1764256026', 6, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (66, N'184562905', 7, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (67, N'180317677', 9, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (68, N'1254276027', 10, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (69, N'1966366039', 2, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (70, N'600419050', 10, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (71, N'364276822', 4, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (72, N'1963423459', 6, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (73, N'1461861345', 7, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (74, N'177090278', 4, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (75, N'944269400', 6, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (76, N'1531457043', 8, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (77, N'1869371512', 5, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (78, N'607506576', 7, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (79, N'813951857', 8, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (80, N'934940579', 4, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (81, N'717132954', 10, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (82, N'1861225684', 3, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (83, N'1932540227', 10, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (84, N'13655449', 6, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (85, N'210016499', 3, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (86, N'1389578928', 6, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (87, N'930944070', 8, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (88, N'310451136', 5, 278)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (89, N'863706807', 4, 235)
GO
INSERT [dbo].[Trash] ([Id], [Barcode], [BinId], [UserId]) VALUES (90, N'1316741909', 4, 235)
GO
SET IDENTITY_INSERT [dbo].[Trash] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAuthentication] ON 
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (1, 27, N'+CrPKX50XfRLPs5d49L/bW5TiowAvagSyX9MGYHtELI=', N'xLx0wfsRnvVbuzJY3vprSdb01vuKIIAMuAgB9+rCbM8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (2, 28, N'IcMXZA1pbE662Q5uR5yo6SMhlN2USMQBDgMJ4pxLsi0=', N'eEMRGzU0652b2LO9Xs0mscINPoiDs+hMHvxcdftALHM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (3, 29, N'm1zkNyUzb1J25JsOjjS+DmOIauWB1xIFp+/UTatp16U=', N'QAiwyP06rnF2jb33DTkaB+XSjAmyNTtVGqWICqt4sD4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (4, 30, N'+PoIE1LI8H93Wb+YwS8IZrJYYqzXgwQNLYXBIiv7Ty0=', N'v1VNOP7llXIbNQU5naDV02Ih+gYTuYMVCBE6+is9RmU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (5, 31, N'R1TQxKQadbZysL1vZ8xA6Kms5RTJHHoDELqC127RD0U=', N'HukXa9SBPiDbjtkRF0nnXAko3AzEapU6PnMwB6aHdX0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (6, 32, N'sJR6Hyf3jODvrvN4xPLc5VOoEEMpGtwAF8ISsUk0JBM=', N'n/BKsHG4ru0RgeJNE5QlOKUTrAj6OSPzWNi56cDbQJM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (7, 33, N'iezqF5XA1FlXl2OqLlpab+oJAQhEHjwvximX67RuEpY=', N'smCU0GB44ZVRHmGgrROWT7XO8Z6XaXpuVtIJ2k1BFaA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (8, 34, N'AC728KYIRGN+lOLSHQyVT/pj5q1W0H7YBUDCSM/8QcY=', N'GbIV40JBlsy/d0O84ipwWxFQ1tRulqgOXGIkj0UuQq4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (9, 35, N'gwouRRVwcDjTxpR02F5VKg21OwoVu0l+c7K9SAoZLkc=', N'l/ziVRbMNxOols6+HCPINuH2xVp4mvz2jgHZdbWvsxg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (10, 36, N'HE9r8WGG/oMD3xr/XYXKiTz/1i0Z1hvXkVIHIW4kJog=', N'E9VPDRWRxZlSotIYphj1BNwsW/99L+OniyqgloM/Fzg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (11, 37, N'USJLuTlAY+ENgI62R1OPR2j2v25u4Kr5oKq8uT5Mi8U=', N'8xbt/enTR4sUTzBXPtJxvJnymZV6FNLGDwymQqT1Lcw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (12, 38, N'CReKFg3G+7AvQXofXiqI4fkSZN0MjrVcR3OzuWVhDPE=', N'5N+yoDgol+wcq2jY3DrzyAa8ap/0RFYyF+SA6sNNACM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (13, 39, N'6ciCEZfJ6p+SQUAh45KbMZQFdvH2D5/3ZzcMj97gyp8=', N'T0sXnnd+XdcoGPcGdNgPWub3E+IQ2+uwBWCaoIw750c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (14, 40, N'9NnoDr6FNdLfjDoUBLTs9FisbvVc3Ux6XQX7EZgZefM=', N'NHVjdzSB5NRUF5AeWLU3o2Prote4kZsvGx/ShtEZhc8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (15, 41, N'nsqTgDV7uaGzXdzngPvfbySRGktctvwMnlq4oRM64AY=', N'IObQScl89LbXWDqwknIWeoBflH0WKnR/hrUrpjYH41Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (16, 42, N'xMuAUKtK3mvdX7VFPUztjn38gythdTXiO73hLPCGKoY=', N'Clt6tSE8uGkzSy7tV7RYkLJwXLo6yWdktMOb/6NUBwA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (17, 43, N'0Tp9TwsxD3RlA8CbosPWY3ImQ59T97ikLccyCV9jAvg=', N'64kbyL06zQE1ZlmHNlnsCVkdA3QhVKo+pLyYoot6bXY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (18, 44, N'tT22liDTu2sWU4WR9mAZAmX9F6j44YCVZq0jvqCXIkg=', N'D9xBjBYq1VRVvO6ZFy3sOAFLwrY24jR8CgCRh6xvYyw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (19, 45, N'YlqwQFroxLEBUNdt0lkTV2J3cDUikI+QyyFCOpo94tY=', N'FUA2jK8vMqv077olOmkLhCHh884D4OGEw2ArjnZKCvw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (20, 46, N'egWNJ8l9yIAszxmopRbtFHd1+XmF9Zlsbc8HgKUBxcc=', N'0AIwfT+xPlqPgdlnaim9SuI9NL896g65aGk8dZHh3l4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (21, 47, N'+oUl9zTciezamQ98Q891ZtfyIk6pQsEwT0KS7Rk6kUk=', N'zXlVAtMgm8bIE94vj6JQ60vNluUyAZ9Up3/EYqk/i3Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (22, 48, N'MfIC7LeWn67qM0M62n2MeGM6nthHFUH6WZEiRPXsWdU=', N'8DQOAwj2k143459Pnu95flaIB0gzVZN7Hn5A0g9F59U=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (23, 49, N'SKaKDB4/8fh0MW3W43UebvjDgdoq789Lu4p0n3/yN38=', N'cGum9fY91KkcdgW9T++r0I9ReUq3iCbuFbZuX38pA5k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (24, 50, N'/KxlyUNlcvz6+X0gC7xviFYLnPw+WsvAWduSL5jxGqI=', N'CvyDfrbb7sa6OzhCYXh+KIrGa0KinKGkmdIreQMxaD0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (25, 51, N'3sJjQ89XkAW28vUGa+TeBPAEiy4XvV9u3KBBzydHLxc=', N'd9IbJWCS+2nB6DHdsUGs3JPtNaW7W7p/uLahDb3q/dQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (26, 52, N'OJQc5eq673OEjsEAarXSbVm6H7uOOeZ3gpgy7SH02OA=', N'YjkN0ewUbLX7GxbBq37Pxn6SzOTUPGNYn6BuppqFfKI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (27, 53, N'HobP+2BjGwT3LyEscLIdn2pNfRBONRqbMSkgJb3rBEM=', N'MeohgfGDlIit0vWOW+jw1qdQ2SejB7T58EMJecug38Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (28, 54, N'TEywvgx03oCFyjsqFGczZMOqUiqfNU9o8XPseHZ36dE=', N'HSCrPKyDu4hSRLhxfCyx2e4I5UZ+96zLCBSGpOmzhPY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (29, 55, N'BuWdXMD7paUTzoUl8/MO4TXHb6Kl9WyKMqcYn7jJ374=', N'50GDitno31iDbZ+bfLjGa+Ki1hTdghTn0ZIX2dNWeHc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (30, 56, N'zmSXKxTF/IfRziclu977U/74DgmSL/tCyewFtm4yans=', N'Jpz/Yhzk6x80UJlBWoCHJFuvQdw6GlHG+obdouA1eO4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (31, 57, N'rSjK0ptziLMNYZBuS58SjN9EtxepaLkAAFHJ3wqIObs=', N'86C72N/cuC3uti+y4tgwQVdZLUjsMz3eAKLEeXWpNgU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (32, 58, N'+ODIcg56KIKtKOKreAQotaQaksCX+nBf201DH/iWm0k=', N'HW1XnizWWXEJ0xRsAkiVjSE2nnAkPBAf2GPYKFJVyHU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (33, 59, N'klZ2nmV8K82W+iARyGhBxAgw41y2mrBcVoZ1DlRsKEM=', N'Lx8W1E8qV+BA2EnJOmgdK/PUmbm7ICqtKqVHNUyd/mE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (34, 60, N'bXMiz/yFBHvyovg4URN4x83mRHQs6A4YdLtnsfxFRgc=', N'yKK3bouWHShPIBe4rGFmXReYXHZEmdgDiUh8pXxZ+sM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (35, 61, N'l1HhMWMD1lIN9bMQMRu3eut93L6/rwmLHL0NVzSUBgg=', N'sMsVc1Cpkqhib/uP+lGTuw62PWgLqew28LCzxicFcZ4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (36, 62, N'46jNf4bM6cUNIXIB/9UugEZa2wCUddOn9geN8p3GgNE=', N'OXD/nI7FO8drM79HFPtbdgwr7w3fsbnulzp27stbZ4Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (37, 63, N'MsOoUJpSQvZYGh90ckVck/uvfwQpOETJqX6/BpLtZtI=', N'TxfmhjSQA04GnJQ8K7zVQT+t79kcvkOmEhf93wJYvZs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (38, 64, N'AW6F/tg/nLDRJIyNPHAds4nhPo0dVhDV21dxiXwR27c=', N'R3PBdzG+qX8/L1k5Rm/H/n26Njk3ZwAcfvnMZ76Di3E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (39, 65, N'lrQHlkXp4r0XSiuYQRpgHVtVFbN17qbfhQdnvL+y+BY=', N'iO0a/jEFX2ksyfL3HkgMTmPZUvHQs1sUNkcc5740zQs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (40, 66, N'rxY3egX+k9ViS9s14cwzTV2lLr/ObslBvuc90CTs784=', N'z7gZ1izfkIDdAhsd9IvkJcoiMQ1jkHkq/F4rqC4A/GQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (41, 67, N'6oX+yx1DQBvmoSml/Ow6UTz09UCCQXcpHVYOHlWNaq0=', N'mY3C7xtxQtorjVRJICNEk1E3JtRxcT1BkKOVuDYcKt4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (42, 68, N'ggOd4nek74Qm4MZ6TO/QcQvG68UNS7ISHdcQOhhKlXQ=', N'nc62VE0jbfqPi5QPHwoF+tMwe9OP0rtB8GTaVgwGyFs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (43, 69, N'GMBESHyfcilYLocTSXvISdMCK70maE5/7qKDiP8r+YY=', N'r90fw9DWV2yJciQM8BG+d81dI2xyc7XxNgTefj+AGjY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (44, 70, N'tXgSnNONbvWfxTzHCZz4z29cc5iJJZ8UowSK7HJwiB8=', N'pWwvzrcnHMDdehsWwRhtX9dCPAQmt1ujhcwDpRFVjW4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (45, 71, N'6pfEsDdWUi4itG38F4U8J4FPCIu4jx913kKtcMmVr/M=', N'MqZonIPcVUZh+zo8goMWYGKEwrKy6gHzhRMCTtOVEj0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (46, 72, N'5uoIIKIRTe/AtxfLOBUewHxFelRnqe3qkxcgTAWQqvs=', N'D7naCECDf88BvGl3LP5TuTchpB62qvVttMLhrAJmxUY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (47, 73, N'PCWqWOb2k9U6KDdOfmWY2xKEzFqP/DKaoQHJM1B5Wpc=', N'vLQTSthzbqnUSVeXXoO2HE5FaFvSII77YYEm31cx5PI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (48, 74, N'k4c15Iv4fR6b3wbNGyP64TPE8oRQVb/AQM2wm+pRl8A=', N'NQqCdwbIF2ss3FdP1oQkeLMQFSlORc2JIESz6aLCBkg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (49, 75, N'diDnIdh5HJnhsJE/JTBfZe72JAUuBo2g6Yg864Ai4bI=', N'57wrnwKffPYkKX7pxwtHCBx3N0ltlaUDe89LN+7kTYQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (50, 76, N'v6P5bpdvNlqpmvHYGXDrj+hC4hkg44/CnXwnRgAL6Js=', N'CQbcB107Zzkq7CfbGO8PhXMcUoQduEymBrdBeX4PM4Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (51, 77, N'zUxRxUA5YGkDSz+6A9UECl2haZTNWNPxJ9gGqkIc4P8=', N'3ZWpNQwIYKxhMDeQOq2ClIP+seyfxw+3Fxjn5t2+aC8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (52, 78, N'oKqCI29ukRlu7nai79tHEKWRbW3vtbJ+pt2Lp84nQZM=', N'dWLxLmAH3D5hlB5gCeaNVy4+YtdjbHPnoZ+q2YgXyXs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (53, 79, N'4uQ1vxLa2MwVnEPs/gYynqhpYlSLL2Hb69aOWvwnXJ4=', N'7wAuketsleFFeE5XiatRjBsSa/y3qkrAIYWrdBbHGxY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (54, 80, N'a+kB4SZOF1QLnFtQZOfOdY7FAu+Zs/Wmp5q91ZwuZxM=', N'6BUb3i+ko0SQJrYDR88oU1Ij07X89ijFzc/AuzghLOQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (55, 81, N'zUCRTCyIVMyj6tPP59+lCe8mVmLIJ7QhSCXuQdo6IKI=', N'xXA4SJc3Evn9WI58RXLLDEeOV1yJjN5exJzppDf5Xy8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (56, 82, N'88KpmZTJLWIy/u6nTGAn5IDzdRVKPmDYOZHP9GDaU0w=', N'MI9rzoRQkxq10piQal1N43fJxVt3oS/tyUMGRJq2tVc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (57, 83, N'I3v2lB7rOCJtIoAxhquKeT2dJH2h8Az8oe3yZfKX6u4=', N'1msbeqiJH9e/JdO78X+t1zWpVgt3Mrc7MGwMdhhS0xs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (58, 84, N'RyCk//yYGanf3myD+qMc+JAXlWXWUknk9SpVx6DPzvc=', N'6ZU14Vq0ssBO+XaVbZYIjmcOfL3V+AQ6v0/iOIE85Xs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (59, 85, N'9PGNb6HUdSD2PKvlM/LFemc4oA5ULPPSD574YXmvWi4=', N'JjYo7OBsPK2MO+lleiCge5KRdJD8q+y+BFBwgN3wnQI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (60, 86, N'QjHyM9ptE2Y/ijL2dSDvAuKupBER9qgJuK0asgg6Lh4=', N'9jv3jXTjc+PGwJHSMzB5UdgJ7rbpsWb9MuwcPBpVbQw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (61, 87, N'oGRiTw8FBZbsKfJ7IVShgyHFnBLl72H+j1vx1qlvi7M=', N'hPLJThH3nLSFkJnaFG+OCtweUMJ5DdTxZIpT+Y10VDE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (62, 88, N'6iJ6vVPCubRQg7hm4X4vWYgPsQG49SjuXVeH9t705DQ=', N'tHoWPJ5DbssA5jiokrYNkCYUwilsUDvhOJipWht5Jic=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (63, 89, N'b0+xN1yZUQNcwFaYnHMndCrU8zF5WCaxVxLbD+Ej/hI=', N'dxcknp8jJUam1SHgaTFOLH0q5mcQPVRS8fhYmZNtQb0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (64, 90, N'iAqWokkY9IDaU5VfqK5SIxZRisSoUoVfBjnk7wncZes=', N'RPTa9rxG8O/SYZ0vWs03hu1bnHEX6ap61Yh/FOwG6oM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (65, 91, N'kCph8o8hz+uYjxwLn58fF8V1kgOW+QHlQsiTy4SG2A4=', N'1HJ4xmRgKRGuuV1OHzp+CLuISS9twcQB8WGfiubqBio=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (66, 92, N'fYdxGVE/W+wELoBz0LweHDYhDovHgSzyRAKOH0JyjzM=', N'9YdInHFIL6kecRs/JU+jesbJNdhOR6a72WFXIax+i+A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (67, 93, N'8wcmaSHEpHJ6UPUw8VRscmNuD2hEoHO3WnWLRyOJJIw=', N'0AjWjmakXMzcXWHNhTTBXYFNpo4J4/lhYulpkT+LfLM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (68, 94, N'Jhq70CO+wbkWkDuXeR1NHTXUVjw+wgp1q63aDtNxaVY=', N'NBXK9bOsn317QrbysPqNR4Zw6mwDCwtQ7JZvF+IiJzU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (69, 95, N'DYKh2WwPNl8SP0yiHWaCju8mwzw6vDPhi172OGzYNNc=', N'0NExG9/xSXadvP8cH9pofnSfAPv7ImDfSoYfrU17mKI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (70, 96, N'aV0WqNKSnbh7eJ60yd81zXlsq17Cc3o0X4qIZ3YRvdU=', N'D1iOA0e+kYP1nnOGmaA/HXveHGDiizIgGUuqP/LsXaU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (71, 97, N'18GXAJqSJ6d4i6F2FGU0Uxa84T1BgVGj9lX1CKZ2VuU=', N'IWI7xKo05Is4jKOX7xW2Knk+VufATr/AAlbv1unAT0A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (72, 98, N'1x3TYxUiASyBt3Q/o2mJJndZqeM1W9LeCjf8CDVmIWY=', N'Ti0PYwjZ+JxT6qyppXVUAL8LIO1Pes/WyOOQBD3BARA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (73, 99, N'+yA0hIa3h7BBnptLeqsK9Q4GFmT4lAm2ubXZY2uwnTE=', N'ovpVUBFhYViEoblLCicPIj1EZifLffggmGES/bdGbQs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (74, 100, N'35lTSv2O+lQMQ2+LdvrjCqdrCL9vLGQmU/zpVsZ3H8s=', N'H2hIoTkxg5aiLuJ4O9MYHgOvZDk8OTZVc5VMl/1pSrE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (75, 101, N'P1035GPgXqwMYu3qhJGrA1sG9Lg3Hz8SgP+tFU5a31s=', N'mxd9eP6/4VSMbcSiRZyZZvZb6w2JUViJleWtaqt7qdk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (76, 102, N'D32tJxycgn5rE8YUDiwiUOoRzZgvQaVzlY8ydVInn9Y=', N'bDTeig+RpzIZZHCbstzDyYpvF5KMNqTJRbu52zXrbuM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (77, 103, N'J+ztqDuKGK/eeQRO1TTIKOryOWbt7tE4Tcpe7L5Z7uY=', N'wDfHwm5EI3ps3uknR6V9I9LrFTsl5V4dDuPLeBoqy4E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (78, 104, N'WQXCSO8o5PmunbKr+2fqTLd/wt3XWVvPCpNHAHJ8OjU=', N'8yphATRa58H7eAG/O1OeFhTr3eSeJgn6cudwTmO9JiA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (79, 105, N'JPwasxXlVcRCu7Gu9q+/kl6lyJyYwX9AS+LvHQxGo9I=', N'eFK0ftHbcXPeMgZYwdXP7peVKahKYLQbmmQaMIyqkRg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (80, 106, N'pLRdnDy35VmU9DJWV7yqxm6T68rL6/6GVrGxhN1hGY4=', N'hYh168fXkz+LMNFjyatdAwH6nwlARcRtNRUe3D1B1gc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (81, 107, N'5v8l3wfLnE5BAZDo3UjcsS3VKJXlBs0JFKh5Q8feyoA=', N'EQGqy/j+NIEBRSU/VDCJlt67mxSDoxu+K1FN2gfsvXk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (82, 108, N'dAkE2hhwflFpZI7eMFx/yKDsr6bQ4+fUNX+2KVGYZ4U=', N'+MsU+KuhI84QQIyhSnE/gt/cMh4RWfEfSQjx5WFu3Cw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (83, 109, N'QDjLwenkIBMT+3SUmi1eMknUyZJeoxrScINq/3M2CZk=', N'6+4Zjqac1YpHqyMI5FCmaWIddcERRtoUix420cvV28U=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (84, 110, N'8dWqpgYHMBvyFw/5xZZrv1n6nOLocwoeCYcGHPgk8/M=', N'j/uG5es3YzZTuNRA1jPVocBkHoLbVHOeGIAJYh1ZkIg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (85, 111, N'Y3xvJ7quyVSaw1z6/984pscCVDOon4DLWrBA44mEZ5M=', N'mb66/eFQRQU3+8TRjkdKvNPXhYhDjyQsjGhuTdtt+rs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (86, 112, N'QuHPoGiCTPyitvpTXbDkr+PKJ7HOu77CdW2I9SWdCrE=', N'9PisSNvbh8W5tYmDwuBY6qZh08gMIxR2W1oedPFn2Yk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (87, 113, N'hy4KkA5z5y7oM1qFiE5dbL53WZYDGyiRZ8c55klqJUw=', N'h4hICOELm2XooQvK1VpfadiQD3e+gGZsQsRoP0d+m9Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (88, 114, N'Nj+A6SVZw7qiwPnHC3qUInfG5NAi8C1uT3YOvbxUo74=', N'CpsHb1l5uXfcrDMBgEnjrG0BgJUfJF54J5SnahISMN4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (89, 115, N'Xnu7SE/D+B84r6+pOxN8XEHYYqK+BnVNTy+om2vmO0Q=', N'HNVDCY7fqBznWIBjVVqbR4+UVaTepv774U/ub66BieA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (90, 116, N'253W+WwMkSS+wRs5I6RJyGG6+NT3qfaQ2ea9WSxWcgI=', N'NoF1yOdnibUVGn54ZfaBgzXDVk9Wx2GY0LIWWuif2UA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (91, 117, N'I9k1u1K2mzIyE7l2xoUFixI/elGU0zDULN4jtBzvzsY=', N'u1BVotIbGIDAmZ4pe1TietE5mNnapbl7RCteqvtE/2M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (92, 118, N'FPn48QcIJi0+mivGe7BWZIbH48mr1aMyLcdVLqli0SY=', N'SKagGd66RZQt/g4ZSq8m25dTYrS3MgvSU9RKqDyBtSs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (93, 119, N'q3yQx6di5FGAi+/8BEQ/baayhSLVhlw7vrnYaZBfWf4=', N'MuEopr51qVj+AvhKCWXc6aR7jIViCYUjmLl74QjZk7w=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (94, 120, N'3qPqDyMMVz0qnmnWBi8sP8HayqCq/fsf0vXb0gekdwo=', N'Tge0w5arxiAuOvBcgjAf8NFeqB3IpZcj14xNg3sz0n4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (95, 121, N'rVkRnCcfSaBJG57PKUl7G1jTZo8PjUvAiSuEFpTPQn4=', N'M1j5DhgTEbHsPkG2UtSMCOhJoZbsyqOG5J1lvzaxbNw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (96, 122, N'96fi0+Xc22+hPmfVS6oljY++2wigg0pcpllF6Z0s4Mk=', N'FedxB7h/Zc9+871cX/OqCfIhICM6Lu26j2cZMAY3RpY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (97, 123, N'4MKBy9nq9EeYZGExIpPaisHmUtP9beEVhPKZkmYAx78=', N'KOPneG7xdokSiBDjQc1foyHRrtyZaYJ2jDOjA0AyccY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (98, 124, N'G90Xfj4or1Yi8PfUIFwi48cCdHY0cvucVKNJYvkQHqI=', N'OkMC0aKsxEOTUGmbY/eZF7QuGVt74wWYqrLkYiPwGLc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (99, 125, N'zrBHD7pfPh31NlVuIUrIN0yvLACKce+LBzGfjjwSIb4=', N'xDVc6FuNlTHy74AtXnBqegEwiHxdbDb0wCWswbqGUkk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (100, 126, N'lwB3pOJnjndGyqMGZHiS5ccu5LrbEoRD5VeAQR+crHM=', N'Zh8PVdEoBqhmU5KCUwIdWO8tRG87feuuN2ZBxYF3Bqo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (101, 127, N'k9x4WdTGIWBCx9H7o7+n3VGy+qIwOAgCvx3tJh00/ME=', N'8C30hnhsjtVUlsFaUw0TrFBCesXDDNN8Tcuxk9dSJKM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (102, 128, N'ERVcHfa18kN1M1LGyr8wQDsGQKjf8Z9ovhVkHHj40T8=', N'6xIac6pmbQZQcQxCgLuDRxJ/Qqn2ZFqUpmTU//SQ+eM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (103, 129, N'CV7l88vau7/20NmFDVZS7Ox//zsBF58mJ13P+SAwipo=', N'XpaxJUyk6ahqIJ8aXFBEkiw2aPVRFJpFzp9xsGNUxN0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (104, 130, N'I4lpzvpwAW98QIoGKdUt1MnOzRc7Q0DBUAEKIe8PA6c=', N'tneN7XcXSIU8VIWIRT/niBp21+BIKPQZgZQykSvQWHc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (105, 131, N'5DzD9ZyzTV8RBsHvX3M+UIWLU+tsPwivQk7CEsXCUPY=', N'tEWbBqUWy4J91Iy+yEfSFUS9Hi+yATT+rHS4tNrHxNY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (106, 132, N'GYYztyY8SQjFJ4me7mGz9HI+JujrCiLVanjzsd9BhB4=', N'WHpdJqPCAkjgoqww4S6yXSXnzXK4J9mubia/VTPh1Jk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (107, 133, N'bM5IdYmPjeShYNxZSm1CjOZ7L/6L1f/YZM3i5vJEjDE=', N'1SpCojVvXgtSSBYuXUJYM/NyMIaKXcIhq+z+KUqdM7U=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (108, 134, N'Qewwj79v1CjbyRYO9EJxazO8QvLLF6tzb6gTNad5zr8=', N'xVBb7m4/hr4dcrWYwoaR689Nip6V6U5lntgbgWMNa9c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (109, 135, N'CM3XaujKOiFR31ktIk5R9Jl1h6FzJXH+lNrCNVFg9n4=', N'fy2cDJumLnQAYH+1I6A3w+ZAbc955T3D0L0miMgq/xU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (110, 136, N'UItySOltRJWZjwzdDlGZiheoN6wAGTQSHoEm5maMlME=', N'VgjaDhfon8MfAT/1ajCyUKjdZ1Dlnxk9pxpuyStcYFU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (111, 137, N'wFl+JHQatVhW6wsc/Ab4RukKZJvxsPjxObdPtyqCKnc=', N'2ZyK5YI8lDjpyY6GmcAM7OpNKbk7bQVXFBlKmc0rB3U=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (112, 138, N'lx6r4Aan+KKsTPIViCwJNaz5wxOXJT/WE0xVn5uuFiM=', N'Ec9xreV70uP8UOhOXSuC8+OAuyM8F/K7n9R5Vnq+K24=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (113, 139, N'Tl+E9M7cceN1B/FQIWP//IfPXRTWYIiOfSLv7UE7gog=', N'yhBrcLuPHKeZZurjBtTD4af249/WOlYbbwSfW/Pwpzs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (114, 140, N'MgT37uFqLe8q8KAB3HH0G9piFHNLykfxbrFtiPQNDlE=', N'j61p7Npl3Y6qvBa2NLSXANad8Opwl/M5x3eGLJLZEWE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (115, 141, N'iQ+G6u+B3ZzoxqGc1T+y4kG7MbUrjZyzz/TGVaHxQ7E=', N'Xvfr8OJGninkRLFwaad5J5ZpORDRLdrMf4yxpGhAbKs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (116, 142, N'ppoJe3clb4sWRlwFvb+G/ACYbD7XVVg0qvWjUez51a0=', N'ch/JZEdQohkMiE8hVHnQvaftjtmjYz8QkSJiUuTVfBA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (117, 143, N'nkmdAUw1r/ADi3ldeI/TW8tBX3q0YSO/SnHRRlfOCFo=', N'X4Xhg1G4Yat5B+qWM/vfSLGXTF7pJRuxDjQRuWg4ado=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (118, 144, N'klcUrlxEGOJDEM4qmW3difHtwiVvS14VAvd2q/w2reg=', N'mvksxRWg8F8Df3o0Zzx22wZPBxtuwmwiWZqqlwekGqU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (119, 145, N'gzrNvR0y8srlPA5A9ONob02W/TwEEWqnPE+rg8WyaWk=', N'uM3QwK8CZSmo7uHlrwiOZUBcotVYDzpI5y2125VkNkY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (120, 146, N'Aegnb6H5ISYS4/QVefI8eH2OdqHRY5OAncuaMCna5z0=', N'nhVA1Z8yFaZ2kbu+gNS8BsM+VSr5Zs0nDVqyvL4xePw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (121, 147, N'OmnSslw8eJ4nB7GAUPEPjU0bnIkzK1sScjSsBrwCu8c=', N'Z/pm+NIM8nrABdb+HhsZVki01ctQZ7niawWTOVC9ppc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (122, 148, N'y8LqLbzlMAEpi7JUtDb2mt5qj6WytN0ippWywNNMPgU=', N'JsZ6ps3O3gahM7oGpH1RYS8N7R/ZA9mrjSV1SQpDwe8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (123, 149, N'2o/pZLznpDUo0r2VwOWAIKJlttHI+NVc8QbSWI71/+I=', N'//9SmwF7/8xJHSv8RYnOWC1oJzJl+GKZVKQL+3/n1NA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (124, 150, N'W0elUoaMrhKG6WKQisVcGVbneiJXPj0YdHlfLZg8Ahg=', N'U/e13JcSkLlMKnwG37+TgDKXjBBJHIV3/KA/Gu3xaNU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (125, 151, N'FmWl93e0WqDmMNr+xwwInY0Rb4aFcZkRJDS4GBjNnII=', N'lwaKrc5NJ9KtCMJLf1D67pLkiDu0i/p3wdc3FYiXRtA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (126, 152, N'eZr1a5+qTzlAbr5RTQ3tg7evb+1IXaI6l48A8y6l5V0=', N'nBF4LoqHnSdzibzdKQ95qxZNhC4qsWJAHvaUW9byo1A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (127, 153, N'+xPpDyRqqWyZlY40I3SeIMbM7oQclE+YHe81PTHJ8Pk=', N'YfKuQ13rerUIzcNPOS3jo5kn8Y9w1o7fyqkL0xdF7A8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (128, 154, N'WH3ujz6wpdLw9F4YbvK8iQpalu1Ub+GEYYtlKJbhQo4=', N'LvWfvSE98upygLGZbVixWEbQBqEf39z2U63OTDC1ozY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (129, 155, N'WPRij+2T996Oqcga+I/osyOyNxOPdss28t4ujqiZgoo=', N'p6X6wZbLQl+3zBETXRcsf4DLgtmmMML6dqQaAe89lKk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (130, 156, N'XGoJmlHCoOCfas1tXaB0pxyp4dkgXKq6O70j2oJk8LI=', N'WiFz58Y8Op1Sd+GXprxB/dlZjxarKnfPiM2ph+IqQ28=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (131, 157, N'+IGbIiuXbxHNPEB9rImyoUswa/SEMwazwR6j8fLHAiI=', N'unCxWbUapELLZMOtW7AzdwFLZvABGuWf/4H1WZJCPeM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (132, 158, N'HNF26FydHVBXIdrUDTNUhd+7q+1EVkjTz0mAq+YGTPY=', N'NJleaRQdI5fUM3ppDdb3KgptY7Hnk2aX9c1jRL9CeBU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (133, 159, N'tfdQKj6B8fTXhPaFHCmo14RVFMaZTptkhuG7LctkNQc=', N'RRttfzcsjR8Fm7ttaqkVVe06GxGUmeyCUHrh351HvwU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (134, 160, N'av1scVcKI+EhOZ7PIZkXNlFblb8mgxama88L5sTX7fw=', N'A2dbSYaMdiYa/wjQ1Y8LjveJ66k1iLFgrj6QXywaMLE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (135, 161, N'otRJxgX7h8LAtF/MpmV+RY9tddna1Pw2l34053HW0P0=', N'bqduUBxHG4yJEZgcikTfoPTJJGxUdkomeWFUqyioJ4E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (136, 162, N'0sG0H08SCkT7MLOJ+pRxcuZbiTJy01uh7ioCwDEzH20=', N'jzLnaTHx3VspfeBf16kEe7g6FDb5si9I1RhOzKqYd0A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (137, 163, N'+OiNimijmR5Kx9IycrX/wADPLHrJdVGLBKPN6wZlvnw=', N'+0NWIbVXb0XGe65Lfz221DOeplU3159s9yGsJIBMcP4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (138, 164, N'leDrVaDF2Q66d3T1cW/ni+FVmCcyA/3uyFnREmkXD/I=', N'c1jaOzWS3Op4M6JURKF6rRwMCYhmXuyUFgi19InVqyY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (139, 165, N'gDjXNy7VtDndrDacxHSnCLxhj+Th5uralkQepNGloV0=', N'/RL/lKzHC8idHtkFQzKlz25DqbrxLsqoXYUJowqP8oM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (140, 166, N'IKeCur+ddg2KG98lZ2a1C8cIsHGp+fgEL79I631uA8M=', N'wdKCLTW1IjOmwLEXGdWDP23TtqtA785qiA2z4TR8Gg8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (141, 167, N's0jt/p6itJYEUBajTyGEVy+14C0f7C3R9+MhZSQrw6M=', N'om5Mxfm6nJIaxIMSHHECoZaK54OgfxOEBFvXTG5iIik=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (142, 168, N'ZjCdc2MEUee4LnN61Q3dir0+mRlOEB2wwM70Dnte5ic=', N'3GckBDb0f0MQzBJDq5Ackga8pmCPj8AJJ1ZDLbUUvN0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (143, 169, N'4tqmb+3WAcDD8AzqqoEDDakkOdkDViaD40/w4JKkWNk=', N'Fl4u2f7qFQKbaIwruSsJ4ELEUx7lY19jkK7mtduwAFY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (144, 170, N'x3n97+9I36uDVLsW7zB3rfJrEvt/2a/j3pn16QuhnKU=', N'6C1Uq5Vsnl5vyhU0qGuggkfibGV8kJg/BpZTujrIInU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (145, 171, N'qZOvHpqngUYbniWbcTFDHNZSnMsGRkaQbdCUxwZhiQ8=', N'8Zeo07cFLjaKDqOQ4Rbi1Ny+xEwiHZcyUJYEb31ZGBg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (146, 172, N'LEhlmGxyG0ykmaPsigaPBKkKYi7qrlNgRRaWAs36ca8=', N'6o7ihTZ1RnTXvtVCi2UUUohBQXh0aZhrizSVmqkT9ag=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (147, 173, N'ES+o8C2AcoNfUXpfFh1CF0olG+WmvrdhC8nzE4QbUnk=', N'4ixH5UkgmXWkg6c2hYVo1AIUp48aGm2HaFB4VUy+/nc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (148, 174, N'MncR+5TpM8Q3R4Q+g5OJlbwgLRjuvC4MWFopt7MK0E0=', N'IxxHo0EBOz8HQKTO4F9edARW7HYL5V0/iVUtPQPDeWs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (149, 175, N'3Gr/qaBlc+gE3/ygexVyRG+VWC/WhpHp3eiQGweCkUM=', N'Tjpb+2OACltycVYP/ostjgwrs5Na6RfIPuoFLAylXRI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (150, 176, N'Qz/sggtb/lghkmYc7Dk48El73EqVZH6GgXYoyBF8Ia0=', N's/h1ytIK51Dt2ORbNcgyqafwFvpgjRG9ZwVdEv0EOvU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (151, 177, N'T8quOhvVM9dBsWJJJ/xeocJS408OMup5wh63/UEYc/k=', N'J4Tps6W82GF46i/AGrzqNoCvczaa8LnX1+XgWevL0q0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (152, 178, N'FsBetbgzY8rE0BAxBeLdTSzZFd/0OwrQFt0SmdPwIa0=', N'OkrTBu2j73axgkaK+jx3DeS4hg1i6Y7dl1h7v9aWyjc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (153, 179, N'kuEsGwCgRTVTNBE8X7FBuHI74ZY7aXU9RlNoJK0xLM4=', N'hCdDcc4asWZdP6KaOgekfeYkkmimVovSBgYwscyeRsU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (154, 180, N'98PfrC1Ign3i8S48cvijIET3NCgaLEq8q3TiAR2WB18=', N'JoT2OYhWro3xu93rbJlaCS5jLeideIMrttQeA2bdjCU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (155, 181, N'FM3Rcdr4DL8oHiB0B+/QNBRpUhJliKFcQn2fmjxAXbo=', N'1f6gLl/9r1iLlP2Bd8PJGC2ptXsAO+R0IG9a5GGsPq0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (156, 182, N'yuEdfXT2NsALIPFNjmdvPSRk/6+zY1K7mxvJrsbQXoM=', N'rq+uueCsvdpmLfBsVJncGSHKbKs7dmtZL022mbTcY9A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (157, 183, N'HyKT/dHgCFUQiupKPu2uAGCzfmPr58asBcdM3P1Xf4I=', N's2ReFQu2Fl/ru/ej/hXxBbWz/HmdMKdMmkaDi5CSMMk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (158, 184, N'ox8mu4G6sEVh5V5oBl6mXZ9gX6hWmkfh010Mfruq+bY=', N'SOrjUDjPaoVRTfUPjQ9kT8E0eGk1Op4SuxeEavisiyA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (159, 185, N'hzPcxEbgblxlUg+uKjIOBLBd+oRiE2mFNtTR2KaYJss=', N'aMeXEeGeGX+T9cOABZrg07jiqLaktZw8LmXCEcKP/Qw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (160, 186, N'/nBUpER3JSL3L0WxWwLRW3AS0a3dbQX6yj261d7caIM=', N'wmYxz/Koaw/ekQS0bsKmYgP2z1SOc79fCv8lC+fVyaM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (161, 187, N'BqDdsm7zai/CViUM2pYGQpmVz29Usa5fNHr6TGeAi6A=', N'fyTUQGcomQ6fgPHoSCgIo/5Y4fEetz1nLsnzci7w4tc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (162, 188, N'stgcsSYl4oi/OsJ39CMSvwQbIJ51cV6t1me74l5/mBE=', N's9nFcEXidruBZjm2ugJPv4AvC2JUTcUlC0/3iO89nE8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (163, 189, N'brlZrKAIjo/3jYDjObToSKIkeKavRslAux3WC1N5DMM=', N'+jPM2XpAiW1gNazY/Mx9z6+mqRnG+/TWMd4sH3Fhfx0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (164, 190, N'WzP/yats2c+S1ObI/4cTZtjDCN1Mu8rmxFykvBpo180=', N'H18q2M6M4jQT9Lp9Xl6xdmXXjj7tHGPy9v5MvHraBpA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (165, 191, N'zGBnV9QV4q4xlLaEj/vlNewNd//6eNwvOWQYXQRdXNI=', N'zhrurP+93X6hHfbcioyU5RXqrkwyYIE3b+NyDE0Ng4Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (166, 192, N'C7JkifuJwINI61v5qikFabkwztBNQzUzEpyqYKq7n2E=', N'7APKCHDbjNjy1KamXtQ74a3gVnRSCSMSN2maGME3TTw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (167, 193, N'zvFnFJ1w+dxvPD6GqgqagTq6yYqCtQppf9xmn22npqs=', N'hTFh6WiiXDHJ0wIiYGezELy0HFhKFlU7z8LuEWAGCKU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (168, 194, N'f9vNz0sIUdGtRubn7LPHxJf6cy90+ON31IHWADX48xM=', N'LD8XcXPvZK8GwtehjLdUH0Kqsd/GaLtOYacsZZtNK4E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (169, 195, N'9M/OAN65Ht8lKoqhBalsFGP+AlRg94fSXO+zFJvKKdE=', N'BIInssBR+/gtiv62JjirNe3D9MDMiF6YL+s1tdnmjNE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (170, 196, N'1JOJgFzex9IoxCsEvNF/lZpReyjtCnYC89XwZo7mToI=', N'RmUq9sm3TpG6a86Y98VvcOoiN9am1QnEG61ndld3i0A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (171, 197, N'9HR4pjCKyeLoxqev2yKxPGaTdwRzruIvoDcxL9vc3cw=', N'Okhl+LqwY7uMUovYno7+Xp7XiZq7JQrN7R4Q+Dml5nQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (172, 198, N'ARmxRfACfhnCQwK76ZbkmSAM3KhHMueiYQl8AmuLK1w=', N'FPhs7k3V176oG7n6XSD5e79h4Pawcc3whM9eBWb/CJs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (173, 199, N'p1sHkR44go50c9mOjKGUYt/Bx1VaU1H+xSFC390ZSNc=', N'1U5spwaZsdvK74Oo+ox/XQI+Udod4EUD9mFaSo/B2UM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (174, 200, N'5YJnyXhzxqWKCNcYcteo1mey5/pGgpDZKFnpwMVfltk=', N'6l1YMmAXedi2cN2zNvUw/pMyFTjUsQOuqPkRVmGp/BQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (175, 201, N'fadDSRTr3vTxW3/to4/xuwpJePQg6Un/d3vmpa1SWT8=', N'TScfI+nqr9YBWcfV3foJkOHwn9EZXPDlvzQ7sGcoJSo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (176, 202, N'Olzv1QFGerLBpiTL0hOcPlxD+atj650AjuN33MMkCuw=', N'yRQfu7KHHEOHftBlAoHCmxqHBW5Ycj9zu7gV/ILCuAg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (177, 203, N'Pr/V5TQ6Ps1qdBtBsRGJ6l/FSS0IXREoY6BzL0JIaGI=', N'zqOZoVAZaatNr89OqiQe7m773Hx/kMviI7QOoRIACvc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (178, 204, N'xfZO4JB5E8uEv3vx23nQRzcVLOKsLbtHkiQOvicwQ6c=', N'/i0lOZg2zkq91ipVY1grgVaCCOsCZn3PrWT+u+PLWxA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (179, 205, N'Dxu8clbfPNFULb/QFPygsKzbxPEQRWs5iTxszqXGR4o=', N'oL3zD6pFvgCpu2LfuEqWhcLUF3t5FHI2GkeG3nFf0FE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (180, 206, N'eNz1eDNQ5brB3UCB8u+KpjSQWz+lj/oxVti61Vm/38M=', N'H40KHiF0KJXzEudPREc1xatGrYZLmT7/tJ2aWLOWnBg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (181, 207, N'wXlQkPEJ/mKezt9HziBPyGdBvcgsHKeaYDsAahMxsC0=', N'UwpiAbSnvBnZXTpSEBnRlvG+ruxD9nhV2/u/JMs24W8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (182, 208, N'vngIvRdMy9DNz3mFtOhqWXoMOrAeoFlLX5mQ2Xt8OXw=', N'+Hu0GkrYKRf9Ff9YBKHZXgjw/15WkgRNMM4SDnoYte8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (183, 209, N'rx1TtZUSGywMfXGSBYP0E+/TjooVvTv8LCdjIIiYE2c=', N'udh2EMgfZqzkTkOVBCqpT0dm/0W6zQWpjDQptFMllVE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (184, 210, N'Y2+pYaS73e4oH53H6KDfasUIMzjS195I3uvu9ffqnmg=', N'RwHfhCP0Tzfv2u177QbuQgh3NokIC6PQ9zVDcIwEG6I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (185, 211, N'V/aOhH0Gj49kNZ+bvN+toJBuAjGIBd15ovNuygYQatg=', N'ka9SEyu3SQAkpmvXB2KEQFkdLUto7JvGfzu8PL/Z2H4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (186, 212, N'xDj0vvP6tdYyP6ludvP5gNZbuSEv4xYQu9ThA4K1z7g=', N'ZEEEAYvK2QvF5E4P8wTn42TWQihhijSzmLfCsiq3d3A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (187, 213, N'VSMSDpga/wbzOhTCrmNqk1ZPeB6/mbGkUBnUJ5DD2xs=', N'iEcAWbVseqazqZf9obzTd39orAlaANYjNL5eOjyQh2Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (188, 214, N'ha1jJMcpdEvcuHuTLnh7UXeWBlTn/KUEMkzayCZcP6k=', N'aBoqLak0iEsWIbBXoDcCgNPS5sYHiEliwd/3XTELjKY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (189, 215, N'YRVWqkXZo8qmC9WP6ATkb54kaxcoChJsG0KcSYoa3eE=', N'96OnjXNZ/mUKZXqFf1gfzXSXEQSUucOdryGgjECOcTs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (190, 216, N'PRep2NZlgsrfat8rIdfiiIkH4lacMl2AKs3M5z2Vuho=', N'kyTOfiNpbRj9xeb/ueTxwedCxDAs4WfUAsO3z+VS4V0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (191, 217, N'3qVVMQkCtML+JImUTU6sPtsLKcx0BACZh5X2SgdBtPg=', N'Mzb9+YlgkNmpoHbgFCu3SxZ3UQWeJOqhjoFSnabVAac=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (192, 218, N'RudgsyMz4BjJGTg/lA8pvwBJ+lmGERb+eDX1cZv4oTc=', N'l0V4peebXe+go4wp+ghzFc6mCvvfNxf8DDAL5bEhawk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (193, 219, N'XcWM6pMl3FwyPZoTpEuzycfLOguJFjuO64mZveSM7Q4=', N'/1EWb7cbhJuc06d5eDqhPMdyRNbPLiPVZkZAFdd5S64=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (194, 220, N'fUC83d3qSyWNitwP8EHFGlR0p1s50nqSrGkvZn6Xomg=', N'Hcn4qiUDQRG90fDXneseVbaOQfJ6yuNKBud3G9HrjsY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (195, 221, N'6maX0VhuWbZvlnygH00U0Au0UhCKfp6rNGFEsTdtd7g=', N'TLVM0ajrn/chCgOHN3kUdR3qH5p6hYpV5cP6O9bP30E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (196, 222, N'B9nxUZkPVbRn+u63YKnQ42kudEYuENk0QcccB+PeOn4=', N'MF5lUU3XOm3dpVLhqxI836QRxLzE3uPOMJJ/JFTgaBQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (197, 223, N'VVbyGb1bAuyTag7Mkr8YXYULRLW/BP7y5iOfqoirFcE=', N'pw68g3MGOvRUs85Cj04yT2pj7uwgcclay9hxkxxuTLI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (198, 224, N'Acg2O27IXD6allAMJi4NyBug2q5J4rC+XuNEOD4w6Tk=', N'l440kGTexsHKit3EvhzUp4xlIGXK9FX8rLt+3fMITv4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (199, 225, N'I1cwRVdlyiIw0UCOXUmPgiT+kEmXmkvvIUpp+nC+f9w=', N'uyQqz7uIR1kmB2Ti9tAd0J1jxl9SbjkRmWuN25CsK5M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (200, 226, N'cXW/a534jmLcMEwWe3126PkR2TxrbhMn4Pjdrt28Yqs=', N'UhKHbWwjXlffiYlMvk/BFDBlb7ZPaumH4WY23w9f0qE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (201, 227, N'rq5VVM4ic5AvGUjpl/8O+BW+ZQS99Rd0vHFJeLwbmYE=', N'VEic+dbgwJgzjzKZGzTVrVc+DKm6ZO3YQdopPNBNU8g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (202, 228, N'rduDkLpvYBVaLN1/K9m2PfDNgCFmWxMZxgSiExh+6Fk=', N'hlmdnasKc/SElU0bO7CyfMmjyUdGQjQivEnHbQxLjsw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (203, 229, N'LuIVas/ZsS+3qdIESkuQAHo6VPo4EbUrKl2+MqAU3rE=', N'rwIruBY4O+qGuyNKR5oz//5jEDXY9NFyko2oEc2bo3M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (204, 230, N'vpsVGPPXMeQyHo8JO9bKafV4q7x5PnZG07lorUbG2OQ=', N'8HSC7boopxDLxIxnQkrgOI6eQepXSHeFl5TGs2LYkcc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (205, 231, N'QzVKqj3xBVSRt4r9hZ0cGrpw7HCn+9uSUoevQ/4MGmY=', N'ItdFcPvZnQSSRNeCrR2xu6CRZOJl2a9bC/uyu+rQIWs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (206, 232, N'pqJkxY/el8iazIM4qyAOT6idvNwWo5NmUz080LN12QA=', N'CMENVpDsTFqyIJ2xDQ3hTLtDBU9Rm9LjuILL4cvrpTo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (207, 233, N'yEYd4G73FYYY+joCrWVj+X8wEwAnm8CSBXsrRQROMjc=', N'jmemxXp/0rxOe9tOoE96ZPjcDjYuOLyOE5gX1ma3Nas=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (208, 234, N'Fb9/n6QhNLoQ4jwRS39N4MY9r2VVxkTsO3f6/KRVD5E=', N'dYjVH1rYCdpOPnx9po5RsJs0BDcTVjSQLv1wnBuCi6k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (209, 235, N'TzXR65k6p1maGj+M6kgGGnhyr79ZPzCeBnLYhryBPRk=', N'CsPM3uz8JDfWovUs65grTtsVHcI7fzLAi3wb2Q3iYm0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (210, 236, N'TGyilsjlB5Z/esgoCvsLtvR+cdUDKB3cOuOYhW1yxfU=', N'cWltxFGfFbSLD73ZRU3UevNSgSQ7Z8NQEgER1TxUyW8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (211, 237, N'cXM3zYhl0RvGHT5znrNWsR5U73679Fa7Izpplf2jaTA=', N'rUXPYxwR4lS0bFPu1vMqmjw6u/DCvfByh8wuOrEg1vE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (212, 238, N'RoqK+cxctpCSTQFBYHQNqGGQJM3wpSOo6uu+W5gbNiU=', N'MuEdRsMKf+bHXqw1VSQXct3R/dxy2+oEOMxsyU3qaCI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (213, 239, N'rxb0Iybujek/CWqeTJYSgw4WO5mIL/0txy/DO7NskE4=', N'OocqtMnVkql07+0gBTxDaF4XWkcKsdqf1gNXLBYE9fg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (214, 240, N'iQokiWPaI1M9dUWIx2DsXuH6n0B1aYn3oTOdQne1Qik=', N'8Diu8GXHpjuX/Yt6Xxd3gI3zZojcyTZzPwaAjw0QtA4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (215, 241, N'ZxluhhhCZufl/9cPKsolLmdnJi9cgC1+BCrnOcYRTtE=', N'lpFCBp1DG8eUzBpoEyKnj297AAqg/hN5KO9Bg+AURa0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (216, 242, N'akKhSNijjoTOham13E9BYqd2wU/BK3nmHivLe0m4DyI=', N'Jh2tW0iOMY86Q98QT3RbctMTzhgMnfMt8jdvOERWmGY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (217, 243, N'UxFDGYy7SsWQpepYVzN+dc4YD8zGaomyi97d9QAfkEU=', N'baz9jzavOfVt2WIexwFewMPJS7JZ8L96IjwgyVjVqKQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (218, 244, N'VIWnS/oy4lJT/Qe4YQUz7HEF1gw51qgGXg8xUGplQMo=', N'Y1i1IRuMiy2KbTUtmST4QjtpLtjIGO14r8C0yo/QqeE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (219, 245, N'Tgjt2YKK4O+dqoP3IbSCILAj8EQiAuOycrlyVEmfa6w=', N'pMNFhsQeS0Wv78mD/jINPsaWk3NMCNkQcw54BieMWu8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (220, 246, N'JYcbyNOZX7mzop7LWPUeW5ESU/54Q5Wwy36iDUwkP54=', N'KNuVqBvqF9Wyl8lBTlGJ0oC2k6kne1iXjKc3aJn2+pY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (221, 247, N'p3D5tupeHX+tM6gV6FdUfpTmpWLwzMctOT47ZRTXSew=', N'JChO6B4l+xraRpOQPjrrZbWr83+X0BAKMcBUrUbr/So=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (222, 248, N'9+6twX/J0VqBoQcsUydv5j8hPQVriLZgrxhSLkUtlSA=', N'D9RMEWS7TX98Y0ONs/EpHf5hXGob+y00MwcF2SRYhAU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (223, 249, N'f2mI2BLmX9Ho9IuSb56MO09BF4KX+7uAzs+xSa9+Pr8=', N'+kB0nyMzg9Sx/V/yqvEH7gj7rjPirReEisX+mFnNawk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (224, 250, N'1e7cdushfxTcBYU9S8TSa3qZH95c83lPWD0IidgmIWU=', N'kR1g7B5Pj6IpqZHMaOrSko7utGmDv+IKxjmVybPd0+I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (225, 251, N'EwjDJdmWkW+0umGQvDBy9BF3aVUgS+i5qVHnTgUkVlk=', N'PaG6LLvvoXHc9OJay7pxKJh2bXQxWK2OURb8K8eTzTs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (226, 252, N'lSHrCuXm6GQUgHXwNDKnyMSR6tqxq1Gr2ncYHQGp5YM=', N'iTZpDqtQZpULi9jDAQA8CSQlI2jm5NybuSyP6JBFJ9I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (227, 253, N'oAUQ6tqf5a/gJtz4bNW9t2IPCO1+vOcszui9p2C21Kk=', N'HPzzwvPfyRqBZWe/A23XvYr4+hdIkKqCvJCX6KYE9KA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (228, 254, N'EBlOeZAocn1lqwoUN/T9mrIc63IvTvitV7YHeBnOZMU=', N'VMu3wj2eLtzt87xR9Az4jwjfHuBBSEk+xHj3MPAoGP8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (229, 255, N'6P9yI0m72gVqF+FUzv4XOJ5pkdffhC/KFeZIZ5slyw4=', N'5Xec0TGzfG5NreNOz4XJ3yat3LwkJIvcW0A0Y6ZT6Oo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (230, 256, N'mP1JNHDBaAhYNJp2hSTmbbjBTMeyKSrmXLf0G0Y+b3M=', N'/0FyWAWaielOJ4FweY1S4in0kgtXanQq8vSAzeB5bYQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (231, 257, N'rqmesUDDiPtk5rcwNK4WkEt/iiG2Zv7QJx9wWqvJm+o=', N'BDOidaMnjr/XAvF+QjeMwkD7an8+ffMu1XLEMWarmlw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (232, 258, N'QDlRTlzpjOJnH0Ic7N8JTOcL6nqF5q+23wd3KA7j2Cc=', N'VFQHyuCmvHzOEXm/85qHJjDYFPyoYWeC0A8LXLnkxHU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (233, 259, N'92+3++gaiOERzV89D9VC27rlDFNXBoUljB9nkxbgxsI=', N'HJ5gR9sHnBqWbeYi3lrW1/xfYlPV8O/C8G3Rz0pDDpI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (234, 260, N'rJCG0Zi3Eoddy2lmLaQJEGZ2wt6OuEs9rvh81McLAk8=', N'MNOpOLMSMSayPYIRMa2uRyeROpOKihEqtc9m5NaXWr0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (235, 261, N'lYnmXNRSNNRVrOgB1vSGTx8dXf80wlalvCS68slO0NU=', N'HdZE5ktphAQRiuOdQpb2F1zY0LKGR5XH5RfD9L69F6Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (236, 262, N'E8TKhD2snhjDLR4dUoxCBQRevWxNGXBuQKRkLX1HObk=', N'fYSImZtUmkfnpO2yaVD/FieH2Eo5J5XyYiTTSdEmci8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (237, 263, N'2jlFnC5dbjJN5jI6+kuxR2wQBs+9+5seij7y06mqtCg=', N'y0NlZZ5T7BLQrgK5cxp+Ly0/U4lyHgPK83IfuVmPmtc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (238, 264, N'2s9gyNINbdfsw1+KCW4qfvI8kKU4Xg4et3JXJzwN90Q=', N'gDw4RjE0BnECwaDA8aNUk8dRgXv+6GxY9rl8o1UbGTg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (239, 265, N'QmKl07X+yHRnqeLpHveRlISqFDPw28TNouCt0p46mZ8=', N'anO2Gn/DKxWBkYIW1kDfQNoDtkj2T7Hx9LQaYspIubw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (240, 266, N'nb6KKR8ejKKa69lS3NjCJ9Hfw4t/TNUiAmaP04gO878=', N'bgqvx+0BG3yDWbyqH01RMtZV0uWhCvDgdb6IpnyKP7c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (241, 267, N'RCwebEMxA2N9m04CEn5VnwmU1NBEPy590YXenKX2o4Y=', N'xdFLtICw+2pYE7/kHiwu+9ZcT2YptZ+YIZ/HxSvjHoE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (242, 268, N'1XFGLr444qVhCebfJYW6QKxnqiDu4KbYMyOnq0UCqEs=', N'6TyLJnWeKLfQnqIHS90zocMwhI/Nf4y/Sm1xICdNCSc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (243, 269, N'bKtVNvCkSj1ZFw/9SyIGQUo2CfC5hjuc78ssviWTCXI=', N'pJ7VK4O/KPFKFM+IE888lphY7ZRI5c5Aej7/e13KY8E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (244, 270, N'ML8ZXGehcJssaOkPjMtKR8n4vXvKye4jzsdqLx65p+0=', N'4fx9drfwbHHYspc3sBCJjWxxGMXg3rBAhtMd8U/9fI8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (245, 271, N'DuICYED1iS9/fZ9WbSvjd5urOAYK8AUAJpD3Jp6DEUs=', N'sHqTqvP+auuLuVUZ78aXBjgx8ZSjEz4qrJ9GQ0hejWU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (246, 272, N'49MgAz7HK3+0Cc0i8WNY/2Gec6TS0TctkUjeWvv8fO8=', N'OLTOxQymE/F6crVxrlLym8LWHqBJKObN8kdushif0kY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (247, 273, N'rIAJuxZxGW6Abqo/FzXbtcBs2vbVe8Uhp+UbCO89eGM=', N'+CXc1KWkJNL76DVIezKI2wNKamBYKbcpAedGYJM4nS8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (248, 274, N's8Bqg/QmQ9B7efdVWPCk9r2ed2lctvxXg+0oHe+sXTc=', N'sJd9d1kAAcUdvnf2oOjxQKP0tXyeJM/Ib/cWKMOjmug=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (249, 275, N'gnI9YraXC+sLw9Ih8Tem2Rlv0ttU7xlswX+b1BUY6iY=', N'RjVpKhbPqD8KwgxmoM8m/jbSTvjXa+67OZfvMn1kWfk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (250, 276, N'qZOEMaVJ7rHMm9Be5lJJlVyyPQIfkZJc53SbQ/KjUGU=', N'AhDwJvSfUr+XYebhLn08YfjHlNI9+BRL9ezIsXNUhtw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (251, 277, N'RRFEvvNz+fv/Eld399GmYqmMFAZ7QFP1AQM7KH3zHS8=', N'qy39+mEe3njnQpPBEgyqidqsh4OGqHE3pOmOHYnRNow=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (252, 278, N'Z/4KLBFOdl72a9AEsFq5xPTkKcS8rUuLtO0XF65+1zc=', N'OtLREiK+RIWlTH/zo7oIfbfC3/kiEK9s3VdAmVOk8XI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (253, 279, N'VMz6DQMfomvX+hoJ8ljJeoVi4VWYQ0Bsk5zLdTiFeNI=', N'vpW4XyItqmQktdEmye448tjda4P+4oM8uWivJuz3H7M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (254, 280, N'sUm9M4qsJCnJ9iPNEv+Uvnw/fRqr2sqkRQZZiOoD7No=', N'nAx4y5K2pwI+TRDbGYEtEkT+kLSHfuarqWUvFA2mfvo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (255, 281, N'obGAJIku+k+Jr0lGGi8P2wMLOXbGVtTysi4EMVV6Yas=', N'TIkeXA/Zl1Qpx7Up2WyCeUofSJ0uN0/tx8BYZoCXK30=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (256, 282, N'tSGGU7oc8lfR4ukbVfEiHnhUMBprZxWgyE5He4gMWgU=', N'NvXCeqrjXt1+W44x6A9h9i9dDLl+l91tvLlVOnVzu4M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (257, 283, N'MM1pkaiOcZdCoHR79NXHKZsZ45cownKwviDV7Gepl0o=', N'sOyzjryvts5lweTOJ/ypyiqJYoKgCjcItQXm5+9RYvM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (258, 284, N'zOaqxJyE9qQbUpBZRNDWO5qFdzp3xZ9gfKPG82Hbd2A=', N'P2J19m7mz6xEI3NYNW2uTst38rqDW284xa86wSENaF8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (259, 285, N'Vp/LiiU0gpef1ghMmi5FyKs5gg1YoPR5ypRuyI/s/2U=', N'lKDMaqfDlBmHFm7W5+cn+Fkd75CpYdWb5iuVltjYKt4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (260, 286, N'xzUfopXOu5I8LxAxCPwOIVp4um094Wk7eHLeSjnoBaA=', N'Ov4rOebkuIiAiYY9wBCxQBOSISE7q5t7HcMkiCk4kOY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (261, 287, N'S8ctFIxr0g9cPdIpWxgDWRjNGo1NvA1HlWiiET/E42I=', N'ElkVkIB/03+N3b4ubVCItEyfUUMNNn7zERZzMRF2jyM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (262, 288, N'zOnDUULWMyopR88TZFksCrlAbX/3K9UO9Ju4ejE740w=', N'CplsSPdS1lnSPcXrkVIdEt5ginUCsz4z8kRG1onvqOY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (263, 289, N'my1Rhk1UQutq3Z8jNsoeL077IaLytarVSW+UBIILIUE=', N'9+fhlg8M+Y6cnBsvScMNUThB10g3127u7ktjBFKeOfQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (264, 290, N'dFgrlAk5fqcOhynRH+bYmyw39lX6TxQ+EUWOSgX0VNg=', N'BND+YQF73iqEWau55sLYJM0kBSjWBoYDC2NctP/jhtE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (265, 291, N'K0Xl7ILbTCsD1GA9TWYJB4wnn/Qj1Ii+T513GYwEhgc=', N'GDvJH9i146G80fHHZ8UeoMe50REiSinIx4kcbrG+0yE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (266, 292, N'NY6WgpXAhT9Ax7jbj3hbZfWvWIP54HzDIOj7p8x4LoA=', N'6BqcCk9SsSvwumEQ9NJnTUkMf20NBA5ygnFJ7e8QAwM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (267, 293, N'gV1+mmSHmY9nqvzK00mCS5P1wStt3MD7VexM/KySxj8=', N'ugd9Cuxtm7/MaJMEOgc4q80FzUIHMAOpF8sIlCUXG6M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (268, 294, N'/bwFNu6Kknl1Y20sKWHleAEdY/rBhQlCizy05j13vUY=', N'dwFEBTRGq3nVZzXotQgjTTy9kjGzlaG4IjOk2nDhHuM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (269, 295, N'sfO8gxQiGYbW+7uyXxKMU9bgNZpftin+zm1Lg/gPv8k=', N'gC/ccFZLoyszLKEdYOr8mb9TiGRxkmEY/q7N5LmYibA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (270, 296, N'zFzzghWhf6UinbDGxOIcVFLvZBTeRsfnuCrWNO2fVeA=', N'zlt44PsVyo0AsSCUPcoKRcKC6JEJiYayAaDDL9l0CiE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (271, 297, N'K5tbq6Am8K0dljD4dAw8z2phnGUxRwEpcIDdNqrJzQM=', N'rFAxxBorEeUWOIZANjz/RinKw0UQZzLziScRhdww84I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (272, 298, N'I/TFLq5A5tr9XqWxJAroSAmRfkEW2cMfWCCzkCvhLRU=', N'I5JVRLPVAsyYOTsnBEsy2lSl11FclESWrgzY5QlvbE0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (273, 299, N'Y3MznvBICHnG/QlfYJRp5aeFfGbyz0KLCwxC6z0tfpo=', N'2DvRW+a2r5vOUljO58qTiG+ieOvRSnwa7p0zybNowAs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (274, 300, N'kudkhnAsoMsNXnxMfVDHD9ObmrmDHt1iHMoQca20AMo=', N'ObW2XlHrG0RQjcBCJ20X3bmhV+CzKCrLCN7Dp3nvIis=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (275, 301, N'cRTyqcUHBBfHXiQ7S4qawa8PU2CZ1OnzQ/DbAuoviiA=', N'zKq8l76gr3zdzt6cMs7/+WVIf/ahhXVbd+917Hrcn64=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (276, 302, N'Cv0BXHw62iinKv6VeZ5aV5yEG9EbX53BYirdOGCQFN4=', N'hXo9cSiyT0l7zKZBIP9lyi5C3gsOENHKMQLtoGne9nU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (277, 303, N'6tHaaKtncgnqGEizRFxeC5+DyYSWb12JaHLX5QTPdLg=', N'sm+rGcNQZPYgi1k/I0bfUlqJk47SPZ/52bpItQeMOCk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (278, 304, N'KTrs+Lc6PNqCRTJ7/GjSO+2/RPezLhe5QUyTOtymabc=', N'eoSME+JyCc+JVpMPVwqdmnMEiMdSjDdXP5B8u1NWVpE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (279, 305, N'N4hnvYeT51QAMPC/PJsuze4vnv0csjvxvaXRGBInANI=', N'kCdkoRtNG69gPGxO0L903k3wVLYwD+0JIYQJsLiajoo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (280, 306, N'ZmMFcUIAY/Llrfa5dh6DLn1UW8Ur4u5/iY5xsCquBHA=', N'I/fs7FktsL+sSDvscDYBKAXKx6V8AeD6xCLr8CVAgRs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (281, 307, N'p20uXYzXSEws2F43ce7nyY11jSOZOQQTUa2rR5bo+NI=', N'8Gn/R/4WTgB0pwuz1FFZ2N20AiSlob1GDIc+l1L3hww=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (282, 308, N'j5o9bOElNLZU1xLzwrXibbubpJThVGUnQzA0VofvRws=', N'5qCx8k89IjOjQ/cakJH+zFMy6HLlzzFJJxVLcc34oUU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (283, 309, N'mx1PB7304J0/EKRxTkMjHEZ5CAFm7sVIzdkvRX2rQHQ=', N'nnxJxwlgvjuC0IRzXp8EFgXVg7PASzpHN+pz6WK7yEQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (284, 310, N'AmTRNgwyDrRIACH+dLlDZBxZJGODE1OscW9v6WMoWxE=', N'qtzp3xE1p1EoRUvCe1kjxZ6Ugg/TO+wgwcbu2rgWEcw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (285, 311, N'JKsCCxeD50nKYfctIuDcBdsWTsDOVCYVY4EAlyJf5Bs=', N'i9f1PncC6FI/B5UBbpqIXP2c/h3lTf9Q4U2bGLfr+No=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (286, 312, N'ju1kc4himnZTqvVREi9d/M3Ey24qvLoMycHhECXWxOM=', N'wdj+Wi+Wz1PkJmjKaXiv/Ae35BYsZ7ZEy16yB5TqKtE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (287, 313, N'Q7tctKf4cDayVnLnqF3n43Nh79261WHEuc2/jddiuco=', N'odz4G3hIul9NR4O6KgP40QNOGCjOlrzMHsmAfXmnvyE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (288, 314, N'e/K+Dtc+x/X17Kt1SEz99pAIivj/yQ4/btudN5GZuI0=', N'Hclx8PYXNgPdTpXENr5A4T2mfo+7Nn+fmc7B8K0VEUE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (289, 315, N'x7b/VcPJJ0/NONaLHygFycbSfBeFskSm141/GUn2lsE=', N'Pxuo1xw1th/CQO0Ojig9Ez+v6yuSikROALwrTY+o0DQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (290, 316, N'nKfqfHFhJJoRwLYbqd5nf/9u9JmGk/n1xBIGFazymj8=', N'DnSbp0m2yBjr8S2PncG35phUYaMGse2HdxQp0S4fEBM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (291, 317, N'oGUDxY92BikDX//2m4j+QHWwSeXLgrupqtNgS8oCWcY=', N'RforsrwR2iiZ11KXfCiHKxWlXWxwTfPCYesAyyaTMeE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (292, 318, N'LL+v1qAYW8P0OSerdqhZy5TkjGLG8Fz8ddmeX1nFe94=', N'WPowhMeWamkgbV3T/Q3kfPNGZfhu4I2qN2NEsQ281Og=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (293, 319, N'LED/8pUvy1yao83oWOX7VkkSslUMbU1m0To0lAYZgJE=', N'FQeCsVhJnfFw6SJdUJ5h24gjdjB0e5tEPkeO+3gf0Ls=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (294, 320, N'RLEF823QYGqQi19zeWiZj0Jb32KNm3CyH3m7bOECmfw=', N'NuL2II1+kaJOpXWSUEwFhRlr3YBA76vcFsSwGm9tWuk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (295, 321, N'DFOGthjRmH2mGuYG5mVcKaXpZlHU6at46z8kA6S22GI=', N'YxaEafrOMHeplYTPsEJoPbx8zmDRp7fnBR6c3Pzhx4Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (296, 322, N'z1xazQf+rsyCTJ1Me6mUx9OoEMKkIIqto9C94xlRqu4=', N'eldDy2WtRqRHyzAP53sRTpCCN0vwxbcPRa6q0zmCeeA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (297, 323, N'BPeOfvI91c12jnCevjqOIXaH8O0BdP5HN+m4fH98874=', N'QdLIyk+zD9AeZQ0S9L8gienNvePuARRE7mwWM9kdf4E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (298, 324, N'8y1ORfpynMQsc9dOz/arlUhDOy6rtYj76asz+0uoZzo=', N'bx3H+01hvY7Zv6Krq5lcNn6ycqbKWmkuDfXFcxzVYgc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (299, 325, N'Htt+/WS7eOkYXW5riQiX+wa2V5nS/GVwXP4dVkXYVAI=', N'LmbZXanqGqRARtt1oa5LECi2/KY+iQBipq1f9ZTDDX4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (300, 326, N'dSmqT5xOqNAo8AhVRTONWiKuBlioaqOXJt+lc5EREW8=', N'7MbQuSfdgPdvFvgpOkOAd9jtK2HbdFhiA0i+EtQEbdg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (301, 327, N'05At5IfGAWQivBF+BcQXZEmc29VS3ywj27+sHkpGjgw=', N'rZyPgfguDIbD1ztONuLWgHed2/sHowFqtLfREMitlt4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (302, 328, N'kq5mbWMfuEszEmKjD/wXRD4F0r5QxTaUSe29f3JKn8Q=', N'k9gHZ8U6hUm9rhAZBZuMd/U2Jdj+IMncL+7/7NEP69k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (303, 329, N'bzDC2quP9gh+TAqTfmW519Aqh+se303JBHb7rvrhEN0=', N'xszbBSC2nK6VhF/8mj5JkJ38tBRJCITl9Pu5SqoyDZE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (304, 330, N'VrZ5CfGLuuFDdbei+amEhfaJPtiulzIb6oTS6PD/kBA=', N'l1B7YdHy7vOG0PS9iN74c0IVd6hwb2/4m0iTy0FjJFg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (305, 331, N'FMiBRg+/O/GqRtiiMRUmkXobhVmKGzfKhBA0SUpG2rM=', N'09Xf22FcN89pkuD/+143U2PCyCRSbE8t1gtM5lyJ9qs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (306, 332, N'Dxp1iXoZ7D1Kd8XMUyoCS20SXE4EtjCR1n6sxaTGpqs=', N'ejQBhODZRA9F2zo2ND3QeSfI4bNo62Ag3vRmJ6NjoQQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (307, 333, N'd0bpekNGE6U9uc19WZtnIdpTQsdwBPlfo+xbZJRQ+U8=', N'kbw0xMdXtQ2sI8MFyugD5t/bB5OK6w0WYOlxm2zBCvY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (308, 334, N'1LSec+tD8U/7/oMXzy+/cwho7Afp1HlXx9ZlD/VjvFw=', N'QK2aDFrH4Eu9YDeld1FowIOkvb0bJD8SKebFsfSg86M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (309, 335, N'sE65DAlHsKuMy8YVXZlLwoLlub9z38P5NwIysn3yIw8=', N'PRIau3WN3Xx3NVOxVeqjdxOsi6Ko949frDJgLjVvAHQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (310, 336, N'/heH4xOm0j1m8BDJo/K+zpi8FFSCRYKssrWcMRYgw0I=', N'IiTQfR/efPj/RIhz29jD/3EYQqJffo9lWJq7DPTuZ4Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (311, 337, N'KuqLDR66x4XBF1ywPsrgNI8Kf25Xkht3XEvHwfO2ppQ=', N'9TT8UwscnQJGyHG8KnAlntzsnmp2hDfhlfa4uizOV/c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (312, 338, N'0zUwqw2a6Z2gKZkhyjxD4Wfh5zI5p3dBGlLMf1xmpBY=', N'r7VAttYb/UvERSgEidVDGGUE5MiaPZsSsZ0mNEE6GE8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (313, 339, N'0xxSk6VCfeHShCfDuSMpCawpkOHhYTkQkgX0xSDtUvk=', N'sPRVYjU/6EO0qOKV0FDdBrhYgYBm153P55Cz5kTNNFw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (314, 340, N'PyKz7cDIHnKtwAJGnTb+fzX6vnmrf49doCEHeQT7XdU=', N'nOHQXwNqdDgKep7XR6CC0dleZEO6Uyvd951vJi1sDj4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (315, 341, N'A61URvZmoWfZJ+Jv1QTx7W3lUq9JT+Pz2Vlc4mGoeJQ=', N'uKYCKBZRdGJ1Hfu38pmSOeSYsxkF2aZjFeO/bPIa64k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (316, 342, N'uW74GgnRHh3GEFShjjqW7gStPObx4uGoIBgpdxuuA4Y=', N'Sn/P0mCzLfFLi7+noyuLf05mrhliArLHF29O2AVDQ6w=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (317, 343, N'NMTuMlDSGYOOSbZ8O/3CFzOS+H4Mbhc/29SwXv4bpGY=', N'0cm5ISuePCpBPHHJgCg3eNQpgx4Vhh5o8FHhAL6/Yi4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (318, 344, N'YQAsi+Fd0ceQ7E+qJz/lJ21ztSyY0RUJTyKY7SyhcHY=', N'dIpHeTqHl0SFWeCn14O0w0zUGRqpEMsgcBmDy5Y33Ts=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (319, 345, N'XQJJR2GqU/UUKhZOnztH5qIdX+RVF06Zl25AE4qpa4I=', N'eadOCDQTrody/rmrEHv/Y0/bohaxnJGm0UK/yZIyOoI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (320, 346, N'tfKz9dqP2T8kEuTrrSwGrK+IyUBlqNKfg23ptKMiiO8=', N'671/Z3l50+3LjnpYRhAtqImdxAwX+qCTMsTLu03Juk4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (321, 347, N'HMMx1SQ1FcgewHFFtRfoZQU6ACSkL9ZV6y63x74N6vw=', N'a/Tc4Z3mUPXAUATH7NKNnW2Msc48s4FYmC5v16Ix2kI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (322, 348, N'Az/q7FyFrZw+ukeevkntHKaZ5HNjy+TYIclMJeyh6KQ=', N'YP5RsEKns6/thEIs+0VXO3DsznyG9yRjYmIKtJ0UGdg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (323, 349, N'FLlgxgL+bCij/mO9dcCqA5QJEZSdZOmYat3ogsCL/h8=', N'0Hkt7te/FfghT42dmF630hKhYewZdbKtZHqL79JEGTY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (324, 350, N'pVBpAd5RBvVv1HUPZa+2diGPX3oXIsEmqT/JYlJK+uY=', N'pDG1Is+fjDQT5k3W1NTnEaFOZIJktOCgCpgFLJnf3ak=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (325, 351, N'WScSPXHtvFEHx8KuKlK1aYmQHoAWNfMtlFFhw1dFG44=', N'IwnkvesKG/vKtiem43DJ8nUA34u09yT57WD3NaiLfYA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (326, 352, N'DszHDk5EsiRXzYIS2gfOkMFvKlJR0mFN/9MCfWir27Q=', N'fD1LjQMLic+XJ03esos6cDed0l3Z8lxUmjIdSH2+PHA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (327, 353, N'K4XG5QgbLryI5WNAndnSrfYUL/CFr0kck1MLKbMX28Q=', N'/gnNfmcxFLzkXyRMhp35QnMyk8IPd8VhevcDTRVWAxM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (328, 354, N'CS929Ui7clFuH4AZbS07lCz1L/nuPNWOms6PmuTKGq8=', N'qBUKgtDAwO0tHXdlgM2iF8CTlxLpyWCiZEK0R4rwHNs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (329, 355, N'KrY0t/PKJEScpRwqsvB3W6+c8paveTR304zDJApIa8M=', N'ES5BO5ndWJm8SyBZG3PrZLSIXFLTYvDOUJkaFLuc5EE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (330, 356, N'QqVA1QYlN5dtAd+pgZK3wyHJFJJGgojVq48NPG5TPK4=', N'yBrsd76i98JG9Mkm2q6GGNr4MdRHh6HxnDpI2FzM10I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (331, 357, N'j3N3JL9/YlyKNTrw1MIu2WF8/Ie4VKH4WDJgvRXTY4w=', N'sOhMYe63Fma0veH1XBmSY5eYrZd/H0XOKSLQo+NQJSE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (332, 358, N'5A4tPTV1AMBDrVhbhI7Vw/asNBIbP4JHYo/KsLYUxl0=', N'UMQgP1W48ShfvZzKze9pQL+J5+B5KR2n+BS2xDxuRAQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (333, 359, N'Jk2DlPxydeXsQi+YSVQKxaMnBTBKOaHYrm2VK10ew+w=', N'hfTRimZgEdZLWVMlaXYbztBbLfuCLzDeG6tCxDP6B7U=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (334, 360, N'3rPkFBDlqybtPu+qnor0C9Aff45zPDDAhE+m/nzCO5o=', N'IDWfqPiien3PFHqFvGrNtrSu8Lb2S428DKFHIRX3K4I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (335, 361, N'ibq1tGgsgWgsoHcxh5OtmDuF59a/I8gXTq+b3k0qe8E=', N'qybkX4pkoZI7kpUSNg8StI1uOtIdVOZP8O7Qtgzj3wE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (336, 362, N'1TuyPNGcSpnREEe7PEfLMny3JOg/IhJjhHO6zxLsly0=', N'FdTs0/OH4AP2mwubuhBkefTjgnQ/ymS1o6WnYnLtIWk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (337, 363, N'ORLBI0Zz8/xXvkDlecYRAuq2rNjC6y/T1HLREK0U574=', N'R1NH7mWZbXNiLUTEqifm4og2RTlRqgCgzPTlSdmto+8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (338, 364, N'5cclUBY/P/IzvCB40w9wZE3p8TbEEjREJujSqLmfkNY=', N'sxXJlwd/bu03vE1LGbBNd2auF/PBT2tx2sklGuFGtps=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (339, 365, N't7/+HrpZyD1wzLpMEQ3PvT9ECK6kYsNUg5DnT8wfv6k=', N'ylWXyTDcWkwg0WvfR3Z+9GiLC3JnW1MxDYKvb9XAtiU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (340, 366, N'6aLUCw1MVldi1LuGQ07JQ1v/G6xG46ZYSfdjS5sGvF0=', N'YpHyv9Hk/9TbaQJi0rjW7ddP6WU9Ubp8IUb+L8cqXik=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (341, 367, N'9SCWlceOPcviwG/Mj/kNqOzqj5n2//hHycWsKiCVIxg=', N'bfhMPO2C0W93BKJi/4ifvU7uGA9wGGr5/RY+NygK44Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (342, 368, N'RfdK26skh4EcJHslGaGTteiLHg8h0ReURxH5ukW92dw=', N'1KQtLhsYH8GCbe//OdCBtlPJa2WQGVpesLaPjsI5SYo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (343, 369, N'4Oxsk+oWsxsJ16HDuAh86cI4Id9XwgaWh1WZb5hovZU=', N'3E5FO8pNV+YGr07chcW5M2tAVm5AilAzD6gJG0db1lo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (344, 370, N'C0MOLrpN5jTq7QzW5wX94S7IWEATtu0wY5M0spb7VhE=', N'je/Llq1++RqRjmkmIzbR2x0R0T+l+NsPgfxU2/k2ThM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (345, 371, N'0bNV5Zo7BABgDl4E20xKgNO9U4rXhBWBErLbXLAI0/8=', N'KBe384nY0i/rUFiMRx3JR/XeZxZR0rZKQ4EwIYlRMu0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (346, 372, N'5n8KJbfJK//uMfTJf/76dYxum1R+yY93HjhsFPQGqok=', N'0QChn3EPxYfZwu2iItutaikP2dDJIKfLmNZ6wuSGD+I=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (347, 373, N'wZ7Ah83sLFJgTWQ2NfkyKKs/1VXhVQ2KR7w5RiD3wLU=', N'd5mlWyjyUAq11gWahG2bfPrB20ZAsLkcloDP3yjpYwM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (348, 374, N'ps8sSmggRHpteziVjZxKdjNNs6M+m+WbqkNG2lANip8=', N'bOLvtZEdj2g3K3G/a5k6PEDPtKcytoHlChzOZobVvU8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (349, 375, N'cY3r62bJTst57nuxvgHfCySKdj6zvrrYQD5b0SlhlwE=', N'Xa5+nx3ro9boF2UizqPqCh7zxncr4P/7TQhPPGCmOF0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (350, 376, N't1ZTL+1MDZrPffRIcsD2KhjnViQBA07A8+yRgUVjeSQ=', N'FB3hpO9ilNtSxpWRN7iKIPVj2UgqwKH2onN8xAtIRxU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (351, 377, N'1qPLG9wA99pEjMceQwA/cGfbypZgUMkeqGSkSJ/xbUQ=', N'saNbGZDreIJtS226tU0jdYcCuMp0zLJTd4xqfGpsMYM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (352, 378, N'CdhwW4s4QIFk1kJvHQjLkfaquZ0XxaRpsKL2b3mgZRc=', N'B2/Da09TwjqYdwfN2E+7uVOf5//+q0grtQJ4Mv+37Uc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (353, 379, N'LxvH4adMOfy95bsLRTeJDEbXilxkq7noYsE9AwCYqNU=', N'RNbyznms5IDOr5kOXOeebZ34wRIuSLyM6ilVBa61K8Q=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (354, 380, N'3B9hAQCZ2/YOJOdaWFhX/vPtONRA3DlfHwVRP1331Tk=', N'UgXc8jQDtW/5OdF6O3+HO0SSVWyb/LAbAYXFm3BN8qA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (355, 381, N'n1GYI7ZitCZU1uVWVdKrXkV/ikY/AiajW/gSQUFm+7E=', N'rZWDJY4K8/02IbvG4mgv08M39FCJtVK7o/mp7f2RY8M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (356, 382, N'Y+I04lMPSZIkHAp5elurDOZf97XCkzicK4Mn5T1LYHo=', N'P0oMFtOO4uAoPQAu21f1zLtEOphevtfHcJr84ADed34=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (357, 383, N'hkGp1GamZZJYwXJCx5bs/np2FOp8FJXfsBmJI2v327g=', N'K4eIO5WMK223b80sTK37CMwOqLYuNKBRJT9WKlkxjI8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (358, 384, N'b53hOb4P1B8XVGMcJy0NrbaHbT5EfzJykpwqYFdoz6I=', N'0SOoqit1SQvFPptOlE7mSLQQeE5+T9bNw9BMdfaRU7A=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (359, 385, N'StvIaQY7o7S1H1E1oKl3G3C5aQLzRL/ZvyMs5x7Xs1Y=', N'ewF5SEzwnXzdI4vFbVaDv9No8Tmp2lEMaJhdLEc5TvA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (360, 386, N'+3YY5AvvdMv6rnm+kgaMgY6xQgqPS3309P8uNOpGsIg=', N'8qF9lr5nOgGoU7ipa7LfNP/j3h3Owk172bHk21R/760=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (361, 387, N'i/Gt69Iocou+xDPqs6ivQfbldKrdKDYUoK63wNpFFK4=', N'12ttiqJA0ny8Mp8N/+E3kX9PQbBZ+l9eDVkTxVy6Rtg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (362, 388, N'yPftgyn8RYiBAA5jeL4JV+/aJYJTUId0gfEVsIihkU4=', N'IerFa4L16idQotHALGa13hjloCanCkBuDbjKPUV4eEI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (363, 389, N'itSuGdoetX600pupK2ZLHdgBhb33UydIKPW5ef/uRac=', N'j+qGyLR0AJiqyrKzVkWYnDHfxGAKzG72oQlg7h1hvQA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (364, 390, N'klfmhqEz4CXlSY8DmKZ9Lk0iU4T/u+k3YGX4Q5M/s50=', N'7Llsj5FzRdByWwxZUxvtuTathg7Vpwn/qaBTTZAddPM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (365, 391, N'i4f5k613pmFHdWPOlF7+CVL+6GlXRZkvZkgdHjb4/Zo=', N'CSIO0kS8YETeVPTr4w4S+t79UKN/3cr9XUhJLsT7pbs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (366, 392, N'3kJ1MCW7RLBuB3KIwf7zu3c1Juzkrj3xY+sndZfoGjU=', N'EQnmT6hdOuiavc0XO12Q7jV++cRuq+rIh1FWeJ4RmhE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (367, 393, N'bJiIPUsnExIQVNDfBgQhGu50Zkp8gqveureaK/xrtQI=', N'4cqRTWV5LqfMDXR940wkXeq3nSM6HCUy9ZFUbzjQA/k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (368, 394, N'lffYv5oeBe8DEnGpCHS+9Tb71LsFKtWtfv9zHbRDHnI=', N'IIsrEwS7WIOIdR+wrZ/N3kc6U7SmGtYli0qG2M6+QcM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (369, 395, N'cg0wQHq3YkWO1PiYWRHSTvQyR7TB3MedmgiCrtufC74=', N'EaNhJmpyhrVHeVT2DLZZBnNYXf6koZ6smJafPnzMfzk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (370, 396, N'KYR4OTFAAVXU69ugBPVzCXPE0Eazx8DUxGLB8xracKI=', N'RG66vHMXYC3eiwbP4FsyMqQf7RcB0QB4puzOCeaMBY8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (371, 397, N'geD3iD4qzvkIohZQPma5+dP9u1kC3gCCZlGT35ta0DQ=', N'uleCRmS4fjWOqHrfDCPghNNbg9s7UgCF3LTWfQ7SsXU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (372, 398, N'ZFvBsmeFDCn6Ln0d+pg9Lbcy41C+8hA9PNS8yTp+Y+I=', N'VJf0Zo/jfKdgGWNtv6qHTufc9Q45JkLgwmgkYxGITf4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (373, 399, N'rdyMuctkj8ZC9b7TrQA115nrgpe2b8Mei7dVQksf21Q=', N'TCyCvRHOFdQIRSVmzb+7LN/v5+TyPlqqCYQ2qVn9ym8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (374, 400, N'n6AXZQmwb47fpBgHeGZw7VusoNfcsfzrDaxZ9qZLjtk=', N'7Celg3pl2jFoisRxsEff+DE7w8h1O+6UaW5b6+9/3yM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (375, 401, N'jaGPIB0VrEHqP+VDKb1ZDFi2i75hRKxtG+kMsolveg0=', N'ctZ+NkqvdwPYIxYTp3306EUOA1VPruSksawWZ+rjQHc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (376, 402, N'Ic1Q6Brm3srPFrjBCp73Itjm9LP9JlIf+FM7xoBwdeM=', N'nfrbZ0i9clW4L6o3y5ya/BdU1B3TVESP6H/2bV4AmQU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (377, 403, N'OVgRdSBolyvupXX16J+RZ+sGDzEyvorJE585Cet2w0s=', N'Nb+xe5HlK3HSItdnbH4ISlL4pWWJ0IAocYowpMobrm8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (378, 404, N'wmjkz4hSqDSXii/VFk0VaXhLtSECJghAJkScTlG/WzA=', N'mLA9r6Jt8xbPWp16Ou9swtVqoh6m6+iwqyhXO23ehGU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (379, 405, N'gcDgHb1JsShbvfy7aomePVGbyfRMVlOib1lgeznGEbA=', N'HbTK3FotnaGXxuBZ/BG5YhRrmNsRuiMXXcotwkhlLJ0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (380, 406, N'S7VWZKLZbyTx6AAyo8CukaSO+2ddkUVHpdg81PVIt4c=', N'fDHJ8D2HNC5/+og+GWPhNXhfbC24a6dwd2QYYn5GslQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (381, 407, N'XdGEZ8L4LEC/nDoYWrbpF3Ak8sgGHQpflg3f1u2RjMo=', N'LlIXXAPKsVqzB4lXrUOiG8kA3NPA0WCpZjRHcwExwJw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (382, 408, N'6bVZpgYz7qhROrdcRIASABYAior3fkvnl/dhK5PZa3A=', N'o61fVIHI+b88clh2Dj0BOJTq1TirI31fzzPxsAE9cTg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (383, 409, N'ZZ7JchfvR4nhB0DN7l1rtJjSxl0tKtWOQ5OKXj9bBVM=', N'a6yiRGs6cvbOxxPwusESwqA+L1AZUivq9B83Cwfmdo4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (384, 410, N'Cx93DYt+wgAY0fu2Iy4JWMgJzeHvWbgZjmb22rPTr/0=', N'7/I1/lLGEB0jFbLOQRMq4cxnOl+I2/SDLoANV5tVYC8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (385, 411, N'04CKKVaH0HomUanO0TUmM2ZGQJfdM6lG3WH5YOH4mEc=', N'tN8VzOy080ePstQnQxzp9145AvGLag42yazsAjFI3d4=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (386, 412, N'92FKj7u6bdxVn+oTCzY3pdX2I6M1KIbk0i5KY7JbIfg=', N'Ps39bvNOrUAgzHjL4sJIKP7fE2kb8Ex3nDfSjp0kjgo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (387, 413, N'qbA2x9Tvnf4qdSrALK135wE2cJIBiKJ+VHHR0MerV7I=', N'ZVnVK00M2BQTWBRCoHvrpmXXlUcXbn5mqioXSx+a6bE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (388, 414, N'ut/cEBdR7Lv2ugXaHF6zxhT1BqiRSWGAJt4QJRI0WEY=', N'lLJLWXvlbDYDQg4fD0tR0dCEtv672hMjdvZsRr1EH1E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (389, 415, N'27P+RI7XzZZBrmJhvKO/PuyAgmPyAiYuTEBcE+P2o1Q=', N'yNmm+QZwsjVGm1iNcrhOYLQN0PAEG0553aWDeimEd6s=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (390, 416, N'rjKdl1vGsPRrULy25ppBhFoOTVrhdw0jnKcbXJKrU+M=', N'VEqKGStLF6Bq7AnnGSeN0/I2JAxRuKS0T+eTvMKyunE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (391, 417, N'ss8GFH2L6koqqX6LpIHoK01mGiUisbTPyFHZCMjCovY=', N'bxVD4dl5Rxd+8YRMsvxSDcRyJvA4xzh+nSCxiQSfUFU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (392, 418, N'PSwVYIpbdEUhbyxn6Um7p0rQqOYxXZkmQSxx1Dqxen8=', N'TC7DYvBnmJSkYENFG81IvgvfsAmHkb+MQDLChgiJe3c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (393, 419, N'Sdm/EVALhvvqyRQzL8lqsqPyNgmCeJdX508WSjNSjhA=', N'Vz8j9jejrHBODVmUTKGzrRyhefUAMq99XdmUAjtQFSs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (394, 420, N'8uDiadZQkGxysYl0q7teAEKhkOzaeZwIjCupkFWZOOI=', N'LFAvtq3HyXVfWjoO2zZuCaBel2wfA8NxtP94rP5g2gE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (395, 421, N'NYAwrIKuR56NyEE61KG6WeSk0//9/WYs3rfXjsobawE=', N'V0J0p9+Re7/DDNOoDhtOOwfW/Jsn4ndsvegpA//2J5M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (396, 422, N'8bljBbWkvNn+5SLD7ybZC0rfq7dQTyAPBgsEafKmNTY=', N'tE0qqoegQuETRPlMAwX8lqYkkUNWkcSeLrXyyyjvcII=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (397, 423, N'V1tKF+fKhMU8Wd77c+g81i0iscLUlhzTY3tNzGYJgBg=', N'fbFJPPqvMNYRPkiwBydbtrqnQ+93kzPYu7Tli9/J5Bo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (398, 424, N'c6fbpmyPjO63YTTRiELJzJEuNkd/Zt+eT+FI6KyMJGo=', N'z9tWZ0y3TSAj38oh28j4CkpjvxphSyPbYpGqrwdPH+o=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (399, 425, N'jcc0hFqzXcruKmUU7lGgN/y/ybv9Ik9ClTYQAB/l3Xk=', N'jkfTw1WmO7BPFN+jT28X/qPQTqq9muA/fgr+Osfo3A8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (400, 426, N'IXITXqf1GAfFTHepeH6WzWnI6e8GUVV5eiqpjjyHrM0=', N'CjXgSpgqka4TFakZ/MKSuU30J7EqmvfYEP9YqWXjDk8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (401, 427, N'+0UJ9Z4ZGVg05djJWMMMkXOdUFnWwHFRpr3z6c8aT0U=', N'A6FG/6hVpe2CQilAGgosjb9yiXEQ+vF+qAU+MTcXMJM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (402, 428, N'eH5OrWRw7pwYRqDQft4cSutVyTGMjG23nZInJ0nXWMk=', N'xSXo2JRDD0o6rxF7RgoehrrKjmDNfPZti2QfPFYi46g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (403, 429, N'7Kg5HYxgM3F8Ftv1iqRDMdRpcbLTtj9xSoIs3BN92/8=', N'/J5pqpXTnn4AHncy2mb7PoSRqAfzcwxAiMjtXmLGOBs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (404, 430, N'GY0C0PvDA1uInZqui5QQch6H8hHxVzbdOMueg9SNYCo=', N'qv/YNkzRTGZIOpAW5ogegwjrr1T9rq7AJvb6dRij75g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (405, 431, N'2uFH/byjTRK1P6Dn58h8yBl0N0gy2LCME5iX5j28Sc8=', N'U4jhvAFJuwBNoPEp5ZXBpy9cc1OUmuodyCry/zF8quw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (406, 432, N'pU8vYWUr/NNE1RAKN0TOhu9jzckb9VOkDLZ60wwVvRs=', N'z6cGUNMkU0v+db7p886E+9FyT+InE0Xpn5VBCcm5Sqc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (407, 433, N'3pRaxwnLIDhQvVmNXyTC9r662aUCimRumrrjlz8C0Ec=', N'MOm1cx+VXG3KzU1v8+HgbCUFkc/cAOoNIeZASSS0iOI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (408, 434, N'brLKvQOPckN97FHd0lKpQDuxMncTF8pbIPhWgyLRzew=', N'wEPyFpISdku0aNRpIDptGDbvS2gCuKufLvOt9o4ll10=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (409, 435, N'thNkK1S2BuuLujcnaoPZGGPCBppsx81u5xW/SN9BnJ0=', N'36xqTi3z3/TZoE9uFU00dyWny8xd/aaWC7YIwJRwvVU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (410, 436, N's6Os36vMt6g3aMUAHgVE50jTbil6ctftmqsxkMPJdxg=', N'UyV6AHfwhiFL2578x37A6+JLv9GgGUslU+uqwl5UO54=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (411, 437, N'3gtN0vBU4IgtRsQUZ2K9v3avVqqLbvmr5ZFnO7QQt/A=', N'qyZpoCMk2GvFTKqx4c3+rsVlqe8ZKeXReUMvNpYRP4c=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (412, 438, N'Oj4s8kyyrMTCo7SMgFsxBveEBu0Pz1/fJpb5R9J0eH8=', N'oET13Xh/YGNFN04zH/S/KSTbtHjSNRhT1auIre6dpFY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (413, 439, N'+5mAHHLnQ/6k4KPSMTzvE0UV4c7bimj6wZtzKFlLj9k=', N'/FnkjxmhaoOGQw1bQ6y/QfWFqnmZpe8b2yaVo6ogsfo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (414, 440, N'f4owyXL2kytR9JHmGIN14f+bUSELZN/izMjcT3h5QJk=', N'shmZWmJa+oXxpL0QzlSem+zCUofmLU1Vq9EPDgMRckg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (415, 441, N'ZMdqpC/0HfDAqvXlVxeoMQUVaEVwdwror1KE6xd7gik=', N'G1vxdD17vhAnOUSHXO6LvEQMckgaolSKeS5ydFgUlwk=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (416, 442, N'8c+Cx2DqyX+dNVaGRB+jP6u4b8V0wRL8d/tuxC/nDn4=', N'eKh8hF8Gwi0WNM6beb/U3eK8fpxjc3mYsEUrZtQ7voA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (417, 443, N'8mTyCSAMSJTohQnsdk1ucF6BawUhXxnum3Thgq6y9RQ=', N'iTQcim4Y8V+++4mFLwY6A1H2ZVRSdll260O1+BirIdA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (418, 444, N'5SI0b99eoVqSWq+8xJeLPRef46AJOHT/6bFyRGi5AwM=', N'wpNZ7/waS9K6d3/RDGxAYJ4NKyqnz+Nur4+SCTpscAo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (419, 445, N'g8BvaW8PxbR+GbF0QYvQ9q6b+B4Th2m0KJcno76Zk48=', N'ErDLzBCS/MgajPwq9PVduRWV0bzylRycPRDwB51xhGo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (420, 446, N'K5T12Na/dUSBiKxNaOI40Ub7daIcPa1WuPS2F3nLSJo=', N'ptnAJNswMuRGrwPmOGfEhaTjauA7NnN4SWM9kSVpewc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (421, 447, N'6/DlpWGWHAWODWbTnzZbASw8GsJzsagi78wHyBxPCTA=', N'FIcqHPqPsMsurh5XtH0hblWj0h9mzNSmu7yk5dCrTdo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (422, 448, N'1jwz9b5RCQoumHEVQm+egRWyNbKT2Q8iuWssuPz8pHM=', N'f3TUnvju06q3cTUujI9dNn1ymUuHRMmvzihcB9XVJ5s=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (423, 449, N'XpdPKipGJbhkGPEpfZGfoYLVGo3azJAs+8wCo16ezl0=', N'4OeKbR7HTWi6ayfsPGx9g0R2aq4DeuABRilzp+x4KN0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (424, 450, N'lg9XelwX8W+/nWeDh+ab5DJiHopV1Mo9UJ1XIJUg1Hc=', N'Z3NFI67K9/rzH0bUFQWJFx9Oi49L1MFnDh50Bfq19N8=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (425, 451, N'W6A0q683WrQptVAa8DxFFCX/fXk5bqVS9Fn5/85CQEY=', N'QoScIP5I4249a2W+90Sue2fUiVdPBnXcpNi1KE7OyVM=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (426, 452, N'NU5H05wQimUyfkvf7fNmuimBK0KFmEkMEGHSr4f+zx0=', N'vWHfD9ANrxk9I2Vxh5TivQP8ovXef1Rmqg5GmAS/loE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (427, 453, N'GrSSa5EPbXauWZmqWxr0Lf8dg5fRFghq7d6DpCra83Y=', N'zv2tX/29WcaM8ay//rLx1+HZt8iAaUFIYk9Mlb/5uLA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (428, 454, N'vdqw6D8bOFA9JQHiF+rTELxTUT5y0Zp9LCjfHUFF6DI=', N'9PuwbviABEr3P//9vX2cs/ReQ4Tr/oE4lgDP7Qgq/lQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (429, 455, N'vBEWi3GqiN0o0ZIjlvax/agFFMhHg8uIS5ott9o6Zf0=', N'Jmw79flkTw5kirBOJ+aAsSfEK+NgU7NpxxNVM/yEcOY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (430, 456, N'rXck1Gj1Jxeb7p+c7jSUuVqrw3uwnRvosPDHqACQELA=', N'arbdT+kEjoRhe4cx9JXcDGmPKrwgJ1WYHYZKKmm7JoA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (431, 457, N'qSV2sMLZYpoV4rFuqOVkQMyas0vXPIO6VNAN7OujSEo=', N'ABCJcqQ7u8J0uOPR2XD5TpBdeChds9M9e/S6l/ofhQE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (432, 458, N'LJ3EsXnWBuhkwNecVrS0BiuFLR51QK0FZGgG/rMW/f0=', N'2yImlTJuu1EcDX+dHOQOVAM43QHRXJls+mLjS90xIGQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (433, 459, N'/F2Nh1VPL/4V8fg6DDnngFW1z+ZizVgJyqWcJeLjZOw=', N'+fvLFqS+t33wVJdnBt5bG3dKNriykJ82LNcj1s5MP9M=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (434, 460, N'eFYmSGJKg/EYdcGLIWbzNsv4u4JWYszjSLNI2uLVCU0=', N'C57zGXsqV//vka2YYT1Xx/QYdouE10H6RFKrfAKh+0w=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (435, 461, N'g3uSSN50n+MagqUN4+nE9hxtdSIQDrYneiVqk+Jnk+I=', N'K6zc0w/lYUNQgKXPaGTXs94FSXGfwJ77yQSZdNDtKu0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (436, 462, N'oaulwxRf5lvyE3fBpZjFISGUgfnH359hxxdCXWCC1/0=', N'uOvnxmALCLvIe9jj3+B26G/a2mV4uF2lF/8bMV6659g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (437, 463, N'tVp3BbRdMo4I+xT4PZIVrLsiAmVFL2V9s6ApRAVJgXg=', N'V7t69ObCh+dEHMMU13XoBBX638YxvUiHxXyx95zQxZw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (438, 464, N'Tpyb+G2H7K4552aLcAfQ0a7NUQfg+KOQqcmjoIS3oDk=', N'VLm0/HXKwQDvNpUPNuRiYIWzGIAAKm3mRYNCLBnO4Pw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (439, 465, N'ZHm/9lu6PtglXpH0Alao89pEiLl1NPAS0Vj9KsjvocI=', N'00vG4MojWz2fArNJlQt/Ypk3FswB9UdwCXyf1uWKnoI=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (440, 466, N'IJvRI9C32Pc9duKjiMtyVTgtyRwo04+HdmFGX2RpAwE=', N'HH+vKDqaloQwHdekbvN8GcHT2MgUpdooRfF1ZU/AM/k=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (441, 467, N'KTcOeev9zPeKQgImAY9Q9NS/EIy5DcXoHGP4nhnElRU=', N'qUFt9Ryo6dxnR0Q923m13GiJWODKe+Mgdv5FrD45qZc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (442, 468, N'm0dwvmboFO49X6xe23cjtseE3wjuK8HvdRh2+dlNN80=', N'G9nnd7SOwTKGQnaSr/JyTnUmKy7YQfOotQgvKs+AtOE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (443, 469, N'qo+zJhxSer99wG6qOvQwxmr9y1Talk2WGfK9dlbwxfY=', N'q00i50nq923L+3Z/GbOE+XqPjAlyq1wyt3/yLzTW0Dw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (444, 470, N'R/g3+ni9dHqNsWsuvFdp/gwv/jx9TZXDsEk0OebATU0=', N'BLeVt+DiQU1Rw3BhGWzR8Egn0/05VH4c8LlBMfZRdqw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (445, 471, N'+OO6tJi3nj7i2LOirb+ib4reGF82kLeauRLuhaB/gsk=', N'JV61aG+ec7SHi4FaZ17JjV64KZJpCEmtuuKrnOijNDo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (446, 472, N'7pIesaZJyVoavNDXRf+MGwgZXLF61JqcwXlz1RfMBVY=', N'ZJ99ajJY5+EoKqUUxzF0eGgPQXGZ9bvhVvgCFkLHjeo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (447, 473, N'fbSAbiLWdTdV+ko9v8AUq73Xfmf/odghBvRifWBJaO0=', N'4jSJbFoDBWOB+kYjbYr3DXU5fepMwFWgbU+7Q8Zk/+E=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (448, 474, N'y9KRQ+Fvlr2uECqOoESagvzGljZWmkCQAoWlOtvm6Ck=', N'wHEj4RAen/5otLgi0cdKLsoZgOw4yATeCIZ9xtYuggA=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (449, 475, N'LX3vY6M1LO2QKH/cHm1710s5BgKgp0BtgJQeFiMci14=', N'QmQEigs8zjSdwVxlQvXxyP9dqT+cAzcUPiYd9QupSQg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (450, 476, N'U1Bbx4xywRpM80+2TXz52q+CSvTe4H7LbhBdqoqvvvg=', N'2vmvZgBBbxcEyiwAZINnfOCz+Gmwprdm1RUZvj7zNw0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (451, 477, N'AXct8z9laBCUMAQQ3USC1fcrvTnXOiA8J7XeMJMlYBI=', N'9QxaPFnxbbOt0FoW5IIhoMqDIVlPVPT8g391fltGWZE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (452, 478, N'Y2wMWlLQJDbjAEyd1VFn4H12Qrq/gYZ1bROIoAwv8wo=', N'CmyndYcIzP8d3cwbqtJyUy2EasG6ackQBco44AmuRok=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (453, 479, N'tGdjoTL+HT+tGaMY4PNQXKqTRDZlp2zjKAsiQejgTHE=', N'0N63uwyG9ZbEe463DpenOngOGN6EJQMuV7KFmb+6wPc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (454, 480, N'dyj+b4v+DknHTAckypgwfXlgad8LQAxvYaPbPAKGiwc=', N'wLQjBR6Do2fMueGwFZ7x0PsMMSSUKlmLnB0dld2Rdik=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (455, 481, N'4wGIzDmFDObISv2qLofc0eEwXhI1/hBBIoep7aMkcr8=', N'lEYP7MadhNJPH0jRIiAsWYEtop41BbEO8rKQ4VHJGOs=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (456, 482, N'Q7G7psJqLLNaLxk6JV8VPQx1NKdfceKlj0fP9GKRjhk=', N'nI1Pn7OzKy7eGSNGEBqi30GzGUEdN9fiO0wdcmsDnIw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (457, 483, N'ia/etrSvo/5lx+rJWH5GSalMWUOXkg64wCJ6EIUS+dI=', N'OwKkt+cE+/BJHJOMY22zYefXfwQrv+nyxUO/jTMOMPw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (458, 484, N'pIFwkbRe0HDwbHXa3aq3REXg23GcCLUdFA7JnFBP4iI=', N'N6q3WhmIB+ZMaIWG6B4FZ7e7bm2I/GNv/U1Si8KW7zo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (459, 485, N'oriFzaXPJyjiGAnFKxE5uGMHmdNnMed38Ntk7ZnNFvQ=', N'66JJ4EuZeaEWtEt7quSF+QbJRlySsMbM9UaSRLExkMw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (460, 486, N'pnr2RsZP2Ksq+adc1A8TTheEgseDnPc6PPxC9E28Kcg=', N'MKNfR5cvyksF7Xrsq8xdi51I5MtwWZFUJUZaMB83ojw=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (461, 487, N'9rDNVs1m61MUAQAVTouydFQh0UMhbHe2w8GF3p+DWdA=', N'n/FbwK69fXhO6OpCNKhEWR6grpsCjdr/rJxsRq+A7Ts=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (462, 488, N'Vp+8a+dweg9hH/XXy9lwOkRKVTt1L/Fa1cwVHuX5BIU=', N'2OxnrRATcAlRjNE/XLtxakogZkEeLyV5fBQ6RT2Euhg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (463, 489, N'xWtoYcp7M6ztxRzf646JfkQDtuJIDtLXHymQU3rQne4=', N'ytXWwDcAvO1qCYe7UCMkJB2UXSMW+pp8YAAKBaensSc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (464, 490, N'E+dNcsOOiQrqV2+AUxhAcKrRs+6SrlvjPWemthQP5OE=', N'B8Jq49LVTs9dmO8Pzv9G8GGOYt+UhP7LCSw3VnrLcFE=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (465, 491, N'yXf1dxSejWF4DslRqt2LfKcu0hE91sD7VSTkxcmDSHw=', N'tN8XIz4uadGqgX2D2daFp9/3bpJEstf/1+qSXcD236Y=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (466, 492, N'Y+wtmGLPnOTmvyCUZXDC1sAFdLV96Y9YLS4Tva5jLuo=', N'Xq/Fvyz8IABbYMk9lYNQRq9j3E2R/mCO1LMlqD3og6g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (467, 493, N'kKBMcvhcXjDEu6VS/Q3Owz//SREQImSY9ftWGxSrwv0=', N'MDmic1nEOWycm6/0AiEajvLNP6xkNC+I10W14fz9v7w=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (468, 494, N'9+8FiNjX+2F8A70/EPAJ+qkiU1tRnw07fvdI8RA1ZFw=', N'g3sh+tlfDYfQKdEFHRqNrnEqNKeBbuudvskhcNX6yks=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (469, 495, N'eQtl8nKoQOKXY6C0wdy3owL9b/o4hShaw6JHIWvGYEk=', N'DzmWlsUkPPUdO8hRAlutLV5ENMDcA8clr39nPgMsidc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (470, 496, N'v/rRNtRPtYdinJnlQ+U5vboXFEH+GRsUp+kU/L2NHIQ=', N'6lSlq7z+G82fJWCIL1mHPIHz7gipW/jbBORkB5Ln5lo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (471, 497, N'4TaStHJIU3hfrzlX+U4FjAAkCkxHTzjw0U6KLnEqOlg=', N'LWN6VXVlWuSJ3Glksqtdu/Kn8wtTcdSsr1iDOqgpkRU=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (472, 498, N'36hVfqyxxPqB0XgQZ58Gk4IrkPeSvVIuqK8HwdR60zs=', N'dZAshFnl0/751VlEecS317Vm/tVx1y0tBi6lCoX0aqg=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (473, 499, N'CqkoRAYOccE9HWDxzvZ7MQFMSC1yQbrtNzPQAvUL5yM=', N'bCEuG4zASjVxZHgTZPSKm66mKj6c8+Y90Wsehm3JINY=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (474, 500, N'aNv5pGgH4c7aijjXiMmPAbBD471qrI+wp/yNYnBbXDY=', N'71br6L8f4iUloTUzivU9IGAhXoXCfyNyKkJrbqZFzgc=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (475, 501, N'1rGKKNrcpY/AGdQn0sy7g69AWrLYw5GfQXFxWOfGBxs=', N'+4G9xEmEvw7LrgUSbUBvGpidZkIyEUffJrrjFHru7Bo=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (476, 502, N'5wAbroiNkGDHarT8YdEaz1GiY2g3Q9RpnrV5LXKZqo0=', N'3DfLRTAUonpSi1JRY2c+44QFcR19twXzmSlCUl2m3ck=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (477, 503, N'1vze1Ev2TA9LIeGT2J90RlJk9CuVo2tSHZndEf9ZTsY=', N'o3IODdRPoXRgJTW7L6skvahyMsPrkmkabnKfizt1t7g=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (478, 504, N'pgZTqV1HtmzD+b7aM8AgDZ/phi1hMBuLw2zfJzktKd4=', N'YlP18XmQ3nVrRmW5vJy9jqQ4C2gbunmEI8fzHIrhntQ=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (479, 505, N't332GQKzd/1KjinGWvR/KI5O5jStpWIjY2ifcEx1cwk=', N'jQukyvzNOr9nri8wHVONBBd7CnH2BH9xWd5jxpw6qto=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (480, 506, N'pXkK6Kqe9DLf1zv5r49cPll+4wGNv5gDc3ElbzwpI+E=', N'OpwS9r6pHQ+O2MXdS/sTY2/z5pMuN03ZIE4+vybWBY0=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (481, 507, N'e58dJw2lpVpaXqtdnolGkJN+X4kxILXAdzjDrO0VRXs=', N'9m3TMs6hUIgelJHJDNiP4RvMUJdjHxPhTgaJ389g5Ew=')
GO
INSERT [dbo].[UserAuthentication] ([Id], [User_FK_Users_Id], [Password], [Salt]) VALUES (482, 508, N'gwCID9zduHPOL1WpmHa+8IDiKpsmeQjjHgUO/slcC9E=', N'ARl3S4wEoFQzE6pVZ/fM24WIr0d8J+DmLFH3ccEJiGY=')
GO
SET IDENTITY_INSERT [dbo].[UserAuthentication] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (48, N'mK/MH6pf3snVFliymvl4v8wRAq0Y9oFCTExHAIW5MfA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (49, N'EOubnv0kyEkMD9rq9kUzHBPGnpasjG9s+G/EVkkkn1E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (50, N'S931k+DmRU+i/Hi8JkYi4jkh6yRFKOFTcqq7CEpGWkU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (51, N'H5WiZ1CHhkgY0i/HS3QXtxytRp6Uu17XzTSvP49Vavo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (52, N'YMKVapfwT0S75rtJPRcRqw0Cik8InGSZkztWZ9+ZcBc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (53, N'Zx1wJ+kQH+nf1htYZjb29WW48xZsnn49DJNDcCez+QQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (54, N'ySdUiLpJIR9W9sow+muAv8iu2S0q4vC9thLWIOjFaKg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (55, N'J6dIxnjzWdUFyHRP1Ejxa/iP3lgQehMRTnhulGrb3r0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (56, N'JbTPsVkshNuL2wnsqp/8BNsB4yq8H1zn+jW8Mg54IYI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (57, N'i+8jHSa5Y1OAzBJaWf71A7j6W9j4UFuRPqLez5krEEk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (58, N'2XmMemGD3/ZAYM7kKP3AmGJuaMdswuKmF0uaNzQ31E4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (59, N'VHjQCm3lzBJvzvHzz1i8aFjAeS4ym8IbSbEOSUBjqmI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (60, N'E11uqFX3R1Av4wpfdHpZA9WHD21/NrS0Y6j3QMICaWE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (61, N'8o0HYkrcZbm25S1qL7eI75j04dpyOnC0YYeyraZ5dew=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (62, N'3l1aHBLf7/3t7c9qe5TN4gmXQuXQxjpMw2dfIfdiyGU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (63, N'IHseEB4+bwld6nHuyc+JxS6InSVgFOWBHSFSeVJNNAw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (64, N'cBwZEdclmh6VJZXibB1vEbsbefrG5GUc3yZMTv0H/IU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (65, N'N3vDhPKWRJcKIFDQ+9+WeJxkjNiLMoLnmAv05eUj65M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (66, N'LOoQrTsCsnV7vs4RaIz+oGI/J/stNaeEpE0dwenQpMY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (67, N'/iFXQcU+soZSip5NpS6v4LnbP5fftKrZp3UqnRrTrNc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (68, N'V46lhYOjFcv+6xCmH5qwx+hL2C3Ivc1E6GCp/1PXt/U=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (69, N'Xc8mYpuhLY48atjaWj22HlDAipiMitK7Er5Dr9acj3o=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (70, N'f0fC4IO4J/RR1Osy54vRG0lJe+zNEVxLaZQPBM7UP8Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (71, N'/2ew2i+Ct7KQBTTe9+k1UP6/v7V1Fa6XAZHNp54hcRQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (72, N'0YK9sXzzJd4yA8udabyDwgIIrCdqzye/jeVDhsOs6jA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (73, N'QrHugKijZKk6D/8w9kWGIWn3AIlfjAnyWjjs5ThrLsk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (74, N'F0svMDmQCpuBUsbnAvUW5zwF/r8Solg/UrdCdn2YyAQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (75, N's/liSHcupnMbu21Bg+1z9tU0iW4YZb8fxFYDfkMXIzE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (76, N'tPpjQPC85ZxCEMbWNzKdeyEqSXlk5RjWZCa7bwDtFrs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (77, N'nMqCOHYwLOtwIWTu9PkAwx2lX5rc9m+A/KGkwPIP4co=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (78, N'b/3VQZtTAOsKIcwLk4fT56LCgesamDqaplWrGzZm4EIsDgbDsUcjcmoS2MVQWgSb', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (79, N'4jih7whkyqozIhlnNN6P7g86AOuYOH+GqWZbFTxlHkOcVhi4ijcTDujy5zYFw236', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (80, N'ChFL9DsVkDdK3VlNI17AsDvee2hHO9K4HVUXsa49AFFCXLiHG9pJAGZIdWp/jWAN', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (81, N'buV/Z1iQXzG4ZBwv6eWHuXpNjxBsc2KJjXyGrFcldqNhQVnhb5ROSeJl5moHkN4t', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (82, N'I1kyShCu8zD0qfqjjl/NJ1u/p114d9vCEV0RsOzXQj9FoxC+RQa8MsvBZj8mFHza', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (83, N'/bN81FUVgKmnwSnM/KVlJuo7Fk38c8gsg2AbTd3Np6SgsL7frKXK1xcmL7rly7pY', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (84, N'l2edLNBK98pJoq8T0fr/Br9Y8wrmNunXmXHbJ7vo2f//N/4J4t3D5tUrSt/gQpPS', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (85, N'051QEYFQfS+E9qY6uuuEDWC+J++d9gSYCEDv3R94LhG4DD3tOjFGWdzMiumusrYi', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (86, N'a9H8s1ymuU3pjsMtRYNO6Haf263rMeZaudZdxbK7W5amlkHcjuYi+AqhbJwoj8Cc', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (87, N'zFFo7cbNYseevsNXQpDfsDVGjwrjQSr9Dsj3vK73comzI0+vuO90oObVbyW0cwIJ', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (88, N'4j65os52adv+qUlNoo3T/YmYfhdRe0KoWLp8eDmYxRfipdprG6Wt+J9pbnJ8yuPa', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (89, N'Ahg769+OyMpvL6O/zw+7phKohWlcW8kROhu+bvWZO5E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (90, N'VjEAQhntV8F1UlS8hsei7dyQ/Rf43HXkEvQxOKl8Saw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (91, N'1JKHsMRBdJgI9n3owPaCxNHG95ZI/eoEZ22wzKZInTI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (92, N'HF9LVAcDZj3h3XR55fkxXyXR2AIDPwNq4qVaqDD5IH0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (93, N'8wTI4lEEIwO/7qtPT1m8MjVt6syjlPOeAswGtRSovVA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (94, N'B7LMK4r8hlCpcHnCkBwrUdY7v4ymvCJk5JfLDOOpcxU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (95, N'ZWIqOottJ0OmU5qCkHUhMhMrEsxOGFT4dwp6+GaO0hY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (96, N'iuWT2VTb1aLEFh+lL0OPHVgbTQHBW7+V1zTFt1FauIQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (97, N'b7e2YkV9zWQBYg3IrD/yggeDxlJtvrd5pqTgiGkmFOE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (98, N'6YNP5aX9j0ebGrvvPb+2/pgK18YVUbcbnQh26M+OYvE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (99, N'3dKTJsUhHdwVgUkjbEwC1wtpFOGWldOoGebrPjTnOFs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (100, N'B5DKI2vLZIB91yxNvNpxPNFJnKdYrVzXG0mcteInOlU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (101, N'bh4UiH6gUkEeC3fo9RIYsRESo8ZZyf8dBqz0/JKX8Y7rqhYzNAQb6v6vVnGMhH89', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (102, N'N5M70A8Fv6dZOQ++L4z/HyEz/YnMvgOLE73+rJryAYVdo+AS1guC2pxKRA8yAtKb', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (103, N'AyHatTC3mP9iSmNVXwipcyaK8Tv7pt1bnwVaE+XxXRHd3qxWvNXFJtRv0o0zBgVb', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (104, N'XA23CmoN7ed7+7J6PQcDMfwwHT4vEKFYvCboBy0cGmuZvjiCH27euPGbQFyVfngs', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (105, N'AS5ZxvXK4YRJnWppkMP2wxlcjfOSM3IlyiyJ7tWHNXe+3mAnzmfPRkTMcExt0ln9', N'2ESNt2af2xIfb/xnthIymsffdxSTsQjgGiwe3N/46d0=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (106, N'JclKBEgp8owbSbSw8o6uNg08kUfIf6smH1UlPfNutWs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (107, N'YUoczWpzslwD3BSMHK47RVUqBQ6KI3zuhxR6BIiu81M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (108, N'HZM7502BpI4izjdt+fp2ZsP2Cp2R3C2aclSsJA7DlrA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (109, N'iMY2gMG/lS44ToD8NsrjLlCxqm/F8ibAgi8YGeDtUjc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (110, N'qoowjTcCMkSbCrKyNrYnljEmOAEJPjDd0hO5/xBQDto=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (111, N'bHE80xtjQ0yVgN1LqiHwrciDzJh5h/QysxZd2i/KF2o=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (112, N'sOLEjVbKqj9d9c1o3wfp12m1H8EP8DM8Mua6NYBoDqY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (113, N'9XxcMsZ+RUaeZn97dQHsH9IIONhjRN2Fp4Pb+wQjv0Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (114, N'RuvSiKU7NWzSPi99YnxnT27xSfLHk4PEd6n7847nD5s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (115, N'qIBiJ0MVcF3maisz6fGB2bxPhii4vE7XaTGk8cb4EaQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (116, N'DGR701CCtCosAY4Pz72nVQylt94UJiqg+LAvaq2g3YQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (117, N'GcWEmQeySXGOLhkCuu6wfWYCQEdU34i+HYyk682pNp4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (118, N'V/hYinQSaLvhWKlaUTYUYBgOkQsLrYLAgTHz644ZnLE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (119, N'GMCu9npmytnCREU6d4LavGLnVgb3R0PAhB9AoEsdaEw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (120, N'sB3WPFEN+tIN8AeqizUNbIdtsr8j5vnbSYOHCrZdY0k=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (121, N'r0yZg87b0sM5WXmDuV8PZsolWDE9XT8/CJP8x/DD2xs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (122, N'IwjrH2shCjk/CkS/v60H4bGTmJbNwKBQ6l/GmZc/qLk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (123, N'ZwYj8Ol81TF7rBma1l732BtzFYSHcDhE6hVAXX2PjhA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (124, N'JeQavGcuvSEXWap7d42kVQxtOJT4CdLNvdxiqCjMWzs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (125, N'RH2fqucx/+BRnrPg5irYAOShwl5BywLfGBnuWWEaCbc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (126, N'l5N4/IyOpqRWvA1mKOXoIqIAnqBLpeyHy/zfLEEpdEs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (127, N'e9OSBKVdgZCfutx1SKoXj4EQOCoujUkxZ2OTcF1i4tQ=', N'z7wp4XWWgfXSfN3nZ+0KWA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (128, N'9bV6u9lMM3VLOrdQ0qlkwnkMYzlG46UuePCHSDyo2XE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (129, N'gFeEMWsh7IuaHP/gEjcJ2/0+00rbakZ0VEacfdibqVs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (130, N'i0xKOqsIiy6A6bDxA+ir83JtbWaUkZR+GGrcqoS5JuY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (131, N'sfvDNPxHpQ26nroL3oCCQddUAgJo6TsYtPuG5Se9XOs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (132, N'Ozke+jcUbkTb0+AED6kS1ZW5H5uvNHDmAy6H6cfP0uw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (133, N'Dty0IUXGd+AMOI2GgGMsVQ1OP70jcJcHoZ3DEDZuSb4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (134, N'UooFfSeVc4uTfL4ZzoQSF4XYeRxRIoe7a3FTL95v8X8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (135, N'T6Dgg0zmnHKZJPfntZb8bLScuKkb69QSeMIT5+BfnoE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (136, N'1M0Uc0QZB6o0fYPAJSLIiyCygRBXHks0Q0SWOJ/I/DQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (137, N'0SPA7HcookZgTEFBxi0HZo42BKmGLd6mSz/L+3VuDnM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (138, N'J3eGDuHFbVkDyvNWvU4dKvd6NaRsJYcjqkT5LULhOcM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (139, N'SSvv3qi3iZdCrR7vKbaa6fTmgNcea+fvM0WJWIUion4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (140, N'02SXBjXGDxHU81Xbpj7Lsn6AUlJ+94uiuN15z0TttJ8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (141, N'k/4fV1zSOF6OUvnPJmWsqpMUn8ptAsKYHhrP8pWwVvo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (142, N'L+Jcs3IZ9fXe0g8k+uDyW74gySu4xAE4RxrMu07iMC0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (143, N'VeseoHAVeXkCuAe2u7c2kGJtfzV5sMSqMIeKdqkwd/s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (144, N'3zOJwSvCB8DQxz3C76xWLel+etjN+K9AhzC2ZckQeBA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (145, N'ZuEsBYnjOPssPrH4NtvmwA0y/Srktb3y5sYWn2Hu3FM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (146, N'abuHgo63zeTYNV4Olg4MikRWZcWx/6fBgHk1YvzYXKA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (147, N'5VrbKMrie0P0Yf3+Q+Q8ZLylHFIoJ3BmmjIS/ncrqW4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (148, N'T1XONybIqivS4UILWMobe0MZF4zIPaSFLLhWWK43cmI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (149, N'GkzJ1XhyNrYi7QoIMUAOhTnKfTjb42O9UTcF5a6q5So=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (150, N'XqMxLkRPswNX2q9EY+ghklTrS1DBkd6Bg9L97T86ew8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (151, N'jyGzfZoFurI1Nk9S6ImXteM5R24WRJvSthPtBXfgobI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (152, N'PkwQqHSCGvVo1QmS51TZp0LsHXH9BYBvwuy+Myhq8zM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (153, N'GgFh89G9VrAeLQ4RoH2zLM9+H2r9UbZoDuNq3HH3yHQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (154, N'VlfBMG41z+kcAzwQsx3nYolMdHu3LHYYQhoQbv7Qs/w=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (155, N'rjLbMA+EvUN0Hai9rIUSuTLzMCwExj+7wXEramxMUKQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (156, N'V9tVpCDZ1ottmD5a4CSckXlzmxeBt2bIzNfAmWKu+OI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (157, N'J7/5WZZ15HkiuAky3YTUBOlvub6hbwMQPtSynps3DMM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (158, N'pkaX0aQkF00W1hAr7SKjeXvglYNoiya7uE9+3kJl+Cc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (159, N'XLtUr4mUMd07406L/6KtvcdmUXomZaa3V8yZIuJ0Nhg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (160, N'fBgye+D1erW3KpLbw90MPHca2oUnBIeQ39BmxulgQgY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (161, N'WwWqedNWVtODY3diIZyprWdtK5jMKPaM5Z6+S4VMADk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (162, N'GuB4dN6XyI6fCtBtK/ENW1gvsCRIN3vCx/Q3EQf7gAM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (163, N'3EfCof5YGut0swNEaSPLz4U9suFu5931/UuhqcsTM9Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (164, N'mDzy0hWp0cGxqioOEoAU83p7+YV0IvsXVCOJbJIT588=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (165, N'L8CHIEKTRxG/A0u4MxV7a4JUZGoagBZAoS9DMsGDj00=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (166, N'Is3Xosth1gUwEa9pv0jlTJ/j2uIt1XZ006Jt6IWQGzo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (167, N'v5mSPcGzFkE8aS8djfymiXuB0hLXaxVdcZM3IHYJIxs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (168, N'T4W/BKeHsAYFpeVCAk1CbrP0clnXZjIIuf1bDb8MMEQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (169, N'9pdCsj/5FaGAec0lErh+12R57iPo4NPtfokFUSirJnc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (170, N'ziMtdV1z1BhMoZf48yMV07i/7m38Fhg6qJ2SHl0X9fk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (171, N'L4Zq+zNzBNbIGqTSxO4bLvY1KmUjyFDGaC94ZGKRXUY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (172, N'ACWp61rFE9ILvs6pUgzxyKff1OiXryk3mLPmsny6KyY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (173, N'iorJEJ+bxOv+Z41VI+l8Hnvs9Vwbf7DQ+aTGrDDpmEE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (174, N'AJblVMJEVfr2vk0Q7K4rbFzHrJlsxLSW4MtZZeTu82k=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (175, N'l5B/up5iYTANmJ+ljyp6B6GoOT8vt4pePLOiiqubsFE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (176, N'pIHp6/XlpX9kz/xVtvBYkYwXthpMFy1tBCjNusJu2yo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (177, N'MyBxy/mqg0Pc7+hcmNXPK401ip4mjxCQHTsReepuZak=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (178, N'Pel91LNyePwyK5XVx/Ni4N5VLl/aiLKLDjyCLq6OlZs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (179, N'10FUd+SDPlECG9KeeAMK4RpCYfC2H922HiH86fsghLE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (180, N'cLM34pKE6ZCuJcceOBE4LAjIrU9SvtD6elmmAvt2sZw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (181, N'AZR2XDMI9l2vgYzXVqGQxSPnWPeWTE6nqrGvamwmmOI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (182, N'iuERnD9yosOdN2hh3ngpyK6az7oMHIAWBFJ4JM+5OuU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (183, N'LPbqu15eV0AVvuGutmYRsjqeIjwQ5yfRtLculKC5q3I=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (184, N'jmLMn9FHDvGmupOYHFIaq3eIIvApm+cG55fdejjDIlI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (185, N'OXAXHExhUAFsqrQBwe8Cx5fqne4Dqbn7PS/arEplAhE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (186, N'1OVUX8F8d9OkMwG3DmyI8S8OGs4Rg4iZcXVokZ7wf6Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (187, N'ig2v7R7jwI6uV534KJVSsOd7bhxSGr7N4oxtdNxq4+0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (188, N'AqU59j+g+BYJO2ritHb/Qk6NSGtdZcyA0qj0URotttU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (189, N'WuauqRYvasHyHaMKh6Uh9mzaZkwhOj8cCq/2IaMqP9Q=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (190, N'iTq9ohEM2DiaPzgRlTg5KoffIl8YqJWTkQrP4AEbakw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (191, N'Iz1jOXHacuo6EUSqJvti+BxsV/1UP1O3NKtFkQFul0o=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (192, N'wHpJ+Y7Zy1yjcOvcL3bqNs4Xzm5HsJ3fCcqr2OYwUjs=', N'U2lG/7GNxLxXwtlq7KrTdA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (193, N'rIanLXJKZRN0qaVB7nGdRQ==', N'9KNn2SpLtQO4T/tXNuFzAg==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (194, N'BH+nmIR7tzKKh9IC972o1vPxSMv/A9Xu/RRHmwpadLQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (195, N'nL/i2rXbgAGV3kX2pgymeoE5Al4O2JfDBVnJKFUMPXc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (196, N'6kothmc+zkdgfbHRlcULWBZAmfwvTyodujWdQg+lzCc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (197, N'wDxIqSxBrxGflVZiKbeyedbVSRRj6E8GiZxSH5txIKI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (198, N'oGuXToCbz4mD3P5TwSPHImaozSYhMBVjzaZAnth6cek=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (199, N'64hvtQtoIpoWuCqPK5+jl9CUwlCS/gAXWU6LZkhfNpQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (200, N'dohO7eedeczYwC/KxfCmdly51PZpbYLWUp0KCmoJSpw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (201, N'XKfnRUbx6CvkpLc8njxPhv8UbCgau3imkTAEewv+gzA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (202, N'8zZvFyanEUeySunULB8WcXvav+swdF90UNn4ZQ7nCgQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (203, N'kzDBPlkd3A2MeuDZ65CuxIPeGAon5zQ85iQdaM1aNHE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (204, N'NrHoTyeL7cYoAHygtXBRTFWda5GYno/bS1uFeRh9Dvg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (205, N'8BiAcF7RK4UDNKhxfd7WGyKzi+CZEl5gSKakasMVbxc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (206, N'XiR+WQkR4tNrjJc3QmvccSrNJ1chDKeM/ei2F2dFIzI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (207, N'xC52Tfq4na1QV30fZGRjEVQFfngam6FLtFJoG/mnXpA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (208, N'StsBaRNS1r6PBYFPpe2Y2/10i2GNJWqFgUjJ5hPtL2c=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (209, N'XUeUmh6W9zVj0u/gNAKSLgvnIr0UYI+xA8mp0fLhwnw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (210, N'EFkd2NqzWEPSs35vcBJR+9QKiVl3ey9sTIZwX71HbuM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (211, N'1M8sm6apBz8T9O4+hNOt90rqE3sZ4oau4Y+EVvWzQYs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (212, N'wTqu82dUDUkCLde1L8riZrMOt8RXFJZwdLO85p4wF/A=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (213, N'uhEspbM3mWhpEwGkPXdx8+N0aW/a51TiQ+XlUWWdqPQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (214, N'E9j7Mn6mWplH2zdoyIdIKySIAC+lxcFUlQumRvPufcI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (215, N'1TU1frc1rmNjGSMn3enNU3ierLRTVXgR5LlR9ynDQmg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (216, N't8unkugDUIet/+1sfBqLophgH05/t4BUMKDsmFSuxG0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (217, N'pWyYF63CnAHBuppVlrIfYu9jcX11xQGU1NFXeBOq43I=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (218, N'Py5KsiuvHK5roegzsb/aNL2BdPNZlmUhbied2u1afzM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (219, N'+VNYjLN87fOjm5IRy/SI+BmVL6xGX8Gbh11i7Ho6pJ0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (220, N'V00FwlxJ3tq6Heaf3THFigTnWcxgElfUoamaR+EOH2s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (221, N'hssV54LC7+QkpyKpz9sYbmX7J/95RywcbvnE9PxSmXM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (222, N'Vw8NlvB8E7WQEKzTHGPknXrdKQwx1dOqjKMpgMfSZqM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (223, N'R4G7X68NaXYE8GwWvK5MMa7tdgqlxp1tX4jwJHmsxbo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (224, N'5eaUYZLfSf3cVBtM/Z1voAl2Ctr/iCr6IpfFU9b+zrU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (225, N'pBNfOmDCj1vGxvBD48BI5GcSUHsEwNC2k+iFEfiRieo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (226, N'/TlnjP0gzhkyZoa6gLeikjuno1fsTSpxaEnLIZaxAdc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (227, N'gCmgWh+O+DYSOYIIXT2osRzMfqevEV3XH7jSbmYBoGM=', N'9KNn2SpLtQO4T/tXNuFzAg==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (228, N'1hJtnOvGgA9Oggm+B8vb2W3UUFzs3V2NjiTl2ZTjRRg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (229, N'4N6aBkJ8MU66nfybDzBerOsdVMOxS9IPU73gy4ZfUnk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (230, N'66Vfzw8y2WT2P9PVO4Eio00PTzHSSYEldtOt9w+iHJw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (231, N'ALmV9h5gkX5ptWTNPzHz25Q4fs4xA0DkfnZu4fBtbYo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (232, N'8dAPfKjkBJ9Ugl/i7vnaxZalphd0o1Bkh1PTp45jwpg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (233, N'e7aN0LLw83k2irtf2USgEYF6H64Ng970ElQUMmR0qJ4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (234, N'86+eedELrmzSk0mvvHv67n26iPuxl2Li6aO1v38+OFI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (235, N'OLgHUHaelHQ1kRojw8gDpCaDCtAf9B/gieU2+gHW+YU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (236, N'xOPvbPV3PItWaC5k3Evw6NDcVgsE8S6H010iPWZAOnw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (237, N'7pXR8ubb9ftzER8WhV6S3dd4rKKXQK2+t66eOo5R3S4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (238, N'vThRg7qPusjgDkWOYoa4xjxgB0y1uop5nQrMq4BzAOg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (239, N'1wit5j+lh+wKT4siyJk7SVa/blgfDxAHZj4A7v2sRVo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (240, N'A/cRoggRyzfazmz2j70w8QU6irPcRo2hgen8pKaTzQ4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (241, N'9DW5dCIKiNeJu5tgSQH/+leeVz1Em/MDf0uICmj8BPs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (242, N'DqqQj2M77bZTSagrjtUzW09wp+tgSz1OXL9sF9AN6og=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (243, N'h0f1k8OFLuElVPHCu8AAmjU7pECBku0LvS1MG8E258U=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (244, N'fd7e0X7CuCDvyPAakejAJxJnZEx//TRQ2KMRwg1pjzI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (245, N'RPlMujH9yepSPYp6M2JwcjXvZVVuVDzZO4V4dAFGKfs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (246, N'L4pAacc8/Udbk18VyE8kKzMlL1aXA9W1/d8WVi2hOVw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (247, N'QBhLctyZ9Oo/oe1vYYTm3Oyoucn/7sLzyFTAaEE8KYI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (248, N'+n5KG4sEkRZzr7vfzHaK8d9tkRaidKvAxMS/zmSY7XM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (249, N'exX6HZ4gqUbREVH4auEXrrskJaoMG9pKAt9FIRUa4o0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (250, N'exX6HZ4gqUbREVH4auEXrrDf86ksOjKJViCzpDOyTiA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (251, N'+ZI0idduqjptzo4aBqhod9KWJ1l4fa7R5BFJ6eTKTzs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (252, N'vTCpY48iQ+BlwYxzGtLQVUKk9WyEN3UZiolP75YJrBU=', N'aQp7ta13kOcMkuFKDdMULzJ/6489VxG3HXhbZliQR4s=')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (253, N'KmnMQUD+5a9w2jJM3T8cnsuZ5zzZ1yz6aOUvlMhglcs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (254, N'bNAgDIZOUqKoqwCaOQxDPgiJFZNsqC4vWR2SZAw+KsY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (255, N'cIo1NXx4kn2bHvxxoOnifKU9Zwi3I/2M77l3L0sWOlQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (256, N'wpUpikmeh+rPMGvxJDnFce05C7l0tlyhu0hnlPZe+N4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (257, N'zuZ0mRO2NZF6RMiCrwQQ7aUuPcBmaHzy+5nUxqvKswg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (258, N'sgq5K2Cux9hcOPY6gJasAygfjWRfmEvGN58tNOf3ysQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (259, N's11iUEYyJrdsb2N/cbGvRSL+erJSFIgBSIx+w9RlXxw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (260, N'qTn/uaCoyTB0PGtv7sqZCvLh66+B3x/Xun84yTbY66E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (261, N'jQPvBkaTjuKAO02jiM6WgmLkfsvesgvPcfu1AjJQL3M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (262, N'xznuJJj7s1KjvfoJXLB3p2PI5fD8gAPif+HMkaP3MPw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (263, N'3kNl4txJc6BUvhvDTc5L4JZhZ8KtOfi715fn62vLu14=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (264, N'/NaJUX7s5O3V3QA5sNPMF2Q673FTeYgrm9Vg2XlWStg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (265, N'lF/LkqQObFVHjSqe2StlGwheyAuUgpKyKl2h7tg7kvI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (266, N'vWctGxj708t3efFd33/fvtPYsvK9YCwMh7PSSI1FLrg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (267, N'UqpJrQ3OPvglNnG48GrliWepRQVSM5yhRO/kJkNk4ws=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (268, N'VBOL9g8axBbJ1GgfDICk9WVUUn7W3/Mj/sdFpw2iHAc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (269, N'wappJj6m2+0NRjv0oKvY8go640EBQAUiHCUJzXpPMlQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (270, N'up3PnYh4NITnCuTxpKKIZD3Wk5ex4q8Lb6csDkLgalw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (271, N'KYFL62blTFKfZbvoKgkFS0lgNfACqkVGOHbt82TSMm8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (272, N'HnkQbzfWdHFQxvXTjQIIRmot4T8f3b+8LuyQeHI7cek=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (273, N'0NB31p1n5W7UDd/MMtGucSKDK7Z/l40XGlIBzDnNF4Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (274, N'+I5UGZWKhNeiuz+2vSxh7IhRXl3Oyz8tmHoBchfPvDM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (275, N'CYFzuOypf48JYbHayBz+o//kIpVH5kg3hlmMirCMnvA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (276, N'vAg/vjtXd6J3bPDmhezvC0BHrDlSP6alHFdZz5DOCa4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (277, N'G3saVzgPKQ54JjiEmgzPgw==', N'XANiDGlDqgFJCzf+64YK4g==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (278, N'hp7cXqcBd50P+V8lxJaV6pZsoQTnYAFE0zosshvbyTI=', N'CaVkB39XvC9M3njd+VhOaw==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (279, N'gxPpw1pVL7eG330bNW/cR3N9LFkCbiqsxU7qRui5TMc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (280, N'NV8cAPYdRu45HE8YnUTOoYHEOnWTGfvKthqwzxNBtU0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (281, N'n04SXt2g4ydnRdOe3nx48U9/GQZq/Egsc/oKWrhqenY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (282, N'K224V6Ezfks/BWQrrlisARGyLv4dlRb38Kodpnnw+TI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (283, N'y8bwTVPyrNGYkwqZ4OuHU1GNnhAv98E2GbtnEAkM9OA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (284, N'awf0vJmTQuPd8pzbpSsK5UQGRyTt+980pOo34cDHCq4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (285, N'aY4xeoIU/E1he54VUwBOIBtiy1MZouNwv12KDcFKd/U=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (286, N'cJAakwg30xLOt58HJeDlKIRETEStTraDJJo1uegQYdc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (287, N'JrmAFiSkl9Gnq9ySZYny+AekwFcCBHoqaPRsKxbjdb4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (288, N'cwzvaq0uA8ZT5tlgKK2VSoTZnDwQDuZhaILFjKXfg2I=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (289, N'd2vXcRJU3fU/euO6lnsZ10VV+RWOMzOQCJa5jEqFhdU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (290, N'tv28K7VqcQK/EBG3gRWyhAeb1ILWtkQkru7A1JTN4iM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (291, N'hv2WZ17GlOyf6aKGLM4z7U/I5cOMGxSz5Q7+96T02M0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (292, N'qxhXPBzFMh/s0UCmhRpfwezbLe+S3JreAY6AU1NcuZY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (293, N'T4h0Okd5Xmr7ziN/jYwhMOp+C1PMXsC7eT1/ZBqzxks=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (294, N'Mm7Sk2nnb6aNsAOhg4Cb5jalSB0EkcIV5zS2gOQ/eFY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (295, N'OVKris9TotQVqJWJ1rIeFNDduce3UNvhDjGqbKt7ApE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (296, N'yNKVXEs2ouxauWh3wmgncfxhMyIyILlUFt7+WQksCtg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (297, N'DoqsYHvOnwVj4ic72JmYNh4SUl7Im1Q3GgeiksJPL68=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (298, N'hWmrisTbDsz7b7dBfEHy1KMlyZhXcepmi1khScLjdnc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (299, N'hNhY80xJLWyaiStlPrlvVq+mBoxmj05i7ROrnHg1KXQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (300, N'iSdnphNDgA5kL3X6cbx6QUXpu+75dXiwidyNH/Diyl8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (301, N'GoOrVSuhSmsX/Equipf0U3R9lQ3O1h/oCxPbUVXcVrk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (302, N'ZIfhlvGRFAjY5MZpNSkYnLeEoaWbA/gnQKMIS8gp4W0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (303, N'b+Cw4/OSNuH/gZhbokrFnKkDmD/D41VRsaTJE1aGqeM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (304, N'H7wWfgc1z/OcykB5ZK1p3JvKzENhFT7qyf+Gbp9o1eo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (305, N'zQ2pm/bjPwm6vniFliuKeWA+XXmebpdmwf3Onvh1fS4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (306, N'8z7t7QAw1Horeri0n1qdd+QoupSLV9csvm56gPGT1zk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (307, N'eSnFw0ZP8/kcx1ZwwPKpnN/iqhzNfFrz1XEFQ82x/70=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (308, N'LQyojJ9ebi7fPJIl9jwwuIK4ck0UTOTIyqeE2OmSbSU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (309, N'/+Y1zgSjv5DIoeCOGyap/n7qrnXlT+ekitSBhW7DMDY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (310, N'2yU42xJsNoch/2I47j6x3oMYZTDPfDw0gYGm1BQdaJk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (311, N'epEJyXVNnwAnzTiC+9JuwXMHFS0XefJ/Bh4eTTTtkkY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (312, N'BOI2hegJdD4u3Jmq9ZOJFDlFz4EpVdMok56k8INjhvI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (313, N'e9hJqoMZpU4HpUKyLYeM0bXbYUSxNpddRJkjcFKaJpQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (314, N'BcCwwKyZ8UvzrVHo7FP6LoggHev5A6Kj7z/KEbSxKro=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (315, N'LLcbeQkTQ7czQ7khUn0Ia2WSpic8QK3LkoVdDW/votI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (316, N'4n1Ht6AdTcEvoFds/4ruW8v2C77aUNvto4P4ggwd9a0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (317, N'oC7BU5zoV7ekqC6VGiBuGPYj2m61e8yjmN25uu/lYPU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (318, N'rR8ZJ/vWHJhWfgqzN/vEyoeG13sgqJ2ZBW46LK44KVE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (319, N'H3Oi143IZYEx/vtFrpJ3ncsHpN7gk6Etya0d5RQmUzU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (320, N'XZP0YI0l1ADMoI0LNLHmUNNqrUwa5/1POvnsgxn4BP4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (321, N'197utVD+FWJ1B3fntISwfgyQqJS4w5rm3LOKtHItfa8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (322, N'FGIxj8WLTTVhwXLr2qMHElTQdOAzp2p4FQ/akV65F3c=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (323, N'Z31NPMLXvXQRK4Utg1/NnQXXlmoULv5CghRfudODpK8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (324, N'HY6LMA1o738SRNuPgpquGD/aL6jRMrgrM51l74IPKAI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (325, N's8rj6UpZoGEkFwYhRWfUmd5D5AvXmSVfrzJyMUJ+RPM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (326, N'r57ss6UzUlgS4syapAC7C1LNiw79D/MvZinBdyecZqo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (327, N'J+8z1n3CYh+tveWfI/b5vvaZoQeFrUUVg/BknX4SKU4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (328, N'Yk9yBxk/2KUguvpcAzs3k0TW7+rx3Q/iGGwLTJhIFeI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (329, N'ZLUK1yOoMzgYxp2E0eDYDSpwWVFx+5vuBKyBDthvQsA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (330, N'/PNQEVnUalOvMk21LfZgZuUvkKnftCaeIaYQDYdyJUA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (331, N'cpo4mWV0DRyurO0goJUv1SFJWTDc5p5LyMxRzO12P0I=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (332, N'HarR4ka75ESjRHlXupunQCAmhNFKr/0etWvED9VCZ4s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (333, N'1Z0F6NpcSvPXdlXXYwoKYWfGBx0nJexmOzPxW/H9cAw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (334, N'CbrbuPMWN39GOUzWvhcadFC2DIxeLjRAozeJZq5yB4o=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (335, N'tqvucK4dEmbEPjHQf7L/5oofkbuQMP30E776wDFhU00=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (336, N'qNTjdjWDSRhu4Iogv2H2zxoCPxgEGLUh95i4MZh5XYE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (337, N'sF2zm4/aWFiFzfN+6dq5MfVoCeGYq6bPiSJQbRzMdXo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (338, N'Q0B697a9wMCNV0MqXrUHqsq3JNegdQUhv88kNK6HxTs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (339, N'kkcVmQGIWzQ8Ot+T807p0fJTN2QXxOxI7XyADPGKXKk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (340, N'aLos5Uz5PYNYdquxiQ/5zjbQTk2ZzRirRftQWp/LOSw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (341, N'V0fybjwsaIbaesw1kY1vsXhmBUoB6+hTn1BC/Ml9DpY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (342, N'ZSPhMhW7NREHrae3l9A5XDtyrPUZVu3wcqUiy5seYoM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (343, N'U3aULscH8EyAMJu0PqfgE5CYD2tQK1N8N2141aZTSzI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (344, N'nRfOiQYOmjXKThIJ7+dTSY/I5H593hj4W8tb6uNRz2Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (345, N'UUZ5N0GtUwJOdSsr8Bd352yZPqqbQg5D7Pq7EeyLcPE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (346, N'JWtWVKJ7kibD9BLUQ9QeCF9cqhLMywmsv0+JZYCbOnc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (347, N'sSRUS3tm4y1iTK7P/8CFH67Sd1LeHXiukuCriFcU9B8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (348, N'fLWCeiV4Z2gLG1KYGfA03l5La6HBBrP4d9sTvPndoDg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (349, N'MEatsZ1So4wbg4qzDL3pAGZSJeEyV6jAWpjGBYzzV6M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (350, N'ddFs9MdqNNVGPDh4My/aIEwwJMoPlfMoKecVUdQtdd8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (351, N'UdXgTgtZz7toyFuGLqBqH96gJLDBkWZjXo7dX3nddq8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (352, N'12N4E9lWOevoqoVpbD7lq7zEq/d1Yo8YIiLbMxS3SlM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (353, N'6Bem5pxo6qRcFZtWpsSBu0Syx0I1FiZNYwkA6D73TFk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (354, N'aW3oni2rtap/2MA1jb15PbdZ4BixeWgGTz3KRhyRC28=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (355, N'kLtrbpvDsDKbAsJCAet2lefrVPnjLIhsq09Du1ZTRME=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (356, N'soPDKpb4wu4mLapomege2Zcfnkos3RzSFzyeJ+wnbjs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (357, N'3g8UGjUQ9MiwvLc4pHTxBl8VytNycFZx2dJ0TZaR7So=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (358, N'NCo0OHxkHvMqazLJOi04HQeLaBzQ//kA27iVWKZJ35Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (359, N'zmENz0WECT5c8oZfzovX5KL6kBhN/sy96H1YA6dx14k=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (360, N'y+d2Ahrun0ulBg2IzbjlkHwOuS6qUYl8kreJaZLJpUc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (361, N'iOu8jTg65aIKDplHZQEq1jZ17M8pH7MFj4TeWVNluBg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (362, N'd0ec0UkSOAHIeLj+iiva0UsF+HlqwXEZAn4uN21pvSs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (363, N'G1P3KtNj788hV3i0HhjeykKBp5JFjYePJh4h3vRNYgc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (364, N'xWKEr20on4v7u6nCP6s5hJzwntLfsuKJm9p6Clu9beY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (365, N'HqgThcX9tKAc/x7ISInYA30C5MsExOExEuIFREM4kM4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (366, N'MG2TZzUNtzZEWC1vGM3BRAVjb8UbuzdnNsT0tOddQ/4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (367, N'QjbHzCKSlVcU0sfZAB2XnepDhZmV33rCHipomO2ImtU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (368, N'gAdeCSRFlR0lJEOGBKibNcX8jXmZPXzWNDwN2Rk6u5s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (369, N'2pPmn0XSVg7aV9jaQ7XGLkCb2XihPix0yHeSm6PGVvI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (370, N'gVDIzjz1dZlLs254Lb/f8DckkoGZ0zW1jKKKrzp1ALQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (371, N'inO9Rii3IcUhuUdSE9dOKzGl7l+VU+0J8OAX3rOton4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (372, N'WWvNEKmLnZyJxFtyNPMCBu+7OiThUfoSCLoYVUtvZWo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (373, N'nolDfsw+S5jaWioM07COAk3tdNHm//x+J2SyR9UCadI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (374, N'vcNgrREeC6xsiZR/B6dnrtPEKXZJxRiKqTXtbWJt2eQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (375, N'kvp1XU3xa8jrtOPY70BXV5VwwHani9/dhgzSBLMIGaY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (376, N'tb9UUK6NvQxght1P3EuMvtuV6Ot2sF8Y4kM85Z2AfSE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (377, N'd71XSACiM9tomBlqTv5tG3nO5smOYX5mSQ2TgS/ft0E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (378, N'F7qDSWg3U5670HckMrWvilELxhe7ZrfJyRp+rRYbhwM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (379, N'NmPnqGiCa7x3puPWi4Tupg0MiolYs602I4w55SzhPN0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (380, N'f3vHvfI0948hJmnYBeKtOF9hStvd94fhT74x3RdQvA8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (381, N'hgIGwy/FwdE52gRgcXZaossy9g5PBh3qLlT6U3Wtxv0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (382, N'm1MZQ/E730wediPki5UEsUYkW3yxGL0f+DU2CVND+HI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (383, N'DoSlghLfKg0woOh07gPrsMWPaNKNdbrgCBnKjP9tVZQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (384, N'Lc68g4SDJ0FOmgviJ4aRt4i/lS0pqtVYKgzRfBB7KFM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (385, N'blxrlhjFaj8Nse8e+yNYIR3hYfYnILlAGsFV4Y+XPRc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (386, N'NEkVcmol9QjQJtX+oOXQXPVyAh4haWXCE8hwQ+TyKSo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (387, N'sXOwMar1asUszAt8eQ5AlIg4mqVsTlo6YBsdwI9fnIY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (388, N'Y8FtUR6U8guXaDcO1FHqWXIFb986eBfJLdoXDf2ztsk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (389, N'kxDOX8sJT7pRwl7eeH3kymsFKErtaQM/2gm3clxcXLk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (390, N'FzwbhtXMG3krWLlz/rCKMRmUfJiValzx7+cxhBI09uk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (391, N'9vCGx3jkbFZ409sj1aDNZsCT25o6fpiYKx8l0Kp8Fks=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (392, N'I7Kr7wuYNOXeMDrPqnYOCROokIy8goaYtWuUw1LtAtQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (393, N'VfZDEgDMvHMfhwm9x4vRUqh4e2jyCNIP2W3XtkNAz1k=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (394, N'DTyM5qCvP88kqecShuhSvAHfrxpO28gycqWpNUInncg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (395, N'mc5mtQMULlUyGoquwjZENqq30vFvB5C74T8CHHQwebA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (396, N'qeTiPcYJ2TEpE4OJumuDi77pnhuosXU7T3qHP05zvfk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (397, N'jFAukmiSXybKawST0uWtHhh6O8uTWRC51D5tf4MYSrg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (398, N'c3jruaCaD8iNrb5EM3KKFF8EH+Ts4BArEAtFAIPbavs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (399, N'vesM5MJ+ij60/9g7SyiwtzoXzX9mbUO87sio0hbnKVU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (400, N'AOl00Mjm79DwaUgrVEXQGr5XpyOv2yF1g/zzQlx3GCc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (401, N'SUZCpUmQXWFcsnT+yA9D6GVnTeFG3sX1GFb7rhs7N/s=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (402, N'HI38Z1OVx+o1jmeddOtmbOTyVAlsEBT6vOcIatr1/Bs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (403, N'8fJimCZ+Z1pXe2wiiV52vrxe5xHE/rGSqimDOA2Y4Yo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (404, N'23xRCOuweQGbddQZ1sy4G9xzr2Aa+d5KS+C7bl1lkwU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (405, N'8Xw/xrPTTbuEI4NG6EtAok9EliTrNcBS2WZCVOXnTNA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (406, N'fvns7kXxZ9X41X8F/bruu2ZN4TUsW6Q0ZYjhhQCY9+E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (407, N'v+fL6ZH/z9LsMaovxZlG8idj3PyTb+YYMZ5JMYD/e5E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (408, N'esOcdoW7Kmr0IFUh5hfhMRqfnO1v4avO5H8U48XvB0E=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (409, N'fvtfEKMenKOsiwjfAsQP7Y94YTBov8LN3XiSaacz8XA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (410, N'4fjo0tnLjs8YUzODgWG/3aZRBFgQHTuv3ATYiaicEiE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (411, N'IubVPb4cGn2wv33PsWMLg6BJRPkJd5Bq1PBljUU0828=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (412, N'e0eOzgf8mOXtZQ7wTL1OcazAbtRAPGhQnYdws/c/JAM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (413, N'eGa502ZmhBYtwJEoijSnr/K0W1Wass9MSNdKoHdesn4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (414, N'llzuEpAap6i2RTyKYqIyKjaP15zQkcS7/JK+WlTkpvM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (415, N't6Cdpcq6B9o/WesK/x8rAsAb4mOqNUF5tDssnx0rPzI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (416, N'3MnGv5z20iwRFqZGzvRayCjVKEiqnCcJbFnlhP+hrao=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (417, N'LdUd3dUaQY2KM47368tk0QX5B2IJAG4Kg3QgVJstjsY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (418, N'su/S/H0wNb/V3zwgDJnxETYYj8LsnZqxxItSgiK7lKs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (419, N'uz+gsMUg94VCj1cnrnVjc+dj+dz1ViqiCTWvLu+TN7o=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (420, N'7Vuj/oQrsD7vGFIYyf/lULS/GEfPgFLRgk9f/83sm04=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (421, N'ySz5ze9SvwWf0qwOJu8dvryxzkVJKSb8bmgDE3Q47+I=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (422, N'Cz3VBzZzgWNwEwl+1ODLw4aVIAF8yaNpPDQXSdc3uzU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (423, N'fVg6Jf7hN02vAc+ewuS0ZqvdjNTzXRfj0Eb7xjpWajc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (424, N'Lb54Og8I05fBJM1nNiwbCF5zN46wzuUnEogV+LG0zuQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (425, N'mb5E82Rv+S84ah+KpAmNxr00MCXCB2LM8W1jAOzN498=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (426, N'TAnNChOi1nDya9w+fU4WEr6raBjvnpcYejtnQq0z+fk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (427, N'nMKPDLQOUaumiNL7cXTtaWxy89/gvm/vwWeRrnxnoHk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (428, N'ibWJKA4jDunbxT6rTv5CZ+JjQUcwzyEDkARmJ45Twjo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (429, N'QHTwif3JZ1v8aDgY1zOn7aRGsz0apdIDwrjzCRd2kJo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (430, N'Sp6P7OpsYQYitsXRvC8SvvdX22VDJV6HDHfW3CCt1y0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (431, N'hWcU4RTS8dPlGyv+8hRMJlejQQvXnNZrWTLjxISeSGE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (432, N'HziHytHggRdzJgl6qJesTsW6uJDsWK00fGAOtrCpOzY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (433, N'F3f8GoLQMpRaTkhv2twB0uxdAUp553XMM3e8lwUHSdw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (434, N'dIi+Otc0wzOJPWSRdtgSdKoxlq1U9Gx98/Jk+4Mupok=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (435, N'bOz1jBPEQYR4348yKfc+oMXlLoYn+Bg0RLMOrzSo+OA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (436, N'fgBtXIGFa7mVgQAhz929KdeTIsszQ6ARmWxXvBQsews=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (437, N'5K1Ryz6EK3ctEhVy9lFlGYG/z6eHeBK2Op/IZ1v6v48=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (438, N'023vykH7r7ANHh4wOaVO1bLtzjtkKQo4iuEyMJeeO20=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (439, N'VWS03JlkXfnNTLJZiGVA4HL6KLm6k8PXe43vxqXSC1M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (440, N'1FrfsBj/n3/xECO7HCMGVZCvTZ6GHZ6eE8zN3KZDd00=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (441, N'0njGgCE2+15R5JgV/wgk0kSQxO4ESZKPbDTGi6qmHn0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (442, N'Q86qOGhyUO3ljov2KzIwAPTf3eDg+19GlGr2dHeNfh4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (443, N'eXMXtIEp4q0GFKVtLw9pEopspm4Y7Jir2KGaaqRozsA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (444, N'xRXiYfB+atUJL3V4QUX6PUKRxQnej/5nG/MmlMp8vQ8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (445, N'kIRQjXsRmnEO8DGlgBEqcUeeHmUtSVZeQU3nZwMFk30=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (446, N'6U0655ka9J8H8zIA5uk+LD/+IcPIeFxEqwARDM4ZeA4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (447, N'lrWeD3hfxhP2LFRAUD7SKuUMWNloQILYfY7OoZhimyg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (448, N'aZGV0v+qPC7ZU8Hzm2GFz8Kxeucx7sWuilIBYdJbJRc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (449, N'u1DCYUIqa/Lsdct33Un/HJfTBCgJo0UpjsmT+g8Y9aU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (450, N'5MRWiRaH9UM4RfkvNd6mwvirDY6sn8HCI1A+40s6P/4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (451, N'kHaI9T6jBG341nJscoH/lBYayePP/QowGoqf+xZ8t2M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (452, N'1H1vUQcaYgELPIT6OxfHhsEoi9JOEOm9/7OkE3kpcgo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (453, N'dW3bdRp2cMiinz2M/BUlOJfl3H+QHI9tpZEw93D/qb0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (454, N'B5UJW1LoSdla83IdaTFLGG9/QnL2m34+E9MCWNzPxJU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (455, N'RtMZUzTiucQav2Frpim2X5uQnAWLTqCXIXcgYKSfEQU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (456, N'+Kh/Txx9o/wIIpbiGWtOm2Gdxmu7j9YF5SJ0qlIFHwA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (457, N'lNcmCm7cDAGmWXUxZBYpfwhK9C2obxDwjIa5szMYDXA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (458, N'k47ws6Os8Fj8MsoC2o+YUUCtDvH9OTnWbAfhk7EX3YM=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (459, N'FSmLtEmsKDFBxB79h03+02fjkAEF8Qxf8UcBopfBocQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (460, N'NZdaeXtrfZQDPqh71Hua/R66BrMYBMe7Y0hDGKpwSVI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (461, N'Mefk/RNS+uGhuTmwmVqHthgNu7CwrJCZE1GeqUU5IyQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (462, N'SzwN0/LD788hum3uZVUTqAgtu1p9PyyLjFMwhnoCy9Y=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (463, N'qrstN1NA7HjxxRm7JzNhmMPYlxHFwrHpFGvCovkTSFk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (464, N'Szu4EHNeVccurtlG2zp9uw2zy5VBp88yxq2fuzbLwSY=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (465, N'jhSVFLIUEjPd8z0HB41Lzd4KiIdr1ECk+a3rlpUb+Fc=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (466, N'/LJbv5V7ZJnkjW2Eb3Ft7CKRFGY1n6a8zWFcfTihdgA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (467, N'+YW2shWgH6yAUqmR2kIH44qmG6enlSQaR8sDS1JjIqA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (468, N'HNSVtCWSDP/FNSuQi+BIgRwcpYRMxnUlw/iwI3/5qj8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (469, N'1A8Ox6KRiwK/yx5U86ACnGQi8ePppvOSB1PT7krQPAk=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (470, N'AJt2J4lADDc2S4yInWZav4ZreZsrn315Hjpgih7kqOQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (471, N'czqVwofBTfRYKGxDfB9zDxSkgdYP2tMGC/BqBcpFS5A=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (472, N'NRzxPoTPJ2mj2kJ9kDqPScgaiBZ+KqyjI80eri35R98=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (473, N'b4v6klRyOGKJ9MOFugw2bzAOZweUyUMC/UigsLbhuX0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (474, N'TS7y3ea5wsf8bE1iQu5RYF3wcikpXartZHr1VKF6Xrw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (475, N'ZDxuID5/8a6CVC5dND5qJ0q52G7Vw6tJggfyPDv06L8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (476, N'qSthYZtRfo3ijfho9HUIIXS/aP+3nzF7oCDDKcWINc4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (477, N'dgAMzAQyVR/cQ8U7qo4Dq2yjnjorHBLSXP3rApBzPuQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (478, N'bMxE9P4lyZZyNpjxhw6T/azM+vpnRwkSW2ky4G2Uc+8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (479, N'wA6usE70jP+/D0zorO7wrEG260k7+tl5kMIDpYlL/Sw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (480, N'AiMt3qBLLJmZ4b8N2zfWSy3531RVBOK6UynEsTa1J94=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (481, N'9/Qc1CGJZliw0+DKXqP1jFm6vivWUHPJZMikd9egBc0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (482, N'Am+Ogk7H6qj7GDLg6j0NWfosi0LgUxyHY8hAtUW7CIA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (483, N'5gCfAi+SAnLyrv22gsDE0OXz5XAFd7hg64D9B/K99IQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (484, N'RerEfPSAsZjL96yrg/J8LE+gm20i3IVh1zYsLRrHjBI=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (485, N'zQVUMT9Lo7lFjEmHNL7ixCq24DLt7sEmQ+c7MjXwfYA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (486, N'RHLEPWhOY461s02Ny6lmiPN9boJqk7E8hC8oA35AFnE=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (487, N'1dIw6vQensJvsgL3GBj7b4imarpUVFQiiW15g7Lm1KU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (488, N'+v6AOa174KUE88bfgTYQk2cjkxs0tgp5U0AA9aSr074=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (489, N'jRp2Z0uhxpyjNUZKKy44nCk45y2H8ESUQZ/3dGhsIRQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (490, N'bj8h+CaJDsE0b31i0XfEM+++0Pftgraln6HtEUa0sBA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (491, N'ZtyadL1FSRH/rGmxMbvowaYVlt3TJujfc2yJlRIm5zw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (492, N'K2622eahNUCm2KKlGhAtHV7AsYdDp7t/kKKreacd0ok=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (493, N'Ni4ucwK58Tul28+SEfHrocO908kFJQy5/Kj7nImZ/fs=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (494, N'gXWZhFan8SvJVfhHLkw4D1ceEbftvABZij6162o9Xkw=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (495, N'XpwfgIsRd9nMNHZAHfetrByoVk2sKKsYk4tCSdIyPIo=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (496, N'C0yuDBgx64aPYGzHHQkh9wLcZYpwOh/sFpWanGjFsyU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (497, N'6dtHrtu1Wh2aCsLKZFJfx5f1dvGj5SViT1Vet92Dc1M=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (498, N'7U2ZrA1PNrdSw4eOL2m2RKJdmtvQFbNeijRYpck8wt0=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (499, N'PauuopjVSQa+beQhqZrfSBhzYoj8eOkTT56T4zyE4Kg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (500, N'K1ctBcA5Cg363SQMECmiTKYXMu+Tzo05zTtYJfJGaL4=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (501, N'3ZcP/sqfrDi4wunoKVL6kgpYMKlz4f6n9RINCfLs3g8=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (502, N'H0dTyv40GAJIDzFXcCeWzjEJxjtT8DX4+mEkb6vXUQQ=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (503, N'cNt5H+2GtMuTq7dc9odp6KMZfxbEDMEb7XkeoxZGjHA=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (504, N'w+mBcdvErx2JpTE9K/9/eINH1n8FBCSxDOobER9lkQU=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (505, N'YHQneHrblJ+eXE9llxF6xzTgtOYpYVi9VSA7aSb/Epg=', N'wpxMeocoxOYNEGmnJrNSTA==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (506, N'uI8TvDtz5wO0cv4y4qUmz4dnaV6qKx8A7JsQwic6ED0=', N'wKZiR80jDVf2f3FQkLGogw==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (507, N'+xkojMKJaKK9FmBh2puDWzhz0aPonSt7xMIUQz7o/9Y=', N'e7hNSIR8WSboR4mVA2fg2A==')
GO
INSERT [dbo].[Users] ([Id], [Mail], [Username]) VALUES (508, N'kMRG9nQUPn5DMDSnuL6qh6iqd86iPdMPHLguJTUeiCA=', N'vMugtViOLZiaoxQ/n8DVtw==')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BinTypes__737584F6948C620B]    Script Date: 29-06-2021 10:10:57 ******/
ALTER TABLE [dbo].[BinTypes] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Trash__177800D385720AE8]    Script Date: 29-06-2021 10:10:57 ******/
ALTER TABLE [dbo].[Trash] ADD UNIQUE NONCLUSTERED 
(
	[Barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__UserAuth__73B51CB945797E73]    Script Date: 29-06-2021 10:10:57 ******/
ALTER TABLE [dbo].[UserAuthentication] ADD UNIQUE NONCLUSTERED 
(
	[User_FK_Users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  DEFAULT (NULL) FOR [ExceptionType]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  DEFAULT (NULL) FOR [ExceptionMessage]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_Users_UserId]
GO
ALTER TABLE [dbo].[Trash]  WITH CHECK ADD FOREIGN KEY([BinId])
REFERENCES [dbo].[BinTypes] ([Id])
GO
ALTER TABLE [dbo].[Trash]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAuthentication]  WITH CHECK ADD FOREIGN KEY([User_FK_Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[SPCreateNewUser]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCreateNewUser] 
	@Username nvarchar(250),
	@Email nvarchar(250),
	@Password nvarchar(250),
	@Salt nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InsertedUserID INT;

	INSERT INTO [Users] ([Username], [Mail]) 
	VALUES (@Username, @Email)
	SET @InsertedUserID = SCOPE_IDENTITY()
	
	INSERT INTO [UserAuthentication] ([User_FK_Users_Id],[Password],[Salt]) 
	VALUES (@InsertedUserID,@Password, @Salt);

	SELECT @InsertedUserID;
END
GO
/****** Object:  StoredProcedure [dbo].[SPCreateTrash]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCreateTrash] 
(
	@Barcode nvarchar(50),
	@BinTypeID int,
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InsertedTrashID INT;

	INSERT INTO Trash
		(Barcode, BinId, UserId)
	VALUES 
		(@Barcode, @BinTypeID, @UserID)
	SET @InsertedTrashID = SCOPE_IDENTITY();

	
	SELECT * FROM Trash WHERE Id = @InsertedTrashID;

END
GO
/****** Object:  StoredProcedure [dbo].[SPGetAllBinTypes]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SPGetAllBinTypes]
AS  
BEGIN  
    SET NOCOUNT ON;  

	SELECT * 
	FROM BinTypes
	ORDER BY Id

END  
GO
/****** Object:  StoredProcedure [dbo].[SPGetBinTypeById]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetBinTypeById] 
(
	@Id INT
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM BinTypes WHERE Id = @Id;

END
GO
/****** Object:  StoredProcedure [dbo].[SPGetTrashByBarcode]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetTrashByBarcode] 
(
	@Barcode nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Trash WHERE Barcode = @Barcode;

END
GO
/****** Object:  StoredProcedure [dbo].[SPGetUserByLoginName]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetUserByLoginName]
(
	@LoginName VARCHAR(150)
)  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
  
    -- Select statements for procedure here  
    Select * from Users where Mail = @LoginName;  
END  
GO
/****** Object:  StoredProcedure [dbo].[SPGetUserByToken]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetUserByToken]
(
	@Token VARCHAR(150)
)
AS  
BEGIN  
    SET NOCOUNT ON;  

	DECLARE @userID INT;

	SET @userID = (
		select UserId 
		from RefreshToken
		where Token = @Token 
	);

	SELECT * 
	FROM Users
	WHERE Id = @userID
END  
GO
/****** Object:  StoredProcedure [dbo].[SPLogError]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPLogError] 
(
	@ErrorMessage VARCHAR(250),
	@ExceptionType VARCHAR(250),
	@ExceptionMessage VARCHAR(MAX)
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InsertedErrorID INT;

	INSERT INTO ErrorLogs
		(ErrorMessage, ExceptionType, ExceptionMessage)
	VALUES 
		(@ErrorMessage, @ExceptionType, @ExceptionMessage)
	SET @InsertedErrorID = SCOPE_IDENTITY();

	SELECT * FROM ErrorLogs WHERE Id = @InsertedErrorID;
END
GO
/****** Object:  StoredProcedure [dbo].[SPUserEmailIsUnique]    Script Date: 29-06-2021 10:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUserEmailIsUnique]
(
	@Email AS varchar(150)
)
AS
BEGIN
	  SET NOCOUNT ON;
 
      IF EXISTS(SELECT 1 FROM Users WHERE Mail = @Email)
      BEGIN
            select 1
      END
      ELSE
      BEGIN
            select 0
      END

END;
GO
USE [master]
GO
ALTER DATABASE [TrashPlusPlus] SET  READ_WRITE 
GO
