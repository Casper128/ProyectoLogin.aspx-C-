USE [master]
GO
/****** Object:  Database [Sisevid]    Script Date: 8/12/2022 00:12:41 ******/
CREATE DATABASE [Sisevid]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sisevid', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sisevid.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sisevid_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sisevid_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sisevid] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sisevid].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sisevid] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sisevid] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sisevid] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sisevid] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sisevid] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sisevid] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sisevid] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sisevid] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sisevid] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sisevid] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sisevid] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sisevid] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sisevid] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sisevid] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sisevid] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sisevid] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sisevid] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sisevid] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sisevid] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sisevid] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sisevid] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sisevid] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sisevid] SET RECOVERY FULL 
GO
ALTER DATABASE [Sisevid] SET  MULTI_USER 
GO
ALTER DATABASE [Sisevid] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sisevid] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sisevid] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sisevid] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sisevid] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sisevid] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sisevid', N'ON'
GO
ALTER DATABASE [Sisevid] SET QUERY_STORE = OFF
GO
USE [Sisevid]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evidencia]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evidencia](
	[IdEvidencia] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](45) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[Tipo] [varchar](45) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[Latitud] [varchar](45) NOT NULL,
	[Longitud] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleEstado]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEstado](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[FkEstado] [int] NULL,
	[FkEvidencia] [int] NULL,
	[FkUsuarioDetalle] [int] NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleEvidencias]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEvidencias](
	[FkEvidenciaDetalle] [int] NULL,
	[FkArticulo] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_tabla_Evidencia]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_tabla_Evidencia]
AS
SELECT        dbo.evidencia.IdEvidencia, dbo.evidencia.Titulo, dbo.evidencia.Descripcion, dbo.evidencia.Tipo, dbo.evidencia.FechaCreacion, dbo.evidencia.FechaRegistro, dbo.evidencia.Latitud, dbo.evidencia.Longitud, 
                         dbo.Estados.IdEstado, dbo.Estados.Estado
FROM            (SELECT        FkEvidencia, MAX(FkEstado) AS MayorRegistroEstado
                          FROM            dbo.DetalleEstado
                          GROUP BY FkEvidencia) AS DetalleEst INNER JOIN
                         dbo.Estados ON DetalleEst.MayorRegistroEstado = dbo.Estados.IdEstado INNER JOIN
                         dbo.evidencia ON DetalleEst.FkEvidencia = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.DetalleEvidencias ON dbo.evidencia.IdEvidencia = dbo.DetalleEvidencias.FkEvidenciaDetalle
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[NombreAutor] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleAutores]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleAutores](
	[IdDetalleAutores] [int] IDENTITY(1,1) NOT NULL,
	[FkAutor] [int] NULL,
	[FkEvidenciaAutor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleAutores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblarticulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblarticulo](
	[id] [varchar](3) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[descripcion] [varchar](4000) NOT NULL,
	[fkidtitulo] [varchar](1) NOT NULL,
	[fkidcapitulo] [varchar](1) NOT NULL,
	[fkidseccion] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcapitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcapitulo](
	[id] [varchar](1) NOT NULL,
	[condicion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblliteral]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblliteral](
	[id] [varchar](3) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[fkidarticulo] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblnumeral]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblnumeral](
	[id] [varchar](4) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[fkidliteral] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblparagrafo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblparagrafo](
	[id] [varchar](3) NOT NULL,
	[descripcion] [varchar](4000) NOT NULL,
	[fkidarticulo] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrol]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrol_usuario]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrol_usuario](
	[fkIdUsuario] [int] NOT NULL,
	[fkIdRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblseccion]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblseccion](
	[id] [varchar](1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbltitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltitulo](
	[id] [varchar](1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](16) NOT NULL,
	[contrasenia] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 

INSERT [dbo].[Autores] ([IdAutor], [NombreAutor]) VALUES (1, N'Kevin')
INSERT [dbo].[Autores] ([IdAutor], [NombreAutor]) VALUES (2, N'Darwin')
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleAutores] ON 

INSERT [dbo].[DetalleAutores] ([IdDetalleAutores], [FkAutor], [FkEvidenciaAutor]) VALUES (4, 1, 3)
INSERT [dbo].[DetalleAutores] ([IdDetalleAutores], [FkAutor], [FkEvidenciaAutor]) VALUES (5, 2, 3)
INSERT [dbo].[DetalleAutores] ([IdDetalleAutores], [FkAutor], [FkEvidenciaAutor]) VALUES (6, 1, 2)
INSERT [dbo].[DetalleAutores] ([IdDetalleAutores], [FkAutor], [FkEvidenciaAutor]) VALUES (7, 2, 2)
SET IDENTITY_INSERT [dbo].[DetalleAutores] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleEstado] ON 

INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (1, 1, 1, 1, CAST(N'2022-11-27T02:25:22.833' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (2, 1, 2, 1, CAST(N'2022-11-27T02:25:22.833' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (3, 1, 3, 1, CAST(N'2022-11-27T02:25:22.833' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (5, 1, 5, 1, CAST(N'2022-12-03T00:12:55.830' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (6, 1, 6, 7, CAST(N'2022-12-03T02:50:07.360' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (7, 1, 7, 7, CAST(N'2022-12-03T04:13:18.720' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (8, 1, 8, 7, CAST(N'2022-12-03T04:21:47.313' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (9, 1, 9, 7, CAST(N'2022-12-03T04:23:10.297' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (10, 1, 10, 7, CAST(N'2022-12-03T06:21:56.767' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (11, 1, 11, 1, CAST(N'2022-12-03T07:38:37.373' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (12, 1, 12, 1, CAST(N'2022-12-03T08:01:14.387' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (13, 1, 13, 1, CAST(N'2022-12-03T08:05:41.243' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (16, 2, 2, 3, CAST(N'2022-12-03T08:49:16.877' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (17, 2, 3, 1, CAST(N'2022-12-03T08:52:45.950' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (18, 1, 14, 7, CAST(N'2022-12-06T10:38:59.110' AS DateTime))
INSERT [dbo].[DetalleEstado] ([IdDetalle], [FkEstado], [FkEvidencia], [FkUsuarioDetalle], [Fecha]) VALUES (19, 2, 5, 7, CAST(N'2022-12-08T00:02:51.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[DetalleEstado] OFF
GO
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (1, N'18')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (2, N'2')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (3, N'25')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (4, N'4')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (5, N'2')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (6, N'11')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (7, N'5')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (11, N'4')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (13, N'2')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (8, N'12')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (9, N'14')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (10, N'11')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (12, N'3')
INSERT [dbo].[DetalleEvidencias] ([FkEvidenciaDetalle], [FkArticulo]) VALUES (14, N'2')
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([IdEstado], [Estado]) VALUES (1, N'Registrada en verificación')
INSERT [dbo].[Estados] ([IdEstado], [Estado]) VALUES (2, N'Verificada en validación')
INSERT [dbo].[Estados] ([IdEstado], [Estado]) VALUES (3, N'Verificada y Validada')
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[evidencia] ON 

INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (1, N'La Lista de Schilder', N'Pelicula de guerra de mafias', N'Belica', CAST(N'2022-10-15' AS Date), CAST(N'2022-10-15' AS Date), N'45', N'13')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (2, N'Isla Misteriosa', N'Libro de isla', N'Misterio', CAST(N'2022-10-01' AS Date), CAST(N'2022-10-29' AS Date), N'123', N'456')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (3, N'El resplandor de una mente', N'Perdida de memoria ', N'Drama', CAST(N'2022-10-15' AS Date), CAST(N'2022-10-15' AS Date), N'456', N'123')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (4, N'Cuestion de tiempo', N'Sci-Fi', N'Ciencia ficcion', CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), N'26', N'24')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (5, N'Taller', N'Imposible', N'Examen 20%', CAST(N'2022-12-08' AS Date), CAST(N'2022-12-01' AS Date), N'12', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (6, N'Examen', N'100%', N'45', CAST(N'2022-12-18' AS Date), CAST(N'2022-12-16' AS Date), N'12', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (7, N'sada', N'sdadaa', N'sdadas', CAST(N'2022-12-22' AS Date), CAST(N'2022-12-07' AS Date), N'45', N'456')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (8, N'srqs', N'eqw', N'eqewq', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-01' AS Date), N'412', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (9, N'sad', N'dsada', N'sdadaa', CAST(N'2022-12-15' AS Date), CAST(N'2022-12-08' AS Date), N'45', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (10, N'dsadas', N'sdada', N'dsad', CAST(N'2022-12-07' AS Date), CAST(N'2022-12-15' AS Date), N'1234', N'4354')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (11, N'Version1', N'Imposible', N'Examen 20%', CAST(N'2022-11-30' AS Date), CAST(N'2022-11-30' AS Date), N'12', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (12, N'dsa', N'dasda', N'dassa', CAST(N'2022-12-06' AS Date), CAST(N'2022-12-07' AS Date), N'14', N'15')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (13, N'Version2', N'Imposible', N'Examen 20%', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-01' AS Date), N'12', N'45')
INSERT [dbo].[evidencia] ([IdEvidencia], [Titulo], [Descripcion], [Tipo], [FechaCreacion], [FechaRegistro], [Latitud], [Longitud]) VALUES (14, N'sada', N'dsad', N'asda', CAST(N'2022-12-15' AS Date), CAST(N'2022-12-14' AS Date), N'45', N'757')
SET IDENTITY_INSERT [dbo].[evidencia] OFF
GO
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'1', N'Objeto', N'La presente resolución tiene como objeto establecer los parámetros de autoevaluación, verificación y evaluación de cada Una de las condiciones institucionales definidas en el Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019, las cuales deben ser demostradas integralmente en el marco de los procesos de solicitud y renovación del registro calificado de programas 
académicos de educación superior.', N'1', N'0', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'10', N'Información cualitativa y cuantitativa para mejorar el bienestar, la permanencia y graduación de los estudiantes.', N'La institución deberá conocer de los estudiantes que son admitidos el rendimiento académico, el desempeño en el Examen de Estado de la Educación Media, ICFES - SABER 11”, aspectos socioeconómicos y demás aspectos culturales que puedan incidir en el mejoramiento del bienestar, en el acompañamiento del proceso formativo, en la permanencia y en la graduación oportuna.', N'2', N'1', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'11', N'Evaluación, seguimiento y retroalimentación de los estudiantes', N'La institución deberá contar con políticas para la evaluación, el seguimiento y la retroalimentación a los estudiantes, en coherencia con el proceso formativo, los niveles y las modalidades en los que se ofrecen los programas académicos. Esto implica que las unidades académicas, o lo que haga sus veces, al igual que las empresas, entidades, organizaciones y demás entes que estén involucrados en las actividades académicas y en el proceso formativo, adopten dichas políticas y sean responsables de la evaluación, seguimiento y retroalimentación de los estudiantes.', N'2', N'2', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'12', N'Comunicación con estudiantes.', N'La institución deberá demostrar la existencia de medios de comunicación de fácil acceso a los estudiantes, en los cuales esté disponible la información necesaria para desarrollar las actividades académicas del proceso formativo. Además, deberá garantizar que la información que se le brinde a quien aspira a ser admitido en la institución sea clara y contenga, por lo menos: ', N'2', N'1', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'13', N'Evidencias e indicadores de los mecanismos que soportan la selección y evaluación de estudiantes.', N'Teniendo en cuenta los artículos precedentes de esta sección, la institución deberá presentar para el proceso formativo, por lo menos: ', N'2', N'1', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'14', N'Mecanismos que soportan la selección y evaluación de profesores.', N'La institución deberá proporcionar los criterios y argumentos que indiquen la forma en que los mecanismos de selección y evaluación de profesores son coherentes con la naturaleza jurídica, tipología, identidad y misión institucional. Dichos mecanismos deberán estar incorporados en la normativa institucional  vigente en el momento en que la institución inicie la etapa de Pre radicación de solicitud de registro calificado y deberán estar aprobados por las instancias del  gobiemo institucional correspondientes. ', N'2', N'3', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'15', N'Características del grupo institucional de profesores.', N'La institución 
deberá describir el grupo de profesores con el que cuenta, grupo que, por su dedicación, vinculación y disponibilidad, deberá cubrir, de manera consistente y armónica con su naturaleza jurídica, tipología, identidad y misión institucional, todas las labores académicas, formativas, docentes, cientificas, culturales y de extensión que desarrolle la institución,definidas en su proyecto educativo institucional, O lo que haga sus veces. Dicha descripción deberá incluir, por lo menos: ', N'2', N'1', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'16', N'Reglamento profesoral o su equivalente.', N'El reglamento profesoral o su equivalente y los demás documentos debidamente aprobados por las autoridades o instancias competentes de la institución deberán considerar los niveles de formación, las modalidades y los lugares diferentes a la institución donde se realicen las actividades propias del desarrollo como profesor. En coherencia y consistencia con la naturaleza jurídica, tipología, identidad y misión, el reglamento deberá ser claro y expreso, y contemplar por lo menos:', N'2', N'1', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'17', N'Mecanismos para la implementación de los planes institucionales 
y el desarrollo de actividades académicas.', N'La institución deberá contar, por lo menos, con los siguientes mecanismos que faciliten la implementación de los planes institucionales y el desarrollo de las actividades académicas: ', N'2', N'1', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'18', N'Evidencias e indicadores de los mecanismos que soportan la selección y evaluación de profesores.', N'Teniendo en cuenta los artículos precedentes de esta sección, la institución deberá presentar, por lo menos: ', N'2', N'1', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'19', N'Gobierno institucional y rendición de cuentas.', N'La institución deberá proporcionar los criterios y argumentos que indican la forma en que el gobierno institucional y la rendición de cuentas son coherentes con la naturaleza jurídica, tipología, identidad y misión institucional. Dichos mecanismos deberán estar incorporados en la normativa institucional vigente al momento en que la institución inicie la etapa de Pre radicación y deberán estar aprobados por las instancias de gobiemo correspondientes.', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'2', N'Ámbito de aplicación', N'La presente resolución aplica al Ministerio de Educación Nacional, a la Comisión Nacional Intersectorial de Aseguramiento de la Calidad de la Educación Superior - Conaces, a los pares académicos que participan en los procesos de registro calificado, a las instituciones de educación superior y aquellas habilitadas por la ley para ofrecer y desarrollar programas académicos de educación superior.', N'2', N'2', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'20', N'Gobierno institucional.', N'La institución deberá establecer y demostrar la existencia de un gobierno institucional atendiendo su naturaleza jurídica, identidad, tipología y misión. Para ello, la institución deberá, por lo menos: ', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'21', N'Rendición de cuentas institucional.', N'La institución deberá establecer sus mecanismos de rendición de cuentas atendiendo su naturaleza jurídica, identidad, tipología y misión. Para ello, deberá indicar, a quiénes rendirá cuentas sobre el desempeño institucional, la periodicidad y los medios de difusión a utilizar, entre otros aspectos, teniendo en cuenta lo previsto en el Acuerdo 02 de 2017 del Consejo Nacional de Educación Superior - CESU.', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'22', N'Participación de la comunidad académica en procesos de toma de decisiones. ', N'Desde su autonomía y modelo de gobierno, y en coherencia con la naturaleza jurídica, tipología, identidad, misión, estatutos y demás reglamentos, la institución deberá demostrar los espacios de participación de la comunidad académica en los procesos de toma de decisiones. ', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'23', N'Políticas institucionales.', N'Hace referencia al marco normativo complementario a los estatutos. La institución deberá exponer las instancias competentes y los procedimientos institucionales que se deben adelantar para la formulación, aprobación, comunicación y actualización de los reglamentos intemos, así como el seguimiento a su cumplimiento y los medios dispuestos para que la comunidad académica tenga claridad de dichas instancias y procedimientos.', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'24', N'Políticas académicas asociadas a currículo, resultados de aprendizaje, créditos y actividades.', N'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la institución, y en coherencia con su naturaleza jurídica, identidad, tipología y misión, las políticas académicas deberán, por lo menos: ', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'25', N'Políticas de gestión institucional y bienestar.', N'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la institución, en coherencia con su naturaleza jurídica, identidad, tipología y misión, las políticas de gestión institucional y bienestar deberán, orientar como mínimo los siguientes aspectos: ', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'26', N'Políticas de investigación, innovación, creación artística y cultural.', N'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la institución, en coherencia con su naturaleza jurídica, identidad, tipología y misión, las políticas de investigación, innovación, creación artística y cultural estarán encaminadas a fomentar, fortalecer y desarrollar la ciencia, tecnología e innovación, contribuyendo así a la transformación social del país. En consecuencia, la institución deberá, por lo menos, indicar:', N'2', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'3', N'Condiciones institucionales de calidad.', N'De conformidad con las disposiciones de la Ley 1188 de 2008 y del Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019, las condiciones de calidad institucionales establecidas para la obtención y renovación del registro calificado son:', N'1', N'1', N'2')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'4', N'Evidencias', N'Cada una de las condiciones institucionales que se 
desarrolla en esta resolución, comprende un conjunto de evidencias que son el respaldo para la verificación y evaluación de las instituciones en el proceso de obtención y renovación del registro calificado, sirviendo así para el cumplimiento de las funciones de los pares académicos y de la Comisión Nacional Intersectorial de Aseguramiento de la Calidad de la Educación Superior - Conaces.', N'2', N'3', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'5', N'Autoevaluación', N'En los trámites asociados con el registro calificado, las instituciones deberán desarrollar, en el marco de su sistema interno de aseguramiento de la calidad, las estrategias que proporcionen los instrumentos, la información y los espacios de interacción con la comunidad académica, necesarios para soportar el cumplimiento de las condiciones institucionales y de programa', N'1', N'2', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'6', N'Mecanismos de selección y evaluación de estudiantes y profesores', N'De acuerdo con su naturaleza jurídica, tipología, identidad y misión, la institución deberá contar con políticas, normas, procesos, medios y demás componentes que considere necesarios para la selección y evaluación de estudiantes y profesores', N'2', N'1', N'0')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'7', N'Mecanismos de selección y evaluación de estudiantes', N'La institución deberá proporcionar los criterios y argumentos que indiquen la forma en que los mecanismos de selección y evaluación de estudiantes son coherentes con la naturaleza jurídica, tipología, identidad y misión institucional. Dichos mecanismos deberán estar incorporados en la normativa institucional vigente en el momento en que la institución inicie la etapa de Pre radicación de solicitud de registro calificado y deberán estar aprobados por las instancias de gobierno correspondientes', N'2', N'1', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'8', N'Reglamento estudiantil o su equivalente', N'El reglamento estudiantil o su equivalente deberá considerar los niveles de formación y las modalidades en las que oferta sus programas. En coherencia y consistencia con la naturaleza jurídica, misión, identidad y tipología, el reglamento deberá ser claro y expreso, y contemplar por lo menos: ', N'2', N'1', N'1')
INSERT [dbo].[tblarticulo] ([id], [nombre], [descripcion], [fkidtitulo], [fkidcapitulo], [fkidseccion]) VALUES (N'9', N'Políticas para mejorar el bienestar, la permanencia y graduación de los estudiantes.', N'La institución deberá definir las políticas para mejorar el bienestar, la permanencia y graduación de los estudiantes, demostrando que están articuladas a los medios, procesos y acciones requeridos para tal fin.', N'2', N'1', N'1')
GO
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'0', N'NA')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'1', N'MECANISMOS DE SELECCIÓN Y EVALUACIÓN DE ESTUDIANTES Y PROFESORES')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'2', N'ESTRUCTURA ADMINISTRATIVA Y ACADÉMICA')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'3', N'CULTURA DE LA AUTOEVALUACIÓN')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'4', N'PROGRAMA DE EGRESADOS')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'5', N'MODELO DE BIENESTAR')
INSERT [dbo].[tblcapitulo] ([id], [condicion]) VALUES (N'6', N'RECURSOS SUFICIENTES PARA GARANTIZAR EL CUMPLIMIENTO DE LAS METAS')
GO
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a12', N'Deberes y derechos de los estudiantes.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a16', N'Derechos, deberes y obligaciones de los profesores.', N'16')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a20', N'Definir el modelo de gobierno institucional, que incluya:', N'20')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a25', N'La gestión de la comunidad institucional.', N'25')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a3', N'Mecanismos de selección y evaluación de estudiantes y profesores', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'a8', N'Derechos y deberes de los estudiantes', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b12', N'Costos asociados al proceso formativo que incluyan: el valor de la matrícula y los demás derechos pecuniarios que por razones académicas puedan ser cobrados por la institución.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b13', N'Reglamento estudiantil o su equivalente. ', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b18', N'Descripción de los procesos institucionales para definir, evaluar y actualizar los perfiles profesorales.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b20', N'Formular el proyecto educativo institucional o el que haga sus veces.', N'20')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b25', N'El alcance de los conceptos de equidad, diversidad e inclusión.', N'25')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b26', N'Las directrices para la promoción de la ética de la investigación, innovación, o creación artística y cultural y su práctica responsable.', N'26')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b3', N'Estructura administrativa y académica', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'b8', N'Condiciones para obtener distinciones e incentivos', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c12', N'Las políticas sobre reingresos, retiros, cambios de programas u otros que impliquen alguna decisión institucional al respecto.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c13', N'Evidencia del cumplimiento del reglamento estudiantil o su equivalente, respecto a: ', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c18', N'Perfiles institucionales de los profesores.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c20', N'Contar con procesos para la aprobación de cambios que tengan implicaciones en la identidad, tipología y misión institucional.', N'20')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c25', N'La gestión y asignación de los recursos institucionales para el desarrollo de políticas de bienestar.', N'25')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c26', N'Las directrices para la promoción de un ambiente para el desarrollo de la ciencia, la tecnología, la innovación o la creación artística y cultural', N'26')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c3', N'Cultura de la autoevaluación', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'c8', N'Políticas, criterios, requisitos y procesos de inscripción, admisión, ingreso, reingreso, transferencias, matrícula y evaluación', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd12', N'Trabajo académico autónomo del estudiante y de interacción con el profesor, representado en créditos académicos.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd13', N'Políticas para mejorar el bienestar, la permanencia y graduación de los estudiantes', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd16', N'Condiciones para apropiar y desplegar la cultura de la autoevaluación.', N'16')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd18', N'Descripción del grupo profesoral vigente que incluya información de su composición respecto a dedicación, vinculación y disponibilidad.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd20', N'Contar con procesos para soportar el sistema interno de aseguramiento de la calidad y planeación institucional.', N'20')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd25', N'El desarrollo de actividades culturales, deportivas, de salud mental y física, y demás dirigidas a toda la comunidad académica e institucional.', N'25')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd3', N'Programa de egresados', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'd8', N'Régimen disciplinario', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e12', N'Políticas o lo que haga sus veces, sobre evaluación y permanencia.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e13', N'Evidencia de los requisitos y criterios para los procesos de inscripción, admisión, 
ingreso, matrícula, evaluación y graduación de estudiantes.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e16', N'Trayectoria profesoral, o lo que haga sus veces, indicando los criterios para la vinculación, promoción, definición de categorías, retiro y demás situaciones administrativas.', N'16')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e18', N'Proyecciones, para los próximos 7 años, del plan de vinculación y dedicación institucional de los profesores.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e25', N'El desarrollo de actividades de gestión necesarias para cumplir los propósitos institucionales. ', N'25')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e26', N'La realamentación de propiedad intelectual.', N'26')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e3', N'Modelo de bienestar', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'e8', N'Homologación y reconocimiento de aprendizajes entre programas de la misma institución o de otras instituciones (nacionales y/o extranjeras)', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f12', N'Requisitos de grado.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f13', N'Información cualitativa y cuantitativa para mejorar el bienestar, la permanencia 
y la graduación de los estudiantes en la institución.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f16', N'Impedimentos, inhabilidades, incompatibilidades, conflicto de intereses y 
régimen disciplinario.', N'16')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f18', N'Reglamento profesoral o su equivalente.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f26', N'La roquiación de convenios y asociaciones relacionadas con el desarrollo de la investigación, innovación o creación artística y cultural.', N'26')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f3', N'Recursos suficientes para garantizar el cumplimiento de las metas', N'3')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'f8', N'Requisitos de grado', N'8')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'g12', N'Estrategias de acompañamiento en su proceso formativo que involucre temas académicos u otros que la institución provea para el desarrollo de los estudiantes.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'g13', N'Retroalimentación a los estudiantes e implementación de acciones basadas en 
las evaluaciones establecidas.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'g16', N'Todo aquello que, desde la naturaleza jurídica, tipología, identidad y misión 
institucional, tenga implicaciones en el desarrollo profesoral.', N'16')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'g18', N'Descripción de los procesos de selección, vinculación, desarrollo y desvinculación de los profesores.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'h12', N'Servicios de apoyo al estudiante, en coherencia con los niveles y las modalidades ofrecidas, y otros que promuevan su permanencia y graduación.', N'12')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'h13', N'Estudios que permitan implementar acciones frente a la deserción por cohorte 
y por periodo.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'i13', N'Descripción de los procesos para garantizar que la información entregada y 
publicada sea veraz, confiable, accesible y oportuna.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'i18', N'Evidencia del uso de medios de comunicación con los profesores que les permita conocer sus deberes y derechos.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'j18', N'Descripción de los procesos de inducción profesoral.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'k13', N'Descripción de los mecanismos que permitan verificar y asegurar que la identidad de quien cursa el programa corresponda a la del estudiante matriculado.', N'13')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'k18', N'Descripción de los procesos de seguimiento al análisis y valoración periódica de la asignación a las actividades de los profesores.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'l18', N'Descripción de los programas de desarrollo de competencias pedagógicas, tecnológicas y de investigación, innovación y/o creación artística y cultural.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'm18', N'Resultados de la implementación de los programas de desarrollo profesoral.', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'n18', N'Descripción del sistema de seguimiento, evaluación y retroalimentación a los profesores', N'18')
INSERT [dbo].[tblliteral] ([id], [descripcion], [fkidarticulo]) VALUES (N'o18', N'Resultado de la última evaluación y retroalimentación realizada a los profesores.', N'18')
GO
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'1a20', N'Definición de los órganos de gobierno y sus respectivas funciones.', N'a20')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'1c13', N'Derechos y deberes de los estudiantes.', N'c13')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'2a20', N'Definición de los demás órganos colegiados y sus atribuciones.', N'a20')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'2c13', N'Condiciones para obtener distinciones e incentivos.', N'c13')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'3a20', N'Definición del quorum en los órganos decisorios.', N'a20')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'3c13', N'Políticas, criterios, requisitos y procesos de inscripción, admisión, ingreso, reingreso, transferencias, matrícula y evaluación.', N'c13')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'4a20', N'Definición de las funciones, periodo y forma de elección del rector o rectores y vicerrectores, o los cargos equivalentes. ', N'a20')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'4c13', N'Régimen disciplinario.', N'c13')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'5a20', N'Delegaciones de funciones directivas, cuando aplique.', N'a20')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'5c13', N'Homologación y reconocimiento de aprendizajes entre programas de misma institución o de otras instituciones (nacionales y/o extranjeras).', N'c13')
INSERT [dbo].[tblnumeral] ([id], [descripcion], [fkidliteral]) VALUES (N'6c13', N'Requisitos de grado.', N'c13')
GO
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'110', N'La institución deberá establecer procesos y medios orientados a la mejora del desempeño académico y la formación integral del estudiante, que le permita el tránsito de la educación secundaria o media a la educación superior, tomando como insumo la información cualitativa y cuantitativa de los estudiantes.', N'10')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'111', N'La institución deberá contar con mecanismos que permitan verificar y asegurar que la identidad de quien cursa el programa corresponda a la del estudiante matriculado.', N'11')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'113', N'Las evidencias indicadas en los literales c), e), f), 9), h), y j) del presente artículo solo deberán ser presentadas por las instituciones que estén ofreciendo al menos un programa al momento de comenzar la etapa de Pre radicación de solicitud de registro calificado.', N'13')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'117', N'Cuando la modalidad del programa implique el desarrollo de actividades académicas, formativas y docentes a cargo de empresas, entidades, organizaciones u otros entes que se vinculan al proceso formativo, la institución eberá especificar la forma de seguimiento y evaluación de sus actividades.', N'17')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'118', N'Las evidencias indicadas en los literales d), g), i), m) y o) del presente artículo solo deberán ser presentadas por las instituciones que estén ofreciendo al menos un un programa académico al momento de iniciar la etapa de Pre radicación de solicitud de registro calificado.', N'18')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'12', N'Para todos los efectos de la presente resolución, se entiende por “institución” o “instituciones”, las instituciones de educación superior y aquellas habilitadas por la ley para la oferta y desarrollo de programas académicos de educación superior. ', N'2')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'124', N'Para la definición de la relación entre las horas de interacción con el profesor y las horas de trabajo independiente, la institución deberá considerar los niveles de formación, las modalidades de ofrecimiento y las semanas con las que cuentan los periodos académicos con el fin de establecer la equivalencia y cumplir las 48 horas establecidas en el artículo 2.5.3.2.4.1 del Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019.', N'24')
INSERT [dbo].[tblparagrafo] ([id], [descripcion], [fkidarticulo]) VALUES (N'18', N'Cuando la institución desarrolle actividades con entidades, empresas, organizaciones u otros entes que participen en el plan de estudios o faciliten espacios de práctica requeridos en el mismo, el reglamento deberá definir las políticas y criterios de admisión, permanencia y evaluación, teniendo en consideración dicho asocio y de acuerdo con los resultados de aprendizaje esperados.', N'8')
GO
SET IDENTITY_INSERT [dbo].[tblrol] ON 

INSERT [dbo].[tblrol] ([id], [nombre]) VALUES (1, N'administrador')
INSERT [dbo].[tblrol] ([id], [nombre]) VALUES (2, N'verificador')
INSERT [dbo].[tblrol] ([id], [nombre]) VALUES (3, N'validador')
INSERT [dbo].[tblrol] ([id], [nombre]) VALUES (4, N'administrativo')
SET IDENTITY_INSERT [dbo].[tblrol] OFF
GO
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (1, 2)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (2, 3)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (3, 4)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (4, 2)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (5, 2)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (6, 2)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (6, 3)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (7, 2)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (7, 1)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (7, 4)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (9, 1)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (9, 3)
INSERT [dbo].[tblrol_usuario] ([fkIdUsuario], [fkIdRol]) VALUES (9, 4)
GO
INSERT [dbo].[tblseccion] ([id], [titulo]) VALUES (N'0', N'NA')
INSERT [dbo].[tblseccion] ([id], [titulo]) VALUES (N'1', N'MECANISMOS DE SELECCIÓN Y EVALUACIÓN DE ESTUDIANTES')
INSERT [dbo].[tblseccion] ([id], [titulo]) VALUES (N'2', N'MECANISMOS DE SELECCIÓN Y EVALUACIÓN DE PROFESORES')
GO
INSERT [dbo].[tbltitulo] ([id], [nombre]) VALUES (N'1', N'OBJETO  ÁMBITO DE APLICACIÓN Y GENERALIDADES')
INSERT [dbo].[tbltitulo] ([id], [nombre]) VALUES (N'2', N'DE LAS CONDICIONES INSTITUCIONALES')
INSERT [dbo].[tbltitulo] ([id], [nombre]) VALUES (N'3', N'DE LA RENOVACIÓN DE CONDICIONES INSTITUCIONALES')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (1, N'usuario1', N'123')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (2, N'usuario2', N'123')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (3, N'usuario3', N'123')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (4, N'usuario4', N'123456')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (5, N'Frank', N'DonnieDarko')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (6, N'usuario5', N'4545')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (7, N'usuario6', N'1234')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (8, N'usuario7', N'456')
INSERT [dbo].[usuarios] ([IdUsuario], [usuario], [contrasenia]) VALUES (9, N'Darwin', N'456789')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[DetalleAutores]  WITH CHECK ADD  CONSTRAINT [FkAutor] FOREIGN KEY([FkAutor])
REFERENCES [dbo].[Autores] ([IdAutor])
GO
ALTER TABLE [dbo].[DetalleAutores] CHECK CONSTRAINT [FkAutor]
GO
ALTER TABLE [dbo].[DetalleAutores]  WITH CHECK ADD  CONSTRAINT [FkEvidenciaAutor] FOREIGN KEY([FkEvidenciaAutor])
REFERENCES [dbo].[evidencia] ([IdEvidencia])
GO
ALTER TABLE [dbo].[DetalleAutores] CHECK CONSTRAINT [FkEvidenciaAutor]
GO
ALTER TABLE [dbo].[DetalleEstado]  WITH CHECK ADD  CONSTRAINT [FkEstado] FOREIGN KEY([FkEstado])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[DetalleEstado] CHECK CONSTRAINT [FkEstado]
GO
ALTER TABLE [dbo].[DetalleEstado]  WITH CHECK ADD  CONSTRAINT [FkEvidencia] FOREIGN KEY([FkEvidencia])
REFERENCES [dbo].[evidencia] ([IdEvidencia])
GO
ALTER TABLE [dbo].[DetalleEstado] CHECK CONSTRAINT [FkEvidencia]
GO
ALTER TABLE [dbo].[DetalleEstado]  WITH CHECK ADD  CONSTRAINT [FkUsuarioDetalle] FOREIGN KEY([FkUsuarioDetalle])
REFERENCES [dbo].[usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[DetalleEstado] CHECK CONSTRAINT [FkUsuarioDetalle]
GO
ALTER TABLE [dbo].[DetalleEvidencias]  WITH CHECK ADD  CONSTRAINT [FkArticulo] FOREIGN KEY([FkArticulo])
REFERENCES [dbo].[tblarticulo] ([id])
GO
ALTER TABLE [dbo].[DetalleEvidencias] CHECK CONSTRAINT [FkArticulo]
GO
ALTER TABLE [dbo].[DetalleEvidencias]  WITH CHECK ADD  CONSTRAINT [FkEvidenciaDetalle] FOREIGN KEY([FkEvidenciaDetalle])
REFERENCES [dbo].[evidencia] ([IdEvidencia])
GO
ALTER TABLE [dbo].[DetalleEvidencias] CHECK CONSTRAINT [FkEvidenciaDetalle]
GO
ALTER TABLE [dbo].[tblarticulo]  WITH CHECK ADD  CONSTRAINT [fk_tblarticulo_tblcapitulo1] FOREIGN KEY([fkidcapitulo])
REFERENCES [dbo].[tblcapitulo] ([id])
GO
ALTER TABLE [dbo].[tblarticulo] CHECK CONSTRAINT [fk_tblarticulo_tblcapitulo1]
GO
ALTER TABLE [dbo].[tblarticulo]  WITH CHECK ADD  CONSTRAINT [fk_tblarticulo_tblseccion1] FOREIGN KEY([fkidseccion])
REFERENCES [dbo].[tblseccion] ([id])
GO
ALTER TABLE [dbo].[tblarticulo] CHECK CONSTRAINT [fk_tblarticulo_tblseccion1]
GO
ALTER TABLE [dbo].[tblarticulo]  WITH CHECK ADD  CONSTRAINT [fk_tblarticulo_tbltiyulo1] FOREIGN KEY([fkidtitulo])
REFERENCES [dbo].[tbltitulo] ([id])
GO
ALTER TABLE [dbo].[tblarticulo] CHECK CONSTRAINT [fk_tblarticulo_tbltiyulo1]
GO
ALTER TABLE [dbo].[tblliteral]  WITH CHECK ADD  CONSTRAINT [fk_tblliteral_tblarticulo1] FOREIGN KEY([fkidarticulo])
REFERENCES [dbo].[tblarticulo] ([id])
GO
ALTER TABLE [dbo].[tblliteral] CHECK CONSTRAINT [fk_tblliteral_tblarticulo1]
GO
ALTER TABLE [dbo].[tblnumeral]  WITH CHECK ADD  CONSTRAINT [fk_tblnumeral_tblliteral1] FOREIGN KEY([fkidliteral])
REFERENCES [dbo].[tblliteral] ([id])
GO
ALTER TABLE [dbo].[tblnumeral] CHECK CONSTRAINT [fk_tblnumeral_tblliteral1]
GO
ALTER TABLE [dbo].[tblparagrafo]  WITH CHECK ADD  CONSTRAINT [fk_tblparagrafo_tblarticulo1] FOREIGN KEY([fkidarticulo])
REFERENCES [dbo].[tblarticulo] ([id])
GO
ALTER TABLE [dbo].[tblparagrafo] CHECK CONSTRAINT [fk_tblparagrafo_tblarticulo1]
GO
ALTER TABLE [dbo].[tblrol_usuario]  WITH CHECK ADD  CONSTRAINT [fkIdRol] FOREIGN KEY([fkIdRol])
REFERENCES [dbo].[tblrol] ([id])
GO
ALTER TABLE [dbo].[tblrol_usuario] CHECK CONSTRAINT [fkIdRol]
GO
ALTER TABLE [dbo].[tblrol_usuario]  WITH CHECK ADD  CONSTRAINT [fkIdUsuario] FOREIGN KEY([fkIdUsuario])
REFERENCES [dbo].[usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblrol_usuario] CHECK CONSTRAINT [fkIdUsuario]
GO
/****** Object:  StoredProcedure [dbo].[GuardarCapitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GuardarCapitulo]
	@fkIdCapitulo varchar(255)

AS
BEGIN
	
	DECLARE @idEvidencia varchar(255)
	DECLARE @fkIdCapituloProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdCapitulo)
	SET @fkIdCapituloProcesado=	SUBSTRING(@fkIdCapitulo, 0,@Posicion)

	SELECT @idEvidencia= (SELECT max(IdEvidencia) FROM evidencia)

	UPDATE tblarticulo
	SET tblarticulo.fkidcapitulo=@fkIdCapituloProcesado
	FROM            dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tblcapitulo ON dbo.tblarticulo.fkidcapitulo = dbo.tblcapitulo.id 
						 where evidencia.IdEvidencia = @idEvidencia
END
GO
/****** Object:  StoredProcedure [dbo].[GuardarNuevoEstado]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GuardarNuevoEstado]
	@FkEstado varchar(255),
	@FkEvidencia varchar(255),
	@FkUsuarioDetalle varchar(255)
AS
BEGIN

	DECLARE @fkIdEstadoProcesado int
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@FkEstado)
	SET @fkIdEstadoProcesado= CAST(	SUBSTRING(@FkEstado, 0,@Posicion) as int)

	INSERT INTO DetalleEstado VALUES(@fkIdEstadoProcesado,@FkEvidencia,@FkUsuarioDetalle,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[GuardarSeccion]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GuardarSeccion]
	@fkIdSeccion varchar(255)

AS
BEGIN
	
	DECLARE @idEvidencia varchar(255)
	DECLARE @fkIdSeccionProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdSeccion)
	SET @fkIdSeccionProcesado=	SUBSTRING(@fkIdSeccion, 0,@Posicion)

	SELECT @idEvidencia= (SELECT max(IdEvidencia) FROM evidencia)

	UPDATE tblarticulo
	SET tblarticulo.fkidseccion=@fkIdSeccionProcesado
	FROM            dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tblseccion ON dbo.tblarticulo.fkidseccion = dbo.tblseccion.id  
						 where evidencia.IdEvidencia = @idEvidencia
END
GO
/****** Object:  StoredProcedure [dbo].[GuardarTitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GuardarTitulo]
	@fkIdTitulo varchar(255)

AS
BEGIN
	
	DECLARE @idEvidencia varchar(255)
	DECLARE @fkIdTituloProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdTitulo)
	SET @fkIdTituloProcesado=	SUBSTRING(@fkIdTitulo, 0,@Posicion)

	SELECT @idEvidencia= (SELECT max(IdEvidencia) FROM evidencia)

	UPDATE tblarticulo
	SET tblarticulo.fkidseccion=@fkIdTituloProcesado
	FROM            dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tbltitulo ON dbo.tblarticulo.fkidtitulo = dbo.tbltitulo.id  
						 where evidencia.IdEvidencia = @idEvidencia
END
GO
/****** Object:  StoredProcedure [dbo].[LlenarTablaEstados]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<LlenarTablaEstados>
-- =============================================
CREATE PROCEDURE [dbo].[LlenarTablaEstados]
	-- Add the parameters for the stored procedure here
	(
	@FkUsuarioDetalle int,
	@FkArticulo varchar(16)
	)
AS
BEGIN
	DECLARE @FKArticulTemp varchar(16)
	DECLARE @FkEstado int=1
	DECLARE @FkEvidencia Int
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@FkArticulo)
	SELECT @FkEvidencia = IdEvidencia FROM evidencia WHERE IdEvidencia= (SELECT max(IdEvidencia) FROM evidencia)
	SET @FKArticulTemp=	SUBSTRING(@FkArticulo, 0,@Posicion)
	INSERT INTO DetalleEvidencias VALUES (@FkEvidencia,@FKArticulTemp)
	INSERT INTO DetalleEstado VALUES(@FkEstado,@FkEvidencia,@FkUsuarioDetalle,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[LlenarTablaRolUsuarios]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darwin,,Name>
-- Create date: <27-11-2022>
-- Description:	<Llenar Tabla intermedia entre rolse y usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[LlenarTablaRolUsuarios]
	(
	@FkIdRol varchar(255)
	)-- Add the parameters for the stored procedure here
AS
BEGIN
    -- Insert statements for procedure here
	DECLARE @FkIdUsu int=0
	DECLARE @FkIdRolProcesado varchar(255)=''
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@FkIdRol)
	SET @FkIdRolProcesado=	SUBSTRING(@FkIdRol, 0,@Posicion)
	SELECT @FkIdUsu = idUsuario FROM usuarios WHERE IdUsuario= (SELECT max(IdUsuario) FROM usuarios)
	INSERT INTO tblRol_Usuario VALUES (@FkIdUsu,CAST(@FkIdRolProcesado AS INT))
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarArticulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModificarArticulo] 
	@idEvidencia varchar(255),
	@fkIdArticulo varchar(255)
	
AS
BEGIN
	
	DECLARE @fkIdArticuloProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdArticulo)
	SET @fkIdArticuloProcesado=	SUBSTRING(@fkIdArticulo, 0,@Posicion)

	UPDATE DetalleEvidencias

	SET DetalleEvidencias.fkArticulo=@fkIdArticuloProcesado

				FROM     dbo.evidencia 
				INNER JOIN dbo.DetalleEvidencias ON dbo.evidencia.IdEvidencia = dbo.DetalleEvidencias.FkEvidenciaDetalle 
				INNER JOIN dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id
				where evidencia.IdEvidencia = @idEvidencia
	END
GO
/****** Object:  StoredProcedure [dbo].[ModificarCapitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModificarCapitulo] 
	@idEvidencia varchar(255),
	@fkIdCapitulo varchar(255)
	
AS
BEGIN
	
	DECLARE @fkIdCapituloProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdCapitulo)
	SET @fkIdCapituloProcesado=	SUBSTRING(@fkIdCapitulo, 0,@Posicion)

	UPDATE tblarticulo

	SET tblarticulo.fkidcapitulo=@fkIdCapituloProcesado

	FROM dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tblcapitulo ON dbo.tblarticulo.fkidcapitulo = dbo.tblcapitulo.id 
						 where evidencia.IdEvidencia =@idEvidencia
	END
GO
/****** Object:  StoredProcedure [dbo].[ModificarSeccion]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModificarSeccion] 
	@idEvidencia varchar(255),
	@fkIdSeccion varchar(255)
	
AS
BEGIN
	
	DECLARE @fkIdSeccionProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdSeccion)
	SET @fkIdSeccionProcesado=	SUBSTRING(@fkIdSeccion, 0,@Posicion)

	UPDATE tblarticulo

	SET tblarticulo.fkidseccion=@fkIdSeccionProcesado

	FROM dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tblseccion ON dbo.tblarticulo.fkidseccion = dbo.tblseccion.id 
						 where evidencia.IdEvidencia =@idEvidencia
	END
GO
/****** Object:  StoredProcedure [dbo].[ModificarTitulo]    Script Date: 8/12/2022 00:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ModificarTitulo] 
	@idEvidencia varchar(255),
	@fkIdTitulo varchar(255)
	
AS
BEGIN
	
	DECLARE @fkIdTituloProcesado varchar(255)
	DECLARE @Posicion int=0
	SET @Posicion=CHARINDEX('.',@fkIdTitulo)
	SET @fkIdTituloProcesado=	SUBSTRING(@fkIdTitulo, 0,@Posicion)

	UPDATE tblarticulo

	SET tblarticulo.fkidtitulo=@fkIdTituloProcesado

	FROM dbo.DetalleEvidencias INNER JOIN
                         dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia INNER JOIN
                         dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id INNER JOIN
                         dbo.tbltitulo ON dbo.tblarticulo.fkidtitulo = dbo.tbltitulo.id 
						 where evidencia.IdEvidencia =@idEvidencia
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[17] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Estados"
            Begin Extent = 
               Top = 390
               Left = 478
               Bottom = 486
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "evidencia"
            Begin Extent = 
               Top = 503
               Left = 209
               Bottom = 633
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "DetalleEst"
            Begin Extent = 
               Top = 400
               Left = 75
               Bottom = 496
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleEvidencias"
            Begin Extent = 
               Top = 505
               Left = 440
               Bottom = 637
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_tabla_Evidencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_tabla_Evidencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_tabla_Evidencia'
GO
USE [master]
GO
ALTER DATABASE [Sisevid] SET  READ_WRITE 
GO
