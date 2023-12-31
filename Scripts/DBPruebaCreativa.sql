USE [master]
GO
/****** Object:  Database [DBPruebaCreativa]    Script Date: 6/24/2023 12:15:24 PM ******/
CREATE DATABASE [DBPruebaCreativa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBPruebaCreativa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBPruebaCreativa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBPruebaCreativa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBPruebaCreativa_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBPruebaCreativa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPruebaCreativa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPruebaCreativa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBPruebaCreativa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBPruebaCreativa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBPruebaCreativa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBPruebaCreativa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET RECOVERY FULL 
GO
ALTER DATABASE [DBPruebaCreativa] SET  MULTI_USER 
GO
ALTER DATABASE [DBPruebaCreativa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBPruebaCreativa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBPruebaCreativa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBPruebaCreativa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBPruebaCreativa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBPruebaCreativa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBPruebaCreativa', N'ON'
GO
ALTER DATABASE [DBPruebaCreativa] SET QUERY_STORE = OFF
GO
USE [DBPruebaCreativa]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdMarca] [int] NULL,
	[NombreEquipo] [nvarchar](50) NULL,
	[NumeroSerial] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[NombreMarca] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[TipoHerramientas] [nvarchar](50) NOT NULL,
	[Exactitud] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Marca__4076A8871659A2A3] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[NombrePersona] [nvarchar](50) NULL,
	[IdMarca] [int] NULL,
	[IdEquipo] [int] NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK__Equipo__IdMarca__276EDEB3] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK__Equipo__IdMarca__276EDEB3]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK__Prestamo__IdMarc__2E1BDC42] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK__Prestamo__IdMarc__2E1BDC42]
GO
ALTER TABLE [dbo].[Marca]  WITH CHECK ADD  CONSTRAINT [CK__Marca__TipoHerra__24927208] CHECK  (([TipoHerramientas]='Cableado' OR [TipoHerramientas]='Pinzas' OR [TipoHerramientas]='Registradores'))
GO
ALTER TABLE [dbo].[Marca] CHECK CONSTRAINT [CK__Marca__TipoHerra__24927208]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD CHECK  (([Estado]='Inactivo' OR [Estado]='ACtivo'))
GO
/****** Object:  StoredProcedure [dbo].[spEquipo_Delete]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEquipo_Delete]
	-- Add the parameters for the stored procedure here
	@IdEquipo int
	
AS
BEGIN
	delete from Equipo where IdMarca = @IdEquipo
END
GO
/****** Object:  StoredProcedure [dbo].[spEquipo_Edit]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEquipo_Edit]
	-- Add the parameters for the stored procedure here
	@IdEquipo int,
	@IdMarca int,
	@NombreEquipo nvarchar(50),
	@NumeroSerial nvarchar(50),
	@Descripcion nvarchar(250)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  update dbo.Equipo
  set IdMarca= @IdMarca, NombreEquipo = @NombreEquipo, NumeroSerial=@NumeroSerial, Descripcion= @Descripcion
  where IdEquipo = @IdEquipo 

END
GO
/****** Object:  StoredProcedure [dbo].[spEquipo_GetAll]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEquipo_GetAll]
	
AS
BEGIN
select * from Equipo;
END
GO
/****** Object:  StoredProcedure [dbo].[spEquipo_GetByMarca]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--GETS THE CURRENT TEAMS FOR A GIVEN TOURNAMENTS
CREATE PROCEDURE [dbo].[spEquipo_GetByMarca]
@IdMarca int
as
BEGIN
-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SET FROM
--INTERFERING WITH SELECT STATEMENTS
SET NOCOUNT ON;

select e.*
from dbo.Equipo e
where e.IdMarca = @IdMarca
end	
GO
/****** Object:  StoredProcedure [dbo].[spEquipo_Insert]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEquipo_Insert]
	@IdMarca int,
	@NombreEquipo nvarchar(50),
	@NumeroSerial nvarchar(50),
	@Descripcion nvarchar(250),
	
	@id int=0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Equipo (IdMarca,NombreEquipo,NumeroSerial, Descripcion)
	values (@IdMarca, @NombreEquipo, @NumeroSerial, @Descripcion)

	select @id= SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMarca_Delete]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMarca_Delete]
	-- Add the parameters for the stored procedure here
	@IdMarca int
	
AS
BEGIN
	delete from Marca where IdMarca = @IdMarca
END
GO
/****** Object:  StoredProcedure [dbo].[spMarca_Edit]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMarca_Edit]
	-- Add the parameters for the stored procedure here
	@IdMarca int,
	@NombreMarca nvarchar(50),
	@Descripcion nvarchar(250),
	@TipoHerramientas nvarchar(50),
	@Exactitud decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  update dbo.Marca
  set NombreMarca = @NombreMarca, Descripcion= @Descripcion, TipoHerramientas=@TipoHerramientas, Exactitud = @Exactitud
  where IdMarca = @IdMarca 

END
GO
/****** Object:  StoredProcedure [dbo].[spMarca_GetAll]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMarca_GetAll]
	
AS
BEGIN
select * from Marca;
END
GO
/****** Object:  StoredProcedure [dbo].[spMarca_Insert]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spMarca_Insert]
	@NombreMarca nvarchar(50),
	@Descripcion nvarchar(250),
	@TipoHerramientas nvarchar(50),
	@Exactitud decimal,
	@id int=0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Marca (NombreMarca, Descripcion, TipoHerramientas, Exactitud)
	values (@NombreMarca, @Descripcion, @TipoHerramientas, @Exactitud)

	select @id= SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spPrestamo_Delete]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spPrestamo_Delete]
	-- Add the parameters for the stored procedure here
	@IdPrestamo int
	
AS
BEGIN
	delete from Prestamo where IdMarca = @IdPrestamo
END
GO
/****** Object:  StoredProcedure [dbo].[spPrestamo_Edit]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spPrestamo_Edit]
	-- Add the parameters for the stored procedure here
	@IdPrestamo int,
	@IdEquipo int,
	@IdMarca int,
	@FechaInicio date,
	@FechaFin date,
	@Estado nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  update dbo.Prestamo
  set IdEquipo = @IdEquipo, IdMarca=@IdMarca, FechaInicio= @FechaInicio, FechaFin= @FechaFin, Estado=@Estado
  where IdPrestamo = @IdPrestamo

END
GO
/****** Object:  StoredProcedure [dbo].[spPrestamo_GetAll]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spPrestamo_GetAll]
	
AS
BEGIN
select * from Prestamo;
END
GO
/****** Object:  StoredProcedure [dbo].[spPrestamo_GetByMarca]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--GETS THE CURRENT TEAMS FOR A GIVEN TOURNAMENTS
CREATE PROCEDURE [dbo].[spPrestamo_GetByMarca]
@IdMarca int
as
BEGIN
-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SET FROM
--INTERFERING WITH SELECT STATEMENTS
SET NOCOUNT ON;

select p.*
from dbo.Prestamo p
where p.IdMarca = @IdMarca
end	
GO
/****** Object:  StoredProcedure [dbo].[spPrestamo_Insert]    Script Date: 6/24/2023 12:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spPrestamo_Insert]
	@NombrePersona nvarchar(50),
	@IdMarca int,
	@IdEquipo int,
	@FechaInicio date,
	@FechaFin date,
	@Estado nvarchar(50),
	
	@id int=0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Prestamo(NombrePersona,IdMarca,IdEquipo, FechaInicio,FechaFin,Estado)
	values (@NombrePersona,@IdMarca,@IdEquipo,@FechaInicio,@FechaFin,@Estado)

	select @id= SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [DBPruebaCreativa] SET  READ_WRITE 
GO
