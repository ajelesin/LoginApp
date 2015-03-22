USE [master]
GO

/****** Object:  Database [_LoginAppDb]    Script Date: 22.03.2015 22:52:19 ******/
CREATE DATABASE [_LoginAppDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'_LoginAppDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\_LoginAppDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'_LoginAppDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\_LoginAppDb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [_LoginAppDb] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [_LoginAppDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [_LoginAppDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [_LoginAppDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [_LoginAppDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [_LoginAppDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [_LoginAppDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [_LoginAppDb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [_LoginAppDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [_LoginAppDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [_LoginAppDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [_LoginAppDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [_LoginAppDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [_LoginAppDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [_LoginAppDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [_LoginAppDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [_LoginAppDb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [_LoginAppDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [_LoginAppDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [_LoginAppDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [_LoginAppDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [_LoginAppDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [_LoginAppDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [_LoginAppDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [_LoginAppDb] SET RECOVERY FULL 
GO

ALTER DATABASE [_LoginAppDb] SET  MULTI_USER 
GO

ALTER DATABASE [_LoginAppDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [_LoginAppDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [_LoginAppDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [_LoginAppDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [_LoginAppDb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [_LoginAppDb] SET  READ_WRITE 
GO


USE [_LoginAppDb]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 22.03.2015 22:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [_LoginAppDb]
GO

/****** Object:  Table [dbo].[GroupsPermissions]    Script Date: 22.03.2015 22:52:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GroupsPermissions](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_GroupsPermissions] PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [_LoginAppDb]
GO

/****** Object:  Table [dbo].[Permissions]    Script Date: 22.03.2015 22:52:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [_LoginAppDb]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 22.03.2015 22:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Fio] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [_LoginAppDb]
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

GO
INSERT [dbo].[Groups] ([GroupId], [Name], [Description]) VALUES (1, N'Group 1', N'All')
GO
INSERT [dbo].[Groups] ([GroupId], [Name], [Description]) VALUES (2, N'Group 2', N'2')
GO
INSERT [dbo].[Groups] ([GroupId], [Name], [Description]) VALUES (3, N'Group 3', N'1')
GO
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsPermissions] ON 

GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (2, 1, 2)
GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (3, 1, 3)
GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (4, 2, 1)
GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (5, 2, 2)
GO
INSERT [dbo].[GroupsPermissions] ([RelationId], [GroupId], [PermissionId]) VALUES (6, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[GroupsPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

GO
INSERT [dbo].[Permissions] ([PermissionId], [Name]) VALUES (1, N'access-to-item-1')
GO
INSERT [dbo].[Permissions] ([PermissionId], [Name]) VALUES (2, N'access-to-item-2')
GO
INSERT [dbo].[Permissions] ([PermissionId], [Name]) VALUES (3, N'access-to-item-3')
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserId], [Login], [Fio], [Password], [GroupId]) VALUES (1, N'Login1', N'Fio 1', N'202cb962ac59075b964b07152d234b70', 1)
GO
INSERT [dbo].[Users] ([UserId], [Login], [Fio], [Password], [GroupId]) VALUES (2, N'Login2', N'Fio 2', N'202cb962ac59075b964b07152d234b70', 2)
GO
INSERT [dbo].[Users] ([UserId], [Login], [Fio], [Password], [GroupId]) VALUES (3, N'Login3', N'Fio 3', N'202cb962ac59075b964b07152d234b70', 3)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
