USE [master]
GO
/****** Object:  Database [Деканат]    Script Date: 30.03.2020 13:27:58 ******/
CREATE DATABASE [Деканат]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Деканат', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Деканат.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Деканат_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Деканат_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Деканат] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Деканат].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Деканат] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Деканат] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Деканат] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Деканат] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Деканат] SET ARITHABORT OFF 
GO
ALTER DATABASE [Деканат] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Деканат] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Деканат] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Деканат] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Деканат] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Деканат] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Деканат] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Деканат] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Деканат] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Деканат] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Деканат] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Деканат] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Деканат] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Деканат] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Деканат] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Деканат] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Деканат] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Деканат] SET RECOVERY FULL 
GO
ALTER DATABASE [Деканат] SET  MULTI_USER 
GO
ALTER DATABASE [Деканат] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Деканат] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Деканат] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Деканат] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Деканат] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Деканат', N'ON'
GO
ALTER DATABASE [Деканат] SET QUERY_STORE = OFF
GO
USE [Деканат]
GO
/****** Object:  Table [dbo].[Дисциплина]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дисциплина](
	[№ дисциплины] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
 CONSTRAINT [PK_Дисциплина] PRIMARY KEY CLUSTERED 
(
	[№ дисциплины] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Кафедра]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кафедра](
	[№ кафедры] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
 CONSTRAINT [PK_Кафедра] PRIMARY KEY CLUSTERED 
(
	[№ кафедры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оценка]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оценка](
	[Оценка] [int] NOT NULL,
	[Нижняя граница] [nvarchar](50) NULL,
	[Верхняя граница] [nvarchar](50) NULL,
 CONSTRAINT [PK_Оценка] PRIMARY KEY CLUSTERED 
(
	[Оценка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватели]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватели](
	[№ преподавателя] [int] NOT NULL,
	[ФИО преподавателя] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
	[№ кафедры] [int] NULL,
 CONSTRAINT [PK_Преподаватели] PRIMARY KEY CLUSTERED 
(
	[№ преподавателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Результаты]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Результаты](
	[№ студента] [int] NOT NULL,
	[№ группы] [nvarchar](50) NULL,
	[№ семестра] [int] NULL,
	[№ дисциплины] [int] NULL,
	[Баллы] [int] NULL,
	[Дата сдачи] [datetime] NULL,
	[Оценка] [int] NULL,
 CONSTRAINT [PK_Результаты] PRIMARY KEY CLUSTERED 
(
	[№ студента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сессия]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сессия](
	[№ группы] [nvarchar](50) NOT NULL,
	[№ семестра] [int] NULL,
	[№ дисциплины] [int] NULL,
	[Отчетность] [nvarchar](50) NULL,
	[№ преподавателя] [int] NULL,
 CONSTRAINT [PK_Сессия] PRIMARY KEY CLUSTERED 
(
	[№ группы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 30.03.2020 13:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты](
	[№ студента] [int] NOT NULL,
	[№ зачетной книжки] [nvarchar](50) NOT NULL,
	[ФИО студента] [nvarchar](50) NULL,
	[№ группы] [nvarchar](50) NULL,
 CONSTRAINT [PK_Студенты_1] PRIMARY KEY CLUSTERED 
(
	[№ зачетной книжки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Преподаватели]  WITH CHECK ADD  CONSTRAINT [FK_Преподаватели_Кафедра1] FOREIGN KEY([№ кафедры])
REFERENCES [dbo].[Кафедра] ([№ кафедры])
GO
ALTER TABLE [dbo].[Преподаватели] CHECK CONSTRAINT [FK_Преподаватели_Кафедра1]
GO
ALTER TABLE [dbo].[Результаты]  WITH CHECK ADD  CONSTRAINT [FK_Результаты_Дисциплина1] FOREIGN KEY([№ дисциплины])
REFERENCES [dbo].[Дисциплина] ([№ дисциплины])
GO
ALTER TABLE [dbo].[Результаты] CHECK CONSTRAINT [FK_Результаты_Дисциплина1]
GO
ALTER TABLE [dbo].[Результаты]  WITH CHECK ADD  CONSTRAINT [FK_Результаты_Оценка1] FOREIGN KEY([Оценка])
REFERENCES [dbo].[Оценка] ([Оценка])
GO
ALTER TABLE [dbo].[Результаты] CHECK CONSTRAINT [FK_Результаты_Оценка1]
GO
ALTER TABLE [dbo].[Результаты]  WITH CHECK ADD  CONSTRAINT [FK_Результаты_Сессия1] FOREIGN KEY([№ группы])
REFERENCES [dbo].[Сессия] ([№ группы])
GO
ALTER TABLE [dbo].[Результаты] CHECK CONSTRAINT [FK_Результаты_Сессия1]
GO
ALTER TABLE [dbo].[Сессия]  WITH CHECK ADD  CONSTRAINT [FK_Сессия_Преподаватели1] FOREIGN KEY([№ преподавателя])
REFERENCES [dbo].[Преподаватели] ([№ преподавателя])
GO
ALTER TABLE [dbo].[Сессия] CHECK CONSTRAINT [FK_Сессия_Преподаватели1]
GO
ALTER TABLE [dbo].[Сессия]  WITH CHECK ADD  CONSTRAINT [FK_Сессия_Результаты1] FOREIGN KEY([№ семестра])
REFERENCES [dbo].[Результаты] ([№ студента])
GO
ALTER TABLE [dbo].[Сессия] CHECK CONSTRAINT [FK_Сессия_Результаты1]
GO
ALTER TABLE [dbo].[Студенты]  WITH CHECK ADD  CONSTRAINT [FK_Студенты_Результаты] FOREIGN KEY([№ студента])
REFERENCES [dbo].[Результаты] ([№ студента])
GO
ALTER TABLE [dbo].[Студенты] CHECK CONSTRAINT [FK_Студенты_Результаты]
GO
USE [master]
GO
ALTER DATABASE [Деканат] SET  READ_WRITE 
GO
