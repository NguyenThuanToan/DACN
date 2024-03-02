USE [master]
GO
/****** Object:  Database [Transport]    Script Date: 12/16/2023 1:13:24 AM ******/
CREATE DATABASE [Transport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Transport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ASUS\MSSQL\DATA\Transport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Transport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ASUS\MSSQL\DATA\Transport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Transport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Transport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Transport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Transport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Transport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Transport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Transport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Transport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Transport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Transport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Transport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Transport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Transport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Transport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Transport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Transport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Transport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Transport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Transport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Transport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Transport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Transport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Transport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Transport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Transport] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Transport] SET  MULTI_USER 
GO
ALTER DATABASE [Transport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Transport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Transport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Transport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Transport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Transport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Transport] SET QUERY_STORE = OFF
GO
USE [Transport]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Adv]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Adv](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Type] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_tb_Adv] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Category]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Position] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](550) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tb_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Contact]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [varchar](50) NULL,
	[Message] [nvarchar](150) NULL,
	[IsRead] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_tb_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Feedback]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [int] NULL,
	[Comment] [nvarchar](550) NULL,
	[FullName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
 CONSTRAINT [PK_tb_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_New]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_New](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](250) NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](4000) NULL,
	[Detail] [nvarchar](max) NULL,
	[Image] [nvarchar](550) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](550) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tb_New] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Order]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderName] [nvarchar](250) NULL,
	[SenderPhone] [nvarchar](250) NULL,
	[SenderAddress] [nvarchar](250) NULL,
	[ReceiverName] [nvarchar](250) NULL,
	[ReceiverPhone] [nvarchar](250) NULL,
	[ReceiverAddress] [nvarchar](250) NULL,
	[ItemCode] [nvarchar](250) NULL,
	[ItemName] [nvarchar](250) NULL,
	[ItemQuantity] [int] NULL,
	[ItemWeight] [decimal](18, 2) NULL,
	[ItemValue] [decimal](18, 2) NULL,
	[Length] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[Height] [decimal](18, 2) NULL,
	[PaymentMethodCod] [decimal](18, 2) NULL,
	[Payer] [nvarchar](250) NULL,
	[PickUpRequest] [nvarchar](250) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[IsActive] [nvarchar](250) NULL,
	[DriverId] [nvarchar](max) NULL,
	[Title] [nvarchar](250) NULL,
	[w_id] [int] NULL,
 CONSTRAINT [PK_tb_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Post]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](4000) NULL,
	[Detail] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](550) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifierBy] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tb_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Recruitment]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Recruitment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](250) NULL,
	[CCCDorCMND] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[ImageDriver] [nvarchar](250) NULL,
	[IsRead] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Recruitment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_shipper]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_shipper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NULL,
	[AGE] [int] NULL,
	[W_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_shipping]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_shipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[shipper_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Subscribe]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Subscribe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Subscribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_warehouse]    Script Date: 12/16/2023 1:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_warehouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Province] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202304251244038_InitialCreate', N'DoAnWeb.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7F620B57239BBD813D85BA44ED2137473C13ABBA76F0B5AA21D61254A95A83441D15FD687FEA4F317CE50A264F1A68BADD84EB1C0C22287DF0C874372381CE67F7FFE35FEE1290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C5F7EFEC1FDE7FF38FF185173E599F4BBA1346072D493AB11F288D4F1D27751F7088D251E8BB4994460B3A72A3D0415EE41C1F1EFEDB393A723040D8806559E38F19A17E88F30FF89C46C4C531CD50701D7938487939D4CC7254EB0685388D918B27F6797446FE8BE7A382D2B6CE021F8114331C2C6C0B1112514441C6D34F299ED12422CB590C0528B87F8E31D02D5090622EFBE98ABC6B370E8F59379C55C312CACD521A853D018F4EB85E1CB9F95ADAB52BBD81E62E40C3F499F53AD7DEC4BEF2705EF4310A400132C3D3699030E2897D5DB1384BE31B4C4765C35101799900DC6F51F27554473CB03AB73BA8ECE87874C8FE1D58D32CA059822704673441C1817597CD03DFFD193FDF475F31999C1CCD1727EFDEBC45DEC9DB7FE19337F59E425F814E2880A2BB248A7102B2E145D57FDB72C4768EDCB06A566B5368056C09A6846D5DA3A70F982CE9034C96E377B675E93F61AF2CE1C6F589F83083A0114D32F8BCC98200CD035CD53B8D3CD9FF0D5C8FDFBC1D84EB0D7AF497F9D04BFC61E22430AF3EE220AF4D1FFCB8985EC2787FE164974914B26FD1BE8ADA2FB3284B5CD699C848728F9225A6A274636765BC9D4C9A410D6FD625EAFE9B369354356F2D29EBD03A33A164B1EDD950CAFBB27C3B5BDC591CC3E0E5A6C534D26470E24635925A1E58BC7E6532475D4D864057FECE2BE04588FC608025B00317F03C167E12E2AA973F46607088F496F90EA529AC00DE7F50FAD0203AFC1C40F41976B3040C73465118BF38B7BB8788E09B2C9C337BDF1EAFC186E6FEB7E812B9344A2E086BB531DE87C8FD1A65F48278E788E24FD42D01D9E7BD1F760718449C33D7C5697A09C68CBD69048E75097845E8C9716F38B638EDDA059906C80FF53E88B48C7E2949577E889E42F1450C643A7FA449D40FD1D227DD442D49CDA21614ADA272B2BEA232B06E92724AB3A03941AB9C05D5601E5E3E42C3BB7839ECFEFB789B6DDEA6B5A0A6C619AC90F8274C7002CB98778728C509598D4097756317CE423E7C8CE98BEF4D39A7CF28C88666B5D66CC81781E167430EBBFFB32117138A1F7D8F79251D0E3E2531C077A2D79FA9DAE79C24D9B6A783D0CD6D33DFCE1A609A2E67691AB97E3E0B34212F1EB010E5071FCE6A8F5E14BD912320D03130749F6D7950027DB365A3BA25E738C0145B676E11129CA2D4459EAA46E890D743B07247D508B68A8488C2FD53E109968E13D608B143500A33D527549D163E71FD1805AD5A925A76DCC258DF2B1E72CD398E31610C5B35D185B93EF0C104A8F84883D2A6A1B153B3B866433478ADA6316F736157E3AEC423B662932DBEB3C12EB9FFF62286D9ACB12D1867B34ABA08600CE2EDC240F959A5AB01C807977D3350E9C4643050EE526DC540458DEDC0404595BC3A032D8EA85DC75F3AAFEE9B798A07E5ED6FEB8DEADA816D0AFAD833D32C7C4F6843A1054E54F33C9FB34AFC4435873390939FCF52EEEACA26C2C067988A219B95BFABF5439D6610D9889A005786D602CAAFFF14206542F510AE8CE5354AC7BD881EB065DCAD1196AFFD126CCD0654ECFA35688DD07C592A1B67A7D347D5B3CA1A1423EF7458A8E1680C425EBCC48E77508A292EAB2AA68B2FDCC71BAE758C0F4683825A3C578392CACE0CAEA5D234DBB5A473C8FAB8641B6949729F0C5A2A3B33B896B88DB62B49E314F4700B365291B8850F34D9CA4847B5DB547563A7C88CE20563C7904235BE4671EC93652DA58A9758B3229F6AFAFDAC7FB2515860386EAAC939AAA4AD38D128414B2CD5026B90F4D24F527A8E289A2316E7997AA142A6DD5B0DCB7FC9B2BE7DAA8358EE032535FB5DB4902EED857D56754478FB4BE85DC8BC993C84AE197B7D738BA5B7A100259AA8FD340AB290989D2B73EBE2EEAEDEBE285111C68E24BFE23C299A525C5C51ED9D06459D10030C50E5B7AC3F48660893AA4BAFB3AE6C93276A46290353751453B06A67836672603A0F94EC17F61FA7568497994F3C19A50EC08B7A62D4F21914B05A5D775431E5A48E29D6744794F24AEA9052550F29EBD9238290F58AB5F00C1AD55374E7A0E68BD4D1D5DAEEC89ACC913AB4A67A0D6C8DCC725D77544D72491D5853DD1D7B9569222FA07BBC63194F2B6B6D59C56176B33DCB80F132ABE1305B5EEDCEBE0E542BEE89C56FE515305EBE9796643CD1AD654945FC62334B326098571CE1A65B5C701AAFE7CD98C2F5B5B0A8375DDF9BF1FAD9EB8B5A85729893492AEED5A14E3ABC8DF941AAFD918C72B22A486CAB54236CE8CF29C5E188118C66BF06D3C0C76CF92E09AE11F11738A545CA867D7C78742CBDB5D99F772F4E9A7A81E6206A7AFC228ED916B2AFC8234ADC0794A8B9101BBC0D59812A61E62BE2E1A789FD7BDEEA348F58B05F79F18175957E22FEAF1954DC2719B6FE50733B87C995EFF03AA312F48F57F1ECA1BBCAAF7EF952343DB06E13984EA7D6A1A4E875865F7C0CD14B9AA2E906D2ACFD44E2F5CE36E11D8216559A2DEB3F3B98FB74902707A594DF86E8E9BBBEA2699F156C84A8793A3014DE202A343D0D5807CBF82CC0834F9A3F0BE8D759FD33817544333E11F0497F30F98140F765A86CB9C37D487358DAC69294EBB935C17AA36CCB5DEF4D4A1EF646135DCDB5EE0137683EF5662ECA2BCB531E6CEBD4A4210F86BD4BBB7FF1DCE37D49375E39EDBBCD32DE666271C325D2DF2A9F780F32E034193DBBCF1ADEB6AD99A2BF7B9E7AD92F3778CF8C8D6FF3BBCF00DEB6B19902C47B6E6CBDF27CF7CCD676B57FEED8D23A6FA13BCFDA5513900CB738BA28725B566E117287E3FF3C0223283CCAE231A53E0DAC2985B585E18AC4CCD49C7F263356268EC257A16866DBAFAF7CC36FEC2CA769666BC8DA6CE2CDD7FF46DE9CA699B721177217F9C4DA6C445D8E77CB3AD69432F59AF287859EB4A4ABB7F9AC8D57F2AF295D7810A508B3C770BBFC7AB2830751C99053A74736B07A510C7B67ED6F2EC2FE9DFACB1504FB0B8C04BBC2AE59D15C9145546EDE9244258914A1B9C61479B0A59E25D45F209742350B40E7AFC1F3A01EBB069963EF8ADC6634CE28741987F34008783127A0897F9EF22CCA3CBE8DD9573A4417404C9F05EE6FC98F991F7895DC979A9890018279173CDCCBC692B2B0EFF2B942BA89484720AEBECA29BAC7611C00587A4B66E811AF231B98DF07BC44EEF32A026802691F0851EDE3731F2D1314A61C63D51E3EC186BDF0E9FDFF01E7F01ED27A540000, N'6.4.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Driver')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Member')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0f0efe48-4b7f-4c56-8ca0-7c4fec6dbb46', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'104c96b3-3531-45c4-9a6f-d9ea8285f588', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1113b1ef-0694-4626-a02a-9cf40cd79378', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8c81b269-4891-48bb-abfb-e0f9d0df9ea6', N'4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'0ab6b5d7-54e0-41b7-ac1c-a2a54965e150', N'tangbaquangminh2k2@gmail.com', 1, N'AIHtbfF7OLkA0M8onkoFhKLjDoBK9FkZ5F6KxO9bKBYcWZlpy4x8fH/H0OoBIVXSPA==', N'341e4e75-e84c-41ef-9ada-c71bb571fed6', NULL, 0, 0, NULL, 1, 0, N'tangbaquangminh2k2@gmail.com', N'Quang Minh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'0f0efe48-4b7f-4c56-8ca0-7c4fec6dbb46', N'huyhoang.29122002@gmail.com', 1, N'AHR+JY94hI4UK4H9cnl7QoP2xQXN9I0ZwcqjXDo10cpwJ8smx6Qyj91aPYmYzhmsow==', N'7b97dfb5-2487-46f1-baf9-3ff3963a45d8', NULL, 0, 0, NULL, 1, 0, N'huyhoang.29122002@gmail.com', N'Hoang')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'104c96b3-3531-45c4-9a6f-d9ea8285f588', N'huyhoang.291202@gmail.com', 1, N'APPJgDElSjKvJ+MpeoyCTiRftWcIU1KG8KZP2c0q9eve9+9Et7htaT7Dlmn0QUwhNw==', N'4c60d0be-3a1c-48f8-99c6-570a9ea118b7', N'0838365113', 0, 0, NULL, 1, 0, N'huyhoang.291202@gmail.com', N'Mai Huy Hoang')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'1113b1ef-0694-4626-a02a-9cf40cd79378', N'huyhoang.29@gmail.com', 1, N'AKfExMuOQYGMmpR4DO4eo0sMmmStbyns4R1g+4C8fiteG4joq1WPlmbfiGjuPSsTxA==', N'e3a128f1-431e-4dbd-b350-c7be7f836517', N'0367883482', 0, 0, NULL, 1, 0, N'huyhoang.29@gmail.com', N'Mai Huy Hoang')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'8c81b269-4891-48bb-abfb-e0f9d0df9ea6', N'huyhoang@gmail.com', 1, N'AMYJx1FivnMp4OdW5NH+OWUx4Jmf3c2gGPQA6Y3Trlvg/MlsMoRms3wE8B0/RmcibQ==', N'db923a5b-1691-4d56-9e1a-bd9bf238e3ff', NULL, 0, 0, NULL, 1, 0, N'huyhoang@gmail.com', N'hoanghuy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'aee7c05d-fa59-4c7a-b468-d87d5cecf53a', N'khoaho13402@gmail.com', 1, N'ACO/R00kWSTgY8PE7nAtuSs7djYA1BKQNCTokE/GQnTVnuFIMZwc6PulZujqcUO+pw==', N'677c858e-b58e-4c06-9924-e2d403d59535', NULL, 0, 0, NULL, 1, 0, N'khoaho13402@gmail.com', N'huy hoang')
GO
SET IDENTITY_INSERT [dbo].[tb_Category] ON 

INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (2, N'Trang chủ', NULL, 1, NULL, NULL, NULL, CAST(N'2023-05-16T17:46:38.473' AS DateTime), NULL, CAST(N'2023-05-16T17:46:38.473' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (3, N'Giới thiệu', NULL, 2, NULL, NULL, NULL, CAST(N'2023-05-16T17:46:56.410' AS DateTime), NULL, CAST(N'2023-05-16T17:46:56.410' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (4, N'Dịch vụ', NULL, 3, NULL, NULL, NULL, CAST(N'2023-05-16T17:47:26.910' AS DateTime), NULL, CAST(N'2023-05-28T23:04:52.900' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (5, N'Tin tức', NULL, 4, NULL, NULL, NULL, CAST(N'2023-05-16T17:47:39.943' AS DateTime), NULL, CAST(N'2023-05-28T23:04:56.273' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (6, N'Tuyển dụng', NULL, 5, NULL, NULL, NULL, CAST(N'2023-05-16T17:48:00.327' AS DateTime), NULL, CAST(N'2023-05-28T23:04:58.737' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (8, N'Liên hệ', NULL, 6, NULL, NULL, NULL, CAST(N'2023-05-28T23:05:08.920' AS DateTime), NULL, CAST(N'2023-05-28T23:05:08.920' AS DateTime), NULL, 0)
INSERT [dbo].[tb_Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (10, N'Khảo sát', NULL, 7, NULL, NULL, NULL, CAST(N'2023-06-13T18:23:02.997' AS DateTime), NULL, CAST(N'2023-06-13T18:23:02.997' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Contact] ON 

INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (1, N'Mai Huy Hoang', N'huyhoang.29122002@gmail.com', N'0367883482', N'cac', 0, CAST(N'2023-05-17T21:46:41.510' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (2, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'cc', 0, CAST(N'2023-05-17T21:48:16.453' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (3, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'cc', 0, CAST(N'2023-05-17T21:48:57.727' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (4, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'hello', 0, CAST(N'2023-05-22T01:55:29.837' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (5, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'hello', 0, CAST(N'2023-05-22T01:56:55.957' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (6, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'ádasdasdasd', 0, CAST(N'2023-05-22T01:57:07.347' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (7, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'ádasdasdasd', 0, CAST(N'2023-05-22T01:57:44.403' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (8, N'Mai Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'đơn hàng của tôi tại sao bị delay tận 2 ngày', 0, CAST(N'2023-05-25T20:51:45.117' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (9, N'hoang', N'huyhoang.299@gmail.com', N'0367883482', N'ccccccccccc', 0, CAST(N'2023-05-28T23:13:10.987' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (10, N'Lan', N'Lan2911@gmail.com', N'0123456789', N'hôm nay tôi buồn', 0, CAST(N'2023-05-29T03:35:18.513' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (11, N'Quang', N'quangneyer@gmail.com', N'0123235345', N'tk lol nhân viên Minh lỏ cặc', 0, CAST(N'2023-05-29T14:17:58.570' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (12, N'tuan anh', N'tuananh@gmail.com', N'0367883482', N'alo', 0, CAST(N'2023-06-08T16:25:14.017' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (13, N'tuan anh', N'tuananh@gmail.com', N'0367883482', N'alo', 0, CAST(N'2023-06-08T16:26:33.467' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (14, N'tuan anh', N'tuananh@gmail.com', N'0367883482', N'alo', 0, CAST(N'2023-06-08T16:26:58.550' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (15, N'tuan anh', N'tuananh@gmail.com', N'0367883482', N'alo', 0, CAST(N'2023-06-08T16:27:38.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (16, N'tuan anh', N'tuananh@gmail.com', N'0367883482', N'alo', 0, CAST(N'2023-06-08T16:27:58.697' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (17, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'asvwfeqef', 0, CAST(N'2023-06-10T20:31:43.777' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tb_Contact] ([Id], [Name], [Email], [Phone], [Message], [IsRead], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy]) VALUES (18, N'Minh', N'tangbaquangminh2k2@gmail.com', N'0123456789', N'Đơn hàng QM14062023 của tôi vẫn chưa thấy giao được', 0, CAST(N'2023-06-14T18:25:05.933' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Feedback] ON 

INSERT [dbo].[tb_Feedback] ([Id], [Answer], [Comment], [FullName], [Email]) VALUES (13, 1, N'Dịch vụ tốt', N'quang', N'QuangNguyen@gmail.com')
INSERT [dbo].[tb_Feedback] ([Id], [Answer], [Comment], [FullName], [Email]) VALUES (14, 1, N'dich vu tot', N'quang', N'tuananh@gmail.com')
SET IDENTITY_INSERT [dbo].[tb_Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_New] ON 

INSERT [dbo].[tb_New] ([Id], [Title1], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [Title], [IsActive]) VALUES (22, NULL, 3, N'Các công ty logistics và nhà hàng tại Hàn Quốc tiên phong sử dụng robot khi tình trạng thiếu hụt lao động và mức lương tối thiểu tăng cao.', N'<p>C&aacute;c c&ocirc;ng ty logistics lớn tại H&agrave;n Quốc đ&atilde; sử dụng robot vận tải để hợp l&yacute; h&oacute;a quy tr&igrave;nh xử l&yacute; v&agrave; đ&oacute;ng g&oacute;i đơn h&agrave;ng.</p>

<p>Trong khu phức hợp logistics ở th&agrave;nh phố Gunpo gần Seoul, một trong nhiều nh&agrave; kho khổng lồ của CJ Logistics, đơn vị n&agrave;y đang thực hiện c&aacute;c dịch vụ đ&oacute;ng g&oacute;i v&agrave; vận chuyển thay cho một nh&agrave; b&aacute;n lẻ trực tuyến. Tr&ecirc;n tổng diện t&iacute;ch 7.000 m2 tại nh&agrave; kho, c&oacute; 630 kệ h&agrave;ng tự động v&agrave; 101 robot n&acirc;ng v&agrave; di chuyển ch&uacute;ng với h&agrave;ng h&oacute;a.</p>

<p>Trong c&ocirc;ng đoạn đ&oacute;ng g&oacute;i v&agrave; vận chuyển th&ocirc;ng thường, c&ocirc;ng nh&acirc;n sẽ đi đến c&aacute;c kệ, lấy c&aacute;c sản phẩm đ&atilde; đặt h&agrave;ng v&agrave; để ch&uacute;ng l&ecirc;n xe. Tuy nhi&ecirc;n, CJ đ&atilde; thay đổi quy tr&igrave;nh n&agrave;y khi để c&aacute;c kệ chuyển đến tay c&ocirc;ng nh&acirc;n.</p>

<p>Theo đ&oacute;, khi một c&ocirc;ng nh&acirc;n nhập đơn đặt h&agrave;ng v&agrave;o hệ thống m&aacute;y t&iacute;nh, một kệ với c&aacute;c mặt h&agrave;ng được lựa chọn tối ưu sẽ di chuyển v&agrave;o khu vực đ&oacute;ng g&oacute;i. Sau đ&oacute;, c&ocirc;ng nh&acirc;n sẽ chọn, đ&oacute;ng g&oacute;i để vận chuyển.<br />
&nbsp;</p>

<p>Hệ thống mới, d&ugrave; thoạt nh&igrave;n c&oacute; vẻ kh&ocirc;ng hiệu quả, nhưng l&agrave; kết quả của qu&aacute; tr&igrave;nh nghi&ecirc;n cứu tại ph&ograve;ng th&iacute; nghiệm logistics của CJ. C&aacute;c sản phẩm được ph&acirc;n loại theo nhu cầu mua của người ti&ecirc;u d&ugrave;ng. Điều n&agrave;y gi&uacute;p giảm thời gian chờ đợi của c&ocirc;ng nh&acirc;n, mỗi người c&oacute; thể đ&oacute;ng g&oacute;i 23,8 hộp mỗi giờ, tăng từ 15,4 hộp trước, hiệu suất cải thiện 55%, theo CJ.</p>

<p>Mỗi ng&agrave;y CJ đ&oacute;ng g&oacute;i khoảng 1.400 loại h&agrave;ng h&oacute;a b&aacute;n ch&aacute;y bao gồm khẩu trang, chất tẩy rửa, đồ d&ugrave;ng cho trẻ em thay cho s&agrave;n thương mại điện tử Naver của H&agrave;n Quốc. Theo CJ, khả năng đ&oacute;ng g&oacute;i c&aacute;c sản phẩm được đặt từ nhiều cửa h&agrave;ng trong một chiếc hộp duy nhất cho ph&eacute;p l&agrave;m giảm chi ph&iacute; vận chuyển v&agrave; tạo sự thuận tiện cho người ti&ecirc;u d&ugrave;ng.</p>

<p>B&ecirc;n cạnh nguy khan hiếm lao động trong ng&agrave;nh logistics, mức lương tối thiểu ở H&agrave;n Quốc, đ&atilde; tăng gấp đ&ocirc;i trong thập kỷ qua v&agrave; sẽ tiếp tục tăng l&ecirc;n 9.620 won (7,39 USD) mỗi giờ v&agrave;o năm 2023. Đ&oacute; l&agrave; l&yacute; do khiến việc sử dụng robot trở n&ecirc;n tối ưu hơn với nhiều doanh nghiệp.</p>

<p>Hiện, trong ng&agrave;nh c&ocirc;ng nghiệp nh&agrave; h&agrave;ng, người phục vụ b&agrave;n robot, chuy&ecirc;n cung cấp bữa ăn tr&ecirc;n khay cho kh&aacute;ch h&agrave;ng ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến. Đầu bếp robot với khả năng chi&ecirc;n 50 con g&agrave; mỗi giờ hay nấu b&aacute;nh gạo cay cho 5 người trong khoảng 10 ph&uacute;t cũng được nhiều nh&agrave; h&agrave;ng sử dụng.</p>

<p>Gần đ&acirc;y, một m&aacute;y chủ c&agrave; ph&ecirc; robot đ&atilde; ra mắt tại một ga t&agrave;u lớn ở Seoul. C&aacute;c &quot;nh&acirc;n vi&ecirc;n&quot; pha c&agrave; ph&ecirc; robot thường l&agrave;m việc tại c&aacute;c qu&aacute;n c&agrave; ph&ecirc; nhỏ kh&ocirc;ng người phục vụ hay tại c&aacute;c ga t&agrave;u điện ngầm.</p>

<p>H&agrave;n Quốc dự kiến sẽ phải trải qua một đợt sụt giảm d&acirc;n số nhanh ch&oacute;ng trong tương lai gần v&igrave; tỷ lệ sinh của nước n&agrave;y đang thuộc nh&oacute;m thấp nhất thế giới. Do đ&oacute;, việc sử dụng robot để giảm bớt t&igrave;nh trạng thiếu lao động tại H&agrave;n Quốc trở n&ecirc;n dễ d&agrave;ng v&agrave; phổ biến hơn so với c&aacute;c quốc gia kh&aacute;c. Đồng thời, những nỗ lực của doanh nghiệp để th&iacute;ch nghi với chi ph&iacute; lao động tăng dẫn đến t&igrave;nh trạng robot được sử dụng sớm hơn trong c&aacute;c ng&agrave;nh c&ocirc;ng nghiệp.</p>

<p>Mới đ&acirc;y, một c&ocirc;ng ty H&agrave;n Quốc bắt đầu vận h&agrave;nh thử nghiệm robot vận chuyển h&agrave;ng h&oacute;a tr&ecirc;n đường c&ocirc;ng cộng. Thử nghiệm lần đầu ti&ecirc;n được đưa ra bởi Woowa Brothers, nh&agrave; điều h&agrave;nh ứng dụng giao đồ ăn tại xứ sở Kim Chi khi c&ocirc;ng ty n&agrave;y sử dụng robot giao h&agrave;ng nhỏ &quot;Dilly Drive&quot; để giao đồ ăn từ cửa h&agrave;ng đến tay kh&aacute;ch h&agrave;ng.</p>

<p>Cuối năm nay, ch&iacute;nh phủ H&agrave;n Quốc sẽ l&agrave;m r&otilde; định nghĩa ph&aacute;p l&yacute; của robot giao h&agrave;ng v&agrave; thiết lập c&aacute;c quy định an to&agrave;n v&agrave; c&aacute;c ti&ecirc;u chuẩn quản l&yacute; kh&aacute;c.Theo luật giao th&ocirc;ng hiện h&agrave;nh, robot giao h&agrave;ng được định nghĩa l&agrave; phương tiện kh&ocirc;ng người l&aacute;i, do đ&oacute;, bị cấm tr&ecirc;n vỉa h&egrave; v&agrave; đường băng qua đường. Văn bản sửa đổi ph&aacute;p l&yacute; dự kiến sẽ dỡ bỏ lệnh cấm n&agrave;y v&agrave;o năm 2023, mở đường cho việc sử dụng robot cho c&aacute;c mục đ&iacute;ch thương mại.</p>

<p>Lotte, nh&agrave; điều h&agrave;nh chuỗi 7-Eleven, bắt đầu thử nghiệm dịch vụ giao h&agrave;ng bằng robot v&agrave;o 2021 c&ugrave;ng với c&ocirc;ng ty khởi nghiệp ph&aacute;t triển robot Neubility tại Seoul. Đơn vị n&agrave;y sẽ tiếp tục nỗ lực để cải thiện độ ch&iacute;nh x&aacute;c v&agrave; độ tin cậy của robot trước thời gian sửa đổi ph&aacute;p l&yacute; dự kiến v&agrave; triển khai đồng bộ robot giao h&agrave;ng trong tương lai.</p>
', N'/Uploads/images/2a881c2c2d14e84ab105-166114155-9057-1498-1661141763.jpg', N'Logistics Hàn Quốc sử dụng robot khi khan hiếm lao động', NULL, NULL, CAST(N'2023-05-16T19:07:22.000' AS DateTime), NULL, CAST(N'2023-05-16T19:07:31.597' AS DateTime), NULL, N'Logistics Hàn Quốc sử dụng robot khi khan hiếm lao động', 1)
INSERT [dbo].[tb_New] ([Id], [Title1], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [Title], [IsActive]) VALUES (23, NULL, 3, N'Sáng 16-3, chuyến tàu đường sắt của công ty vận tải hàng hóa thuộc Tập đoàn Sơn Đông (Trung Quốc) đã đến ga ở huyện Trảng Bom (Đồng Nai), vận chuyển hàng hóa qua lại giữa hai nước Trung - Việt.', N'<img alt="Chuyến tàu hỏa chở hàng đầu tiên của Trung Quốc đến Đồng Nai - Ảnh 1." class="lightbox-content" id="img_560713451602116608" src="https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/3/16/gatb2-1678948503324838464534.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; font-family:roboto; font-size:17px; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Chuyến tàu hỏa chở hàng đầu tiên của Trung Quốc đến Đồng Nai - Ảnh 1." />
<h2>Cơ hội hợp t&aacute;c, đầu tư</h2>

<p>Tại buổi lễ đ&oacute;n t&agrave;u, &ocirc;ng Ngụy Hoa Tường,&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/tong-lanh-su-quan.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" target="_blank" title="tổng lãnh sự quán">tổng l&atilde;nh sự</a>&nbsp;Trung Quốc tại TP.HCM, cho biết chuyến t&agrave;u đường sắt vận chuyển h&agrave;ng h&oacute;a đầu ti&ecirc;n đến ga Trảng Bom nhằm th&uacute;c đẩy hơn nữa hợp t&aacute;c vận tải&nbsp;<a class="link-inline-content" href="https://tuoitre.vn/bo-chinh-tri-ket-luan-ve-dinh-huong-phat-trien-duong-sat-den-2023-20230302232828665.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" title="đường sắt ">đường sắt&nbsp;</a>Trung - Việt, n&acirc;ng cao kim ngạch thương mại giữa hai nước.&nbsp;</p>

<p>Chuyến t&agrave;u n&agrave;y do C&ocirc;ng ty TNHH vận tải h&agrave;ng h&oacute;a &Aacute; - &Acirc;u QiLu của Tập đo&agrave;n cao tốc Sơn Đ&ocirc;ng tổ chức v&agrave; khai th&aacute;c tuyến vận chuyển đường sắt từ TP Thanh Đảo (Trung Quốc) tới Việt Nam.&nbsp;</p>

<p>&Ocirc;ng Ngụy Hoa Tường cho hay chuyến t&agrave;u QiLu kết nối hai nước Trung - Việt, hai tỉnh Sơn Đ&ocirc;ng (Trung Quốc) v&agrave;&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/tinh-dong-nai.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" target="_blank" title="tỉnh Đồng Nai">tỉnh Đồng Nai</a>, mang lại nhiều cơ hội giao thương, hợp t&aacute;c đầu tư.</p>

<p>&quot;Ch&uacute;ng t&ocirc;i kỳ vọng c&aacute;c b&ecirc;n c&ugrave;ng nhau hợp t&aacute;c, đổi mới c&ocirc;ng dụng của chuyến t&agrave;u QiLu, tạo gi&aacute; trị cao hơn, phục vụ hợp t&aacute;c v&agrave; ph&aacute;t triển hai nước&quot;, &ocirc;ng Ngụy Hoa Tường n&oacute;i.<br />
&nbsp;</p>

<p>B&agrave; Nguyễn Thị Ho&agrave;ng - ph&oacute; chủ tịch UBND tỉnh Đồng Nai - nhấn mạnh: &quot;Tỉnh Đồng Nai lu&ocirc;n đ&aacute;nh gi&aacute; cao việc ph&aacute;t triển hệ thống giao th&ocirc;ng đường sắt n&oacute;i chung,&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/tuyen-duong-sat.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" target="_blank" title="tuyến đường sắt">tuyến đường sắt</a>&nbsp;Sơn Đ&ocirc;ng - Trảng Bom n&oacute;i ri&ecirc;ng v&agrave; hy vọng trong tương lai sẽ đ&oacute;n th&ecirc;m nhiều chuyến t&agrave;u tại ga Trảng Bom.&nbsp;</p>

<div id="InreadPc" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div id="zone-jnvk0c1v" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="share-jnvk0cro" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">&nbsp;</div>
</div>
</div>

<p>Đ&acirc;y cũng sẽ l&agrave; cầu nối đẩy mạnh ph&aacute;t triển hợp t&aacute;c kinh tế, hợp t&aacute;c hữu nghị giữa tỉnh Đồng Nai v&agrave; c&aacute;c đối t&aacute;c Trung Quốc&quot;.</p>

<h3>Kho trung chuyển miền Đ&ocirc;ng hơn 614ha&nbsp;</h3>

<p>Theo b&agrave; Ho&agrave;ng, Đồng Nai nằm cạnh TP.HCM v&agrave; tỉnh B&agrave; Rịa - Vũng T&agrave;u, c&oacute; nhiều loại h&igrave;nh giao th&ocirc;ng đường thủy, đường bộ, h&agrave;ng kh&ocirc;ng.&nbsp;</p>

<p>Đ&acirc;y cũng l&agrave; nơi c&oacute; tiềm năng thu h&uacute;t ph&aacute;t triển kinh tế th&ocirc;ng qua c&aacute;c loại h&igrave;nh giao th&ocirc;ng trong tương lai như tuyến&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/duong-sat-cao-toc.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" target="_blank" title="đường sắt cao tốc">đường sắt cao tốc</a>&nbsp;Bắc - Nam, tuyến đường sắt nhẹ Thủ Thi&ecirc;m - s&acirc;n bay Long Th&agrave;nh, Bi&ecirc;n H&ograve;a - Vũng T&agrave;u&hellip;</p>

<p>Do vậy Đồng Nai lu&ocirc;n sẵn s&agrave;ng ch&agrave;o đ&oacute;n v&agrave; hợp t&aacute;c với c&aacute;c nh&agrave; đầu tư tr&ecirc;n tinh thần c&ugrave;ng c&oacute; lợi để ph&aacute;t triển kinh tế, đặc biệt về lĩnh vực c&ocirc;ng nghiệp v&agrave; logistics.</p>

<p>Trao đổi với&nbsp;<em>Tuổi Trẻ Online</em>, b&agrave; Ho&agrave;ng cho biết chuyến t&agrave;u đầu ti&ecirc;n đến Đồng Nai nhằm vận chuyển nhiều h&agrave;ng h&oacute;a qua lại giữ hai nước Trung - Việt, trong đ&oacute; c&oacute; mặt h&agrave;ng n&ocirc;ng sản.&nbsp;</p>

<p>Chuyến t&agrave;u đầu ti&ecirc;n của Trung Quốc đến ga Trảng Bom l&agrave; bước khởi đầu để Đồng Nai tiếp tục hiện thực h&oacute;a kho trung chuyển h&agrave;ng h&oacute;a, bởi Đồng Nai đ&atilde; quy hoạch một tổng kho trung chuyển miền Đ&ocirc;ng hơn 614ha tại huyện Trảng Bom, l&agrave; kho trung chuyển h&agrave;ng h&oacute;a của Đ&ocirc;ng Nam &Aacute;.</p>
', N'/Uploads/images/gatb1-16789481338381194871409.jpg', N'Chuyến tàu hỏa chở hàng đầu tiên của Trung Quốc đến Đồng Nai', NULL, NULL, CAST(N'2023-05-16T20:02:56.000' AS DateTime), NULL, CAST(N'2023-05-16T20:03:54.883' AS DateTime), NULL, N'Chuyến tàu hỏa chở hàng đầu tiên của Trung Quốc đến Đồng Nai', 1)
INSERT [dbo].[tb_New] ([Id], [Title1], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [Title], [IsActive]) VALUES (24, NULL, 3, N'Những khó khăn về kinh tế trong năm 2022 đã dẫn đến nhiều doanh nghiệp vận tải, kho bãi tạm ngừng kinh doanh hoặc giải thể. Tình hình biến động vẫn còn tiếp diễn trong những tháng đầu 2023 và dự báo kéo dài đến hết năm.', N'<p>Để th&iacute;ch ứng với điều n&agrave;y, đ&atilde; c&oacute; rất nhiều chuyển dịch trong việc đầu tư logistic, từ thay đổi mặt h&agrave;ng vận chuyển, quy m&ocirc; kinh doanh đến c&aacute;c ti&ecirc;u ch&iacute; lựa chọn mua xe nhiều thận trọng.</p>

<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: all 0.3s ease-in-out 0s; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><a href="https://cdn.tuoitre.vn/471584752817336320/2023/3/15/photo-1678852035861-16788520365462064265822.jpg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none !important;" target="_blank"><img alt="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 1." class="lightbox-content" src="https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/3/15/photo-1678852035861-16788520365462064265822.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 1." /></a>

<div id="wrapper-inimage-pos-sponsor-0" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="in-images" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="zone-joqxux31" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="share-joqxuxkg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">&nbsp;</div>
</div>
</div>
</div>
</div>

<div class="PhotoCMS_Caption PhotoCMS_Author" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 8px 0px; max-width: 100%; border-bottom: 1px solid rgb(242, 242, 242);">
<p style="margin-left:0px; margin-right:0px">C&aacute;c doanh nghiệp vận tải ng&agrave;y c&agrave;ng thận trọng hơn trong việc lựa chọn mẫu m&atilde; v&agrave; thương hiệu xe đảm bảo chất lượng</p>
</div>
</div>

<h2><strong>Linh hoạt để th&iacute;ch nghi</strong></h2>

<p>Thay đổi mặt h&agrave;ng chuy&ecirc;n chở đang l&agrave; một trong những giải ph&aacute;p phổ biến m&agrave; c&aacute; nh&acirc;n, tổ chức cung cấp dịch vụ vận tải &aacute;p dụng.&nbsp;</p>

<p>V&igrave; d&ugrave; bức tranh tổng thể nền kinh tế kh&aacute; kh&oacute; khăn, tuy nhi&ecirc;n nhu cầu vận chuyển h&agrave;ng h&oacute;a đặc biệt l&agrave; h&agrave;ng cồng kềnh như đồ nội thất hoặc h&agrave;ng ti&ecirc;u d&ugrave;ng nhanh, h&agrave;ng thiết yếu như thực phẩm, thuốc men,&hellip; vẫn ở mức ổn định.</p>

<p>Để thực hiện được điều n&agrave;y, c&aacute;c doanh nghiệp cần c&oacute; phương tiện ph&ugrave; hợp về tải trọng, th&ugrave;ng xe c&oacute; thể linh hoạt đ&aacute;p ứng được c&aacute;c mặt h&agrave;ng kh&aacute;c nhau v&agrave; &lsquo;đối mặt&rsquo; với yếu tố thời tiết. Đặc biệt, m&ocirc;i trường độ ẩm cao tại Việt Nam đ&ograve;i hỏi xe phải được l&agrave;m từ c&aacute;c loại vật liệu tốt, chẳng hạn như th&eacute;p kh&ocirc;ng gỉ kết hợp sơn tĩnh điện, như tr&ecirc;n&nbsp;<a class="link-inline-content" href="https://tuoitre.vn/suzuki-carry-truck.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none;" title="Suzuki Carry Truck">Suzuki Carry Truck</a>.</p>

<p>&nbsp;</p>

<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: all 0.3s ease-in-out 0s; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><a href="https://cdn.tuoitre.vn/471584752817336320/2023/3/15/photo-1678852037757-1678852037855984127055.jpg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none !important;" target="_blank"><img alt="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 2." class="lightbox-content" src="https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/3/15/photo-1678852037757-1678852037855984127055.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 2." /></a></div>

<div class="PhotoCMS_Caption PhotoCMS_Author" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 8px 0px; max-width: 100%; border-bottom: 1px solid rgb(242, 242, 242);">
<p style="margin-left:0px; margin-right:0px">D&ograve;ng Suzuki Super Carry đ&atilde; gắn b&oacute; với thị trường Việt suốt 27 năm v&agrave; li&ecirc;n tục dẫn đầu doanh số thị trường xe tải</p>
</div>
</div>

<p>B&ecirc;n cạnh đ&oacute;, xe tải nhỏ, gọn g&agrave;ng về k&iacute;ch thước v&agrave; đa dạng loại th&ugrave;ng giống Suzuki Carry Truck mang lại nhiều cơ hội vận chuyển hơn tải trung, th&ugrave;ng d&agrave;i nhờ gắn liền với nhu cầu sử dụng h&agrave;ng ng&agrave;y, của cả kh&aacute;ch h&agrave;ng c&aacute; nh&acirc;n lẫn doanh nghiệp.</p>

<p>Trong bối cảnh l&atilde;i vay ng&acirc;n h&agrave;ng chưa thể hạ nhiệt th&igrave; chi ph&iacute; đầu tư một chiếc xe tải nhẹ dưới một tấn của Suzuki cũng rất hấp dẫn, được ch&uacute; &yacute; nhiều hơn.</p>

<h3><strong>Đứng vững nhờ thực lực</strong></h3>

<div id="InreadPc" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div id="zone-jnvk0c1v" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="share-jnvk0cro" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">&nbsp;</div>
</div>
</div>

<p>C&ugrave;ng mức tải trọng khoảng một tấn, nhưng kh&ocirc;ng phải c&aacute;i t&ecirc;n n&agrave;o cũng đạt mức tăng trưởng dương mạnh mẽ cho cả giai đoạn 2022-2023. Theo số liệu b&aacute;n h&agrave;ng 01-2023 từ VAMA, c&aacute;c d&ograve;ng xe tải Carry của Suzuki vẫn l&agrave; c&aacute;i t&ecirc;n nằm ở vị tr&iacute; đầu bảng. L&yacute; giải vấn đề n&agrave;y, c&oacute; thể kể đến c&aacute;c yếu tố sau.</p>

<p>Ở đầu v&agrave;o, kh&oacute; khăn, th&aacute;ch thức lớn nhất l&agrave; gi&aacute; xăng dầu tăng. Nếu doanh nghiệp, hộ kinh doanh lựa chọn phương tiện chuy&ecirc;n chở của Suzuki sẽ gi&uacute;p tiết kiệm được phần lớn chi ph&iacute; bỏ ra. Cụ thể, xe tải nhẹ Suzuki Carry Truck c&oacute; mức ti&ecirc;u hao chỉ khoảng 6-7 l&iacute;t/100km (hỗn hợp) ở điều kiện đủ tải, chỉ tương đương một chiếc xe du lịch.</p>

<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: all 0.3s ease-in-out 0s; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><a href="https://cdn.tuoitre.vn/471584752817336320/2023/3/15/photo-1678852038755-1678852039201635842925.jpg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none !important;" target="_blank"><img alt="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 3." class="lightbox-content" src="https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/3/15/photo-1678852038755-1678852039201635842925.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 3." /></a></div>

<div class="PhotoCMS_Caption PhotoCMS_Author" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 8px 0px; max-width: 100%; border-bottom: 1px solid rgb(242, 242, 242);">
<p style="margin-left:0px; margin-right:0px">Trong 5 năm sử dụng, ước t&iacute;nh khoảng 160.000km, xe tiết kiệm gần 30 triệu đồng chi ph&iacute; nhi&ecirc;n liệu so với c&aacute;c xe c&ugrave;ng ph&acirc;n kh&uacute;c</p>
</div>
</div>

<p>Chất lượng c&ugrave;ng năng lực vận h&agrave;nh l&agrave; yếu tố kh&ocirc;ng thể bỏ qua. Xe tải nhỏ Suzuki được đ&aacute;nh gi&aacute; cao bởi sự bền bỉ từ động cơ F10A, đến khung sườn v&agrave; c&aacute;c chi tiết linh kiện. Khung sườn bền bỉ, vững chắc với vật liệu th&eacute;p, kết hợp sơn tĩnh điện đem đến cho xe khả năng th&iacute;ch nghi ở cả những m&ocirc;i trường vận h&agrave;nh khắc nghiệt, như c&aacute;c c&ocirc;ng tr&igrave;nh x&acirc;y dựng cần đ&ograve;i hỏi t&iacute;nh ổn định v&agrave; c&acirc;n bằng.</p>

<p>Bền bỉ, tiết kiệm, vận h&agrave;nh &ecirc;m &aacute;i n&ecirc;n xe tải Suzuki giữ gi&aacute; tốt so với mặt bằng c&aacute;c mẫu xe c&ugrave;ng ph&acirc;n kh&uacute;c.</p>

<p><strong>Đầu tư đ&uacute;ng, vượt b&atilde;o nhanh</strong></p>

<p>Th&aacute;ng 3 l&agrave; thời điểm th&iacute;ch hợp cho việc đầu tư một chiếc xe thương mại để bắt đầu kế hoạch kinh doanh nhiều ng&agrave;nh nghề. Nhưng do t&igrave;nh h&igrave;nh kinh tế kh&oacute; khăn, t&acirc;m l&yacute; đầu tư thận trọng &lsquo;trứng để nhiều tổ&rsquo; n&ecirc;n việc đầu tư tải nhẹ chất lượng (dưới một tấn) sẽ an to&agrave;n, &iacute;t rủi ro hơn. Suzuki Carry Truck với lợi thế về độ bền, &iacute;t hỏng h&oacute;c, c&aacute;c chủ xe c&oacute; thể khấu hao chi ph&iacute; mua xe chỉ sau khoảng 1 năm nếu t&iacute;nh tr&ecirc;n thu nhập khoảng 25 đến 30 triệu đồng mỗi th&aacute;ng.</p>

<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: all 0.3s ease-in-out 0s; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><a href="https://cdn.tuoitre.vn/471584752817336320/2023/3/15/photo-1678852040306-1678852040374688493923.jpg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none !important;" target="_blank"><img alt="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 4." class="lightbox-content" src="https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/3/15/photo-1678852040306-1678852040374688493923.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả? - Ảnh 4." /></a></div>

<div class="PhotoCMS_Caption PhotoCMS_Author" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 8px 0px; max-width: 100%; border-bottom: 1px solid rgb(242, 242, 242);">
<p style="margin-left:0px; margin-right:0px">Chương tr&igrave;nh khuyến m&atilde;i d&agrave;nh cho cho c&aacute;c d&ograve;ng xe thương mại của Suzuki trong th&aacute;ng 3</p>
</div>
</div>

<p>Hiện nay, Suzuki đang triển khai chương tr&igrave;nh khuyến m&atilde;i th&aacute;ng 3 với mức ưu đ&atilde;i cho Carry Truck v&agrave; c&aacute;c d&ograve;ng xe thương mại kh&aacute;c l&ecirc;n đến 30 triệu đồng, trong đ&oacute; bao gồm cả mức hỗ trợ 100% lệ ph&iacute; trước bạ v&agrave; phiếu nhi&ecirc;n liệu, hoặc l&atilde;i suất vay 0% trong 18 th&aacute;ng đầu.&nbsp;</p>

<p>Kh&aacute;ch h&agrave;ng quan t&acirc;m c&oacute; thể li&ecirc;n hệ hotline miễn ph&iacute; 1900 6950 hoặc t&igrave;m hiểu th&ocirc;ng tin tại&nbsp;<em><strong>https://suzuki.com.vn</strong></em>.</p>
', N'/Uploads/images/photo-1678852035861-16788520365462064265822.jpg', N'Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả?', NULL, NULL, CAST(N'2023-05-16T20:05:22.223' AS DateTime), NULL, CAST(N'2023-05-16T20:05:22.223' AS DateTime), NULL, N'Kinh tế khó khăn, đâu là giải pháp kinh doanh vận tải hiệu quả?', 1)
INSERT [dbo].[tb_New] ([Id], [Title1], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [Title], [IsActive]) VALUES (25, NULL, 3, N'TTO - Với 100 xe máy điện đưa vào hoạt động vận chuyển hàng hóa, một doanh nghiệp vận tải đã đưa Đà Nẵng thành nơi tiên phong cung cấp dịch vụ vận tải hàng hóa bằng xe điện tại Việt Nam.', N'<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: all 0.3s ease-in-out 0s; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;"><a href="https://cdn.tuoitre.vn/2022/9/15/roadshow-ra-quan-3-16632346761901971339506.jpeg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: none !important;" target="_blank"><img alt="Thành phố đầu tiên triển khai dịch vụ giao hàng bằng xe điện - Ảnh 1." class="lightbox-content" id="img_15434b40-34da-11ed-8a6e-1b03632c0a88" src="https://cdn.tuoitre.vn/thumb_w/730/2022/9/15/roadshow-ra-quan-3-16632346761901971339506.jpeg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Thành phố đầu tiên triển khai dịch vụ giao hàng bằng xe điện - Ảnh 1." /></a>
<div id="wrapper-inimage-pos-sponsor-0" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="in-images" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="zone-joqxux31" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="share-joqxuxkg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="placement-josbvfxe" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="banner-joqxux31-josbvgf9" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; min-height: 0px; min-width: 0px;">
<div id="slot-1-joqxux31-josbvgf9" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">&nbsp;</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="PhotoCMS_Caption" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 8px 0px; max-width: 100%; border-bottom: 1px solid rgb(242, 242, 242);">
<p style="margin-left:0px; margin-right:0px">Đội h&igrave;nh xe m&aacute;y điện vận tải h&agrave;ng h&oacute;a ra mắt tại Đ&agrave; Nẵng ng&agrave;y 15-9 - Ảnh: A.H.</p>
</div>
</div>

<p><span>Ng&agrave;y 15-9, Ahamove - một doanh nghiệp vận tải - đ&atilde; k&yacute; bi&ecirc;n bản hợp t&aacute;c c&ugrave;ng VinFast cho ra mắt dịch vụ vận chuyển c&ocirc;ng nghệ xe điện tại Đ&agrave; Nẵng. Sự kiện đ&aacute;nh dấu lần đầu ti&ecirc;n một doanh nghiệp cung cấp dịch vụ vận tải h&agrave;ng h&oacute;a bằng xe điện tại Việt Nam.</span></p>

<p>Theo thỏa thuận hợp t&aacute;c n&agrave;y, VinFast cung cấp sản phẩm xe m&aacute;y điện cho doanh nghiệp triển khai dịch vụ vận chuyển c&ocirc;ng nghệ bằng xe điện. M&ocirc; h&igrave;nh hoạt động theo hướng khuyến kh&iacute;ch ph&aacute;t triển v&agrave; sử dụng năng lượng sạch, bảo vệ m&ocirc;i trường, đồng thời gia tăng trải nghiệm cho kh&aacute;ch h&agrave;ng v&agrave; thu nhập cho đối t&aacute;c t&agrave;i xế.</p>

<p>Dịch vụ giao h&agrave;ng xe điện của doanh nghiệp n&agrave;y dự kiến sẽ bắt đầu tại Đ&agrave; Nẵng với 100 xe, sau đ&oacute; sẽ gia tăng số lượng c&ugrave;ng với quy m&ocirc; tr&ecirc;n c&aacute;c th&agrave;nh phố lớn kh&aacute;c như Hải Ph&ograve;ng, Nha Trang, H&agrave; Nội, TP.HCM&hellip; với mục ti&ecirc;u 10.000 xe điện giao h&agrave;ng v&agrave;o năm 2025, thay thế dần xe xăng v&agrave; c&aacute;c loại xe ảnh hưởng tới m&ocirc;i trường.</p>

<div id="InreadPc" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; color: rgb(34, 34, 34); font-family: Roboto; font-size: 17px;">
<div id="zone-jnvk0c1v" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="share-jnvk0cro" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">&nbsp;</div>
</div>
</div>

<p>&Ocirc;ng Nguyễn Quang Thanh, gi&aacute;m đốc Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng th&agrave;nh phố Đ&agrave; Nẵng, cho hay đ&acirc;y l&agrave; dịch vụ mới rất ph&ugrave; hợp với định hướng của th&agrave;nh phố Đ&agrave; Nẵng trong việc hạn chế c&aacute;c phương tiện giao th&ocirc;ng ảnh hưởng đến m&ocirc;i trường, đồng thời đem lại sự ph&aacute;t triển kinh tế, c&ocirc;ng nghệ v&agrave; tạo th&ecirc;m việc l&agrave;m cho người lao động.</p>

<p>Theo &ocirc;ng Phạm Hữu Ng&ocirc;n - CEO Ahamove, c&ugrave;ng với việc ph&aacute;t triển dịch vụ giao h&agrave;ng xe điện, doanh nghiệp n&agrave;y dự định sẽ tiếp tục mở rộng sang lĩnh vực vận tải h&agrave;nh kh&aacute;ch bằng xe điện để phục vụ người d&acirc;n, kh&aacute;ch du lịch tại Đ&agrave; Nẵng.</p>
', N'/Uploads/images/roadshow-ra-quan-3-16632346761901971339506.jpeg', N'Thành phố đầu tiên triển khai dịch vụ giao hàng bằng xe điện', NULL, NULL, CAST(N'2023-05-16T20:06:43.850' AS DateTime), NULL, CAST(N'2023-05-16T20:06:43.850' AS DateTime), NULL, N'Thành phố đầu tiên triển khai dịch vụ giao hàng bằng xe điện', 1)
INSERT [dbo].[tb_New] ([Id], [Title1], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [Title], [IsActive]) VALUES (26, NULL, 3, N'Khối lượng vận chuyển đường biển, đường hàng không và đường bộ sẽ giảm trong năm 2023 khiến cước vận chuyển thấp và giá cả phải chăng hơn.', N'<p>C&aacute;c dự đo&aacute;n ph&ugrave; hợp với b&aacute;o c&aacute;o ng&agrave;nh vận tải được c&ocirc;ng bố v&agrave;o cuối năm 2022 bởi c&aacute;c nh&agrave; quản l&yacute; hậu cần (LMI). B&aacute;o c&aacute;o n&agrave;y chỉ ra, gi&aacute; cước ng&agrave;nh vận tải đang &quot;giảm nghi&ecirc;m trọng&quot; so với mức gi&aacute; cao kỷ lục được ghi nhận trong đại dịch.</p>

<p>Theo dự b&aacute;o từ&nbsp;<em>Container xChange</em>, nền tảng hậu cần container của Đức, gi&aacute; container đặc biệt cao trong nửa đầu năm 2022 nhưng sau đ&oacute; giảm mạnh v&agrave;o nửa cuối năm v&agrave; xu hướng n&agrave;y c&oacute; thể k&eacute;o d&agrave;i sang năm mới. Nguy&ecirc;n nh&acirc;n của t&igrave;nh trạng n&agrave;y xuất ph&aacute;t từ t&igrave;nh trạng dư thừa container khiến nhiều h&atilde;ng t&agrave;u giảm c&ocirc;ng suất v&agrave; tạm dừng dịch vụ.</p>

<div class="fig-picture" style="margin: 0px; padding: 0px 0px 434px; box-sizing: border-box; text-rendering: optimizelegibility; width: 680px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;"><img alt="Khối lượng vận chuyển đường biển, đường hàng không và đường bộ được dự báo giảm trong năm 2023. Ảnh:IATA" class="lazied lazy" src="https://i1-kinhdoanh.vnecdn.net/2022/12/23/8251-1665996861-8718-1671787112.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=c41-_JJWrk7aOvm2OV5MFw" style="border:0px; box-sizing:border-box; font-size:0px; left:0px; line-height:0; margin:0px; max-height:700px; max-width:100%; padding:0px; position:absolute; text-rendering:optimizelegibility; top:0px; width:680px" /></div>

<p>Khối lượng vận chuyển đường biển, đường h&agrave;ng kh&ocirc;ng v&agrave; đường bộ được dự b&aacute;o giảm trong năm 2023. Ảnh:<em>IATA</em></p>

<p>Một kịch bản tương tự cũng sẽ diễn ra trong ng&agrave;nh h&agrave;ng kh&ocirc;ng v&agrave;o năm 2023. Theo b&aacute;o c&aacute;o h&agrave;ng tuần của&nbsp;<em>Clive Data Services</em>, đơn vị ph&acirc;n t&iacute;ch gi&aacute; cước đường biển v&agrave; h&agrave;ng kh&ocirc;ng, khối lượng vận tải đang giảm th&aacute;ng thứ 9 li&ecirc;n tiếp. Đơn vị n&agrave;y cho biết, khi nhu cầu giảm 2% trong th&aacute;ng 11, nhiều h&atilde;ng h&agrave;ng kh&ocirc;ng đang xem x&eacute;t về năng lực vận chuyển h&agrave;ng h&oacute;a bằng đường h&agrave;ng kh&ocirc;ng trong d&agrave;i hạn. Ngo&agrave;i ra, cước vận chuyển trong th&aacute;ng 11 năm 2021 đ&atilde; giảm 8% so với c&ugrave;ng kỳ năm 2021.</p>

<p>&quot;Nhu cầu vận tải h&agrave;ng kh&ocirc;ng giảm mạnh 8% trong th&aacute;ng 10, nhưng đ&atilde; c&oacute; những t&iacute;n hiệu ổn định v&agrave;o th&aacute;ng 11. Thị trường kh&ocirc;ng xấu đi, nhưng kh&oacute; để x&aacute;c định d&agrave;i hạn&quot;, &ocirc;ng Niall van de Wouw, Gi&aacute;m đốc vận tải h&agrave;ng kh&ocirc;ng tại Xeneta nhận định. Tuy nhi&ecirc;n, người ti&ecirc;u d&ugrave;ng c&oacute; thể được hưởng lợi do chi ph&iacute; giảm khiến gi&aacute; h&agrave;ng h&oacute;a phải chăng hơn.</p>

<p>B&ecirc;n cạnh đ&oacute;, gi&aacute; vận chuyển trong lĩnh vực đường bộ cũng sẽ giảm trong năm 2023. Nghi&ecirc;n cứu về gi&aacute; cước vận chuyển kh&ocirc; v&agrave; đ&ocirc;ng lạnh từ Arrival Logistics, Texas nhận định về xu hướng giảm gi&aacute; n&agrave;y. C&ocirc;ng ty dự đo&aacute;n, tỷ gi&aacute; giao ngay sẽ tương đối ổn định, trong khi tỷ gi&aacute; hợp đồng sẽ giảm xuống từ mức cao nhất ghi nhận trong đại dịch. Sự thay đổi n&agrave;y đến từ mức sụt giảm trọng tải h&agrave;ng h&oacute;a trong điều kiện nền kinh tế trở lại mức trước đại dịch.</p>

<p>Arrival Logistics nhận định: &quot;Khối lượng giảm dẫn đến cước vận chuyển thấp hơn trong điều kiện thị trường vẫn đảm bảo khả năng vận chuyển h&agrave;ng h&oacute;a. Tuy nhi&ecirc;n, điều n&agrave;y cũng dễ khiến c&aacute;c h&atilde;ng vận tải nhỏ phải tạm dừng hoạt động&quot;.</p>
', N'/Uploads/images/8251-1665996861-8718-1671787112.jpg', N'Dự báo giá cước vận tải sẽ giảm vào năm 2023
', NULL, NULL, CAST(N'2023-05-16T20:09:38.513' AS DateTime), NULL, CAST(N'2023-05-16T20:09:38.513' AS DateTime), NULL, N'Dự báo giá cước vận tải sẽ giảm vào năm 2023', 1)
SET IDENTITY_INSERT [dbo].[tb_New] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Order] ON 

INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (25, N'Mai Huy Hoàng', N'0367883482', N'17 Chu Mạnh Trinh, Hồ Chí Minh, Thành Phố Thủ Đức, Phường Bình Thọ', N'Nguyễn Hoàng Khôi', N'0312322311', NULL, N'MHH12092023', N'Điện thoại', 1, CAST(1.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, N'Người gửi', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T17:28:47.500' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 1)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (26, N'Mai Huy Hoàng', N'0367883482', N'17, Hồ Chí Minh, Quận Thủ Đức, Phường Bình Thọ', N'Nguyễn Hoàng Khôi', N'0999999999', NULL, N'NHK12062023', N'Đồng hồ', -1, CAST(1.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(29000.00 AS Decimal(18, 2)), N'Người nhận', N'Lấy hàng tại nhà', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T17:53:28.480' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 1)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (27, N'Mai Huy Hoàng', N'0367883482', N'1, Hồ Chí Minh, Quận 12, Phường Tân Thới Hiệp', N'Nguyễn Minh Đức', N'0999999999', NULL, N'123', N'máy tính', 2, CAST(5.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(34000.00 AS Decimal(18, 2)), N'Người nhận', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T17:57:11.343' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 4)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (28, N'Mai Huy Hoàng', N'0367883482', N'13, ', N'Nguyễn Ngọc Ngân', N'01267834212', NULL, N'111', N'túi xách', -1, CAST(3.00 AS Decimal(18, 2)), CAST(3000000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(54001.00 AS Decimal(18, 2)), N'Người gửi', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T18:11:00.257' AS DateTime), NULL, NULL, NULL, N'Đã giao thành công', NULL, NULL, 4)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (29, N'Mai Huy Hoàng', N'0367883482', N'17 chu mạnh trinh , phường Bình Thọ , quận Thủ Đức , TP.HCM, Lạng Sơn, Huyện Văn Quan, Xã Phú Mỹ', N'Nguyễn Hoàng Khôi', N'0999999999', NULL, N'111212121', N'cuốn sách', 1, CAST(2.00 AS Decimal(18, 2)), CAST(4000000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(49000.00 AS Decimal(18, 2)), N'Người nhận', N'Lấy hàng tại nhà', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T19:56:47.833' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 3)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (30, N'Mai Huy Hoàng', N'0367883482', N'48, Hồ Chí Minh, Quận Thủ Đức, Phường Tam Bình, Hồ Chí Minh, Quận Thủ Đức, Phường Trường Thọ', N'Quang neyer', N'0999999999', NULL, N'111212121', N'máy tính', 2, CAST(3.00 AS Decimal(18, 2)), CAST(40000000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(239001.00 AS Decimal(18, 2)), N'Người gửi', N'Lấy hàng tại nhà', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T20:03:26.683' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 3)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (32, N'Mai Huy Hoàng', N'1', N'1, Hồ Chí Minh, Huyện Cần Giờ, Xã Thạnh An', N'Quang neyer', N'0938365113', NULL, N'1', N'Đồng hồ', 1, CAST(5.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(39001.00 AS Decimal(18, 2)), N'Người nhận', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T20:20:12.553' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 3)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (33, N'Mai Huy Hoàng', N'0367883482', N'1, Hồ Chí Minh, Quận 7, Phường Phú Thuận', N'Quang neyer', N'0999999999', NULL, N'1', N'túi xách', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(34000.00 AS Decimal(18, 2)), N'Người nhận', N'Lấy hàng tại nhà', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T21:06:59.623' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 4)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (34, N'Mai Huy Hoàng', N'0367883482', N'1, Hồ Chí Minh, Quận 7, Phường Phú Thuận', N'Nguyễn Minh Đức', N'1234567', NULL, N'KKK123', N'cuốn sách', 4, CAST(4.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(34000.00 AS Decimal(18, 2)), N'Người gửi', N'Lấy hàng tại nhà', N'cho xem hàng , không cho thử ', CAST(N'2023-12-09T22:10:55.407' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 3)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (35, N'Mai Huy Hoàng', N'0367883482', N'17 chu mạnh trinh , phường Bình Thọ , quận Thủ Đức , TP.HCM, Hồ Chí Minh, Quận Thủ Đức, Phường Tam Phú', N'Nguyễn Hoàng Khôi', N'0999999999', NULL, N'MHH101222023', N'Điện thoại', 1, CAST(3.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(29000.00 AS Decimal(18, 2)), N'Người nhận', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-10T19:59:41.510' AS DateTime), NULL, NULL, NULL, N'Đang vận chuyển', NULL, NULL, 3)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (36, N'Mai Huy Hoàng', N'0367883482', N'1, Đồng Nai, Huyện Vĩnh Cửu, Xã Bình Lợi', N'Quang neyer', N'1234567', NULL, N'test', N'Đồng hồ', 2, CAST(3.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(29000.00 AS Decimal(18, 2)), N'Người nhận', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-10T20:25:29.653' AS DateTime), NULL, NULL, NULL, N'Đã giao thành công', NULL, NULL, 1)
INSERT [dbo].[tb_Order] ([Id], [SenderName], [SenderPhone], [SenderAddress], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ItemCode], [ItemName], [ItemQuantity], [ItemWeight], [ItemValue], [Length], [Width], [Height], [PaymentMethodCod], [Payer], [PickUpRequest], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive], [DriverId], [Title], [w_id]) VALUES (37, N'Mai Huy Hoàng', N'0367883482', N'17 chu mạnh trinh , phường Bình Thọ , quận Thủ Đức , TP.HCM, Hồ Chí Minh, Thành Phố Thủ Đức, Phường Bình Trưng Tây', N'Nguyễn Minh Đức', N'0999999999', NULL, N'123', N'Đồng hồ', -1, CAST(3.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(29000.00 AS Decimal(18, 2)), N'Người nhận', N'Gửi tại bưu cục', N'cho xem hàng , không cho thử ', CAST(N'2023-12-12T21:54:02.187' AS DateTime), NULL, NULL, NULL, N'Đã nhập kho', NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[tb_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Post] ON 

INSERT [dbo].[tb_Post] ([Id], [Title], [CategoryId], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifierBy], [IsActive]) VALUES (5, N'Bắt đối tượng vác súng bắn loạn xạ, truy sát chủ nợ ngay tại nhà 123', 3, NULL, N'<p>Ng&agrave;y 14-5, Cơ quan CSĐT C&ocirc;ng an thị x&atilde; Ba Đồn, tỉnh Quảng B&igrave;nh&nbsp;cho biết, đ&atilde; bắt giữ Nguyễn Đức Qu&yacute; (SN 1983; tr&uacute; tổ d&acirc;n phố Thọ Đơn, thị x&atilde; Ba Đồn) v&igrave; d&ugrave;ng s&uacute;ng đột nhập nh&agrave; d&acirc;n, bắn nhiều ph&aacute;t, g&acirc;y n&aacute;o loạn khu d&acirc;n cư.</p>

<p>Theo th&ocirc;ng tin ban đầu, chiều 12-5, anh Phan C&ocirc; V&iacute;ch (SN 1983; ngụ tổ d&acirc;n phố Minh Lợi, phường Quảng Thọ, thị x&atilde; Ba Đồn) đang ngồi ở ph&ograve;ng kh&aacute;ch th&igrave; Qu&yacute; ph&oacute;ng &ocirc; t&ocirc; đến nh&agrave;.</p>

<p>Vừa bước v&agrave;o nh&agrave;, Qu&yacute; đ&atilde; d&ugrave;ng s&uacute;ng bắn li&ecirc;n tiếp 6 ph&aacute;t trong nh&agrave; anh V&iacute;ch.</p>

<p><img alt="Bắt đối tượng vác súng bắn loạn xạ, truy sát chủ nợ ngay tại nhà - 1" class="initial loaded news-image" src="https://cdn.24h.com.vn/upload/2-2023/images/2023-05-14/1684056435-3eb679f6301fff11a99f66e5c9f6d494-width684height319.jpg" style="border:0px; box-sizing:border-box; cursor:pointer; display:block; font-size:12px; height:auto; margin:0px auto; max-width:100%; padding:0px; transition:all 2s ease-in 0s; vertical-align:middle; width:740px" /></p>

<p style="text-align:center">D&iacute; s&uacute;ng v&agrave;o mẹ anh V&iacute;ch</p>

<p><img alt="Bắt đối tượng vác súng bắn loạn xạ, truy sát chủ nợ ngay tại nhà - 2" class="initial loaded news-image" src="https://cdn.24h.com.vn/upload/2-2023/images/2023-05-14/1684056435-d92b603ddc52c717fd4d1a9520b49414-width684height319.jpg" style="border:0px; box-sizing:border-box; cursor:pointer; display:block; font-size:12px; height:auto; margin:0px auto; max-width:100%; padding:0px; transition:all 2s ease-in 0s; vertical-align:middle; width:740px" /></p>

<p style="text-align:center">Đối tượng d&iacute; s&uacute;ng v&agrave;o anh V&iacute;ch</p>

<p>Thấy ồn &agrave;o, &ocirc;ng Phạm Xu&acirc;n Vinh (SN 1950) v&agrave; b&agrave; Nguyễn Thị L&yacute; (SN 1953) l&agrave; bố mẹ anh V&iacute;ch từ tầng hai đi xuống. Tại đ&acirc;y Qu&yacute; d&iacute; s&uacute;ng v&agrave;o đầu anh V&iacute;ch. B&agrave; L&yacute; v&agrave;o can ngăn, Qu&yacute; liền d&iacute; s&uacute;ng v&agrave;o b&agrave; L&yacute; đ&ograve;i bắn, &ocirc;ng Vinh v&agrave;o van xin, &ocirc;m Qu&yacute; ra b&agrave; L&yacute; mới hết nguy hiểm.</p>

<p>Theo t&igrave;m hiểu, vợ anh V&iacute;ch l&agrave; chị Nguyễn Thị Ph&uacute;c Hiền, b&aacute;n vật liệu x&acirc;y dựng cho Qu&yacute; l&agrave;m nh&agrave;.&nbsp;</p>

<p>Qu&yacute; c&ograve;n nợ hơn 25 triệu đồng nhưng kh&ocirc;ng trả m&agrave; c&ograve;n v&aacute;c s&uacute;ng đi t&igrave;m bắn chị Hiền. L&uacute;c đ&oacute; chị Hiền kh&ocirc;ng c&oacute; ở nh&agrave; n&ecirc;n Qu&yacute; bắn loạn xạ. Theo C&ocirc;ng an thị x&atilde; Ba Đồn, sự việc đang được Cơ quan CSĐT C&ocirc;ng an thị x&atilde; điều tra, l&agrave;m r&otilde;. Ngay trong đ&ecirc;m 12-5, đối tượng Qu&yacute; đ&atilde; bị bắt.</p>
', NULL, N'Bắt đối tượng vác súng bắn loạn xạ, truy sát chủ nợ ngay tại nhà
', NULL, NULL, CAST(N'2023-05-14T18:37:05.000' AS DateTime), NULL, CAST(N'2023-05-14T18:37:10.380' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[tb_Post] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Recruitment] ON 

INSERT [dbo].[tb_Recruitment] ([Id], [Name], [Email], [PhoneNumber], [CCCDorCMND], [Address], [ImageDriver], [IsRead], [CreatedDate]) VALUES (3, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'123', N'17 chu mạnh trinh', N'/Uploads/images/photo-1678852035861-16788520365462064265822.jpg', 0, CAST(N'2023-06-08T16:04:05.077' AS DateTime))
INSERT [dbo].[tb_Recruitment] ([Id], [Name], [Email], [PhoneNumber], [CCCDorCMND], [Address], [ImageDriver], [IsRead], [CreatedDate]) VALUES (4, N'Mai Huy Hoang', N'huyhoang.291202@gmail.com', N'0367883482', N'123', N'asc', N'/Uploads/images/phi%20re.png', 0, CAST(N'2023-06-11T04:24:01.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Recruitment] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_shipper] ON 

INSERT [dbo].[tb_shipper] ([ID], [FullName], [AGE], [W_id]) VALUES (1, N'Nguyen van a', 33, 1)
INSERT [dbo].[tb_shipper] ([ID], [FullName], [AGE], [W_id]) VALUES (2, N'Nguyen van b', 20, 2)
INSERT [dbo].[tb_shipper] ([ID], [FullName], [AGE], [W_id]) VALUES (3, N'Nguyen van c', 23, 3)
INSERT [dbo].[tb_shipper] ([ID], [FullName], [AGE], [W_id]) VALUES (4, N'Nguyen van d', 25, 4)
SET IDENTITY_INSERT [dbo].[tb_shipper] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_shipping] ON 

INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (1, 25, 1)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (2, 26, 1)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (3, 27, 4)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (4, 28, 4)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (5, 29, 3)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (6, 30, 3)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (7, 32, 3)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (8, 33, 4)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (9, 35, 3)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (10, 34, 3)
INSERT [dbo].[tb_shipping] ([Id], [order_id], [shipper_id]) VALUES (11, 36, 1)
SET IDENTITY_INSERT [dbo].[tb_shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_warehouse] ON 

INSERT [dbo].[tb_warehouse] ([ID], [Name], [Province]) VALUES (1, N'Thu Duc Campus: Khu Công nghệ cao TP.HCM (SHTP), Xa lộ Hà Nội, P. Hiệp Phú, TP. Thủ Đức, TP.HCM', N'Thu Duc - HCM')
INSERT [dbo].[tb_warehouse] ([ID], [Name], [Province]) VALUES (2, N'Saigon Campus: 475A Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.HCM', N'Binh Thanh - HCM')
INSERT [dbo].[tb_warehouse] ([ID], [Name], [Province]) VALUES (3, N'Ha Noi Campus: Km29 Đại lộ Thăng Long, Thạch Thất, TP. HN', N'Thang Long - HN')
INSERT [dbo].[tb_warehouse] ([ID], [Name], [Province]) VALUES (4, N'Ha Noi Campus: 207 Giải Phóng, Đồng Tâm, Hai Bà Trưng, TP. HN', N'Hai Ba Trung - HN')
SET IDENTITY_INSERT [dbo].[tb_warehouse] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/16/2023 1:13:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tb_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Warehouse] FOREIGN KEY([w_id])
REFERENCES [dbo].[tb_warehouse] ([ID])
GO
ALTER TABLE [dbo].[tb_Order] CHECK CONSTRAINT [FK_Order_Warehouse]
GO
ALTER TABLE [dbo].[tb_shipper]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse] FOREIGN KEY([W_id])
REFERENCES [dbo].[tb_warehouse] ([ID])
GO
ALTER TABLE [dbo].[tb_shipper] CHECK CONSTRAINT [FK_Warehouse]
GO
ALTER TABLE [dbo].[tb_shipping]  WITH CHECK ADD  CONSTRAINT [FK_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_Order] ([Id])
GO
ALTER TABLE [dbo].[tb_shipping] CHECK CONSTRAINT [FK_Order]
GO
ALTER TABLE [dbo].[tb_shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipper] FOREIGN KEY([shipper_id])
REFERENCES [dbo].[tb_shipper] ([ID])
GO
ALTER TABLE [dbo].[tb_shipping] CHECK CONSTRAINT [FK_Shipper]
GO
USE [master]
GO
ALTER DATABASE [Transport] SET  READ_WRITE 
GO
