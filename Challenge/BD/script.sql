USE [master]
GO
/****** Object:  Database [Challenge]    Script Date: 11/09/2020 3:18:50 ******/
CREATE DATABASE [Challenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Challenge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Challenge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Challenge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Challenge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Challenge] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Challenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Challenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Challenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Challenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Challenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Challenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [Challenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Challenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Challenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Challenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Challenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Challenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Challenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Challenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Challenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Challenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Challenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Challenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Challenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Challenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Challenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Challenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Challenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Challenge] SET RECOVERY FULL 
GO
ALTER DATABASE [Challenge] SET  MULTI_USER 
GO
ALTER DATABASE [Challenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Challenge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Challenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Challenge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Challenge] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Challenge', N'ON'
GO
ALTER DATABASE [Challenge] SET QUERY_STORE = OFF
GO
USE [Challenge]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 11/09/2020 3:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[IdTipoContrato] [int] IDENTITY(1,1) NOT NULL,
	[TipoContrato] [varchar](20) NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[IdTipoContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/09/2020 3:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoContrato] [int] NULL,
	[Legajo] [varchar](10) NULL,
	[Dni] [varchar](15) NULL,
	[Apellido] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Salario] [decimal](12, 2) NULL,
	[FechaAlta] [date] NULL,
	[FechaBaja] [date] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contrato] ON 

INSERT [dbo].[Contrato] ([IdTipoContrato], [TipoContrato]) VALUES (1, N'PorHora')
INSERT [dbo].[Contrato] ([IdTipoContrato], [TipoContrato]) VALUES (2, N'Mensual')
SET IDENTITY_INSERT [dbo].[Contrato] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (1, 1, N'000010', N'39328292', N'Juarez', N'Juan', CAST(100.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (2, 2, N'000011', N'38326481', N'Diaz', N'Hernan', CAST(30000.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (3, 1, N'000012', N'40694512', N'Gonzalez', N'Emilce', CAST(150.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (4, 1, N'000013', N'39321654', N'Vega', N'Fernando', CAST(125.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (5, 2, N'000014', N'41253985', N'Garcia', N'Nicolas', CAST(25000.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (6, 1, N'000015', N'39124362', N'Perez', N'Diego', CAST(130.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (7, 2, N'000016', N'37856123', N'Gomez', N'Lautaro', CAST(28000.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (8, 1, N'000017', N'36124778', N'Ruiz', N'Julian', CAST(135.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (9, 1, N'000018', N'41235639', N'Luna', N'Victor', CAST(200.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdTipoContrato], [Legajo], [Dni], [Apellido], [Nombre], [Salario], [FechaAlta], [FechaBaja]) VALUES (10, 1, N'000019', N'43263956', N'Molina', N'Lucas', CAST(300.00 AS Decimal(12, 2)), CAST(N'2020-09-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
USE [master]
GO
ALTER DATABASE [Challenge] SET  READ_WRITE 
GO
