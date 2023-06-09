USE [master]
GO
/****** Object:  Database [DMV]    Script Date: 5/13/2023 3:15:59 PM ******/
CREATE DATABASE [DMV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DMV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMV] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMV] SET RECOVERY FULL 
GO
ALTER DATABASE [DMV] SET  MULTI_USER 
GO
ALTER DATABASE [DMV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMV', N'ON'
GO
ALTER DATABASE [DMV] SET QUERY_STORE = OFF
GO
USE [DMV]
GO
/****** Object:  User [TonyW]    Script Date: 5/13/2023 3:15:59 PM ******/
CREATE USER [TonyW] FOR LOGIN [TonyW] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 5/13/2023 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarId] [varchar](12) NOT NULL,
	[OperatorId] [varchar](12) NOT NULL,
	[CarPlateNum] [varchar](12) NOT NULL,
	[CarMake] [varchar](155) NOT NULL,
	[CarModel] [varchar](155) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infract]    Script Date: 5/13/2023 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infract](
	[InfractId] [varchar](12) NOT NULL,
	[InfractType] [varchar](155) NOT NULL,
 CONSTRAINT [PK_Infract] PRIMARY KEY CLUSTERED 
(
	[InfractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfractLink]    Script Date: 5/13/2023 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfractLink](
	[UserId] [varchar](12) NOT NULL,
	[OperatorId] [varchar](12) NOT NULL,
	[InfractId] [varchar](12) NOT NULL,
	[CarId] [varchar](12) NOT NULL,
 CONSTRAINT [PK_InfractLink] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[OperatorId] ASC,
	[InfractId] ASC,
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operator]    Script Date: 5/13/2023 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operator](
	[OperatorId] [varchar](12) NOT NULL,
	[OperatorFirstName] [varchar](155) NOT NULL,
	[OperatorLastName] [varchar](155) NOT NULL,
	[OperatorSocial] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Operator] PRIMARY KEY CLUSTERED 
(
	[OperatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/13/2023 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [varchar](12) NOT NULL,
	[UserFirstName] [varchar](155) NOT NULL,
	[UserLastName] [varchar](155) NOT NULL,
	[UserEmployer] [varchar](155) NOT NULL,
	[UserName] [varchar](155) NOT NULL,
	[UserPassword] [varchar](155) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'1', N'1', N'N98-325', N'Camry', N'Toyota')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'10', N'10', N'Z78-343', N'Hyundai', N'Ioniq5')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'11', N'1', N'CSS-987', N'Cooper', N'Mini Cooper')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'2', N'2', N'P56-756', N'Toyota', N'Corolla')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'3', N'3', N'R32-145', N'Volkswagon', N'Volkswagon')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'4', N'4', N'Q13-890', N'Dodge', N'Dodge')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'5', N'5', N'B98-567', N'Mitsubishi', N'Mitsubishi')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'6', N'6', N'T48-155', N'Mitsubishi', N'Toyota')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'7', N'7', N'S58-426', N'Ford', N'Fusion')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'8', N'8', N'L28-114', N'Chevy', N'Malibu')
INSERT [dbo].[Car] ([CarId], [OperatorId], [CarPlateNum], [CarMake], [CarModel]) VALUES (N'9', N'9', N'V68-321', N'Chevy', N'Impala')
GO
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'1', N'Speeding')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'10', N'Failure To Stop For A Bus')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'2', N'DUI')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'3', N'Inattentive Driving')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'4', N'One-Way Violation')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'5', N'Reckless Driving')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'6', N'Failure To Merge For Emerg Vehicle')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'7', N'Failure To Use Turn Signals')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'8', N'Failure To Come To Complete Stop')
INSERT [dbo].[Infract] ([InfractId], [InfractType]) VALUES (N'9', N'Running Red Light')
GO
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'1', N'1', N'1', N'1')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'10', N'10', N'10', N'10')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'2', N'2', N'2', N'2')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'3', N'3', N'3', N'3')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'4', N'4', N'4', N'4')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'5', N'5', N'5', N'5')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'6', N'6', N'6', N'6')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'7', N'7', N'7', N'7')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'8', N'8', N'8', N'8')
INSERT [dbo].[InfractLink] ([UserId], [OperatorId], [InfractId], [CarId]) VALUES (N'9', N'9', N'9', N'9')
GO
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'1', N'Tony', N'Wills', N'411284322')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'10', N'Bloof', N'Bloggin', N'123456789')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'2', N'Alexis', N'Wills', N'412284522')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'3', N'Isaiah', N'Wills', N'417875564')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'4', N'Jaime', N'Wills', N'498761234')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'5', N'Dylan', N'Edwards', N'876123298')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'6', N'Kevin', N'Guiterrez', N'874423298')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'7', N'Joe', N'Silman', N'918784176')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'8', N'John', N'Wood', N'321435553')
INSERT [dbo].[Operator] ([OperatorId], [OperatorFirstName], [OperatorLastName], [OperatorSocial]) VALUES (N'9', N'George', N'Bakken', N'589763455')
GO
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'1', N'Tony', N'Wills', N'Google Inc.', N'TonyWillsGoogle', N'tonywillspassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'10', N'Boof', N'Sploot', N'CIA', N'BoofSCIA', N'boofciapassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'11', N'zing', N'zing', N'macros inc', N'zingzing123', N'zingzingpass')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'12', N'homer', N'simpson', N'abc', N'homesimp', N'homesimp123')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'2', N'Alexis', N'Wills', N'Trashmaster Inc.', N'AlexisWillsTrashmaster', N'alexispassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'3', N'Isaiah', N'Wills', N'Centracare', N'IsaiahWillsCentracare', N'isaiahwillspassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'4', N'Jaime', N'Wills', N'Medical Billing Co', N'JaimeWillsBilling', N'jaimewillspassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'5', N'Dylan', N'Edwards', N'SCTCC', N'DylanEdwardsSctcc', N'dylanedwardspassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'6', N'Kevin', N'Guiterrez', N'SCTCC', N'KevinGSctcc', N'kevingpassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'7', N'Joe', N'Silman', N'SCTCC', N'JoeSilmanSctcc', N'joepassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'8', N'John', N'Wood', N'SCTCC', N'Kcc', N'woodpassword')
INSERT [dbo].[Users] ([UserId], [UserFirstName], [UserLastName], [UserEmployer], [UserName], [UserPassword]) VALUES (N'9', N'George', N'Bakken', N'SCTCC', N'GeorgieBSctcc', N'georgiebpassword')
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[Operator] ([OperatorId])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Operator]
GO
ALTER TABLE [dbo].[InfractLink]  WITH CHECK ADD  CONSTRAINT [FK_InfractLink_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([CarId])
GO
ALTER TABLE [dbo].[InfractLink] CHECK CONSTRAINT [FK_InfractLink_Car]
GO
ALTER TABLE [dbo].[InfractLink]  WITH CHECK ADD  CONSTRAINT [FK_InfractLink_Infract] FOREIGN KEY([InfractId])
REFERENCES [dbo].[Infract] ([InfractId])
GO
ALTER TABLE [dbo].[InfractLink] CHECK CONSTRAINT [FK_InfractLink_Infract]
GO
ALTER TABLE [dbo].[InfractLink]  WITH CHECK ADD  CONSTRAINT [FK_InfractLink_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[Operator] ([OperatorId])
GO
ALTER TABLE [dbo].[InfractLink] CHECK CONSTRAINT [FK_InfractLink_Operator]
GO
ALTER TABLE [dbo].[InfractLink]  WITH CHECK ADD  CONSTRAINT [FK_InfractLink_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[InfractLink] CHECK CONSTRAINT [FK_InfractLink_User]
GO
USE [master]
GO
ALTER DATABASE [DMV] SET  READ_WRITE 
GO
