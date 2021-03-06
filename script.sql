USE [master]
GO
/****** Object:  Database [DB_Jarvis]    Script Date: 12/12/2018 8:58:49 PM ******/
CREATE DATABASE [DB_Jarvis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Jarvis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_Jarvis.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_Jarvis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_Jarvis_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_Jarvis] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Jarvis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Jarvis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Jarvis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Jarvis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Jarvis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Jarvis] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Jarvis] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_Jarvis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Jarvis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Jarvis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Jarvis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Jarvis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Jarvis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Jarvis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Jarvis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Jarvis] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Jarvis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Jarvis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Jarvis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Jarvis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Jarvis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Jarvis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Jarvis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Jarvis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Jarvis] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Jarvis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Jarvis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Jarvis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Jarvis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_Jarvis] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_Jarvis]
GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 12/12/2018 8:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEquipment](
	[equipId] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[weight] [float] NOT NULL,
	[description] [nvarchar](500) NULL,
	[owner] [varchar](50) NULL,
	[isActive] [bit] NOT NULL,
	[img] [nvarchar](50) NULL,
	[submitTime] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMember]    Script Date: 12/12/2018 8:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMember](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[heroname] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[birthdate] [date] NOT NULL,
	[quote] [nvarchar](500) NULL,
	[joinDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
	[role] [varchar](20) NOT NULL,
	[avatar] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMission]    Script Date: 12/12/2018 8:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMission](
	[missionId] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[place] [nvarchar](100) NOT NULL,
	[beginTime] [varchar](50) NOT NULL,
	[endTime] [varchar](50) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[isActive] [bit] NOT NULL,
	[report] [nvarchar](50) NULL,
	[attachment] [nvarchar](50) NULL,
	[submitTime] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[missionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMissionDetail]    Script Date: 12/12/2018 8:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMissionDetail](
	[username] [varchar](50) NOT NULL,
	[missionId] [varchar](50) NOT NULL,
	[equipId] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'1', N'Mark 44', 100.01100158691406, N'', N'ironman', 0, N'1.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'2', N'Mark 55', 120.05000305175781, N'Hihihi ??', N'ironman', 0, N'2.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'3', N'Mark 69', 120.05000305175781, N'Hihihi WTH', N'ironman', 0, N'3.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018102140308', N'Mark 47', 8, N'None', N'ironman', 1, N'EQ-1472018102140308.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018102340207', N'Dancing with Happy Pola', 0.0099999997764825821, N'', N'qqqqqqq', 0, N'EQ-1472018102340207.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018102442373', N'Mark 45', 90, N'', N'ironman', 1, N'EQ-1472018102442373.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018102552824', N't7777', 0, N'', N'qqqqqqq', 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018103917636', N'Dancing with Happy Pola', 6, N'', N'test123', 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018104025231', N'Mark 43', 120, N'', N'ironman', 1, N'EQ-1472018104025231.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018104154494', N'Dancing with Happy Pola', 0, N'', N'qqqqqqq', 0, N'EQ-1472018104154494.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-147201893916157', N'Mark 44', 210, N'', N'ironman', 0, N'EQ-147201893916157.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1472018940531', N'Storm Breaker', 21, N'', N'thor', 0, N'EQ-1472018940531.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-147201894415636', N'Captain Shield', 57, N'', N'captain', 1, N'EQ-147201894415636.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-14720189589505', N't7777', 0, N'', N'qqqqqqq', 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018144021872', N'Iron Spider', 58, N'Artwork of titles that stand alone (e.g. Fantastic Four, X-Men, Iron-Man, Hulk, Thor) should contain at least one character of the Spider-man Universe.', N'spider', 0, N'EQ-1572018144021872.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018202844334', N'Mark 44', 120, N'', N'ironman', 1, N'EQ-1572018202844334.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018204827121', N'Mark 58', 90, N'', N'ironman', 1, N'EQ-1572018204827121.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018204930827', N'War Machine', 89, N'', N'ironman', 1, N'EQ-1572018204930827.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018205018916', N'Mark 53', 60, N'', N'ironman', 1, N'EQ-1572018205018916.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018205050179', N'Mark 46', 200, N'', N'ironman', 1, N'EQ-1572018205050179.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-1572018205122810', N'Mark 70', 130, N'', N'ironman', 1, N'EQ-1572018205122810.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-237201814347878', N'Iron Spider', 120, N'', N'spider', 1, N'EQ-237201814347878.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-237201815110264', N'Test Weapon', 122, N'', N'thanhpc', 1, N'EQ-237201815110264.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-2372018151139475', N'Test Weapon 2', 12, N'', N'thanhpc', 1, N'EQ-2372018151139475.jpg', NULL)
INSERT [dbo].[tblEquipment] ([equipId], [name], [weight], [description], [owner], [isActive], [img], [submitTime]) VALUES (N'EQ-2482018133158221', N'Time Stone', 800, N'', N'doctor', 1, NULL, NULL)
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'antman', N'123456', N'Henry', N'Jonathan', N'Ant Man', N'Male', CAST(N'1990-07-18' AS Date), NULL, CAST(N'2018-07-15' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'asssssss', N'111111', N'2', N'2', N'1', N'Male', CAST(N'2000-05-09' AS Date), NULL, CAST(N'2018-07-08' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'asssssss1', N'111111', N'111', N'111', N'Dr. Strange', N'Female', CAST(N'1900-01-01' AS Date), NULL, CAST(N'2018-07-15' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'blackwidow', N'123', N'Natasha', N'Alianovna', N'Black Widow', N'Female', CAST(N'1998-01-05' AS Date), NULL, CAST(N'2018-06-19' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'captain', N'123', N'Steven', N'Roger', N'Captain America', N'Male', CAST(N'1997-12-28' AS Date), NULL, CAST(N'2018-06-19' AS Date), 1, N'Member', N'captain.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'cobemuadong', N'123', N'Wanda', N'Maximoff', N'Scrarlet Witch', N'Female', CAST(N'1899-12-28' AS Date), NULL, CAST(N'2018-07-14' AS Date), 1, N'Member', N'cobemuadong_jarvis.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'datlp', N'111111', N'Phat ', N'Dat 09', N'Supper Man', N'Male', CAST(N'2003-06-07' AS Date), NULL, CAST(N'2018-07-15' AS Date), 1, N'Member', N'datlp_jarvis.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'doctor', N'123456', N'Doctor', N'Strange', N'Dr. Strange', N'Male', CAST(N'1986-06-18' AS Date), NULL, CAST(N'2018-07-14' AS Date), 1, N'Member', N'doctor_jarvis.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'hahaa', N'111111', N'2', N'2', N'1', N'Male', CAST(N'2000-05-09' AS Date), NULL, CAST(N'2018-07-08' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'hehehehe', N'123', N'Tes1', N'Nha', N'1', N'Male', CAST(N'2000-05-07' AS Date), NULL, CAST(N'2018-07-08' AS Date), 0, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'hulk', N'123', N'Bruce', N'Banner', N'Hulk', N'Male', CAST(N'1998-01-02' AS Date), NULL, CAST(N'2018-06-19' AS Date), 1, N'Member', N'hulk.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'ironman', N'111', N'Tony', N'Stark', N'Iron Man', N'Male', CAST(N'1998-01-04' AS Date), NULL, CAST(N'2018-06-19' AS Date), 1, N'Member', N'ironman.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'jarvis', N'111', N'Jarvis', N'Edwin', N'Jarvis', N'Male', CAST(N'1998-09-05' AS Date), NULL, CAST(N'2018-06-14' AS Date), 1, N'Admin', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'qqqqqqq', N'qqqqqqq', N'Taylor', N'Swift', N'aa', N'Female', CAST(N'2000-05-05' AS Date), NULL, CAST(N'2018-07-08' AS Date), 0, N'Member', N'qqqqqqq.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'spider', N'123456', N'Peter', N'Parker', N'Spider Man', N'Male', CAST(N'1942-10-15' AS Date), NULL, CAST(N'2018-07-15' AS Date), 1, N'Member', N'spider_spider.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'test123', N'111111', N'Treeee', N'Pewww', N'Master of Dancing and Singing', N'Female', CAST(N'1998-05-12' AS Date), NULL, CAST(N'2018-06-26' AS Date), 1, N'Member', N'test123.jpg')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'thanhpc', N'111111', N'Thanh', N'Pham Cong', N'Master of Web', N'Male', CAST(N'2018-06-05' AS Date), NULL, CAST(N'2018-07-23' AS Date), 1, N'Member', N'default.png')
INSERT [dbo].[tblMember] ([username], [password], [firstname], [lastname], [heroname], [gender], [birthdate], [quote], [joinDate], [isActive], [role], [avatar]) VALUES (N'thor', N'123', N'Thor', N'Odinson', N'Thunder God Really', N'Male', CAST(N'1997-12-28' AS Date), NULL, CAST(N'2018-06-19' AS Date), 1, N'Member', N'thor_thor.jpg')
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'1', N'Infinity War', N'NoDescription', N'HCM City', N'2018-10-7', N'28-07-2018', N'Success', 0, N'report_1_thor.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'117201891026632', N'Github', N'This is Description', N'Bangkok', N'11-7-2018', N'05-06-2020', N'In Progress', 1, NULL, NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'11720189188375', N'Github', N'This is Description so long long long', N'Bangkok', N'11-7-2018', N'19-07-2018', N'In Progress', 0, NULL, NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'117201892222438', N'Time Stone', N'Immediately run to the left and cover behind the girder against the wall, shoot the guys on the stairs to your left, run up the stairs and kill everyone from the slightly higher vantage point. then run back down the stairs and go to the stairs in the back. Watch for the fuckers on the ceiling.', N'Tokyo', N'11-7-2018', N'16-01-2030', N'Failed', 1, N'report_117201892222438_hulk.txt', N'attachment_Time Stone.txt', NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'117201892453281', N'Stealing Infinity Stone', N'None', N'Hokkaido', N'11-7-2018', N'15-10-2025', N'Failed', 1, N'report_117201892453281_hulk.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'127201816284448', N'Hard Mission', N'None', N'Saharah', N'12-7-2018', N'20-09-2018', N'In Progress', 0, NULL, NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'12720181916481', N'Dancing with Thanos', N'None', N'Bangkok', N'12-7-2018', N'07-05-2019', N'Success', 1, N'report_12720181916481_captain.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'1272018191757141', N'Dancing with Happy Pola', N'None', N'Bangkok', N'12-7-2018', N'28-07-2018', N'In Progress', 1, NULL, NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'147201817328900', N'Saving people in the Jupiter', N'Thermal is the key. get yourself at least one player with a heavy sniper mk2 equipped with thermal, and take it slow. Clear each wave of enemies before you move up, and you should be good.', N'Jupiter', N'14-7-2018', N'12-09-2018', N'In Progress', 0, N'report_147201817328900_ironman.txt', NULL, N'15-7-2018 12:57')
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'2', N'Civil War', N'', N'2', N'2', N'28-07-2018', N'Failed', 0, N'report_2_ironman.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'3', N'Last Mission', N'3', N'3', N'3', N'07-07-2018', N'Failed', 0, NULL, N'attachment_null.txt', NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-157201801058744', N'Dancing with Happy Pola', N'', N'Bangkok', N'15-7-2018', N'27-07-2018', N'Success', 1, N'report_MS-157201801058744_captain.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-1572018092999', N'Run with pig', N'High-school senior Peter Parker lives with his Aunt May and Uncle Ben, and is a school outcast. On a school field trip, he visits a genetics laboratory with his friend Harry Osborn and love interest Mary Jane Watson. There, Peter is bitten by a genetically engineered "super spider."', N'New York', N'15-7-2018', N'25-07-2018', N'In Progress', 0, NULL, NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-157201812737946', N'Hardcore Mission', N'Really hard', N'Saharah', N'15-7-2018', N'31-07-2018', N'Success', 1, N'report_MS-157201812737946_ironman.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-157201819442891', N'Stealing Power Stone', N'', N'Northern Earth', N'15-7-2018', N'21-07-2018', N'Failed', 1, N'report_MS-157201819442891_ironman.txt', N'attachment_Stealing Power Stone.txt', NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-2372018135924853', N'Get Ready', N'', N'Saharah', N'23-7-2018', N'24-07-2018', N'In Progress', 1, N'report_MS-2372018135924853_spider.txt', N'attachment_Get Reasy.txt', N'23-7-2018 14:1')
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-237201814218845', N'Dancing with Happy Pola', N'', N'Saharah', N'23-7-2018', N'25-07-2018', N'In Progress', 1, NULL, N'attachment_Dancing with Happy Pola.txt', NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-2372018151258339', N'Mission 1', N'', N'Bangkok', N'23-7-2018', N'25-07-2018', N'In Progress', 1, N'report_MS-2372018151258339_thanhpc.txt', NULL, NULL)
INSERT [dbo].[tblMission] ([missionId], [name], [description], [place], [beginTime], [endTime], [status], [isActive], [report], [attachment], [submitTime]) VALUES (N'MS-2372018151452680', N'Mission 2', N'', N'Hokkaido', N'23-7-2018', N'27-07-2018', N'In Progress', 1, NULL, NULL, NULL)
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thor', N'1', N'1', N'Deleted')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thor', N'147201817328900', N'EQ-1472018940531', N'Deleted')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'3', N'3', N'Deleted')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'MS-157201801058744', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'hulk', N'117201892222438', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'test123', N'117201892453281', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thor', N'MS-157201801058744', N'EQ-1472018940531', N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'12720181916481', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'captain', N'12720181916481', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'117201892222438', N'EQ-1572018202844334', N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'cobemuadong', N'MS-157201812737946', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'147201817328900', N'EQ-1472018104025231', N'Deleted')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'doctor', N'MS-157201801058744', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'captain', N'MS-157201801058744', N'EQ-147201894415636', N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'hulk', N'117201892453281', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'antman', N'MS-157201819442891', NULL, N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'MS-157201819442891', N'EQ-1472018102442373', N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'MS-157201812737946', N'EQ-1572018205050179', N'Checked')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'spider', N'MS-2372018135924853', NULL, N'Done')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thor', N'MS-237201814218845', NULL, N'Doing')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'ironman', N'MS-2372018151258339', NULL, N'Done')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thanhpc', N'MS-2372018151258339', N'EQ-237201815110264', N'Done')
INSERT [dbo].[tblMissionDetail] ([username], [missionId], [equipId], [status]) VALUES (N'thanhpc', N'MS-2372018151452680', N'EQ-2372018151139475', N'Doing')
ALTER TABLE [dbo].[tblEquipment]  WITH CHECK ADD FOREIGN KEY([owner])
REFERENCES [dbo].[tblMember] ([username])
GO
ALTER TABLE [dbo].[tblMissionDetail]  WITH CHECK ADD FOREIGN KEY([missionId])
REFERENCES [dbo].[tblMission] ([missionId])
GO
ALTER TABLE [dbo].[tblMissionDetail]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[tblMember] ([username])
GO
USE [master]
GO
ALTER DATABASE [DB_Jarvis] SET  READ_WRITE 
GO
