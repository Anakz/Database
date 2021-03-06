USE [master]
GO
/****** Object:  Database [DB_HOTEL_MANAGEMENT]    Script Date: 12/01/2022 20:40:22 ******/
CREATE DATABASE [DB_HOTEL_MANAGEMENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HOTEL_MANAGEMENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_HOTEL_MANAGEMENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_HOTEL_MANAGEMENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_HOTEL_MANAGEMENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HOTEL_MANAGEMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_HOTEL_MANAGEMENT', N'ON'
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET QUERY_STORE = OFF
GO
USE [DB_HOTEL_MANAGEMENT]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/01/2022 20:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id_Comment] [int] IDENTITY(1,1) NOT NULL,
	[Opinion] [bit] NOT NULL,
	[Comment] [varchar](400) NOT NULL,
	[Date_Comment] [datetime] NOT NULL,
	[Id_user] [int] NOT NULL,
	[Id_Hotel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 12/01/2022 20:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Id_Hotel] [int] IDENTITY(1,1) NOT NULL,
	[Name_Hotel] [varchar](20) NOT NULL,
	[Address_Hotel] [varchar](100) NOT NULL,
	[City_Hotel] [varchar](40) NOT NULL,
	[Stars] [int] NOT NULL,
	[Id_user] [int] NULL,
	[Description_Hotel] [varchar](400) NOT NULL,
	[Image_Hotel] [varchar](2000) NULL,
	[Number_Room] [int] NULL,
	[Telephone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Hotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12/01/2022 20:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id_Reservation] [int] IDENTITY(1,1) NOT NULL,
	[Date_Begin] [datetime] NOT NULL,
	[Date_End] [datetime] NOT NULL,
	[Date_Reservation] [datetime] NOT NULL,
	[Bill] [float] NOT NULL,
	[Id_user] [int] NOT NULL,
	[Id_Room] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Reservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 12/01/2022 20:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id_Room] [int] IDENTITY(1,1) NOT NULL,
	[Type_Room] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Id_Hotel] [int] NOT NULL,
	[Image_Room] [varchar](2000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/01/2022 20:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id_user] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NOT NULL,
	[Email] [varchar](60) NOT NULL,
	[Pwd] [varchar](200) NULL,
	[Roles] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [Date_Comment]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [Date_Begin]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [Date_Reservation]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Roles]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_Ct_IdC_IdH] FOREIGN KEY([Id_Hotel])
REFERENCES [dbo].[Hotels] ([Id_Hotel])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_Ct_IdC_IdH]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_Ct_IdC_IdU] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id_user])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_Ct_IdC_IdU]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [fk_Ht_IdH] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id_user])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [fk_Ht_IdH]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [fk_Rs_IdR_IdR] FOREIGN KEY([Id_Room])
REFERENCES [dbo].[Rooms] ([Id_Room])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [fk_Rs_IdR_IdR]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [fk_Rs_IdR_IdU] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id_user])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [fk_Rs_IdR_IdU]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [fk_Rm_IdR_IdU] FOREIGN KEY([Id_Hotel])
REFERENCES [dbo].[Hotels] ([Id_Hotel])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [fk_Rm_IdR_IdU]
GO
USE [master]
GO
ALTER DATABASE [DB_HOTEL_MANAGEMENT] SET  READ_WRITE 
GO
