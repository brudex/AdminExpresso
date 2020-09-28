USE [master]
GO
/****** Object:  Database [ZenExpresso]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE DATABASE [ZenExpresso]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'ZenExpresso', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZenExpresso.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'ZenExpresso_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZenExpresso_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
ALTER DATABASE [ZenExpresso] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZenExpresso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZenExpresso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZenExpresso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZenExpresso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZenExpresso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZenExpresso] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZenExpresso] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZenExpresso] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ZenExpresso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZenExpresso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZenExpresso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZenExpresso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZenExpresso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZenExpresso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZenExpresso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZenExpresso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZenExpresso] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZenExpresso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZenExpresso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZenExpresso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZenExpresso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZenExpresso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZenExpresso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZenExpresso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZenExpresso] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZenExpresso] SET  MULTI_USER 
GO
ALTER DATABASE [ZenExpresso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZenExpresso] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZenExpresso] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZenExpresso] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ZenExpresso]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 28/09/2020 11:38:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28/09/2020 11:38:28 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28/09/2020 11:38:28 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28/09/2020 11:38:28 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28/09/2020 11:38:28 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28/09/2020 11:38:28 AM ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[DedicatedAdmin]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[ExecutedTasks]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[LogManagement]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[ScriptParameter]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[SupportTask]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[SupportTaskLite]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[TaskAssignedGroups]    Script Date: 28/09/2020 11:38:28 AM ******/
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
/****** Object:  Table [dbo].[TopMenu]    Script Date: 28/09/2020 11:38:28 AM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202006012210018_InitialCreate', N'ZenExpresso.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC5DA44ED206DD5CB0CE16455F16B4443BC24A942A51A983A25FD6877E527FA14389BAF1A28BADD84EB1C02222876786C321391C0EFDEFDFFF8CDFAD7CCF78C451EC0664621E8D0E4D03133B705CB29C98095D7CFBC67CF7F6CB2FC6178EBF327EC9E94E181DB424F1C47CA0343CB5ACD87EC03E8A47BE6B47411C2CE8C80E7C0B3981757C78F8BD75746461803001CB30C61F12425D1FA71FF0390D888D439A20EF3A70B017F372A899A5A8C60DF2711C221B4FCCDF30B95885118EE36094519BC699E722906486BD85692042028A28C879FA31C6331A0564390BA10079F74F2106BA05F262CCE53F2DC9BB76E5F09875C52A1BE6507612D3C0EF097874C2756389CDD7D2B059E80EB477015AA64FACD7A90627E69583D3A20F81070A10199E4EBD88114FCCEB82C5591CDE603ACA1B8E32C8CB08E0FE08A2CFA32AE281D1B9DD41614BC7A343F6EFC098261E4D223C2138A111F20E8CBB64EEB9F6CFF8E93EF88CC9E4E468BE3879F3EA35724E5E7F874F5E557B0A7D05BA5A0114DD45418823900D2F8AFE9B86556F67890D8B6695369956C096605A98C6355ABDC764491F60C21CBF318D4B77859DBC841BD747E2C22C8246344AE0F326F13C34F770516F35F264FF37703D7EF57A10AE37E8D15DA6432FF0878913C1BCFA80BDB4367E70C36C7AD5C6FB1327BB8C029F7DD7ED2BABFD340B92C8669D09B424F7285A625A976E6C95C6DBC9A419D4F0669DA3EEBF69334965F35692B20EAD33137216DB9E0DB9BCCFCBB7B3C59D85210C5E6A5A4C234D06276F5623A1F58151A1294DE7A8ABE910E8D2FF7925BCF091EB0DB01476E0025EC8C28D7C5CF4F287000C0F91DE32DFA1388695C0F909C50F0DA2C39F03883EC376128181CE28F2C367E776F710107C93F87366F7DBE335D8D0DCFF115C229B06D10561AD36C67B1FD89F83845E10E71C51FC91DA3920FBBC77FDEE0083887366DBB08E5C823163671A80939D035E117A72DC1B8E2D50BB7645A61E727DB52F222CA59F72D2D21F5153483E89864CE5973489FA3E58BAA49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCD34B476878572F85DD7F5F6FB3CD5BB71654D438831512FF88098E601973EE10A53822E50874593776E12CA4C3C7983EFBDE9472FA0579C9D0ACD69A0DE92230FC6C4861F77F36A46242F1A3EB30AFA4C301282706F84EF4EAB355FB9C1324DBF674A87573DBCCB7B306E8A6CB199CA66C379D058AD0170F5CD4E5071FCE688F6264BD112321D0313074976D7950027D3345A3BA25E7D8C3141B6776161A9CA2D8468EAC46E890D343B07C475508564644EAC27D23F1044BC7116B84D821288699EA122A4F0B97D86E88BC562D092D3B6E61ACEF050FB1E61C87983086AD9AE8C25C1D006102147C844169D3D0D8AA585CB3216ABC56DD98B7B9B0E5B84B7189ADD8648BEFACB14BEEBF3D8B61366B6C0BC6D9AC922E02688379BB30507E56E96A00E2C165DF0C543831690C94BB545B31D0BAC67660A07595BC3803CD8EA85DC75F38AFEE9B79D60FCADBDFD61BD5B503DBACE963CF4C33F33DA10D85163892CDF37CCE2AF18A2A0E6720273F9FC5DCD5154D8481CF30AD876C4A7F57E9875ACD20A21135019686D602CAAF0125206942F5102E8FE5354AC7BD881EB079DCAD1196AFFD026CC50664ECEA756885507F692A1A67A7D347D1B3C21A2423EF7458A8E0280C425CBCEA1DEFA0145D5C56564C175FB88F375CE9181F8C0605B578AE1A25E59D195C4BB969B66B49E590F571C936D292E03E69B4947766702D711B6D5792C229E8E1166CA4A2FA163ED064CB231DC56E53D48DAD2C4B8A178C2D4D3AD5F81A85A14B9695F42A5E62CCB2DCAAE9B7B3FE49477E8661D9B122F7A890B6E04483082DB1500BAC41D24B378AE939A2688E589C67EAF81299726FD52CFF39CBEAF6290F62BE0FE4D4ECEFAC85E2F2BEB6D7CACE08C7B8841EFACCA349C3E88AF157373758BA1BF250A488DC4F032FF189DEC1D2B7CEEEEFAAEDB31219616C09F24B0E94A42DC9CDADABBED3C0C89362A0412AFC97F5074A0FA15377EE7D5615AEF348F5287980AA8AA20B5AED6CE0748E4CAFC1127DC4FE63D58AF03CF38A27A6540178514F8C4A6E830456A9EB8E5A4F3FA962D66BBA230A39265548A1AA8794D54C929A90D58AB5F0341A555374E720E78E54D1E5DAEEC88A2C922AB4A27A0D6C85CC625D775445A249155851DD1DBBCC3A1117D13DDEB9B42797B5B7AEEC70BBD9DEA5C1789E157198ADAF72875F05AA14F7C4E2B7F412182FDF4B6BD29EF0D6B6A62CA6B199356930F42B4FEDF6BBBEF0345ED9EB316B57DAB5C5BDE94A5F8FD7CF669FD532A4039E4852702F0E7AC2816ECC0F57ED8F68A4D35646621AB91A61637F8A29F6478C6034FBDD9B7A2E66CB784E708D88BBC031CDD238CCE3C3A363E11DCEFEBC89B1E2D8F1148753DDC398FA986D21238B3CA2C87E40919C1FB1C1BB9112540A3D5F1107AF26E69F69ABD3348AC1FE4A8B0F8CABF823717F4FA0E23E4AB0F1979CEF394C1E7DF3216B4F5F3D74D7EAD5AF9FB2A607C66D0433E6D4381474B9CE08D7DF42F492266BBA81346BBF9078B913AAF6FC40892A4C88F55F1BCC5D3AC84B835CCAAF7CB4FABAAF68CAD7041B212A5E0C0C8537880A752F02D6C1D2BE0670E093A6AF01FA7556FD3A601DD1B42F035CD21F4C7C17D07D19CA5BEE70AB519C89B6B124A57A6ECDABDE28C972D77B93947EBDD1449753AC7BC06D9046BD8665BCB00CE4C176474582F160D8BB34ED67CF2ADE9744E232C563B7F9C3DB4C196EB816FA5F650AEF416E9B225767F7F9C0DBB6355D1C77CF932AFB65FDEE99B1F10CAEDDE7F66EDBD87461DE3D37B65E19BC7B666BBBDA3F776C699DB7D09DE7E3CAA9459AFB18552CB82DDF360B9CC3097F1E8011641E65F64C529DE0D5949CDAC2B024D133D56796898CA58923F195289AD9F6EB2BDFF01B3BCB699AD96AF2319B78F3F5BF9137A769E6ADC972DC45A6B032CF5095BDDDB28E352541BDA4CCE05A4F5A12D1DB7CD6C6CBF59794083C88526AB3477347FC72F27E0751C99053A7479EAF7CDD0B7B67E5971561FF8EDD6509C17E679160BBB66B1634576411E49BB720514E224468AE31450E6CA967117517C8A650CD62CCE93BEF346EC76E3AE6D8B922B7090D130A5DC6FEDCAB05BC9813D0C43F4D66AECB3CBE0DD39F2C19A20B20A6CB62F3B7E487C4F59C42EE4B454C4803C1BC0B1ED1656349596477F95420DD04A42310575FE114DD633FF4002CBE2533F488D7910DCCEF3D5E22FBA98C00EA40DA07A2AEF6F1B98B9611F2638E51B6874FB061C75FBDFD0F59D0D32560540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2d38ffc1-75b8-4883-9ddd-d95597138488', N'jkunmi@gmail.com', 0, N'AMoy+ngE4HbCWB5f2zUAV64lADIW0ZyD+0S3FxHMblYm8nyHJCNk0wxo52Hd2X759w==', N'1073c2d0-d0a9-4af5-8167-49370a03d6c6', NULL, 0, 0, NULL, 1, 0, N'jkunmi@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'66597366-bdd1-440b-89d5-6a34d5b14940', N'penroseakoto@yahoo.com', 0, N'AKbpt6BrKuWiRfvNl7z9EQrVO9QdJ4sHhcenA4DeqD4p07HfqKkeNtsZzSTuurPenA==', N'fdefaa29-7206-411e-b1c8-d1e16899ea32', NULL, 0, 0, NULL, 1, 0, N'penroseakoto@yahoo.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f632f35a-92fb-4f99-aff1-eb0e27b2d920', N'brudexgh@gmail.com', 0, N'ADQfY61rglCeYN4L6eahAANhfapD/Mi4dJztSiY+V5OSEX5j8TOVvnz6UcKPWpDVMA==', N'7bd1cb5c-0709-437e-b8aa-d5978eff409e', NULL, 0, 0, NULL, 1, 0, N'brudexgh@gmail.com')
SET IDENTITY_INSERT [dbo].[DataSource] ON 

INSERT [dbo].[DataSource] ([Id], [dataSourceName], [dataSourceLabel], [useRawConnectingString], [connectionString], [serverIp], [serverPort], [defaultDatabase], [dataProvider]) VALUES (1, N'nla590', N'NLA ussd', 0, NULL, N'localhost', N'1433', N'NLAUssdDb', N'sqlServer')
SET IDENTITY_INSERT [dbo].[DataSource] OFF
SET IDENTITY_INSERT [dbo].[DedicatedAdmin] ON 

INSERT [dbo].[DedicatedAdmin] ([id], [userName], [fullName]) VALUES (1, N'brudexgh@gmail.com', N'Nana Safo')
SET IDENTITY_INSERT [dbo].[DedicatedAdmin] OFF
SET IDENTITY_INSERT [dbo].[TaskAssignedGroups] ON 

INSERT [dbo].[TaskAssignedGroups] ([id], [taskId], [assginedGroups], [createdBy], [createdAt]) VALUES (1, 1, N'[
  {
    "groupType": "SingleUser",
    "groupName": "jkunmi@gmail.com"
  }
]', N'brudexgh@gmail.com', CAST(0x0000ABDE00E1D366 AS DateTime))
SET IDENTITY_INSERT [dbo].[TaskAssignedGroups] OFF
SET IDENTITY_INSERT [dbo].[TopMenu] ON 

INSERT [dbo].[TopMenu] ([id], [menuName]) VALUES (1, N'NLA590')
SET IDENTITY_INSERT [dbo].[TopMenu] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 28/09/2020 11:38:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [ZenExpresso] SET  READ_WRITE 
GO
