USE [master]
GO
/****** Object:  Database [Deposito]    Script Date: 01/12/2018 1:20:11 ******/
CREATE DATABASE [Deposito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Deposito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Deposito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Deposito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Deposito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Deposito] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deposito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deposito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deposito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deposito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deposito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deposito] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deposito] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Deposito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deposito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deposito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deposito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deposito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deposito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deposito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deposito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deposito] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Deposito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deposito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deposito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deposito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deposito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deposito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deposito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deposito] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Deposito] SET  MULTI_USER 
GO
ALTER DATABASE [Deposito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deposito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deposito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deposito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Deposito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Deposito] SET QUERY_STORE = OFF
GO
USE [Deposito]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 01/12/2018 1:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClasificaEn]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClasificaEn](
	[IdClasificaEn] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClasificaEn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envase]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envase](
	[IdEnvase] [int] IDENTITY(1,1) NOT NULL,
	[Peso] [float] NULL,
	[Volumen] [float] NULL,
	[Descripcion] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnvase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoLote]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoLote](
	[Codigo] [varchar](1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FichaInventario]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FichaInventario](
	[IdFichaInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdLote] [int] NOT NULL,
	[CodigoEstadoLote] [varchar](1) NOT NULL,
	[Año] [int] NULL,
	[Semana] [date] NULL,
	[OberservacionesGenerales] [varchar](150) NULL,
	[IdTecnicoBromatologico] [int] NOT NULL,
 CONSTRAINT [PK__FichaInv__672E4C6D8DB0304B] PRIMARY KEY CLUSTERED 
(
	[IdFichaInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incluye]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incluye](
	[IdIncluye] [int] IDENTITY(1,1) NOT NULL,
	[NroMarcoRegulatorio] [varchar](5) NOT NULL,
	[IdVerificacion] [int] NOT NULL,
	[NombreTecnico] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Incluye__8C63940DDAB9923B] PRIMARY KEY CLUSTERED 
(
	[IdIncluye] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaVerificacion]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaVerificacion](
	[IdListaVerificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdVerificacion] [int] NOT NULL,
	[IdFichaInventario] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Resultado] [varchar](150) NULL,
 CONSTRAINT [PK_ListaVerificacion] PRIMARY KEY CLUSTERED 
(
	[IdListaVerificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lote]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lote](
	[IdLote] [int] IDENTITY(1,1) NOT NULL,
	[FechaEntrada] [date] NULL,
	[FechaRetiro] [date] NULL,
	[CantidadAlmacenada] [int] NULL,
	[IdPresentado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[NombreMarca] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcoRegulatorio]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcoRegulatorio](
	[Nro] [varchar](5) NOT NULL,
	[Duracion] [varchar](4) NULL,
	[TemperaturaMinima] [float] NULL,
	[TemperaturaMaxima] [float] NULL,
 CONSTRAINT [PK__MarcoReg__C7D1FFB73C513B04] PRIMARY KEY CLUSTERED 
(
	[Nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentado]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentado](
	[IdPresentado] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdEnvase] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPresentado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[RNE] [char](6) NOT NULL,
	[RNPA] [char](7) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[NombreFantasIa] [varchar](50) NOT NULL,
	[Descripcion] [varchar](150) NULL,
	[FechaEmision] [date] NULL,
	[FechaVencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReguladoPor]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReguladoPor](
	[IdReguladoPor] [int] IDENTITY(1,1) NOT NULL,
	[IdPresentado] [int] NOT NULL,
	[NroMarcoRegulatorio] [varchar](5) NOT NULL,
 CONSTRAINT [PK__Regulado__B62B95A61279C752] PRIMARY KEY CLUSTERED 
(
	[IdReguladoPor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TecnicoBromatologico]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TecnicoBromatologico](
	[TecnicoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](100) NOT NULL,
	[DNI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TecnicoBromatologico] PRIMARY KEY CLUSTERED 
(
	[TecnicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verificacion]    Script Date: 01/12/2018 1:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verificacion](
	[IdVerificacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVerificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (1, N'Cagegoria 1')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (2, N'Cagegoria 2')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (3, N'Cagegoria 3')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[ClasificaEn] ON 

INSERT [dbo].[ClasificaEn] ([IdClasificaEn], [IdProducto], [IdCategoria]) VALUES (1, 1, 1)
INSERT [dbo].[ClasificaEn] ([IdClasificaEn], [IdProducto], [IdCategoria]) VALUES (2, 2, 2)
INSERT [dbo].[ClasificaEn] ([IdClasificaEn], [IdProducto], [IdCategoria]) VALUES (3, 1, 3)
INSERT [dbo].[ClasificaEn] ([IdClasificaEn], [IdProducto], [IdCategoria]) VALUES (4, 3, 1)
INSERT [dbo].[ClasificaEn] ([IdClasificaEn], [IdProducto], [IdCategoria]) VALUES (5, 2, 3)
SET IDENTITY_INSERT [dbo].[ClasificaEn] OFF
SET IDENTITY_INSERT [dbo].[Envase] ON 

INSERT [dbo].[Envase] ([IdEnvase], [Peso], [Volumen], [Descripcion]) VALUES (1, 800, 2, N'caja')
INSERT [dbo].[Envase] ([IdEnvase], [Peso], [Volumen], [Descripcion]) VALUES (2, 30, 2, N'envoltorio plastico')
INSERT [dbo].[Envase] ([IdEnvase], [Peso], [Volumen], [Descripcion]) VALUES (3, 500, 3, N'envoltorio plastico')
INSERT [dbo].[Envase] ([IdEnvase], [Peso], [Volumen], [Descripcion]) VALUES (4, 500, 4, N'sachet plastico sellado al vacio')
INSERT [dbo].[Envase] ([IdEnvase], [Peso], [Volumen], [Descripcion]) VALUES (5, 250, 5, N'envase vidrio tapa plastica')
SET IDENTITY_INSERT [dbo].[Envase] OFF
INSERT [dbo].[EstadoLote] ([Codigo], [Descripcion]) VALUES (N'D', N'Distribuido')
INSERT [dbo].[EstadoLote] ([Codigo], [Descripcion]) VALUES (N'P', N'En sotck')
INSERT [dbo].[EstadoLote] ([Codigo], [Descripcion]) VALUES (N'R', N'no conforme y retirado')
INSERT [dbo].[EstadoLote] ([Codigo], [Descripcion]) VALUES (N'v', N'vencido y desechado')
SET IDENTITY_INSERT [dbo].[Incluye] ON 

INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (6, N'201', 1, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (7, N'201', 2, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (8, N'201', 3, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (9, N'201', 5, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (10, N'195', 1, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (11, N'195', 2, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (12, N'195', 3, N'error')
INSERT [dbo].[Incluye] ([IdIncluye], [NroMarcoRegulatorio], [IdVerificacion], [NombreTecnico]) VALUES (13, N'195', 4, N'error')
SET IDENTITY_INSERT [dbo].[Incluye] OFF
SET IDENTITY_INSERT [dbo].[Lote] ON 

INSERT [dbo].[Lote] ([IdLote], [FechaEntrada], [FechaRetiro], [CantidadAlmacenada], [IdPresentado]) VALUES (1, CAST(N'2018-12-01' AS Date), CAST(N'2018-12-10' AS Date), 10, 1)
SET IDENTITY_INSERT [dbo].[Lote] OFF
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (1, N'La serenisima')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (2, N'Arcor')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (3, N'knorr')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (5, N'Natura')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (6, N'La virginia')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca]) VALUES (7, N'Lucchetti')
SET IDENTITY_INSERT [dbo].[Marca] OFF
INSERT [dbo].[MarcoRegulatorio] ([Nro], [Duracion], [TemperaturaMinima], [TemperaturaMaxima]) VALUES (N'195', N'30', 0, 30)
INSERT [dbo].[MarcoRegulatorio] ([Nro], [Duracion], [TemperaturaMinima], [TemperaturaMaxima]) VALUES (N'201', N'10', 20, 30)
SET IDENTITY_INSERT [dbo].[Presentado] ON 

INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (1, 1, 1)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (2, 2, 1)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (3, 3, 2)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (4, 4, 2)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (5, 5, 3)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (6, 6, 3)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (7, 7, 4)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (8, 8, 4)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (9, 9, 5)
INSERT [dbo].[Presentado] ([IdPresentado], [IdProducto], [IdEnvase]) VALUES (10, 10, 5)
SET IDENTITY_INSERT [dbo].[Presentado] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (1, N'1     ', N'1      ', 1, N'Leche', N'Leche entera en polvo', CAST(N'2018-11-01' AS Date), CAST(N'2019-11-01' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (2, N'2     ', N'2      ', 1, N'Leche', N'Leche descremada en polvo', CAST(N'2018-11-01' AS Date), CAST(N'2019-11-01' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (3, N'3     ', N'3      ', 2, N'cereal mix', N'barrita de cereal yoghurt vainilla', CAST(N'2018-11-01' AS Date), CAST(N'2020-11-01' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (4, N'3     ', N'4      ', 2, N'cereal mix', N'barrita de cereal yoghurt frutilla', CAST(N'2018-10-10' AS Date), CAST(N'2020-10-10' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (5, N'4     ', N'5      ', 3, N'Mostachol', N'fideo seco', CAST(N'2018-06-08' AS Date), CAST(N'2020-06-08' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (6, N'4     ', N'6      ', 3, N'Tirabuzon', N'fideo seco', CAST(N'2018-06-08' AS Date), CAST(N'2020-06-08' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (7, N'5     ', N'7      ', 5, N'mayonesa', N'mayonesa reducida en valor lipidico', CAST(N'2018-07-22' AS Date), CAST(N'2019-07-22' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (8, N'5     ', N'8      ', 5, N'Ketchup', N'ketchup con tomate natural', CAST(N'2018-05-28' AS Date), CAST(N'2018-05-28' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (9, N'6     ', N'9      ', 6, N'cafe ', N'molido', CAST(N'2018-10-10' AS Date), CAST(N'2022-10-10' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [RNE], [RNPA], [IdMarca], [NombreFantasIa], [Descripcion], [FechaEmision], [FechaVencimiento]) VALUES (10, N'6     ', N'10     ', 6, N'cafe', N'tostado molido', CAST(N'2018-10-10' AS Date), CAST(N'2022-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[ReguladoPor] ON 

INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (5, 1, N'201')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (6, 2, N'201')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (7, 3, N'201')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (8, 4, N'201')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (9, 5, N'201')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (10, 6, N'195')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (11, 7, N'195')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (12, 8, N'195')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (13, 9, N'195')
INSERT [dbo].[ReguladoPor] ([IdReguladoPor], [IdPresentado], [NroMarcoRegulatorio]) VALUES (14, 10, N'195')
SET IDENTITY_INSERT [dbo].[ReguladoPor] OFF
SET IDENTITY_INSERT [dbo].[TecnicoBromatologico] ON 

INSERT [dbo].[TecnicoBromatologico] ([TecnicoId], [NombreCompleto], [DNI]) VALUES (1, N'pepito perez', N'1')
INSERT [dbo].[TecnicoBromatologico] ([TecnicoId], [NombreCompleto], [DNI]) VALUES (2, N'juancito lopez', N'2')
INSERT [dbo].[TecnicoBromatologico] ([TecnicoId], [NombreCompleto], [DNI]) VALUES (3, N'fulanito sanches', N'3')
SET IDENTITY_INSERT [dbo].[TecnicoBromatologico] OFF
SET IDENTITY_INSERT [dbo].[Verificacion] ON 

INSERT [dbo].[Verificacion] ([IdVerificacion], [Descripcion]) VALUES (1, N'trazabilidad')
INSERT [dbo].[Verificacion] ([IdVerificacion], [Descripcion]) VALUES (2, N'fecha de elaboracion')
INSERT [dbo].[Verificacion] ([IdVerificacion], [Descripcion]) VALUES (3, N'fecha de vencimiento')
INSERT [dbo].[Verificacion] ([IdVerificacion], [Descripcion]) VALUES (4, N'contenido alcoholico')
INSERT [dbo].[Verificacion] ([IdVerificacion], [Descripcion]) VALUES (5, N'presencia de gluten')
SET IDENTITY_INSERT [dbo].[Verificacion] OFF
ALTER TABLE [dbo].[ClasificaEn]  WITH CHECK ADD  CONSTRAINT [FK_ClasificaEn_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[ClasificaEn] CHECK CONSTRAINT [FK_ClasificaEn_Categoria]
GO
ALTER TABLE [dbo].[ClasificaEn]  WITH CHECK ADD  CONSTRAINT [FK_ClasificaEn_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ClasificaEn] CHECK CONSTRAINT [FK_ClasificaEn_Producto]
GO
ALTER TABLE [dbo].[FichaInventario]  WITH CHECK ADD  CONSTRAINT [FK__FichaInve__Codig__36B12243] FOREIGN KEY([CodigoEstadoLote])
REFERENCES [dbo].[EstadoLote] ([Codigo])
GO
ALTER TABLE [dbo].[FichaInventario] CHECK CONSTRAINT [FK__FichaInve__Codig__36B12243]
GO
ALTER TABLE [dbo].[FichaInventario]  WITH CHECK ADD  CONSTRAINT [FK__FichaInve__IdLot__35BCFE0A] FOREIGN KEY([IdLote])
REFERENCES [dbo].[Lote] ([IdLote])
GO
ALTER TABLE [dbo].[FichaInventario] CHECK CONSTRAINT [FK__FichaInve__IdLot__35BCFE0A]
GO
ALTER TABLE [dbo].[FichaInventario]  WITH CHECK ADD  CONSTRAINT [FK_FichaInventario_TecnicoBromatologico] FOREIGN KEY([IdTecnicoBromatologico])
REFERENCES [dbo].[TecnicoBromatologico] ([TecnicoId])
GO
ALTER TABLE [dbo].[FichaInventario] CHECK CONSTRAINT [FK_FichaInventario_TecnicoBromatologico]
GO
ALTER TABLE [dbo].[Incluye]  WITH CHECK ADD  CONSTRAINT [FK__Incluye__IdVerif__693CA210] FOREIGN KEY([IdVerificacion])
REFERENCES [dbo].[Verificacion] ([IdVerificacion])
GO
ALTER TABLE [dbo].[Incluye] CHECK CONSTRAINT [FK__Incluye__IdVerif__693CA210]
GO
ALTER TABLE [dbo].[Incluye]  WITH CHECK ADD  CONSTRAINT [FK__Incluye__NroMarc__6A30C649] FOREIGN KEY([NroMarcoRegulatorio])
REFERENCES [dbo].[MarcoRegulatorio] ([Nro])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Incluye] CHECK CONSTRAINT [FK__Incluye__NroMarc__6A30C649]
GO
ALTER TABLE [dbo].[ListaVerificacion]  WITH CHECK ADD  CONSTRAINT [FK__ListaVeri__IdFic__46E78A0C] FOREIGN KEY([IdFichaInventario])
REFERENCES [dbo].[FichaInventario] ([IdFichaInventario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListaVerificacion] CHECK CONSTRAINT [FK__ListaVeri__IdFic__46E78A0C]
GO
ALTER TABLE [dbo].[Lote]  WITH CHECK ADD FOREIGN KEY([IdPresentado])
REFERENCES [dbo].[Presentado] ([IdPresentado])
GO
ALTER TABLE [dbo].[Presentado]  WITH CHECK ADD  CONSTRAINT [FK_Presentado_Envase] FOREIGN KEY([IdEnvase])
REFERENCES [dbo].[Envase] ([IdEnvase])
GO
ALTER TABLE [dbo].[Presentado] CHECK CONSTRAINT [FK_Presentado_Envase]
GO
ALTER TABLE [dbo].[Presentado]  WITH CHECK ADD  CONSTRAINT [FK_Presentado_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Presentado] CHECK CONSTRAINT [FK_Presentado_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[ReguladoPor]  WITH CHECK ADD  CONSTRAINT [FK__ReguladoP__IdPre__70DDC3D8] FOREIGN KEY([IdPresentado])
REFERENCES [dbo].[Presentado] ([IdPresentado])
GO
ALTER TABLE [dbo].[ReguladoPor] CHECK CONSTRAINT [FK__ReguladoP__IdPre__70DDC3D8]
GO
ALTER TABLE [dbo].[ReguladoPor]  WITH CHECK ADD  CONSTRAINT [FK__ReguladoP__NroMa__71D1E811] FOREIGN KEY([NroMarcoRegulatorio])
REFERENCES [dbo].[MarcoRegulatorio] ([Nro])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReguladoPor] CHECK CONSTRAINT [FK__ReguladoP__NroMa__71D1E811]
GO
ALTER TABLE [dbo].[FichaInventario]  WITH CHECK ADD  CONSTRAINT [CK__FichaInvent__Año__37A5467C] CHECK  (([Año]>(0) AND [Año]<(9999)))
GO
ALTER TABLE [dbo].[FichaInventario] CHECK CONSTRAINT [CK__FichaInvent__Año__37A5467C]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaVerificacion', @level2type=N'COLUMN',@level2name=N'IdListaVerificacion'
GO
USE [master]
GO
ALTER DATABASE [Deposito] SET  READ_WRITE 
GO
