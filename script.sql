USE [master]
GO
/****** Object:  Database [SupportSystemDb]    Script Date: 8.02.2022 05:22:18 ******/
CREATE DATABASE [SupportSystemDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SupportSystemDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SupportSystemDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SupportSystemDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SupportSystemDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SupportSystemDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SupportSystemDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SupportSystemDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SupportSystemDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SupportSystemDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SupportSystemDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SupportSystemDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SupportSystemDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SupportSystemDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SupportSystemDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SupportSystemDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SupportSystemDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SupportSystemDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SupportSystemDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SupportSystemDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SupportSystemDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SupportSystemDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SupportSystemDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SupportSystemDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SupportSystemDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SupportSystemDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SupportSystemDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SupportSystemDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SupportSystemDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SupportSystemDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SupportSystemDb] SET  MULTI_USER 
GO
ALTER DATABASE [SupportSystemDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SupportSystemDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SupportSystemDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SupportSystemDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SupportSystemDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SupportSystemDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SupportSystemDb', N'ON'
GO
ALTER DATABASE [SupportSystemDb] SET QUERY_STORE = OFF
GO
USE [SupportSystemDb]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8.02.2022 05:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mails]    Script Date: 8.02.2022 05:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Detail] [varchar](max) NULL,
	[CategoryID] [int] NULL,
	[ReadStatus] [bit] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Mails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8.02.2022 05:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Cat_Auth]    Script Date: 8.02.2022 05:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Cat_Auth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_User-Cat-Auth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8.02.2022 05:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (3, N'Food')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (4, N'Drink')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (5, N'Sweets')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (6, N'Breads')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Mails] ON 

INSERT [dbo].[Mails] ([ID], [Title], [Detail], [CategoryID], [ReadStatus], [Date]) VALUES (5, N'DELICIOUS', N'FOODS DETAİLS', 3, 0, CAST(N'2022-02-04T14:28:45.160' AS DateTime))
INSERT [dbo].[Mails] ([ID], [Title], [Detail], [CategoryID], [ReadStatus], [Date]) VALUES (6, N'Food1', N'Nice Food', 3, 0, CAST(N'2022-02-04T17:42:49.303' AS DateTime))
INSERT [dbo].[Mails] ([ID], [Title], [Detail], [CategoryID], [ReadStatus], [Date]) VALUES (7, N'asdasdas', N'adssadsd', 3, 0, CAST(N'2022-02-07T04:35:14.720' AS DateTime))
INSERT [dbo].[Mails] ([ID], [Title], [Detail], [CategoryID], [ReadStatus], [Date]) VALUES (8, N'adfadfa', N'asdfadfda', 3, 0, CAST(N'2022-02-07T04:37:02.900' AS DateTime))
INSERT [dbo].[Mails] ([ID], [Title], [Detail], [CategoryID], [ReadStatus], [Date]) VALUES (9, N'asfdaf', N'dafdafad', 3, 0, CAST(N'2022-02-07T04:50:49.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mails] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([ID], [RoleName]) VALUES (2, N'personal')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Cat_Auth] ON 

INSERT [dbo].[User_Cat_Auth] ([ID], [UserID], [CategoryID]) VALUES (3, 7, 3)
INSERT [dbo].[User_Cat_Auth] ([ID], [UserID], [CategoryID]) VALUES (4, 6, 3)
SET IDENTITY_INSERT [dbo].[User_Cat_Auth] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [LastName], [Email], [Password], [RoleID]) VALUES (5, N'Admin', N'Admin', N'admin@admin.com', N'12345', 1)
INSERT [dbo].[Users] ([ID], [Name], [LastName], [Email], [Password], [RoleID]) VALUES (6, N'Yusuf ', N'Kurtulus', N'yusuf@somemail.com', N'12345', 2)
INSERT [dbo].[Users] ([ID], [Name], [LastName], [Email], [Password], [RoleID]) VALUES (7, N'Test1', N'Test1', N'test1@somemail.com', N'12345', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Mails] ADD  CONSTRAINT [DF_Mails_ReadStatus]  DEFAULT ((0)) FOR [ReadStatus]
GO
ALTER TABLE [dbo].[Mails] ADD  CONSTRAINT [DF_Mails_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Mails]  WITH CHECK ADD  CONSTRAINT [FK_Mails_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Mails] CHECK CONSTRAINT [FK_Mails_Category]
GO
ALTER TABLE [dbo].[User_Cat_Auth]  WITH CHECK ADD  CONSTRAINT [FK_User-Cat-Auth_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[User_Cat_Auth] CHECK CONSTRAINT [FK_User-Cat-Auth_Category]
GO
ALTER TABLE [dbo].[User_Cat_Auth]  WITH CHECK ADD  CONSTRAINT [FK_User-Cat-Auth_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[User_Cat_Auth] CHECK CONSTRAINT [FK_User-Cat-Auth_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [SupportSystemDb] SET  READ_WRITE 
GO
