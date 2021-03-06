
/****** Object:  ForeignKey [FK_TSTEmployees_TSTDepartments]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTEmployees]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTEmployees]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTEmployees1]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTEmployees1]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTRequestStatuses]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTRequestStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTRequestStatuses]
GO
/****** Object:  Table [dbo].[TSTRequests]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTEmployees1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTRequestStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] DROP CONSTRAINT [FK_TSTRequests_TSTRequestStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTRequests]') AND type in (N'U'))
DROP TABLE [dbo].[TSTRequests]
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployees]
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 11/07/2013 20:44:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
DROP TABLE [dbo].[TSTDepartments]
GO
/****** Object:  Table [dbo].[TSTRequestStatuses]    Script Date: 11/07/2013 20:44:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTRequestStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTRequestStatuses]
GO
/****** Object:  Table [dbo].[TSTRequestStatuses]    Script Date: 11/07/2013 20:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTRequestStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTRequestStatuses](
	[RequestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RequestStatusDescription] [nvarchar](50) NOT NULL,
	[RequestStatusNotes] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTRequestStatuses] PRIMARY KEY CLUSTERED 
(
	[RequestStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TSTRequestStatuses] ON
INSERT [dbo].[TSTRequestStatuses] ([RequestStatusID], [RequestStatusDescription], [RequestStatusNotes]) VALUES (1, N'Submitted', N'Request is in the queue but has not been pulled for work by a tech.')
INSERT [dbo].[TSTRequestStatuses] ([RequestStatusID], [RequestStatusDescription], [RequestStatusNotes]) VALUES (2, N'Assigned', N'Tech has pulled the request but has not begun actively working said request.')
INSERT [dbo].[TSTRequestStatuses] ([RequestStatusID], [RequestStatusDescription], [RequestStatusNotes]) VALUES (3, N'Working', N'Tech is working the request')
INSERT [dbo].[TSTRequestStatuses] ([RequestStatusID], [RequestStatusDescription], [RequestStatusNotes]) VALUES (4, N'Closed', N'The issue has been resolved')
SET IDENTITY_INSERT [dbo].[TSTRequestStatuses] OFF
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 11/07/2013 20:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTDepartments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTDepartments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TSTDepartments] ON
INSERT [dbo].[TSTDepartments] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (1, N'Finance', N'Corporate Finance and Accounting and whatnot')
INSERT [dbo].[TSTDepartments] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (2, N'Human Resources', N'Human Resources')
INSERT [dbo].[TSTDepartments] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (3, N'Marketing', N'Sales, Marketing, and Service')
INSERT [dbo].[TSTDepartments] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (4, N'Facilities', N'Physical facilities maintenance')
INSERT [dbo].[TSTDepartments] ([DepartmentID], [DepartmentName], [DepartmentDescription]) VALUES (5, N'IT', N'Information Technology')
SET IDENTITY_INSERT [dbo].[TSTDepartments] OFF
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 11/07/2013 20:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[FName] [nvarchar](25) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NULL,
	[HireDate] [datetime] NULL,
	[Notes] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[EmpDepartmentID] [int] NOT NULL,
	[Location] [nvarchar](50) NULL,
	[EmployeeImage] [nvarchar](150) NULL,
 CONSTRAINT [PK_TSTEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TSTEmployees] ON
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (1, N'VP of Finance', N'Gordon', N'Gecko', N'8885551000', N'ggecko@wallstreet.com', CAST(0x00007D7800000000 AS DateTime), NULL, 1, 1, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (2, N'Analyst II', N'Lex', N'Luthor', N'8885551001', N'lluthor@superman.com', CAST(0x000070A500000000 AS DateTime), NULL, 1, 1, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (3, N'Analyst', N'Doctor', N'Evil', N'8885551002', N'devil@austinpowers.com', CAST(0x00008ADE00000000 AS DateTime), NULL, 1, 1, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (4, N'Bond Trader', N'Hans', N'Gruber', N'8885551003', N'hgruber@diehard.com', CAST(0x00007E5800000000 AS DateTime), NULL, 0, 1, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (5, N'Predictive Analysis', N'Darth', N'Vader', N'8885551004', N'dvader@starwars.com', CAST(0x00006E6C00000000 AS DateTime), N'Null', 1, 1, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (6, N'VP of HR', N'Sacha', N'Cohen', N'8885551005', N'scohen@borat.com', CAST(0x000089B000000000 AS DateTime), NULL, 1, 2, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (7, N'Director', N'Will', N'Ferrell', N'8885551006', N'wferrell@snl.com', CAST(0x0000888800000000 AS DateTime), NULL, 1, 2, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (8, N'Analyst', N'Louie', N'CK', N'8885551007', N'louieck@luckylouie.com', CAST(0x000097DD00000000 AS DateTime), NULL, 1, 2, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (9, N'Recruiter', N'Andrew', N'Clay', N'8885551008', N'aclay@andrewdiceclay.com', CAST(0x0000726300000000 AS DateTime), NULL, 1, 2, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (10, N'Intern', N'Judd', N'Apatow', N'8885551009', N'japatow@producer.com', CAST(0x0000951F00000000 AS DateTime), NULL, 1, 2, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (11, N'VP of Selling Things', N'John', N'Williamson', N'8885551010', N'jwilliamson@glengarryglenross.com', CAST(0x0000777200000000 AS DateTime), NULL, 1, 3, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (12, N'Sales Representative', N'Richard', N'Roma', N'8885551011', N'rroma@glengarryglenross.com', CAST(0x0000777200000000 AS DateTime), NULL, 1, 3, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (13, N'Sales Representative', N'Shelly', N'Levene', N'8885551012', N'slevene@glengarryglenross.com', CAST(0x0000777200000000 AS DateTime), NULL, 1, 3, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (14, N'Sales Rep', N'George', N'Aaronow', N'8885551013', N'gaaronow@glengarryglenross.com', CAST(0x0000777200000000 AS DateTime), NULL, 1, 3, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (15, N'Sales Representative', N'Dave', N'Moss', N'8885551014', N'dmoss@glengarryglenross.com', CAST(0x0000777200000000 AS DateTime), NULL, 1, 3, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (16, N'Janitor', N'Joe', N'Dirt', N'8885551015', N'jdirt@joedirt.com', CAST(0x0000907E00000000 AS DateTime), NULL, 1, 4, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (17, N'Security', N'John', N'McClane', N'8885551016', N'jmcclane@diehard.com', CAST(0x00007E5800000000 AS DateTime), NULL, 1, 4, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (18, N'Procurement Manager', N'Jean', N'Valjean', N'8885551017', N'jvaljean@lesmiserables.com', CAST(0xFFFFC9C900000000 AS DateTime), NULL, 1, 4, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (19, N'Maintenance', N'Kesuke', N'Miyagi', N'8885551018', N'kmiyagi@karatekid.com', CAST(0x0000788500000000 AS DateTime), NULL, 1, 4, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (21, N'VP of IT', N'Bill', N'Lumberg', N'8885551020', N'blumberg@officespace.com', CAST(0x00008D7000000000 AS DateTime), NULL, 1, 5, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (22, N'Tech', N'Peter', N'Gibbons', N'8885551021', N'pgibbons@officespace.com', CAST(0x00008D7000000000 AS DateTime), NULL, 1, 5, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (23, N'Tech', N'Samir', N'Nagheenanajar', N'8885551022', N'sNagheenanajar@officespace.com', CAST(0x00008D7000000000 AS DateTime), NULL, 1, 5, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (24, N'Tech', N'Michael', N'Bolton', N'8885551023', N'mbolton@officespace.com', CAST(0x00008D7000000000 AS DateTime), NULL, 1, 5, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (26, N'Tech', N'Bob', N'Porter', N'8885551024', N'bporter@officespace.com', CAST(0x00008D7000000000 AS DateTime), NULL, 1, 5, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (27, N'Operations Support', N'Somebody', N'Else', N'8885551019', N'selse@idontknowyet.com', CAST(0x0000A26800000000 AS DateTime), NULL, 0, 4, NULL, N'NoImage.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (28, N'boss', N'Mike', N'Wieners', N'8885559999', N'mike@mike.mike', CAST(0x0000A26C00000000 AS DateTime), NULL, 0, 1, NULL, N'~/EmployeeImages/NoImage.jpg')
SET IDENTITY_INSERT [dbo].[TSTEmployees] OFF
/****** Object:  Table [dbo].[TSTRequests]    Script Date: 11/07/2013 20:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTRequests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NULL,
	[RequesterNotes] [nvarchar](max) NOT NULL,
	[TechNotes] [nvarchar](max) NULL,
	[RequestStatusID] [int] NOT NULL,
	[RequesterID] [int] NOT NULL,
	[TechID] [int] NULL,
 CONSTRAINT [PK_TSTRequests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TSTRequests] ON
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (1, CAST(0x0000A1D400000000 AS DateTime), CAST(0x0000A26E01823BB5 AS DateTime), N'My puter is brokded', N'I fixded it', 4, 1, 22)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (2, CAST(0x0000A1D600000000 AS DateTime), CAST(0x0000A1D700000000 AS DateTime), N'Mines brokded, too', N'She fixed now', 4, 2, 23)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (3, CAST(0x0000A1D800000000 AS DateTime), CAST(0x0000A1D900000000 AS DateTime), N'Don''t work no mo''', N'Now it do', 4, 3, 24)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (4, CAST(0x0000A1DA00000000 AS DateTime), CAST(0x0000A1DB00000000 AS DateTime), N'Suntins wrong', N'Nuh uh', 4, 4, 26)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (5, CAST(0x0000A1DC00000000 AS DateTime), NULL, N'Wont turn on', N'11/7/2013 8:36:54 PM - pgibbons</br>Do it work?</br></br>11/7/2013 8:14:50 PM - pgibbons</br>System.Web.UI.WebControls.TextBox</br></br>11/7/2013 8:14:40 PM - pgibbons</br>System.Web.UI.WebControls.TextBox</br></br>11/7/2013 8:13:03 PM - pgibbons</br>System.Web.UI.WebControls.TextBox</br></br>', 3, 5, 23)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (6, CAST(0x0000A1DE00000000 AS DateTime), NULL, N'Screen is fuzzy', N'Snuggling with it didn''t help', 3, 6, 23)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (7, CAST(0x0000A26B00000000 AS DateTime), NULL, N'Ruh roh', N'Looks like Scooby is submitting requests again', 2, 7, 24)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (8, CAST(0x0000A26B00000000 AS DateTime), NULL, N'This crap don''t work!', NULL, 1, 8, NULL)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (9, CAST(0x0000A26C00000000 AS DateTime), NULL, N'Sonofa!', NULL, 1, 9, NULL)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (11, CAST(0x0000A26D015E0F49 AS DateTime), NULL, N'puter brokeded', NULL, 1, 5, NULL)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (12, CAST(0x0000A26D0168B656 AS DateTime), NULL, N'Don''t work no mo', NULL, 1, 19, NULL)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (13, CAST(0x0000A26E0146ED0D AS DateTime), NULL, N'no worky', NULL, 1, 17, NULL)
INSERT [dbo].[TSTRequests] ([RequestID], [RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (14, CAST(0x0000A26E014706DA AS DateTime), NULL, N'no worky', NULL, 1, 17, NULL)
SET IDENTITY_INSERT [dbo].[TSTRequests] OFF
/****** Object:  ForeignKey [FK_TSTEmployees_TSTDepartments]    Script Date: 11/07/2013 20:44:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTDepartments] FOREIGN KEY([EmpDepartmentID])
REFERENCES [dbo].[TSTDepartments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTEmployees]    Script Date: 11/07/2013 20:44:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests]  WITH CHECK ADD  CONSTRAINT [FK_TSTRequests_TSTEmployees] FOREIGN KEY([RequesterID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] CHECK CONSTRAINT [FK_TSTRequests_TSTEmployees]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTEmployees1]    Script Date: 11/07/2013 20:44:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests]  WITH CHECK ADD  CONSTRAINT [FK_TSTRequests_TSTEmployees1] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] CHECK CONSTRAINT [FK_TSTRequests_TSTEmployees1]
GO
/****** Object:  ForeignKey [FK_TSTRequests_TSTRequestStatuses]    Script Date: 11/07/2013 20:44:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTRequestStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests]  WITH CHECK ADD  CONSTRAINT [FK_TSTRequests_TSTRequestStatuses] FOREIGN KEY([RequestStatusID])
REFERENCES [dbo].[TSTRequestStatuses] ([RequestStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTRequests_TSTRequestStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTRequests]'))
ALTER TABLE [dbo].[TSTRequests] CHECK CONSTRAINT [FK_TSTRequests_TSTRequestStatuses]
GO
