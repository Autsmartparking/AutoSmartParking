USE [master]
GO
/****** Object:  Database [Auto_Smart_Parking]    Script Date: 03/08/2018 21:20:34 ******/
CREATE DATABASE [Auto_Smart_Parking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Auto_Smart_Parking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Auto_Smart_Parking.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Auto_Smart_Parking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Auto_Smart_Parking_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Auto_Smart_Parking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Auto_Smart_Parking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Auto_Smart_Parking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Auto_Smart_Parking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Auto_Smart_Parking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Auto_Smart_Parking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Auto_Smart_Parking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET RECOVERY FULL 
GO
ALTER DATABASE [Auto_Smart_Parking] SET  MULTI_USER 
GO
ALTER DATABASE [Auto_Smart_Parking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Auto_Smart_Parking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Auto_Smart_Parking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Auto_Smart_Parking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Auto_Smart_Parking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Auto_Smart_Parking', N'ON'
GO
USE [Auto_Smart_Parking]
GO
/****** Object:  User [DESKTOP-L0GLE2A\SENA]    Script Date: 03/08/2018 21:20:34 ******/
CREATE USER [DESKTOP-L0GLE2A\SENA] FOR LOGIN [DESKTOP-L0GLE2A\SENA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrador](
	[IdAdministrador] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admistracion_Usuarios]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admistracion_Usuarios](
	[IdAdmonUsu] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipo_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAdmonUsu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bloque](
	[IdBloque] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Cod_Bloque] [char](2) NOT NULL,
	[Bloque_lleno] [char](1) NOT NULL,
	[IdParqueadero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBloque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Id_Vehiculo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Movil] [varchar](10) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Valido_Hasta] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Control_Registro]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Registro](
	[IdControl_Registro] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdControl_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control_Registro_Cliente]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Registro_Cliente](
	[IdControl_Registro_Cliente] [int] NOT NULL,
	[IdControl_Registro] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdControl_Registro_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control_Registro_Usuario]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Registro_Usuario](
	[IdControl_Usuario] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdControl_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Espacio]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Espacio](
	[IdEspacio] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[No_de_Esp] [int] NOT NULL,
	[Disponible] [char](1) NOT NULL,
	[IdBloque] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parqueadero]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parqueadero](
	[IdParqueadero] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[No_de_Bloques] [int] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[CupoDisp] [char](1) NOT NULL,
	[No_de_Cupos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdParqueadero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parqueadero_Control_Registro]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parqueadero_Control_Registro](
	[IdParqueadero_Control_Registro] [int] NOT NULL,
	[IdParqueadero] [int] NOT NULL,
	[IdControl_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdParqueadero_Control_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parqueadero_Registro_de_Entrada]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parqueadero_Registro_de_Entrada](
	[IdParqueadero_Registro] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdParqueadero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdParqueadero_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registro_de_Entrada]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_de_Entrada](
	[IdRegistro_de_Entrada] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Hora_Ingreso] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegistro_de_Entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registro_de_Salida]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_de_Salida](
	[IdRegistro_de_Salida] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Id_Vehiculo] [int] NOT NULL,
	[Fecha_de_Salida] [date] NOT NULL,
	[Hora_de_Salida] [time](7) NOT NULL,
	[Duracion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegistro_de_Salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdAdministrador] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Cliente]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Cliente](
	[IdTipo_Cliente] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipo_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[IdTipo_Usuario] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdAmonUsu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Vehiculo]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Vehiculo](
	[IdTipo_Vehiculo] [int] NOT NULL,
	[T_vehiculo] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipo_Vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[IdTipo_Usuario] [int] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[IdAdmonUsu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 03/08/2018 21:20:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[IdVehiculo] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Marca] [varchar](20) NOT NULL,
	[Modelo] [varchar](20) NOT NULL,
	[Color] [char](10) NOT NULL,
	[IdTipo_Vehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Cliente]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_Parqueadero] FOREIGN KEY([IdParqueadero])
REFERENCES [dbo].[Parqueadero] ([IdParqueadero])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_Parqueadero]
GO
ALTER TABLE [dbo].[Control_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Control_Registro] CHECK CONSTRAINT [FK_Control_Registro_Cliente]
GO
ALTER TABLE [dbo].[Control_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Control_Registro] CHECK CONSTRAINT [FK_Control_Registro_Usuario]
GO
ALTER TABLE [dbo].[Control_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Vehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Control_Registro] CHECK CONSTRAINT [FK_Control_Registro_Vehiculo]
GO
ALTER TABLE [dbo].[Control_Registro_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Cliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Control_Registro_Cliente] CHECK CONSTRAINT [FK_Control_Registro_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Control_Registro_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Cliente_Control_Registro] FOREIGN KEY([IdControl_Registro])
REFERENCES [dbo].[Control_Registro] ([IdControl_Registro])
GO
ALTER TABLE [dbo].[Control_Registro_Cliente] CHECK CONSTRAINT [FK_Control_Registro_Cliente_Control_Registro]
GO
ALTER TABLE [dbo].[Control_Registro_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Control_Registro_Usuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Control_Registro_Usuario] CHECK CONSTRAINT [FK_Control_Registro_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Espacio]  WITH CHECK ADD  CONSTRAINT [FK_Espacio_Bloque] FOREIGN KEY([IdBloque])
REFERENCES [dbo].[Bloque] ([IdBloque])
GO
ALTER TABLE [dbo].[Espacio] CHECK CONSTRAINT [FK_Espacio_Bloque]
GO
ALTER TABLE [dbo].[Espacio]  WITH CHECK ADD  CONSTRAINT [FK_Espacio_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Espacio] CHECK CONSTRAINT [FK_Espacio_Cliente]
GO
ALTER TABLE [dbo].[Parqueadero]  WITH CHECK ADD  CONSTRAINT [FK_Parqueadero_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Parqueadero] CHECK CONSTRAINT [FK_Parqueadero_Cliente]
GO
ALTER TABLE [dbo].[Parqueadero_Control_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Parqueadero_Control_Registro_Control_Registro] FOREIGN KEY([IdControl_Usuario])
REFERENCES [dbo].[Control_Registro] ([IdControl_Registro])
GO
ALTER TABLE [dbo].[Parqueadero_Control_Registro] CHECK CONSTRAINT [FK_Parqueadero_Control_Registro_Control_Registro]
GO
ALTER TABLE [dbo].[Parqueadero_Control_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Parqueadero_Control_Registro_Parqueadero] FOREIGN KEY([IdParqueadero])
REFERENCES [dbo].[Parqueadero] ([IdParqueadero])
GO
ALTER TABLE [dbo].[Parqueadero_Control_Registro] CHECK CONSTRAINT [FK_Parqueadero_Control_Registro_Parqueadero]
GO
ALTER TABLE [dbo].[Parqueadero_Registro_de_Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Parqueadero_Registro_de_Entrada_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Parqueadero_Registro_de_Entrada] CHECK CONSTRAINT [FK_Parqueadero_Registro_de_Entrada_Cliente]
GO
ALTER TABLE [dbo].[Parqueadero_Registro_de_Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Parqueadero_Registro_de_Entrada_Parqueadero] FOREIGN KEY([IdParqueadero])
REFERENCES [dbo].[Parqueadero] ([IdParqueadero])
GO
ALTER TABLE [dbo].[Parqueadero_Registro_de_Entrada] CHECK CONSTRAINT [FK_Parqueadero_Registro_de_Entrada_Parqueadero]
GO
ALTER TABLE [dbo].[Registro_de_Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Registro_de_Entrada_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Registro_de_Entrada] CHECK CONSTRAINT [FK_Registro_de_Entrada_Cliente]
GO
ALTER TABLE [dbo].[Registro_de_Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Registro_de_Entrada_Vehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Registro_de_Entrada] CHECK CONSTRAINT [FK_Registro_de_Entrada_Vehiculo]
GO
ALTER TABLE [dbo].[Registro_de_Salida]  WITH CHECK ADD  CONSTRAINT [FK_Registro_de_Salida_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Registro_de_Salida] CHECK CONSTRAINT [FK_Registro_de_Salida_Cliente]
GO
ALTER TABLE [dbo].[Registro_de_Salida]  WITH CHECK ADD  CONSTRAINT [FK_Registro_de_Salida_Vehiculo] FOREIGN KEY([Id_Vehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Registro_de_Salida] CHECK CONSTRAINT [FK_Registro_de_Salida_Vehiculo]
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Administrador] FOREIGN KEY([IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdAdministrador])
GO
ALTER TABLE [dbo].[Rol] CHECK CONSTRAINT [FK_Rol_Administrador]
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Rol] CHECK CONSTRAINT [FK_Rol_Cliente]
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rol] CHECK CONSTRAINT [FK_Rol_Usuario]
GO
ALTER TABLE [dbo].[Tipo_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Cliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Tipo_Cliente] CHECK CONSTRAINT [FK_Tipo_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Tipo_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Usuario_Admistracion_Usuarios] FOREIGN KEY([IdAmonUsu])
REFERENCES [dbo].[Admistracion_Usuarios] ([IdAdmonUsu])
GO
ALTER TABLE [dbo].[Tipo_Usuario] CHECK CONSTRAINT [FK_Tipo_Usuario_Admistracion_Usuarios]
GO
ALTER TABLE [dbo].[Tipo_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Usuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tipo_Usuario] CHECK CONSTRAINT [FK_Tipo_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Admistracion_Usuarios] FOREIGN KEY([IdAdmonUsu])
REFERENCES [dbo].[Admistracion_Usuarios] ([IdAdmonUsu])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Admistracion_Usuarios]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Cliente]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Tipo_Vehiculo] FOREIGN KEY([IdTipo_Vehiculo])
REFERENCES [dbo].[Tipo_Vehiculo] ([IdTipo_Vehiculo])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Tipo_Vehiculo]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Tipo_Vehiculo1] FOREIGN KEY([IdTipo_Vehiculo])
REFERENCES [dbo].[Tipo_Vehiculo] ([IdTipo_Vehiculo])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Tipo_Vehiculo1]
GO
USE [master]
GO
ALTER DATABASE [Auto_Smart_Parking] SET  READ_WRITE 
GO
