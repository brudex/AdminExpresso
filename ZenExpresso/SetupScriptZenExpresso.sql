USE [master]
GO
/****** Object:  Database [ZenExpresoNetCore]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE DATABASE [ZenExpresoNetCore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZenExpresoNetCore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZenExpresoNetCore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZenExpresoNetCore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZenExpresoNetCore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ZenExpresoNetCore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZenExpresoNetCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZenExpresoNetCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ZenExpresoNetCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZenExpresoNetCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZenExpresoNetCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZenExpresoNetCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZenExpresoNetCore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZenExpresoNetCore] SET  MULTI_USER 
GO
ALTER DATABASE [ZenExpresoNetCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZenExpresoNetCore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZenExpresoNetCore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZenExpresoNetCore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ZenExpresoNetCore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dataSourceName] [nvarchar](max) NULL,
	[dataSourceLabel] [nvarchar](max) NULL,
	[useRawConnectingString] [bit] NULL,
	[connectionString] [nvarchar](max) NULL,
	[serverIp] [nvarchar](max) NULL,
	[serverPort] [nvarchar](max) NULL,
	[defaultDatabase] [nvarchar](max) NULL,
	[dataProvider] [nvarchar](max) NULL,
 CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DedicatedAdmin]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DedicatedAdmin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](max) NULL,
	[fullName] [nvarchar](max) NULL,
 CONSTRAINT [PK_DedicatedAdmin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExecutedTasks]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecutedTasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskId] [int] NULL,
	[parameterValues] [nvarchar](max) NULL,
	[topMenu] [nvarchar](max) NULL,
	[taskName] [nvarchar](max) NULL,
	[taskDescription] [nvarchar](max) NULL,
	[executedBy] [nvarchar](max) NULL,
	[responseStatus] [nvarchar](max) NULL,
	[dateExecuted] [datetime] NULL,
 CONSTRAINT [PK_ExecutedTasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogManagement]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogManagement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[appname] [nvarchar](max) NULL,
	[dbusername] [nvarchar](max) NULL,
	[dbpass] [nvarchar](max) NULL,
	[dbname] [nvarchar](max) NULL,
	[tablename] [nvarchar](max) NULL,
	[searchFields] [nvarchar](max) NULL,
	[dateField] [nvarchar](max) NULL,
	[idField] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogManagement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScriptParameter]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScriptParameter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supportTaskId] [int] NULL,
	[parameterLabel] [nvarchar](max) NULL,
	[parameterName] [nvarchar](max) NULL,
	[parameterType] [nvarchar](max) NULL,
	[parameterValue] [nvarchar](max) NULL,
	[optionsList] [nvarchar](max) NULL,
	[parameterRegex] [nvarchar](max) NULL,
	[parameterLocation] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScriptParameter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupportTask]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportTask](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskName] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[taskType] [nvarchar](max) NULL,
	[taskResultType] [nvarchar](max) NULL,
	[dbusername] [nvarchar](max) NULL,
	[topLevelMenu] [nvarchar](max) NULL,
	[dbPass] [nvarchar](max) NULL,
	[sqlScript] [nvarchar](max) NULL,
	[jsScript] [nvarchar](max) NULL,
	[createdBy] [nvarchar](max) NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_SupportTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupportTaskLite]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportTaskLite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[topLevelMenu] [nvarchar](max) NULL,
	[taskName] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[assginedGroups] [nvarchar](max) NULL,
 CONSTRAINT [PK_SupportTaskLite] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskAssignedGroups]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskAssignedGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskId] [int] NULL,
	[assginedGroups] [nvarchar](max) NULL,
	[createdBy] [nvarchar](max) NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_TaskAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskFlowItem]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskFlowItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supportTaskFlowId] [int] NULL,
	[controlName] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[flowItemType] [varchar](50) NULL,
	[flowData] [text] NULL,
	[flowGroup] [varchar](50) NULL,
	[controlIdentifier] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TopMenu]    Script Date: 17/01/2021 1:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopMenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuName] [nvarchar](max) NULL,
 CONSTRAINT [PK_TopMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201013153256_Initial', N'3.1.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201015213838_InitialCreate', N'3.1.8')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f7a7faa4-a95d-47eb-9c4c-69853100dbc9', N'brudexgh@gmail.com', N'BRUDEXGH@GMAIL.COM', N'brudexgh@gmail.com', N'BRUDEXGH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAGw+Yz2CAvxRUkc6v/VA8SWGjSCGkQlS3seNAyGEee/nUWccSeufFYhT6sEngFcSQ==', N'PMFC7MTVJKKDAEZR72FO6QJ5QZAIPC63', N'21804010-b48c-49a0-9f5d-ddc159903f17', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[DataSource] ON 

INSERT [dbo].[DataSource] ([Id], [dataSourceName], [dataSourceLabel], [useRawConnectingString], [connectionString], [serverIp], [serverPort], [defaultDatabase], [dataProvider]) VALUES (1, N'nla590', N'NLA ussd', 0, NULL, N'localhost', N'1433', N'NLAUssdDb', N'sqlServer')
SET IDENTITY_INSERT [dbo].[DataSource] OFF
SET IDENTITY_INSERT [dbo].[DedicatedAdmin] ON 

INSERT [dbo].[DedicatedAdmin] ([id], [userName], [fullName]) VALUES (1, N'brudexgh@gmail.com', N'Nana Safo')
SET IDENTITY_INSERT [dbo].[DedicatedAdmin] OFF
SET IDENTITY_INSERT [dbo].[ExecutedTasks] ON 

INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1, 1, N'[{"id":9,"supportTaskFlowId":1,"controlName":"Sql Query","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[GameRequest]\\n      ,[GameResponse]\\n      ,[PaymentRequest]\\n      ,[PaymentResponse]\\n      ,[GameCode]\\n      ,[PaymentStatus]\\n      ,[ProcessStatus]\\n      ,[ProcessMessage]\\n      ,[TransId]\\n      ,[createdAt]\\n      ,[updatedAt]\\n      ,[NlaSaveRequest]\\n      ,[NlaSaveResponse]\\n      ,[OrderNumber]\\n      ,[Amount]\\n      ,[Mobile]\\n      ,[GameData]\\n  FROM [NLAUssdDb].[dbo].[GameRequests]\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'First flow', N'first flow', N'brudexgh@gmail.com', NULL, CAST(0x0000AC6301626CB8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2, 1, N'[{"id":9,"supportTaskFlowId":1,"controlName":"Sql Query","controlIdentifier":null,"description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[GameRequest]\\n      ,[GameResponse]\\n      ,[PaymentRequest]\\n      ,[PaymentResponse]\\n      ,[GameCode]\\n      ,[PaymentStatus]\\n      ,[ProcessStatus]\\n      ,[ProcessMessage]\\n      ,[TransId]\\n      ,[createdAt]\\n      ,[updatedAt]\\n      ,[NlaSaveRequest]\\n      ,[NlaSaveResponse]\\n      ,[OrderNumber]\\n      ,[Amount]\\n      ,[Mobile]\\n      ,[GameData]\\n  FROM [NLAUssdDb].[dbo].[GameRequests]\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'First flow', N'first flow', N'brudexgh@gmail.com', N'00', CAST(0x0000AC630182D602 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (3, 2, N'[{"id":1002,"supportTaskFlowId":2,"controlName":"Sql Query","controlIdentifier":null,"description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[supportTaskFlowId]\\n      ,[controlName]\\n      ,[description]\\n      ,[flowItemType]\\n      ,[flowData]\\n      ,[flowGroup]\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced One', N'Advanced One', N'brudexgh@gmail.com', N'00', CAST(0x0000AC63018647C3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (4, 2, N'[{"id":1002,"supportTaskFlowId":2,"controlName":"Sql Query","controlIdentifier":null,"description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[supportTaskFlowId]\\n      ,[controlName]\\n      ,[description]\\n      ,[flowItemType]\\n      ,[flowData]\\n      ,[flowGroup]\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced One', N'Advanced One', N'brudexgh@gmail.com', N'00', CAST(0x0000AC630186C7BA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (5, 3, N'[{"id":1004,"supportTaskFlowId":3,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 2', N'Advance 2', N'brudexgh@gmail.com', N'00', CAST(0x0000AC63018730E7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (6, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC64008B53B8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (7, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC64008BC754 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (8, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC64008CC947 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1002, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400A3084C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1003, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B3D143 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1004, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B47C01 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1005, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B8281A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1006, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B8F75A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1007, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B9AFCE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1008, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400B9E7CA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1009, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400C9E46A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1010, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400CBB85F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1011, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400CBF2A6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1012, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400CC32FF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1013, 5, N'[{"id":1006,"supportTaskFlowId":5,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 *\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced 6', N'Advanced 6', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400CCA763 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1014, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6400F01DA1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1015, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC640164126D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1016, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC64016583E4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1017, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008979E8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1018, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC650089E2D2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1019, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008A40E8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1020, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008B400F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1021, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008B7EA2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1022, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008BD255 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1023, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008BD61F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1024, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008C81EA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1025, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC65008F53AA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1026, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660114CDFB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1027, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601151CA5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1028, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601153D6D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1029, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660115E739 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1030, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660115F05F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1031, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660115F9C7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1032, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66011689FB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1033, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601169654 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1034, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601169E95 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1035, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660116A785 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1036, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660116B331 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1037, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660116D0CC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1038, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660116E3B0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1039, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660119BB02 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1040, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660119FFC7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1041, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66011C6A75 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1042, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66011C8AF7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1043, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66011CBA22 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1044, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601220E90 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1045, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660126BF42 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1046, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601275D21 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1047, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601279414 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1048, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660127998F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1049, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660127B564 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1050, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660127D6FE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1051, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660127E8BB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1052, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66012E8E75 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1053, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660130B1E9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1054, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601317888 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1055, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601317E7F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1056, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601320122 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1057, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601324036 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1058, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601325198 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1059, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601326312 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1060, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660132704D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1061, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660159AF92 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1062, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015A46DF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1063, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015AC92C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1064, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015B0F5F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1065, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015BF97B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1066, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015C3816 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1067, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015C465A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1068, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015C8063 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1069, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015C9212 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1070, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015DCDB2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1071, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015E38A5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1072, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66015E3FF7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1073, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601608006 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1074, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601608E35 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1075, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160918C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1076, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160AE39 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1077, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160B359 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1078, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160CDD7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1079, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160F327 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1080, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660160F6A7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1081, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC66016175AC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1082, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6601625ABF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1083, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660162802E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1084, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660162953F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1085, 1003, N'[{"id":2003,"supportTaskFlowId":1003,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[taskId]\\n      ,[parameterValues]\\n      ,[topMenu]\\n      ,[taskName]\\n      ,[taskDescription]\\n      ,[executedBy]\\n      ,[responseStatus]\\n      ,[dateExecuted]\\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dbusername\": \"sa\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 8', N'Task 8', N'brudexgh@gmail.com', N'00', CAST(0x0000AC660162CCE0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1086, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013A9091 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1087, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013AE253 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1088, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013AE9DE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1089, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013AEF28 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1090, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013C9231 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1091, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013C9872 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1092, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013F6617 AS DateTime))
GO
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1093, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67013F6FEB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1094, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670142D213 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1095, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670145596F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1096, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670145B0F2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1097, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670146523F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1098, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67014747BD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1099, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67015EE649 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1100, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67015F65A0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1101, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701615932 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1102, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701624C41 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1103, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016257DD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1104, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701626064 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1105, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701627CE2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1106, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701628447 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1107, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670162BEEC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1108, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016310BC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1109, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701673EE5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1110, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670167FC9F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1111, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701680B56 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1112, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016D4C98 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1113, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016D9CC7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1114, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016DA748 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1115, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016DAB83 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1116, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016DBB15 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1117, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016EC546 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1118, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67016F9074 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1119, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701700457 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1120, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670172044E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1121, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670172A9E9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1122, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC67017437C7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1123, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670176096B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1124, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701762E40 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1125, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701766E3C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1126, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670176DC27 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1127, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670176EF21 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1128, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670176FCF2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1129, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701773116 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1130, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6701775000 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1131, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670177AB27 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1132, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC670177DC0D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1133, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800C8FFBF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1134, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800C972CA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1135, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800C97A9F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1136, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800C98C9E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1137, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800C9A137 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1138, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CA5352 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1139, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CA64E3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1140, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CA8155 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1141, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CA88D9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1142, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CA945F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1143, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CAAD56 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1144, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CACF72 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1145, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CB7356 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1146, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CC27E5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1147, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CC394E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1148, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CD5EE8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1149, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CD65D1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1150, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CD8820 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1151, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CD8DA7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1152, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CEB17E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1153, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CEBACD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1154, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CF3D10 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1155, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CF40BD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1156, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CF631B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1157, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CFB7DF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1158, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800CFBCA9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1159, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800D04543 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1160, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800D04D8D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1161, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E2DA72 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1162, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E2E57D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1163, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E363E0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1164, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E37BE1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1165, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E50F1B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1166, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E7352B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1167, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E85F46 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1168, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E95AAA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1169, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E9A61A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1170, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800E9D92F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1171, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800EA2608 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1172, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6800EA4DD8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1173, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016D313A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1174, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016D83A4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1175, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016D8AC6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1176, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016DA0F9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1177, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016E3077 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1178, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016E38DA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1179, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016F5305 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1180, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016FFB18 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1181, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F016FFF12 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1182, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F01700499 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1183, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F01715158 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1184, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F0171731D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1185, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F0171850D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1186, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F0171F939 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1187, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F017208C9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1188, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F0172760D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1189, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F0178E032 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1190, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F01798305 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1191, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F01799317 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1192, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F017A0DE0 AS DateTime))
GO
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1193, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F017A1BC1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1194, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC6F017CADC5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1195, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000B8D356 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1196, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000BBC33C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1197, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000BBF5DC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1198, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000C111B2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1199, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000C11561 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1200, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000F5030C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1201, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7000F82177 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1202, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "name",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "lname",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111389",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7001004B00 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1203, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC700123961A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1204, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "sdf",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "lname",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111389",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC700123FD69 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1205, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7001248D8F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1206, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC700124905F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1207, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "name",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "lname",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111389",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC700126414B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1208, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100E8E2ED AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1209, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "name",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "lname",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111389",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100E90881 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1210, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100E967A4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1211, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100EA2D44 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1212, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100EAAAFA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1213, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100EAAFCB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1214, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100EADA4B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1215, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "fname",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "lnam",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111389",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100EB041C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1216, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100FDA4EE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1217, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7100FE17B7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1218, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7101031F24 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1219, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801673C18 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1220, 1004, N'{
  "taskId": "1004",
  "clientResults": [
    {
      "id": 2005,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "First Name",
          "parameterName": "fname",
          "parameterValue": "name",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Last Name",
          "parameterName": "lname",
          "parameterValue": "label",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Account Number",
          "parameterName": "account",
          "parameterValue": "6090111368",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Agree to terms",
          "parameterName": "agreeTerms",
          "parameterValue": true,
          "parameterType": "checkbox"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00M\"},{\"label\":\"Femail\",\"value\":\"Femail\",\"$$hashKey\":\"00N\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780167538D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1221, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78016B2766 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1222, 2, N'[{"id":1002,"supportTaskFlowId":2,"controlName":"Sql Query","controlIdentifier":null,"description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [id]\\n      ,[supportTaskFlowId]\\n      ,[controlName]\\n      ,[description]\\n      ,[flowItemType]\\n      ,[flowData]\\n      ,[flowGroup]\\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Advanced One', N'Advanced One', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780173185D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1223, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801731E7B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1224, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801746951 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1225, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801746953 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1226, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801747C35 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1227, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780174F541 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1228, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801756EA2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1229, 1006, N'{
  "taskId": "1006",
  "clientResults": [
    {
      "id": 2010,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Mobile",
          "parameterName": "mobile",
          "parameterValue": "233246583910",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Game Code",
          "parameterName": "gameCode",
          "parameterValue": "N90X5_TUE",
          "parameterType": "text"
        }
      ]
    }
  ]
}', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801756FF3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1230, 1004, N'[{"id":2004,"supportTaskFlowId":1004,"controlName":"Sql Query","controlIdentifier":"sqlQuery1","description":"","flowItemType":"sqlQuery","flowData":"{\r\n  \"sqlQuery\": \"SELECT TOP 1000 [RecordId]\\n      ,[DesignName]\\n      ,[FullDescription]\\n       \\n  FROM [uBuild].[dbo].[HouseDesigns]\",\r\n  \"controlIdentifier\": \"sqlQuery1\",\r\n  \"dataSource\": \"nla590\",\r\n  \"dbusername\": \"sa\",\r\n  \"dbPass\": \"pass\",\r\n  \"error\": {}\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Task 9', N'Task 9', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801762CA5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1231, 1007, N'[]', N'NLA590', N'Task 10', N'Task 10', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801763328 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1232, 1007, N'{
  "taskId": "1007",
  "clientResults": [
    {
      "id": 2012,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Mobile",
          "parameterName": "mobile",
          "parameterValue": "233246583910",
          "parameterType": "text"
        },
        {
          "parameterLabel": "GameCode",
          "parameterName": "gameCode",
          "parameterValue": "N90X5_TUE",
          "parameterType": "text"
        }
      ]
    }
  ]
}', N'NLA590', N'Task 10', N'Task 10', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780176432F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1233, 1007, N'[]', N'NLA590', N'Task 10', N'Task 10', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017D6DEE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1234, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017D7283 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1235, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017EA4BE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1236, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017EAF6B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1237, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017EB30E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1238, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017EB8F7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1239, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017F0656 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1240, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017F0BC1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1241, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC78017F0E61 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1242, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801803078 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1243, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801804250 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1244, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780180EDA6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1245, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801822BF3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1246, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801823FC9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1247, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801825A49 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1248, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801826D1F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1249, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7801827A0A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1250, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC780182827E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1251, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790015DA08 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1252, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790015E94D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1253, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7900181F7B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1254, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7900191A7B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1255, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019221E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1256, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019311E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1257, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7900193595 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1258, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7900194BCC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1259, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019505B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1260, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019B19A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1261, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019C1EF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1262, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019DA21 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1263, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC790019EA23 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1264, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001ADABB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1265, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001B57F7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1266, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001BA964 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1267, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001C1765 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1268, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001C408F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1269, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC79001C6C30 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1270, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7900226CD7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (1271, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7A00C98575 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2271, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D01774CCB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2272, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D0184F852 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2273, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D0185EE67 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2274, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D018626F2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2275, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D01869FC9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2276, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D018711F7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2277, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D018725BB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2278, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7D01874B51 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2279, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E0009124A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2280, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E000979B8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2281, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E0009B388 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2282, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E0009CBC4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2283, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E0009DF4B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2284, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E000A0554 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2285, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E000A1EFB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2286, 1008, N'[]', N'NLA590', N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC7E000A5593 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2287, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200064FC3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2288, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82000778EF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2289, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82000E7F79 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2290, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200A43A1A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2291, 1010, N'[{"id":2021,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer ACCESS-TOKEN\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200A4AB6D AS DateTime))
GO
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2292, 1010, N'[{"id":2021,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer ACCESS-TOKEN\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2E0D1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2293, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2F43B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2294, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2F9C6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2295, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2F898 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2296, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2FBA3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2297, 1010, N'[{"id":2021,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer ACCESS-TOKEN\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C2FEB4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2298, 1009, N'[{"id":2020,"supportTaskFlowId":1009,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [],\r\n  \"basicAuth\": {},\r\n  \"resturl\": \"https://jsonplaceholder.typicode.com/posts\",\r\n  \"method\": \"GET\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Rest api test', N'Rest api test', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C39068 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2299, 1010, N'[{"id":2021,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer ACCESS-TOKEN\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C393E8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2300, 1010, N'[{"id":2021,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer ACCESS-TOKEN\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200C39643 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2301, 1010, N'[{"id":2022,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"restApi1","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"f573b943989e5fb64a7f84bfda96bc33f68059c2bb65ebaf8e5754e187369125\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\",\r\n  \"controlIdentifier\": \"restApi1\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200DE046A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2302, 1010, N'[{"id":2022,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"restApi1","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"f573b943989e5fb64a7f84bfda96bc33f68059c2bb65ebaf8e5754e187369125\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\",\r\n  \"controlIdentifier\": \"restApi1\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200DE4A50 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2303, 1010, N'[{"id":2023,"supportTaskFlowId":1010,"controlName":"Rest Api","controlIdentifier":"restApi2","description":"","flowItemType":"rest","flowData":"{\r\n  \"headers\": [\r\n    {\r\n      \"headerKey\": \"Authorization\",\r\n      \"headerValue\": \"Bearer f573b943989e5fb64a7f84bfda96bc33f68059c2bb65ebaf8e5754e187369125\",\r\n      \"error\": {}\r\n    }\r\n  ],\r\n  \"basicAuth\": {},\r\n  \"body\": \"{\\\"name\\\":\\\"Tenali Ramakrishna\\\", \\\"gender\\\":\\\"Male\\\", \\\"email\\\":\\\"tenali.ramakrishna@15ce.com\\\", \\\"status\\\":\\\"Active\\\"}\",\r\n  \"resturl\": \"https://gorest.co.in/public-api/users\",\r\n  \"method\": \"POST\",\r\n  \"contentType\": \"application/json\",\r\n  \"controlIdentifier\": \"restApi2\"\r\n}","flowGroup":"beforeRender"}]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200DEA908 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2304, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FD8123 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2305, 1010, N'{
  "taskId": "1010",
  "clientResults": [
    {
      "id": 2024,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Full name",
          "parameterName": "name",
          "parameterValue": "Nana Osaf",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00H\"},{\"label\":\"Female\",\"value\":\"Female\",\"$$hashKey\":\"00I\"}]"
        },
        {
          "parameterLabel": "Email",
          "parameterName": "email",
          "parameterValue": "test@example.com",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Status",
          "parameterName": "status",
          "parameterValue": "Active",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Active\",\"value\":\"Active\",\"$$hashKey\":\"00N\"},{\"label\":\"InActive\",\"value\":\"InActive\",\"$$hashKey\":\"00O\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FED5BE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2306, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FF4673 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2307, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FF46D2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2308, 1010, N'{
  "taskId": "1010",
  "clientResults": [
    {
      "id": 2024,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Full name",
          "parameterName": "name",
          "parameterValue": "Nana Osaf",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00H\"},{\"label\":\"Female\",\"value\":\"Female\",\"$$hashKey\":\"00I\"}]"
        },
        {
          "parameterLabel": "Email",
          "parameterName": "email",
          "parameterValue": "brudexgh@gmail.com",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Status",
          "parameterName": "status",
          "parameterValue": "Active",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Active\",\"value\":\"Active\",\"$$hashKey\":\"00N\"},{\"label\":\"InActive\",\"value\":\"InActive\",\"$$hashKey\":\"00O\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FF9761 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2309, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFB76D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2310, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFB77B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2311, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFBA91 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2312, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFBAED AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2313, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFBB4D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2314, 1010, N'[]', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFBB72 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2315, 1010, N'{
  "taskId": "1010",
  "clientResults": [
    {
      "id": 2024,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Full name",
          "parameterName": "name",
          "parameterValue": "Nana Osaf",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00H\"},{\"label\":\"Female\",\"value\":\"Female\",\"$$hashKey\":\"00I\"}]"
        },
        {
          "parameterLabel": "Email",
          "parameterName": "email",
          "parameterValue": "brudexgh@gmail.com",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Status",
          "parameterName": "status",
          "parameterValue": "Active",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Active\",\"value\":\"Active\",\"$$hashKey\":\"00N\"},{\"label\":\"InActive\",\"value\":\"InActive\",\"$$hashKey\":\"00O\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Res Api Post', N'Res Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8200FFF079 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2316, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820100482E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2317, 1010, N'{
  "taskId": "1010",
  "clientResults": [
    {
      "id": 2026,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Full name",
          "parameterName": "name",
          "parameterValue": "GogStaffUssd",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00H\"},{\"label\":\"Female\",\"value\":\"Female\",\"$$hashKey\":\"00I\"}]"
        },
        {
          "parameterLabel": "Email",
          "parameterName": "email",
          "parameterValue": "brudexgh@gmail.com",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Status",
          "parameterName": "status",
          "parameterValue": "Active",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Active\",\"value\":\"Active\",\"$$hashKey\":\"00N\"},{\"label\":\"InActive\",\"value\":\"InActive\",\"$$hashKey\":\"00O\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201005EE2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2318, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82010A4512 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2319, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82010A451F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2320, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201105688 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2321, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201105697 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2322, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201106D0D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2323, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201106D16 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2324, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201109EDB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2325, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201109EE7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2326, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110B48B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2327, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110B499 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2328, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110DEE5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2329, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110DF00 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2330, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110F8BF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2331, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820110F8C9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2332, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820113830C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2333, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201138327 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2334, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820113971D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2335, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820113972C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2336, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122A0C5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2337, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122A0D6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2338, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122B68E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2339, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122B69B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2340, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122D5E4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2341, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820122D5ED AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2342, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124098C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2343, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124099A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2344, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012426A7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2345, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012426AE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2346, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201245F81 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2347, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201245F90 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2348, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201247BCE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2349, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201247BDA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2350, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124A3AA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2351, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124A3B9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2352, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124EC53 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2353, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820124EC64 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2354, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820125045F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2355, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820125046C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2356, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012517CB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2357, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012517D2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2358, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201252145 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2359, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820125214E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2360, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201253313 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2361, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820125331F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2362, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012590D7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2363, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82012590E5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2364, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201290482 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2365, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820129048C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2366, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820136F5B4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2367, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820136F5C7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2368, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201370509 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2369, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820137052F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2370, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201379A5E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2371, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201379A6A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2372, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201385C7E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2373, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201385C8E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2374, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820138AAF0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2375, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820138AAF8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2376, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820138EA2D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2377, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820138EA3E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2378, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201390AB2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2379, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201390AC9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2380, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820139157C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2381, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820139158D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2382, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013937FF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2383, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820139380A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2384, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820139612D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2385, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820139613B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2386, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ABA96 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2387, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ABAA2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2388, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ACFA0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2389, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ACFB0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2390, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013AD668 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2391, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013AD671 AS DateTime))
GO
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2392, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ADB3D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2393, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013ADB45 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2394, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B710B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2395, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B711D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2396, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B78F3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2397, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B78F9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2398, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B94CA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2399, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82013B94D3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2400, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201486EDB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2401, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201486EEE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2402, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201493EA6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2403, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201493ECE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2404, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201494BAA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2405, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201494BB5 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2406, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014962FD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2407, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820149630F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2408, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820149CB06 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2409, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820149CB19 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2410, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014A4D40 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2411, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014A4D59 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2412, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AB646 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2413, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AB65D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2414, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AC2B0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2415, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AC2BA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2416, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AD22B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2417, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AD234 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2418, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AE081 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2419, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014AE090 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2420, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014B56B1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2421, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014B56C9 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2422, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014BAE80 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2423, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014BAE94 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2424, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014C257E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2425, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014C2591 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2426, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014D0B66 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2427, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014D0B72 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2428, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014EB58F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2429, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014EB59E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2430, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014ED5A6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2431, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82014ED5BB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2432, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820150BD97 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2433, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820150BDAF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2434, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015650FD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2435, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820156511F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2436, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201570670 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2437, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201570680 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2438, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820157501A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2439, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201575034 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2440, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201575B98 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2441, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201575BB6 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2442, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201578425 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2443, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201578437 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2444, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820157A33D AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2445, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820157A346 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2446, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820157F2CD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2447, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820157F2E0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2448, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201580ED2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2449, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201580EE2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2450, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820158DB8A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2451, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820158DBA4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2452, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201596583 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2453, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201596597 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2454, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015974DD AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2455, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015974F0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2456, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201598BD3 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2457, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201598C0E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2458, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015ADC12 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2459, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015ADC22 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2460, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B0B72 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2461, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B0B9B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2462, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B5312 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2463, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B5323 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2464, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B5A29 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2465, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B5A3B AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2466, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B614C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2467, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015B6152 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2468, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015E89C2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2469, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015E89E0 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2470, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015F2897 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2471, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015F28A8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2472, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015F7CDE AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2473, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82015F7CED AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2474, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820160439C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2475, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016043AC AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2476, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201609C49 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2477, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201609C56 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2478, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820160D25C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2479, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820160D273 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2480, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016110B1 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2481, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016110C8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2482, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820161A098 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2483, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820161A0A4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2484, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820161C86E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2485, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820161C87A AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2486, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162210C AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2487, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201622118 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2488, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201626884 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2489, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201626892 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2490, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201628253 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2491, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201628268 AS DateTime))
GO
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2492, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201629D8E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2493, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201629D97 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2494, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162B286 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2495, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162B290 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2496, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162C349 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2497, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162C351 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2498, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162F9AB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2499, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820162F9B7 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2500, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016308DF AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2501, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016308F2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2502, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016312D4 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2503, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC82016312DA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2504, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163ABEB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2505, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163ABF8 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2506, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163DC9F AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2507, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163DCB2 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2508, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163FD81 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2509, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC820163FD93 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2510, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201668401 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2511, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201668413 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2512, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201669C45 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2513, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000AC8201669C6E AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2514, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000ACB300119F53 AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2515, 1006, N'[]', N'NLA590', N'Sql Script with params', N'Sql Scipt with params', N'brudexgh@gmail.com', N'00', CAST(0x0000ACB30011B4FB AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2516, 1010, N'[]', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000ACB300121BDA AS DateTime))
INSERT [dbo].[ExecutedTasks] ([id], [taskId], [parameterValues], [topMenu], [taskName], [taskDescription], [executedBy], [responseStatus], [dateExecuted]) VALUES (2517, 1010, N'{
  "taskId": "1010",
  "clientResults": [
    {
      "id": 2026,
      "controlName": "Input Form",
      "flowItemType": "inputForm.html",
      "controlIdentifier": "",
      "flowGroup": "clientRender",
      "taskResult": [
        {
          "parameterLabel": "Full name",
          "parameterName": "name",
          "parameterValue": "GogStaffUssd",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Gender",
          "parameterName": "gender",
          "parameterValue": "Male",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Male\",\"value\":\"Male\",\"$$hashKey\":\"00H\"},{\"label\":\"Female\",\"value\":\"Female\",\"$$hashKey\":\"00I\"}]"
        },
        {
          "parameterLabel": "Email",
          "parameterName": "email",
          "parameterValue": "brudexgh@gmail.com",
          "parameterType": "text"
        },
        {
          "parameterLabel": "Status",
          "parameterName": "status",
          "parameterValue": "Active",
          "parameterType": "select",
          "optionsList": "[{\"label\":\"Active\",\"value\":\"Active\",\"$$hashKey\":\"00N\"},{\"label\":\"InActive\",\"value\":\"InActive\",\"$$hashKey\":\"00O\"}]"
        }
      ]
    }
  ]
}', N'NLA590', N'Rest Api Post', N'Rest Api Post', N'brudexgh@gmail.com', N'00', CAST(0x0000ACB3001232BF AS DateTime))
SET IDENTITY_INSERT [dbo].[ExecutedTasks] OFF
SET IDENTITY_INSERT [dbo].[SupportTask] ON 

INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1, N'First flow', N'first flow', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC60016E7B9A AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (2, N'Advanced One', N'Advanced One', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC630180EBB4 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (3, N'Advanced 2', N'Advance 2', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC630186762D AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (4, N'Advanced 4', N'Advanced 4', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC640089DD07 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (5, N'Advanced 6', N'Advanced 6', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC64008A6A94 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1002, N'Advanced 7', N'Advanced 7', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC6400E202F7 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1003, N'Task 8', N'Task 8', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC6400EFD547 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1004, N'Task 9', N'Task 9', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC6601744851 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1005, N'Task 10 with success', N'Task 10 with success', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC6A010BC523 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1006, N'Sql Script with params', N'Sql Scipt with params', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC7801730FC7 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1007, N'Task 10', N'Task 10', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC7801762595 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1008, N'Mulit Select and checkbox test', N'Mulit Select and checkbox test', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC7D0184BB8A AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1009, N'Rest api test', N'Rest api test', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC810186E002 AS DateTime))
INSERT [dbo].[SupportTask] ([id], [taskName], [description], [taskType], [taskResultType], [dbusername], [topLevelMenu], [dbPass], [sqlScript], [jsScript], [createdBy], [createdAt]) VALUES (1010, N'Rest Api Post', N'Rest Api Post', N'AdvancedTaskFlow', NULL, NULL, N'NLA590', NULL, NULL, NULL, N'brudexgh@gmail.com', CAST(0x0000AC8201002A0D AS DateTime))
SET IDENTITY_INSERT [dbo].[SupportTask] OFF
SET IDENTITY_INSERT [dbo].[TaskAssignedGroups] ON 

INSERT [dbo].[TaskAssignedGroups] ([id], [taskId], [assginedGroups], [createdBy], [createdAt]) VALUES (1, 1, N'[
  {
    "groupType": "SingleUser",
    "groupName": "jkunmi@gmail.com"
  }
]', N'brudexgh@gmail.com', CAST(0x0000ABDE00E1D366 AS DateTime))
SET IDENTITY_INSERT [dbo].[TaskAssignedGroups] OFF
SET IDENTITY_INSERT [dbo].[TaskFlowItem] ON 

INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (9, 1, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests]",
  "error": {}
}', N'beforeRender', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (10, 1, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests]",
  "error": {}
}', N'clientRender', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (11, 1, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests] where mobile = @mobile",
  "error": {}
}', N'postAction', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (12, 1, N'Table Output', N'first table', N'tableResult', N'{
  "options": {
    "searchable": true,
    "exportbuttons": true
  },
  "rowActionButtons": [],
  "description": "first table",
  "error": {}
}', N'clientResult', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (13, 1, N'Table Output', N'first table', N'tableResult', N'{
  "options": {
    "searchable": true,
    "exportbuttons": true
  },
  "rowActionButtons": [],
  "description": "first table",
  "error": {}
}', N'clientResult', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (1002, 2, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[supportTaskFlowId]\n      ,[controlName]\n      ,[description]\n      ,[flowItemType]\n      ,[flowData]\n      ,[flowGroup]\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (1003, 2, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[supportTaskFlowId]\n      ,[controlName]\n      ,[description]\n      ,[flowItemType]\n      ,[flowData]\n      ,[flowGroup]\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'clientRender', NULL)
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (1004, 3, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 *\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (1005, 4, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 *\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (1006, 5, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 *\n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2002, 1002, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[taskId]\n      ,[parameterValues]\n      ,[topMenu]\n      ,[taskName]\n      ,[taskDescription]\n      ,[executedBy]\n      ,[responseStatus]\n      ,[dateExecuted]\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]",
  "controlIdentifier": "sqlQuery1",
  "dbusername": "sa",
  "dataSource": "nla590",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2003, 1003, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[taskId]\n      ,[parameterValues]\n      ,[topMenu]\n      ,[taskName]\n      ,[taskDescription]\n      ,[executedBy]\n      ,[responseStatus]\n      ,[dateExecuted]\n  FROM [ZenExpresoNetCore].[dbo].[ExecutedTasks]",
  "controlIdentifier": "sqlQuery1",
  "dbusername": "sa",
  "dataSource": "nla590",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2004, 1004, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [RecordId]\n      ,[DesignName]\n      ,[FullDescription]\n       \n  FROM [uBuild].[dbo].[HouseDesigns]",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2005, 1004, N'Input Form', N'', N'inputForm', N'{
  "formControls": [
    {
      "error": {},
      "fieldLabel": "First Name",
      "fieldName": "fname",
      "fieldType": "text",
      "validation": "text"
    },
    {
      "error": {},
      "fieldLabel": "Last Name",
      "fieldName": "lname",
      "fieldType": "text",
      "validation": "text"
    },
    {
      "error": {},
      "fieldLabel": "Account Number",
      "fieldName": "account",
      "fieldType": "text",
      "validation": "account"
    },
    {
      "error": {},
      "validation": "_none_",
      "fieldType": "checkbox",
      "fieldLabel": "Agree to terms",
      "fieldName": "agreeTerms"
    },
    {
      "error": {
        "validation": true
      },
      "fieldType": "select",
      "selectOptionsDatasource": {
        "inputFormat": "delimited",
        "dataSourceName": "Gender",
        "dropDownOptions": "Male\nFemail",
        "key": "1"
      },
      "fieldLabel": "Gender",
      "fieldName": "gender",
      "validation": "_none_"
    }
  ],
  "dataSources": [
    {
      "inputFormat": "delimited",
      "dataSourceName": "Gender",
      "dropDownOptions": "Male\nFemail",
      "key": "1"
    }
  ]
}', N'clientRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2006, 1004, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[appId]\n      ,[uniqueId]\n      ,[parentFlowId]\n      ,[flowId]\n      ,[position]\n      ,[displayText]\n      ,[actionName]\n      ,[returnValue]\n      ,[inputHolder]\n      ,[actionId]\n      ,[terminateOnActionFail]\n      ,[forceTerminate]\n      ,[displayType]\n      ,[terminate]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[headerText]\n      ,[footerText]\n      ,[preExecuteAction]\n  FROM [UssdDb].[dbo].[UssdMenus]",
  "controlIdentifier": "sqlQuery2",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'postAction', N'sqlQuery2')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2007, 1004, N'Table Output', N'The first table', N'tableResult', N'{
  "options": {
    "searchable": true,
    "exportbuttons": true
  },
  "rowActionButtons": [],
  "description": "The first table",
  "error": {}
}', N'clientResult', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2008, 1005, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1 [id] ''status''\n      ,[supportTaskFlowId] ''message''     \n  FROM [ZenExpresoNetCore].[dbo].[TaskFlowItem]",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'beforeRender', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2009, 1005, N'Success Message Result', N'', N'successMessage', N'{
  "statusCodes": [
    {
      "fieldName": "status",
      "code": "9",
      "alertType": "succes",
      "enterMessage": true,
      "staticMessage": "This message is success"
    },
    {
      "fieldName": "status",
      "code": "1",
      "enterMessage": true,
      "staticMessage": "This message failed",
      "alertType": "error"
    }
  ]
}', N'clientResult', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2010, 1006, N'Input Form', N'', N'inputForm', N'
  {
  "formControls": [
    {
      "error": {},
      "fieldLabel": "Mobile",
      "fieldName": "mobile",
      "fieldType": "text",
      "validation": "phone"
    },
    {
      "error": {},
      "fieldName": "gameCode",
      "fieldLabel": "Game Code",
      "fieldType": "text",
      "validation": "_none_"
    }
  ],
  "dataSources": []
}', N'clientRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2011, 1006, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests]\n  where mobile =@mobile\n  and GameCode= ''${gameCode}''",
  "controlIdentifier": "sqlQuery1",
  "error": {}
}', N'postAction', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2012, 1007, N'Input Form', N'', N'inputForm', N'{
  "formControls": [
    {
      "error": {},
      "fieldLabel": "Mobile",
      "fieldName": "mobile",
      "fieldType": "text",
      "validation": "phone"
    },
    {
      "error": {},
      "fieldLabel": "GameCode",
      "fieldName": "gameCode",
      "fieldType": "text",
      "validation": "_none_"
    }
  ],
  "dataSources": []
}', N'clientRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2013, 1007, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests]\n  where mobile =@mobile\n  and GameCode= ''${gameCode}''",
  "controlIdentifier": "sqlQuery1",
  "dataSource": "nla590",
  "dbusername": "sa",
  "dbPass": "pass",
  "error": {}
}', N'postAction', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2018, 1008, N'Input Form', N'', N'inputForm', N'{
  "formControls": [
    {
      "error": {},
      "fieldLabel": "Game Codes",
      "fieldType": "multiselect",
      "fieldName": "gameCodes",
      "selectOptionsDatasource": {
        "dropDownOptions": "N90X5_WED\nN90X5_TUE",
        "dataSourceName": "gameCodes",
        "inputFormat": "delimited",
        "key": "1"
      },
      "validation": "_none_"
    },
    {
      "error": {
        "validation": true
      },
      "fieldLabel": "Payment Made",
      "fieldName": "paymentStatus",
      "fieldType": "checkbox",
      "validation": "_none_"
    },
    {
      "error": {},
      "fieldLabel": "Field 3",
      "fieldName": "field4",
      "fieldType": "text",
      "validation": "text"
    }
  ],
  "dataSources": [
    {
      "dropDownOptions": "N90X5_WED\nN90X5_TUE",
      "dataSourceName": "gameCodes",
      "inputFormat": "delimited",
      "key": "1"
    }
  ]
}', N'clientRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2019, 1008, N'Sql Query', N'', N'sqlQuery', N'{
  "sqlQuery": "SELECT TOP 1000 [id]\n      ,[GameRequest]\n      ,[GameResponse]\n      ,[PaymentRequest]\n      ,[PaymentResponse]\n      ,[GameCode]\n      ,[PaymentStatus]\n      ,[ProcessStatus]\n      ,[ProcessMessage]\n      ,[TransId]\n      ,[createdAt]\n      ,[updatedAt]\n      ,[NlaSaveRequest]\n      ,[NlaSaveResponse]\n      ,[OrderNumber]\n      ,[Amount]\n      ,[Mobile]\n      ,[GameData]\n  FROM [NLAUssdDb].[dbo].[GameRequests] where\n   GameCode in (@gameCodes) and PaymentStatus=${paymentStatus}",
  "controlIdentifier": "sqlQuery1",
  "error": {}
}', N'postAction', N'sqlQuery1')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2020, 1009, N'Rest Api', N'', N'rest', N'{
  "headers": [],
  "basicAuth": {},
  "resturl": "https://jsonplaceholder.typicode.com/posts",
  "method": "GET",
  "contentType": "application/json"
}', N'beforeRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2026, 1010, N'Input Form', N'', N'inputForm', N'{
  "formControls": [
    {
      "error": {},
      "fieldLabel": "Full name",
      "fieldName": "name",
      "fieldType": "text",
      "validation": "_none_"
    },
    {
      "error": {},
      "fieldType": "select",
      "selectOptionsDatasource": {
        "dropDownOptions": "Male\nFemale",
        "dataSourceName": "Gender",
        "inputFormat": "delimited",
        "key": "1"
      },
      "fieldName": "gender",
      "fieldLabel": "Gender",
      "validation": "_none_"
    },
    {
      "error": {},
      "fieldLabel": "Email",
      "fieldName": "email",
      "fieldType": "text",
      "validation": "email"
    },
    {
      "error": {},
      "fieldType": "select",
      "selectOptionsDatasource": {
        "dropDownOptions": "Active\nInActive",
        "dataSourceName": "Status",
        "inputFormat": "delimited",
        "key": "2"
      },
      "fieldLabel": "Status",
      "validation": "_none_",
      "fieldName": "status"
    }
  ],
  "dataSources": [
    {
      "inputFormat": "rest",
      "isFlowItem": true
    },
    {
      "dropDownOptions": "Male\nFemale",
      "dataSourceName": "Gender",
      "inputFormat": "delimited",
      "key": "1"
    },
    {
      "dropDownOptions": "Active\nInActive",
      "dataSourceName": "Status",
      "inputFormat": "delimited",
      "key": "2"
    }
  ]
}', N'clientRender', N'')
INSERT [dbo].[TaskFlowItem] ([id], [supportTaskFlowId], [controlName], [description], [flowItemType], [flowData], [flowGroup], [controlIdentifier]) VALUES (2027, 1010, N'Rest Api', N'', N'rest', N'{
  "headers": [
    {
      "headerKey": "Authorization",
      "headerValue": "Bearer f573b943989e5fb64a7f84bfda96bc33f68059c2bb65ebaf8e5754e187369125",
      "error": {}
    }
  ],
  "basicAuth": {},
  "controlIdentifier": "restApi1",
  "resturl": "https://gorest.co.in/public-api/users",
  "method": "POST",
  "contentType": "application/json",
  "body": "{\"name\":\"${name}\", \"gender\":\"${gender}\", \"email\":\"${email}\", \"status\":\"${status}\"}"
}', N'postAction', N'restApi1')
SET IDENTITY_INSERT [dbo].[TaskFlowItem] OFF
SET IDENTITY_INSERT [dbo].[TopMenu] ON 

INSERT [dbo].[TopMenu] ([id], [menuName]) VALUES (1, N'NLA590')
SET IDENTITY_INSERT [dbo].[TopMenu] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/01/2021 1:32:57 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [ZenExpresoNetCore] SET  READ_WRITE 
GO
