USE [aspnet-Apache-201506140251234516]
GO
/****** Object:  DatabaseRole [System.Activities.DurableInstancing.InstanceStoreObservers]    Script Date: 2016/3/26 11:13:26 ******/
CREATE ROLE [System.Activities.DurableInstancing.InstanceStoreObservers]
GO
/****** Object:  DatabaseRole [System.Activities.DurableInstancing.InstanceStoreUsers]    Script Date: 2016/3/26 11:13:26 ******/
CREATE ROLE [System.Activities.DurableInstancing.InstanceStoreUsers]
GO
/****** Object:  DatabaseRole [System.Activities.DurableInstancing.WorkflowActivationUsers]    Script Date: 2016/3/26 11:13:27 ******/
CREATE ROLE [System.Activities.DurableInstancing.WorkflowActivationUsers]
GO
/****** Object:  Schema [System.Activities.DurableInstancing]    Script Date: 2016/3/26 11:13:27 ******/
CREATE SCHEMA [System.Activities.DurableInstancing]
GO
/****** Object:  UserDefinedFunction [System.Activities.DurableInstancing].[GetExpirationTime]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [System.Activities.DurableInstancing].[GetExpirationTime] (@offsetInMilliseconds bigint)
returns datetime
as
begin

	if (@offsetInMilliseconds is null)
	begin
		return null
	end

	declare @hourInMillisecond bigint
	declare @offsetInHours bigint
	declare @remainingOffsetInMilliseconds bigint
	declare @expirationTimer datetime

	set @hourInMillisecond = 60*60*1000
	set @offsetInHours = @offsetInMilliseconds / @hourInMillisecond
	set @remainingOffsetInMilliseconds = @offsetInMilliseconds % @hourInMillisecond

	set @expirationTimer = getutcdate()
	set @expirationTimer = dateadd (hour, @offsetInHours, @expirationTimer)
	set @expirationTimer = dateadd (millisecond,@remainingOffsetInMilliseconds, @expirationTimer)

	return @expirationTimer

end

GO
/****** Object:  UserDefinedFunction [System.Activities.DurableInstancing].[ParseBinaryPropertyValue]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [System.Activities.DurableInstancing].[ParseBinaryPropertyValue] (@startPosition int, @length int, @concatenatedKeyProperties varbinary(max))
returns varbinary(max)
as
begin
	if (@length > 0)
		return substring(@concatenatedKeyProperties, @startPosition + 1, @length)
	return null
end

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2016/3/26 11:13:27 ******/
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
/****** Object:  Table [dbo].[ApplicationRoleMenus]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoleMenus](
	[ApplicationRole_Id] [nvarchar](128) NOT NULL,
	[Menu_ID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationRoleMenus] PRIMARY KEY CLUSTERED 
(
	[ApplicationRole_Id] ASC,
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateRoleTime] [datetime] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2016/3/26 11:13:27 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2016/3/26 11:13:27 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2016/3/26 11:13:27 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[TrueName] [nvarchar](max) NOT NULL,
	[Job] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[OrganizationID] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[DataDicts]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataDicts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataDictName] [nvarchar](max) NOT NULL,
	[DataDictCode] [nvarchar](max) NULL,
	[DataDictType] [nvarchar](max) NULL,
	[DataDictNote] [nvarchar](max) NULL,
	[parentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DataDicts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItServiceItems]    Script Date: 2016/3/26 11:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItServiceItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[isitype] [nvarchar](max) NULL,
	[sub_isitype] [nvarchar](max) NULL,
	[end_isitype] [nvarchar](max) NULL,
	[drafter] [nvarchar](max) NULL,
	[applicant] [nvarchar](max) NULL,
	[applicantPhone] [nvarchar](max) NULL,
	[applicant_dept] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[solution] [nvarchar](max) NULL,
	[DealwithpeopleName] [nvarchar](max) NULL,
	[ItManagerOpinion] [nvarchar](max) NULL,
	[ProcessingDepartmentOpinion] [nvarchar](max) NULL,
	[DealwithpeopleOpinion] [nvarchar](max) NULL,
	[isiCreateDate] [datetime] NOT NULL,
	[isiCompleteDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.ItServiceItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [uniqueidentifier] NOT NULL,
	[logTime] [datetime] NULL,
	[logUser] [nvarchar](max) NULL,
	[logUserIp] [nvarchar](max) NULL,
	[logController] [nvarchar](max) NULL,
	[logAction] [nvarchar](max) NULL,
	[logPram] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Logs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[menuName] [nvarchar](max) NOT NULL,
	[menuType] [nvarchar](max) NOT NULL,
	[menuController] [nvarchar](max) NULL,
	[menuAction] [nvarchar](max) NULL,
	[menuOrder] [int] NOT NULL,
	[menuNote] [nvarchar](max) NULL,
	[menuIcon] [nvarchar](max) NULL,
	[isMenu] [nvarchar](max) NULL,
	[isSysMenu] [nvarchar](max) NULL,
	[parentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orgName] [nvarchar](max) NOT NULL,
	[orgShortName] [nvarchar](max) NULL,
	[orgCode] [nvarchar](max) NULL,
	[orgType] [nvarchar](max) NULL,
	[orgNote] [nvarchar](max) NULL,
	[temp_id] [nvarchar](max) NULL,
	[temp_pid] [nvarchar](max) NULL,
	[parentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Organizations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkFlowItems]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlowItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WfInstanceId] [uniqueidentifier] NOT NULL,
	[WfType] [nvarchar](max) NULL,
	[WfBusinessId] [int] NOT NULL,
	[WfBussinessUrl] [nvarchar](max) NULL,
	[WfCurrentUser] [nvarchar](max) NULL,
	[WfDrafter] [nvarchar](max) NULL,
	[Wfstatus] [nvarchar](max) NULL,
	[WfCreateDate] [datetime] NOT NULL,
	[WfCompleteDate] [datetime] NULL,
	[WfFlowChart] [nvarchar](max) NULL,
	[WfWriteField] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.WorkFlowItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [System.Activities.DurableInstancing].[DefinitionIdentityTable]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[DefinitionIdentityTable](
	[SurrogateIdentityId] [bigint] IDENTITY(1,1) NOT NULL,
	[DefinitionIdentityHash] [uniqueidentifier] NOT NULL,
	[DefinitionIdentityAnyRevisionHash] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Package] [nvarchar](max) NULL,
	[Build] [bigint] NULL,
	[Major] [bigint] NULL,
	[Minor] [bigint] NULL,
	[Revision] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [System.Activities.DurableInstancing].[IdentityOwnerTable]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[IdentityOwnerTable](
	[SurrogateIdentityId] [bigint] NOT NULL,
	[SurrogateLockOwnerId] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [System.Activities.DurableInstancing].[InstanceMetadataChangesTable]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[InstanceMetadataChangesTable](
	[SurrogateInstanceId] [bigint] NOT NULL,
	[ChangeTime] [bigint] IDENTITY(1,1) NOT NULL,
	[EncodingOption] [tinyint] NOT NULL,
	[Change] [varbinary](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable]    Script Date: 2016/3/26 11:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable](
	[SurrogateInstanceId] [bigint] NOT NULL,
	[PromotionName] [nvarchar](400) NOT NULL,
	[Value1] [sql_variant] NULL,
	[Value2] [sql_variant] NULL,
	[Value3] [sql_variant] NULL,
	[Value4] [sql_variant] NULL,
	[Value5] [sql_variant] NULL,
	[Value6] [sql_variant] NULL,
	[Value7] [sql_variant] NULL,
	[Value8] [sql_variant] NULL,
	[Value9] [sql_variant] NULL,
	[Value10] [sql_variant] NULL,
	[Value11] [sql_variant] NULL,
	[Value12] [sql_variant] NULL,
	[Value13] [sql_variant] NULL,
	[Value14] [sql_variant] NULL,
	[Value15] [sql_variant] NULL,
	[Value16] [sql_variant] NULL,
	[Value17] [sql_variant] NULL,
	[Value18] [sql_variant] NULL,
	[Value19] [sql_variant] NULL,
	[Value20] [sql_variant] NULL,
	[Value21] [sql_variant] NULL,
	[Value22] [sql_variant] NULL,
	[Value23] [sql_variant] NULL,
	[Value24] [sql_variant] NULL,
	[Value25] [sql_variant] NULL,
	[Value26] [sql_variant] NULL,
	[Value27] [sql_variant] NULL,
	[Value28] [sql_variant] NULL,
	[Value29] [sql_variant] NULL,
	[Value30] [sql_variant] NULL,
	[Value31] [sql_variant] NULL,
	[Value32] [sql_variant] NULL,
	[Value33] [varbinary](max) NULL,
	[Value34] [varbinary](max) NULL,
	[Value35] [varbinary](max) NULL,
	[Value36] [varbinary](max) NULL,
	[Value37] [varbinary](max) NULL,
	[Value38] [varbinary](max) NULL,
	[Value39] [varbinary](max) NULL,
	[Value40] [varbinary](max) NULL,
	[Value41] [varbinary](max) NULL,
	[Value42] [varbinary](max) NULL,
	[Value43] [varbinary](max) NULL,
	[Value44] [varbinary](max) NULL,
	[Value45] [varbinary](max) NULL,
	[Value46] [varbinary](max) NULL,
	[Value47] [varbinary](max) NULL,
	[Value48] [varbinary](max) NULL,
	[Value49] [varbinary](max) NULL,
	[Value50] [varbinary](max) NULL,
	[Value51] [varbinary](max) NULL,
	[Value52] [varbinary](max) NULL,
	[Value53] [varbinary](max) NULL,
	[Value54] [varbinary](max) NULL,
	[Value55] [varbinary](max) NULL,
	[Value56] [varbinary](max) NULL,
	[Value57] [varbinary](max) NULL,
	[Value58] [varbinary](max) NULL,
	[Value59] [varbinary](max) NULL,
	[Value60] [varbinary](max) NULL,
	[Value61] [varbinary](max) NULL,
	[Value62] [varbinary](max) NULL,
	[Value63] [varbinary](max) NULL,
	[Value64] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [System.Activities.DurableInstancing].[InstancesTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[InstancesTable](
	[Id] [uniqueidentifier] NOT NULL,
	[SurrogateInstanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[SurrogateLockOwnerId] [bigint] NULL,
	[PrimitiveDataProperties] [varbinary](max) NULL,
	[ComplexDataProperties] [varbinary](max) NULL,
	[WriteOnlyPrimitiveDataProperties] [varbinary](max) NULL,
	[WriteOnlyComplexDataProperties] [varbinary](max) NULL,
	[MetadataProperties] [varbinary](max) NULL,
	[DataEncodingOption] [tinyint] NULL,
	[MetadataEncodingOption] [tinyint] NULL,
	[Version] [bigint] NOT NULL,
	[PendingTimer] [datetime] NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[WorkflowHostType] [uniqueidentifier] NULL,
	[ServiceDeploymentId] [bigint] NULL,
	[SuspensionExceptionName] [nvarchar](450) NULL,
	[SuspensionReason] [nvarchar](max) NULL,
	[BlockingBookmarks] [nvarchar](max) NULL,
	[LastMachineRunOn] [nvarchar](450) NULL,
	[ExecutionStatus] [nvarchar](450) NULL,
	[IsInitialized] [bit] NULL,
	[IsSuspended] [bit] NULL,
	[IsReadyToRun] [bit] NULL,
	[IsCompleted] [bit] NULL,
	[SurrogateIdentityId] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [System.Activities.DurableInstancing].[KeysTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[KeysTable](
	[Id] [uniqueidentifier] NOT NULL,
	[SurrogateKeyId] [bigint] IDENTITY(1,1) NOT NULL,
	[SurrogateInstanceId] [bigint] NULL,
	[EncodingOption] [tinyint] NULL,
	[Properties] [varbinary](max) NULL,
	[IsAssociated] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [System.Activities.DurableInstancing].[LockOwnersTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[LockOwnersTable](
	[Id] [uniqueidentifier] NOT NULL,
	[SurrogateLockOwnerId] [bigint] IDENTITY(1,1) NOT NULL,
	[LockExpiration] [datetime] NOT NULL,
	[WorkflowHostType] [uniqueidentifier] NULL,
	[MachineName] [nvarchar](128) NOT NULL,
	[EnqueueCommand] [bit] NOT NULL,
	[DeletesInstanceOnCompletion] [bit] NOT NULL,
	[PrimitiveLockOwnerData] [varbinary](max) NULL,
	[ComplexLockOwnerData] [varbinary](max) NULL,
	[WriteOnlyPrimitiveLockOwnerData] [varbinary](max) NULL,
	[WriteOnlyComplexLockOwnerData] [varbinary](max) NULL,
	[EncodingOption] [tinyint] NULL,
	[WorkflowIdentityFilter] [tinyint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [System.Activities.DurableInstancing].[RunnableInstancesTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[RunnableInstancesTable](
	[SurrogateInstanceId] [bigint] NOT NULL,
	[WorkflowHostType] [uniqueidentifier] NULL,
	[ServiceDeploymentId] [bigint] NULL,
	[RunnableTime] [datetime] NOT NULL,
	[SurrogateIdentityId] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [System.Activities.DurableInstancing].[ServiceDeploymentsTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[ServiceDeploymentsTable](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceDeploymentHash] [uniqueidentifier] NOT NULL,
	[SiteName] [nvarchar](max) NOT NULL,
	[RelativeServicePath] [nvarchar](max) NOT NULL,
	[RelativeApplicationPath] [nvarchar](max) NOT NULL,
	[ServiceName] [nvarchar](max) NOT NULL,
	[ServiceNamespace] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [System.Activities.DurableInstancing].[SqlWorkflowInstanceStoreVersionTable]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System.Activities.DurableInstancing].[SqlWorkflowInstanceStoreVersionTable](
	[Major] [bigint] NULL,
	[Minor] [bigint] NULL,
	[Build] [bigint] NULL,
	[Revision] [bigint] NULL,
	[LastUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [System.Activities.DurableInstancing].[InstancePromotedProperties]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [System.Activities.DurableInstancing].[InstancePromotedProperties] with schemabinding as
      select [InstancesTable].[Id] as [InstanceId],
			 [InstancesTable].[DataEncodingOption] as [EncodingOption],
			 [PromotionName],
			 [Value1],
			 [Value2],
			 [Value3],
			 [Value4],
			 [Value5],
			 [Value6],
			 [Value7],
			 [Value8],
			 [Value9],
			 [Value10],
			 [Value11],
			 [Value12],
			 [Value13],
			 [Value14],
			 [Value15],
			 [Value16],
			 [Value17],
			 [Value18],
			 [Value19],
			 [Value20],
			 [Value21],
			 [Value22],
			 [Value23],
			 [Value24],
			 [Value25],
			 [Value26],
			 [Value27],
			 [Value28],
			 [Value29],
			 [Value30],
			 [Value31],
			 [Value32],
			 [Value33],
			 [Value34],
			 [Value35],
			 [Value36],
			 [Value37],
			 [Value38],
			 [Value39],
			 [Value40],
			 [Value41],
			 [Value42],
			 [Value43],
			 [Value44],
			 [Value45],
			 [Value46],
			 [Value47],
			 [Value48],
			 [Value49],
			 [Value50],
			 [Value51],
			 [Value52],
			 [Value53],
			 [Value54],
			 [Value55],
			 [Value56],
			 [Value57],
			 [Value58],
			 [Value59],
			 [Value60],
			 [Value61],
			 [Value62],
			 [Value63],
			 [Value64]
    from [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable]
    join [System.Activities.DurableInstancing].[InstancesTable]
    on [InstancePromotedPropertiesTable].[SurrogateInstanceId] = [InstancesTable].[SurrogateInstanceId]

GO
/****** Object:  View [System.Activities.DurableInstancing].[Instances]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [System.Activities.DurableInstancing].[Instances] as
      select [InstancesTable].[Id] as [InstanceId],
             [PendingTimer],
             [CreationTime],
             [LastUpdated] as [LastUpdatedTime],
             [InstancesTable].[ServiceDeploymentId],
             [SuspensionExceptionName],
             [SuspensionReason],
             [BlockingBookmarks] as [ActiveBookmarks],
             case when [LockOwnersTable].[LockExpiration] > getutcdate()
				then [LockOwnersTable].[MachineName]
				else null
				end as [CurrentMachine],
             [LastMachineRunOn] as [LastMachine],
             [ExecutionStatus],
             [IsInitialized],
             [IsSuspended],
             [IsCompleted],
             [InstancesTable].[DataEncodingOption] as [EncodingOption],
             [PrimitiveDataProperties] as [ReadWritePrimitiveDataProperties],
             [WriteOnlyPrimitiveDataProperties],
             [ComplexDataProperties] as [ReadWriteComplexDataProperties],
             [WriteOnlyComplexDataProperties],
             [Name] as [IdentityName],
             [Package] as [IdentityPackage],
             [Build],
             [Major],
             [Minor],
             [Revision]
      from [System.Activities.DurableInstancing].[InstancesTable]
      left outer join [System.Activities.DurableInstancing].[LockOwnersTable]
      on [InstancesTable].[SurrogateLockOwnerId] = [LockOwnersTable].[SurrogateLockOwnerId]
      join [System.Activities.DurableInstancing].[DefinitionIdentityTable]
      on [InstancesTable].[SurrogateIdentityId] = [DefinitionIdentityTable].[SurrogateIdentityId]

GO
/****** Object:  View [System.Activities.DurableInstancing].[ServiceDeployments]    Script Date: 2016/3/26 11:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [System.Activities.DurableInstancing].[ServiceDeployments] as
      select [Id] as [ServiceDeploymentId],
             [SiteName],
             [RelativeServicePath],
             [RelativeApplicationPath],
             [ServiceName],
             [ServiceNamespace]
      from [System.Activities.DurableInstancing].[ServiceDeploymentsTable]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201507300234104_Initial', N'Apache.ApplicationDbContexMigration.Configuration', 0x1F8B0800000000000400ED5D596F1CB9117E0F90FFD098A7DD40ABD1111B8E20ED421E59BB9358073CF2226F02A79B336AB8AFEDC32B25C82FCB437E52FE4248F6C5B39BEC6B4646E0076BD8E45764B1485615C9E27FFFFD9FF39F9E7DCFFA0AE3C40D838BD9F1E1D1CC82811D3A6EB0BD9865E9E68777B39F7EFCE31FCE3F38FEB3F56B99EF14E7432583E462F694A6D1D97C9ED84FD007C9A1EFDA7198849BF4D00EFD3970C2F9C9D1D15FE6C7C77388206608CBB2CE3F6541EAFA90FC403F176160C328CD8077133AD04B8A74F4654550AD5BE0C3240236BC985DA2FF9EE0619E71665D7A2E409558416F33B340108429485115CF3E277095C661B05D452801780F2F1144F936C04B6051F5B33ABB6E2B8E4E702BE675C112CACE9234F40D018F4F0BB6CCF9E29D983BABD88618F70131387DC1AD26CCBB985D81145CB9763AB37862670B2FC61939DE1E96250EAC3CFDA0EA7F2426F8DF81B5C8BC348BE14500B33406DE81759FAD3DD7FE1B7C7908BFC0E022C83C8FAE16AA18FAC624A0A4FB388C609CBE7C829BA2B2CBAB993567CBCDF9825531AA4CDE8C65909E9ECCAC5B441CAC3D58F53AD5E4551AC6F06718C018A4D0B907690A63D4694B0712BE09D4395A256BF0AF922A1237346866D60D78FE08836DFA7431437FCEAC6BF7193A654A5193CF818BC6182A94C61994D4548FFA02410C405D8F18263319B1DB301D9F580462D4DB4BA74D6C6894F3793DB01A87DBC770AB3FD250E65737C87ECE5CC75872BD70FBE0D643067537CC7FB71643F3793CBA44147496D11494D0A2871628CF9BA65D9776BEAE8C4FE93E06FEC074B447DD0D0C32FD618773BFBA7137FEE2E623B6EC6661C394075A673A509E70406272138D484CEA2E76EA46E92C730AA1986255C68496F6048C71937CB6189DCCEA651A4A5DF41984720BBEBA5B32717078975184A63BF2E553E841646C7D821EF9993CB9516E731D72991E714B51CEEB38F4F16F0125CFF0F800E22D44B6C843D8946B1566B1DD752DE020F59705AE60DF15C27A0F1258743DE658390D934A356BC330B163379A649A58C4102D16B84E5A0A9A52688AFE1F4E524A19689694529E3A494AD92358F76B13959BCA02BF4CA25B9856DD7998C35E23ED07FE1EC65F0E79D4034BBB6C2D6A27BAA2767ABCDE9CBE7BF31638A76FFF0C4FDF74514C88EEEBF07D2DCD8A1B24666DD7634A124A693E3E7937C6FA5ED6775CBADA1277176F41E0FEA3F0F5E84E4C74A9FFEBAD02AD30DEEE466D4584574F613C9437A895D8247E1F446712970FEEB529F4CA14FAD1A3DB34050C48279A80D088EA1E9EA55B17719CE9919DC8A46BB990AF49F913330FA503E60EA40E3A202EB88BD9B6C3EABA8B95F50115DACDB4FBD7703DFA20BB09D7AE37FEE474FF1406F036F3D713F81E3EF8C0F51AA89CBC793B00157A0CB72B016D58BDDD17A4D18B30D8B8B10FAB51F23E44F30F088CD1EE4192203DDDF905244FA3F7D70ADA598CA6B5550AFCF11DD394240EC6AE87DFC36B6023E5EE43804BF5C6FB18DA5FC22CFD1038D83EFD9CDAA6FB0915C020D5B9B46D9824D748C0A0B308B320ED27AA78BD699950758768675D60E101D7D7D300CAACEAB53FCFD164C8D3D964967C53553F865B37D0AB6A99555DD53C476B558B6CA6556595A5B1B4ABB6CA4B5531DD26683902099922A7BAD224436B6DF35C83B97788900DEFDF21B0FBEFE0E9A7538E6FC1EFCA3B44BA6F126B9750FA1578D9D0A43A8D06328F0D3F1A08ECFE8F06524D94FCD525EAA586D7B3CC8CE0B5F2CB1DAAED638EABD9D4C38169E6D4C4A799038C87CBF0FB02AF634FE0B5B82176AD31AB5D66747F3F16D96AAD48FC2AA844922C26FAD0659284B64B6A25DF192D76E2D88622E3CAD2DA96AB3736850DD71B249F2E4E43B5BA98FD4960661B8DCA4F58D3C837D21B81CFE7548BB51941DB321AB5941A365256E47E47B6C6C7337EE0DD0557D08329B4F25321485100890D1C510051273B86F593B051A212B775169A12207638BB00FB511234E1B8412ACE1F6E60BB11F0B438C695D69C7F30132A3AFC972B18C100374E8B253A15506E8ACE2B5A5C0FB571AA87801616ACAE00F0E6ECBE092867472B04B4D05227115096633B10509625AF4E40198F85AE18C8DD17DAC2AAB9B034EC43D5A4588FCB888362106995B5464B66859DFC5E322BEB3F9D6AF07B047B21C1B9DF4A579E3827D6BE4DB0ACF74C31BFEA296B83082CC3AE1DCCAE0C3FF67E7295580EAA8E6F322314470FA791C806E3657A71547369025954734287B8FCC0DD2882989B91F8343C2A0163719EBC5AE38FF05976971035ACF08924854DCD4B06065FC194BBF1858CE2DA7C2DA4A2BEB228ACEF2C08529A64E5C91DAC96A2C52954A16C6E68B614E6C55606248A760B28BD2ACA005915A505ACF0370820C2F264D0D272C7AFB1A9855569005BEECE35C216B6400B6C5B5F48FB811A0D3592E2D03295B7F174333F5875BD2A5583AAB608E35ED77942411595E7676FB6E1664C61B6801BB9A274B098B858A8C61492ADC717993B84C29249F7E05C2AE5BB9D4B322BDFC4CEEFC525CE265770A96CCCE05C6267B7765EA90D4E7393B317DFA4962585C84DEB8333AE9827DA392631700C4C9C5E3C62CD1185684927BC0E0C92F9DD45EEB4E9D8BA5AB6D18CDDA0140FC4947233A0D2E2AA6FE7F33CA64691703E5704DF38BF0151E4065B2A18479162ADF2481C8B1F56E6712AFC1C636E337CE675CE8A521AC6600BB9AF8834AAE9B51B27295611D7006FD42C1C5FC826D55915AA434992574BC55E2C958AB204FEBB1C93B2F81912FDBE287A8D1AE7630B819C9BA0BA5E5DD4C23151800762C9458B45E8657EA076F1A84BB3F12C681CF68B39627E574186987F3147CCCF69C810F32F1D5A4DEE1F485B4DBEE823D667F269B43A55443A9F73B220D87782C009C6372BC15AF24D2CA6EEA28D2D2B73A996961A47A0AB4013344495688493DB471C8ECC68D2C0C19125244838D9088BBEAACEE1D19F8C30CBFBE81C5E996C8495C780E090F2C4BD19022A0B4D770C100F81F92090171B6714D4911C688C3AD50C499C78EB54332495F8F2DFCC5065024CA79BA115970E78B022D9B00F8405A64E3543CA2323F04879AA3E5219FA80C629D34C50AAC8062C5095FC0D2E9C2AEB4977D6E00FC9984F20EAF8014D0CE6592B67AA5253A22311308A12FD411F8F8F364043F2DFA4A86896705CB255420ED34AA23D30B574712D7D370088976308538B082C13FCF7DDE63B5616E89EFCFE954882B89CA896929179AA66E5FE71529056D6113DA9A8769CF7446744FFCEAAB644BA77981A42D569E58E2ECD74D52EAF1AA5DC8EA351545B743BEB33D6E5D8BDBF9A7CAC1A7DD55C7C1CCDB78A054143548946385468070E8CFA628428FA44AA44231C5121AF12CD3825A8A755A23E4E155F81C6A9120D712229506486F46A744A95DBB9834E49FC12E643B415611C65A28E1D4063D4A9FA482416000D4212F4CB97F7FC6988324D1F85B9C64F43311FF4F18AABFA345291A48FC11FB2A3C1DA0EE035A10AD6B1B165CCDFC9179A497D33E803E66E3ED309CC177D44EE023E0DC97DEA24290A0EC873188C2DE1D23D33C684AFFAC892EBF734B4E473076C499DF96FFAA8921BFA34B0E4B33E767D5D9FD728C7328C06D0E095E730BAA8F0F9519F7E3ABC02639C6567181380BA34CCB82FEA6443ACE25AB00056A4EFA520298FAA7411A4FC70573F415260A8E71BE6A62D3BDD345E0F566332D7679929BDE9FAB01ACF4C5CC7160AF6C8012B198AD3729ABED0327B83728AB3C93650F0D90A753833F1809DC835AD6986C7941FC8A5EAD2B59ACA83C15AA632C678945FA850D58D3F4A2276BD70A284CF52095E9152FDAE4E9414A739DADF78118E77E4596656398290E6F592209B909CB1385CFDE62D3C17E275BBCC7083F4DA0D4CD2FC22F4ECE4E8F8847B2B667FDE6D992789C384886B78BC85EDB409C276BA98ABAD613D3A3E60926B4839A1E02B88ED27107FE783E7EF0779124589D8F5D9934100E96097BD00F9F88FA4A7867BBC647249CB02F7B70CBA44A6362E5E72FB3D2EE220594DC96F33BE728F8DF4EA23E14191BE68E21B057D11D96708FAA2D18F7F1860993DF0F16D4C82FC331BFD2640FEE98CFE68038B9AF8E4456F38262E64FBF4A7E882A1E663FEE18A5E60ECE3143DA1B80728F675D5697818618250352557C460353D22D1D4A0C245B965E0C0E78BD93F49A93372301CFF45920FAC65F2992C876716F6865BFF1283D9982A48E25B12BDE440FE5E44D73597DBF5EED523DD9F7DE82073CAFBC1BA37384D9F4CD097A8E5DF1FF3A207169928CFAC234E8EBA4837FB9082516DF2A23D6AD3ED79856F435BE01E37E8B7BCCB1E2CE8351B708F12F4C51ACCE8E21E17E885C53D20D01F2B1A086CC425B9715FF855ADCA7C98FA7E03880A3DDFABEBD8F0F2BDA02421E47BE13161E2A5DDC0A921DDA3C21381D55840D8D2EC42D227A47C17D3411E507EED9A23C982C9F7EA3969C0F8A1646B9026AB02C277C1520683EFAA8BCA83C377A99A32307C1781E3C3C2EBAB5E65C9614C8B1E61B7275F3D46D1C4F64B1F174257F7B3EA84F0D46338F15AF66BBFC9E8CD832932F76270E6C1B07729DA5DDFF5ECEA11D6DACB158B29F656DBA54246AF039F459841A793AA79669A5951CC4025EB19AD58BA91AF88B0B0EB106832816D889BAC11E2D81A20FED9C4E1F7542737BA8FCD898343B69CCEA0FA5BE860598F7EF3B2A6DDD9C305233592B18643323B883A6A16797C0F228D4A62BD4966D989E38B4F19C6B1E9E4ABC13EC1FE4711DF33612B22002A846DC258E1530B9BEA74EC9E0B9B56447036EA1BD5B793C5E31E44FC0712B496FB96632EA1DA82FDFA6377EFD9BCA6B454A60DD13DF5ACA66D8ABCC648DCBBB63CF741BEA6B6393B09D7CEA36B8B010DF93E2DAE43F007C29BA266E7A7E62F66CE3A443D9FBB62A878DBF36612247AB6804E5265C0790CEE16CCDCDE1440F36419AA3C64310FCB0E2D019EFD2C2393BFBD260FB2A922568F1B25C13A8B9AA83ABA274F98D58504A2EC6719C1E610B43C39614914280A399A5B69C6DAC26C6CE46D91A799AC22A07313EDC28A68A45DE469A6AD0893DCC0EADA2BD3C4EE3A9794BE9851AC837EB8F32AC6AD66D473C5252BE51A29B9C9F74912A0BDDDCFD572674C5839FBC45C16DD81DAEC915FEE121C88546BE4D1D4F6891D23C7815735461E86B3D94DA5B8382A7FB0609FC3BE0FC21466AA53DCA61D9E2923457997AD90620822CD8164CAE23D8EE13E88A42827EBFA636F868C1CB3BDDB5A3316130C62B48B376791059205F87853FEEB0A26EEB686C011E7026833B6479567196CC2D204E26A546611768553E020C3E1324EDD0DB053F4199F6C228FEC1611ED3EF86BE82C83BB2C8DB2143519FA6B8F3966814DA926FA24103D5BE7F33B725F2119A209A89A2E3E117617BCCF5CCFA9EA7D2DD99A5640601BAD384784FB32C5E789B62F15D26D18680215ECAB4CCB07E8471E024BEE8215F80ABBD40D89DF47B805F64B7DEE4405D2DE112CDBCFAF5CB08D819F14187579F413C9B0E33FFFF83F40856D4F4AA40000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201507300235214_Initial', N'Apache.BusinessDataContextMigration.Configuration', 0x1F8B0800000000000400ED5ADB8EDB36107D2FD07F10F4D4021B6B77F3D22EEC041B3B1B18CD5E103BF163404B239B88442924B5B1BFAD0FFDA4FE4247D6C5A42E5EC9B285A228168BB539E499E1909CE1E1ECDF7FFE357CBBF13DE319B8A0011B9957834BD30066070E65AB911949F7D56FE6DB373FFF347CEFF81BE34BD6EF75DC0F47323132D75286379625EC35F8440C7C6AF34004AE1CD8816F1127B0AE2F2F7FB7AEAE2C400813B10C63F8296292FAB0FB825FC701B3219411F1EE03073C91B6A364B643351E880F2224368CCC5BFCB38641D2D1346E3D4AD0881978AE6910C60249249A78F359C04CF280AD662136106FBE0D01FBB9C413909A7EB3EFDE741697D7F12CACFDC00CCA8E840CFC968057AF53B758C5E14739D7CCDD868E7B8F0E96DB78D63BE78DCCA99C017FA6364C25F8A651D47833F678DCBBE0E08136ECC2488417F94EC00D13FF5C18E3C893118711834872E25D184FD1D2A3F61FB09D07DF808D58E479AA816822CAB4066C7AE241085C6E3F819B993D310D4B1F671507E6C39431C95CA64CBEBE368D07544E961EE4EBAFCC7B26030E1F800127129C272225705CBEA9033B0F96B41774CDA9F42053873B0ECF8D69DC93CD47602BB91E99F8D134EEE8069CAC2535E133A378CC7090E411549878582D15685B780AC587F58868F9B52F5DC09CDE74399CB8B8D067D743C2104F0161B23F4D4FEB809DDF81B9BAAF0E46EEF3AF17089BD330898DE7DEF38117F5A26802C4FB41E53A8420F4206E3BBBCAA9BC278CAC803F8694F53147FC6A8310083E819070E96358ED4BB7EEDFBEB462081B73C06432C1DF4C5BFC794EFDA302FD38F0D1FC3A3C75F8D0DAA7FD83978145C0BFDD79C18F76770175D4FF578192AE853B654212BCCA4E9D4CEB87883AADD77CE1CEFBC8810BF75D8407134FE7DEDE3A2F35404AA03E73AF07C3C711E7B82878C93F7F0A5FB8939E2E0B0B17B78F8C441F0E3C5D8442B0C601AA6A741C51C66B4C0D3D4C7BC1A9843B0A9E73626587232FF25B49F078F0D490ECDCA193482C838DAC88C2B8BBD3402C5295FAEC12EC19C82A86879B686F51C28F07050A681D8653A37D159A9E43AA9C914F7BCFE7AD84D067C4DFAA61FEC37BBC5FE2BA282F01698B314B9E01C6AF66ED49B29F6058B6A8E0CAB9B5B9264C0778552A4851355A7A47B990F1F22D49BC33C68E5FEA56B5C8351ECF3456AE633131EE17221B167F4E861EE0EE459CBD4BEF7096F1B56C3761C88D2A3E1994C6EF9E6788477845CE1DE31DDA677579FBD0E89450AB006953738C9C45AA287963731C8DFDAA589AA0399EC670553C4DD01C2F67B12A56DED81C4761A92A92D27C0456CA432B0153D911A829DDAC444D652DFCA7B24ACD87AAA0C57EC999A3B659F2D6E64855D450C5AC9237472FB340EDBC96A4CD910FD23D55C9C18EC7FAA952534D9756D144BD2E15628A2A6A87A9DD9A8AA89AB08C3BB40AC1BB9825AC529A2830A762F269949AF43BC1F19949BB3BB44F4C87879F272FE9EC4EC5D1256D10E7A54490B5B54151599C8EA54A5A222A6CAE84A9C8DAA06AA44D07D5446D3027551950696E8395912F1D2A6B6D35D39A70A14B5A21D6068BA2AC0DAA42BD744845D0064FA5573AA02AE9399A95D848B14BAE3D672505F6314C99C0CBC5C9123548BA9806BAEA993A312D986D0546AD41DC6130FBEE8D3D0AF1052BEB80A997BA2064F254665E5F5E5D178A9CFF9E82A32584E3B5A93AF6FEE84763D7BEF8ACD7F2C1432BF9B167C26D3C29BFF864F36BD7325E2DD891A5BA4E7815E5B84E7885925B27AC5259ED34685AE9EC34905A79AC9BFFCA25B06EFBA550E6EA04565FCAEA045B57AEEA04DAA02475425F9C12B9B2B4E4E06779C2D252155EDB07CFBA52D37F230154157A2246BF474077902E8DC35CA7A24FA76D5255D8D939E224659D8EA655946E3A224E4E98588A2598AE933DDD69AD2EB3343BAC8DCA2E1DA75A2EADB4006C573E293FC0B7288CBC5C1749EEECE8DB658053494C2ED6565AD44E5E2C9D54E92B145F8EACAE9479CBD052FFF572380141577B88F81F3119D8F1AD600F9AF5993237C8561D67AA5A9475296C8A7B90043728B9E51813892DF789D734BE102FC22EEFFD253853F618C93092B74280BFF4B442FBD03AAC7F5742D26D1E3EEE2E49E214534033697CC61ED9BB88C65B3BB5FBAE7C64EB20E2DD9A261FB46A26E324B4DAE6480FA597F03AA0D47D7869C1AB3986D039603C4030F1C866E4198EB10DA3F04758117B9BD1CF7A9097174277FB7042C98A135FA418FBF1F815F7B0E36FDEFC0315B178FE812C0000, N'6.1.3-40302')
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 1)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 1)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 42)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 42)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 43)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 43)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 44)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 44)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 45)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 45)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 46)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 46)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 47)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 47)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 48)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 48)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 49)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 49)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 50)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 50)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 51)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 51)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 52)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 52)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 53)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 53)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 54)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 54)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', 55)
INSERT [dbo].[ApplicationRoleMenus] ([ApplicationRole_Id], [Menu_ID]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', 55)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Description], [CreateRoleTime], [Discriminator]) VALUES (N'37b12aa1-82bb-43ec-833b-33f3e42acb91', N'运维管理员', NULL, CAST(N'2015-07-30T22:44:23.327' AS DateTime), N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Description], [CreateRoleTime], [Discriminator]) VALUES (N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099', N'普通用户', N'普通用户', CAST(N'2015-07-30T10:42:39.460' AS DateTime), N'ApplicationRole')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cd80af8a-696d-4880-a499-d515ca8d239d', N'37b12aa1-82bb-43ec-833b-33f3e42acb91')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'057606cc-aa74-4fbc-b4b3-161c4e20d627', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'17a2400c-9a81-4954-9204-29b37a3e6419', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b8ad6ac-17ea-4318-b433-8dcfa02f75d9', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7acd55d7-af52-474b-aa9a-2269d3dc1698', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cd80af8a-696d-4880-a499-d515ca8d239d', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0020b16-d342-4640-b702-5e43c350d72e', N'c6bf5dfd-990a-4a8e-9955-7ccab3db0099')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'057606cc-aa74-4fbc-b4b3-161c4e20d627', N'财务用户', NULL, NULL, NULL, NULL, 2, 1, 0, N'AGs6whHXkQ0aNR1ZTOYarmKehSssRlB8GE0q7y2CndreYN6wUXuqhv1LRVc5yfevUg==', N'aada3576-abf7-4a6d-9119-27a0884f8599', 0, 0, NULL, 0, 0, N'cwbyh')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'17a2400c-9a81-4954-9204-29b37a3e6419', N'运维二', NULL, NULL, NULL, NULL, 7, 2, 0, N'AH8SAZyt5BXnpRPBdXNuUHYwNDtWy9tDh1IG7UroQ/1jtVcBEnvdadoCwJYfb9hbtg==', N'dc6a8d15-9874-49e5-b191-3f875f6e6637', 0, 0, NULL, 0, 0, N'yunwei2')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4b8ad6ac-17ea-4318-b433-8dcfa02f75d9', N'科长', NULL, NULL, NULL, NULL, 7, 1, 0, N'ADx+wuEmikiQTsynSCVXsKc+94VQfb5+38F+wzwmdN6asBhrVdYv8yjHc6+8fbSqiA==', N'764167b0-e5d2-4733-ae86-565558b321bc', 0, 0, NULL, 0, 0, N'jskkz')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7acd55d7-af52-474b-aa9a-2269d3dc1698', N'运维一', NULL, NULL, NULL, NULL, 7, 2, 0, N'ACsQSYmLYbuR6+wSjQHetmBeUiU+rqONg5VuKL+S2gvZDo69P+EONNKbgb8zWtANSQ==', N'ce5c3c7a-e6f5-4ce9-a880-6c3c312f228d', 0, 0, NULL, 0, 0, N'yunwei1')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cd80af8a-696d-4880-a499-d515ca8d239d', N'信息管理员', NULL, NULL, NULL, NULL, 8, 1, 0, N'AHiFDaY16e24fY05d2ClcnG7+zImCphab3l9bLp+aIRqulnBSZV+pVx3n2Q7aG6wNA==', N'79d22f82-3799-4d00-8444-0d02aeea3898', 0, 0, NULL, 0, 0, N'itgly')
INSERT [dbo].[AspNetUsers] ([Id], [TrueName], [Job], [Mobile], [PhoneNumber], [Email], [OrganizationID], [Order], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e0020b16-d342-4640-b702-5e43c350d72e', N'管理员', NULL, NULL, NULL, NULL, 1, 1000, 0, N'AAxrFWIWbQ/DN/pgdo552s37E8wQndZhe2zKZ8dOa9sVmuQMFwpZmpgeq0WKtFZA+Q==', N'6596d0ff-feea-4780-b895-ef7568710d10', 0, 0, NULL, 0, 0, N'admin')
SET IDENTITY_INSERT [dbo].[DataDicts] ON 

INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (1, N'根字典', N'', N'根数据字典', N'', 0)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (2, N'IT服务类别', N'', N'', N'', 1)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (3, N'信息系统故障', NULL, NULL, NULL, 2)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (4, N'电脑网络故障', NULL, NULL, NULL, 2)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (5, N'OA系统故障', NULL, NULL, NULL, 3)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (6, N'电脑故障', NULL, NULL, NULL, 4)
INSERT [dbo].[DataDicts] ([ID], [DataDictName], [DataDictCode], [DataDictType], [DataDictNote], [parentId]) VALUES (7, N'网络故障', NULL, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[DataDicts] OFF
SET IDENTITY_INSERT [dbo].[ItServiceItems] ON 

INSERT [dbo].[ItServiceItems] ([ID], [Title], [isitype], [sub_isitype], [end_isitype], [drafter], [applicant], [applicantPhone], [applicant_dept], [description], [solution], [DealwithpeopleName], [ItManagerOpinion], [ProcessingDepartmentOpinion], [DealwithpeopleOpinion], [isiCreateDate], [isiCompleteDate]) VALUES (2, N'sss', N'3', N'5', NULL, N'admin', N'sss', N'sss', N'1', NULL, NULL, NULL, N'<br>s     (意见填写人:信息管理员    时间:2015/7/30 星期四 下午 10:42:49)', N'<br>x     (意见填写人:科长    时间:2015/7/30 星期四 下午 10:43:11)', NULL, CAST(N'2015-07-30T22:42:23.737' AS DateTime), CAST(N'2015-07-30T22:43:43.367' AS DateTime))
INSERT [dbo].[ItServiceItems] ([ID], [Title], [isitype], [sub_isitype], [end_isitype], [drafter], [applicant], [applicantPhone], [applicant_dept], [description], [solution], [DealwithpeopleName], [ItManagerOpinion], [ProcessingDepartmentOpinion], [DealwithpeopleOpinion], [isiCreateDate], [isiCompleteDate]) VALUES (3, N'测试', N'3', N'5', NULL, N'admin', N'康熙', N'3333333', N'2', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-07-30T23:12:20.863' AS DateTime), NULL)
INSERT [dbo].[ItServiceItems] ([ID], [Title], [isitype], [sub_isitype], [end_isitype], [drafter], [applicant], [applicantPhone], [applicant_dept], [description], [solution], [DealwithpeopleName], [ItManagerOpinion], [ProcessingDepartmentOpinion], [DealwithpeopleOpinion], [isiCreateDate], [isiCompleteDate]) VALUES (4, N'test', N'3', N'5', NULL, N'admin', N'康熙', N'3333333', N'4', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-07-31T00:19:49.943' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ItServiceItems] OFF
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ddb8e142-cbfd-489c-9d83-001775ffa48c', CAST(N'2015-08-13T10:09:00.867' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'388b0e9d-71d9-4f47-8cc1-002064664b16', CAST(N'2015-07-30T10:43:45.837' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4d841e44-1d09-4443-974e-006468e59882', CAST(N'2015-07-30T11:03:02.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'026d2447-3b4c-4554-9557-006a367ec2bc', CAST(N'2015-07-30T22:43:40.017' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c5230eb-e00b-40f9-8d40-0084aca8346a', CAST(N'2015-07-30T11:02:36.377' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd13b48b2-9d2b-4ffe-ab75-00902f09fb84', CAST(N'2015-07-30T10:42:17.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fede69c4-9527-48ad-ab8d-00a33e8fde7c', CAST(N'2015-07-30T22:21:16.917' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18d09923-c1ec-457b-b7f8-00ac2c1c3e42', CAST(N'2015-07-30T23:39:43.797' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50b50780-e598-4639-a4a9-00af2bca4889', CAST(N'2015-07-31T00:25:14.080' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6f8047f8-c458-4090-ad88-00bab0d481c7', CAST(N'2015-07-30T23:12:44.920' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9feb1b9c-91d6-45b0-b78e-00bf39754a36', CAST(N'2015-07-30T22:42:44.907' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f23b46f2-c928-46d9-be83-00d3a62784fc', CAST(N'2015-07-30T22:43:02.470' AS DateTime), N'jskkz', N'::1', N'ItService', N'OpenWorkFlow', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a971bafa-7546-4be9-a88e-00dbaf5fe02d', CAST(N'2015-07-30T22:18:19.317' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bd67a0c6-b57f-472f-a690-00f1254df50f', CAST(N'2015-07-31T00:20:23.397' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0fa2e162-32a5-4ea7-b742-0141dd585fef', CAST(N'2015-07-30T22:19:31.817' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0be3ff4-64fd-4408-8f81-014d4ad532ca', CAST(N'2015-07-30T23:14:19.810' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8abb648c-8df8-4d03-b85e-0177d591c7df', CAST(N'2015-10-14T16:08:49.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cddfaf90-5251-42a1-96e5-017ecf5da7e3', CAST(N'2015-10-14T16:05:38.877' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7b80586c-0200-484a-8147-01c37bb4759d', CAST(N'2015-07-30T22:20:54.447' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd41a5b4-4272-4781-9b89-01c5ba5ebc17', CAST(N'2015-10-14T16:04:50.000' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0df254e5-4b2f-4034-a923-01c805da5a4f', CAST(N'2015-08-13T10:00:29.920' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'06b348f5-ea56-4cf6-b440-01ea024224c2', CAST(N'2015-07-30T23:39:13.767' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad5e7036-5eab-4052-a694-020623d4a8ac', CAST(N'2015-07-30T10:42:39.427' AS DateTime), N'admin', N'::1', N'Account', N'CreateRole', N'Id=,Name=普通用户,Description=普通用户,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6e855387-eaa5-443d-9af5-028726bf758d', CAST(N'2015-08-13T10:08:06.107' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0948957f-ff71-4482-aeca-02ac9252c708', CAST(N'2015-07-31T00:20:33.830' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6d1e05c2-bdc4-4c40-bc9e-02d4be35d28b', CAST(N'2015-07-30T23:12:59.707' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0db117e9-00fd-43a3-b3eb-02f063fdea51', CAST(N'2015-07-30T22:19:51.583' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'637acaf9-81db-4e7f-98a5-0309ad60a439', CAST(N'2015-10-14T16:11:15.300' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'12170980-1b2c-48b7-8357-0331f20cb546', CAST(N'2015-07-30T23:08:59.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'df532283-2803-4988-9908-03391a9fb487', CAST(N'2015-07-30T23:12:20.967' AS DateTime), N'admin', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a9b4a7e-8138-4f34-90b7-036307d23013', CAST(N'2015-10-14T16:04:52.627' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3f36d591-c9fe-4aa5-901c-0370364ad85a', CAST(N'2015-10-14T16:06:34.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8cda723a-ba99-4d42-a48d-0371afef4075', CAST(N'2015-07-31T00:26:22.953' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ea39984-67bf-4dbf-9a81-03b3a2facaea', CAST(N'2015-07-30T23:19:20.197' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ec7f848-c575-45fc-9d60-03d02be3f59d', CAST(N'2015-07-30T23:31:01.143' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'939177ff-edfe-4102-be55-040897cf33e6', CAST(N'2015-07-31T00:19:09.347' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'777aeb5f-cfed-49a9-b753-044aea70f6bb', CAST(N'2015-07-30T22:19:04.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6608513f-d0d3-4c05-9f5d-0455389cb66f', CAST(N'2015-08-13T10:08:31.537' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'272d6c77-d0de-4374-818b-048b7675515f', CAST(N'2015-07-30T23:12:45.450' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1567bae-ac69-4989-9980-04c2c207863f', CAST(N'2015-07-30T10:43:12.687' AS DateTime), N'admin', N'::1', N'Account', N'MenusToRole', N'menu_ids=1,42,43,47,48,44,49,50,45,51,52,53,46,54,55,roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0282a34-2c0b-4706-8617-04fa333a89c9', CAST(N'2015-07-30T22:29:44.420' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1b7ae2bd-d395-4378-ad43-04fb77b6048c', CAST(N'2015-07-30T22:23:44.443' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'454b8ab2-41c5-4aea-a0c5-04fc17b0b72c', CAST(N'2015-08-13T10:08:53.407' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f26a322f-1e65-4d4c-85a0-050e3f2c13e9', CAST(N'2015-07-31T00:16:21.403' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'01e5ebce-738c-4ffe-b1f0-05433609ce58', CAST(N'2015-07-30T10:44:20.837' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6c761a28-3675-416c-8873-055737e157c4', CAST(N'2015-07-30T22:42:48.713' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'462fc0de-8798-4756-96ab-057f3ec8dd34', CAST(N'2015-07-30T23:12:47.577' AS DateTime), N'itgly', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'130d680f-7225-4f33-b132-058789a13bc4', CAST(N'2015-07-30T23:34:58.337' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cd62a2c8-171d-4c4f-b75f-058e467248b2', CAST(N'2015-10-14T16:12:59.293' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5317a65b-23f8-4219-945c-059683c1cd3e', CAST(N'2015-07-30T22:22:07.033' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0827d4e-13fa-4612-9cde-05e0fcd0b3cd', CAST(N'2015-07-30T23:38:08.637' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b95a662b-612c-48b4-b2a4-05f046394c97', CAST(N'2015-07-30T23:25:15.680' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e7286b8-2225-42f1-9268-05f0fdf1fdc6', CAST(N'2015-07-30T22:19:47.260' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a449e391-9f22-456c-867b-0630f1ec36bc', CAST(N'2015-07-30T23:08:25.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'16681b00-dc8a-4b7c-8712-0657152a6872', CAST(N'2015-07-30T10:42:28.283' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da10dd21-8352-405b-ae27-0668a5ee43ed', CAST(N'2015-07-30T22:44:57.497' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba27fab7-75c4-4e08-b331-06c5e5db3129', CAST(N'2015-08-13T10:10:06.757' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'847dace7-76e0-4f41-9019-06d01459e48a', CAST(N'2015-10-14T16:13:10.333' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'443f7035-40b4-4811-93bf-070cc1b9b06c', CAST(N'2015-07-30T10:49:49.817' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ec8f269-4f1b-4e6e-a99b-0723fbb40211', CAST(N'2015-07-30T10:51:03.640' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4707ddae-8fb3-4eec-9d4d-074f0464b895', CAST(N'2015-07-31T00:16:34.170' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd380d397-0940-4c6b-88ba-07556f6c80a6', CAST(N'2015-10-14T16:10:40.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e45b5121-cc63-421d-b109-076704d39416', CAST(N'2015-07-30T23:14:49.843' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'301260f2-ed8c-4278-a94a-07aa181e5feb', CAST(N'2015-08-13T10:12:16.797' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'03f27ef6-b906-4264-a271-07f64c9c865d', CAST(N'2015-07-31T00:19:19.360' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'84f0d737-2a61-4bee-91da-0811ea74e507', CAST(N'2015-07-30T22:43:41.067' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd524a66a-6a53-4b6e-8127-081337209eb9', CAST(N'2015-07-31T00:26:52.607' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c97623d1-3d70-450c-b347-08343ac92476', CAST(N'2015-07-30T22:42:06.040' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6d0c9774-1d92-4f2e-865e-087ccc78f7d9', CAST(N'2015-07-30T10:50:33.447' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8c19ff65-93e8-4551-af57-087e551236da', CAST(N'2015-07-30T22:33:48.820' AS DateTime), N'yunwei1', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e79d53f4-e4f2-4870-84fd-08949653fdf1', CAST(N'2015-07-30T22:36:03.203' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a4007b3-dba3-4e04-b096-08bc0fd1b136', CAST(N'2015-07-30T22:30:39.947' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'28850332-ab37-4f02-b223-08e6e3d7f1ca', CAST(N'2015-07-31T00:22:00.357' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1289f7bd-2473-42f2-b8f8-09111e281275', CAST(N'2015-10-15T11:20:31.530' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=4,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a8b8a901-6f54-41db-bb69-0937d3a73440', CAST(N'2015-10-14T16:07:29.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b470c6e0-99f6-4f09-9fc6-09498dd23666', CAST(N'2015-07-30T22:29:57.403' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f29f88e9-06c3-44ee-a3fe-098c0aa47c52', CAST(N'2015-07-31T00:24:17.547' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4d74c249-77c6-4fe2-bb35-0a34a167d1e9', CAST(N'2015-10-14T16:13:04.347' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0e64a5d-0fd5-4103-a761-0a9d03baabcf', CAST(N'2015-07-30T23:10:51.423' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e9c3964b-6d16-4386-aea5-0aaf11ed0d2c', CAST(N'2015-07-30T22:28:42.583' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'35828b0f-742b-47e9-b44b-0ad4eb24a2c6', CAST(N'2015-07-30T10:48:53.510' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'532225a3-c8ae-425b-a6cd-0b134dc7e268', CAST(N'2015-10-15T11:18:57.963' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'36387c53-951d-44ad-83b4-0b4a98a92d49', CAST(N'2015-07-30T23:21:40.360' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'623cad97-d86d-4b06-847f-0b4b7ff2460e', CAST(N'2015-08-13T10:10:05.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0971006e-2de6-4be6-b450-0b88ea05a0fb', CAST(N'2015-10-14T16:16:25.877' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd8504d8a-598c-4f97-a120-0b9fcfe9fd55', CAST(N'2015-07-30T10:44:59.500' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa07f69f-7e1c-4529-8fe5-0ba9a1ee45ef', CAST(N'2015-07-31T00:18:58.607' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4947efde-fc9c-4a3d-9464-0baeb37e7122', CAST(N'2015-08-13T10:00:41.173' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50c547bb-8d9a-4403-8620-0bc3c668eba3', CAST(N'2015-07-30T23:16:24.980' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6621ebef-b325-403e-9af2-0c02a8c8baaf', CAST(N'2015-10-14T16:11:34.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f9aa00da-469d-4b91-8ff9-0c0feed3b1b6', CAST(N'2015-08-13T10:00:29.227' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9be72d71-ae2a-4c19-8fb1-0c25f2a7e087', CAST(N'2015-07-30T23:35:38.393' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'29e7fe08-3486-40f7-af66-0c2763940e79', CAST(N'2015-07-30T10:42:12.770' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'98067746-661c-4202-a7e3-0c366d78ba0c', CAST(N'2015-07-31T00:28:17.753' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce3b94c1-8d38-4005-ab5a-0c487c4f5221', CAST(N'2015-07-30T10:49:55.497' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'08bf758e-e6b1-49a5-866f-0c98fbdfd30d', CAST(N'2015-07-31T00:23:57.543' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3c910428-6632-44fe-a24a-0c9e0e023a0c', CAST(N'2015-07-30T10:42:47.487' AS DateTime), N'admin', N'::1', N'Account', N'MenuToRoleList', N'roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c71106d2-c415-4b3a-805a-0ca696d3df57', CAST(N'2015-07-30T22:27:56.040' AS DateTime), N'admin', N'127.0.0.1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'97dcb5bc-3091-42dd-bade-0cb269df2e66', CAST(N'2015-07-30T22:20:04.040' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'766d5a38-5ab9-4b78-bb6b-0cc2f52718f7', CAST(N'2015-07-30T23:12:54.297' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPage', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c9036df9-0c29-4e0f-8338-0ce4aaa63cba', CAST(N'2015-10-15T11:18:46.743' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'40a420c0-ada5-45ca-9f66-0ce50626de85', CAST(N'2015-07-30T22:36:08.680' AS DateTime), N'yunwei1', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=完成,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e235174-ef2b-40b4-9b0e-0d0af0d64e4c', CAST(N'2015-07-30T22:33:49.117' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8855e115-33e8-4cd9-9854-0d491d89109f', CAST(N'2015-08-13T10:11:51.790' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c84da0c-5b5d-403f-8ca3-0d5272c9c01d', CAST(N'2015-07-30T23:29:51.050' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71064ef5-0b8a-495e-95a8-0d768087026d', CAST(N'2015-07-30T22:21:54.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd3ec5a28-fee9-415a-82bb-0d831589e711', CAST(N'2015-07-30T23:28:30.933' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4d2fe3f7-306d-4a4c-96a1-0d8af8179204', CAST(N'2015-10-14T16:04:52.220' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'94b3dbb9-73e6-44ef-b816-0d8dfd88636b', CAST(N'2015-07-30T10:39:48.867' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e833d811-8bac-450b-9b12-0db17aaaad79', CAST(N'2015-07-30T22:43:25.593' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c6d75224-69d9-4dfd-a493-0dbf00fff0d0', CAST(N'2015-07-31T00:19:56.600' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7957d7c7-e538-4645-bfc8-0e16a6a062ee', CAST(N'2015-10-14T16:07:04.233' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'07f44efc-3a5e-4514-99bd-0e1f2ed9dc04', CAST(N'2015-07-30T23:16:14.963' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46e6736a-a742-400e-b0c4-0e3221da2dd8', CAST(N'2015-08-13T10:00:42.717' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7e7d185-da23-4934-9d86-0e8213470c57', CAST(N'2015-07-30T10:42:19.490' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9589ac65-d8f8-47d4-95ec-0f062baf7e41', CAST(N'2015-07-30T22:44:02.603' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'90d3b5a0-e941-412d-b7e3-0f14982f6e07', CAST(N'2015-10-14T16:11:40.313' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5bde703b-8961-4366-a7f5-0f1e23ec8454', CAST(N'2015-07-30T22:45:02.527' AS DateTime), N'itgly', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0fbeea92-3069-43b4-a749-0f1ed2731d3f', CAST(N'2015-07-30T23:37:38.583' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5aca1ad5-00a8-418d-b6a0-0f283a3cfec7', CAST(N'2015-07-30T23:34:08.337' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ff4277fb-5e28-4ead-8abc-0f52a5f9cf75', CAST(N'2015-07-30T22:44:02.070' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14f749ed-b6c2-4600-8e3b-0f6b8d050390', CAST(N'2015-07-30T23:21:35.347' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b8b58ef1-0e36-4aa9-93e9-0f746be2ddfa', CAST(N'2015-08-13T10:00:33.387' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f845a83c-3456-4204-8704-0f746dcbf741', CAST(N'2015-07-30T10:41:22.357' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc2f5b7c-5aa3-4d74-a674-0f79c1034c4d', CAST(N'2015-07-30T23:09:31.350' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1f9f944-e582-475f-815e-0f91452b7cfd', CAST(N'2015-10-14T16:07:20.313' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'25f635fa-117b-4d8a-94f3-0fb8be3d1288', CAST(N'2015-07-30T10:44:21.137' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd636ee60-7fbc-49cd-8847-0fcac18298c7', CAST(N'2015-07-30T22:43:29.187' AS DateTime), N'yunwei1', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60d37309-e0b1-45d6-931c-0fd5db416bea', CAST(N'2015-10-14T16:12:09.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da0ac10f-42c7-402f-afd4-0fd8753d5d25', CAST(N'2015-07-30T22:42:19.337' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efaef012-2c5e-4349-9c53-1003e60ff8a8', CAST(N'2015-07-30T22:20:59.423' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'09730bb1-21a7-4651-8344-1027d3605f2a', CAST(N'2015-07-30T10:56:34.180' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c654531f-dd9e-4689-99d6-1034c23ec826', CAST(N'2015-07-31T00:26:22.340' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f351c6af-7a9f-4ac9-84df-106c8b9da624', CAST(N'2015-07-30T10:44:16.177' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a18d4183-b4cb-40a1-83f5-106da86efa22', CAST(N'2015-07-30T22:20:24.433' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55abca33-facd-4dc5-8c8e-10b4712579af', CAST(N'2015-07-30T22:45:02.683' AS DateTime), N'itgly', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b7ee98ae-ba9e-4994-a8de-10b4f928b7a9', CAST(N'2015-10-15T11:24:02.550' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f70fc48d-6ae9-46ed-b118-10f28b0a9114', CAST(N'2015-07-30T23:17:15.030' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'94eef1ce-4047-4629-875b-11040144a4ad', CAST(N'2015-07-31T00:17:04.227' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7cdde853-c640-4f6b-a872-110f9c5c45f2', CAST(N'2015-07-30T23:33:26.340' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59890334-2ea5-416d-a2fb-115b301e5493', CAST(N'2015-07-30T10:38:26.250' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'81bf8bc5-b4ca-4813-8321-118e570bada3', CAST(N'2015-07-30T22:33:50.413' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ec4fa32e-73fd-4433-b529-11f9f329553c', CAST(N'2015-07-30T22:19:49.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6f58a73-33c6-4151-9bdc-11fa00010adf', CAST(N'2015-10-14T16:11:59.283' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2893e8be-ab4c-4abb-b993-1238b2dc4d31', CAST(N'2015-07-30T23:12:01.490' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ff39ad40-e0e0-4fa2-9deb-126fab20b780', CAST(N'2015-10-14T16:09:20.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aec48360-e7a8-46a7-ba23-12990cd9054a', CAST(N'2015-07-30T23:28:25.930' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2bae8c6-db2d-4200-bffb-12d40ef9de63', CAST(N'2015-10-15T11:22:12.397' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ea8b08d7-ca58-4ff8-aca8-12dfa266e178', CAST(N'2015-07-30T10:38:20.767' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b3138bd0-cef8-4d24-811f-12e8b942be05', CAST(N'2015-07-30T22:21:49.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7a48cfc-b9ae-41a8-bf9d-12f4ba1709fe', CAST(N'2015-10-15T11:20:29.893' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a29ea749-3ea2-4f2d-8a17-13092c22ba7e', CAST(N'2015-07-30T10:50:35.893' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3111a88d-3513-416d-8ea7-1339ad19305c', CAST(N'2015-07-30T22:31:19.423' AS DateTime), N'jskkz', N'::1', N'ItService', N'GetPossiblePath', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'06cdcda9-0623-4651-ac84-135c5eb995f9', CAST(N'2015-07-30T22:22:09.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4d943a6f-2fc1-475c-b412-137e39b31391', CAST(N'2015-10-15T11:22:38.343' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'96d65cdd-ef83-4d3d-b4e5-138dc573ee20', CAST(N'2015-10-15T11:22:53.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0ce69aaa-ea54-4347-a20b-139930fcee4a', CAST(N'2015-07-30T22:19:09.040' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd99221b-de25-42a2-9066-139d775f346a', CAST(N'2015-07-30T23:15:30.013' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55f672ea-4a25-42af-bb0b-13ab0a463152', CAST(N'2015-07-30T10:44:09.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8a037e0-bb19-467d-b666-13d52729a1f0', CAST(N'2015-10-15T11:20:20.403' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'af5f09b0-b43a-43b7-8918-13e6fc1d6deb', CAST(N'2015-07-30T23:21:05.337' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'461d34a0-67bc-4a40-94cc-13e9735ac9a4', CAST(N'2015-07-30T23:38:23.667' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70a6f0ef-7cf9-450b-b3b1-1400387ebed8', CAST(N'2015-07-30T11:02:14.703' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e9142d0d-df8f-4b5e-a856-1411c55413b9', CAST(N'2015-07-30T22:23:04.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d788af9-ee42-40d7-ae12-142076726c4d', CAST(N'2015-08-13T10:04:42.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6475beb5-d091-497d-951c-145811e8e9bb', CAST(N'2015-07-30T10:43:36.253' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4eff4816-78d2-4044-b61a-145ae76a3558', CAST(N'2015-07-30T10:43:34.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'10e56a29-3c0f-4fae-9a0f-1461a75fdcb2', CAST(N'2015-07-30T22:43:05.287' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c5b921ae-43d4-462b-b24e-146496f5700c', CAST(N'2015-07-30T11:02:04.713' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'41b44626-e0fc-474f-a5be-14dae11dcf4d', CAST(N'2015-07-30T23:18:25.080' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a5b0a42-21ac-4340-9183-14dc042e0911', CAST(N'2015-07-30T10:41:27.307' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c5aced89-c0a8-4cd2-981a-14f0bab95122', CAST(N'2015-07-30T22:31:53.787' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85444e64-6705-46be-a410-14f12d84d7e3', CAST(N'2015-10-14T16:04:36.953' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5ca133af-39ae-4a63-8358-150cc94e4a0c', CAST(N'2015-10-14T16:11:14.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a25a81a-c1ea-48a6-a98c-15204968a8b3', CAST(N'2015-07-30T22:21:34.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e53eae01-fc37-44a4-8981-1521b450bff6', CAST(N'2015-07-30T22:19:29.407' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8d63ac76-7365-48c5-a1bd-155eab7246b2', CAST(N'2015-07-30T10:49:39.847' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9150d80c-5f92-497c-a1a3-1575e914b8c5', CAST(N'2015-07-30T10:41:37.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b7d384d-7aeb-4aa9-b5fd-15b1b89efaa4', CAST(N'2015-07-30T23:10:15.607' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31ae8f47-8581-4d7c-9f7b-15c39eae919b', CAST(N'2015-07-30T23:33:16.343' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ab9fae0-8416-4510-8202-1633e15c26a8', CAST(N'2015-07-31T00:17:11.860' AS DateTime), N'admin', N'::1', N'Account', N'MenuToRoleList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e2ad2336-0908-415a-a97b-163e0f68d757', CAST(N'2015-07-30T23:26:30.827' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83ce9df8-6db0-45e7-b0b9-1694fefc3099', CAST(N'2015-10-15T11:23:28.343' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66e56926-a9cd-4a4b-8163-169c3fd1079b', CAST(N'2015-07-31T00:23:43.960' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65f97c1c-ab55-488a-910b-16d900a85929', CAST(N'2015-07-30T22:43:00.093' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'67951c7a-bd30-4335-8645-16e26b42479d', CAST(N'2015-07-30T11:02:41.377' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'771e3b8c-eb0d-4ee6-8bfd-16e6789e63fc', CAST(N'2015-07-31T00:25:49.147' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efd9daa1-f565-4a72-87b7-16ee5a0e022f', CAST(N'2015-07-30T23:11:01.437' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46b3ea35-70a0-49b4-aa65-1717dcfe9e92', CAST(N'2015-08-13T10:00:26.640' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9aa02074-df4f-42c6-ad54-177b5ac18e76', CAST(N'2015-07-30T23:11:32.533' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d47ade5-d23f-4dae-b2b8-17a33e791201', CAST(N'2015-07-30T10:50:57.543' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91f82c3e-15cf-43af-9108-17ab4bd3dd05', CAST(N'2015-08-13T10:08:54.347' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'74038800-0b43-44ad-8ba5-17d342682aa2', CAST(N'2015-10-14T16:05:00.373' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'11334675-37b6-40a6-a9b1-17d51a17bbe2', CAST(N'2015-07-30T22:29:42.737' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4a7f208e-2be8-4b98-995e-17e17fdccf53', CAST(N'2015-07-31T00:18:27.590' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f759a751-7df5-48a5-bdee-17f69f16fa35', CAST(N'2015-07-30T10:40:32.560' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1f65512-5a7b-4bde-8a9f-184632287fd0', CAST(N'2015-10-15T11:20:19.463' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fabd5aa3-978d-43ee-a9aa-184ab7d99926', CAST(N'2015-10-14T16:06:49.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7868b02-ffde-47a9-a355-18793713af95', CAST(N'2015-10-14T16:13:00.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4cf2fc75-da8c-4629-9ac6-188a0cc85502', CAST(N'2015-07-30T22:23:34.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80b0ad27-950e-4765-9125-1897d4c2d648', CAST(N'2015-07-30T10:56:14.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0c82723-f5f0-4a83-b51c-189bb2c42feb', CAST(N'2015-10-15T11:21:18.323' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cb0977bd-fa03-4b0a-9057-18d3951677a4', CAST(N'2015-07-30T10:49:50.693' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19606efa-c30d-453b-9cf7-1910a3f63bf5', CAST(N'2015-07-30T10:38:41.087' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a37c763-5c43-4b65-9849-1913de3c7eb6', CAST(N'2015-07-30T22:43:25.107' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9372644c-c393-4d59-90db-1924af988014', CAST(N'2015-07-30T10:45:00.193' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bd83843a-4444-4cce-acad-1938a3ec46df', CAST(N'2015-07-30T22:30:40.710' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'41d13c78-39a6-4893-b629-193c2cf031f6', CAST(N'2015-10-15T11:24:02.540' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eabc84f9-caba-41e6-89dc-19751a9e0e28', CAST(N'2015-10-15T11:22:57.987' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'893a9150-7aa4-4b1f-8dd4-198446e88893', CAST(N'2015-10-15T11:22:03.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'40fa87c8-f256-40dd-9aeb-19d0ba31f912', CAST(N'2015-07-30T11:01:47.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91f2f853-5041-4b98-9b63-19d438c9051f', CAST(N'2015-07-30T23:18:30.087' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'823a1bd0-b74c-4f66-910a-19d960fb056f', CAST(N'2015-07-30T22:42:14.127' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'beb571c0-9100-41f8-b02f-19e1cb590928', CAST(N'2015-07-30T22:23:49.070' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c473d5bc-394e-4e06-a51a-19e6e49cc8b8', CAST(N'2015-07-30T10:40:02.700' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae500eab-7f76-478b-ba7a-19f20f1cff9a', CAST(N'2015-07-30T23:26:05.770' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'68a0c438-3ade-45d8-92b1-19f31cbe90e9', CAST(N'2015-08-13T10:00:29.020' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'244d1370-4c21-46b8-8995-19fcaf76badd', CAST(N'2015-07-30T22:43:07.707' AS DateTime), N'jskkz', N'::1', N'ItService', N'GetPossiblePath', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'381a3d79-afee-451c-b6cd-1a14da22b3b0', CAST(N'2015-07-30T22:42:01.910' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a9f1c9f-3966-4ff0-99ab-1a3d73bb206e', CAST(N'2015-07-31T00:26:37.577' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d3cc432-4795-4f5c-831a-1a606694099d', CAST(N'2015-07-30T23:21:10.320' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2e7e2fb9-6560-49fe-a91e-1a619ba07db3', CAST(N'2015-07-30T10:41:26.800' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3e0b1188-004b-48fc-8005-1a73cd90f70f', CAST(N'2015-10-14T16:08:44.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eaf173f2-2ec1-4225-9513-1a8f44b11102', CAST(N'2015-07-31T00:27:18.467' AS DateTime), N'itgly', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'168ede8f-f7e4-4d35-8871-1b1329c67848', CAST(N'2015-07-31T00:22:29.360' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4744fe63-ded0-4b2f-a0db-1b20c4b204ba', CAST(N'2015-07-30T23:14:24.797' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'24fb82bb-bade-4f96-b6a8-1b46977dd9df', CAST(N'2015-08-13T10:12:31.790' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'791b8e2e-7e0c-4cc8-b494-1b8071e0ddb0', CAST(N'2015-07-30T22:44:00.197' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18d53eb4-6404-42cd-800e-1b86c6cdb418', CAST(N'2015-10-14T16:08:54.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'939724da-aa1e-432f-a703-1ba4ad752d8a', CAST(N'2015-07-30T23:21:20.330' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65e2485c-3f5a-4863-b5ae-1bc450d41d04', CAST(N'2015-07-30T22:23:29.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1d96954c-5a87-4542-bc41-1bdd7e446bfc', CAST(N'2015-07-31T00:19:59.403' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e0dbea65-cca6-485a-8653-1bef03d1eabe', CAST(N'2015-10-15T11:22:17.980' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'116df701-f1be-4f30-ac6e-1c04d53400e4', CAST(N'2015-10-14T16:04:59.570' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'829a74c9-7548-4158-af85-1c35290d4852', CAST(N'2015-07-31T00:24:34.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6869473a-619b-4bb9-a71b-1c373a729862', CAST(N'2015-10-15T11:20:09.477' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd91996ba-37b1-4b3e-96f0-1c3b7446fdb6', CAST(N'2015-07-30T22:19:07.030' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b5f17d0e-8ced-4b94-af27-1c5a518574e4', CAST(N'2015-07-30T22:43:38.667' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'04dea024-9bff-4f68-8d55-1c5b0cfecac0', CAST(N'2015-07-30T23:20:00.227' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2dbb58c5-8456-4602-a9bd-1c64e12cb012', CAST(N'2015-07-30T10:39:02.117' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c5b424ba-2058-4bf8-8f9e-1c7f91c837a0', CAST(N'2015-07-30T23:22:35.460' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'64588d17-8473-4fcb-bccf-1c8f5cda1c93', CAST(N'2015-08-13T10:08:21.453' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb901166-9937-47d1-b103-1c99ba7315c4', CAST(N'2015-07-30T23:14:29.793' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'804e792c-2c90-4a1b-9987-1ca80bc80c88', CAST(N'2015-10-14T16:12:44.293' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65db8f99-d078-4b19-87d1-1cc4017d1dc5', CAST(N'2015-07-30T22:19:24.033' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'baa93674-8103-40c5-bd0d-1cea486240fb', CAST(N'2015-07-30T23:35:48.397' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c5cb19fa-33f2-493d-a4f3-1d1f34e10e82', CAST(N'2015-07-31T00:20:38.833' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19011461-f2c7-4e81-9ea3-1d6f8a4d6bfd', CAST(N'2015-07-30T23:34:38.330' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'124d6fd9-5e85-4926-8251-1d7b0aeaba99', CAST(N'2015-10-14T16:09:29.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60fb29ba-1633-4dd6-be2b-1d8a513ba448', CAST(N'2015-10-14T16:05:00.580' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d53226a-19c5-4a4f-b758-1daf0b0557c8', CAST(N'2015-07-30T23:31:16.137' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0966dc82-8453-4f0e-a825-1db4213cb8de', CAST(N'2015-07-30T22:31:57.413' AS DateTime), N'yunwei1', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=完成,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3b4ddf1-08ae-4edd-8828-1dcc24a02376', CAST(N'2015-10-15T11:21:43.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef1de527-1d92-4f0d-93e7-1dd885094653', CAST(N'2015-07-30T10:38:28.047' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7b6c6cb4-70d4-4e50-b637-1debda3d58af', CAST(N'2015-10-15T11:20:53.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd691adc6-58ed-48fa-80d7-1e2b5bb8fc1c', CAST(N'2015-07-30T22:17:47.963' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9a74d1b6-826e-4255-8ce3-1e716045d27e', CAST(N'2015-07-30T23:09:58.973' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4c8b406d-72c1-4604-9a5e-1e7faf4f4c65', CAST(N'2015-07-31T00:26:09.427' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ee609100-710e-4b3e-a14e-1ea1a089a64b', CAST(N'2015-07-31T00:19:24.377' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'11ec760e-a9d8-4e58-a40c-1ebead71373f', CAST(N'2015-07-30T10:56:54.097' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'225e5302-0e84-4331-bda7-1ec417352dec', CAST(N'2015-07-30T10:44:45.217' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a235b85-bf74-408c-9cf9-1f40a7a1afcf', CAST(N'2015-07-30T10:49:53.717' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2bd4a5ba-2289-4c34-8bf6-1f58ad2400fc', CAST(N'2015-10-15T11:22:47.980' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76186fc8-0f0a-4009-9570-1f5b635b715e', CAST(N'2015-07-30T11:03:07.370' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd695cbab-113d-4f6d-8f4d-1f81606b7377', CAST(N'2015-07-30T23:29:35.997' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b1364378-4f20-4e33-a718-1fdbd709c17f', CAST(N'2015-08-13T10:10:26.817' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66917a84-8d40-4cc1-86a4-200d7c95b5ed', CAST(N'2015-07-30T22:18:49.390' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd10164fd-ea84-4465-bfaa-20244e161d8b', CAST(N'2015-07-30T22:30:23.500' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'809c0cac-98ed-4c54-8de2-2035a5c7a3b0', CAST(N'2015-07-30T23:16:45.030' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'49ac3d4a-09ad-425f-9f93-203849eb1b58', CAST(N'2015-07-30T23:22:45.460' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ace43fd6-9efc-495a-821e-204bdc60450a', CAST(N'2015-07-30T23:16:19.980' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e558326f-4aa4-4019-987d-2098c9ffb058', CAST(N'2015-07-30T10:50:03.847' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19ac3c41-7aae-4c6c-90df-20a23a72e4aa', CAST(N'2015-07-30T22:45:01.857' AS DateTime), N'itgly', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5fc3971a-1a0d-409e-87b5-20c366710153', CAST(N'2015-07-30T10:44:18.960' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'546408f4-a493-4007-8ddf-20ec32a4cb8c', CAST(N'2015-07-31T00:24:14.010' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac0f8b51-8bf6-4727-aeb4-20ecb4128f54', CAST(N'2015-07-30T10:49:50.973' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b45a7b0c-f358-49cb-95ba-20f53ecdb253', CAST(N'2015-07-31T00:25:04.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'505f7115-371b-4eae-a28b-20f667fc9102', CAST(N'2015-07-30T22:29:45.190' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd2dd09c4-5425-4fb2-8969-20ff088d12ae', CAST(N'2015-07-31T00:26:28.077' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b910a474-b631-43e9-93d7-20ff39626611', CAST(N'2015-07-30T22:29:49.607' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efec24ce-bf81-4ac4-a5aa-21029d932c14', CAST(N'2015-07-30T22:30:22.507' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a8168ff-9207-44dd-8af5-212131441084', CAST(N'2015-07-30T22:40:31.120' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b3927ea3-5b9d-414f-b83f-2121e6d0f3b8', CAST(N'2015-07-30T23:15:14.900' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dc06fe21-5339-4c8e-8a27-212eb2847fad', CAST(N'2015-07-31T00:21:33.920' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83894885-a9bb-4c43-a39c-2138ea01152a', CAST(N'2015-07-30T22:42:18.777' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fcf2a83f-dab7-4729-a141-2147857786a9', CAST(N'2015-07-30T10:41:42.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'465b15f5-5bf1-46b6-8c14-218c99674d31', CAST(N'2015-07-30T10:44:37.613' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'24220f3a-1c37-490a-9748-21975a80f5ae', CAST(N'2015-07-30T22:33:48.397' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6e72a03-70d8-4c68-b16e-21b8ed4a30f6', CAST(N'2015-10-15T11:20:19.387' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c79f6b8-94a9-4eef-b87f-21ddccdf5b4d', CAST(N'2015-07-30T23:17:40.040' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0f134d33-cc5f-424c-bf87-21ff6ca364d1', CAST(N'2015-07-30T22:44:00.780' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c4d09cf-ac52-4c89-a2b3-224527c1778e', CAST(N'2015-08-13T10:10:05.577' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb7b7480-8619-4123-90f9-22693e6d7201', CAST(N'2015-07-30T11:01:41.453' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8c56f4d4-9c9b-4ef3-8da2-2273c0d95c97', CAST(N'2015-07-30T23:12:20.453' AS DateTime), N'admin', N'::1', N'ItService', N'DrafterToNextState', N'ID=0,Title=测试,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=康熙,applicantPhone=3333333,applicant_dept=2,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bc987e01-d1c0-459f-b224-1c33a08ea03f,NextLink=向信息中心提交申请,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f37be0d5-4a5b-4455-81dd-228b118011bf', CAST(N'2015-07-30T23:30:01.050' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27aaf848-8e59-45e8-8343-22d9d964342b', CAST(N'2015-07-30T10:44:43.620' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'417d1be4-7267-442a-9520-230d0e1b2139', CAST(N'2015-07-30T10:58:55.200' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7d6e7660-e31c-44fb-a8b3-23452e6b238b', CAST(N'2015-10-14T16:10:24.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60db19d3-3642-4296-bcbd-2374ab385fda', CAST(N'2015-07-30T22:19:49.383' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db02364c-752b-42a6-ade1-2381e5ea9dcf', CAST(N'2015-10-15T11:20:28.353' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50ea34a1-1314-4eab-9145-23f17dd59729', CAST(N'2015-08-13T10:10:04.510' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6c7c886-7af8-4b7c-8d95-24079f4cf20a', CAST(N'2015-07-30T23:38:43.687' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56664523-930f-4e6c-a9ac-241bfc0b143b', CAST(N'2015-10-15T11:21:06.860' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'63ef2987-e292-4dd6-a145-241d16cbbaf9', CAST(N'2015-07-30T23:33:48.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66a679e9-5d9c-483a-8c23-242486e577df', CAST(N'2015-07-30T22:19:39.423' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3cce86cd-4100-4c33-89f7-2440c977eee8', CAST(N'2015-07-30T10:43:44.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0f649c11-48e4-4f0c-be4d-24c122a091b6', CAST(N'2015-10-14T16:07:14.240' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a81479ab-8199-4555-9e2e-251d52f23952', CAST(N'2015-07-31T00:26:24.653' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0679c155-2de8-462f-8e5d-2520b45dc284', CAST(N'2015-07-31T00:27:06.987' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'de28db9f-5422-4445-ba05-25302acf556f', CAST(N'2015-10-14T16:07:40.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2464c4c-ae97-4e5e-afe9-25454200fc07', CAST(N'2015-08-13T10:08:03.967' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef10f0a5-d678-408e-933a-2562039730f3', CAST(N'2015-08-13T10:00:55.933' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'314fca87-5929-41e0-a38e-25895895694e', CAST(N'2015-07-30T22:20:09.407' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ce64cb1-aaef-4f8a-89cd-25897c5cd7b3', CAST(N'2015-07-30T22:42:35.720' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6e67b6bf-327e-4f7d-b66f-25a9540358d8', CAST(N'2015-07-30T22:33:48.297' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f485956c-7905-4238-b3f2-25b53e4b637a', CAST(N'2015-08-13T09:59:55.577' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5676ab61-bd9d-46af-a6ad-25b7d0119093', CAST(N'2015-08-13T10:12:41.250' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a5adf59a-2ae9-461a-b72f-25c0891da462', CAST(N'2015-07-30T23:25:40.703' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ec23542c-7851-4e56-976f-25e95175b7e8', CAST(N'2015-10-14T16:10:45.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'98c5be9e-7830-4934-8b58-25ecc1cbf55b', CAST(N'2015-07-30T22:22:29.447' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd9cbc000-96b0-424a-963f-25fc7532fbd5', CAST(N'2015-08-13T10:08:12.303' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1713380e-0621-4a5e-8ea4-2600a006311e', CAST(N'2015-07-30T10:49:53.400' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'412415b6-6133-4480-b896-260358800262', CAST(N'2015-07-30T23:28:40.937' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17d8d05a-2304-4c06-b939-26523fda56a1', CAST(N'2015-07-30T23:10:13.010' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'625bfe90-e911-46fd-813b-271744a85372', CAST(N'2015-07-30T22:43:39.937' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8503ea44-d9a4-4148-be12-272024e6dcf8', CAST(N'2015-08-13T10:08:26.453' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'29ba5c02-1412-4c9d-ab3f-2735b7f24314', CAST(N'2015-07-30T22:36:03.113' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'00b6d105-a405-415c-8658-2746f64b9441', CAST(N'2015-10-15T11:20:19.557' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0634702c-f774-4558-b6ef-2754d3b5737b', CAST(N'2015-07-30T23:23:05.513' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'238849f2-aca8-4d0c-8212-275c15f0d2d8', CAST(N'2015-07-30T22:33:48.907' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'adff67f3-aa6f-4f04-b5dc-2765e069c9de', CAST(N'2015-10-14T16:07:34.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65c00aa1-e438-4902-813c-27692395ad1b', CAST(N'2015-07-30T10:40:37.537' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'648ab238-8ca0-4490-9f14-279d781abf64', CAST(N'2015-07-30T10:38:18.680' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc6ca630-66c7-4659-a08b-27ba2fc0527d', CAST(N'2015-07-30T23:17:35.057' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62e86b14-24b5-4747-98ba-27bb49ce92a0', CAST(N'2015-07-30T22:40:34.437' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6d3ae864-f061-45af-a66b-27c726ec5e97', CAST(N'2015-07-30T10:49:13.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7f58dbcd-3f69-4b8b-b1aa-27ce315966fa', CAST(N'2015-07-30T22:21:14.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f9b85d4d-2f32-415e-99ba-27f6e2db1ef5', CAST(N'2015-10-14T16:05:59.233' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83a024ac-aac9-46ec-82b9-282fadc8b403', CAST(N'2015-07-30T22:45:07.767' AS DateTime), N'itgly', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'64dbd582-141e-4ed0-aff1-283950dc2f1d', CAST(N'2015-07-30T22:36:06.260' AS DateTime), N'yunwei1', N'::1', N'ItService', N'GetPossiblePath', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba841b31-84c7-4ac3-b606-283b39db45f6', CAST(N'2015-10-15T11:19:34.003' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'517ac630-d252-4a43-ba09-285759e4d796', CAST(N'2015-07-30T23:09:59.433' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd0a3a4d8-5460-4943-a1ec-2879a34df636', CAST(N'2015-07-30T23:09:11.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1b92bc6-59cd-48a0-9f8b-289b0d65ed09', CAST(N'2015-07-31T00:16:48.267' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c57cf041-b814-48ef-929e-28d7ce7816da', CAST(N'2015-10-14T16:12:40.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'68d273c6-3c3f-421e-9821-28f665478128', CAST(N'2015-07-30T23:20:55.310' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5b37ac29-4be9-4301-adb2-28f756e465c9', CAST(N'2015-07-30T23:35:58.390' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0410e853-501b-4d66-8fda-290e098dd664', CAST(N'2015-10-14T16:12:10.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0ba125ed-f8aa-4ac5-ba55-2950a235a040', CAST(N'2015-07-30T22:22:04.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46578e40-7631-48b3-843c-296b9e220915', CAST(N'2015-07-30T23:26:15.770' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59ed6011-6967-403b-924c-297d9361d97b', CAST(N'2015-07-30T23:16:35.010' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'89236c10-8a2d-41a0-b9ee-2980c536f88e', CAST(N'2015-08-13T10:11:36.250' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd8674c3-4aaf-4933-9027-298f43c44ad1', CAST(N'2015-07-30T23:00:09.917' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'265e4f76-4803-488d-9c0a-29b6645b8d98', CAST(N'2015-07-30T10:48:52.157' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'007f446f-bf97-4b93-99cd-29bc1cdea28a', CAST(N'2015-07-30T22:42:33.333' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70e52851-ede5-40d1-bdfe-29e3a69e441d', CAST(N'2015-10-15T11:22:08.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4577a410-6cdb-44fb-816a-29fd74e7841f', CAST(N'2015-10-14T16:05:39.853' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8722cf04-1cc3-49cf-9081-2a2f41083875', CAST(N'2015-07-30T23:29:26.000' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'691680f9-9682-4cb5-975f-2a3b3e7f0589', CAST(N'2015-07-30T23:22:50.470' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'43dbfae9-9e8d-4d6b-a445-2a5fd412df76', CAST(N'2015-07-30T23:26:35.797' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eb6c4b56-1d6d-4b71-b3b0-2a7a5574cdfa', CAST(N'2015-07-30T10:41:41.187' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b510b154-475a-41d3-aa33-2a817be608d3', CAST(N'2015-07-30T22:18:22.513' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7079c3de-3f08-4357-b2a2-2a821a2f2bed', CAST(N'2015-10-14T16:10:44.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9bf7b0bd-12e8-4b32-8f38-2a8e513e918c', CAST(N'2015-07-30T23:39:38.787' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7114caf7-f807-4f7d-a7c1-2a92a77f5f8b', CAST(N'2015-07-31T00:25:44.117' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ece856d-3eb2-454f-8f57-2a97ce1ec290', CAST(N'2015-10-14T16:04:52.307' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c815ddff-9c92-4047-b9cf-2abe130956d7', CAST(N'2015-07-30T22:21:04.020' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3f376a27-5023-4243-a003-2ad51b63fe12', CAST(N'2015-07-30T22:43:59.677' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb05fd51-f4c5-477c-9c0c-2ad5d0cbdcfc', CAST(N'2015-10-14T16:04:41.610' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'04193845-9cc5-4c43-a0e9-2b0302dfe447', CAST(N'2015-07-30T10:42:39.650' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b06ff815-a1c1-4196-bfb7-2b17ef5ee7a6', CAST(N'2015-07-30T23:25:05.663' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'621a4375-df19-443c-ac2d-2b36e41bb00f', CAST(N'2015-07-30T10:53:54.490' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3023910d-9cad-406b-8a28-2b51a6053add', CAST(N'2015-07-30T10:42:47.937' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dcc522ad-4a4a-466d-a99d-2b7d268decbf', CAST(N'2015-07-30T22:19:24.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'75797265-f7f2-4806-a3e4-2b7dd0d50892', CAST(N'2015-07-30T23:27:50.880' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4effb2dc-64ab-4ffd-af76-2bc60e6e831c', CAST(N'2015-07-30T22:43:59.577' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bb5801fc-5aa8-4355-972d-2beb6492850c', CAST(N'2015-07-30T23:22:00.407' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'34df150a-f31e-4a5e-9397-2c09e4f49d74', CAST(N'2015-10-15T11:20:42.187' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'02461006-719f-4656-a3f7-2c12586a8e68', CAST(N'2015-07-30T10:57:40.740' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b1cda68-c478-40f1-9c25-2c3cf8986a3c', CAST(N'2015-07-30T22:21:14.660' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=yunwei2,Password=abc123,ConfirmPassword=abc123,TrueName=运维二,Order=2,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3301804a-ac6e-4af7-a6de-2c44c0b569ae', CAST(N'2015-07-30T10:44:25.667' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9e28aa14-d03a-4f1c-8f91-2c53c64b6bc7', CAST(N'2015-07-31T00:16:23.013' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1c0cc6bc-9435-4b80-8e15-2c621d141935', CAST(N'2015-08-13T10:00:00.883' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3b51543a-25b7-4370-81ab-2c7bb66d9946', CAST(N'2015-08-13T10:10:46.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0667bbd6-9329-4ed7-aec3-2cd679412117', CAST(N'2015-10-15T11:21:39.920' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'561e552b-0e74-42e2-894a-2cedb48bb0c9', CAST(N'2015-07-30T10:38:31.127' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'38128c74-262c-4795-bcfa-2cf973e26829', CAST(N'2015-10-14T16:06:20.260' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'595458bd-ba17-48c1-aa66-2d009c14ffb9', CAST(N'2015-10-14T16:12:19.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85523cd0-4e01-4941-9a38-2d21363a1aaa', CAST(N'2015-07-30T22:44:13.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe45f8cf-0508-4e54-a0f6-2d254dfe0914', CAST(N'2015-07-30T23:26:20.757' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e1f3e5c-f5be-4cec-95f0-2d635faf1b2e', CAST(N'2015-10-14T16:05:39.737' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'98eeb346-b2f8-4952-9778-2d79549ed786', CAST(N'2015-07-30T22:24:09.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da8e3659-da84-4257-b6d5-2dba852c1d7a', CAST(N'2015-07-30T23:09:58.920' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f71beee9-bd75-4073-9b54-2ddafb4ac77d', CAST(N'2015-08-13T10:11:21.283' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'22d8671a-6044-4f6f-a872-2de4ee72d329', CAST(N'2015-07-31T00:24:20.377' AS DateTime), N'admin', N'::1', N'Account', N'MenuToRoleList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'88b6ec92-10aa-4ba2-9695-2deca67e2a09', CAST(N'2015-07-31T00:19:57.797' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'afc1650a-de7a-4412-93d3-2e3a59ba12af', CAST(N'2015-08-13T10:10:04.680' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edef2eab-52d5-49e4-b3cc-2e46835d633d', CAST(N'2015-07-30T23:37:18.550' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ded66fa9-2537-4c97-b4fc-2e9c37c5a8ac', CAST(N'2015-07-30T22:30:17.987' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6397637c-f6ff-41cd-bdcd-2eadc66b2a51', CAST(N'2015-10-14T16:04:35.987' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dbb3f79c-8e2c-4106-b232-2eb4645755e7', CAST(N'2015-10-14T16:05:04.563' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'577415bf-47c5-48e5-a629-2ee67ce27438', CAST(N'2015-10-14T16:08:45.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8e9cea94-8970-4ae7-aa1a-2ef35b701a9e', CAST(N'2015-07-30T11:02:48.133' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8887b81-6034-4a3c-a1aa-2f55ff6f0b62', CAST(N'2015-10-14T16:05:54.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9fe91856-7771-4488-8262-2f692155a1de', CAST(N'2015-07-31T00:18:39.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3522d9f6-1b66-4d1b-a966-2f6da4720661', CAST(N'2015-07-30T23:12:47.090' AS DateTime), N'itgly', N'::1', N'ItService', N'ToNextState', N'ID=3,Title=测试,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=康熙,applicantPhone=3333333,applicant_dept=2,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bc987e01-d1c0-459f-b224-1c33a08ea03f,NextLink=技术科处理,Opinion=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe423660-e7aa-4e78-8588-2f7c460a210a', CAST(N'2015-08-13T10:10:05.167' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7390a9bc-2307-4d12-81ce-2f970afb5a7e', CAST(N'2015-07-30T22:17:59.007' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'13f994d4-d33e-4945-8834-2faf73fa25bc', CAST(N'2015-10-15T11:22:48.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'192e3362-4fa6-489b-a752-2fe53ba5992e', CAST(N'2015-07-30T11:01:49.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37af83f3-a659-4899-b92c-2ffa1a9bd150', CAST(N'2015-07-30T10:42:02.177' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'222d0dde-c3cd-48b0-b8e3-30286dbf271a', CAST(N'2015-08-13T10:08:31.450' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50f923a1-7aa6-46e5-8558-3034ea9bcc6c', CAST(N'2015-07-30T10:43:29.950' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1ca37921-c753-414b-9955-3063ecd40b0a', CAST(N'2015-07-30T22:42:14.653' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'48e11fea-77ba-4677-ae43-308d3ff082d1', CAST(N'2015-07-31T00:26:57.623' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd8831d02-e54e-4147-9fd9-30c17f3ea171', CAST(N'2015-07-30T10:49:57.103' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd485d0eb-1c48-464d-8a46-311fff6c7d41', CAST(N'2015-10-15T11:19:33.380' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8f88566-f79b-4d26-85bd-313a9e5c41fd', CAST(N'2015-07-30T23:37:13.547' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac17c036-bbce-4b6d-b360-31a547729bb9', CAST(N'2015-08-13T10:10:04.557' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e02454c6-3498-4376-8d64-31d3e3e8a667', CAST(N'2015-07-30T22:31:51.220' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9cd3f221-3286-432d-8a5b-31d8489af126', CAST(N'2015-07-30T22:31:55.767' AS DateTime), N'yunwei1', N'::1', N'ItService', N'GetPossiblePath', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd3572cb1-74ae-4157-a3d7-31df03e06648', CAST(N'2015-07-30T22:33:49.913' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46f22385-f6fd-42fa-aa65-32346fb38af2', CAST(N'2015-08-13T10:08:35.547' AS DateTime), N'admin', N'::1', N'ItService', N'IsiExportXls', N'DealwithpeopleName=,isitype=,sub_isitype=,end_isitype=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a6d7ca6e-a7a0-454d-81b7-32503d9f6700', CAST(N'2015-10-14T16:13:05.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37ac5ed5-2a3d-430e-b8e3-3266255349d7', CAST(N'2015-07-30T10:38:47.907' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5825185f-9036-4282-838e-32850e8b7493', CAST(N'2015-10-14T16:04:53.107' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5f2fc53-dc40-4ee9-b4a9-328b5e932c47', CAST(N'2015-07-31T00:26:27.260' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=a365c4b7-0bb2-46a0-a84e-ac04655646ac,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'027988c5-a963-4d49-b290-32b8a786e806', CAST(N'2015-07-30T23:13:24.693' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79266475-9ab4-421d-b1f2-32fea86f19c9', CAST(N'2015-07-30T22:22:39.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'958e362e-f891-40e7-8a6b-3307d431c519', CAST(N'2015-07-30T23:38:58.737' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f48d524d-800d-459c-9b64-33507bb805c1', CAST(N'2015-10-15T11:23:27.973' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'270eacfe-ae89-4cea-a47d-3398d06c168f', CAST(N'2015-07-30T23:20:45.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd0750461-a986-46a7-adf6-33b857636113', CAST(N'2015-07-30T10:50:49.347' AS DateTime), N'admin', N'::1', N'DataDict', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f35b21e9-adcf-4bac-a294-33c372da0b62', CAST(N'2015-07-30T23:18:50.140' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66f99e0c-8000-4095-8430-33e9f8a359bb', CAST(N'2015-08-13T10:09:04.447' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cb26bbf5-92a2-46a8-8aa3-3418152d7c62', CAST(N'2015-07-30T22:20:34.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e0465880-cd9b-4582-b2e6-34200ac2efc9', CAST(N'2015-10-15T11:21:53.343' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'43831ec2-8885-4509-85d1-345e878c324d', CAST(N'2015-07-30T23:08:31.313' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f42bb74a-9ebc-4dad-a880-346ab3886477', CAST(N'2015-08-13T10:00:30.693' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7533d8b5-9bc3-4437-82f3-347432c5e12c', CAST(N'2015-08-13T10:04:49.127' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3090c7d0-b34b-4960-bd2c-3483c7d2db93', CAST(N'2015-08-13T10:00:27.190' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ad093e5-126a-4a01-a2f9-349216daa7a7', CAST(N'2015-07-30T22:22:01.813' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c2d11cd-737b-492d-9d30-34ceab44d50d', CAST(N'2015-07-30T23:11:10.370' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1f2aec64-f0b7-485a-868f-34d4749650c7', CAST(N'2015-07-30T23:22:40.453' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'beb1f0f0-c410-41cb-ab22-35101efcca02', CAST(N'2015-07-30T10:49:41.933' AS DateTime), N'admin', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'275a11fd-1977-4243-9d17-352095180e0a', CAST(N'2015-10-14T16:16:05.870' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20e648b6-31bd-48ff-b61e-3535dd456647', CAST(N'2015-07-31T00:24:17.460' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d6a3ddf-d091-43ab-b005-354e0877f251', CAST(N'2015-10-15T11:20:07.997' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6191eadc-3bf7-4fec-bce4-3557901edf23', CAST(N'2015-07-30T22:17:48.800' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b409eaec-bd74-4d69-88ed-355aa219dc52', CAST(N'2015-08-13T10:11:51.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd7589f46-e32d-4f1d-9552-35ad59774856', CAST(N'2015-07-30T22:18:16.317' AS DateTime), N'admin', N'::1', N'Account', N'DelUser', N'id=101a7b4f-a532-4503-8a81-e4524e294fe9,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7dde80be-a629-45f8-850b-35add0747270', CAST(N'2015-07-30T22:44:01.987' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'994e5709-ed78-4365-8661-35bdc55b0824', CAST(N'2015-07-31T00:28:32.730' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80b07931-0e41-4beb-9fdb-360bbda632bf', CAST(N'2015-10-14T16:05:45.270' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dafb7de3-c90c-458a-96d8-361800ec24c3', CAST(N'2015-07-31T00:27:05.917' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'45a0d11a-d2d2-4f10-aa80-36c59430f7ed', CAST(N'2015-07-31T00:23:57.483' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a27c4839-067d-481e-8590-36c969826c86', CAST(N'2015-07-30T22:22:06.523' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'208fd9f0-64b9-49e0-bb6a-36f6d3d3e7cf', CAST(N'2015-07-30T23:25:35.727' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d6a2bcb-3281-4b58-818a-37248bbfa6f2', CAST(N'2015-07-30T22:43:03.887' AS DateTime), N'jskkz', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c666feb2-e47f-4528-89a7-374bbc914690', CAST(N'2015-07-30T23:22:15.430' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'660f6bc5-c252-4ddc-aeb8-375057cd95a1', CAST(N'2015-10-14T16:08:39.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05c8aa78-f236-4a3a-8e1c-3755594ac4a6', CAST(N'2015-07-30T22:20:14.040' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'780553de-d28e-4e47-a25b-37650ec40ce2', CAST(N'2015-10-15T11:21:58.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f89de4bc-2304-41ad-b529-3765376ed9c6', CAST(N'2015-07-30T22:21:18.800' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fcbc7638-7d8d-4c9c-8078-37796a17fa93', CAST(N'2015-07-30T22:21:09.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76c13728-08ba-4111-9c85-37d6d653f3c3', CAST(N'2015-10-14T16:04:33.420' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'41b04641-db6e-40ab-86cb-38099a51e2d7', CAST(N'2015-08-13T10:08:59.817' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'083e65b8-8584-4a43-aaee-383277e33c99', CAST(N'2015-07-31T00:21:03.857' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7d745876-b48b-4c29-9956-385add659684', CAST(N'2015-07-30T22:18:24.397' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2bfabdb3-1914-473d-8e36-3871d777e8c4', CAST(N'2015-07-31T00:16:49.173' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b9767ec8-47e1-4816-858e-387c6a451c1b', CAST(N'2015-07-30T22:42:38.833' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'95e51207-f1ea-4d5b-b32f-3894fb0866de', CAST(N'2015-07-30T22:27:56.040' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f75846fc-698c-4acb-8d69-396124ff891a', CAST(N'2015-07-30T22:36:00.833' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'beec41a8-4443-4db2-a797-39647b4127e8', CAST(N'2015-07-30T23:23:35.533' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'48207686-0bc7-4383-b2b5-3971e0f7d1af', CAST(N'2015-07-30T10:38:48.547' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eae0398f-ab37-4f5e-9785-39c0cdf1c53a', CAST(N'2015-10-14T16:06:19.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'61d0cec2-e766-4d22-a947-3a155361efb6', CAST(N'2015-10-14T16:10:55.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6df36741-3234-46dc-ba48-3a1d4e9f0b19', CAST(N'2015-10-14T16:04:51.597' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c48dbcc-0778-4145-9ea8-3a323e4e538f', CAST(N'2015-07-30T22:30:17.397' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd66b508d-0f3f-43c3-852e-3a7ae4c11b7f', CAST(N'2015-07-30T22:30:54.187' AS DateTime), N'itgly', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e730029c-a7c4-4368-85ca-3a89ea68476e', CAST(N'2015-07-30T23:29:56.063' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'daab2e22-77aa-4a44-a52f-3a8b7a508c87', CAST(N'2015-07-31T00:16:46.833' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'378e7fc7-69a2-4fed-af7c-3a9345d57ff2', CAST(N'2015-08-13T10:10:21.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05e60776-4a96-40da-9476-3a93b376d6f1', CAST(N'2015-07-30T23:34:33.327' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83d17fab-f9c1-4a9c-8582-3aad5c711077', CAST(N'2015-07-31T00:24:28.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'deb9a4e6-c6ef-44b9-9146-3ac5f2b258e5', CAST(N'2015-10-14T16:10:30.313' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6c9607c-d734-49bf-9e20-3ad52ffda113', CAST(N'2015-07-30T22:43:24.033' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2328b393-85dc-48d5-a463-3ae89fa48b5f', CAST(N'2015-08-13T10:08:34.073' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b3a3d660-6236-4bcd-adcb-3af1d344e4b2', CAST(N'2015-10-14T16:12:24.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83d5e601-2e00-4f88-98f2-3b4f0b45438d', CAST(N'2015-07-30T22:21:24.430' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c5d6494-76dc-492d-9279-3b9b87942806', CAST(N'2015-07-30T23:12:56.267' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb0ad4b5-a124-494c-a265-3ba0cdb84b7b', CAST(N'2015-08-13T10:08:19.707' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a6055c83-a282-49c5-a59d-3ba32f9c3af4', CAST(N'2015-07-30T22:21:19.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1780fccd-5010-4973-8766-3bb29d31927c', CAST(N'2015-07-30T23:11:33.940' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a5839baf-8156-4571-9445-3c2336c3a6ee', CAST(N'2015-07-30T23:14:34.817' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a689f694-e3a3-4ebe-8348-3c6595cd686a', CAST(N'2015-07-30T23:15:49.897' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4fa5658-4663-4bc5-94c7-3c6a29287007', CAST(N'2015-07-31T00:23:02.917' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b303c399-9596-41a6-a519-3c95c3c9fd60', CAST(N'2015-07-30T22:22:02.313' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6d3e232c-31ae-4a62-a02c-3cb7e3657710', CAST(N'2015-07-30T23:11:16.467' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7a81727-3c53-4039-aebe-3cd39c8b665a', CAST(N'2015-10-14T16:12:05.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7dcb6357-1ab0-42fd-93bc-3d489218eaef', CAST(N'2015-07-31T00:19:50.063' AS DateTime), N'admin', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79825bef-a1bf-419f-9791-3dbfca81481e', CAST(N'2015-10-14T16:06:09.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c40784a8-6911-435e-a535-3dc900a0b24a', CAST(N'2015-07-31T00:20:22.877' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4bf382ec-54bd-42fc-aaa7-3dfd3a35f809', CAST(N'2015-07-30T22:42:34.067' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cf66db80-c7c9-4ea5-ab14-3e1100e67900', CAST(N'2015-07-30T10:48:53.240' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3dd67b2d-a9a3-4649-9a8b-3e28888b22de', CAST(N'2015-10-15T11:20:19.787' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c0b0f127-74b4-4962-95e0-3e2f4a8fbbd0', CAST(N'2015-07-30T10:44:09.873' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27cd359e-b290-4c67-b981-3e4a4eac6b1b', CAST(N'2015-07-30T22:18:04.050' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'233abb64-68b5-423c-a995-3e82052dad92', CAST(N'2015-10-14T16:07:10.293' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8e00ccf7-6c6d-404f-b117-3ea0ffc7293e', CAST(N'2015-07-30T22:20:53.280' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd78ba337-2388-4871-a5cc-3eb9f00db0b0', CAST(N'2015-07-30T22:22:44.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1abd70f-1e0e-433b-9f5e-3ebbcd3bd891', CAST(N'2015-08-13T10:09:05.283' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37c4c0cd-0c8d-4c46-89b4-3eef165fd203', CAST(N'2015-07-30T10:49:07.557' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9586f8f1-5622-4d57-a526-3f058c412f4d', CAST(N'2015-08-13T10:08:43.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a6398f8e-d320-4f76-acbf-3f0814c44ee0', CAST(N'2015-07-30T23:11:06.437' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2499ea4-4828-4f92-8441-3f0f97cce74a', CAST(N'2015-10-14T16:10:14.270' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbf3f284-304c-4035-97bc-3f1a20a0c5b0', CAST(N'2015-07-30T10:50:53.560' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8cde79c-5d72-49be-b5d8-3f2ae6a18588', CAST(N'2015-07-30T23:15:04.860' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'354899e9-2173-49c4-8f0b-3f56a0a4e77c', CAST(N'2015-07-30T10:44:22.773' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'676cddf9-7636-4193-a2ba-3f7a9a3d1ac3', CAST(N'2015-07-30T23:12:55.087' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd7d7ebcc-7a8e-4527-acde-3f9a43d6029e', CAST(N'2015-07-30T22:18:54.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a315f0e-2541-4b8b-b15c-3f9b6116a0b9', CAST(N'2015-07-30T23:09:46.367' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8eaa37f1-af79-4b3f-bcde-3fea6d979a5c', CAST(N'2015-08-13T10:09:06.447' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edec9866-48a9-40b1-8a82-3ff145d727f0', CAST(N'2015-07-30T22:43:43.447' AS DateTime), N'itgly', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b74cc5e8-9d72-4d20-8fdf-402b3f6c75d8', CAST(N'2015-07-30T10:42:41.793' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'962b4701-b8a2-47b7-8d1a-40358e7a586e', CAST(N'2015-07-30T22:42:13.283' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9214def9-fc17-492a-987f-403c4d5141c0', CAST(N'2015-08-13T10:08:56.577' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ec4b6227-52c8-4e6e-bc48-405430951d99', CAST(N'2015-07-30T10:44:20.667' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e91ab0b4-6860-46fe-a762-405de3f3a6f5', CAST(N'2015-07-30T22:33:47.763' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2f9b88e6-321b-4eaa-891b-407c0401e4fe', CAST(N'2015-07-30T10:53:35.230' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a8fdca4-5f17-411d-b42f-40875f403b7e', CAST(N'2015-07-30T22:43:22.833' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7ec50cd-2dd7-40cf-93b1-4088a64c7b9e', CAST(N'2015-07-30T11:02:17.147' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27304aae-ec40-4057-a5b9-409e1a9681f2', CAST(N'2015-07-31T00:19:23.770' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'21141f96-3d96-4c4f-aa1a-40a7bd10fc78', CAST(N'2015-07-30T22:43:43.870' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a5fe2ec0-4118-4737-aa87-40b9ac2daa1a', CAST(N'2015-07-30T10:43:25.667' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c319f634-c66a-4b71-8851-40d712da4ada', CAST(N'2015-10-14T16:12:14.300' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85884deb-9c7e-4f9d-af75-413a2e4de5d3', CAST(N'2015-07-30T23:15:24.893' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a9e51bd1-98f2-4c95-a109-413a93d38cc8', CAST(N'2015-07-30T23:24:05.563' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6c47b940-b99f-4a72-a834-415fd2642f37', CAST(N'2015-07-30T22:21:39.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'894a2079-3cc2-43ea-8dbc-416e4dc11c8e', CAST(N'2015-07-30T11:03:02.003' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cf9176e6-c0aa-4d22-b46f-4182ee4fd6b6', CAST(N'2015-07-30T10:49:38.820' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a21709c-2ed2-4324-b572-4193698e11d4', CAST(N'2015-07-30T22:43:23.743' AS DateTime), N'yunwei1', N'::1', N'ItService', N'OpenWorkFlow', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'744a7060-23f5-4ee2-afb6-41b973c810ce', CAST(N'2015-07-30T22:21:34.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b4b3774a-6b51-4b9d-822e-41ca4ec7bb34', CAST(N'2015-07-30T10:50:59.193' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cdcd874a-0e06-4172-9d05-41fedaaddb92', CAST(N'2015-10-14T16:10:34.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2c2b74e-9cf8-4c66-af28-4248720dbee8', CAST(N'2015-07-30T23:24:20.610' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9bffbde4-e8fd-4603-a373-424c5e5635eb', CAST(N'2015-07-31T00:23:01.950' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'404f70f7-f7f3-4c96-ae8f-4251030fdd38', CAST(N'2015-07-30T22:45:01.677' AS DateTime), N'itgly', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3eaf3862-02e9-4684-a825-427da8206f35', CAST(N'2015-07-30T23:00:11.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c2b03b94-5777-4dec-99e1-42b7c136a216', CAST(N'2015-10-15T11:22:32.983' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'22e7b1a3-ef3b-4a9b-8ba8-42d6de73c890', CAST(N'2015-07-30T22:29:45.247' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14654626-6791-428d-87ce-430e56c7f148', CAST(N'2015-07-30T23:35:33.360' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cadc380f-55b9-4e8e-82ad-4315e0eb40ac', CAST(N'2015-07-31T00:25:19.100' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a0cff3d-d999-437e-8ae1-433a8d58fbf6', CAST(N'2015-07-30T22:42:15.193' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7aef7bbc-94dd-4ec2-8658-4342ff14d20e', CAST(N'2015-07-30T22:22:06.190' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7d3fc03c-2e57-4a73-80a3-434b57984d04', CAST(N'2015-07-31T00:18:57.827' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'071414fc-9342-45c6-add8-438035e0d43c', CAST(N'2015-07-30T10:42:13.357' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cdbc4476-24b4-4413-990d-43bd3bde2c24', CAST(N'2015-07-30T22:44:57.227' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7798d916-4ae2-4019-855c-43ca56e37bf5', CAST(N'2015-07-30T23:36:53.490' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0dc28516-57fe-48d1-9f96-43d47a007eb6', CAST(N'2015-07-30T22:30:27.407' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9b2521f3-6418-48f7-a86c-43d7aa53d058', CAST(N'2015-07-30T22:33:47.667' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6493a958-fda4-42aa-9abb-43dde067dc80', CAST(N'2015-07-31T00:17:49.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'809a6812-7fda-4f47-8a07-442fb8aaa68b', CAST(N'2015-07-30T23:27:05.827' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4b601f5e-42e0-4417-beba-445edb8f2f72', CAST(N'2015-07-31T00:20:48.853' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4fe98288-7a1b-4314-b17f-449e6795b372', CAST(N'2015-07-30T23:28:10.903' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e553460-71fd-49d5-b83b-44a6b931d95c', CAST(N'2015-10-14T16:09:30.313' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2905d2f-8015-48b0-980e-44be0d33a3ad', CAST(N'2015-07-31T00:21:28.940' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2dbf9cab-2428-478e-a39d-44fad1515d23', CAST(N'2015-08-13T10:07:14.330' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5343d5c-d14b-48d0-a539-4500c2000421', CAST(N'2015-07-30T10:49:52.187' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a67a5b62-fb15-468c-8e31-45077479aeb0', CAST(N'2015-10-14T16:09:10.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'958b7256-7423-4e42-b1e9-451c0e011899', CAST(N'2015-10-14T16:09:40.300' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18db4085-3b29-4208-8554-45321287cfa9', CAST(N'2015-10-14T16:04:52.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9f589084-8319-4d60-bb9d-45644899d4f4', CAST(N'2015-07-31T00:27:52.677' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe4c84d8-5215-4fe5-aa26-45721fede906', CAST(N'2015-07-30T22:18:39.397' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6caeca8f-5910-4e4e-bb85-458383f4e1a2', CAST(N'2015-08-13T10:11:46.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b13dfd1b-93e7-46df-bff2-459811940b55', CAST(N'2015-08-13T10:08:16.447' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ccdc7990-4fad-45ee-9716-459d9e8f00d1', CAST(N'2015-10-14T16:16:00.877' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'10981a77-33b5-4c40-85b6-45ffdbc14dc2', CAST(N'2015-10-14T16:05:55.270' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15d268b5-9a46-49e1-a297-460b093788dd', CAST(N'2015-07-30T22:19:46.910' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'289ee83b-c72b-4a41-8e4a-4639994447eb', CAST(N'2015-08-13T10:09:11.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99ab664c-6201-4804-a48b-463a91911566', CAST(N'2015-10-14T16:08:59.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a8182617-cce1-4ae5-a9c5-4649d0ff9883', CAST(N'2015-07-30T10:42:29.600' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'87b70846-f93e-4beb-bf54-464d09e26f14', CAST(N'2015-08-13T10:11:56.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c68cb1b1-4a30-47c3-9af9-466db7d195fc', CAST(N'2015-10-14T16:07:30.280' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dd98b16f-2793-4f14-b272-46aeab03eefc', CAST(N'2015-08-13T10:00:26.820' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18081aae-bdf1-4a71-a202-46c76c55bc0d', CAST(N'2015-10-14T16:10:15.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'908305f7-eefc-4564-b377-46dbe78ecc3f', CAST(N'2015-07-30T10:44:33.833' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'983e8f88-ebe4-4e10-9913-46e57b28200b', CAST(N'2015-10-15T11:23:18.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4171ba65-d894-4e8f-b632-46fa7331c30d', CAST(N'2015-07-30T10:50:52.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe25846d-3192-43f9-bab2-472604e5246e', CAST(N'2015-10-14T16:10:05.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce5d210c-067d-4a3b-a557-4729caa386d7', CAST(N'2015-07-30T23:33:11.307' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'178b8085-7a72-4ac7-88e2-472a9a340f2c', CAST(N'2015-07-30T22:17:59.773' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'167e60b0-4275-45ba-946c-475c21d50e4a', CAST(N'2015-07-30T10:39:47.693' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6dcf27d4-a500-4d16-8db7-47874db8e337', CAST(N'2015-10-14T16:09:14.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e2988f56-5aa4-4b22-818f-478b411b9e69', CAST(N'2015-07-30T22:44:23.457' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'110fe2ae-21a6-4102-9c74-47a8313e1ae3', CAST(N'2015-08-13T10:10:05.810' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20567363-4789-4365-93f3-47bc4f760ca1', CAST(N'2015-10-14T16:10:59.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'96830951-a3f3-4cc6-af24-47df642b62dc', CAST(N'2015-07-30T10:39:07.117' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2057c44a-7eb0-4e98-8ea5-47e043e77eaf', CAST(N'2015-10-14T16:09:09.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70ecaa6b-246f-4391-9c1b-47eb3c9570d8', CAST(N'2015-10-14T16:04:31.257' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4d26447-1ba6-4e40-b320-480dae02b192', CAST(N'2015-07-30T22:33:51.957' AS DateTime), N'yunwei1', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=完成,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3877303e-801d-40f5-8447-483cfef59a2a', CAST(N'2015-10-14T16:13:27.413' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'54d6b728-a152-49cc-8a4f-4877fead756e', CAST(N'2015-07-30T23:10:06.383' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c6be056c-1b2a-4fee-83c6-4887665dd7a5', CAST(N'2015-07-30T23:17:20.047' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'828c1209-94b4-4864-84b0-4893730e7e96', CAST(N'2015-07-30T10:48:46.317' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0a524e6-2773-48d7-bc96-48b698436537', CAST(N'2015-07-30T22:43:38.757' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'07aaf023-835f-49ee-9ef1-48cf671996ef', CAST(N'2015-07-30T22:33:47.847' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99a80d35-467c-49be-86eb-48dc15d15907', CAST(N'2015-07-31T00:23:38.273' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'618e5903-a235-41f9-9657-48f04a3e166e', CAST(N'2015-10-14T16:07:39.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e91886d3-4cfb-4087-8dd9-48f5506f9acb', CAST(N'2015-07-30T22:23:59.447' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce00d196-3573-4ac7-84ef-48fe19eb15fe', CAST(N'2015-07-30T22:18:29.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a432256-ae25-4180-a6a8-4957e468cd4c', CAST(N'2015-07-30T23:28:35.957' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b59f4746-7577-4ab2-97b1-495cac99eb87', CAST(N'2015-07-30T23:35:08.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d4c1e61-b640-4f56-b53c-498e58754b4b', CAST(N'2015-07-30T23:32:11.217' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c41896a-618a-4ebb-a871-49b5a45ba489', CAST(N'2015-08-13T10:10:05.040' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e966e2ef-dfe8-4489-9e43-49e332178495', CAST(N'2015-07-30T22:42:00.350' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e15d12c-ef98-4b70-9bba-49f7822825c6', CAST(N'2015-07-30T10:43:36.610' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c2b79fc1-f1ca-43a0-8ffe-4a0238c3ccf7', CAST(N'2015-07-30T10:50:49.893' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d5e5688-8be6-4727-8620-4a056f24d246', CAST(N'2015-07-30T10:49:51.503' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20377ceb-f9ce-4405-9f82-4a1d26c497a4', CAST(N'2015-08-13T10:11:31.793' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'33b2cce1-c2c2-4af7-8c0f-4a491d608af8', CAST(N'2015-08-13T10:08:46.377' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba65076e-fa25-4c19-bccd-4a61b70e12cd', CAST(N'2015-07-30T23:32:21.237' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'deb8d461-e67e-4199-9854-4a62df7d7774', CAST(N'2015-07-30T23:19:55.217' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'92940fec-5b97-4ac8-90e6-4a70aa1fd99a', CAST(N'2015-10-14T16:07:35.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1d39dbc-5296-4ebf-a4ea-4a9a66f3923f', CAST(N'2015-10-14T16:07:50.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'04672bb6-ebbc-4d56-9f7f-4abdd60030fe', CAST(N'2015-10-15T11:20:37.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f9324093-b24f-4673-a4b4-4ac02bad0434', CAST(N'2015-07-30T22:17:58.407' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8309662-bcaa-4da3-974c-4acf94d9d07f', CAST(N'2015-07-30T23:22:30.460' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'68eddadc-13a3-4730-9b28-4b2a195be3bb', CAST(N'2015-10-14T16:12:45.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'110fe8ea-d2de-4977-843c-4b3c3de24997', CAST(N'2015-07-30T23:23:10.517' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8e2c10c4-ee0b-4ce2-919c-4b553084172c', CAST(N'2015-08-13T10:12:26.770' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65f04e48-2d9d-4bb2-9e11-4b5ae8c441b8', CAST(N'2015-10-14T16:05:41.770' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5f1f8339-9b58-4735-bfae-4b5b284fe54e', CAST(N'2015-10-14T16:12:39.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c48ad47-720c-4085-8241-4b64b68622e6', CAST(N'2015-07-30T22:30:18.477' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6cd85de8-c6b2-407b-a697-4b8d2d415405', CAST(N'2015-07-30T10:38:51.267' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd6d169ba-f875-45ec-9f7d-4b9b55acf0af', CAST(N'2015-07-30T23:30:56.143' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'988dc634-8c8d-4ef4-b695-4bb45c044222', CAST(N'2015-07-30T22:44:01.603' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3dc11d5d-970d-4fbf-be8f-4bbdacda9f0c', CAST(N'2015-07-30T23:36:03.413' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62018809-9c12-4779-bc36-4bd72165eacf', CAST(N'2015-10-15T11:19:57.987' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'af98d973-2270-4640-9859-4c2ea52cd337', CAST(N'2015-07-30T22:40:34.967' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'69100dbb-33da-479e-8f29-4c3b1c99ed5b', CAST(N'2015-10-14T16:09:54.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'316581d0-e877-4b45-b3e1-4c494c3c68b3', CAST(N'2015-07-30T23:12:36.990' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14749374-7584-45d5-8bb7-4c68a721f692', CAST(N'2015-07-30T10:43:24.807' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'441dd5ab-6b1c-4bbc-adf9-4c75f09160c8', CAST(N'2015-07-30T23:34:13.320' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'de3bd26b-9490-4e54-9142-4c9ed43b2d05', CAST(N'2015-07-30T10:42:26.880' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd058bd07-e99f-4304-81d3-4c9f7cb6e1ff', CAST(N'2015-10-14T16:12:49.293' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bea563af-f183-45ac-be57-4cc4490c4eb9', CAST(N'2015-07-30T10:49:18.827' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85627eaf-a18b-4b6c-b436-4d5b435f0115', CAST(N'2015-07-30T22:19:44.043' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad6bf380-4fc2-4f10-9c58-4d5df99c6bdc', CAST(N'2015-07-30T10:56:59.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18acbe64-37d6-452f-8da2-4d659c1a531d', CAST(N'2015-07-30T23:21:25.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f85610d5-7efb-4542-9524-4d991670231d', CAST(N'2015-07-30T22:35:57.847' AS DateTime), N'yunwei1', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73eb5684-c401-4263-9972-4db6ef70ac4f', CAST(N'2015-10-14T16:16:15.873' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd649fb7b-398d-492f-a168-4dd41894fdea', CAST(N'2015-07-30T10:44:30.657' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'346d3570-9e1f-4268-ac93-4deb68da7ec4', CAST(N'2015-07-30T23:13:04.683' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'491bd5e8-fce7-4470-b466-4df6c8fa6972', CAST(N'2015-07-30T22:43:41.607' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d901838-b9cd-454e-a978-4e090f3934cc', CAST(N'2015-07-30T22:21:39.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'513c9d1a-8e5e-4106-9fca-4e1f20f1fb2b', CAST(N'2015-07-30T11:01:54.707' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0f296acf-5042-4c00-9d95-4e2ef425ace4', CAST(N'2015-07-30T10:38:36.123' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'122f4e88-6bfd-4d1d-8924-4e31e27421f5', CAST(N'2015-07-31T00:23:56.727' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5ff4b87e-e7e0-449b-a86f-4e82e6c0d50e', CAST(N'2015-07-30T10:50:31.857' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4f117579-8ea1-4743-85ed-4e92a4ca3e75', CAST(N'2015-10-15T11:20:32.997' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3387f47e-f9a0-4322-a0c6-4ea493bef868', CAST(N'2015-10-14T16:09:35.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc6dce03-9536-414a-ac70-4ec8f62bcfdc', CAST(N'2015-07-31T00:25:02.903' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'30d063c0-e46e-4c30-b69f-4f0cee9f7aa4', CAST(N'2015-10-15T11:23:02.977' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1621ca46-d039-4208-a794-4f82b14a1fd2', CAST(N'2015-07-30T22:22:24.447' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0395a9a3-81ac-4bc1-b12c-4fc788a94aab', CAST(N'2015-10-15T11:21:33.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e9ef0c97-89d3-474a-892f-4fd073fd12a1', CAST(N'2015-07-31T00:17:14.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'acd47ebd-32d9-4ad7-8405-4fd70df4164e', CAST(N'2015-07-30T23:19:05.193' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'61bde952-c063-4cf5-a3d7-4fe3758f63f8', CAST(N'2015-07-30T23:27:15.837' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9f209b34-181f-4857-b464-5005a0271ab9', CAST(N'2015-07-30T23:33:21.363' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5fd89b1-331c-48f1-a2d5-50094d5f5f82', CAST(N'2015-07-30T10:40:28.627' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b9ad689e-a701-42ec-8866-50d6e474bfb2', CAST(N'2015-07-30T22:30:12.500' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'753aae27-2cd5-4c44-90ef-51147df6d7de', CAST(N'2015-07-30T22:40:36.477' AS DateTime), N'yunwei1', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=完成,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46e8b5d6-084f-4771-9a06-5129322795f5', CAST(N'2015-07-30T22:17:59.187' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f7cae18c-7d4f-448e-82f4-515287b79469', CAST(N'2015-07-30T23:12:06.503' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fcbbe279-c72f-453c-973a-515e109caac9', CAST(N'2015-10-14T16:13:14.293' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a7b0089-3fdf-4f83-9928-517c99beda0f', CAST(N'2015-07-30T23:18:35.113' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9e784f43-050a-4f67-8147-5191927a3971', CAST(N'2015-07-30T23:11:26.453' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e55d0d51-2d07-48ec-b81d-519f00f08f7f', CAST(N'2015-07-30T10:39:15.230' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=2,orgName=预算科,orgShortName=预算科,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'595d2682-dc5b-48f0-87fe-51a17e4c22ef', CAST(N'2015-07-30T11:02:26.407' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'07a3c4ab-515a-4c73-afcf-51a82333702f', CAST(N'2015-07-30T22:36:05.497' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4f410f19-8b38-424b-bdde-51be4f98a546', CAST(N'2015-07-30T22:18:39.030' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb67b6a7-e8c0-4d9b-93de-51c474dfe8a9', CAST(N'2015-07-30T10:39:03.927' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'52aa7722-add8-4700-baf1-51ea0c8d4ee5', CAST(N'2015-07-30T10:38:47.470' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed450786-c9a8-4d50-9710-51f6fa11f516', CAST(N'2015-07-30T11:01:47.957' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1c3eefa-a99d-4563-9443-5232060ce37f', CAST(N'2015-08-13T10:04:57.863' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0d7581ce-409c-4358-a76b-5246ac7aad14', CAST(N'2015-07-30T23:32:16.247' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'86c489ec-bdaf-4057-9470-525bc0f7644a', CAST(N'2015-07-30T22:23:39.467' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'748f6754-199d-449e-83cc-52b52eefad8c', CAST(N'2015-10-14T16:09:25.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'032cf718-f82e-486d-a0c3-52f2317f581e', CAST(N'2015-08-13T10:10:04.390' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc4c76e7-fcc3-4046-aadf-530c640f16e5', CAST(N'2015-10-14T16:09:00.290' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cb9b3da3-57f5-4aa5-a863-5367e2fd33f3', CAST(N'2015-08-13T10:11:31.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bee2762a-bdd1-494b-9e6c-53cf546574fe', CAST(N'2015-07-30T22:20:27.620' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9a69ef73-6380-4651-a0e2-53dda8752681', CAST(N'2015-10-14T16:05:35.150' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd8a376d3-490d-4335-ab3a-53fc91a215a8', CAST(N'2015-10-15T11:19:38.000' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f568f66d-97ac-44f0-8f6c-54085439a616', CAST(N'2015-07-31T00:19:24.657' AS DateTime), N'admin', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8618b666-017e-49e8-9763-540cfed5ea02', CAST(N'2015-07-30T22:30:55.370' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ca7b0f4-0a9f-49be-9927-541630da4745', CAST(N'2015-07-30T23:08:48.323' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'58efc333-828c-4a01-b3d2-54483f0fb737', CAST(N'2015-07-30T23:23:00.533' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'464672f5-5975-48c9-8a5e-544fe393d229', CAST(N'2015-07-30T23:12:43.773' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e472b3d0-a564-42d0-b062-547c41dcf120', CAST(N'2015-07-30T23:14:04.773' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'21290743-d31e-4807-bd8b-547eb389cda2', CAST(N'2015-07-30T22:21:19.333' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6f374491-3f7c-43b0-b42b-547ed1e47867', CAST(N'2015-07-30T22:28:42.587' AS DateTime), N'admin', N'127.0.0.1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'309a4e78-afc0-46a7-8d5f-548afbfccf37', CAST(N'2015-07-30T23:19:30.190' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd42b2c7d-7d73-4e28-9003-54cb67b498f5', CAST(N'2015-10-14T16:10:39.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'223c1359-7fe0-4b37-a5e4-552be2d9e54d', CAST(N'2015-07-30T10:50:50.253' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e4c8bdcb-ed49-4bf8-93a7-553e8d3e5fbd', CAST(N'2015-10-15T11:23:13.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f526a40b-0822-449a-94c5-557afbc06d32', CAST(N'2015-08-13T10:08:57.163' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3342f2a3-a0fb-466b-b693-559c787fdf4d', CAST(N'2015-07-31T00:20:01.077' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'556a64d8-fde4-4c39-90dc-559d57eb2d61', CAST(N'2015-07-30T22:30:45.337' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'51b943b4-f8f0-41f8-910b-55ced507e775', CAST(N'2015-07-31T00:27:22.630' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6e8e4d00-dc8b-48eb-957f-55d48cacf190', CAST(N'2015-07-30T22:17:59.900' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'92a069dc-2ef9-48a1-a464-5615a549e64a', CAST(N'2015-10-14T16:11:35.323' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1bfb8ac-b8a1-4997-bfe3-56673ec8772f', CAST(N'2015-07-30T23:11:34.563' AS DateTime), N'admin', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1dc64858-b1f2-42ea-b87d-568e47f00f3c', CAST(N'2015-07-30T23:23:20.530' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'34d8c4c7-3d39-4c76-a21f-56b45987c595', CAST(N'2015-07-30T23:32:41.260' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6c93ad5-afd1-46f6-9b20-56b9f8f004b4', CAST(N'2015-07-30T22:20:19.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f5e16cd4-0f0c-48fa-a715-56be934a02e7', CAST(N'2015-10-15T11:23:07.990' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8f730208-d577-45e0-8db7-56e123362e12', CAST(N'2015-07-30T22:23:34.450' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'367af00c-e5d8-4c8f-88b1-5702ec458252', CAST(N'2015-07-30T10:57:40.740' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'655b8f7f-84f0-4487-ae08-5753288ae665', CAST(N'2015-07-30T10:39:22.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8c56fba-b014-409c-a915-5754c12856f3', CAST(N'2015-08-13T10:11:26.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6701144f-d324-408a-8146-575831b8059a', CAST(N'2015-07-30T22:17:44.357' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3bd0cd40-b453-4d9b-8b76-577c3157f41e', CAST(N'2015-08-13T10:08:47.093' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8b5ee60-c67e-4f20-881f-579e85879d15', CAST(N'2015-07-30T23:22:10.410' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'92390da8-0846-438f-be85-57adcfd10f32', CAST(N'2015-07-31T00:27:07.550' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9f9388ae-771a-4246-be87-582fb34853ba', CAST(N'2015-07-31T00:27:16.933' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5c571261-5f4b-42de-88fb-587875bef3da', CAST(N'2015-07-30T22:40:30.537' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9467cdd0-a9ac-44c9-883e-5880e6d368f1', CAST(N'2015-07-30T22:42:33.500' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'87c7ecfe-4763-4dbf-b38a-58823313bfe3', CAST(N'2015-07-30T10:39:32.013' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c21ce29-573f-44cc-9f60-588fedd0fd81', CAST(N'2015-08-13T10:00:10.630' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc8fffde-7bee-4765-9f1a-58b8278746a5', CAST(N'2015-10-14T16:09:44.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b9f2358e-d5d1-444c-b815-58e10b31276d', CAST(N'2015-07-30T23:37:33.580' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b2ff206-b2a0-463d-85fe-58e937344a02', CAST(N'2015-07-30T23:22:25.427' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e32e07c-da9e-4dd9-8ab8-58f1d191918d', CAST(N'2015-07-31T00:16:46.210' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed4adb17-6cff-4d81-b031-594821298c67', CAST(N'2015-07-30T10:41:43.047' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa9d4133-c195-4606-8df1-5950e7918469', CAST(N'2015-07-30T23:14:14.777' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91b67d7e-b7e3-4f2d-9948-599359026410', CAST(N'2015-10-14T16:05:40.197' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ccc716ef-d1fa-4d63-9ca9-59ab80434586', CAST(N'2015-08-13T10:08:14.410' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6625fdcd-bd34-4a94-9ce0-59b2f59c21d4', CAST(N'2015-07-30T23:26:00.747' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b8bc00ef-cd4b-4469-a6dc-59c03d1999d8', CAST(N'2015-07-30T23:33:58.320' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2dc3ee05-f123-482e-9d71-59df56180138', CAST(N'2015-07-31T00:25:23.080' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14f81afc-d53f-48f6-a01c-59df5ece54b5', CAST(N'2015-10-14T16:08:00.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fcad9bce-180b-4f7d-b0fd-59f7a2124cdb', CAST(N'2015-10-15T11:21:38.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b47daa5a-312b-4d7e-8cf2-5a61c3c72918', CAST(N'2015-07-30T23:20:10.247' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8009ac65-bb12-40aa-aa02-5a66ee0cea64', CAST(N'2015-07-31T00:26:25.720' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0eb80d14-e0b5-4942-b7cf-5a9dd1e763e9', CAST(N'2015-08-13T10:08:12.413' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a29d2dc5-e0b3-47d5-b673-5abd5b2d8231', CAST(N'2015-08-13T10:04:17.887' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a35d645-1b0a-48bc-8d78-5acb1154e59a', CAST(N'2015-07-30T10:43:17.793' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'09348e1d-5cab-4638-9d24-5acdeb035b49', CAST(N'2015-07-30T23:17:00.057' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'450561d9-06f7-4db1-b660-5ae9ab421d95', CAST(N'2015-07-30T23:12:42.973' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=bc987e01-d1c0-459f-b224-1c33a08ea03f,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'87f0d7ae-7242-40de-8ac5-5afbe27aff30', CAST(N'2015-07-30T22:43:52.827' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a171a81-09a1-4615-8188-5b34d77f25d8', CAST(N'2015-07-30T10:42:07.153' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1c16be83-7a1b-4b63-835c-5b822ac94237', CAST(N'2015-07-31T00:16:46.753' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2ec3cb14-33c4-4d5c-b74a-5b844f1c86c4', CAST(N'2015-07-30T23:14:59.843' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9af03b0b-0381-4b79-a756-5bbceb69c24b', CAST(N'2015-08-13T10:00:15.640' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'12f637dd-cfab-4978-9f01-5bc606170683', CAST(N'2015-08-13T10:11:26.767' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe0412b9-a0b4-45f3-bf2e-5bd60ba70941', CAST(N'2015-07-31T00:18:27.507' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9a3968f6-7067-42b6-9efd-5bee10f28bb0', CAST(N'2015-07-30T22:21:44.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'21f880b1-25f9-4883-a4bf-5c196b4c103c', CAST(N'2015-07-30T23:23:45.537' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f892294a-2e0d-45c0-89ed-5c8085d9fe06', CAST(N'2015-07-30T23:12:21.527' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a5f8416-ac84-42e2-8534-5c9c3f487047', CAST(N'2015-07-30T10:42:42.973' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a405d41-043e-40c5-be44-5ca02a6bb512', CAST(N'2015-10-15T11:23:23.337' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7ee220fa-ca11-4e33-916d-5cbc418d8e42', CAST(N'2015-07-30T10:44:35.497' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27878837-3346-4127-930f-5cbeede060f3', CAST(N'2015-07-30T22:21:17.443' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5ddffcc1-4e75-439b-aa7d-5cdad202f5a6', CAST(N'2015-07-30T23:10:46.400' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aef28646-1586-4f1c-8822-5cefb1f2ac2c', CAST(N'2015-07-30T22:36:04.253' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2da44d3-a163-4240-b0ec-5d148d604968', CAST(N'2015-07-30T22:18:21.760' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'67aeab46-62eb-45eb-abfd-5d1fd5ab2581', CAST(N'2015-07-31T00:27:32.640' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7963a6ef-6817-4009-8eeb-5d26a7f25cd0', CAST(N'2015-10-15T11:23:12.973' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15256c45-ef56-436e-bd24-5d2959627864', CAST(N'2015-07-31T00:26:09.133' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15058560-7258-4ff0-9d53-5d2d137b845a', CAST(N'2015-07-30T23:33:32.307' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b3f716c-6d81-4486-946f-5d6750ddb624', CAST(N'2015-07-30T11:02:31.390' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8448f9bc-a7ed-471a-99bb-5dd2c0af40a0', CAST(N'2015-07-31T00:26:08.797' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'251b3541-ff38-49f2-8183-5ddfca1d73e8', CAST(N'2015-07-30T22:44:33.103' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'692fdfa5-ae39-4d9b-ac5f-5df5a4458445', CAST(N'2015-07-30T10:48:51.153' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'69694cd0-5263-4e7b-ac97-5dfb61b95d8a', CAST(N'2015-07-30T23:12:16.520' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa99a8a8-68f3-4a91-af86-5dff9ea8a52c', CAST(N'2015-07-30T22:20:49.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'44fe9756-4336-4967-ab50-5e310e76b3bf', CAST(N'2015-10-14T16:05:29.217' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ebfb11b9-6a36-4c32-b3c2-5e3168045157', CAST(N'2015-07-30T23:38:33.667' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'458c970c-7d96-4965-9de3-5e38f0781755', CAST(N'2015-10-14T16:12:54.290' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3fb8e84-19f1-4bca-ba7f-5eaaa02f8bd5', CAST(N'2015-08-13T10:10:21.757' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7b17001f-2e8d-41c2-aae6-5eba0e979639', CAST(N'2015-07-31T00:26:08.883' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55aba3d4-7e25-4eba-ad31-5eebc6e3048c', CAST(N'2015-10-14T16:07:25.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'439411d9-c574-4553-8521-5f261bf6762c', CAST(N'2015-07-30T23:09:41.367' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b1cd8c1-9778-4f1d-b9ac-5f44a063b1a7', CAST(N'2015-10-15T11:21:40.443' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'df828d4c-3c9d-431f-9fd7-5f541a0df7ec', CAST(N'2015-07-31T00:21:43.907' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e06f0e76-2198-454e-acfe-5f67ad1b32a6', CAST(N'2015-07-30T10:54:04.503' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5129f7e9-9cf4-4819-a727-5f7b8f436c53', CAST(N'2015-10-14T16:16:35.877' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b64fcc64-f100-4fe2-80a1-5f7d9a787cbe', CAST(N'2015-07-30T10:42:33.010' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'faa89249-d101-4448-8471-5f8ee5628e50', CAST(N'2015-07-30T22:22:06.967' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2193f9bb-6fa1-483b-a438-5f971115ae6f', CAST(N'2015-07-30T10:50:18.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3fc4c805-6801-4e6b-9cbe-5feb869d15cf', CAST(N'2015-10-14T16:05:34.227' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8db195d-72e2-477c-830c-5ff13cd3c6f0', CAST(N'2015-07-30T22:22:14.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd6b8098-d39d-4913-8f57-5ffe6b1f35c7', CAST(N'2015-07-30T11:02:50.767' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5147dcc3-f3de-4972-9401-600624c6f286', CAST(N'2015-10-14T16:10:09.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'41a84fa4-ef5b-4af6-8548-60215f3d712d', CAST(N'2015-07-31T00:27:37.663' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'625c6e47-0e5c-45c6-93be-6046afb6fc7e', CAST(N'2015-10-15T11:22:12.870' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ee73d231-5b16-46b8-a4ab-6062d478a774', CAST(N'2015-07-30T22:30:50.357' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0605d2fb-4787-417b-b9ba-608b2954f0e8', CAST(N'2015-07-30T23:12:45.053' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=bc987e01-d1c0-459f-b224-1c33a08ea03f,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'68cf1efd-3642-4a57-89fc-60f3c623b583', CAST(N'2015-10-15T11:20:48.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b7c44847-bc36-4111-b7a3-60ff5b0b41b2', CAST(N'2015-07-30T23:19:15.180' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'03f586dd-6abf-4173-8332-611a1d0bae18', CAST(N'2015-07-30T22:29:47.363' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79833a8e-fa13-4114-b557-619c818a7fd9', CAST(N'2015-10-15T11:19:32.933' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b79dc33-f7ce-4222-9a8c-61a90879d19f', CAST(N'2015-07-30T10:58:57.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'217a90fa-0bf7-4c6b-b844-61ac87dd91b0', CAST(N'2015-07-30T10:41:43.567' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'332228b2-d980-43f6-80f7-61ba78c61fbc', CAST(N'2015-10-15T11:22:52.973' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'61b42706-c1cb-4854-8478-61d9990db092', CAST(N'2015-07-31T00:16:48.760' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9670c27f-20f9-4b0e-b349-61dcad864d98', CAST(N'2015-07-30T23:38:48.700' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4cc493b9-3a75-4806-a2eb-61eb1783a288', CAST(N'2015-07-30T22:43:38.233' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bdb148a7-0ba7-45a4-9b19-61f95cd7f656', CAST(N'2015-07-31T00:19:57.053' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fdc16ee2-db6a-41b4-ad32-62008a93a628', CAST(N'2015-07-30T22:44:03.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8724781e-50f5-4d0f-8ecd-6201fed3eb46', CAST(N'2015-10-14T16:06:10.270' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2b9341d8-9048-418f-afec-6211f2245d69', CAST(N'2015-07-30T23:11:12.497' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa92139e-2a79-4c2f-b695-622a9980dbb7', CAST(N'2015-07-30T10:41:26.337' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=user02,Password=abc123,ConfirmPassword=abc123,TrueName=经理,Order=1,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a84ad3b5-b4a8-4f42-b9bd-62545cb2a3cc', CAST(N'2015-07-30T22:18:11.670' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'78657a5d-2256-4442-9072-6274d347a02c', CAST(N'2015-07-30T22:44:01.837' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'78c44b6c-a0ac-46fa-9b7a-6295bde6ca7d', CAST(N'2015-07-30T23:32:26.240' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'916b66e7-feb5-4470-aac2-62a6d41d589c', CAST(N'2015-07-30T10:43:29.607' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a77f1bc-994e-4737-a0b4-62c71bf82251', CAST(N'2015-07-30T10:42:11.820' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=user03,Password=abc123,ConfirmPassword=abc123,TrueName=领导,Order=3,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b4a81c87-0f8e-42c6-9e3e-62d369e698fe', CAST(N'2015-07-31T00:19:49.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a72e3936-435a-4a2a-a18b-62e6a53fb4c9', CAST(N'2015-07-30T23:28:15.930' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0115a6ad-9df9-411e-8291-6303150bddb1', CAST(N'2015-07-30T10:49:06.300' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b86a2741-d5b8-4ec1-9018-6308138bc3de', CAST(N'2015-07-30T22:23:24.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f5df7f45-4071-476e-9eea-6334bb948235', CAST(N'2015-07-30T22:31:13.297' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8dc8d1d1-9a89-4c12-b611-635c76c1430c', CAST(N'2015-10-14T16:12:34.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd638a2ad-2557-4a30-a4d3-6361a3428dc1', CAST(N'2015-07-31T00:19:00.227' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'650b241e-f5e2-48b4-8224-63cfd9dfc801', CAST(N'2015-07-30T22:22:59.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'10a9eaad-67c6-4e64-b695-63df9e09f2e5', CAST(N'2015-07-30T23:24:15.580' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50ea1dbb-b047-4529-b4f4-63e557442b41', CAST(N'2015-07-30T23:36:43.513' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'185e55cf-257f-4041-80ec-63eb6c52c902', CAST(N'2015-10-14T16:05:42.283' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae584bd0-5f92-4374-9d06-63eed1c8269c', CAST(N'2015-10-14T16:10:00.313' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce6709ef-0b11-4560-bfe7-6411fc522b33', CAST(N'2015-07-30T10:50:36.347' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c014f189-a8ea-482e-b78a-6438a00c2a3f', CAST(N'2015-07-31T00:26:10.463' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2069a20d-077b-4608-a13d-648650aeccd9', CAST(N'2015-07-30T22:29:50.147' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b1beef55-f12b-4c81-be5e-64b3b44b93fb', CAST(N'2015-07-30T22:18:34.590' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=1,orgName=信息中心,orgShortName=xxzx,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6676ec5a-5716-43b2-ac21-64da862b5529', CAST(N'2015-07-30T10:44:16.007' AS DateTime), N'admin', N'::1', N'DataDict', N'CreateDataDict', N'ID=4,DataDictName=网络故障,DataDictCode=,DataDictType=,DataDictNote=,parentId=0,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66d10c14-7a4d-4642-8563-6534a6086b32', CAST(N'2015-07-30T10:53:49.497' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c42c47c-1561-4e19-b0eb-6560415c9f5d', CAST(N'2015-07-31T00:28:07.670' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c2fa799c-160b-4071-8643-658d070ba925', CAST(N'2015-10-14T16:10:35.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ebdb8b93-267d-457e-ab7e-658ed0f0a7fa', CAST(N'2015-10-15T11:24:02.550' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'203e6c2a-495d-4768-803d-65c5aa7bdaf1', CAST(N'2015-07-30T10:40:42.513' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f018b464-fb8e-423b-95ea-660ff4ed923d', CAST(N'2015-07-30T22:17:53.020' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99531725-0da7-4b16-9400-664e59940e0c', CAST(N'2015-07-30T11:02:57.353' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c8cfc84-859f-46fb-b602-66675c829f58', CAST(N'2015-10-14T16:07:15.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37de988d-7cac-475d-a00b-66d51a2e5fa9', CAST(N'2015-07-30T10:54:14.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b293d69c-2e9b-4570-8516-66de55522d32', CAST(N'2015-10-15T11:22:13.867' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31aeb07f-cba0-42fb-8a74-66f843f85281', CAST(N'2015-07-30T22:30:46.877' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e7d199f-a985-441c-a571-671f9de8b03a', CAST(N'2015-07-30T23:35:43.393' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'afa27599-61cf-4a91-9b51-672a09114316', CAST(N'2015-07-30T10:53:37.093' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cfe6f2dd-1bf3-4cf7-a6b7-672a6cad4fc6', CAST(N'2015-07-30T10:43:17.430' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'afbe9aba-c2f1-4606-bc01-67933077fcc7', CAST(N'2015-07-30T10:38:20.507' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a00f977-2a90-4d2c-a198-6793f1ec2bb9', CAST(N'2015-07-30T22:45:03.267' AS DateTime), N'itgly', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71c3f76f-c6dc-4e48-85b0-67be3e49e5df', CAST(N'2015-07-30T22:33:49.317' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73fef6f1-c76b-4fd4-bfc9-67e98899c7c1', CAST(N'2015-07-30T22:18:34.403' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a477ac63-ba70-4018-95f9-686611ed3d52', CAST(N'2015-07-30T23:10:17.063' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5c3b2013-22ee-4a92-87f8-68a6c30f057f', CAST(N'2015-07-30T10:44:21.817' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd86a207f-5c4b-4f26-9915-68d328cf86a1', CAST(N'2015-07-30T23:18:20.073' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa836f23-b141-4859-af4a-68de84f64a9b', CAST(N'2015-10-14T16:05:40.753' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d945285-748b-4c24-a72d-68eeaa9d10f4', CAST(N'2015-07-30T22:18:11.610' AS DateTime), N'admin', N'::1', N'Account', N'DelUser', N'id=5fb7daef-5838-4b8f-8d3e-a925cb1304e2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7979842b-9460-494a-b078-691496749dca', CAST(N'2015-07-30T10:44:43.217' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'436c4b27-98cd-4120-b4a0-69238234ef7b', CAST(N'2015-07-31T00:26:26.240' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e2e812c-7b4b-4136-a37b-693f60afa419', CAST(N'2015-07-31T00:18:24.297' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'967e2e33-03c7-4611-9132-6970cb08308f', CAST(N'2015-07-30T23:08:13.833' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50625656-bfb5-4f10-a0b0-69769b1fe06e', CAST(N'2015-07-30T10:50:35.260' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1887af7-c275-4b36-965e-69c3fcaf0186', CAST(N'2015-07-30T23:26:10.763' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0bb112a1-d918-4570-b361-69d18b60a098', CAST(N'2015-07-30T23:36:38.490' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'344e3ab7-866f-4aef-b0ef-69d5187a671a', CAST(N'2015-07-30T23:12:36.710' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bef79c56-6b98-4ebe-a6ad-69d6792fa571', CAST(N'2015-07-30T10:57:04.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'28b8643f-aef5-4fc7-87e4-69e990cfc513', CAST(N'2015-07-31T00:25:58.680' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'295c9f8e-1533-4ec7-afb0-69ec988b96b3', CAST(N'2015-10-15T11:20:27.530' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7afc0fb8-44ca-48a3-a181-6a1a4ee82819', CAST(N'2015-07-30T22:19:34.387' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3c6864fc-96f9-49a4-ba8f-6a6e1fced31e', CAST(N'2015-07-31T00:20:22.323' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e969f48c-f85c-4b47-bcdc-6a752cebc5af', CAST(N'2015-10-14T16:06:54.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3f960cc8-b4af-43de-95d8-6ad91efe85fa', CAST(N'2015-07-30T23:32:56.287' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e1d06ae-be0c-411b-9dfc-6afb24ef2e12', CAST(N'2015-10-15T11:22:58.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c0d72744-d3fc-4eb8-b698-6b5dbd3b7bc3', CAST(N'2015-08-13T10:11:41.777' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a33a79c4-0156-4972-9e09-6b5ef2dc6f70', CAST(N'2015-10-14T16:05:14.567' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55e1450f-ed3f-4d7b-910e-6b75178fad31', CAST(N'2015-07-30T10:38:28.407' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c7ecaf50-03d2-441b-a9c2-6bb36621afb6', CAST(N'2015-07-30T22:17:54.330' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31ae7821-7ad5-44d6-96f6-6bc4f8937457', CAST(N'2015-07-30T10:43:52.327' AS DateTime), N'admin', N'::1', N'DataDict', N'CreateDataDict', N'ID=2,DataDictName=电脑网络故障,DataDictCode=,DataDictType=,DataDictNote=,parentId=0,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f08602f3-6d04-4767-9cd5-6bdf795b3b8a', CAST(N'2015-07-30T23:20:35.297' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a28c65e7-b8a8-416b-8674-6bee5cc4f317', CAST(N'2015-08-13T10:08:22.563' AS DateTime), N'admin', N'::1', N'ItService', N'ViewWorkFlow', N'id=bc987e01-d1c0-459f-b224-1c33a08ea03f,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4f4e606b-2290-482c-8143-6c5d0f857e17', CAST(N'2015-07-31T00:26:23.803' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=a365c4b7-0bb2-46a0-a84e-ac04655646ac,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eaac9d24-69fc-430d-bf64-6c9afa1f2569', CAST(N'2015-10-14T16:05:34.957' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'003061e2-bfdf-4a64-a69e-6ca9f41be4e3', CAST(N'2015-07-30T22:45:12.930' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ab1c71b1-629a-41d2-b3b6-6caca19fc5f9', CAST(N'2015-07-30T22:42:03.417' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a23480d-0578-4ca3-bdcc-6cc489c41ac6', CAST(N'2015-07-30T23:30:46.130' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc2c4e99-7af9-40b0-889c-6ce11a73a3f6', CAST(N'2015-07-30T23:36:33.467' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4f854d7f-7ca5-4662-8456-6d06cc542abc', CAST(N'2015-07-30T22:19:59.040' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'741fa654-a231-4713-9df1-6d14c33d1c18', CAST(N'2015-07-30T10:43:28.403' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bf259e98-6e1c-4dad-8d9a-6d525ad27814', CAST(N'2015-10-15T11:19:32.337' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0f2e5961-13a2-4f46-90c1-6d743b657b87', CAST(N'2015-10-14T16:05:19.187' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e84c516a-2da2-486c-a48e-6d8159933d14', CAST(N'2015-07-30T22:30:02.400' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'be193a7d-7fda-4279-acd7-6d864358bd01', CAST(N'2015-07-30T23:30:11.080' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2e09478-2e75-46b9-83a2-6db6005c4b49', CAST(N'2015-07-30T10:42:12.260' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5df0953c-9440-41f2-9c7a-6deac247d350', CAST(N'2015-07-30T23:23:15.530' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'06c5acc3-f277-463e-b940-6e44faafb563', CAST(N'2015-10-15T11:20:31.017' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=4,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a6b930f-2b6c-45e7-a698-6e49f02c8e07', CAST(N'2015-08-13T10:13:01.290' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6d93fa1-bd76-4e64-b9fa-6e5904413262', CAST(N'2015-07-30T22:17:54.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'25278f01-c129-4f20-bf3a-6e6f8ac16968', CAST(N'2015-07-30T22:18:34.703' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5e2b7ff7-9db7-453c-9cc3-6e8124295318', CAST(N'2015-07-30T22:21:15.337' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'98391d9f-c71e-403f-816b-6eac076f9052', CAST(N'2015-07-30T22:44:44.733' AS DateTime), N'admin', N'::1', N'Account', N'MenusToRole', N'menu_ids=1,42,43,47,48,44,49,50,45,51,52,53,46,54,55,roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f6a94baa-6520-40a7-bfb4-6eb60f605240', CAST(N'2015-10-14T16:04:52.267' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'144c049e-58f2-498a-99cf-6eb8b85a3693', CAST(N'2015-07-31T00:18:59.207' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba507260-d291-40f8-a77e-6ec3cb7399d3', CAST(N'2015-07-30T23:11:56.487' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e2edaf4-8739-4b6b-9ced-6ed4bb4c56fe', CAST(N'2015-07-30T22:31:55.343' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'23c4f975-2e3c-4964-998f-6f2b4b7c5f95', CAST(N'2015-07-30T22:44:48.103' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a619d04-f331-41ec-b7e8-6f41424ce201', CAST(N'2015-07-30T10:43:07.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'58e873cf-7e90-4266-b02a-6f49a2978269', CAST(N'2015-10-14T16:08:20.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'be6d856b-7b61-4a56-a6df-6f67c0ba13ca', CAST(N'2015-07-30T22:40:33.847' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd75bfbbd-f241-4ef4-9bfd-6f798bedaf5e', CAST(N'2015-07-31T00:25:58.017' AS DateTime), N'admin', N'::1', N'DataDict', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a3941abe-e808-4978-aaae-6f9fd4068b50', CAST(N'2015-10-14T16:06:45.267' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c411c8f1-7d32-4e31-8dcc-6fde7360bbb0', CAST(N'2015-10-14T16:07:09.230' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2adb20be-481c-4a83-bbd0-707aa3b7d14e', CAST(N'2015-07-30T23:21:50.403' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc4fdaf5-bed8-4414-b4d8-709a3b98dba6', CAST(N'2015-07-30T23:38:38.687' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6d745ac3-52f6-4e3f-9074-70de59311779', CAST(N'2015-07-30T23:28:00.913' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'789f98ed-00b8-450d-8af5-70f224a1d8b1', CAST(N'2015-07-30T23:29:31.007' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ffd60a05-fc68-4280-b184-712b30cb66ff', CAST(N'2015-07-30T22:31:10.717' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a1789a3-6e6e-4f49-a4aa-7152f635c898', CAST(N'2015-07-30T22:42:23.833' AS DateTime), N'admin', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4dffac1a-086f-4bfb-ac27-715ef2f8d9db', CAST(N'2015-08-13T10:10:51.777' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'26f68fd6-6531-4f6a-955b-71732b9690a8', CAST(N'2015-10-14T16:04:33.203' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed4d2db9-5b81-40ca-b7f8-7186795848e1', CAST(N'2015-07-30T22:17:52.843' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8056fb0f-165d-4312-92cd-719a60e67acb', CAST(N'2015-07-30T22:20:52.553' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=yunwei1,Password=abc123,ConfirmPassword=abc123,TrueName=运维一,Order=2,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3e4dc809-9738-437b-9580-71a9b2ad26e8', CAST(N'2015-07-30T22:31:50.787' AS DateTime), N'yunwei1', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b46900d5-5274-47d6-af48-71bac4014b38', CAST(N'2015-07-30T10:59:02.680' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5f433bf5-db7a-48a9-9e5d-71c62f39679c', CAST(N'2015-07-30T22:43:23.957' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ccd7473f-713d-433a-a68e-7215c5d7d018', CAST(N'2015-10-14T16:08:19.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b5c0a376-bbc0-4389-8faa-7245df46b3cc', CAST(N'2015-07-31T00:22:35.367' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9238d93d-b8a2-4e2a-94f7-726ee8f89504', CAST(N'2015-07-30T23:37:08.547' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'513e2924-02dd-4962-accc-7274f90ba23e', CAST(N'2015-10-14T16:05:35.767' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac0f2eb3-1f83-4aa3-9c77-72b316aa30de', CAST(N'2015-07-30T22:44:07.147' AS DateTime), N'admin', N'::1', N'Account', N'UsersToRole', N'user_ids=e0020b16-d342-4640-b702-5e43c350d72e,17a2400c-9a81-4954-9204-29b37a3e6419,7acd55d7-af52-474b-aa9a-2269d3dc1698,cd80af8a-696d-4880-a499-d515ca8d239d,4b8ad6ac-17ea-4318-b433-8dcfa02f75d9,057606cc-aa74-4fbc-b4b3-161c4e20d627,roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46752783-a7f4-47eb-ab3d-72b6dd2a30c2', CAST(N'2015-07-30T22:42:43.707' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3b367a4-3c42-4143-9c71-72b9695d4642', CAST(N'2015-07-30T10:55:19.507' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b7d2944-9782-47e8-8186-72f88d2daf37', CAST(N'2015-07-30T22:33:49.833' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db771e7f-e1c4-4495-a577-72fade4ad776', CAST(N'2015-07-30T10:56:09.300' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'25e865a7-f28b-4ec0-891b-72fbb1dd5175', CAST(N'2015-07-31T00:24:49.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31ea3a67-663b-42ed-8178-7302769a1e3f', CAST(N'2015-10-15T11:22:18.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f61f63fd-4578-49cc-90d7-730824ad8895', CAST(N'2015-08-13T10:09:11.763' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ba53cbb-dda0-409e-a1e9-73093ab95df2', CAST(N'2015-07-30T23:25:55.740' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1c09217b-c780-4a1e-9808-732367b86f89', CAST(N'2015-07-31T00:22:11.370' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a4ae6eb3-d658-4b93-bb04-73739bdf6896', CAST(N'2015-07-30T23:08:09.170' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bea5057b-8362-4793-bb2b-73904b13e038', CAST(N'2015-10-14T16:15:55.490' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bef17132-012b-4699-9307-73becb8ffa43', CAST(N'2015-07-30T10:41:57.173' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'be208444-3a62-4ee6-a674-73e455eb70a6', CAST(N'2015-10-14T16:10:54.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b0ef04a1-f541-4a19-a8be-73f3473ce6ed', CAST(N'2015-07-30T11:03:00.597' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'440234db-8950-4a62-9f3e-741358db19a3', CAST(N'2015-07-30T22:19:14.413' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'01cae0cc-4122-4337-8834-7413c304f2de', CAST(N'2015-07-30T10:42:37.987' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c2ba807-509b-4fd0-aec1-7419be66808e', CAST(N'2015-08-13T10:00:27.797' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'33d0b102-ce32-404c-be1d-741de775b6a1', CAST(N'2015-07-31T00:24:54.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'25b22c5d-6aa1-4a12-b5d3-74365f27e9c8', CAST(N'2015-07-30T10:39:25.507' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=1,orgName=办公室,orgShortName=办公室,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'209a3e2a-9b3f-4748-837b-74471e02cc27', CAST(N'2015-07-30T10:55:54.360' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'10e751da-6814-4810-96a7-744eb43943e5', CAST(N'2015-07-30T23:13:54.757' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4da4c70f-f7a9-4af5-9b70-745994314eea', CAST(N'2015-07-30T23:18:40.133' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bec6a48a-92cb-496f-b507-746c4a37c4f1', CAST(N'2015-07-31T00:18:06.290' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'78f04bbf-6d74-40b6-9cd3-7490ed624651', CAST(N'2015-07-30T10:49:23.830' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aaa3a0a0-7c37-4282-ada2-749566696208', CAST(N'2015-10-14T16:07:44.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eeb384f3-5415-45e5-9f05-74977115755b', CAST(N'2015-10-15T11:23:32.987' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14f63599-c9ed-4c7f-8556-74a379aafa31', CAST(N'2015-07-30T22:22:14.430' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0aa61371-fac2-4685-be78-74f4449e727a', CAST(N'2015-07-30T10:54:24.510' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'402a2aff-5e09-4a68-b234-75323e411cf5', CAST(N'2015-07-30T22:18:22.427' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd2bcd73b-cca0-4018-9634-753b171e9c29', CAST(N'2015-07-30T10:40:07.680' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b862f0c6-9501-4022-8341-75826d27bf62', CAST(N'2015-07-31T00:19:54.433' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'10d8fdb0-2e8f-4d74-b06e-75a4a9c6e00f', CAST(N'2015-07-31T00:17:29.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3f95c598-2594-494d-97a5-75b8ef9ebf80', CAST(N'2015-07-30T10:39:15.430' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc9d9c07-0753-422d-b960-75cc4450e8b5', CAST(N'2015-08-13T10:00:50.933' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5678a394-dd3c-4751-bd7b-75dac37a90ad', CAST(N'2015-07-30T22:43:52.370' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1abea87-9ad5-440d-83fd-75e11dfaca85', CAST(N'2015-10-14T16:09:55.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db75f530-fa66-45ee-ad45-75ebdf657cfc', CAST(N'2015-07-30T23:09:56.370' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'defbf11b-f3a7-4edd-b497-7601cf7b0021', CAST(N'2015-08-13T10:13:01.820' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7f7d98e3-0a74-46e7-a1e6-760d19e33b45', CAST(N'2015-07-31T00:19:57.283' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e42778b-35d9-4cec-9ea1-760dcfd01c8e', CAST(N'2015-07-30T22:36:01.843' AS DateTime), N'yunwei1', N'::1', N'ItService', N'OpenWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19c0b5b2-ab8c-4e80-9b15-76167350b0af', CAST(N'2015-08-13T10:08:33.567' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37434983-4acb-4556-9e65-763c808f1524', CAST(N'2015-07-31T00:16:54.193' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce00766e-82a7-4f66-b13a-76632d27df83', CAST(N'2015-07-30T22:43:22.660' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7f98838-8f31-4ae9-bf62-7694f1ed2888', CAST(N'2015-10-14T16:06:24.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9fa9b11e-dd91-4dd1-b614-76cb52e09dde', CAST(N'2015-07-30T10:43:52.490' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5cdfea2b-0b6b-4dc4-9f0f-770086f7a8f1', CAST(N'2015-10-14T16:07:24.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e4c9ffbf-3dab-46fa-9183-7723f4db4dce', CAST(N'2015-07-30T23:08:08.593' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'de42c213-94a6-45f6-8737-772d4a1aa21b', CAST(N'2015-07-30T23:32:01.217' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6c98839f-c1d8-473f-9121-7751a4664357', CAST(N'2015-07-30T23:24:10.580' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c790299e-25c8-47b2-abce-7754acb147d4', CAST(N'2015-07-31T00:17:44.397' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd6404648-c454-4539-a88f-777af036f32b', CAST(N'2015-07-30T22:21:04.413' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca97a32f-3977-4617-a67d-77867d605e4e', CAST(N'2015-10-14T16:16:20.877' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c6d2387b-dac5-48ce-825a-77947afc9561', CAST(N'2015-07-30T10:43:25.557' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7dfd9026-5f1e-42b5-801d-77bae89c6825', CAST(N'2015-07-31T00:20:53.843' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b652bd20-481e-472b-afae-77d1caf1e891', CAST(N'2015-07-30T23:39:28.770' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'90c3d5cd-cfaa-43aa-96aa-77e1b49c0ca4', CAST(N'2015-07-30T23:24:00.557' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bd22ba3d-96c3-479c-9a91-77ef58ca40d8', CAST(N'2015-07-31T00:24:59.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c256b71d-a41d-4c61-9fec-780a1b212b0b', CAST(N'2015-07-30T22:24:04.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'67aa6b94-576b-43de-bdb6-780df69c17ee', CAST(N'2015-07-30T23:39:03.750' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'03660a0f-f95b-43cf-b588-78125964560f', CAST(N'2015-10-14T16:11:25.327' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'443bffef-debc-4704-9d2a-78195f8f4d43', CAST(N'2015-07-30T23:36:08.427' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'52729763-3fa2-42ac-a097-787efd7e99dd', CAST(N'2015-07-30T23:32:46.270' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e0c5cd2e-b3b9-4164-b7fb-789f28e1c110', CAST(N'2015-08-13T10:11:21.787' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'23ada105-eedd-4862-afa7-78e597e258c6', CAST(N'2015-08-13T10:11:56.777' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6b298e2-068b-44cd-93c7-78fbbec40228', CAST(N'2015-07-30T11:01:59.677' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c03cbcf5-a0ad-4f24-b32a-790198cec182', CAST(N'2015-07-30T22:31:14.963' AS DateTime), N'jskkz', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2666644f-974e-4160-b409-79211222a795', CAST(N'2015-07-30T22:44:32.760' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5aef85a5-5af8-40a6-abd5-793880531778', CAST(N'2015-07-30T23:31:31.167' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed1ee869-0ef9-4d42-a46b-797df18b4181', CAST(N'2015-07-30T10:50:41.970' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b6287948-cc34-4192-bc4b-7992d20a3096', CAST(N'2015-07-30T22:42:06.697' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17e6bf65-b955-4c39-952f-79947778957b', CAST(N'2015-10-15T11:20:32.403' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'494442e4-260c-41dc-ad0f-79a443bdf998', CAST(N'2015-10-14T16:10:49.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8c0f4886-8f8a-4a34-96f3-7a20ad85441e', CAST(N'2015-07-30T22:20:24.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'97c1b53c-d214-4038-a9c0-7a65388520a9', CAST(N'2015-07-30T23:09:36.350' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae606095-e0df-4060-b3a5-7a86dbfee2de', CAST(N'2015-07-30T23:25:50.740' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'acb42c68-8554-4169-862c-7aa2028f62ad', CAST(N'2015-07-30T23:10:12.520' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b6da5fd2-d084-40df-bf7b-7ab1eaa6c7a1', CAST(N'2015-07-30T22:18:59.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6195dfa-ff8c-4cfc-aff0-7ad8fb052346', CAST(N'2015-07-30T23:19:00.157' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c87d3c33-c4d9-486e-97ca-7ae4b53f1e3e', CAST(N'2015-07-30T23:23:50.567' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a950ac2f-ca66-4889-9824-7b15dc8af2d8', CAST(N'2015-07-30T22:22:19.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f913f474-3e92-42a5-8a53-7b1f9246a9fc', CAST(N'2015-07-31T00:17:39.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3246d2c0-c408-49db-a9c6-7b229d5b40d4', CAST(N'2015-07-30T22:36:04.773' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'863c04b1-cd31-4bee-84f4-7b2971dc0676', CAST(N'2015-07-30T10:43:02.860' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db6120cb-20fb-4351-a331-7b2a09ddfca2', CAST(N'2015-07-30T22:31:09.943' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce25f132-9cc6-4a27-82a0-7b2f0a880ccd', CAST(N'2015-07-30T22:22:29.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd42418bf-d3fd-4286-9a68-7b3f19d34315', CAST(N'2015-07-31T00:20:58.873' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'35d6cf25-3bb1-41d5-ade2-7b479529b350', CAST(N'2015-08-13T10:00:33.043' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'225d86c7-f086-4fc2-a015-7b56c3de29b3', CAST(N'2015-07-30T11:01:48.583' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'638b4b64-c93a-4b67-8b23-7b600d42f361', CAST(N'2015-07-30T22:44:57.690' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a3cec2d-d97b-4478-9ad6-7b9d8aa8b3ae', CAST(N'2015-07-30T23:40:03.803' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27ce19b5-9e45-441d-ba74-7bfff37ab429', CAST(N'2015-07-31T00:23:48.993' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cdda345c-6582-4da6-8865-7c056c58f8e9', CAST(N'2015-07-31T00:27:47.687' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd9eca051-cbeb-4e88-86df-7c31b9eded92', CAST(N'2015-07-30T22:22:34.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6576e4c-98d7-4962-a45b-7c680695bf7f', CAST(N'2015-07-30T22:22:01.607' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=itgly,Password=abc123,ConfirmPassword=abc123,TrueName=信息管理员,Order=1,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'86ea1248-67a2-4d24-b25d-7c7cc5e39251', CAST(N'2015-07-30T22:23:54.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2bbd9a94-4b0d-4f77-9127-7c83d47d2d59', CAST(N'2015-10-14T16:16:30.880' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50d51ac4-6e46-49c4-bbc9-7c9bf9ec03db', CAST(N'2015-07-30T22:19:47.327' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70297e44-7026-47b4-942e-7c9f675d2fc8', CAST(N'2015-07-31T00:19:14.317' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80e9ddf7-c87d-439b-8434-7ca321df332d', CAST(N'2015-07-30T10:48:48.987' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'439f8924-e998-4b9d-b59e-7cc31cf7b4c0', CAST(N'2015-10-14T16:05:50.267' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe067e18-68a8-4ed9-bb64-7cc982b74a7c', CAST(N'2015-07-30T23:15:19.877' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'57b37d0b-6f2a-4d4f-88bd-7cd997ad827a', CAST(N'2015-07-30T23:12:54.000' AS DateTime), N'jskkz', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b41b2745-3638-4aab-9517-7cf3dd5b1abf', CAST(N'2015-07-31T00:18:09.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f231473b-5f29-4093-a488-7cf8c6eb5585', CAST(N'2015-07-30T22:18:34.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a101e722-4b70-4f86-b264-7cfcc870ff30', CAST(N'2015-10-14T16:04:26.870' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'74015755-1749-48bc-a7c6-7cffb3b80925', CAST(N'2015-07-30T23:17:55.047' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c93d0019-7f9d-4643-98ea-7d0d0d800fce', CAST(N'2015-10-14T16:09:45.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f81b7469-53d8-4dce-a753-7db2284fc21e', CAST(N'2015-08-13T10:00:31.490' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9f79ac2e-3a6c-430b-a102-7dca860e50d3', CAST(N'2015-10-14T16:05:18.677' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'95470ae1-92b7-4820-a603-7dd58e6b60d0', CAST(N'2015-07-31T00:20:23.303' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=a365c4b7-0bb2-46a0-a84e-ac04655646ac,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8faa005f-1537-4a6b-a58f-7ead49a50eb4', CAST(N'2015-07-30T10:41:52.503' AS DateTime), N'admin', N'::1', N'Account', N'EditUser', N'Id=5fb7daef-5838-4b8f-8d3e-a925cb1304e2,TrueName=经理,Order=1,Job=财务经理,Mobile=,PhoneNumber=,Email=,OrganizationID=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17d81d16-95f4-488c-ae20-7eaeedc285c1', CAST(N'2015-07-31T00:23:03.480' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e432bb2-b4d2-4b30-b91c-7ecc94c6430c', CAST(N'2015-07-30T22:18:49.037' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd73fa4c4-7bb9-4ced-8296-7efffcf427cd', CAST(N'2015-10-14T16:11:29.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e0631769-7308-4c2d-822d-7f3424e952d3', CAST(N'2015-07-30T11:01:46.733' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'32503f6a-cb67-42ec-b401-7f3e0c5ec093', CAST(N'2015-08-13T10:08:19.080' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a890fcd8-88c3-4b0a-93e9-7f7ac450557f', CAST(N'2015-07-30T23:11:36.470' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1dbc03b-7ac2-4900-8841-7f9c0c2a6df8', CAST(N'2015-07-30T10:42:41.233' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed9c19d4-8bf6-4580-acc3-7f9fc2812e21', CAST(N'2015-08-13T10:08:46.573' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'931e9210-e870-4521-b1e7-7fa7ff0cfca5', CAST(N'2015-07-30T22:20:04.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba26b908-2fae-4268-b1cc-7fd7192e3320', CAST(N'2015-10-14T16:11:50.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d47c38f-0c6c-423b-bf7b-7fd9c3991107', CAST(N'2015-07-30T23:30:21.123' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4c987159-5a81-4d37-bc8a-8008c2cb3b65', CAST(N'2015-10-14T16:05:39.107' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c4544288-b411-4d66-a438-800e717ae2bb', CAST(N'2015-10-14T16:10:10.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'df023669-4ab6-4c97-8288-8011a4266585', CAST(N'2015-10-14T16:09:15.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9df38d03-7d4e-4ca4-9cc7-8030373e93ea', CAST(N'2015-07-31T00:19:04.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1da36229-4407-47e5-84d3-803e5f545ca4', CAST(N'2015-10-14T16:08:15.290' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'609eaa23-1b4e-4f55-97b1-807908380aba', CAST(N'2015-07-31T00:21:08.843' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'187d5c5f-e510-4c70-bf13-80b6ddbe8035', CAST(N'2015-07-30T23:17:30.037' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5119c9a6-7c4e-49f5-a19f-80d8d6e6312c', CAST(N'2015-07-30T23:24:40.623' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'49bf390c-866b-42cf-97c9-80dd0ced584f', CAST(N'2015-08-13T10:08:33.023' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd2001366-9a61-4250-bbe0-80e05b9681b3', CAST(N'2015-10-15T11:20:27.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e3eb2f60-5ac7-47bc-84ff-80e68e601b34', CAST(N'2015-07-31T00:21:54.397' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd65d8912-48c2-4c7d-885e-80fc7cdea25d', CAST(N'2015-07-30T22:33:51.473' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7cdd757f-62b0-47f8-ac9d-80fdf6abb47c', CAST(N'2015-07-30T22:17:43.800' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7f19e244-f829-4cc7-8702-81087fca7976', CAST(N'2015-07-31T00:27:17.613' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'909578a8-f53c-4cf6-b3a4-810e28c96253', CAST(N'2015-08-13T10:08:13.907' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76f26187-aa84-4229-b02c-8131de91a367', CAST(N'2015-07-30T10:50:31.547' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'08ba3116-6022-461e-b0f0-814e50a28288', CAST(N'2015-07-31T00:27:05.663' AS DateTime), N'itgly', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'822f02c5-5582-4e3c-828d-815c966c7d59', CAST(N'2015-07-30T23:12:11.503' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef925cc2-fbda-4c42-957c-816cf82bae4c', CAST(N'2015-08-13T10:10:06.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3e1741a6-43a8-46e5-8736-82394f920589', CAST(N'2015-07-30T10:56:04.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f98afad7-c709-4ef8-8444-82652c7103af', CAST(N'2015-10-14T16:05:00.097' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46aacbf1-5df4-4f7f-8efa-826619ba7f79', CAST(N'2015-07-30T22:17:49.357' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fc80a8e8-4c23-4e4f-9e2f-8267d4fa0169', CAST(N'2015-07-30T10:44:19.977' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b92f6c6-1f74-43fd-9c39-8269c65667ca', CAST(N'2015-07-31T00:19:58.340' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2fa39132-ea36-4ee6-852b-82bf39813fc9', CAST(N'2015-10-14T16:04:37.550' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e961a1cc-6441-4c1b-a068-82ca6fa4bc0a', CAST(N'2015-07-30T22:17:47.297' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14f0caea-b2d8-4261-b90e-82fd00847e78', CAST(N'2015-07-31T00:19:58.890' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05e9267c-b926-49e8-9e42-833e5f127a5c', CAST(N'2015-07-30T23:08:54.317' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5618d423-4417-4acb-a4bb-83727f386be1', CAST(N'2015-07-30T22:20:27.410' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=jskkz,Password=abc123,ConfirmPassword=abc123,TrueName=科长,Order=1,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'093d4475-e932-4e49-b288-83782cf34f37', CAST(N'2015-08-13T10:08:49.183' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba0ee281-be9e-4b73-8287-837b3567aa1c', CAST(N'2015-08-13T10:10:31.760' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8cf95d12-7303-4f2a-8cd3-837ba13862fc', CAST(N'2015-07-30T10:39:57.723' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73dffdb0-c917-4486-803e-8386ad3482c0', CAST(N'2015-10-14T16:11:00.320' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'94306418-371a-4ff8-9663-839053608c1f', CAST(N'2015-07-30T22:29:45.897' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd546390c-a837-4680-8166-83ba3d52c22f', CAST(N'2015-07-30T23:30:51.140' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dc818c5a-b0d5-4bd1-8c2b-83c13b1cbab8', CAST(N'2015-07-30T22:44:28.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'93e0f7a7-f84b-47c3-8268-83e5e9d160da', CAST(N'2015-07-30T10:38:29.363' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e4eec614-36ef-4460-b5f5-8412eef9555e', CAST(N'2015-08-13T10:10:16.860' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5ad23853-a582-4410-b0bf-8456af8956a9', CAST(N'2015-07-31T00:23:00.523' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e9265fc7-08b8-4e09-b5e4-84614466872d', CAST(N'2015-08-13T10:08:24.197' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7ddab73-5c75-43ab-bf3d-84e125d7f630', CAST(N'2015-07-30T22:43:26.057' AS DateTime), N'yunwei1', N'::1', N'ItService', N'GetPossiblePath', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2072df03-9df6-4f25-b600-84e5d4b87f03', CAST(N'2015-07-30T22:27:56.043' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7dd5e4ef-62ea-4bbd-af3f-84e9b9558f36', CAST(N'2015-08-13T10:10:06.443' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'23e8bed4-05b5-4d88-9567-8500cc0ce1fe', CAST(N'2015-07-31T00:20:18.430' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0dd18a71-e0ec-4e4b-bfc4-85506ef67d75', CAST(N'2015-10-15T11:22:37.990' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e5efd636-4d8e-4200-9ae9-855e9cba265a', CAST(N'2015-07-30T10:40:57.457' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3b737280-f541-4ff5-bf0f-859942067e3b', CAST(N'2015-07-30T23:12:43.847' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7303ca6c-71ed-474a-8004-85a27a0b2f3a', CAST(N'2015-10-14T16:08:25.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c47028ec-2d3b-4247-a549-85e189eafbbc', CAST(N'2015-07-31T00:16:48.197' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'749ef464-d886-4e95-b49d-86130567fbc8', CAST(N'2015-08-13T10:12:31.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a9f09459-1f6d-4b0c-812b-862b6ad9adb5', CAST(N'2015-07-30T22:18:04.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0229cc43-54ec-4574-bd25-865de22d33ba', CAST(N'2015-07-30T10:38:47.187' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b860f817-884b-4e46-ac7d-86670d0c18ec', CAST(N'2015-10-14T16:07:00.267' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5271060-6f1c-49b9-a99e-86735220d3c4', CAST(N'2015-07-30T22:19:44.410' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d1d2ce8-7e19-44b2-96ea-86846160df5a', CAST(N'2015-07-30T22:18:54.037' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'57917225-b440-4437-b856-86a839454874', CAST(N'2015-07-30T23:13:39.757' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6650041d-6877-4728-b231-870461370988', CAST(N'2015-07-30T10:50:36.647' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f06ea389-053a-4213-bbdd-87374e3147e6', CAST(N'2015-07-30T23:39:53.793' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19f78987-4361-4373-a1e8-8763a4590724', CAST(N'2015-07-30T23:24:45.603' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db837d13-053e-4790-9a64-877c7f25d5e8', CAST(N'2015-07-30T23:17:05.047' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd928539b-a26b-42ac-90a6-87951a5148a9', CAST(N'2015-07-31T00:19:57.203' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8aeaa42-29ce-4889-9eda-87f629a8c5e2', CAST(N'2015-07-30T10:48:52.780' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c1c51a8-b82a-4c5b-bce4-8815842a261d', CAST(N'2015-07-30T22:17:46.903' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'445beb9a-740f-4211-ab29-885d27022680', CAST(N'2015-08-13T10:11:46.767' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a12b2ac6-95f7-444a-b55a-88690cf63427', CAST(N'2015-07-31T00:23:58.973' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'86321d83-5c68-42a6-a105-887593fffbb7', CAST(N'2015-08-13T10:00:29.090' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a74ae7f3-48ee-4b0a-99cc-88ae66c04b62', CAST(N'2015-07-30T23:33:37.357' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eb75ab34-e7fc-4ce9-a840-88e041e2c50b', CAST(N'2015-07-30T23:27:25.847' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c71206e9-ac41-4ffb-af8e-894e22f9b8eb', CAST(N'2015-07-30T23:20:15.267' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fc78b7a0-afe2-407f-bad9-896eb71a51af', CAST(N'2015-07-30T23:34:43.320' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f86ace66-8eb0-49b8-a9a0-898302661c1a', CAST(N'2015-10-14T16:04:47.080' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'706709fe-c912-45bc-9fee-899d8a090c84', CAST(N'2015-07-30T22:42:59.907' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7bee471a-1c1f-4cf4-aa39-89afb3f56ebb', CAST(N'2015-10-14T16:04:32.983' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'289780a4-ff5f-464d-98ad-89ec6f834950', CAST(N'2015-07-30T23:10:56.420' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f68d2069-b7ee-47c8-b8ad-89fb2aa2facd', CAST(N'2015-07-30T22:17:47.803' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7dc662d-f343-4d7c-bfba-8a020bdba726', CAST(N'2015-07-30T23:30:41.107' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'289f6c90-030a-4c4a-98fa-8a1612f36d4a', CAST(N'2015-07-30T23:11:10.000' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'34b90ac7-7c34-47bd-ab38-8a2dd8794a95', CAST(N'2015-07-30T23:12:55.447' AS DateTime), N'jskkz', N'::1', N'ItService', N'OpenWorkFlow', N'id=bc987e01-d1c0-459f-b224-1c33a08ea03f,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8ab1742-f805-4686-86f8-8a5ea7051300', CAST(N'2015-07-30T22:18:16.403' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd3a081f8-e179-48f5-908c-8a7672bf32b7', CAST(N'2015-08-13T10:11:01.763' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'896f24c2-c42e-46cb-b2d9-8a789b1f967d', CAST(N'2015-07-30T23:13:09.687' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3f20a120-55eb-4902-a6af-8a8cc75b9fb9', CAST(N'2015-10-14T16:06:04.233' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc97db11-4426-4340-9f46-8ac87e1a7a50', CAST(N'2015-07-30T23:39:58.803' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4779577b-2989-4f5f-bcd1-8ae637cf0bc3', CAST(N'2015-10-14T16:11:30.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6773c4ca-4f2e-480d-b3bf-8aeae273b0fd', CAST(N'2015-10-15T11:22:13.457' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'90d7ce54-75d7-4bdc-a549-8b16ba004f50', CAST(N'2015-07-30T22:17:46.427' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd1dcc345-b342-4809-9651-8b426363b15a', CAST(N'2015-07-30T23:34:53.327' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'383c43d8-8056-4743-90ea-8b44b0b65786', CAST(N'2015-08-13T10:11:11.780' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c928aca3-bd9a-45ef-bdfa-8b975495e654', CAST(N'2015-07-30T10:50:34.533' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7b5a81b-f48f-4721-8468-8b9b23085aae', CAST(N'2015-07-30T22:19:34.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'663cac2f-2d49-4f6b-aa5a-8b9cee1bbaf1', CAST(N'2015-07-30T22:20:39.050' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd3748fb-041f-419e-80cc-8bb872de5ec5', CAST(N'2015-10-14T16:11:09.277' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bcbbc51f-c6d2-4cd8-87eb-8bc0c9e6e65e', CAST(N'2015-07-30T10:42:22.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'994c07c4-6748-4acc-b249-8becca8c47a7', CAST(N'2015-07-30T22:43:59.503' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0c632b1-d462-4e37-8f2f-8bef46b028ab', CAST(N'2015-07-30T22:17:59.570' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aa247e8f-8466-4479-8c9b-8c00fcec0c6d', CAST(N'2015-07-30T10:39:52.500' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8c3065a0-77e6-45d1-a911-8c2183802f2e', CAST(N'2015-07-31T00:17:54.270' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'187dc1f8-5832-4c42-a301-8c34f1ac7862', CAST(N'2015-07-30T22:43:11.287' AS DateTime), N'jskkz', N'::1', N'ItService', N'ToNextState', N'ID=2,Title=sss,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=sss,applicantPhone=sss,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,NextLink= 运维1处理,Opinion=x,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4a2e3c8d-9312-409e-84aa-8c5caa1c220f', CAST(N'2015-07-30T23:09:26.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e95b325e-a783-4594-a62f-8c6107f3c3a6', CAST(N'2015-10-14T16:08:40.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17a5772a-b9eb-4926-82c7-8cf08b4a6f3e', CAST(N'2015-08-13T10:09:05.897' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7236712c-45dc-4adf-8e14-8d1a2253a92a', CAST(N'2015-07-30T23:13:49.757' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'58bc4cd1-6000-4973-b917-8d2ba28a9137', CAST(N'2015-07-30T23:13:29.697' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a70ed0bb-b125-47ba-bc41-8d5c6326f497', CAST(N'2015-08-13T10:01:00.920' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0399a050-2716-458d-9d7b-8d61abb8f7e1', CAST(N'2015-07-30T10:43:18.503' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'145d6399-7e5b-45da-b833-8d6e1ab07475', CAST(N'2015-07-30T10:49:43.830' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1964d7e-02b3-4a2c-84f4-8d7d9bc4eb2e', CAST(N'2015-10-14T16:11:24.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c98868c2-5d3f-4073-a9e4-8d844df8f7ed', CAST(N'2015-07-31T00:25:58.587' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ff22c3db-9829-4477-877e-8d9b7c690eed', CAST(N'2015-10-14T16:12:50.320' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'03a0ba86-2663-4539-b4ca-8d9c62f13493', CAST(N'2015-07-30T22:20:28.140' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd3f2f2d7-7645-4c16-a594-8da0e236d2d7', CAST(N'2015-10-15T11:21:13.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2fce16af-e0be-419b-a622-8da97d8bf76f', CAST(N'2015-07-31T00:20:06.077' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1bf75984-002a-4f1c-9b99-8db1e35cdb86', CAST(N'2015-07-30T10:38:49.547' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b9b5365e-166e-4142-a90e-8db6fcf2cc0b', CAST(N'2015-07-30T10:55:29.457' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fbd70751-ec46-40c1-97df-8dc0d076d512', CAST(N'2015-07-30T23:27:40.900' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'49998156-524c-4f89-b252-8dd3d364cc1a', CAST(N'2015-08-13T10:08:12.890' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4fa45e6-9be6-497b-a10f-8e0889e76dea', CAST(N'2015-07-30T10:38:29.580' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'36fb6d54-f7fd-40ba-8e40-8e21a3b2e87d', CAST(N'2015-07-31T00:24:03.983' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac8feefb-3ae2-44a1-92c1-8e5687237a5f', CAST(N'2015-07-30T22:21:14.413' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'373d9521-cb1b-40ce-8b33-8e6d10e79f4f', CAST(N'2015-07-30T23:10:26.383' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe229939-7666-42a3-86b7-8e774e196111', CAST(N'2015-10-14T16:06:14.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7cf77b8a-96e7-4495-aa7a-8e89b87ec47b', CAST(N'2015-07-30T10:43:49.030' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c8122b0-109c-49b3-9499-8ebdc582115a', CAST(N'2015-07-31T00:25:39.127' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ab2c94e7-0152-4a22-9c03-8edf0b4e7ef9', CAST(N'2015-07-30T23:16:55.067' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65dba9cb-f2d1-46f3-bf2b-8ef5a9d6d256', CAST(N'2015-07-30T23:11:11.920' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37f1e5ac-ab3c-4bf7-b37a-8ef607d86300', CAST(N'2015-07-30T23:30:31.120' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'820b81b5-d668-4d13-8835-8efe0b70201f', CAST(N'2015-07-30T23:32:51.293' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ceb3c602-9e8d-4516-bd48-8f05c250b68f', CAST(N'2015-07-31T00:25:24.107' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef33eb22-8a71-46af-93e1-8f166d533574', CAST(N'2015-07-30T22:21:19.957' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7cddb1d7-5d58-4bc0-a46c-8f2ccad6788d', CAST(N'2015-07-31T00:19:34.390' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4301aa6d-546f-442c-82e8-8f4476e6c6f7', CAST(N'2015-07-30T10:43:31.533' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e04eae23-4814-4a04-8c47-8f8b3877cbdf', CAST(N'2015-07-30T10:44:28.943' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd21db8b3-8472-4ce7-b220-8fc3f15091d1', CAST(N'2015-07-30T22:23:19.450' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'535bc2db-a5f3-4532-932d-8fe3611db81d', CAST(N'2015-07-30T23:26:45.783' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'23261148-5663-4c3a-86ba-9024b9c2985d', CAST(N'2015-07-30T22:42:33.093' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3f9eb66-da15-4cc6-982e-902a8fd91184', CAST(N'2015-07-30T23:34:23.330' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbb6a976-e757-4535-858a-902cd979f2a6', CAST(N'2015-07-31T00:27:02.577' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65ec0e33-93c1-4e74-aa15-9044018ff7e4', CAST(N'2015-07-30T23:21:15.343' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9426994d-6d8b-441e-9121-9096cb99c3da', CAST(N'2015-07-30T22:23:59.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'436125d2-1806-4684-aabc-90ad865e476c', CAST(N'2015-10-15T11:24:02.540' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'43f2d312-7ecc-4440-9025-90c83564f3ee', CAST(N'2015-08-13T10:10:03.683' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a6cb4668-0e65-48a6-9bf7-90d5283c823c', CAST(N'2015-07-30T10:44:13.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e0a8aa1-a006-436d-a72d-90dd38a30569', CAST(N'2015-07-31T00:25:02.797' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b68fdba0-7088-4807-a0ee-90e789c6e8b0', CAST(N'2015-07-30T22:44:24.890' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99a33775-6232-422f-bc8f-90fb375f3105', CAST(N'2015-07-30T22:18:06.963' AS DateTime), N'admin', N'::1', N'Account', N'DelUser', N'id=c1a491db-3f4f-4ee2-aa57-a999f8d1441b,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1fa0f70d-626a-4bb6-9c25-90fcfa7e2d31', CAST(N'2015-07-30T23:12:56.830' AS DateTime), N'jskkz', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6aaba76-a2a9-4535-b2cc-9143b35550dc', CAST(N'2015-07-30T23:26:40.780' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ed695ae7-5d9b-4ec4-8cff-914719832748', CAST(N'2015-10-15T11:24:02.547' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ffd310a1-1f19-4e25-84f8-9148a6c8e1c0', CAST(N'2015-10-15T11:21:03.323' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'098a14b2-d2a8-40e2-927f-9227d4686a61', CAST(N'2015-07-31T00:17:24.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe7069fe-4f2c-4024-8506-92809c5013cf', CAST(N'2015-07-30T22:23:14.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd1908667-345e-4690-8b8a-928d60c4a8ff', CAST(N'2015-07-30T23:10:17.377' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd46d8b58-0d8f-4d8c-b8e1-9293f7a9913b', CAST(N'2015-07-30T22:31:14.453' AS DateTime), N'jskkz', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4b6d377-2644-4afa-92fd-92cdb10f0d33', CAST(N'2015-10-15T11:19:50.277' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0e077ff0-5269-427c-85c6-92d47e64c9e5', CAST(N'2015-07-30T10:44:34.433' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4616b48f-4e23-40c3-89ca-92eff4426f1a', CAST(N'2015-07-30T23:15:44.927' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b6ae2e90-35a4-485e-8a6b-92fe199e2594', CAST(N'2015-10-14T16:07:45.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'43dc7dd8-fa0f-4d8a-90a6-9309afc22b9e', CAST(N'2015-07-30T10:56:29.200' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a08d7bcc-ba3e-40c4-9dea-932368539452', CAST(N'2015-07-31T00:25:02.210' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6cde5067-c7c6-4d44-8a04-935163239d16', CAST(N'2015-07-30T10:42:19.107' AS DateTime), N'admin', N'::1', N'Account', N'EditUser', N'Id=101a7b4f-a532-4503-8a81-e4524e294fe9,TrueName=领导,Order=3,Job=公司领导,Mobile=,PhoneNumber=,Email=,OrganizationID=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ccb5b860-ae3a-435a-bd2a-936c9bdac3d5', CAST(N'2015-07-30T22:43:24.557' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'98bf2c68-5b9e-43dc-9ca3-939fd35d4878', CAST(N'2015-07-30T10:49:51.090' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1cd5f421-f342-4b34-84db-93c3fcaebcd3', CAST(N'2015-08-13T10:09:12.327' AS DateTime), N'admin', N'::1', N'DataDict', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'150d62b3-c19e-4b64-a7b4-93fc2248a424', CAST(N'2015-07-30T22:19:06.933' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=6,orgName=办公室,orgShortName=办公室,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5232aa07-22f3-4cc3-880b-94751d3b3852', CAST(N'2015-07-30T23:15:09.860' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad1e476f-a130-4983-9ccd-94881abb5e90', CAST(N'2015-08-13T10:00:25.100' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3af91a7-8e1d-4d08-b357-9489a9415156', CAST(N'2015-07-30T22:42:10.907' AS DateTime), N'admin', N'::1', N'ItService', N'DelWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b01c9ff5-53a1-4f78-bd9b-94980046e083', CAST(N'2015-07-30T10:49:08.137' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'95152026-c55c-482c-ad13-94e856d73f1f', CAST(N'2015-07-30T10:54:19.500' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a017ca50-20b5-42da-be0d-950b82acd55f', CAST(N'2015-08-13T10:08:24.510' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f7045102-ac8d-4e37-b34a-951bbe6e59e4', CAST(N'2015-07-30T23:09:51.343' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'24a42233-6930-4d03-9344-951e298524c0', CAST(N'2015-10-14T16:06:39.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'662c62e9-5db7-401c-9260-9524e8e71248', CAST(N'2015-07-31T00:16:47.303' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c84fb94a-5161-4b38-9b96-95273d754f35', CAST(N'2015-10-14T16:08:14.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ad89063-3d9d-4ec3-87c3-952828b604c2', CAST(N'2015-07-30T22:18:00.257' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'97b4c4fc-0c30-4ae5-8d73-952f8412761d', CAST(N'2015-10-14T16:04:25.030' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'968fc6bf-8273-49fb-860f-9578bbf04eaf', CAST(N'2015-07-30T22:40:35.457' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'84575a94-3503-4591-832c-959ba641964d', CAST(N'2015-07-30T10:43:24.130' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'585dad65-4e43-4e42-92c2-95bac73c4414', CAST(N'2015-07-30T23:09:58.870' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c0c31de1-fe97-4775-b788-95d6597500da', CAST(N'2015-07-30T10:38:57.153' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c4f59266-3e80-48db-8b64-96220b90ad5f', CAST(N'2015-10-14T16:06:29.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e05a43e2-8075-46e1-a74f-962881dba220', CAST(N'2015-07-30T23:27:10.817' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'391c8c7a-607a-421c-8501-962c1517943e', CAST(N'2015-10-14T16:04:41.873' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55df9f2e-b24b-458b-a4c6-9651f8cf5964', CAST(N'2015-08-13T10:12:16.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9ecb4ba5-195b-4787-a045-96572d6ef377', CAST(N'2015-07-30T10:49:06.983' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b6cddf5e-cd86-4b9e-a0f4-968fe4398eec', CAST(N'2015-10-14T16:04:42.087' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b5dca9c1-054d-460f-94fe-9693183837bf', CAST(N'2015-10-14T16:05:24.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1f723fc-6a0c-49e6-b446-96a755bd3a4d', CAST(N'2015-10-15T11:22:22.993' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'516bd284-7a97-447a-8d75-96d24648c860', CAST(N'2015-07-30T10:40:32.067' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da316086-e132-45b0-b8ce-96de54d192c1', CAST(N'2015-07-30T22:28:42.583' AS DateTime), N'admin', N'127.0.0.1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7ee31605-5f6e-4064-9b4f-96ebe554da60', CAST(N'2015-07-30T23:36:28.460' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a3150b3c-fb41-4989-b957-96f94ef6866f', CAST(N'2015-07-31T00:18:29.307' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65c3cf33-aabc-4ef2-abbd-970a4313de1d', CAST(N'2015-07-31T00:19:49.513' AS DateTime), N'admin', N'::1', N'ItService', N'DrafterToNextState', N'ID=0,Title=test,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=康熙,applicantPhone=3333333,applicant_dept=4,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=a365c4b7-0bb2-46a0-a84e-ac04655646ac,NextLink=向信息中心提交申请,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1401f328-59dd-4a0e-a9a6-974c8a7bdb12', CAST(N'2015-07-30T22:44:08.543' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e755fa57-8da5-40f5-834a-977fc4be2996', CAST(N'2015-07-30T10:44:31.023' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd1fded40-8f19-487e-8868-97b291eb9488', CAST(N'2015-07-31T00:17:34.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'12cd1c1c-75a7-4bbd-9392-97b816428274', CAST(N'2015-07-30T23:11:11.417' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'063a64c8-5aad-4b1e-8a66-97dfb20dc18e', CAST(N'2015-07-30T10:57:18.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d6c3216-3f54-4ed9-8565-97f6ede893ba', CAST(N'2015-10-15T11:20:15.177' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f9685ae0-59ae-4d22-8fd6-980286066de9', CAST(N'2015-07-30T10:41:17.370' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a711cf4b-7d04-490c-a05a-9846db9a496e', CAST(N'2015-07-31T00:22:17.363' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65723407-2cea-4562-bb83-98487eebaece', CAST(N'2015-07-30T23:08:42.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa148af6-95ff-4914-aa72-989c3bbaec5b', CAST(N'2015-07-30T22:31:51.303' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'126d7217-2ab7-4809-b16b-98e33e7d510d', CAST(N'2015-07-30T10:53:44.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'527b39f7-03b9-46d8-9fe0-98f7e92b0cdb', CAST(N'2015-07-30T10:40:31.557' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'345982b9-d5f9-4c70-8016-991787d48dde', CAST(N'2015-07-30T23:11:31.473' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7fea9829-b4bb-4956-a777-992fc78fe6cd', CAST(N'2015-10-14T16:05:18.887' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8996a15-ff48-431e-911a-9947620d5899', CAST(N'2015-07-30T23:12:57.347' AS DateTime), N'jskkz', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7ef2e95-25c4-42ad-9d9c-995705ebeb78', CAST(N'2015-07-30T22:42:02.833' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2477b632-ffff-4171-a5ef-9959c596bf75', CAST(N'2015-10-14T16:05:00.710' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'00f0b652-8080-4a9a-bf1f-99953d190f7d', CAST(N'2015-07-30T23:13:44.710' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5adabfa4-2c9a-4de2-a998-9997684a1bff', CAST(N'2015-08-13T10:12:11.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e85cbf2f-21b1-4460-bc92-999ab5ff2b3c', CAST(N'2015-07-31T00:24:44.043' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'762d19c5-550f-473c-85e9-99a6b5989136', CAST(N'2015-07-30T22:42:37.343' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4adda0ee-20d4-4ea9-b6e2-99e46f0fbeec', CAST(N'2015-10-15T11:19:31.553' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8991a82b-750e-4510-9775-99f97379085d', CAST(N'2015-07-30T10:42:57.880' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'633f4e30-5142-40b4-af13-99fcb5f8b9af', CAST(N'2015-07-31T00:24:39.050' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'04fd7805-5ec4-45b9-87dc-9a67be81c2f6', CAST(N'2015-08-13T10:12:56.290' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbe32e01-3555-4c4f-b67c-9a87da5133b3', CAST(N'2015-07-30T22:19:47.433' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'de289c80-2e19-466d-ab3a-9aa8acbb2782', CAST(N'2015-07-30T10:41:02.440' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56a6513f-58aa-4a50-a3ec-9ab43d1b98c4', CAST(N'2015-07-30T10:49:39.233' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'918601fd-2161-4b60-af74-9b129851b038', CAST(N'2015-10-14T16:12:04.290' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71ba4257-0354-49e3-b847-9b2c56d80ede', CAST(N'2015-08-13T10:04:41.607' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0b6e4a6-456a-4318-ba3a-9b33ae26dc3f', CAST(N'2015-10-15T11:23:22.987' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7c5dbf66-2692-4539-bbf5-9b37654c6f44', CAST(N'2015-07-30T23:25:00.617' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bb45753d-a836-463b-8f4d-9b3fa90c6e39', CAST(N'2015-07-30T23:23:55.550' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4144dd5d-80b9-403d-81a4-9b52da8f3802', CAST(N'2015-07-30T23:14:54.843' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ebb70579-49e4-4bf4-8f07-9b55b1776022', CAST(N'2015-07-31T00:18:54.360' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7b2c884-c19d-437e-9fe0-9b584948a977', CAST(N'2015-07-30T22:23:54.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9dde12b4-c71a-4191-ac37-9b5a755db014', CAST(N'2015-07-31T00:18:59.720' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'48253ce3-1119-4c33-98df-9b5f46461541', CAST(N'2015-07-30T23:24:55.617' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c7fd56d8-ed07-4649-9202-9b672fb71400', CAST(N'2015-07-30T22:45:07.880' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a208746-75ce-4919-97c9-9b679e16a325', CAST(N'2015-07-31T00:27:42.647' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66588bf7-bd49-4389-a53b-9b952c746af4', CAST(N'2015-07-31T00:16:29.160' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'817e6572-14a0-4b03-9a0e-9b9ea0465b01', CAST(N'2015-07-30T23:27:00.837' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6623af7b-bf5e-4dbf-8661-9ba533e28bf5', CAST(N'2015-07-31T00:19:44.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dddd6f9e-5ed8-4240-b8ff-9bc9ede88c77', CAST(N'2015-07-30T23:28:05.923' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'592d59b6-8282-4044-b317-9bdb02539434', CAST(N'2015-07-30T10:49:28.820' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9f79f6dc-1597-4bf9-9bd7-9bdb3c609f9d', CAST(N'2015-07-30T10:38:48.170' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1f6994b7-0515-43f1-9be4-9c1c9611136a', CAST(N'2015-10-15T11:20:42.823' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'84bfc148-840f-42df-ae82-9c435e3b189e', CAST(N'2015-07-30T22:42:36.810' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'01f6706e-8f0e-4499-8432-9c4d5ff45503', CAST(N'2015-07-30T22:43:15.290' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'943e7629-15c3-4338-839e-9c686c2ef984', CAST(N'2015-07-30T23:12:54.480' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'72624dd4-0a41-408d-96c9-9c938d48e3d9', CAST(N'2015-07-30T23:16:50.027' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0acd7065-0d4a-428f-a3d3-9c9403c87922', CAST(N'2015-07-30T10:42:20.007' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da177a53-ad1f-4dee-a8fc-9c98688e8957', CAST(N'2015-10-15T11:24:02.540' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2627d91b-86c3-4beb-83e0-9cabbf2996a2', CAST(N'2015-08-13T10:00:28.937' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5c2bdb2-ba42-447a-9eec-9d037941e97d', CAST(N'2015-10-14T16:06:40.257' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'077305a8-a000-407c-ae0a-9d0f4d7e03d1', CAST(N'2015-07-30T10:50:59.460' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd745068f-f080-4345-844f-9d181e4f907c', CAST(N'2015-07-30T23:37:28.567' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'04b50894-e409-4533-873e-9d272ee79e50', CAST(N'2015-07-31T00:25:34.110' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4712b2b5-b078-4933-b8d5-9d3d952b73f8', CAST(N'2015-07-30T10:50:46.933' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edb7bcbe-2dc5-4360-8305-9d49f4696143', CAST(N'2015-07-30T22:17:48.337' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cd6c3703-21dd-4eda-86ef-9d716716bae8', CAST(N'2015-07-30T23:32:06.207' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3fe60e9f-9b9c-4256-bd36-9d8b90733b0d', CAST(N'2015-07-30T10:38:50.190' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dec91660-74d4-40e2-90bb-9d8d351cc2b5', CAST(N'2015-07-30T22:40:35.133' AS DateTime), N'yunwei1', N'::1', N'ItService', N'GetPossiblePath', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4319789f-ab78-467d-b3e0-9d99e89eeadb', CAST(N'2015-07-30T23:30:06.077' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d859d6a-a452-4a28-9e0d-9db512ca08af', CAST(N'2015-07-30T22:21:09.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05e5a9dc-2fdd-4c37-9b73-9dcbf9848a17', CAST(N'2015-10-14T16:04:55.233' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a3784c47-1c9b-49b6-bfe7-9ddbaeb16108', CAST(N'2015-07-30T22:17:42.883' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'45a73988-b254-4ec0-a2d4-9ddbf0766d0e', CAST(N'2015-07-30T23:38:03.617' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'764c2ff4-05b6-429b-95dd-9e35ace3fa24', CAST(N'2015-07-31T00:20:20.900' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=a365c4b7-0bb2-46a0-a84e-ac04655646ac,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'89d2445e-21cb-4d72-b90b-9e445696c2e8', CAST(N'2015-07-31T00:27:05.850' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20a52fe2-ac70-4939-90b9-9e5be2624533', CAST(N'2015-07-30T22:30:12.390' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62866321-bc5e-4208-a11b-9e88272a1115', CAST(N'2015-07-30T22:23:24.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a662e311-4404-4a6d-b300-9ec2c4d414f6', CAST(N'2015-07-30T22:21:21.133' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d9c255d-9df8-440f-9956-9f3315c65d08', CAST(N'2015-10-14T16:10:19.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0d15701d-9e45-4cb0-8e43-9f58b3d44998', CAST(N'2015-07-30T22:22:06.837' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0741877b-356f-4e2a-a726-9f8282bffe80', CAST(N'2015-07-30T22:22:49.430' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0433e5fe-1411-4b05-ad24-9f9380ef5180', CAST(N'2015-10-14T16:12:00.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e797fa3f-386d-4e3a-a2cc-9f96d1f32b8c', CAST(N'2015-07-30T22:42:36.300' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a2c11d2-d722-49e4-91fe-9fb3cad679ed', CAST(N'2015-07-30T23:10:21.400' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ee336b0f-c176-4ce9-91ed-9fd310677eac', CAST(N'2015-07-30T10:44:44.620' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'698008ab-3d60-4def-b442-9ff16729defa', CAST(N'2015-07-30T10:48:58.837' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4fa7f7e9-44ca-445f-9e47-9ff30043f57b', CAST(N'2015-10-14T16:04:46.103' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e9eefe58-2dd5-473d-9858-9ff6e8ac1e72', CAST(N'2015-07-30T22:18:29.007' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60f9eb45-9539-46d9-aa8c-9ff8ac83e63c', CAST(N'2015-07-30T23:11:10.907' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd358a2f1-4af8-4c7a-85d4-a0168fff27b3', CAST(N'2015-07-30T23:08:06.550' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9641b90c-bf1c-4af1-bce5-a050d72b467f', CAST(N'2015-07-30T23:19:50.190' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1bd6b676-c41a-4503-9fef-a0690dbc6660', CAST(N'2015-07-30T23:10:31.363' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6f3f5db8-c5fd-48ca-9e6f-a0a4a988321f', CAST(N'2015-07-31T00:23:38.843' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2b3d64c-6aad-466a-afa0-a0ac88e14120', CAST(N'2015-07-30T10:41:53.413' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b7e78728-a64a-479c-afbf-a0ae470fb924', CAST(N'2015-08-13T10:10:04.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'be0cffbe-9139-4e2e-8d3b-a0c606b0d65c', CAST(N'2015-07-30T10:44:01.457' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c9ad22c3-eda9-43f9-b2e0-a0d76e9fdab4', CAST(N'2015-07-30T10:38:16.220' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'61405850-d42d-4b1a-9ff2-a0da13c9b394', CAST(N'2015-07-30T23:20:40.307' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15663317-4ab6-4ea0-9fee-a0e5079084fa', CAST(N'2015-07-30T22:27:56.040' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b429d699-ea77-4529-b0d5-a0f935fa173b', CAST(N'2015-07-30T23:11:33.067' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1142dcc4-14a0-4532-95bb-a14f2fa4c3c2', CAST(N'2015-08-13T10:10:05.860' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20050fa8-fed8-4c6e-8ebe-a1796efacd6c', CAST(N'2015-07-30T23:20:25.273' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'695fe44b-2d79-4fa0-b75b-a18d9ec26b7f', CAST(N'2015-07-30T22:18:18.777' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a999220-6298-4ead-a61b-a19b4017bd18', CAST(N'2015-07-30T10:49:54.980' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2f598f65-4c31-4fd8-8444-a1a357b2bc9c', CAST(N'2015-07-30T10:55:49.373' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4b952fe9-66bb-4490-8f5b-a1f28e7ddc77', CAST(N'2015-07-30T22:42:13.563' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a240c22-fc1b-4cab-9da4-a2287bfbd763', CAST(N'2015-07-31T00:27:12.623' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a3ab136-f5a7-4d5e-9b5d-a231e50999f5', CAST(N'2015-07-31T00:26:42.573' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'88077b17-27b1-4868-aa12-a269dd1c7514', CAST(N'2015-07-30T10:39:17.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'402cfb43-2d11-46b4-a958-a2afa60ec64c', CAST(N'2015-07-30T22:43:58.883' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3970dea-08d2-45ef-973e-a2c4f0870f46', CAST(N'2015-07-30T23:38:18.650' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18186141-90d8-4dd1-b31b-a2d42bda98a2', CAST(N'2015-07-31T00:20:28.797' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8d7b04e8-6101-459b-bb94-a2e61c58dd01', CAST(N'2015-07-30T23:21:55.407' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd1222217-1290-4d6c-acc8-a2f5159e55e1', CAST(N'2015-07-30T23:16:30.043' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'82b6bce7-9cc1-45aa-8803-a31008325274', CAST(N'2015-07-30T23:17:50.070' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe79f116-502c-4638-8423-a319fa7dcecc', CAST(N'2015-07-30T22:28:42.583' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd04fc850-09eb-4004-94ff-a31b2570da52', CAST(N'2015-07-30T22:19:47.383' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'695617c7-c69d-40d1-8a21-a31e2ebe8662', CAST(N'2015-07-31T00:26:04.147' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73d80e60-60bc-4e73-b151-a337033bb88e', CAST(N'2015-07-30T23:18:15.067' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'207bd975-351f-419b-aa26-a33791ed74ca', CAST(N'2015-07-30T10:42:28.490' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5e70e1f5-4dac-41f8-8b5f-a3400b639cf8', CAST(N'2015-07-30T22:20:14.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'795b02f8-a7d8-4133-98f0-a343047427ee', CAST(N'2015-07-31T00:16:59.210' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'100fd91c-b098-4393-ac6e-a37cf0ebb1de', CAST(N'2015-07-30T10:54:34.500' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99e52ab8-2d37-487a-8003-a3995c3d859b', CAST(N'2015-10-15T11:22:27.990' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1bef22d-d648-4cb8-9034-a3cac09751cf', CAST(N'2015-07-30T22:23:09.433' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55fd0a26-07c1-4e5c-9bb0-a3ecd13c1a31', CAST(N'2015-10-15T11:22:42.997' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62230ef7-c06e-475b-bff1-a3ee6ca3a3a8', CAST(N'2015-07-31T00:18:05.547' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'19c89be5-011c-4958-98a1-a40023e9f700', CAST(N'2015-07-30T23:23:25.517' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'483ba496-cbaa-44e8-8ff8-a401b3281ba7', CAST(N'2015-07-30T23:37:53.610' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'725760d9-11d7-4c8d-9093-a430bb9f3398', CAST(N'2015-07-30T10:43:13.860' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dcb509de-90d6-425b-9527-a45916d79c2f', CAST(N'2015-07-30T23:00:08.703' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da908711-f1d6-4b60-8306-a46d419568e4', CAST(N'2015-10-14T16:12:30.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9405b514-d397-4339-8723-a47602312b45', CAST(N'2015-07-31T00:24:08.997' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'615c4788-a32b-43c5-84b2-a48128220a6e', CAST(N'2015-07-30T22:30:19.013' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b710b668-e0cf-4b55-81e2-a48e696c512e', CAST(N'2015-07-30T22:21:24.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'669e0701-6310-4c5c-afbe-a4c6148b1cdc', CAST(N'2015-10-15T11:19:10.760' AS DateTime), N'admin', N'::1', N'DataDict', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bff6f82b-eb24-46fd-9ea6-a4d1435364a0', CAST(N'2015-07-30T10:57:09.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6b2fc97a-139c-49bc-9a82-a4d1802192c8', CAST(N'2015-07-31T00:16:48.057' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0ceef56f-ad96-49bf-accc-a4f4b7f1f891', CAST(N'2015-07-30T23:29:20.990' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6fe549ae-8643-494d-a105-a5201f1e834e', CAST(N'2015-08-13T10:11:06.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'660229fa-fba1-4b53-a706-a52c131a760c', CAST(N'2015-08-13T10:10:04.127' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'92d6d12c-e4c4-48d1-b281-a556e93519c2', CAST(N'2015-07-30T23:39:18.767' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71392e40-f80c-4f8e-ba46-a59920c4eea7', CAST(N'2015-10-14T16:04:34.323' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'028354b2-1c26-46e9-8843-a5b8c331c83e', CAST(N'2015-07-30T23:13:14.673' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b95f1d8f-1eb9-40e5-bfde-a5cc6541d11b', CAST(N'2015-07-30T23:39:48.770' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1c037b00-814d-467c-9e24-a5cf2a6811d1', CAST(N'2015-10-14T16:12:25.320' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2ae2f3c1-addf-4cbf-919b-a5d35b7516fa', CAST(N'2015-07-30T22:19:14.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7fb83fcf-db19-4143-a9b1-a5eeec789ae6', CAST(N'2015-10-15T11:20:58.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac966c72-731f-4b4e-b918-a616a5dc5557', CAST(N'2015-07-31T00:27:06.447' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c841bdc-5da1-4c47-8f09-a6212d14601d', CAST(N'2015-07-30T22:43:28.033' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b17db1e-4f18-4303-8ecf-a64f36c17f26', CAST(N'2015-07-30T23:25:30.707' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac0bb2f0-5a61-4054-b69e-a650816efcba', CAST(N'2015-08-13T10:12:41.787' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f282abf8-f96a-48d4-9a88-a66d2f428a6a', CAST(N'2015-07-30T23:29:46.043' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8dbc2be1-d7fe-465d-a4e9-a6c157d8a7f8', CAST(N'2015-07-30T22:18:07.090' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7899e63d-c554-4730-b570-a6d38638b5f4', CAST(N'2015-07-31T00:27:08.127' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'90ddea71-5d12-408d-9b70-a6e3ee56cf16', CAST(N'2015-07-30T10:40:27.587' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1e7ef36-95e1-4c52-8b1e-a6e643cedda7', CAST(N'2015-07-30T22:22:44.443' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'912d59bb-fa65-4aae-a129-a751f745a0b0', CAST(N'2015-07-30T22:43:41.197' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1f06b6fa-492b-4ceb-a35a-a7d04165480d', CAST(N'2015-08-13T10:13:06.303' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4271552e-05ba-400e-9331-a7d4c9cd9e4c', CAST(N'2015-07-30T22:20:44.050' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e3909367-08e4-4ebe-8f33-a7e2fa9cfbd9', CAST(N'2015-07-30T22:30:51.513' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'27e0b3ea-7492-469a-9d82-a827266e78fe', CAST(N'2015-07-30T23:24:30.597' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4c6ebab2-4622-4e9f-8e74-a82898628e9e', CAST(N'2015-07-30T10:49:54.383' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'35787331-59ef-442f-b6bf-a82d89e84d8a', CAST(N'2015-10-14T16:05:20.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5500fb51-76d4-4319-bb22-a850a191d190', CAST(N'2015-08-13T10:12:56.847' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4b9ea1a5-1856-4e74-83fd-a8636c2f0bc3', CAST(N'2015-08-13T10:11:11.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a198c741-f8bd-458c-a9b9-a86c195b4fb5', CAST(N'2015-07-30T11:02:09.703' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a030422-0558-4ab4-b9d5-a88567eef147', CAST(N'2015-07-30T22:29:45.130' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b778d0e7-edd5-442d-a7a2-a886e3640f26', CAST(N'2015-08-13T10:12:01.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7ce433b-4be9-4893-bc2b-a898c365e937', CAST(N'2015-10-14T16:07:49.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0cf2b4d6-7bed-4944-a345-a8b401eea2d7', CAST(N'2015-07-30T22:20:29.393' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e57d7579-6764-4e2f-ae11-a8d54d453c14', CAST(N'2015-08-13T10:10:56.233' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'004672fe-3165-484d-ac69-a9038ccb6dad', CAST(N'2015-08-13T10:09:05.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a42c1f4-5ff8-4bf4-b0cc-a930a7e1a28c', CAST(N'2015-10-15T11:20:19.523' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd05ed21d-af47-4e48-8fb6-a937a6e8d6eb', CAST(N'2015-08-13T10:10:04.720' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'403daa24-b65c-4309-b2f9-a9538695845b', CAST(N'2015-07-31T00:19:00.350' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'75385a34-1056-4807-b5d1-a968a431804b', CAST(N'2015-07-30T10:39:12.090' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5c0207f2-0e0e-418f-af9b-a981ff47811a', CAST(N'2015-07-30T23:10:12.300' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6bc6a9ed-57b2-4c57-8230-a9c8a10b4681', CAST(N'2015-07-30T10:48:50.827' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'afdf94ff-5bc6-4a62-bd93-a9e57d61633f', CAST(N'2015-07-30T22:40:28.043' AS DateTime), N'yunwei1', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'68c8284a-9ee7-4520-af28-a9f54ecd6888', CAST(N'2015-07-30T10:51:04.393' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4e08791a-b738-4425-a91b-aa057482e369', CAST(N'2015-07-31T00:21:13.907' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f99db582-7052-4005-b1cb-aa23c6ce2963', CAST(N'2015-08-13T10:09:05.077' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'23bf98ae-0bfb-406e-aa6c-aa338a4f868c', CAST(N'2015-07-31T00:16:46.143' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4c988675-b414-4277-b451-aa4060fe4992', CAST(N'2015-07-30T10:43:39.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aa43bc22-0f76-44ff-8f9f-aa492ad3eef7', CAST(N'2015-07-31T00:27:17.807' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2e3e0236-113e-4f5b-b481-aa561eb931ec', CAST(N'2015-07-31T00:25:23.707' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a2977ed5-4424-458c-97b9-aa5f00c34e18', CAST(N'2015-07-30T23:15:39.913' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3aa1b88-2c61-451a-9d08-aa7d018fca7b', CAST(N'2015-10-14T16:10:04.270' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2f25face-67d6-4b99-97dc-ab3852dc1425', CAST(N'2015-07-30T22:22:54.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56dd5b18-4cb1-4fc7-a227-ab39f3d743f4', CAST(N'2015-07-30T23:29:41.040' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3688a5fb-24bb-4bf3-991a-ab837fba259d', CAST(N'2015-07-31T00:26:32.530' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca3662ac-a339-4e59-9e76-abbe475f1be9', CAST(N'2015-07-30T22:29:45.067' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1c7127f-4f36-4f45-a585-abd23bf53d97', CAST(N'2015-07-30T23:13:59.763' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73f7b57a-d434-4bc2-820a-ac2ee14e0b0c', CAST(N'2015-10-14T16:04:36.587' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2b235ad2-39dc-49cd-8550-ac30be20176c', CAST(N'2015-07-30T23:40:08.820' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3fc645d1-f635-4cf2-95f3-ac74f532f637', CAST(N'2015-10-15T11:21:06.203' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0982d1fd-7b3f-45ff-a84d-ac7d64f09b9a', CAST(N'2015-07-30T22:42:34.977' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef85d253-f87a-46eb-9308-aca502c3cb23', CAST(N'2015-08-13T10:10:04.347' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'564916c7-dc79-4461-beb5-acbd05e0f1de', CAST(N'2015-07-30T23:19:10.150' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'50da71b3-0916-4fd6-b575-acc5d19135fa', CAST(N'2015-07-30T10:39:03.727' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=1,orgName=财务部,orgShortName=财务部,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eb10042f-c089-442e-9ce2-ace5ebfb723e', CAST(N'2015-08-13T10:08:47.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6cae9460-93bc-4c3e-8932-ace9e301fda2', CAST(N'2015-07-31T00:21:18.883' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5628b3fe-1258-4698-acbd-ad3759283b08', CAST(N'2015-10-14T16:13:09.303' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'809ef7ca-c5d2-44d2-b5ee-ad37ba4239fe', CAST(N'2015-07-30T23:30:36.093' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8d1289b0-7645-4beb-82b6-ad5d83f35581', CAST(N'2015-10-15T11:19:03.653' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4005b1cd-d616-45eb-8ce1-ad666473f22f', CAST(N'2015-07-30T10:51:04.917' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56a3fa07-01bc-412b-b7be-ad690d51dc4f', CAST(N'2015-07-30T10:44:44.187' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b5b5026d-dffd-409a-aa62-ada9309ea61e', CAST(N'2015-07-31T00:16:46.060' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd797970f-52d0-40ab-8dbc-ae0e93cee865', CAST(N'2015-07-30T10:49:03.820' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1366ead7-d40f-4c4e-9bbc-ae133c1fc640', CAST(N'2015-07-30T22:19:59.387' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'11e7c070-b7fa-4f16-9bad-ae5a6bc752d3', CAST(N'2015-07-30T22:33:51.000' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a1da8513-9471-4df3-a795-ae6f63851bcd', CAST(N'2015-08-13T10:00:32.800' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1ab8389-c56f-4443-9a1f-ae7cbf5734c5', CAST(N'2015-07-31T00:18:58.673' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20962741-653c-4fa8-94f6-ae7ff7c3dad2', CAST(N'2015-08-13T10:12:51.300' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1667fb76-40fc-40e1-a2d4-aeb9df5d98e4', CAST(N'2015-07-30T23:18:45.130' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85a41621-f01c-4d65-a68b-aed8d09884a1', CAST(N'2015-08-13T10:10:56.767' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3361d55-306e-4475-911d-af4315abfeb8', CAST(N'2015-07-30T22:31:51.037' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1be29e0d-0d82-4184-8aba-af9af6266879', CAST(N'2015-07-31T00:25:23.783' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'39b1bb8c-addc-4b67-ad6d-afe970649fa4', CAST(N'2015-07-30T22:17:48.983' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a48f10e5-ecd4-4532-a583-affacf647ef3', CAST(N'2015-07-30T22:43:59.637' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'181b10a7-7bf7-494d-864e-b006aa693b25', CAST(N'2015-07-30T23:33:53.323' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a2cbda8-f04c-4edb-bf08-b00aeb84f126', CAST(N'2015-07-30T22:17:50.220' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'02215ccd-fa0c-4a90-b70a-b022266d2511', CAST(N'2015-07-30T10:43:30.447' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edef6e83-360e-42fb-97fc-b0258c906a84', CAST(N'2015-07-30T11:02:19.807' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7b4229d1-a839-4e39-b16e-b02ce04f06c3', CAST(N'2015-07-30T23:27:20.853' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'742a6efc-134a-4c2a-b4eb-b02dca66726a', CAST(N'2015-07-30T22:43:52.640' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b8ca7a9e-89e7-4256-8b4a-b05b672496c0', CAST(N'2015-07-31T00:19:55.987' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fc2d756b-43ee-4fbd-b6d8-b0954af3f158', CAST(N'2015-07-30T10:49:56.600' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3638e7a-30a3-492a-b587-b09ee5a3bc03', CAST(N'2015-07-30T23:21:00.330' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20784e9c-b337-4162-80bb-b0aa2abb7f5e', CAST(N'2015-07-30T10:41:32.290' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cd9247ef-341d-4f96-b382-b0abf6526189', CAST(N'2015-08-13T10:10:41.763' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e760ad5b-8e03-4025-8c42-b0b2ce73d50f', CAST(N'2015-07-30T23:33:01.293' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a8277c1b-7c0e-4a30-bfba-b0c9f58e0f73', CAST(N'2015-07-30T10:40:22.607' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7f13966-fbd8-4547-b63d-b0ebc5d76d39', CAST(N'2015-07-30T22:22:19.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c9da8e2f-ad6b-4fd2-92a1-b16792c26c14', CAST(N'2015-07-30T22:17:47.200' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c93c3ff-be74-40f0-9d54-b16ef3f6af03', CAST(N'2015-10-15T11:21:08.317' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc84b9eb-e097-49bc-be6d-b174c56c98ad', CAST(N'2015-08-13T10:08:23.347' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0242c8bb-9ae8-41c6-921e-b1813fc4b0f4', CAST(N'2015-08-13T10:04:52.867' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3979c56-930a-4f0f-bbf6-b1870350accb', CAST(N'2015-07-30T22:21:44.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'152d1744-14f3-4587-bd15-b1d9c4254504', CAST(N'2015-07-30T11:03:01.617' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4aa7bde8-aa5d-4cf0-8fc2-b1db4d730531', CAST(N'2015-07-30T10:56:24.220' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'169f676a-bd0c-4b44-8a6a-b1f74b02773d', CAST(N'2015-07-30T23:20:50.307' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ec3eaccc-1b45-47ac-83c3-b209d6d2a714', CAST(N'2015-07-30T22:21:29.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'14809e84-e029-481f-9f17-b2296ee3159e', CAST(N'2015-07-30T22:19:54.417' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'118dd567-7eed-409a-b1f7-b240ff7c0281', CAST(N'2015-08-13T10:00:39.320' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bd40f62d-2a27-4a3e-8d69-b24f00db266f', CAST(N'2015-07-30T23:36:48.480' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2dda28b2-603c-493b-8888-b25bbb35ebea', CAST(N'2015-07-30T23:19:45.183' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1ffc107-d814-4e91-a073-b270b3c33ef5', CAST(N'2015-07-30T10:41:52.203' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eda4f006-4913-41a6-ad62-b2887d415211', CAST(N'2015-07-30T22:22:59.430' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b0cdc546-2ac6-497d-a2e8-b28e816fe002', CAST(N'2015-07-30T11:02:21.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce658dc0-b4ed-4350-8fab-b3535b694a56', CAST(N'2015-07-30T10:51:02.163' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'542f62cb-26bd-48b9-8ce3-b3711e7c0969', CAST(N'2015-07-30T22:43:39.680' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e467ca60-af08-46fe-8d21-b3b904289a77', CAST(N'2015-07-31T00:24:19.007' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8eb9fcd-e3ed-496d-b59b-b3cb0ee6d737', CAST(N'2015-07-31T00:24:17.083' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c771a2e9-1b07-48b1-8f8f-b3d4d30b66e1', CAST(N'2015-07-30T10:50:31.093' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7989b66-2fef-4ff1-a02d-b3e72302a595', CAST(N'2015-07-30T22:20:52.770' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c238b092-1cd1-4ea1-b56c-b3ef66e1c3fe', CAST(N'2015-07-31T00:16:47.807' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6172688a-78a4-4f9c-8c92-b3fd0d1e9887', CAST(N'2015-07-30T10:38:49.913' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd50cd7c-3c55-404e-bfa7-b401b51afba3', CAST(N'2015-07-31T00:16:45.400' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0132a4f7-0ac7-4f32-b281-b4110bef9bf7', CAST(N'2015-07-30T23:11:21.433' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c110c8e-c9b5-4534-a751-b41c2c0cb333', CAST(N'2015-07-30T22:42:23.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'13be21b0-d729-475b-aa38-b4442c11c815', CAST(N'2015-10-14T16:09:04.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'72f01028-f1e5-46b5-8c28-b446df99b6bd', CAST(N'2015-07-30T23:27:35.897' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18791587-3ffe-4306-98e2-b45b77d1c8b4', CAST(N'2015-07-30T22:29:42.160' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ef41673-8282-4449-a2e7-b474e608daf9', CAST(N'2015-07-30T22:44:38.093' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7f7f8060-3e60-4cec-98ff-b48f6aea2a36', CAST(N'2015-10-14T16:13:15.323' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d7ea79d-4e68-4465-a76f-b4a7ccb827d5', CAST(N'2015-07-30T23:10:11.397' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65e112ba-ef1e-4ffb-b485-b4b6e2269cc0', CAST(N'2015-07-30T23:08:07.687' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'617bdd44-51c4-408d-a3bb-b4d1a6212ff4', CAST(N'2015-07-30T23:12:56.637' AS DateTime), N'jskkz', N'::1', N'ItService', N'GetPossiblePath', N'id=bc987e01-d1c0-459f-b224-1c33a08ea03f,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bf9b0df7-4fea-4110-8d48-b4d947487a0c', CAST(N'2015-10-14T16:10:29.273' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cadf8d25-5954-4eaf-8b0b-b4ef27cff373', CAST(N'2015-10-15T11:20:14.690' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c9c78792-6b1c-4ef9-9517-b528b9485d06', CAST(N'2015-07-30T22:20:54.037' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'179950b7-51fb-443e-806f-b52e6bdf4f34', CAST(N'2015-10-14T16:12:29.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8f509e2-121f-4adf-b8e2-b53380cceec9', CAST(N'2015-07-30T10:56:49.113' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76159e42-9e16-4959-8992-b5515963d626', CAST(N'2015-07-30T22:44:05.177' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c8d4722-0ed2-4fcb-a2aa-b5790e4ee489', CAST(N'2015-07-30T23:36:23.440' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'88462ff6-5d01-40f1-b877-b57bc628173a', CAST(N'2015-07-30T23:21:45.370' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'646293ab-83e4-4e58-a6e7-b58a28aeadd5', CAST(N'2015-08-13T10:12:36.797' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f8a5b9f5-07c1-4e1b-9569-b58e5d49a159', CAST(N'2015-07-30T10:41:12.390' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f814a331-6f00-4633-9da4-b59ad54f3e91', CAST(N'2015-08-13T10:12:46.797' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a8814d4b-16f7-4d36-b95d-b59cb7c4bea4', CAST(N'2015-07-30T10:50:23.853' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'57173b97-f1ef-40c2-af51-b5a30740ae22', CAST(N'2015-10-14T16:12:15.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15bbb81b-e259-4a5a-9642-b5fc62557c56', CAST(N'2015-07-30T23:38:28.647' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a1537d2-749f-42f5-99fb-b6056e34f4e0', CAST(N'2015-07-30T22:19:09.390' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'378f2f5f-1109-4115-bb64-b61636a81f8e', CAST(N'2015-07-30T23:00:10.877' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd7ec0714-7ba6-4786-b44e-b62c4f555ba5', CAST(N'2015-07-30T23:31:11.157' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aa5279de-a41b-4831-ac2c-b62eaaa180ab', CAST(N'2015-07-30T22:17:49.513' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a87b812-02a6-4bb4-8706-b6365fb38b8d', CAST(N'2015-07-31T00:26:21.870' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8dde9030-1615-4b9d-8f00-b63c8d7f9b92', CAST(N'2015-07-30T10:39:52.723' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1e3eca4-109b-48cc-80af-b647d868f98d', CAST(N'2015-07-30T23:09:58.127' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a26c4da0-38a1-4cba-8d35-b64dbcbf1364', CAST(N'2015-07-30T23:15:34.903' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c128b6e-1e87-4def-8700-b65814206d5e', CAST(N'2015-07-30T22:40:35.740' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37b476e2-7a86-4401-8d7d-b672fb37f983', CAST(N'2015-07-30T22:43:10.287' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c3c4d708-968a-4a9a-8415-b69bc058a914', CAST(N'2015-07-30T22:20:39.437' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aea61a19-60dd-4c67-a3c3-b6a2bc956dc8', CAST(N'2015-07-30T10:39:41.940' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd008cd07-c294-4d40-8b41-b6b91b2585ea', CAST(N'2015-07-30T11:01:44.967' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31979fd5-8164-4546-bad4-b6cdd81995a3', CAST(N'2015-08-13T10:00:35.930' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b92458de-6af5-476f-b5f4-b6f757735a3f', CAST(N'2015-07-31T00:16:23.957' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1652ea74-46bd-491d-985a-b6f8003e5eb9', CAST(N'2015-10-14T16:16:58.807' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8e1b00ea-6a7e-474e-b998-b71f054d66ff', CAST(N'2015-10-14T16:04:37.357' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5f84c131-042e-47d1-9d2c-b74a25b06978', CAST(N'2015-10-14T16:06:44.240' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'278c35f9-fe8f-441b-87cf-b74f41298ae8', CAST(N'2015-07-31T00:20:21.793' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1ad32713-21d6-4db4-913e-b754cafa0cd7', CAST(N'2015-07-31T00:23:57.400' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9ebfbc0a-b63f-49e0-aba6-b7912cbdcd1c', CAST(N'2015-07-30T22:43:02.777' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80906cd4-cd48-4519-aecb-b7be2f1b4a41', CAST(N'2015-07-30T22:43:00.653' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fc912dcb-2873-4453-a693-b7c95b178163', CAST(N'2015-10-14T16:05:09.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca7c8ed4-2961-421c-a8fa-b7e94d002d6c', CAST(N'2015-10-14T16:15:55.593' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'53d7bd65-de9e-421e-b933-b7fd2ac7b74a', CAST(N'2015-07-30T23:10:00.053' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a82e81e2-7ac4-460d-adc9-b7ff853f2666', CAST(N'2015-07-30T23:11:46.477' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4da67e0f-00c1-4b17-bb95-b8107ff703eb', CAST(N'2015-10-14T16:08:29.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1fba2990-c48a-469e-b7da-b829a65f1083', CAST(N'2015-08-13T10:12:06.797' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0795466-8907-494a-8009-b82febb53365', CAST(N'2015-07-30T23:34:18.323' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66c1b2c3-8076-4a46-b8c4-b8d8b3b01433', CAST(N'2015-07-30T23:11:41.480' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2eb09e7-d949-4bc1-ac55-b9058070e5ef', CAST(N'2015-07-30T22:42:19.890' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8ede12f4-2c0a-4c79-89a5-b939c79a4b5f', CAST(N'2015-07-30T22:42:08.097' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8ce6eba4-db97-40e7-a8cf-b96b76daf361', CAST(N'2015-07-30T10:38:27.843' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'69e32b5b-4a8a-4166-8d71-b972d48fff3a', CAST(N'2015-07-30T22:22:04.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'36efde4f-e086-44a6-ba46-b97806ee962f', CAST(N'2015-07-30T22:18:45.467' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56617c40-4263-428b-83c6-b9b54c0d6832', CAST(N'2015-08-13T10:11:16.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c0ca73b4-661f-4def-9ea3-b9b70c6b41c1', CAST(N'2015-10-15T11:19:32.100' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'34115435-434b-4665-9104-b9bd8b098f06', CAST(N'2015-07-30T22:43:03.367' AS DateTime), N'jskkz', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a976fd1c-d710-49b0-af3d-b9d39f49a034', CAST(N'2015-07-30T10:49:05.637' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e44ff4b8-03dc-4caa-90ac-b9e6dab4410f', CAST(N'2015-07-30T10:42:44.647' AS DateTime), N'admin', N'::1', N'Account', N'UsersToRole', N'user_ids=e0020b16-d342-4640-b702-5e43c350d72e,101a7b4f-a532-4503-8a81-e4524e294fe9,5fb7daef-5838-4b8f-8d3e-a925cb1304e2,c1a491db-3f4f-4ee2-aa57-a999f8d1441b,roleid=c6bf5dfd-990a-4a8e-9955-7ccab3db0099,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c49d173f-5a2b-4d90-9762-ba2589fb8b3b', CAST(N'2015-10-14T16:04:23.043' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efb7467f-1ac5-4373-bf53-ba3b26442ea1', CAST(N'2015-07-30T22:21:59.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cb799daf-bb85-437d-8e91-ba4ed13e6795', CAST(N'2015-07-30T23:27:30.960' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'119677d9-26c2-4b1f-8c1f-ba5bb756f56c', CAST(N'2015-10-14T16:08:24.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71830ac6-ff0b-42f4-a9bb-ba7392e777f8', CAST(N'2015-10-14T16:04:52.337' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8cb80595-8185-4964-a7d2-ba7b88ad50e9', CAST(N'2015-07-30T23:37:58.617' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2b759600-d303-47a1-8ec9-ba9717142711', CAST(N'2015-08-13T09:59:43.633' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e475faf1-d1f8-4d74-9f02-ba9dc5ccf07d', CAST(N'2015-07-30T22:42:40.403' AS DateTime), N'itgly', N'::1', N'ItService', N'GetPossiblePath', N'id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b2529bdb-d470-4e0e-b8a8-bab6d685601d', CAST(N'2015-07-31T00:19:22.700' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a440320-6654-4c9c-a9f5-bb2fed03078a', CAST(N'2015-07-30T10:38:52.180' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1cf208db-a133-45e0-8f20-bb3b9472487a', CAST(N'2015-10-14T16:06:05.267' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3498cb3b-75c6-47e9-bf31-bb5594b84b9d', CAST(N'2015-07-30T22:42:59.650' AS DateTime), N'jskkz', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4a3df2a2-fad1-4f4d-894f-bb56d3c0c23d', CAST(N'2015-10-14T16:11:05.330' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c6544fae-345c-4f23-b403-bb64bc44b3f0', CAST(N'2015-07-31T00:18:04.310' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'35e9fa7a-138f-4937-b0ac-bb6a141949de', CAST(N'2015-07-30T22:19:51.040' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db178872-0415-49fc-805f-bbe9b7656b6d', CAST(N'2015-10-15T11:22:28.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1155fe2-6b57-414f-b0aa-bc17292501b5', CAST(N'2015-07-30T23:12:37.150' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8472e59d-4faf-4ae8-8e57-bc2c28096779', CAST(N'2015-07-30T10:39:48.203' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad2bcc3e-46b1-4d59-b26b-bc3134d68be5', CAST(N'2015-10-14T16:15:55.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c794a976-f2bc-469e-89e2-bc71bd9d33e0', CAST(N'2015-10-14T16:04:59.063' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80f4529d-9ef5-4522-b804-bc98d018d423', CAST(N'2015-07-31T00:22:05.380' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'89610b23-e635-4ee7-922e-bc997d159895', CAST(N'2015-08-13T10:08:18.903' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d3a9a49-80f4-499c-9dd4-bce1c7681828', CAST(N'2015-07-30T10:43:59.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'66f3f7b3-19dc-4efb-abe1-bd2c029caf4d', CAST(N'2015-07-30T10:39:36.973' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bfcfe822-c94f-49ea-8f6a-bd3384177231', CAST(N'2015-07-30T23:26:25.777' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5717247c-f35f-4f5d-a7e3-bd6f7bfedad6', CAST(N'2015-07-30T23:35:18.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2cc9d2d-9b8c-40eb-834d-bd90428da484', CAST(N'2015-10-14T16:09:39.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4043003-95ce-4f42-99ef-bda5f75872c0', CAST(N'2015-10-14T16:12:55.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'731c56e9-ed29-40cc-a765-bdf8562c209b', CAST(N'2015-08-13T10:12:21.810' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e4fbac9-499a-4422-bbf0-be02a09c172f', CAST(N'2015-10-14T16:06:55.277' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79a582a4-2bae-430a-af0a-be241b79398c', CAST(N'2015-07-31T00:18:14.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0fb75596-6d9c-4693-b2d2-be2497cb5fe1', CAST(N'2015-07-31T00:21:49.373' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd0743dcb-0ed0-44c0-9254-be372209b9a0', CAST(N'2015-07-30T22:43:38.473' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'528a8b85-def5-4b6f-b702-be40c0202e6a', CAST(N'2015-07-30T22:22:54.447' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'51058ab3-761a-4a41-84a9-be528a4ec628', CAST(N'2015-07-30T22:17:59.660' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9050efa2-0566-4389-9234-be605fceae40', CAST(N'2015-07-30T23:17:45.050' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d12acd4-458e-4155-8b3f-be66800fbf33', CAST(N'2015-07-30T23:27:55.903' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'95980f8d-4ceb-4ef4-9af0-beb405948e73', CAST(N'2015-07-30T22:17:45.680' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17977584-c7d0-472a-a649-beb7e2b1a801', CAST(N'2015-07-30T11:02:46.427' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'366d763a-c704-4762-95e0-bec8e08a74cc', CAST(N'2015-07-30T22:28:42.583' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'467618ae-1803-411c-9f2e-bedc18b9f709', CAST(N'2015-07-30T22:23:19.093' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'88479d8f-16f3-4e4b-af14-bf1bcbf5b9fe', CAST(N'2015-07-30T23:32:36.257' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1524c88d-79ac-4e9b-b877-bf20d4ae8145', CAST(N'2015-07-30T10:58:52.783' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b42dfdfb-87f3-49cf-9725-bf20d721ca8b', CAST(N'2015-10-15T11:20:10.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f39ea7f0-2ad2-4dc2-ae7a-bf4059ff0cc8', CAST(N'2015-07-31T00:21:38.913' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70dcc926-c554-484b-9a01-bf7321abfe6d', CAST(N'2015-07-30T22:22:06.903' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'95d33f3a-e7b2-441d-aab3-bf7e4ff79da8', CAST(N'2015-08-13T10:08:31.977' AS DateTime), N'admin', N'::1', N'ItService', N'ItServiceList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'da4f28d3-c3ed-4c8d-bc07-bfbee3e0bae2', CAST(N'2015-10-14T16:11:39.283' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db4fb059-3ba8-461c-b392-bfdc812f5401', CAST(N'2015-07-30T10:38:26.073' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd333284b-a17b-4297-80f6-c01ca24f4ae3', CAST(N'2015-07-31T00:20:23.853' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a2574f13-80d4-4a61-82e9-c025815ecbd6', CAST(N'2015-07-31T00:20:21.733' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'07e90f7c-7b82-4190-a837-c04951a8baf8', CAST(N'2015-07-30T22:42:49.777' AS DateTime), N'itgly', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b13c16a-d73a-4a9f-83d2-c072a342b728', CAST(N'2015-07-30T23:28:50.943' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3725b7e-5545-4914-a656-c0748b260477', CAST(N'2015-10-14T16:10:25.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2ddbc47-4b86-4ed5-bef1-c098922455a6', CAST(N'2015-10-15T11:19:32.687' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f50374f9-8923-44f5-b8d5-c0e1788cc579', CAST(N'2015-07-30T22:31:13.873' AS DateTime), N'jskkz', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6e872820-f3bc-46fb-9d66-c118f6ba3af3', CAST(N'2015-07-30T22:36:03.710' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2f8ba14-32c3-496f-9f34-c1432146deb6', CAST(N'2015-07-30T22:44:33.267' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae86d826-a8a3-4b0c-939a-c1469608b9e2', CAST(N'2015-08-13T10:12:21.307' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c0a190dd-59c4-4c50-a5ae-c17fa476e29c', CAST(N'2015-07-30T23:22:05.427' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4dee4634-f4c9-4cb8-81f7-c18f70094c1d', CAST(N'2015-07-30T23:37:48.600' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'179ae2eb-4245-497f-9682-c1ab02a3f7f5', CAST(N'2015-10-14T16:08:55.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76aeb890-92b4-40e6-914c-c1b68371cfd2', CAST(N'2015-10-14T16:08:35.300' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a08c80b2-91a4-40d2-b51d-c1c9e94b5c86', CAST(N'2015-07-30T23:09:58.807' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f67ad382-d406-409b-a479-c1ca13907e3d', CAST(N'2015-07-31T00:26:22.150' AS DateTime), N'itgly', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05120503-533f-45fd-b7b0-c1dc4e73421a', CAST(N'2015-07-30T23:14:39.807' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6163bd8a-8fe2-42ce-9970-c1e29aac5a5d', CAST(N'2015-07-30T23:29:15.960' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd7e7985-697f-4a60-8dce-c1ee990ce273', CAST(N'2015-08-13T10:13:06.820' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e6a319ba-dad3-4422-b9e9-c2085d925362', CAST(N'2015-10-14T16:09:05.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c1d61c1-713c-4ee3-b77d-c22246eaba7e', CAST(N'2015-07-31T00:19:29.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'03f4948f-ba68-4a96-b353-c22299b6801c', CAST(N'2015-08-13T10:10:03.883' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'442aaef3-c07d-40d9-b361-c2918bbf0d5f', CAST(N'2015-07-30T23:28:45.957' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'826a7599-ca2c-4be6-85b7-c2a4a734b716', CAST(N'2015-07-30T10:56:19.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bcc9ce1d-2cbf-4369-a1db-c2e1d1ad7c93', CAST(N'2015-08-13T10:10:05.213' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b92bdac7-199b-4f8e-b7a2-c2eed149bfbd', CAST(N'2015-07-30T10:41:55.473' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd6f3513c-6dd7-45ab-9ab2-c2f3b38519ad', CAST(N'2015-08-13T10:00:40.927' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18b9976a-d843-483a-92cb-c3048304df38', CAST(N'2015-07-30T10:49:06.510' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cf06c716-67c6-4a41-a692-c317722f7814', CAST(N'2015-08-13T10:12:36.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d78ec00-a6d2-41b8-9124-c349da64e08b', CAST(N'2015-07-30T10:44:31.660' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'785ff2de-9d84-4f0f-af40-c360a0f27fac', CAST(N'2015-07-30T22:40:29.563' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c32a5d98-4f1f-425f-9752-c3971b726490', CAST(N'2015-08-13T10:12:11.797' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8cfcad71-251e-4382-a936-c3a5bc7a24d3', CAST(N'2015-08-13T10:10:04.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fcae7db8-025b-427a-82fc-c3af0a106738', CAST(N'2015-08-13T10:08:34.180' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e385d748-4dea-41cc-a34c-c3cd5dd88ed7', CAST(N'2015-07-30T10:43:17.127' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'42cd4301-207e-4f89-a2eb-c3dcc08fd161', CAST(N'2015-07-30T10:40:17.617' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'09e5fb15-9eb2-4b95-83f0-c3e5c6de9a28', CAST(N'2015-07-30T23:10:12.423' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'959c9036-d13a-4eaf-a35f-c41e9474fb78', CAST(N'2015-07-30T22:21:59.430' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2c343ae3-feb3-431a-8357-c41fd344f8ec', CAST(N'2015-07-30T22:21:14.833' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cf0caa63-d03f-43ea-bf16-c4aaba802b2e', CAST(N'2015-07-31T00:28:27.727' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bb92e34c-0b67-4ead-a4dc-c50fe9ec7492', CAST(N'2015-07-30T23:18:05.090' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'11710577-13c7-4f74-a7b7-c527293069fb', CAST(N'2015-08-13T10:00:33.247' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0ce8435-d9b1-4c4b-8408-c55218a2c685', CAST(N'2015-07-30T22:30:16.937' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'491a649c-e831-4237-81f3-c552cc47e037', CAST(N'2015-10-15T11:22:43.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1dae0989-df00-4165-901b-c55969d1f3b0', CAST(N'2015-07-30T22:43:40.523' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'08d4e59d-7685-44a4-9c7a-c5840de5c35a', CAST(N'2015-07-30T22:18:14.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9603afbe-30a6-468f-b5c6-c59ac2315c8d', CAST(N'2015-07-30T23:28:20.953' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79c8ddd9-9200-4b4a-81a1-c5aad372991a', CAST(N'2015-07-30T22:20:44.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'af10e786-9830-4436-ba4d-c6171c11f9a0', CAST(N'2015-10-15T11:22:33.323' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3520e316-3fe9-4d79-a0f1-c62a7217b053', CAST(N'2015-07-30T22:42:18.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac698838-b85e-4490-a4df-c681e907be13', CAST(N'2015-07-30T22:36:00.253' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1f14dbb7-8872-4437-949a-c69696f3ec90', CAST(N'2015-07-30T22:30:16.863' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8338781c-2a83-40c4-ac39-c6a0e120b2b8', CAST(N'2015-07-30T22:44:23.277' AS DateTime), N'admin', N'::1', N'Account', N'CreateRole', N'Id=,Name=运维管理员,Description=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce69e281-9967-4221-bf3a-c7254f2956b8', CAST(N'2015-10-14T16:05:01.203' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3208ffd4-095d-4c84-be75-c742802ea88c', CAST(N'2015-07-30T23:17:25.033' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37fe345f-afc8-40af-84b8-c75b992d04c8', CAST(N'2015-07-30T22:20:19.400' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a9337ea-63bc-465a-b102-c75c324c4f88', CAST(N'2015-07-30T22:30:45.207' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4d0653ef-89e6-470b-a3a7-c75d96e8d941', CAST(N'2015-07-30T23:20:20.263' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f06cc114-e81a-4eed-bd46-c7617eddfaac', CAST(N'2015-07-30T23:31:26.177' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad2dc421-c5be-4bd6-9177-c794f0d8dce8', CAST(N'2015-07-30T23:24:25.627' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0bfbe654-ffcf-4ffe-bf22-c7b608315624', CAST(N'2015-08-13T10:11:16.783' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd5c65d01-ee31-4833-b2b0-c7c332472267', CAST(N'2015-07-31T00:16:44.197' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c2c3e833-1305-4d8b-86b7-c7c520741436', CAST(N'2015-07-30T10:58:57.340' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1513f8d8-e0e9-45e2-9ad3-c7cbe5dda935', CAST(N'2015-07-30T23:37:03.530' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'02834c7e-dacd-4741-bb02-c7d830233320', CAST(N'2015-07-30T10:44:04.033' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a1da6fe-dc76-4d59-b368-c7dec3cbdb75', CAST(N'2015-07-30T10:53:38.870' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1501ce7-a35c-48c6-9ce3-c7ec89b70574', CAST(N'2015-10-14T16:10:20.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b273b154-9d38-4ca2-965c-c80073156f90', CAST(N'2015-07-30T10:42:29.043' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3cc320dc-bc69-4306-ace7-c80ae4837467', CAST(N'2015-07-30T23:22:20.457' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2ec77af8-61c3-4516-a825-c83fa57f27ae', CAST(N'2015-07-30T23:39:08.750' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f4d40355-9b35-4da4-905b-c84180652d18', CAST(N'2015-10-14T16:11:20.320' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cdd24320-4952-434a-87c6-c89ececeef50', CAST(N'2015-07-30T22:30:11.980' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bd1e744f-0abd-406a-8f8e-c8a27642e29b', CAST(N'2015-07-30T22:31:54.817' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbc3ee70-0c43-47ff-a6d9-c8ad102c7ec5', CAST(N'2015-07-30T22:44:35.223' AS DateTime), N'admin', N'::1', N'Account', N'MenuToRoleList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0c9a6ae7-c8d4-432f-965a-c8af8fea29ac', CAST(N'2015-07-30T23:14:09.790' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99d2680f-da34-4b24-b570-c8b39c5dbf9c', CAST(N'2015-07-31T00:18:06.173' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5641e03a-856e-43a3-b93d-c8bfb035ff62', CAST(N'2015-08-13T10:08:52.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0bc0e1bb-5324-4d0e-b15b-c8e5f2126503', CAST(N'2015-08-13T10:04:49.187' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05226c79-9e40-4e41-9338-c8f0c84c4b27', CAST(N'2015-07-30T23:25:20.693' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9b644adf-394c-48cb-a575-c910eb345b54', CAST(N'2015-07-31T00:23:58.053' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'32780ebc-ee25-4eff-bd4f-c912c55ea89c', CAST(N'2015-07-30T23:24:35.617' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37fc6094-5d93-464a-9576-c91452648af2', CAST(N'2015-10-14T16:05:49.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'693e8b6d-6f29-46f9-80db-c91af65d92c2', CAST(N'2015-07-30T10:50:58.933' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ead3378d-41a9-4af0-a746-c966f71dfbcf', CAST(N'2015-07-31T00:25:29.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5582aa27-45a0-461c-bb98-c9c09604ee05', CAST(N'2015-10-14T16:05:09.577' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7d9ef84c-01b3-4316-812d-c9cf66b738e9', CAST(N'2015-07-31T00:23:38.573' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd045bc63-f45d-49d7-bbaf-c9cf7c387325', CAST(N'2015-07-30T10:41:27.873' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7399d477-9fc6-4e53-a19a-ca457be9c467', CAST(N'2015-07-30T23:36:18.430' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a3f76c0-e7db-43dc-88a3-ca570962a051', CAST(N'2015-07-30T23:16:40.013' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8f86b5fb-3cbf-4c20-98da-ca82a34bb3f8', CAST(N'2015-07-31T00:25:54.160' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2a092c70-11d7-4476-8bdc-ca8c41bc423c', CAST(N'2015-07-30T10:54:09.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5669d949-994b-4a03-9e6f-caada42ba33c', CAST(N'2015-07-30T22:24:04.093' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'997592bb-2191-4cde-ae59-cabc471f13e1', CAST(N'2015-08-13T10:00:40.813' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5016f832-4347-4791-8a4d-cacce2f3948f', CAST(N'2015-07-30T22:30:45.833' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60c757ad-c0cc-4fa8-b4cf-cad2130c17c2', CAST(N'2015-08-13T10:00:20.643' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a42c6aa8-1f34-413e-98e2-caf8355816d8', CAST(N'2015-10-14T16:04:33.793' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ca5106a-f2c8-4da5-9bd5-cb065f467ec6', CAST(N'2015-07-30T23:12:47.867' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a741c8c-3c76-445f-a072-cb3d58430425', CAST(N'2015-07-30T10:39:37.137' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=1,orgName=公司领导,orgShortName=公司领导,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'18aaeb7e-a26c-4d8d-8fd7-cb5f0b424cb0', CAST(N'2015-07-30T22:35:59.350' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'45a31da4-3137-48bc-b893-cb60306cff16', CAST(N'2015-07-30T22:44:29.353' AS DateTime), N'admin', N'::1', N'Account', N'UsersToRole', N'user_ids=cd80af8a-696d-4880-a499-d515ca8d239d,roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1b72dd69-14f3-4b3e-aeab-cb89b8015e20', CAST(N'2015-07-30T23:10:17.170' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f55fcb0e-e6cf-42a7-87a1-cba0511dc725', CAST(N'2015-07-30T23:35:23.377' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3c66ed1a-ab98-4637-a52e-cbb815406744', CAST(N'2015-07-30T23:31:21.170' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3500a36e-a3a8-493a-8823-cbd7837e6371', CAST(N'2015-07-30T23:08:36.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edf9612a-d458-4d3b-8ce4-cbe9f83aa62f', CAST(N'2015-07-30T22:44:43.100' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'044d84e9-bbcd-48a6-9c9c-cc1fe8b8296a', CAST(N'2015-10-15T11:21:23.313' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ddd6aae1-cb84-4115-b0da-cc2431f120f8', CAST(N'2015-07-30T22:18:55.243' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'729bc086-8507-4e62-bc44-cc2b71659ed2', CAST(N'2015-08-13T10:10:11.777' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'20740a6c-66c9-48bd-864f-cc310032fd74', CAST(N'2015-10-14T16:04:54.637' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e15c2c1b-7be8-431e-a306-cc339106746e', CAST(N'2015-08-13T10:11:41.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e82811a7-d2af-49b1-b9e6-cc3ca9543c5a', CAST(N'2015-07-30T22:23:44.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'432e2936-32d6-4b4e-9fb3-cc62f90981a6', CAST(N'2015-07-30T23:23:30.517' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ff5949ff-b611-46bf-8d21-cc9ffdba06fc', CAST(N'2015-08-13T10:00:34.467' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c72f87d9-0b0f-4b96-8f77-ccad97bcba78', CAST(N'2015-07-30T10:44:22.217' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c31d50da-1fe4-4536-950e-cd0aa3e36296', CAST(N'2015-08-13T10:10:05.933' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9dda1ef8-be2c-4f74-8fc7-cd1a93b1fb70', CAST(N'2015-07-30T22:30:53.597' AS DateTime), N'itgly', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=技术科处理,Opinion=aaa,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc641363-1496-436b-b507-cd241e913b8a', CAST(N'2015-07-30T22:18:24.033' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbc247ae-b9c6-4cdc-ab0a-cd26508280b7', CAST(N'2015-07-30T10:57:13.993' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'491d1383-2da0-477a-bb77-cd5997b26396', CAST(N'2015-07-30T23:31:51.210' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'16bd89eb-2a9b-41b1-a257-cd61287b867a', CAST(N'2015-07-30T22:29:39.613' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'868e44ee-0af9-4cdc-a2f4-cd7602d505a7', CAST(N'2015-07-30T10:41:47.247' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd2ee9178-b770-49df-bc29-cd84d2400bd9', CAST(N'2015-07-30T10:44:44.077' AS DateTime), N'admin', N'::1', N'ItService', N'WorkFlowManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8c538ff0-9386-479b-b5a5-cd8ce8b43515', CAST(N'2015-07-30T10:40:28.157' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=user01,Password=abc123,ConfirmPassword=abc123,TrueName=预算科员工,Order=1,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fb587280-de47-4781-8328-cd9302f7ef24', CAST(N'2015-07-30T10:41:31.523' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8004f677-7526-48a5-90e4-cd97f74180dd', CAST(N'2015-07-30T22:17:47.437' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46a65012-eff8-49e6-93ec-cdca761b0ae1', CAST(N'2015-07-30T10:39:37.307' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5236eff3-da86-4de2-97f8-cdcff8877cc5', CAST(N'2015-07-30T10:54:39.507' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fd8b7814-e551-46a6-a93d-ce0bab9a71db', CAST(N'2015-07-30T22:23:39.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'af3f7c3f-41aa-46e3-85c4-ce4930b81e5b', CAST(N'2015-07-30T22:21:49.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dfe24c0b-7d9a-4f98-b80b-ce55ffcdbab6', CAST(N'2015-07-30T22:40:33.930' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'92b8592a-d275-4e81-b0ae-ce6165e51fec', CAST(N'2015-07-30T23:25:10.657' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'29314fa1-7ce9-43bf-9542-ce9ee76bbd50', CAST(N'2015-10-14T16:06:15.267' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8bc7d97c-48b2-498e-8f4f-cee6e291bd74', CAST(N'2015-07-30T23:15:54.943' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2531c928-5a2d-4f7b-9ced-cf19e4a1cac2', CAST(N'2015-08-13T10:11:36.770' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f2235db9-d0f1-4d01-ade2-cf3fea59f0f4', CAST(N'2015-08-13T10:12:01.787' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'38518088-864a-4727-a287-cfbccf865a2e', CAST(N'2015-07-31T00:16:39.177' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'05a8984c-2c2a-4746-950a-cfc078dda8f3', CAST(N'2015-07-30T22:21:54.413' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fc986e49-8e39-44c1-94ea-cfd9178b022a', CAST(N'2015-10-15T11:18:53.037' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'42817f44-a9f0-4a7d-8eb5-d0128d7ae91b', CAST(N'2015-07-30T23:09:21.317' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b220dff3-c889-4862-a306-d0266fd714ed', CAST(N'2015-07-30T10:40:52.477' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bc8eaeb2-9014-4782-a39d-d05c6541f059', CAST(N'2015-10-14T16:05:04.043' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'76facd30-a7a7-4132-84fe-d077d975377a', CAST(N'2015-07-30T10:43:54.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dde74e2e-f0f9-4f16-855c-d08fa74dba7e', CAST(N'2015-10-14T16:06:30.280' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'58bccb9d-681e-4511-bc36-d0966d5aea9d', CAST(N'2015-10-14T16:05:41.260' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cd815f7a-66a8-4eaf-b6f0-d0b43fd22237', CAST(N'2015-07-30T22:18:19.390' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6fa7083e-469a-41d4-ad30-d0e3502576c7', CAST(N'2015-07-30T22:20:59.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6bb59109-bc2f-410f-b71f-d0e451fabb4b', CAST(N'2015-10-14T16:07:19.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6942f753-ca9a-441f-9d6f-d12dbc7cf0d2', CAST(N'2015-07-30T10:38:29.847' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3272c783-61c7-47e4-966f-d14bfb004798', CAST(N'2015-07-30T10:49:33.837' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4194642e-8066-47ba-acbf-d15d15cf08b3', CAST(N'2015-07-30T22:20:34.020' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1954d47-b17f-4bd9-a9c1-d18442c15e59', CAST(N'2015-07-30T22:20:09.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4532e9ca-c515-46a9-8c49-d1876a48ef3d', CAST(N'2015-08-13T10:12:46.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ba22a1f-1c7e-45ef-9fc4-d191bd59719e', CAST(N'2015-10-14T16:11:44.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'01b482d9-3942-4b93-985e-d1965dcc4aac', CAST(N'2015-10-14T16:04:40.263' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a0c36c3b-2b82-48ca-a762-d1a5f59c979e', CAST(N'2015-10-15T11:20:22.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1fcb6701-b99b-4fab-945a-d1abb0f54e66', CAST(N'2015-07-30T22:23:14.443' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a0b588d-8867-435a-b56a-d1aed8f254a1', CAST(N'2015-10-14T16:08:04.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'82301fcf-32aa-4e09-a838-d1daf01953fa', CAST(N'2015-07-30T10:39:25.667' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8eabcbf0-81f0-400b-912d-d1e02e0f1d29', CAST(N'2015-07-30T23:12:44.333' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'076f6166-9722-4c14-96d6-d1f99f117517', CAST(N'2015-10-15T11:23:08.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe8b96d0-e95f-4382-8458-d2111b867fbc', CAST(N'2015-08-13T10:10:46.767' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8d5ebe52-ffdb-4730-8350-d21391a4e143', CAST(N'2015-10-14T16:05:19.693' AS DateTime), N'admin', N'::1', N'Account', N'menuTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'809b40e3-336b-4ab1-9dfe-d220cbec4fe2', CAST(N'2015-10-14T16:11:49.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9124f939-f4ba-4d5d-8cd3-d23fd269220e', CAST(N'2015-07-30T10:41:07.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59c61f0e-d9f1-43b6-87bd-d28decd43614', CAST(N'2015-07-30T23:36:13.397' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8cac29c9-417c-40d7-89e6-d2baff740eda', CAST(N'2015-10-14T16:05:14.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3b7b8a57-ab2a-499a-91ea-d2bd8c2f567a', CAST(N'2015-07-30T22:19:54.043' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ee308396-3384-4f1c-9092-d2ca3d30bde2', CAST(N'2015-07-30T22:31:22.273' AS DateTime), N'jskkz', N'::1', N'ItService', N'ToNextState', N'ID=1,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink= 运维1处理,Opinion=ca,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'afc31e47-35db-42a2-be40-d2dcb97544d9', CAST(N'2015-07-31T00:24:18.057' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'137934f6-df4d-4dd5-bd8e-d2de70337cb5', CAST(N'2015-07-30T22:33:48.143' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bb48dc94-df1d-4909-8df0-d2f4dd91e58a', CAST(N'2015-07-30T10:49:48.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'97273a38-2d6f-4b97-a2ad-d31f4540e427', CAST(N'2015-08-13T10:00:05.640' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cd28226b-da6f-49a1-8ca9-d326a61e6e97', CAST(N'2015-08-13T10:11:01.240' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'761e6906-9dad-4cf1-8083-d32bc45b2b4f', CAST(N'2015-07-30T23:34:28.317' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9e940f4b-af39-40f2-a914-d367d2754483', CAST(N'2015-07-30T22:44:57.757' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'82114a2a-37ab-4658-8d87-d37ac869024d', CAST(N'2015-10-14T16:08:50.273' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'171e22d2-e6ff-4d73-9c1a-d3a935cfbfef', CAST(N'2015-10-14T16:07:05.280' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa82fe34-3cd0-4865-a50c-d3aab288b346', CAST(N'2015-10-15T11:20:30.413' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59f11671-cca5-4b53-bae6-d3b44b68d7e4', CAST(N'2015-10-15T11:19:07.983' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a7b40f02-4c81-4754-a5c7-d3dd850ee222', CAST(N'2015-07-30T22:44:04.673' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'413e4fe3-40b3-4afc-92e7-d3f7fdf367a3', CAST(N'2015-08-13T10:00:42.200' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3789fe35-51fa-4e32-899e-d4264bd3b148', CAST(N'2015-07-31T00:19:39.413' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a678182a-949d-4868-bc22-d42eef4eb1b9', CAST(N'2015-10-14T16:11:55.310' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ce5e1706-3cd2-49b6-ac3b-d43b83468568', CAST(N'2015-07-30T10:41:55.993' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'45dca545-8e47-4490-97e9-d4617d9b6daa', CAST(N'2015-07-30T22:17:41.310' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ac724fa9-c6d6-415c-9216-d4646fd8bc7b', CAST(N'2015-07-30T22:43:58.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'32b090a1-3392-4c72-9054-d468641da749', CAST(N'2015-07-30T22:31:13.363' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c234ab5f-411b-4fdf-b2cd-d4787e8f1146', CAST(N'2015-08-13T10:10:31.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a5d0ea12-7ce5-4bea-87e4-d4b58bbe4c4d', CAST(N'2015-07-30T22:30:07.453' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a225246-3a95-4c80-9130-d4ee67b90c30', CAST(N'2015-07-30T11:02:20.747' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8eb191e-dfa4-4031-bef3-d5165db4c596', CAST(N'2015-07-30T22:43:22.390' AS DateTime), N'yunwei1', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cf2e58bb-085e-4527-a653-d517e657d8f5', CAST(N'2015-07-30T22:18:59.033' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'922ae205-ec56-4ef9-ab65-d53e61eb0ab7', CAST(N'2015-07-30T22:42:13.043' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c8dcb8b2-1f22-4963-8345-d551738745c1', CAST(N'2015-07-30T10:56:44.170' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3d6d9f5-10f6-4cbf-9ddf-d560f352f1eb', CAST(N'2015-07-30T23:38:53.717' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'93e26f62-5e73-4073-92b2-d561179e84eb', CAST(N'2015-07-30T23:28:55.963' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'794df4b7-6ed7-4611-9337-d56cb9e33aa3', CAST(N'2015-10-15T11:21:48.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e7259dc8-929f-48a7-862d-d594a335cf56', CAST(N'2015-07-30T10:41:52.897' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c7dfc66c-6e74-4dd5-a4c4-d5a947b4e613', CAST(N'2015-10-15T11:23:33.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f6b28ae5-0f3b-40a1-9996-d5d5b00956c8', CAST(N'2015-07-30T22:40:32.573' AS DateTime), N'yunwei1', N'::1', N'ItService', N'OpenWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'489f00a8-6859-47ef-a33f-d5d7f3cb00ec', CAST(N'2015-07-30T23:35:53.397' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1405177f-fe25-4de0-87f5-d5e2d148a084', CAST(N'2015-10-15T11:20:43.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d12493d-a314-43c2-82fa-d662a930c41f', CAST(N'2015-10-14T16:09:34.267' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bf872991-f62d-4bc5-956a-d67dcb9d7502', CAST(N'2015-07-30T23:13:19.723' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c0ddfdd-7967-48ec-a20e-d68782f75a68', CAST(N'2015-08-13T10:10:16.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd0ce6c5e-ab81-4a4c-be35-d69f7e10cce2', CAST(N'2015-07-30T10:56:39.163' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'035b3d81-1d5e-4835-a4f7-d6a233450edd', CAST(N'2015-08-13T10:08:23.457' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f040a176-9745-4873-8625-d6a5b2eb95b6', CAST(N'2015-07-30T22:42:21.527' AS DateTime), N'admin', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd0247257-2259-4263-a499-d6b129354735', CAST(N'2015-07-30T23:13:34.703' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c85823c7-8776-412f-84bf-d6b2cdcf3952', CAST(N'2015-10-14T16:06:00.250' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'35433d6d-9636-476a-88d9-d6b42649ca69', CAST(N'2015-07-31T00:19:55.827' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'544705ac-d34e-42b8-85f4-d6ccd3da97a7', CAST(N'2015-07-30T23:22:55.477' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4efeee95-cd57-4f45-a7f0-d713d79e7cc7', CAST(N'2015-07-30T10:50:34.843' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a339dc2a-1509-4244-ae77-d74907c5f36e', CAST(N'2015-10-15T11:19:47.987' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a06b1da9-1b0c-4d38-b193-d76399b2f6f5', CAST(N'2015-07-30T23:35:13.360' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7aa0237a-4077-4326-beaa-d7689aff3a71', CAST(N'2015-07-30T23:26:55.813' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'624881cf-09dc-4d71-a509-d7813685504e', CAST(N'2015-07-30T10:38:50.697' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'84e0dd79-3edb-4e95-9538-d799fbc0c816', CAST(N'2015-10-14T16:09:59.270' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6160d998-e0ad-4daa-9ad2-d7afdd0ffef3', CAST(N'2015-07-30T22:18:09.023' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59cc4504-7cf0-4fbb-991e-d7e424c248f2', CAST(N'2015-07-30T23:15:59.967' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8ab25f4-6f8f-41f4-ac06-d83c66a0ebed', CAST(N'2015-07-30T10:50:30.443' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3238d83d-a12e-49c9-8b35-d8628656b39f', CAST(N'2015-07-30T22:31:54.280' AS DateTime), N'yunwei1', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'31c6dbaf-2a3e-4000-8fd1-d88160c68f0e', CAST(N'2015-10-14T16:04:42.160' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b5bbc274-5c42-45ce-afa2-d89076b25852', CAST(N'2015-07-30T10:53:59.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c19e14ed-f4e8-4d46-94b4-d89b0f3de24c', CAST(N'2015-07-30T23:33:43.317' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'846010b6-8d1e-47b7-b095-d8d2d1c4e851', CAST(N'2015-07-30T22:30:27.023' AS DateTime), N'admin', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'64eafa05-3737-424b-8232-d908edbc8ccf', CAST(N'2015-07-31T00:27:17.487' AS DateTime), N'itgly', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b57b7e4b-c4c7-4105-ae0d-d90fcd28610b', CAST(N'2015-07-30T23:31:06.157' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0562fcfc-6283-40ee-99c6-d92c671ba989', CAST(N'2015-07-30T10:45:00.983' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae5913f0-7f42-4c94-be7e-d92da5cbf709', CAST(N'2015-10-15T11:20:31.890' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'59fe3d73-caed-4045-a227-d9342172f71d', CAST(N'2015-07-30T22:31:53.477' AS DateTime), N'yunwei1', N'::1', N'ItService', N'OpenWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d67f0ff-2341-4e31-a583-d95b74d52498', CAST(N'2015-07-30T23:25:25.683' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a40a347-1a36-4424-93d4-d95f4850dde8', CAST(N'2015-10-15T11:22:23.827' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f3fc751c-2293-4cad-81ea-d97008c40461', CAST(N'2015-07-30T22:18:44.037' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1bcf8948-f977-4837-8dc5-d98062f6d35f', CAST(N'2015-07-30T10:49:52.690' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'29c3591d-b9ce-4e85-bf5d-d9ccd8fa4554', CAST(N'2015-07-30T10:39:48.087' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a196e258-fec7-4ec2-a3a7-da0d2bd6e6d6', CAST(N'2015-07-31T00:16:24.530' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4774b232-21ff-48d5-aa79-da1010f3139b', CAST(N'2015-07-30T10:57:29.383' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2104b35d-ae73-42c9-a43b-da2004789b6a', CAST(N'2015-07-30T10:50:13.840' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca53eb85-7a28-46c1-b57a-da2488de0683', CAST(N'2015-07-30T23:08:19.327' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'45b1ad8c-458c-4fd0-a02f-daa464f9b828', CAST(N'2015-07-30T10:43:35.353' AS DateTime), N'admin', N'::1', N'DataDict', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'46a6429c-c88f-4c00-ad2a-daa8c197523e', CAST(N'2015-07-30T23:35:28.377' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'450e4cee-5bc9-4e30-8c8c-dab587e65034', CAST(N'2015-07-30T10:50:58.220' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd3b7183d-3842-47a7-b288-db29ca551795', CAST(N'2015-07-30T22:44:23.083' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f7992cf2-f4c7-45ae-8ccc-db29f800146f', CAST(N'2015-08-13T09:59:52.860' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'81e630e5-836b-44d8-8589-db81199d6db9', CAST(N'2015-10-14T16:04:04.430' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5356c0e8-aa74-47af-8287-dbe0f9d7b7ad', CAST(N'2015-07-30T10:49:38.707' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7dae9688-8899-47c3-bc29-dc0369e9acb7', CAST(N'2015-07-30T22:30:23.040' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=-1,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'08b959b1-02c9-42fb-bb90-dc1ccf45048a', CAST(N'2015-07-30T22:42:23.330' AS DateTime), N'admin', N'::1', N'ItService', N'DrafterToNextState', N'ID=0,Title=sss,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=sss,applicantPhone=sss,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,NextLink=向信息中心提交申请,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a7436c1-694a-47d3-99c6-dc311fc2730d', CAST(N'2015-07-30T22:22:09.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eff15b22-394b-41c9-a41e-dc3e66981ce9', CAST(N'2015-07-30T23:09:16.313' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a103991-4a7d-43d2-bb51-dd10ba1475ae', CAST(N'2015-07-30T22:30:44.383' AS DateTime), N'itgly', N'::1', N'ItService', N'OpenWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'89777a8d-cc35-4406-972e-dd4661127496', CAST(N'2015-07-31T00:24:24.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'364abe8b-c119-46dd-b8fa-dd54a00a7e98', CAST(N'2015-07-30T23:31:56.197' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'defecb82-11f7-4190-acd8-ddce32aed7ca', CAST(N'2015-07-31T00:28:37.743' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1dc72be-b997-4a10-9d3e-dde7eac5ffaa', CAST(N'2015-07-31T00:18:44.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60169989-1135-445b-8ba1-dde86e8c2bad', CAST(N'2015-07-30T23:34:48.320' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db0f7044-f921-44b8-94d7-de1315a811da', CAST(N'2015-07-31T00:24:17.327' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3ad5aa80-eaa2-40fe-8105-de1ea523fc45', CAST(N'2015-07-30T22:19:47.480' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9d838f7b-600d-4500-8bfa-de2ad388aff9', CAST(N'2015-07-31T00:27:27.640' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd62d0186-7f6b-4efd-aa26-de3a5e6c9b38', CAST(N'2015-07-30T10:49:56.047' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f14e4975-c157-40da-85d2-de5bc35601b7', CAST(N'2015-08-13T10:10:41.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a54d9dd6-3608-422e-a7f1-de82d67e1863', CAST(N'2015-07-30T10:44:09.700' AS DateTime), N'admin', N'::1', N'DataDict', N'CreateDataDict', N'ID=4,DataDictName=电脑故障,DataDictCode=,DataDictType=,DataDictNote=,parentId=0,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ab3e5d8-142e-4664-b947-de8964033167', CAST(N'2015-07-30T23:23:40.540' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'776829ff-9095-4182-ab40-deb163fadb58', CAST(N'2015-07-30T10:44:38.227' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'id=5,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f00d7ff9-df5b-4b07-b284-dec7ffcaa888', CAST(N'2015-10-14T16:11:45.317' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'266d80db-199c-4249-b16b-df01da2c0479', CAST(N'2015-07-30T22:31:25.333' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91a42570-6ded-4977-af8c-df0242b2693c', CAST(N'2015-07-30T23:09:05.320' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'54588351-1047-443b-a03b-df1f2052cd18', CAST(N'2015-07-30T11:01:49.383' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6e1060c5-32c2-45a6-96c7-df824a26a7d6', CAST(N'2015-07-30T23:17:10.050' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6c24bc6f-51b8-4543-a8ce-dfbe0a967297', CAST(N'2015-08-13T10:00:29.057' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f9b8236a-9ec8-4b80-b3a1-dfc41d9608fa', CAST(N'2015-07-31T00:23:38.773' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c5b4be6f-dd81-4793-84e8-dfc57886ac85', CAST(N'2015-10-15T11:19:42.977' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8e03e4bf-2631-4c34-b194-dfc712fd1c2a', CAST(N'2015-07-30T23:16:04.943' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'70dd638f-9e91-47eb-9df4-dfca04ecd432', CAST(N'2015-08-13T10:08:23.973' AS DateTime), N'admin', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'47b11adf-b21f-48fc-8d9b-dfca9bb0cdb7', CAST(N'2015-07-31T00:21:23.897' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8bcbd7e8-f5ef-42a4-b020-dfd3061fddcb', CAST(N'2015-10-14T16:09:50.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dd30cf04-6d20-4010-9c68-dff77f076fdf', CAST(N'2015-07-30T22:30:26.493' AS DateTime), N'admin', N'::1', N'ItService', N'DrafterToNextState', N'ID=0,Title=阿斯顿发放大声,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=阿斯顿发大放送,applicantPhone=阿达地方,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=bd31a684-e0c9-446a-b1cd-f7977997fd77,NextLink=向信息中心提交申请,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'56baf826-eadf-4e74-acf5-e00bf7c0a2e7', CAST(N'2015-07-30T10:44:34.977' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd1a03738-df50-4a96-8802-e00e1e6f0132', CAST(N'2015-08-13T10:10:05.407' AS DateTime), N'admin', N'::1', N'DataDict', N'DataDictlist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'733ca8eb-e5fc-46c4-a668-e0387ae8b518', CAST(N'2015-07-30T22:19:39.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5946a263-d7ac-4676-94fd-e0433f735cfd', CAST(N'2015-07-30T22:31:22.743' AS DateTime), N'jskkz', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'534f31d9-6820-49be-8a9f-e04b761f7c32', CAST(N'2015-07-30T23:39:23.770' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd311008f-b71b-466c-a9c6-e0617f258452', CAST(N'2015-08-13T10:08:05.400' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1e2ea786-302a-41df-b769-e064e857f2b0', CAST(N'2015-08-13T10:08:11.587' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ea05a58e-9d5b-422f-8590-e089c5221e5c', CAST(N'2015-07-30T10:40:47.493' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'be058c13-57e6-46ef-9b83-e09aeba60bbf', CAST(N'2015-10-15T11:17:59.687' AS DateTime), N'admin', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b0d6a302-9ddc-4411-af94-e0a43b8b5299', CAST(N'2015-08-13T10:01:05.937' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'538195d2-bbed-4e0b-86a5-e0a52473f13b', CAST(N'2015-07-31T00:17:59.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1de6baae-f439-468e-a5e0-e0bfa14666d4', CAST(N'2015-07-30T22:44:25.407' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f4d45210-1901-405b-b2c7-e0c212ced545', CAST(N'2015-07-30T22:42:49.277' AS DateTime), N'itgly', N'::1', N'ItService', N'ToNextState', N'ID=2,Title=sss,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=sss,applicantPhone=sss,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,NextLink=技术科处理,Opinion=s,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'de1de2e3-4ee5-4b33-aeb7-e0c46f33e623', CAST(N'2015-07-30T10:55:44.407' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5d49f1b8-23aa-4402-ac6f-e0d5aa797488', CAST(N'2015-07-30T23:37:23.563' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c2800bbc-10dd-4750-aa51-e0fbb6f7e975', CAST(N'2015-07-30T10:38:47.583' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c6fff58c-3d77-478c-9d5e-e0fe27f4c7bf', CAST(N'2015-07-30T22:18:09.397' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9b318762-6ae3-4146-b1ed-e156d4476118', CAST(N'2015-07-30T10:55:24.500' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e368def7-1b81-48c0-98ac-e1823f853518', CAST(N'2015-07-30T11:02:51.680' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'872f0146-fcc2-4c0e-802d-e184f22e9e81', CAST(N'2015-07-30T22:30:16.093' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc6e98b3-069d-4b31-94e0-e1a8fa5f4b21', CAST(N'2015-10-15T11:21:06.340' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c9690db7-5edf-4381-8907-e1b7973ac696', CAST(N'2015-10-14T16:11:04.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cc7f6f81-e14b-4e20-8694-e1de2dc868d3', CAST(N'2015-08-13T10:08:39.200' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b023b801-e935-48ea-981b-e1f042ed0fe3', CAST(N'2015-07-30T22:29:46.313' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'80934249-17c7-4090-b19e-e2305ef4ea96', CAST(N'2015-07-30T22:23:49.433' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7d2d51a3-3e96-43d6-aa7c-e243b5a1961b', CAST(N'2015-07-30T22:31:15.343' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b79bb282-ef4c-4a18-81c5-e2684ce43f36', CAST(N'2015-07-30T23:30:16.087' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'30aabf94-cc3f-4068-b771-e26d339a5831', CAST(N'2015-10-14T16:04:35.730' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b8555e49-98d8-4019-91c3-e2ff6dc64b61', CAST(N'2015-07-30T22:30:39.693' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4144a1ee-999e-4b66-8ebd-e328423e2026', CAST(N'2015-08-13T10:09:05.363' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd10b9668-88ab-42bc-ae7b-e34029097bbe', CAST(N'2015-10-14T16:12:20.307' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2f34167c-ec99-46bf-963e-e34fdabcf8c2', CAST(N'2015-10-14T16:05:44.227' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd89c0b11-8079-4362-afea-e3cd1ea52cc7', CAST(N'2015-07-30T23:35:03.347' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8ddfc1bc-756d-40bc-89ca-e3d3a7dbd6c8', CAST(N'2015-10-15T11:19:52.973' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8f017641-9045-420c-a959-e40ad8e8b95c', CAST(N'2015-07-30T10:39:27.007' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b620088e-c110-4246-9a88-e41538bc022a', CAST(N'2015-10-14T16:08:05.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7b003e37-7005-4a0c-8ecb-e41baa35f015', CAST(N'2015-07-30T22:45:02.910' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eac0d92d-62d0-4ffa-8cdb-e4482d510d25', CAST(N'2015-07-30T23:19:40.193' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e0c767fc-caa7-46e2-bb02-e45558306737', CAST(N'2015-07-30T22:30:46.367' AS DateTime), N'itgly', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5c2788c3-27a0-4844-95cf-e4742d3102d3', CAST(N'2015-07-31T00:20:43.840' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efb9bab2-cd49-4442-9359-e47764a5d16d', CAST(N'2015-10-14T16:16:10.873' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'155cebde-2ef4-4330-949b-e48258ed5928', CAST(N'2015-07-31T00:17:09.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4161402a-5276-48de-8087-e4d695dc47a5', CAST(N'2015-07-31T00:23:58.613' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62d46d1a-6afe-462f-9df0-e4e9b236de7e', CAST(N'2015-07-30T23:25:45.737' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a656d68-9810-40e3-9c5f-e4fa2fb0834b', CAST(N'2015-10-15T11:23:03.337' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'32ebbc23-6b25-498b-82d9-e554570d4182', CAST(N'2015-10-14T16:09:49.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2ff51af4-2e25-4041-b700-e5574f6ceaed', CAST(N'2015-07-30T22:29:41.237' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1b8b1512-84d2-4633-bbb3-e55b0105ee95', CAST(N'2015-07-30T23:29:00.963' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'39c70826-e6b7-41d2-a884-e56434d1733b', CAST(N'2015-07-30T23:37:43.600' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ddc2fa81-171b-417e-ba96-e571d09bae69', CAST(N'2015-07-30T22:42:11.087' AS DateTime), N'admin', N'::1', N'ItService', N'AllWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37175add-3b2c-4127-ba4e-e5902af48679', CAST(N'2015-07-30T23:32:31.270' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'36a389d7-a98f-4b5b-8c8f-e5bc1f5885af', CAST(N'2015-07-30T10:41:41.687' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'51f4c3f6-a208-4336-92ac-e5c03212867f', CAST(N'2015-07-30T23:19:25.187' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9c7fb998-8b63-4077-be1c-e5f4b565a988', CAST(N'2015-07-30T22:44:18.053' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c049aa07-6056-4258-9515-e6096fc84a47', CAST(N'2015-10-14T16:11:10.333' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1614f52a-111d-482c-b62d-e6a20f41e546', CAST(N'2015-07-30T22:43:33.033' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5a7f1f86-6878-48dc-a5e8-e6f39227a109', CAST(N'2015-08-13T10:11:06.760' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'52adcde8-f8c0-40fb-9be3-e6f8c9794d9d', CAST(N'2015-07-30T23:18:10.057' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'08f8fcd5-c40f-4f48-942b-e7018cb35c75', CAST(N'2015-07-30T10:40:12.647' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fa57d012-f801-4577-a739-e71176ed8d72', CAST(N'2015-10-14T16:12:35.327' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ae5782b-5cf2-41a9-bdbb-e713649d429f', CAST(N'2015-07-30T10:50:52.487' AS DateTime), N'admin', N'::1', N'Menu', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'11872a6f-59e4-41ed-a997-e72126e34f61', CAST(N'2015-07-30T22:31:56.433' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99fa613a-e2be-4e79-8f91-e730eaa5cde3', CAST(N'2015-07-30T23:18:00.073' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca67218f-0da8-4661-b7ef-e74a1ed21cc1', CAST(N'2015-08-13T10:10:51.250' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7f22157c-8452-45ff-b527-e758100d5be2', CAST(N'2015-10-15T11:21:52.767' AS DateTime), N'admin', N'::1', N'Account', N'MenuToRoleList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'83f7fc27-f3a8-453a-bf34-e760553ca337', CAST(N'2015-07-30T23:34:03.327' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'79fe5b57-ec76-4309-b8a2-e767f41054c8', CAST(N'2015-07-31T00:26:24.577' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe6b216e-1f58-4b1c-a068-e7708f642dd0', CAST(N'2015-07-30T23:39:33.787' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b8306b8-ee0a-4391-bb2b-e7be3eb7c922', CAST(N'2015-07-30T22:31:09.670' AS DateTime), N'jskkz', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0cd46ce2-7824-43d6-8161-e7c0d7c57941', CAST(N'2015-07-30T22:28:42.583' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b59a565a-0fd3-433e-b841-e7e198c53bd1', CAST(N'2015-07-30T10:41:40.737' AS DateTime), N'admin', N'::1', N'Account', N'EditUser', N'Id=c1a491db-3f4f-4ee2-aa57-a999f8d1441b,TrueName=预算科员工,Order=1,Job=科长,Mobile=,PhoneNumber=,Email=,OrganizationID=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'15163253-14dc-4ed0-8713-e7ee628b152c', CAST(N'2015-07-30T23:20:05.217' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'635f7f4f-2eee-4dd1-a374-e7f5f341aea5', CAST(N'2015-07-30T22:42:35.790' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ca816dc9-af9b-4d00-914b-e7feed916b89', CAST(N'2015-07-30T23:31:36.173' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b86c19b-2dcc-4820-89b1-e81cac777c39', CAST(N'2015-07-30T22:19:04.000' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cb94f33d-5b3d-4b1d-bdcb-e8399f8cc160', CAST(N'2015-07-30T10:38:27.607' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4f030df9-1506-4d62-9235-e84349002aa0', CAST(N'2015-07-30T10:57:23.940' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c62e469c-6ec3-4f51-aa2b-e86dc7ca803c', CAST(N'2015-07-30T10:55:59.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd15ddbc5-abb6-4186-acaa-e87362c83594', CAST(N'2015-07-31T00:18:26.857' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd118a4a7-8564-4df8-ab9a-e8908105bbbf', CAST(N'2015-07-30T23:31:41.203' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d18f977-d139-4746-bf4e-e8aa4f8047af', CAST(N'2015-07-30T23:38:13.650' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a10d36c-ae55-47c5-aa57-e8d1c10fa34e', CAST(N'2015-07-31T00:26:25.193' AS DateTime), N'itgly', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9b5e4e7b-690d-406a-8c40-e905fe67278f', CAST(N'2015-07-30T23:10:01.383' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e2599854-1f29-4b26-b916-e91d8ea78801', CAST(N'2015-07-30T10:49:08.830' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad8849a2-54d3-4004-85a5-e9314e0c7bfc', CAST(N'2015-07-30T10:50:53.073' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b85a20b-ed77-488d-be41-e93fade0a8bb', CAST(N'2015-10-15T11:21:05.677' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'174eda12-6d03-4bfd-9f07-e95ffaefa72d', CAST(N'2015-10-14T16:07:55.270' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f915c004-4119-4db7-a68b-e986bcd93917', CAST(N'2015-07-30T10:44:37.040' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0eecef05-14d7-4f20-b99c-e9d597de753a', CAST(N'2015-10-14T16:11:54.280' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db141976-f44a-4cd1-9f77-e9e4d799b321', CAST(N'2015-10-14T16:09:24.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4cd2f85f-05a2-46e6-bcea-ea53b3771a04', CAST(N'2015-07-30T23:29:10.957' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7770e2f7-8fb5-4495-88e6-ea7ea15efe9d', CAST(N'2015-08-13T10:10:11.250' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6f95220e-4006-4db9-872a-eae75285a928', CAST(N'2015-07-30T23:24:50.643' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ef88f059-0514-49b7-b058-eae959a4c13c', CAST(N'2015-07-31T00:22:23.383' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cbe95a42-b24c-4204-999e-eafc956233cd', CAST(N'2015-10-15T11:20:27.013' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a05824a7-0a6a-47c3-8dc8-eb4bc4c99beb', CAST(N'2015-07-30T10:44:23.303' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'eb23a70a-f861-4ed9-b0fa-eb4e0dd0cc0f', CAST(N'2015-10-14T16:11:19.330' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd75ca45e-6714-4e1d-9c0d-eb6344e9d3e7', CAST(N'2015-07-30T22:43:28.797' AS DateTime), N'yunwei1', N'::1', N'ItService', N'ToNextState', N'ID=2,Title=sss,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=sss,applicantPhone=sss,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,NextLink=完成,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e4873502-031c-425f-ba81-eb78e8f85fee', CAST(N'2015-07-30T22:18:14.403' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7e0d8046-eb4c-483e-9754-eb795f3bdc1f', CAST(N'2015-07-30T22:43:11.743' AS DateTime), N'jskkz', N'::1', N'ItService', N'SubmitSuccess', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a29e746b-8b08-461f-b988-ebf13eb15f92', CAST(N'2015-10-15T11:20:42.630' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'77cc9635-5a5c-4738-aec2-ec4398c10ae0', CAST(N'2015-07-31T00:26:08.050' AS DateTime), N'admin', N'::1', N'ItService', N'Create', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'55f75784-8805-4e38-be77-ec4c1d83cc75', CAST(N'2015-10-15T11:23:17.977' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db35842e-bd6e-4fc4-8800-ec55b6a730dc', CAST(N'2015-07-31T00:25:09.103' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'747c6edb-fc26-4640-aa0a-ec796b516401', CAST(N'2015-07-31T00:28:02.657' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'75e8bcd3-2159-4db9-8769-ec93002f3fe2', CAST(N'2015-07-30T10:39:51.980' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f0656858-1df6-46fb-8ae1-ec991792543e', CAST(N'2015-08-13T10:10:36.240' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'498b6799-8d4c-4636-96bc-ecb7342778ac', CAST(N'2015-07-31T00:20:19.217' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1a1f4376-fb5d-4979-aeff-ecd011f6dc15', CAST(N'2015-07-30T22:17:48.463' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9113b2b3-de29-4ab7-9f20-ed47e4700407', CAST(N'2015-07-30T23:33:06.307' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5bf8dc45-0d7e-4d26-95a7-ed5cb82b83c9', CAST(N'2015-08-13T10:00:40.567' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8bd40b74-6641-4cba-a80d-ed8a50e127fa', CAST(N'2015-08-13T10:08:37.607' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd4532138-c254-4d3f-bfd9-eda946a82044', CAST(N'2015-07-30T22:31:20.350' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a65d0e2a-6cb9-4fe0-9831-edab5cbabc09', CAST(N'2015-07-30T22:42:13.657' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd51a98ce-0a55-469e-a3a9-edaec0d38848', CAST(N'2015-07-30T10:50:34.070' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6c913c61-e54f-4447-a9d0-edb15b2e5d8e', CAST(N'2015-07-30T23:21:30.360' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7a56e707-9b11-489e-ae97-edb33089b645', CAST(N'2015-07-30T10:54:29.500' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5aa518f4-5119-4f3f-a65a-edbabb2c1361', CAST(N'2015-07-31T00:18:34.297' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'17a5e70c-8805-4a33-92d2-edc8c39e0c8e', CAST(N'2015-07-30T22:22:07.510' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd8f7b5b0-dcf3-454b-baff-eddc4a7a6fcf', CAST(N'2015-07-30T22:22:39.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3989c461-5920-4d5d-a1a3-ee2924bd560f', CAST(N'2015-08-13T10:08:25.027' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b88c5a84-8a7e-4c6e-a9e7-ee5b8a75154c', CAST(N'2015-07-30T22:20:49.047' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bbb07c02-5c84-4797-98a2-ee77f5f532d7', CAST(N'2015-07-30T22:23:29.450' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b70f38b5-4c4c-4951-b060-ee8c83969f4a', CAST(N'2015-07-30T22:21:29.060' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c1f1c29f-3a80-48d2-a4aa-eea16a24870e', CAST(N'2015-07-30T10:50:08.820' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'084c6e78-1328-4eb2-adb2-eeb9652b9531', CAST(N'2015-10-14T16:04:51.017' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e58ca6eb-94ea-4e0a-8dd9-eed8a12781a5', CAST(N'2015-07-30T22:43:43.083' AS DateTime), N'itgly', N'::1', N'ItService', N'ToNextState', N'ID=2,Title=sss,isitype=3,sub_isitype=5,end_isitype=,drafter=,applicant=sss,applicantPhone=sss,applicant_dept=1,description=,solution=,DealwithpeopleName=,ItManagerOpinion=,ProcessingDepartmentOpinion=,DealwithpeopleOpinion=,isiCreateDate=0001/1/1 星期一 上午 12:00:00,isiCompleteDate=,instanceId=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76,NextLink=结束流程,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'766e8000-6856-4daf-9f25-ef1072c8dc18', CAST(N'2015-07-31T00:27:57.697' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'af59fa6a-a1e8-49fd-a2bd-ef76ea5b663a', CAST(N'2015-08-13T10:10:03.833' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'edb4db4e-8f85-416b-90d3-ef7d13fad4e5', CAST(N'2015-10-14T16:06:35.280' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'06c1bdbf-93d1-44e9-bf9e-ef8e56297359', CAST(N'2015-07-31T00:24:36.553' AS DateTime), N'admin', N'::1', N'Account', N'UserListForRoleManage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'599319ea-1377-4a37-9727-efa4e7cf4989', CAST(N'2015-07-30T23:31:46.210' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3d66a466-8404-42b2-9302-efc4491c4448', CAST(N'2015-10-15T11:19:49.650' AS DateTime), N'admin', N'::1', N'Organization', N'orglist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'590a8b7a-e899-472d-b279-efcdc81c9c85', CAST(N'2015-08-13T10:00:29.793' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'41531044-8089-4f9c-a5df-efce9337e7e9', CAST(N'2015-07-30T22:43:02.860' AS DateTime), N'jskkz', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'744ad7ed-a8b1-482b-9d6c-efcf613596f7', CAST(N'2015-08-13T10:00:30.887' AS DateTime), N'admin', N'::1', N'menu', N'menulist', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1d1e2ebf-2e0e-4c10-a675-f00a9a92569f', CAST(N'2015-07-30T22:19:29.017' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b3c197c3-0f43-4fdf-bcb9-f01dfb4a287d', CAST(N'2015-10-14T16:08:10.287' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'73c63816-beba-4d1f-b82a-f0488fc576ca', CAST(N'2015-07-30T10:41:31.030' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b1df1456-a349-47b0-90cc-f0f59c7aee92', CAST(N'2015-07-31T00:20:18.133' AS DateTime), N'itgly', N'::1', N'Home', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'25ddb51e-025d-4ee6-b5b2-f0f665d10c9b', CAST(N'2015-07-30T22:27:56.040' AS DateTime), N'admin', N'127.0.0.1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2b2f98b4-dc69-4861-8bef-f15f04f7233c', CAST(N'2015-10-15T11:21:28.323' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9fd5ba39-87ef-40fa-a7c3-f1653238209d', CAST(N'2015-07-31T00:28:12.693' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9ebf657a-6cfb-4c7c-8b81-f18ec3291f74', CAST(N'2015-07-30T10:54:44.500' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'cdb3bab7-6c34-46d1-be35-f1b003ea659d', CAST(N'2015-07-30T23:12:37.737' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7bb6a0f3-6319-4f05-8938-f1c566d02ead', CAST(N'2015-07-30T22:43:04.427' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0f8af8a6-9d28-4c09-a2de-f1df1f65f792', CAST(N'2015-07-30T22:30:40.133' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'32c91da4-f95e-4b59-9e0b-f1f45ec6c78c', CAST(N'2015-07-30T10:55:39.427' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9db2c1e4-bf92-4413-8afc-f20a5f0fd696', CAST(N'2015-08-13T10:08:11.443' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1643a69-041e-488a-96c4-f21f7188c675', CAST(N'2015-07-30T22:22:34.427' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4b5526f0-0d1f-48dd-a161-f2582d5735fb', CAST(N'2015-07-30T23:27:45.907' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'63bbf46f-97aa-49e3-9437-f280eb825e93', CAST(N'2015-07-31T00:19:22.150' AS DateTime), N'admin', N'::1', N'ItService', N'getSub_isitype', N'id=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'efdb3120-a9c9-46ff-93b9-f2bcb4556880', CAST(N'2015-08-13T10:08:29.200' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'133d7381-26d9-47f6-b11c-f2ce20c464ae', CAST(N'2015-07-30T23:11:10.287' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2d124f49-fdf4-484f-ae27-f2db93955f5f', CAST(N'2015-07-30T22:21:20.587' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=8,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dec73db9-54d4-4232-8b73-f2e2a181a37e', CAST(N'2015-07-30T23:26:50.810' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd54ea016-5a47-4bd7-869d-f2e4e817ae69', CAST(N'2015-07-31T00:26:09.947' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9440cfba-9269-4254-ad2b-f3290904f319', CAST(N'2015-10-14T16:08:34.257' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'5fe6d1b9-d353-496d-92bd-f345ccdbd8b7', CAST(N'2015-07-31T00:25:59.150' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'51761d5e-db06-469a-9e36-f3475c6acac4', CAST(N'2015-07-30T22:19:31.717' AS DateTime), N'admin', N'::1', N'Organization', N'DelOrg', N'id=3,pid=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'58eb5add-f8db-494f-be70-f381659bc1aa', CAST(N'2015-07-30T10:53:39.177' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1f5b9f74-4696-4ea0-86ce-f396decfcd94', CAST(N'2015-10-14T16:05:19.080' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'313b2515-e5a8-473a-b6ae-f3ac1759f919', CAST(N'2015-07-31T00:18:49.333' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b91e60e-faaf-4339-9ad2-f3bcfd83d7c3', CAST(N'2015-10-14T16:10:50.303' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0afc1afc-63e5-450e-8e7a-f3c58a9688ec', CAST(N'2015-07-30T22:22:49.063' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91995e51-fd97-41a6-92b9-f3fc8fc5a35d', CAST(N'2015-07-30T10:44:42.350' AS DateTime), N'admin', N'::1', N'ItService', N'Statistic', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ab36bc06-d85b-4108-9276-f406645716e8', CAST(N'2015-07-30T23:14:44.843' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8a7f83a7-9a2c-4496-b2bf-f40e7f220f47', CAST(N'2015-07-31T00:28:22.713' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6a294209-01f0-4273-b9dd-f426b1b3a812', CAST(N'2015-07-30T23:12:55.780' AS DateTime), N'jskkz', N'::1', N'ItService', N'getIsitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85a0ff4b-3b3f-4836-b9d6-f437e9a973a5', CAST(N'2015-07-30T23:12:55.690' AS DateTime), N'jskkz', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4bd205c6-6c8d-429d-b35b-f47d9a453318', CAST(N'2015-10-14T16:04:34.843' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ad9e1a60-4183-4d6f-b664-f49133ade2c5', CAST(N'2015-07-31T00:26:14.167' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'65d3b0e1-f75e-4a38-8c56-f49f68d481b5', CAST(N'2015-07-30T23:18:55.160' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e05709cc-d210-4cac-bb1c-f4aa8507d5d8', CAST(N'2015-07-30T10:43:29.783' AS DateTime), N'admin', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c4714479-3b49-45ca-a2b8-f4b102976af2', CAST(N'2015-08-13T10:12:26.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'b21719a5-bdb5-4c7e-907c-f4db9e4530ce', CAST(N'2015-07-30T23:11:51.483' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'99b79971-e085-4f11-9092-f4dd9874ade3', CAST(N'2015-07-30T22:30:45.260' AS DateTime), N'itgly', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'2819ac26-63ad-44f0-8d71-f4e107aa37aa', CAST(N'2015-08-13T10:10:26.287' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'c42890dd-020c-479a-9e15-f4f89211a799', CAST(N'2015-07-30T22:31:13.020' AS DateTime), N'jskkz', N'::1', N'ItService', N'OpenWorkFlow', N'id=bd31a684-e0c9-446a-b1cd-f7977997fd77,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1db9d48f-169d-49c5-a354-f517b76dc73e', CAST(N'2015-07-30T22:19:46.633' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4ec5317f-4c6d-4e9f-9ee8-f5264b2960ae', CAST(N'2015-07-30T22:20:29.050' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3b7ab608-9daa-4846-a904-f532d9027baf', CAST(N'2015-10-15T11:18:47.343' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e91fe4e6-a5b7-4112-a748-f5545f9fa877', CAST(N'2015-07-30T22:19:19.420' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'202c2234-97f2-462a-9554-f59fd914df01', CAST(N'2015-07-31T00:20:18.623' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'136ba49a-ae39-4ffe-ae6f-f5a836a7392f', CAST(N'2015-10-14T16:08:09.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd39032f6-b3c4-4125-a4d9-f5bca0b73cce', CAST(N'2015-07-30T22:23:09.067' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'37643db8-8f93-4e59-b9e9-f5e8bb626509', CAST(N'2015-07-30T22:30:22.420' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'815b3bf6-12da-4961-b3d3-f5f950ba5739', CAST(N'2015-07-30T22:29:52.403' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'4c192f53-a1ec-4807-a0b4-f6854720793b', CAST(N'2015-07-30T10:44:23.963' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0b40e8cf-b9f5-4e77-a603-f6913695867f', CAST(N'2015-07-30T23:29:05.977' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'60d511ec-8c01-41c1-913e-f69b4f5c4429', CAST(N'2015-07-30T23:10:36.397' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3defaed6-f360-4d01-b7fe-f6fa06f638da', CAST(N'2015-07-30T22:23:04.057' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dbc84caf-ec6f-4123-bbec-f713aa8e7b79', CAST(N'2015-10-14T16:08:30.297' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'db9c32a0-df4a-4774-a12e-f77a4386dd4a', CAST(N'2015-07-30T22:18:55.140' AS DateTime), N'admin', N'::1', N'Organization', N'CreateOrg', N'ID=6,orgName=技术科,orgShortName=技术科,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=0,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bf7dc53d-b2e3-4b89-bab2-f78586cf4bab', CAST(N'2015-07-30T11:02:52.020' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'42d3b7ba-75af-49b8-afac-f7a06533c59a', CAST(N'2015-07-30T10:42:52.943' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0e8babcf-ca5e-4274-be9e-f7e9b6edecf4', CAST(N'2015-08-13T10:00:45.930' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'728ff80f-887a-409a-977e-f82278fe7a5e', CAST(N'2015-08-13T10:12:51.817' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'034a20ba-cf41-4383-bcd2-f85c2fbd8641', CAST(N'2015-07-30T23:20:30.267' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1d60da73-19e9-4c93-8851-f876fe84a024', CAST(N'2015-10-14T16:06:25.277' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd531089f-ba7c-433e-952c-f888fa70b123', CAST(N'2015-07-31T00:23:57.593' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'7cf0b9ec-5a25-4738-b48d-f8a1f2ff4ef9', CAST(N'2015-07-30T22:30:11.723' AS DateTime), N'admin', N'::1', N'Account', N'Register', N'UserName=cwbyh,Password=abc123,ConfirmPassword=abc123,TrueName=财务用户,Order=1,Job=,Mobile=,PhoneNumber=,Email=,OrganizationID=2,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'85ca25cd-aff8-4a05-8452-f8ab817b6da9', CAST(N'2015-08-13T10:10:36.760' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ec5061f7-c798-4952-94e8-f8b778d3aa62', CAST(N'2015-10-14T16:07:54.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3a6e32d6-dcc2-44e6-ba11-f8d5af548038', CAST(N'2015-07-31T00:23:53.990' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'9839c2dc-b9a9-493f-a2b2-f90dafc84e17', CAST(N'2015-07-30T10:43:31.020' AS DateTime), N'admin', N'::1', N'ItService', N'getEnd_isitype', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1712ddf2-7bce-43b6-9853-f91283180a29', CAST(N'2015-07-31T00:24:37.073' AS DateTime), N'admin', N'::1', N'Account', N'RoleUserList', N'roleid=37b12aa1-82bb-43ec-833b-33f3e42acb91,')
GO
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f18b6e49-210a-4a6c-9ff7-f971a24117ad', CAST(N'2015-07-30T22:17:54.870' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd403b3b2-86f3-4be9-a90d-f9d2c81875a5', CAST(N'2015-07-30T10:49:58.827' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'dad4bdd8-20ee-43cc-b61c-f9e466c10d2d', CAST(N'2015-07-30T22:19:19.027' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0cea5e6d-4b4a-4607-a9f7-fa301c911879', CAST(N'2015-07-31T00:26:47.580' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0ddec78d-18ce-428d-b509-fa3f39640683', CAST(N'2015-07-31T00:17:19.223' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'aa280c9f-d210-40ee-b657-fa5df864ae4c', CAST(N'2015-07-30T22:43:23.403' AS DateTime), N'yunwei1', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'1b6fd22c-3882-44c6-a705-fa70d1ff9be2', CAST(N'2015-08-13T09:59:54.743' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'feaf63af-feea-4b4e-9802-faa977c9f29f', CAST(N'2015-10-14T16:09:19.263' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'78678ffc-c214-4105-99f0-fb025262d92f', CAST(N'2015-07-30T10:44:01.297' AS DateTime), N'admin', N'::1', N'DataDict', N'CreateDataDict', N'ID=3,DataDictName=OA系统故障,DataDictCode=,DataDictType=,DataDictNote=,parentId=0,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a2759b96-4639-46a1-984b-fb280bfe757c', CAST(N'2015-07-30T22:43:52.897' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'999f74e8-3c5b-453c-bdc7-fb2f9c9aa1ab', CAST(N'2015-07-30T22:18:44.397' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8b05b56d-ffa2-45ec-9539-fb323c8b289a', CAST(N'2015-07-30T23:16:09.963' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'fe34fbc5-8797-4279-a963-fb4ebcd80569', CAST(N'2015-07-30T22:18:45.317' AS DateTime), N'admin', N'::1', N'Organization', N'EditOrg', N'ID=6,orgName=信息中心,orgShortName=信息中心,orgCode=,orgType=,orgNote=,temp_id=,temp_pid=,parentId=1,ApplicationUsers=,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3dab46d3-451b-46fa-8ad7-fb5a89948513', CAST(N'2015-07-30T23:30:26.107' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'71c7d59b-c93f-4eb5-af2c-fb6710d9520a', CAST(N'2015-07-30T10:43:45.670' AS DateTime), N'admin', N'::1', N'DataDict', N'CreateDataDict', N'ID=2,DataDictName=信息系统故障,DataDictCode=,DataDictType=,DataDictNote=,parentId=0,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a43e77f9-15b5-42bf-bc79-fbcdaa062604', CAST(N'2015-07-30T22:22:24.077' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'40624f50-9dbe-429b-81b0-fc4d6012e6a3', CAST(N'2015-07-30T23:19:35.190' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f1d1f508-a7de-4c86-a25e-fc730adc0ac4', CAST(N'2015-07-30T22:18:19.020' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'3293c679-5155-416c-b6b5-fc971939c3e3', CAST(N'2015-07-30T22:31:10.130' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'f12d2fcc-1c8a-4276-840c-fca0a1944f3a', CAST(N'2015-07-30T22:30:24.377' AS DateTime), N'admin', N'::1', N'ItService', N'CreateWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e8d28f03-a63d-48ab-8715-fcabf04c87f6', CAST(N'2015-10-15T11:21:06.000' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'bb36ca10-7aa7-4176-909e-fcb9dc8de3a2', CAST(N'2015-07-30T23:12:42.353' AS DateTime), N'itgly', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ae6509e0-4f08-45df-aac6-fccb4f07bb13', CAST(N'2015-07-30T22:17:54.193' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlow', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ccd1af07-9995-412f-9c5a-fccdaa516e13', CAST(N'2015-10-14T16:07:59.253' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'969f43df-fbc9-4fb3-95d4-fd008b94e25f', CAST(N'2015-10-15T11:18:44.927' AS DateTime), N'admin', N'::1', N'Home', N'StartPage', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'656f80de-a0a0-4b23-8164-fd69de482ade', CAST(N'2015-07-30T22:17:59.717' AS DateTime), N'admin', N'::1', N'Account', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'8ce370cf-a0b7-4915-bf57-fd7b22cb736d', CAST(N'2015-07-31T00:18:19.297' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'91b704b1-9274-495c-9be5-fe16d43f2a36', CAST(N'2015-10-14T16:06:59.243' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'62e5bcf3-f9f6-4b8f-bb96-fe451ec534df', CAST(N'2015-10-14T16:06:50.273' AS DateTime), N'admin', N'::1', N'ItService', N'MyWorkFlowList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e66d8e83-e795-4ce2-8a97-fe9131b9b636', CAST(N'2015-07-30T23:10:12.050' AS DateTime), N'admin', N'::1', N'Account', N'Roles', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'825513dc-77b0-40cc-b999-feacce6c1508', CAST(N'2015-07-30T23:36:58.543' AS DateTime), N'jskkz', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'd62e6250-04c9-4aac-a702-fefcbb2d892d', CAST(N'2015-10-15T11:20:28.877' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=7,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'146add07-ee29-4150-9e1a-ff40d42e9fc5', CAST(N'2015-07-30T10:42:28.020' AS DateTime), N'admin', N'::1', N'Account', N'RoleList', N'page=1,rows=10,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'6ee92452-5760-488d-928d-ff5cb8e1ac2b', CAST(N'2015-07-30T10:40:29.137' AS DateTime), N'admin', N'::1', N'Account', N'UserList', N'page=1,rows=10,orgid=3,')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'e1b2d067-e32e-4cd1-850d-ff65d4d273f2', CAST(N'2015-07-30T10:55:34.430' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'a9a09a8a-fc80-46c0-8355-ff6f2ffa1e8f', CAST(N'2015-08-13T10:12:06.260' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'097f5174-60b0-496a-b9ba-ff8363852f4e', CAST(N'2015-10-15T11:19:49.117' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'97181b36-399d-4535-b354-ff9fc72ab680', CAST(N'2015-07-30T22:31:53.697' AS DateTime), N'yunwei1', N'::1', N'ItService', N'orgTree', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'0a8e7653-4677-4027-98e9-ffc251ff711e', CAST(N'2015-07-30T23:10:41.403' AS DateTime), N'admin', N'::1', N'Home', N'StartPageToDoList', N'')
INSERT [dbo].[Logs] ([ID], [logTime], [logUser], [logUserIp], [logController], [logAction], [logPram]) VALUES (N'ba9a101f-b634-4e10-9f95-fff611aec736', CAST(N'2015-08-13T10:08:43.780' AS DateTime), N'admin', N'::1', N'Organization', N'Index', N'')
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (1, N'根模块', N'根模块', NULL, NULL, 0, NULL, NULL, NULL, N'1', 0)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (2, N'系统管理', N'模块目录', NULL, NULL, 1, NULL, N'icon-sys-manage', N'是', N'1', 1)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (3, N'组织机构管理', N'模块', N'Organization', N'Index', 10000, NULL, N'icon-sys-organization', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (4, N'用户管理', N'模块', N'Account', N'Users', 9000, NULL, N'icon-sys-user', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (5, N'模块管理', N'模块', N'Menu', N'Index', 8000, NULL, N'icon-sys-model', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (6, N'角色管理', N'模块', N'Account', N'Roles', 7000, NULL, N'icon-sys-role', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (7, N'日志管理', N'模块', N'Logging', N'Index', 6000, NULL, N'icon-sys-log', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (8, N'数据字典管理', N'模块', N'DataDict', N'Index', 5000, NULL, N'icon-sys-datadict', NULL, N'1', 2)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (9, N'添加组织机构', N'功能', N'Organization', N'CreateOrg', 1000, NULL, N'', NULL, N'1', 3)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (10, N'修改组织机构', N'功能', N'Organization', N'EditOrg', 1000, NULL, N'', NULL, N'1', 3)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (11, N'删除组织机构', N'功能', N'Organization', N'DelOrg', 1000, NULL, N'', NULL, N'1', 3)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (12, N'显示组织机构列表', N'功能', N'Organization', N'orgList', 1000, NULL, N'', NULL, N'1', 3)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (13, N'添加数据字典', N'功能', N'DataDict', N'CreateDataDict', 1000, NULL, N'', NULL, N'1', 8)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (14, N'修改数据字典', N'功能', N'DataDict', N'EditDataDict', 1000, NULL, N'', NULL, N'1', 8)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (15, N'删除数据字典', N'功能', N'DataDict', N'DelDataDict', 1000, NULL, N'', NULL, N'1', 8)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (16, N'显示数据字典列表', N'功能', N'DataDict', N'DataDictList', 1000, NULL, N'', NULL, N'1', 8)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (17, N'添加用户', N'功能', N'Account', N'Register', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (18, N'修改用户', N'功能', N'Account', N'EditUser', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (19, N'删除用户', N'功能', N'Account', N'DelUser', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (20, N'重置用户密码', N'功能', N'Account', N'ResetPassword', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (21, N'显示人员列表', N'功能', N'Account', N'UserList', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (22, N'左侧显示组织机构列表', N'功能', N'Account', N'orgTree', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (23, N'设置用户角色', N'功能', N'Account', N'UsersOfRole', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (24, N'显示所有角色列表', N'功能', N'Account', N'RoleList', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (25, N'显示用户拥有的角色列表', N'功能', N'Account', N'UserRoleList', 1000, NULL, N'', NULL, N'1', 4)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (26, N'添加模块', N'功能', N'Menu', N'CreateMenu', 1000, NULL, N'', NULL, N'1', 5)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (27, N'修改模块', N'功能', N'Menu', N'EditMenu', 1000, NULL, N'', NULL, N'1', 5)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (28, N'删除模块', N'功能', N'Menu', N'DelMenu', 1000, NULL, N'', NULL, N'1', 5)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (29, N'显示模块列表', N'功能', N'Menu', N'menuList', 1000, NULL, N'', NULL, N'1', 5)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (30, N'添加角色', N'功能', N'Account', N'CreateRole', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (31, N'修改角色', N'功能', N'Account', N'EditRole', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (32, N'删除角色', N'功能', N'Account', N'DelRole', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (33, N'显示角色列表', N'功能', N'Account', N'RoleList', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (34, N'显示系统组织机构', N'功能', N'Account', N'orgTree', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (35, N'显示系统所有用户', N'功能', N'Account', N'UserListForRoleManage', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (36, N'显示角色拥有的用户', N'功能', N'Account', N'RoleUserList', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (37, N'显示系统的所有功能模块', N'功能', N'Account', N'menuTree', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (38, N'显示角色拥有的功能模块', N'功能', N'Account', N'MenuToRoleList', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (39, N'保存用户到角色', N'功能', N'Account', N'UsersToRole', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (40, N'保存模块到角色', N'功能', N'Account', N'MenusToRole', 1000, NULL, N'', NULL, N'1', 6)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (41, N'查看日志列表', N'功能', N'Logging', N'LogList', 1000, NULL, N'', NULL, N'1', 7)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (42, N'IT服务', N'模块目录', NULL, NULL, 9, NULL, N'icon-it-services', N'是', N'0', 1)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (43, N'申请服务', N'模块', N'ItService', N'Create', 10000, NULL, N'icon-it-create', NULL, N'0', 42)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (44, N'我的申请', N'模块', N'ItService', N'MyWorkFlow', 9000, NULL, N'icon-it-services-list', NULL, N'0', 42)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (45, N'申请管理', N'模块', N'ItService', N'WorkFlowManage', 8000, NULL, N'icon_wf_manage', NULL, N'0', 42)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (46, N'统计分析', N'模块', N'ItService', N'Statistic', 7000, NULL, N'icon_isi_chart', NULL, N'0', 42)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (47, N'起草者创建流程', N'功能', N'ItService', N'CreateWorkFlow', 1000, NULL, N'', NULL, N'0', 43)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (48, N'起草者提交下一环节', N'功能', N'ItService', N'DrafterToNextState', 1000, NULL, N'', NULL, N'0', 43)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (49, N'用户申请单列表', N'功能', N'ItService', N'MyWorkFlowList', 1000, NULL, N'', NULL, N'0', 44)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (50, N'用户查看自己的申请单', N'功能', N'ItService', N'ViewWorkFlow', 1000, NULL, N'', NULL, N'0', 44)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (51, N'显示所有的申请列表', N'功能', N'ItService', N'AllWorkFlowList', 1000, NULL, N'', NULL, N'0', 45)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (52, N'查看申请单详细信息', N'功能', N'ItService', N'ViewWorkFlow', 1000, NULL, N'', NULL, N'0', 45)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (53, N'删除申请及业务数据', N'功能', N'ItService', N'DelWorkFlow', 1000, NULL, N'', NULL, N'0', 45)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (54, N'显示统计分析列表', N'功能', N'ItService', N'ItServiceList', 1000, NULL, N'', NULL, N'0', 46)
INSERT [dbo].[Menus] ([ID], [menuName], [menuType], [menuController], [menuAction], [menuOrder], [menuNote], [menuIcon], [isMenu], [isSysMenu], [parentId]) VALUES (55, N'导出统计分析xls', N'功能', N'ItService', N'IsiExportXls', 1000, NULL, N'', NULL, N'0', 46)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Organizations] ON 

INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (1, N'您的组织机构全程', N'您的组织机构简称', N'', N'根组织', N'', NULL, NULL, 0)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (2, N'财务部', N'财务部', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (4, N'办公室', N'办公室', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (5, N'公司领导', N'公司领导', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (6, N'信息中心', N'信息中心', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (7, N'技术科', N'技术科', NULL, NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[Organizations] ([ID], [orgName], [orgShortName], [orgCode], [orgType], [orgNote], [temp_id], [temp_pid], [parentId]) VALUES (8, N'办公室', N'办公室', NULL, NULL, NULL, NULL, NULL, 6)
SET IDENTITY_INSERT [dbo].[Organizations] OFF
SET IDENTITY_INSERT [dbo].[WorkFlowItems] ON 

INSERT [dbo].[WorkFlowItems] ([ID], [WfInstanceId], [WfType], [WfBusinessId], [WfBussinessUrl], [WfCurrentUser], [WfDrafter], [Wfstatus], [WfCreateDate], [WfCompleteDate], [WfFlowChart], [WfWriteField]) VALUES (2, N'29e88da2-30e4-4f8d-b2a2-d0c065f1ba76', N'IT服务申请', 2, N'/ItService/OpenWorkFlow?id=29e88da2-30e4-4f8d-b2a2-d0c065f1ba76', N'System', N'admin', N'已结束', CAST(N'2015-07-30T22:42:23.770' AS DateTime), CAST(N'2015-07-30T22:43:43.367' AS DateTime), N'起草IT服务申请(管理员)->信息中心分派任务(信息管理员)->技术科分派任务(科长)->运维1正在处理(运维一)->信息中心确认任务完成(信息管理员)->结束', N'')
INSERT [dbo].[WorkFlowItems] ([ID], [WfInstanceId], [WfType], [WfBusinessId], [WfBussinessUrl], [WfCurrentUser], [WfDrafter], [Wfstatus], [WfCreateDate], [WfCompleteDate], [WfFlowChart], [WfWriteField]) VALUES (3, N'bc987e01-d1c0-459f-b224-1c33a08ea03f', N'IT服务申请', 3, N'/ItService/OpenWorkFlow?id=bc987e01-d1c0-459f-b224-1c33a08ea03f', N'jskkz', N'admin', N'技术科分派任务', CAST(N'2015-07-30T23:12:20.903' AS DateTime), NULL, N'起草IT服务申请(管理员)->信息中心分派任务(信息管理员)', N'ProcessingDepartmentOpinion')
INSERT [dbo].[WorkFlowItems] ([ID], [WfInstanceId], [WfType], [WfBusinessId], [WfBussinessUrl], [WfCurrentUser], [WfDrafter], [Wfstatus], [WfCreateDate], [WfCompleteDate], [WfFlowChart], [WfWriteField]) VALUES (4, N'a365c4b7-0bb2-46a0-a84e-ac04655646ac', N'IT服务申请', 4, N'/ItService/OpenWorkFlow?id=a365c4b7-0bb2-46a0-a84e-ac04655646ac', N'itgly', N'admin', N'信息中心分派任务', CAST(N'2015-07-31T00:19:49.980' AS DateTime), NULL, N'起草IT服务申请(管理员)', N'ItManagerOpinion')
SET IDENTITY_INSERT [dbo].[WorkFlowItems] OFF
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[DefinitionIdentityTable] ON 

INSERT [System.Activities.DurableInstancing].[DefinitionIdentityTable] ([SurrogateIdentityId], [DefinitionIdentityHash], [DefinitionIdentityAnyRevisionHash], [Name], [Package], [Build], [Major], [Minor], [Revision]) VALUES (1, N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[DefinitionIdentityTable] OFF
INSERT [System.Activities.DurableInstancing].[IdentityOwnerTable] ([SurrogateIdentityId], [SurrogateLockOwnerId]) VALUES (1, 14)
INSERT [System.Activities.DurableInstancing].[IdentityOwnerTable] ([SurrogateIdentityId], [SurrogateLockOwnerId]) VALUES (1, 34)
INSERT [System.Activities.DurableInstancing].[IdentityOwnerTable] ([SurrogateIdentityId], [SurrogateLockOwnerId]) VALUES (1, 35)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (1, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="StateMachine">
  <StateMachine Name="StateMachine" CurrentState="起草IT服务申请">
    <Transition>向信息中心提交申请</Transition>
  </StateMachine>
</StateMachines>' AS nvarchar(189)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (2, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="StateMachine">
  <StateMachine Name="StateMachine" CurrentState="运维1正在处理">
    <Transition>完成</Transition>
  </StateMachine>
</StateMachines>' AS nvarchar(181)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (3, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="" />' AS nvarchar(40)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (4, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="StateMachine">
  <StateMachine Name="StateMachine" CurrentState="技术科分派任务">
    <Transition>运维2处理</Transition>
    <Transition>驳回</Transition>
    <Transition>运维1处理</Transition>
    <Transition>完成</Transition>
  </StateMachine>
</StateMachines>' AS nvarchar(286)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (5, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="StateMachine">
  <StateMachine Name="StateMachine" CurrentState="信息中心分派任务">
    <Transition>技术科处理</Transition>
    <Transition>驳回</Transition>
  </StateMachine>
</StateMachines>' AS nvarchar(218)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable] ([SurrogateInstanceId], [PromotionName], [Value1], [Value2], [Value3], [Value4], [Value5], [Value6], [Value7], [Value8], [Value9], [Value10], [Value11], [Value12], [Value13], [Value14], [Value15], [Value16], [Value17], [Value18], [Value19], [Value20], [Value21], [Value22], [Value23], [Value24], [Value25], [Value26], [Value27], [Value28], [Value29], [Value30], [Value31], [Value32], [Value33], [Value34], [Value35], [Value36], [Value37], [Value38], [Value39], [Value40], [Value41], [Value42], [Value43], [Value44], [Value45], [Value46], [Value47], [Value48], [Value49], [Value50], [Value51], [Value52], [Value53], [Value54], [Value55], [Value56], [Value57], [Value58], [Value59], [Value60], [Value61], [Value62], [Value63], [Value64]) VALUES (6, N'StateTracker', CAST(N'ItService' AS nvarchar(9)), CAST(N'<StateMachines CurrentStateMachine="StateMachine">
  <StateMachine Name="StateMachine" CurrentState="起草IT服务申请">
    <Transition>向信息中心提交申请</Transition>
  </StateMachine>
</StateMachines>' AS nvarchar(189)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[InstancesTable] ON 

INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'69ad1ef9-7837-4fef-934d-56f6b71a663e', 1, NULL, NULL, 0x1F8B0800000000000400ED5B5B73DBC615162CD22265C9929C38B726B1E2266D1D49A028EA9EB882AC8BCD5A175B9265B7AA052E81A5840804185C24D39DCEC8D14C6C35ED4B673A35F3E2C9737F405FFAAFFA90C7F660B10B828048B122D919D9193F8806176777BF73F69CEFEC39143AEF197A011B96824D21463F1785EB77717113A936BE87146335F76805E531D28A1BC502D656960F0E3657D0CC85B4FCCD4CC479F4F2DFEB45D3C2797E4E57552C598AAE99FC6DAC61439178BFA4CCC8D6161DFA28AFF24B8AF6354F640FF6071E0FF66F62C304413747F961E7DF60FF9CAD5AB6816F6AD8B60CA40EF6DFB3B3AA2281FC0D7D0F6B37B31313684C1A1B4F4EA546F1F0E4D4E34136D76AF62B58D5607FDE94744355B2CD10FE7826366B9A389F558B87B15BBB9655984E244C6917E791C9CBC84292AEC132258BD78D9DC4C8F0F068627822511DA738A7DCA0520E0E0EF883147B2F9978B4BCB44E040F299A69214DC271EE692A30655E910CDDD473162FE97967BE5422399C5807152055798A1C9D2484F63D5C74F4F6E2C2CCA545589B6E1095BEEC45D38E86D9686C50BD7E1CD00A1F18E541F0722D30B20910C7393411D8E469B832A312221A6C87ECB49D6EA59B2E70DD32146DC7AFBCB6D2FC1F6C439BA6CA1BF2901C0224A7E96BB360D5FB8A734A12609089827768FEF85037F672AA7EC009D17DE7C490592374D6CF43AFF36BB6662979CC5389C5852758B24113E525BDDC08BD75063853C96C2E3539368EE4D4F8284E8D0957D84AD3D48AD2726CEA7480C18A864798E19661287D3A3E85E424CE4D0D4D4CA626864673383704274F1E1A1BCF8D672792687C3C85854EB0320A1C0126DAC094C2BB9E81CA6C0F4B8A699944F2C599C8BAF214BF8882DDCC9EBEAD8AF358DE1653CF763FD30F9B69191578F6D999954CDA21749A604E2A4E83FB234F6254F3D7433AF434CEA4B45AE3F5405D0506E16A19EA056D5F31742D8F3577CFF17AE456B19AEDCB2E5C4BBA445C1281AC93427618868C8DCB24B7B6660B08BC20BFACCB583579C79817E1D8A5B57BC880C36E6163B0DF1D523E2CC97A638766ABEA639F4B6FCD118C73D93A0E5C1595883EF77229CE4963F5DA78056E990ED94039008B20DF558A2239AF681CC7093169575165036BE49BEE0694DCD8368307EA722D5BECD98EABD4945C2FD04BBD40448C31DB21FBE9A336F65DD8C63611C4C8AC8A33C901F691BDEAB115376AB48C41B4C6DC98C5B4AFE1DC8B2EBE5D53D46F392E00CC9537109820066FFD84C18BB72906FF3ADB01F145D0750B4130846861F2E4E332B86D45C30BFBF068196968C7F1D4A159CA4EBB6EC21F6438AD77E0EC443914FA2AF8E0F97A7D7068BB2E3404A54CD7AAB66120CD047AA96BCF333D8432E15BBABE9747C69EEBD7DE11A30AA0EAFEE75DAAABBF51B127A55D0E4571A266786626B8F54A38142F8AE555BFE7BAE6434E8C8A2630B567624CDC7793BC671C97897E6D63CA9EDF8F737213522A7451448681DC8CE703363B8A8ABB18C9CFE02F5905FCB590A23E43FED570DCF6C502826068CD10EF1967DE3310267F2606C3D587C295393D5F50B1A34C063509411F6DF7484855B348DA7B68A00224DDE4F1C754997F0F6B8AA50A8BB6269585CE550AF129F95C46A9EDDE20D37621BF4C21DFEE62A839C92781EC5AA9675523BE85A282B7DFD63096CD0DFD36B276B1B16A5B05DB329F03ADA94164FB83E4E1134A1E3A0231F23A55D13FC22A624CC1A78537CB1592E371D5D555B33C6288A4FC9C2AE0695D0A3897C720C8493EA55BFE5378CB8CA5D622AC69CD4A8D9C33BE1A84E0330AC19FCF0601385F152E2DCF3908BFA020FC7036107CCE8805A3D6C7FDD6A43341F3F82545E627AF5CBEE46304B5D55E99D1A14A96D4C31E0758D2AF422CE9465596F4F9C92C69802AFB8BF031602C89D188AA4CA9D5F76DD598CC87D599CCA0C36416A05050644CA6366519AA04BC9F493EE95A8DA790BD4111849AFF51E83A2B11B2C0E1AA16983CD90247CEB105DE607612E6D2A9520F70056C6848752B11B8B6058E0649F31825CDD100691EA778BDC69C8D795BE73A60E29FBD077F491FA5DB36DABA777E584BD93F7E170C5893AF3F22C12D4FBDFE5B664650F396759AE27002952D679003704F8BE1CE41C2EC99777D732E531AB1336BE76047B731A4E262B7A2414300DB19C9E3BFA0A8FC351CD41FA1BCEAF8A51D83D489A0B3205F50542CB3F77DF9F6B9C446B8C676B4A6EB16A32EF76D28D6E7142CA76502D097AFC0197FB4F0A46060D36986A836EEE6AB76EEDBA8D085BD9169F9B85DB85CFEFF067EE256EF7E5D8AADC06768BDD813FA72BA9176EEAA9C7B4882F373E11D95D6533C639C73CA6E643933AEBEBE9FE2A8C2EAB878DCB041BEAFEFA315DAF21A3D9C669426E77B4D1657E6A087705BC2FF6FF7C719FF75AA40E36E24F33EC178356792D606078307E3BB7AEAD6AE6B44B3998EBCE8D4A7934489B74A9187B9B4C61E8E90877395FD201F48D30F34C52AB22230B18D3BBA2A7B9D21D7A805541DE6B5861C0A9179688721D3CCD3035FAB19E3938A7AE549755E214E6675364AA42E50A95D744DE4EEC30774ACED382274B16E1DEF1671B18EC5DC6CA8A20CB7DAA7E8E6365383AB9B3BA54B73B6E15C3B3F30B1C1BE735594FEFFA8E83775A052A9BEA03AEE9E4D1D4B754C7CB7891D5CA72B679929C055CE4AD973B22F46DCABEA34CB7B4F53F72A7BD19578AFD4B55A503470EC8B0A5665F665502AD44648A9E23892F16A14C7114E0894BEEF5300CF56156281B5F5B7439555A135E6C67CE903A1529D14D4E0F3BE2ACFAF5479FE16530E2D3B1D436B00AB3B392876191080BD961C32758CBD12A4B3EB14E2D7BE53A582D45E72E13873CF097497545E5B0C317C8578D636E1EA035AE28E1CF662614DC6B2172E36C4AB59A0237BD061C52E2FDDB1623C5B511D7D104AEF374522CE496B89C3277A9D60F302ABBAA0C8C71D42543F00524AA2C8C3525FDA8280B7AF48A4F6BA0CB5573A2EEA1FF7A8145BC750AB049A4EBF8EF8BFFE6DA99BE5D3A44245C75CF08FF95DA9CB5F19778734D07073E417BED580A052DC8380DBEE646C13C82881EF4B065F9DCD71BFAF688E23226851AF9E25566983AA5C9793793F7E75C1B1B0FA1AF6B6C36BA2D7734D5D930884FCC748BD8BCA8417456F6C9ABA28048BFA4FDD8BCA861735EC1A40531725C1A20EA34E03DA2576A69777DC13D9487B2A78960A0F815DCFFDFD67B552977985F4AE23A3E84B58E82980CE5F9E39A116C5482F8DF14DC92EB7D9D481E27F8B56E2EB84843405059B16BD0EE91ABDE6B34EE7852974D0367EE26273347C5627EA4742CCC98BA1F3C235811DFAC640F886802132C03E782F7AA9476BEA50B1366896BC83CC5DA7DD98EC6BF7D47D4132DEEDFF2184DBC7A350A3BC51CB28FDAFBDE966B9E5374C97387E136B13C6FC18ADE69841B0BF813353483EB1EEDC9FBCDF8C5F6DB8BFA820A16DD3758E0D35BF56FC86E02B10D57823BB58A5BD86FA722075C1D37DC28F2CAA74737362B89EB057EA5DD5D6B069E7BD0E3631C634E1F2080FA97AA6AE4603206270C2450D38635A3EE284BE5D6442139DB48765A05686851B091ECF85CB2A32BDA4A0A1DF4900C97CCF5925591C10D9350CBF419257EC7C161BF504D22AD01F5FAD91B8342017B24AE77730B2AD520FAC3622CC51D27F0141E1809462360000, 0x1F8B08000000000004009D91CF4A234110C619891085F519869CC3F4C4897F904C4CD44B90152141BC76DA4AD2D8D313BA6BC4897858F6B40BB22E78C8C18BE0553C88B8ECC507F19A64F318DB6314920822D2A7AEAEEFABAF7F555AD80FC4AE0ADBA030DEA0CDF5542D6E4377B11A6B84C02933E4471C3968672B52B42EA0223552C9B86C3A53CA74596B08EA22EE363EA0CEDA7BA0340FA59F77DCE464EDCD4860A4C09710A1A2226BEF4675C1D936C4B5F010A4EFE5EA0D6F7569991E78CB79F096D2DB2DC4F61A219AB520A0DA39A04859288D98A113AA265974DD3C7157C807F2CC591D6FCA2EE04C853A6CA0C3C220F1F248CE2555509C0ADEA168C293D2FC0B3C83A8947E05999ADDDFA101744B27EF5AC231824C186862F86B6E904B06A75B5CB7058D1387D4681D33B97C6A768F8A08BA731534098E3803EBEDBCF2A7E6559122D40CB443506F073E159EDFBF52D6E212B4D992522071BCE867C66F99E29779DB9E50D9C95FA6BA268CFCCCF0FE6178F6A3521B5C9EF57F5EFDBBB81BDE3E8C9C8C9709673825C08BFDF3DFBDC7ABC1B7DBDE9F9BFEE3F7C1AFF3DEDFEB517B818CF53D6720E3B94CACC24441172DCBFA0F5127464C01030000, NULL, NULL, 1, 0, 1, NULL, CAST(N'2015-07-30T02:49:43.117' AS DateTime), CAST(N'2015-07-30T02:49:43.107' AS DateTime), NULL, NULL, NULL, NULL, N'[起草IT服务申请: ItServiceBookMark]
', N'JSK-PC', N'Idle', 1, 0, 0, 0, 1)
INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'bd31a684-e0c9-446a-b1cd-f7977997fd77', 2, 14, NULL, 0x1F8B0800000000000400ED5B5B73DBC6153624522265CAB29D2871D224569CA48D6309144549B494BA822CCB366B5D6C49BE55B5C025B094108200838B64BAD38E13CFD456DB99CE74A613D32F993EF707E4A53FA28FFD1FED0FE8C162170401916244B233B23B7E30B558ECE53B67CFF9F69C0361E0B6A197B16129D81462F47745B8700B57EE21D5C6B79162AC161EACA012465A65A352C6DACAF2DEDEBD1534D79395BF9D8B384D2FFFBD5E312D5CE2177455C592A5E89AC9DFC01A361489F78F949BD8DCA45D1F94547E49D1BEE6C9D8A32381E6D1917BD83061A02B93FCB8F36F7464C1562DDBC057346C5B065247476EDB79559160FC0DBD88B52BF94C064D4953D3A999F4241EBF3CF36894CDB59AFF0A56353A523225DD50957C27067F34179B374D5CCAAB95A7B1AB3B96559E4D264D69079790C9CBC84292AEC132258BD78DEDE4C4F8F864723C936C8C539C532ED251F6F6F6F8BD347B2F957CB0BCB44E061E5334D3429A84E3DC937460CA922219BAA9172C5ED24BCE7CE9646A3CB90E2240AAF2043932490ABD455C71E4F6A267EEE475589B6E1091BE3C8D661D09B3DED8A072FD2820153ED0CB83E0E55AA06707208E732813D8E461B832A512221A6C87ECB4976E65902E70DD32146DDB2FBC13D56BBFB10D6D960A6FCC43720C909CA5AFCD8356EF2ACE2949824226CBDEA1F9ED7DDD2816547D8F13A2BBCE8921B346E8AC5F845EE7D76CCD524A98A72356161F63C90649D496F47223F4D611E04CA7F285F4E5A96924A7A727717A4A38CB569AA55A9495633387030C5A343EC114B70643F5D3BC9C4EA1E9CB9363785C9A199B9C9C4663F994248F15323399CCCC4CA6206732C2006819058E00136D634AE15D4F4165B68725C5B44C3272DF5C645D79825F44416FE60FDF56DD79AC6D8B89676B84C987CDB48CCA3CFBEDCC4A26ED17064C50271567C1FC91961895FC85900C3D89B351BA2DF156A06E0083305C837A51DB550C5D2B61CDDD73BC95711B68CDD62917AE255D222689403640217B1A868CF5CBA53637E7CB08AC20BFACCB5835794799AFC3B1CB6AB7910187DDC2C6E888DBA5765852ADFA0ECD56D5473E93DE9D2318E7F22D1CB80622117DE6E5649C93A65AD5F13ADC72FDB2810A0016413E518D22B9A4681CC7093169475165036BE4C9601B426E6F9BC10375AA992E0E6DC555AA4AAE15384DAD40448C31DD21FB394375EC8F611DBB87C047E6559C4B5D623FD9AB1E5B71BD46D7184477D4CDAF3167ABFD155BDBC34A8A0B20F3D61B8ECCDB3F0CFCF3CFFFF95DEA44E4619F150467F80D07E71D2E88C8BB14917F1CED20F93CEDBA85C06982573179F27319CCBBA2E1C55D685A461ADA762C7A68969A716FF962106442DD37F4FE93770E6CF5B5566D7568BB2E3404A5DCF0826D807DB616744D062AAA6B594DC68FF77B7289556DC3409A491A9FE78608E7C25775BD584246D1358CEF895105E076FF789F0AF1AF74BE83EE6D0EC771DC6E78496CE0EE4BE7A9D827D656FD939A6D674BE07B3545FD3DE8E88F6EE0C4A868025FFC468C89BBEE5573BF8FE372D1AF6D4C49FC07714EEEC0CD0EF589C830907BF1FA90ED2137BC6128DBA0E30B7AA9AC027D9189E2D30D75EF2987A2E20E46F27E2FFC2000C0FF16525468A821D10F8C80DBEA2B2347DFE67AD770E1459C2E2DC8143E12831EFBBC70966E0A7494098678E191AD2109A96A1E49C5FB062A43DC81347F4CD5F1BBB0AEB1DBD2755B936A832ED40FE253D363E9A8B74E072F1B2EE4A728E45B09869A73FF26905DA80EAD6AC46C32FDD97A5BC3583637F41BC8DAC1C6AA6D956DCB7C0ECCAE0997FF24C89F3EA5FAD91F60099F5111FD3D2C2246967C5278B3AC3C391EE75C5975CAD887FCEE4FA9009EB4248063790C8254E36774CB7F086F9911F5669C3DAB59E9896346D983107C4E21F8D3D12000E3AB42DCF69883709182F0B7A381E03346CC19759FB974E74617548F2F2832FFB7CAB53827E3DEDDB6CA8C0ED5B3A421D61C88A75C0AB1A4D1862C69EC6096C453617F193E068C25311AD19029753BE4D888C99C6FCC64920E9359845C49853199E69465BC1EF04FD8C80745165314B237C88350F57F168AE84D843430DD5003270FD6C0A963AC81A34C4FC25C7ABA3A045C011B1A52DD640C6EAE81992069BE4C497334409A67285EAF316763D6D6492ACEFE90F8D7AB87DF49C5CFEF1F144BFBF2F54723E89F7FFEFA6F99290071B76799F70B1C842B148703686CEDF67809A20C18E20D12666D5EF0E9585E67C481BC5D801DDDC0700D1707150DEA21D8CEC81DFE171495BF841DFA0354521D9BB46D903419145694CA8A8A65F6BEEFAE7D2CB111CEB31DADE9BAC568CB1D1B6A150A0A96B3320168EE7B30C41F2E3E2E1BD8746A411AF513BEEFE11242027B1DB310DE124ED5FEDEC08FDDDCE57C35B602BFA1F0A4289C29E846D689BD39D15502F373E11D9566933C5D5C70928E6435575D71BD9AE1A8BC5A889A6ED830BEAFEAA51BC2F2CA5C9C529C0E5FF53A3C5C8D7E3E854009FFE3A2E2397F2C78C18BA3BE47305E2D98A4B0C3C1E0EEF48E9EBEBAE3EAD0B55C7F4974B2F32922C4C56AE47E21ABB1C609D278BDBE1AE67D69F6AEA65815960227BA71535765AF2EE63CD58086DDBCC298A742E41A140391696ED0F3DEAC14E5E3BA6CED41596E214E6675364A46BD49474DD03591B0870FE8D889FD889060B54A5E0031DBC262AEB4954F8760FA21B2F92513832B9B5BD59334C371D7C4067BE68A68E97F23A2E51650A9175F501C2B4713C76A0B13DFEA60FDDAE1C2B9CD04E00AE74ECD72B207136E947A8939FDC3C4BDC65E74475CAF2656CB8A0676FDBA8255993D0C8E0A291992A7D88FE46AF98908270412FF1B14C0A3A5B4985FED7E60A83EA5759799311F61224C6A80821A6C3FD3A0FDAD06EDC34C3834DDB50F85115EBE0B504C18E07FBD822432758CBD1264B3F728C4AF7D9D4E1DA73DE9C271E48A9B50226D9CE12BC4F3B609510F28087CE6B0170B433E57F6DCC57D71380F74A408F5652C6EE9F615E3F9BAD4EE83D0CDFEA14886736EB4C4E013B9CEB2798154F528F2FE7921AAEF0127255EE457D533590B1CDEAE2291C4F132248E69BF0FFDFD36ABB1750C295260E9F4F107FEC7BFAE0EB2AB34494ED13E3DFE3E8FAA097FBEDFEDD246B9D133FFE05B6D0C548D7B10705B038C6C021725F0CD31F85A2C0D14EB4A03C910349FD7CA121B1481D5AFCBB974E780FB42AAB6B57245145E53DADD5647D7948735F5B5BA2629BC261AABE9E89A645853B4D535E1F09A6804B3A36B2AC09A1CE90927D9815EDE768FE3762BF334A8B104B352671E765CB3FDEAB366F7966B0A29DB4746C5775BA147008A9E796681BAE420BD3B8C6F4A16D466530792FE5D5A89AF0814EE282858AFE915873729B39F77AA3D4CA19F7EC140ECAB427D6713963E28C49C4B31945CB83AF0157DE552383CC020B9C47E782F7A178FEE24A06227A0FCE32632779C526BB2B1E2E11BEB1506FD1F81B825482AD5CA8BCDB4D2FFDA9BAE979B7ECD7469E3B7B113C2941FA3D5025308F67FE0D094538FAD9B772EDFE9C4172BEED724C4B13D749D485B85BF75DF4F9460A8F68BF8C5067535D4E701A50B1EEF033E3069606539319C48D0AAA757B5356CDA25AFF8AE5699E6B2080FA956A66E4402C06570429F068C11025D40E2CFEC20130A00A52296815919504BD686FB782E9C5291E9DD09DAFA480438E63967996471C063D7307C8025AFD8A53C36DA58E2BED1E4DED2C6B870A9743E02926D959A60BD9DC11C29FD17B15426FF5F370000, 0x1F8B08000000000004009D913D4B033118C73969A10AFA198ECEE572F55A15E9D5565DA4288516714DE3D33698CB95E439F114371107878E1DDC7470D1C9CDC1C98F52F563986B15DA0A2292294FF27FC92F95A58340D455D80385F126ED6CA49A710F06CB8D5823044E95213FE6C8413BDB91A22D013B5223958CCB8E33A3CC54B586A025E241FB0FEA9CBD0F4AF350FA05C74D56CEDE8A04460A7C09112A2A72763D6A09CE6A1037C32390BE976FB5BDB5E20A3DF4560AE01533B52E626F9D10CDBA1050ED1C52A42C9446CCD00955872CBB6E81B8ABE40F7DE6AD536FC62EE04C853A6CA3C3C220F1F248DE250D509C0A7E4AD1942795852F78065125F30D32953ED8A3010C2A67BF5AC209824C186862F86B6E904B06E7DB5CF7048D1387D4F83BE6F285547A9F8A0806F33B681A1C7306D6CFBCEABFF21A48119A06DA11A89F81AFA5D1F92E655D2E419B5F520A244E0EFDECE42E5B5E5CB0ED29959DBC65E6D694919FFD78E9BF3F3FE5DF1E6E8737F7C3BB8BF7FEE5D8C858996E0653C2BB3C7CBC7EBBEA97C8C4689446261B9802A5A9812E5B96F5091F729118EB020000, NULL, NULL, 1, 1, 7, NULL, CAST(N'2015-07-30T14:30:25.103' AS DateTime), CAST(N'2015-07-30T14:31:22.620' AS DateTime), NULL, NULL, NULL, NULL, N'[高静正在处理: ItServiceBookMark]
', N'HERO-20150527KX', N'Idle', 1, 0, 0, 0, 1)
INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'29e88da2-30e4-4f8d-b2a2-d0c065f1ba76', 3, NULL, NULL, 0x1F8B0800000000000400AD545D6B1341146DDA54D28AA03EF924417C5192D94D36DF50B2B57E106CD3D0845A280567676F9A31BB337166B6DBAD08E28B827F2005FFA57FC0D9659396142998EEBEEC0EF79E7BEF39E78EBDD9137C02425190762EFD8EEC67EF213AC45E003D4CC5FEF0A88B7DC02C1A441360DDBD303CECE2F66AC7FDDECEC647D33FFD482AF0D10EF73C208A7226D13B60202841D7913E968F8FD3D023DF43BB947D46097621BF705CC81F82901A68AB82CCF82DE477024F0502B618044A60AF90EF058E4789C61FF031B02DA75EC75552AD959A5605CC46F3A430ABB5EF7CD25D15F2BE245C78D4B90BF093766E5B4AF01D2FFA967B35526AD2320C4946E063895CAC30E14CB74914E2E2D4289B66C530EBC6BF79DAC8D017294A188628B4667925E3686FB79F001729930A33021B990B6BA1A44F89E0920F1522DC8FEB5946C934FA5A02ECD10B1C6B62D86B638862DD7EAEB6EFBFD5BD7191483A7D885BB1C2B36810A9AE4F1754410B51730AA6070B917740F14606D71786BC8DD799A9EC2CD3E32493AEA5A33C481BEC2B41D9E975F1562E5F7F09046BA5E215E74C163593AD346D5BBBFA8CC65B6268431A93F9D27CFDC0C578E8F13063AF9FC51B9354CDA6555FDE4847070153D4079422466FCE81045A89AB96A6831B59FF41A755728656A35AC3AE55AB8055B51FCF3AEDA42EEAB8B9E6ED046B1799E59971AF68B87C5E6E42A3E1E272D132A152AC0C1B6ED129EB5FD72466AD3A2C39B85EB337B5CB52E21262D6972899B11F8DB01CE8A51A83DB5758285866821FF61306E72AC1D39638007D39B8DDC077402CD1E4AFDF2BF6BADE52054B805CDEDBF1B80437A39FBFBAAD9651A2050000, 0x1F8B08000000000004009D91CD6AC24010C74989A03DF41982A71E241B4DB4A5346D6CBD88B4088A78DDACA32E6E76C3EEA43496BE471EB79B7E40512852E636C3FF83DF2417CB4C4CB5CA4163F94037F7EEBCCCA1EACD4A8390F94386FC852307E38F0A4D53016369904AC6E5C63F503687C640968AB25A9FA0EE780BD0862B19477E504FC77B2C04161A6209056A2A3ADEB44805671328E76A07320EBBE93ABCEE0FE82A1C4410F69B932D627E4388615BC8A8F157142953D28A19FA4A6F482F0822125C9113FAB49C7D78609771A695516BF499CA6AAF9074033203CDA9E07B8AB63C49CEBFE1594449F307A4DB583ED30CAAE4ED4F4B7845903503432C7FC32D72C9E07DC44D2E68593BB85FEF38EB466E63414501556B8CB6C10B67E01CE70DFF9537438A30B7D076A08F032F6F3FEF4F946DB90463BFA43548FCBD8CDB6D8FDC398EF301BF09AED54E020000, NULL, NULL, 1, 1, 6, NULL, CAST(N'2015-07-30T14:42:22.107' AS DateTime), CAST(N'2015-07-30T14:43:43.350' AS DateTime), NULL, NULL, NULL, NULL, N'', N'HERO-20150527KX', N'Closed', 1, 0, 0, 1, 1)
INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'bc987e01-d1c0-459f-b224-1c33a08ea03f', 4, NULL, NULL, 0x1F8B0800000000000400ED5B5B73DBC615362452266559F225769CA489152769EB58024951B22EA923C8926CB3D6CD927CAB6A814B60292104010617C954A7336A32535B6D9F3AD3A999174F9EFB03F2D23FD1DFD2C7BEF460B10B8280483122D919451D3F98C265F7EC77CE9EF3ED390742EF8AA197B06129D81462F47759B8F110979F20D5C62B483196F3CF96501123ADBC5E2E616D697177F7C9129AEECAC8DF4C479C4B6FFEBD56362D5CE4677555C592A5E89AC9DFC71A361489F78F941DD9D8A08F3E2BAAFC82A27DCD93B18706039787069F60C38481EE8CF249E7DFD0E0ACAD5AB681EF68D8B60CA40E0DAED839559160FC75BD80B53BB9F17134268DDD4E4DA647717262F2C5109B6B39F715483534583425DD50955C3B067F311D9B314D5CCCA9E5FDD8DD6DCB2A4D2512A6B48D8BC8E465642149D7404CC9E275632B31924C8E2692E389FA38C539E5261D65777797DF4DB3F75289678B0B6B64E06145332DA44938CEEDA503531615C9D04D3D6FF1925E74E64B2752C9C41AA800A9CA1E72749210BA0BB8ECE8ED75D7F4B97B209B6E1095BEB980A61C0DB3A7B141F5FA51402B7CE0290F8237AB8127DB00719C43E381451E852B332A21A2C172C84ABBE952CE5301D72C43D1B6FCCA3B5399FB9D6D68535479C31E92C380E4147D6D06AC7A47717649020C3251F236CDEF9FEA4621AFEABB9C10DD71760C99354267FD3CF43ABF6A6B9652C43C1DB13CFF124B3668A22AD29BF5D05BC780339DCAE5D31363B7919CBE3D8AD363C2252669865A51468E4D1E0D3058517284196E1586CAA7396972621C2753C3724A4A0E8F8E4DE687732323A3C329299D46C9098C92E9BCD00B56468123C0445B985278D7335099AD6141312D938CDC331D5953F6F0EB28D8CDCCD1CBAAD98FD56531F56C0E32FDB09916518967BF9D59C9A467855E13CC49C519707FE44A8C6AFE4648879EC6D9289DD6783350D78141B852857A5EDB510C5D2B62CD5D73BC9971EB58CD66BF0BD7822E11974420EBA590ED872163CF65531B1B3325045E905FD465AC9ABC63CCF760DB65B41564C066B7B03134E83E52DD2CA966638766ABEA0B9F4BEFCC168C73B926365C1D95883EF7722ECE4963CDDA780D6ED9B3B281F2001641BEAF12457251D1388E1362D2B6A2CA06D6C89DF32D28B9B5650637547F235B1CD88CABD4945C2F70817A81881863B643D67391DAD89FC336F604418CCCA9389BBAC57EB2573DB6E2468D8E3188CE989BDF622E55A25F9985C21E17C0E5F229C7E59D1F7AF77389AD7F9523CF7BAC2038574E3938572B1FC08940C2A6E3B4E7700919961305964B8A06743288D6BB14AD7F1E6F8BF962F09A85209CC24C264F7E2E82E357343CBF0397169186B61C5F1F9AA5EAF69B3E32043952E743807F4F5E032F3ED7AC170F2DD78586A094ED5BD6D60DA499405075ED557680902E7C57D70B4564145CCFF89E18550055F78FF7A9AEFE46873DECE0E6901C27EE86676603775E09FB628F5895FA83AA736722F0DD9AA2FE114CF1475FE0C4A8680261FC83181377DCB3E64184E3B2D1AF6D4C59FCCFE29CDC86A31DEA11916120F7E4F5215B43F6CABAA16C8129CFEAC5920AFC4526F64D17D4B9BB1C8A8ADB18C9075DF0830000FF5B4851E14215892850026EB307B6BC43FBBA5771FE759C8A16A40A1F89C1907D5DB8441705E6C81443C2F0E0E68084543587A4C253039520F1402E7F4CCDF1EF615B63C7A57BB62655079DAD1DC467A62732526F5E089E365CC8FB29E49B7D0C35E7004E20BB511958D6887764F6B3F98E86B16CAEEBF791B58D8D65DB2AD996F90AA85D0332FF4990407D4AEDF36C80287C4655F48FB08A185BF269E1743973B23DAEB9BA6A974FE782E1F5E754017B4D29E0446E83E0927F4197FCA7F09219536F44DA339A951E39619C3D08C12F29047F391E04E07C5548DC9E70106E5210BE3F1E083E67C48251E7994B678E7441F3F89C22F37FAF5C4D74328ADD69AFCCE8502D4B1A60970309955B2196345497250D1FCE9278AAEC2FC2DB80B1244623EA32A54EE71CEB3199EBF5994CC26132F3502C293326D398B2246B01FF848D7C586A3145213B4511849AFF415728A7371232C1745D131C3DDC04C74EB0090E31430993E9DB9501200BD8D090EA96637063131C0FB2E609CA9AA301D63C49F1FA099336E66E9DB2E2D40FFD6E36AD67F5CBE27F96BE5F0DC6AB2F4E0F1E24FC5C65D1206017BF3A65385CAA83C31D8AC321F4B67AAABC05D9070C790809B36B5E52EA441E73C4DE9C9D8715DDC7703C17CF2B1A344AB09591B3FD971495BF8603FD3354541D57B56590FA19745C144B8A8A65F6BEEF0C7E22B111AEB315ADEABAC5E8CC231B9A18F20A9633320168FA2DF8E70FE75F960C2737AD6BF59E13DE7673FB9CD087BD2733F241B7D05FFD7B1DBF74AB9A3395D812FC869694827031AF1B192729E7645709CEAF84AB2AAD3379C638EB94238938775D7D7D37C9518535914E5DB7617C5F3F4C27B4E535C0384D3A6D3E03B679B82A2FDD870C0AFFE3B2E2597F9278D64BB0BE47305ECE9BA4E5C3C1E0F1ED6D3D7D77DB35A2B9ECD9A2E8D4ED534489F395C8D37C46631747C8C57BB57D32EF4B538F35C52AB3E238B18D07BA2A7B1D33D7A905D47DCC6B99D9172273D02644A6B94F377CA326958F6BEAB887D5BF853899D5592819F5011DB58FCA44F2213EA063670E22421FEB62F2328B992684B9D352A51DB2EC47E8E6D74C0DAE6E1E56CECDDA86938A7E6C6283DD7355B4F0BF51D16213A8D4AA2FA88EA5E3A963B989891FB6B1B3ED68E5AC3005B8CA7954F59CECC6889BBE5E6051FF2875AFB217DD11D72A7DB4C6784FC1AACC6E0647855A0D29601C44B2D5C2458413022D01EB14C0E3D5BA5860ED7CC6A8B6D6F598B9311F732494B297821ABC7EB1CEF5CB75AE5F61CAA175B0036899F015C2843E0302B0D7AA44A68EB15782B4FE0985F827DFC1C30E3B048E732E1CC7EEC50955D8920C5F219EB34D488740ABE0B70E7BB1B02663D90B174FC52B39A02305A8CAB384A6FBAC18CFD5D47C9F854EFCCF45329C73D2250E9F2C648ACD0BACAA4B910FAE0A517D1748298922BFA95CCC5810F0761489549417A1A24C9FBBEC7F6EA3125BC3503B059A4E6F5FF2DFFE6DE53C3B6293AA157DA6CBFFCC8B4A9FBFDEEF3ED24223D2B7FEC1375B18A812F720E0367B19DB04324AE09B66F035D93428D6340D922168A1AF1911EBB487D5CAE51CC6B36F2105C43529130ACB947697D556997220D35EB332496199680EA7AD32C92093D1AC4C382C134D6DB655A63CC8B401DA13CEB10DBDB8E56EC7AD66E6A9D37D096EA5C63D6CBB6EFBBBCF1A9D5BE614D2D08F8CB2EFB442B700B443F3CC037528407A6718DF942CDBCDA60E74037448125F7B289C5150B093D36B1B6FD0803FE3B48198C259FA6D03F1AF0A8D9D0D587A5C8839A762E8C5706DE02BFACAAD707E8041728BFDF05EF40E1E9DA94CC5CE405FC803646E3B4DD8646185A317D62D9CF77F1EE2F626A9D42A6F36B24AFF6BA7DD2E37FC96E9D2C66F626784313F46CB796610ECFFC0A629A55E5A0F1E4D3C6AC7B72CEE772624B03D7783484B2DC1355F561461A8D6DBFBC53A0D3734E601A50B6EEF433E3DA9E36539315C60D02A1796B5556CDA45AF2BAFDAB2E6B2080FA966A6AE4702206470428F068CD1497471C2C56D644267A054C032302B039ACC5A081FAF847E1599DE99A0A5CF4780635E73C424C2018F5DC5F06996BC641773D86841C4839506E79616C68543A5F379906CABD405EBAD0CE668E9BFF8D6988E79370000, 0x1F8B08000000000004009D914F6B134114C0D992425AA89F61C939EC6CB2692D928D89CDA514A590507A9D4C5F92A1B3B361E66D715B0A1EA494D243BC05154110C48B1EEC2DA05FA69BD46FE1AC69217F4083CC6966DEFBBDF77EAFFAE83010FB2AEC81C2F819ED3CCD34E31E0C8A8D5823044E8D213FE1C8413BF548D196805DA9914AC665C799CBCCD6B486A025E2417B89ECBC7D004AF350FA25C74D4FDEDE8904460A7C09112A2AF2F67ED4129CED41DC0C8F41FA5EA1D5F6B637B7E891B755026F33BBD745EC3D2144B32E04543B4714290BA54966E884AA438AAE5B22EE63B2443F6BD6A937870B3853A10EDBE8B03048591E29B8A4018A53C14F299AE64975FD5E9E5154CD3E88CCAC1EBEA0010CAA677F45C24B04993AD0C4F8D7DC28970CCEEB5CF7048D534266B28E954229B37A40450483B55D341D9C7006D662BDDA7FD56B2045681A69C7A0160ABEAD5BE53F01CF29EB7209DAAC49299038FDE8E7A66FB9CAC6BA6DCF64D9E930735133203F37BA7A357AFF6DFCF94D727931BAF9713B1C26571F27280333ED1953A9F2CADDCFFE7878534C3EBD1EF72FCA64EA272D3B1BFBEBCBF7E4DD877F044D8085A580C9D7EBD1657F015826D302CCFCB30FBA6259D66F4F1B2AB86B030000, NULL, NULL, 1, 1, 3, NULL, CAST(N'2015-07-30T15:11:35.190' AS DateTime), CAST(N'2015-07-30T15:12:47.477' AS DateTime), NULL, NULL, NULL, NULL, N'[技术科分派任务: ItServiceBookMark]
', N'HERO-20150527KX', N'Idle', 1, 0, 0, 0, 1)
INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'a365c4b7-0bb2-46a0-a84e-ac04655646ac', 5, NULL, NULL, 0x1F8B0800000000000400ED5B49731BC715D6900405901417D9926527B668D94E228B1C000417898ECCA1284A42C44522A9C561C44163A6418E390B3C0B2928952AC5AA8AC438A754A522F81095AB72F3310757AA72CB1FC85FC86FC821875CF2A6A77B309821409800524531A503A19E9E5EBEF7FAF5F796117AEE9846119BB6822D214E7F97840BB771E93E521D7C0729E672E1E112D230D24B6BA522D697167777EF2FA1998EACFCE54C97DBF4F25FAB25CBC61A3F67A82A966CC5D02DFE26D6B1A9487C70A4DCD8FA3AEDFA5053F90545FF8227638F0C879A4786EF63D38281AE8EF329F7DFC8F09CA3DA8E89AFEAD8B14DA48E0CDF71F2AA22C1F86BC636D6AFE6A7A6D084343199BE9219C7A9CB571E8DB0B996F39FC3AA4686354B324C55C9B762F04733F159CBC25A5E2D3D8D5FDBB2EDE2743269495B5843162F231B49860ECB946CDE30379363A9D478323595AC8D5382532ED251767777F9DD0C7B2F9D7CB8B8B04A061E5574CB46BA8413DC934C684A4D914CC3320A362F199A3B5F26994E2557410448559E20572649A1731B975CB9BDE898E9BD016B334C22D2978368DA9530EB8D4D2AD7F74252E143BD7C085EAE847AB600E20487A6429B3C0857A65442970EDB213BEDA45B394517B86A9B8ABE1914DE89F2F55F3AA63E4D8537EA23390A484ED3D76641AB7714F7942441219345FFD0FCEA81616E1754639713623BEE8921B376D1593F8EBCCEAF38BAAD6898A72396E61F63C901495496F4722DF2D621E0CCA4F385CCE58949246726C771664238CD569AA55A9495E3570E0618B42835C614B70243F94394999C90C6F353A3A97C7E6C747C12A546D1E5713C8AA4D4F8E4C4C424B448420F6819058E00136B624AE12D5F4165B68705C5B22D3272F74CD7AAF204BF8881DECC1EBCADAAF358D91613CFC630930F9B69111579F6DB9D954C7A52E8B1409D549C05F3475AE254F2172232F425CE4669B7C41B81BA060CC2990AD4F3FA8E621ABA86756FCF8946C6ADA1351BFD1E5C0B86444C1281AC8742F6340A19EB974BAFAFCF161158417ED190B16AF1AE32DF806397D5EF20130EBB8DCD9161AF4BE5B0A41BBD3B7447551F054C7A7B8E6082CB3770E06A88440C9897DE04274D34AAE355B8E54ECA262A005804F9BE720CC99AA2731C27C4A52D45954DAC9327A79A107273DB0C1FA8FE7ABA38B09150A92A795660905A812E31CE7487EC6788EAD857511DBB8FE08ECCAB3897BEC47EB2577DB6E2DD1A6D6310ED51B7A0C69C2EC7147B532D71215CDE38E6B8BCF9DDE9A1B57F2E1BB9D1A5BF8BFF90FEBC9471FEFD5518A433C71CA4B3E5C1ACBD8874B489CDE5A2A203970C43F41685E86F873B5F810B78D5467097C26563F1E4E722587D45C7F33BD044D7E07B0B95D72A36BF617F214C90DA6FFF8307F21C98F0EB8D9AF028A81594727DCBFA9A89740BD8A9A13FCF0D209771E16B86B1AD2173DB338B6F8B70FCB1E6FDE71D2AAB3FD061F7F3DA5C86E35EBAD199D9C0ED17C253B15BACACFA0715CBCE96C077EA8AFA1B50C5EFDDC08931D102B6F86B312EEE788EE65E07C7E5625F389852F81F2638B9057E1DEA16916922CFED7A97ED217766CD5436E138CD195A5105F22213FDA61B6ADF530EC5C42D8CE467F097EC1FFEDA48519FA10A0E9DC006B88DEE22022E60CF74AEE0C28B045D589825BC27866FEBF3C269BA255046261672030F6F0C484855F348DA7E60A222C41C48F3FB5419FF18D534E629DD7074A932E85CF52001253D9297F4C660D8D1F020EFA7906FF431D45CDF9B4076A13CB0AC1303C0B467E34D1D63D95A336E227B0B6CB463171DDB7A0EACAE0E8FFF20CC9D3EA4DA7932C4113EA222FA362A2246940252A8D864CF7EBFDEA69C1C8F739EAC5A65D1B9F0E5FA232A80270D09E0481E83F0967F4CB7FCDBE8961949AFC7D7B3BA9D193B62743D0CC14F2804BF3B1C04607C5588D91E71102E5210BE391C080163C42EA3F6F396F6787361F5F89822F37FAB5C89713282DD6EABCCE850354B1A60CDA158CAA5084B1AA9C99246F767493C15F627D163C05812A311359952BBC38DB598CCF9DA4C26E9329979C893941893A94F5952D5807FC046DE2FAA98A6901DA31B84AABFEBC98454702CA282999A2A38BEBF0A4E1C61151C618A1225D393E501200BD8D491EA6562707D159C0AB3E6CB9435C742ACF90AC5EB35266DCCDCBA19C5E9EF065918AD7BE553ED3F4BDFAC846FAC4F8E0F22E4023ACBEE839066FCF498E170BA060E57290EFB10DC8A5F7909E20F18221112666D7E50EA483A3A624FDE29C08E6E6270D0C5538A0E55126C67C4BBFF94A2F2FBE855FF1069AA6BAC364D923C83720BADA8A85866EF07BCF023898D709EED68C5306C4668EE3A50C15050B09C95094033AFC042BF3BFFB86862CBAD10A9D54F78D5C9FD9513FAB0DF332BEF750AFD95FFAFE1C75E4A73B61C5F82DF508FB22D0C150C33EB06E5DCC005C1F9B97056A549265F19E7DC5C2459CE354F5E5F5FE1A8C01A08A7AE39307EA018A61DD2F2AB5FDC0A9D167B812D1EAEC24C9F420C85FF7E51F15C30483CE70758DF26182F172C52EFE162706F72CBC85CDBF294E87AEEA426BA49FB3411E27CB9EB4121ABB3C631D278A3BA48E61D69FA9EAED825961927BA71CB5065BF5CE63CD5809ADDFC7A99A742D775A81122D3DCA407BE5E85CAFB5549DCFD92DF4282CCEA6E948C7A8B8EDA47D744222201A0E327F6BA843E56C2E4C716B30D2CE66A53697688B21F209B9F313178B2B95DEE9D734C37187DCFC2267BE68968E17F23A2C50650A9165F581C4B8713C7720313DF6E6159DBC1C2B9C304E009E76EC572B207635E007B81DDFA07897B85BDE88DB85AEEA339C61B0A5665F6303C2AE46A480663AF2B57495D747142A81E608D0278B85C17BB58DB1F33AACE75DD63662CC01C09A5ECA1A086DB876AB4BF51A3FD0C130ECD83ED41BD849F080314FB4CB880FD3A2532759CBD12A6F5F729C4AF7DF90E7377081CBD1E1C872EC489E4D8520C5F2191772C0888409DE03397BDD85897B1EC5F170FC43379A023DB5076C6429A5E5F3191AFCAF93E8CF8FC9F896438D7D725069F6C649ACD0BACAA4391F7FA8598B10BA494DC223F2F0F656DB8F076148964941721A34CFBF506FBAD97E3AB1872A740D3E9E39EE0E35F944F31279BE4AD689F8E609F47E5BE60BEDFEBD24415D2B3E0E01B4D0C544EF810701B3D8C6D021925F0CD30F81AAC1814AB2A06C91034D5D7C8126BD48655AFCB75C773AF2008C435B826145D138D98B4744D7920E4DF36BC28A81D0D945612A0321ED62D5D940C8BFA4BC38BC2D145D1F0664B17558045FDC94DC30BBDEC4C2F6E7A2772B391896A545F8265A9B2105B9EE5FEFAA37AAECB758514F423B3147058E8298072689E19A136DD91BE1B13989285BCD9D4A1928036AD24501E0A6E0A0A5772FA65E3750AF067DD4A104B3849BF6D202656A1D7671DA21E13E2AE630C05199E0E7C4E5FB9140D1130482EB11FFE8BBEEFD19EF454FC04C49C6F216BCB2DC2261BDB3E78639DC2A9E0E7215E79924AB5F2623DAD0CBE76DCF5723DA8991E73FC327E42980862B45C600AC1FE860E4D31FDD8BE75F7F2DD567CCBE27D67424CF6679EC96EAA24B8EACB0A0D866ABEBC5FAC5175436F186075E1E3BDCFA72735AC2C2746B30C7A7970595FC196A3F9857995AA358F48F8483532752D1E40EE8C6E1D4823C4BA3A3861680B59501C286D6319C8950975664D5C1FCF857E1559BE5BD0D4E7234033CFB9CB248B032ABB82E1D32C79C9D1F2D86C62897BE93AAE4B13E3825FE97E1E243B2A35C1463383B952FA2F283E79BB79370000, 0x1F8B08000000000004009D91CF4B1B4114C7D912210AFA372C39879D8D1BB548364D5A2F22152141BC4EC69764707636CCBC95AE45B05442C9C9DE02958250283D88073D0882FE33D948FF831E9DAD15F20344CA9C66DE7BDFEF773EAFB2B013882D15764061FC96B6DE64EA7107FA8BB55823044E9521DFE7C8413B6B91A20D01EB5223958CCB96333199AD6A0D4143C4FDE60BA6F3F63628CD43E9171D373D79FB5D243052E04B88505191B7B7A286E06C03E27AB807D2F70A8DA6F77A6999EE7ACB45F096B21B6DC4CE2A219AB521A0DAD9A5485928CD304327542DB2E8BA45E2AE9017E499B50EBC09B9803315EAB0890E0B8354CB230597D440712AF80145139E54E6FEC133882AD9279099999D4D1A40BFF2F15949F8802053069A18FE9A1BE492C1E11AD71D41E35421F3B88E57856266669B8A08FAB3EB6812EC7306D6B45FF5BFFC6A4811EA06DA1EA869C33FA5BFF5F794B5B9046DB6A414481C7DF473A3B75C797ECEB6C7A6ECF42F135D63427E6E707736FC7431B83E4FEE3E275FBAC3ABDBC1CD4DD23B7B54337A26A06195422F0F7B47C3D38BFB9F5F931FC7F727DD1219A9A5DEE3DDBF7F5D26DFBE4F3595C868689379FC41972DCB7A001AA774031E030000, NULL, NULL, 1, 1, 2, NULL, CAST(N'2015-07-30T16:19:25.267' AS DateTime), CAST(N'2015-07-30T16:19:49.910' AS DateTime), NULL, NULL, NULL, NULL, N'[信息中心分派任务: ItServiceBookMark]
', N'HERO-20150527KX', N'Idle', 1, 0, 0, 0, 1)
INSERT [System.Activities.DurableInstancing].[InstancesTable] ([Id], [SurrogateInstanceId], [SurrogateLockOwnerId], [PrimitiveDataProperties], [ComplexDataProperties], [WriteOnlyPrimitiveDataProperties], [WriteOnlyComplexDataProperties], [MetadataProperties], [DataEncodingOption], [MetadataEncodingOption], [Version], [PendingTimer], [CreationTime], [LastUpdated], [WorkflowHostType], [ServiceDeploymentId], [SuspensionExceptionName], [SuspensionReason], [BlockingBookmarks], [LastMachineRunOn], [ExecutionStatus], [IsInitialized], [IsSuspended], [IsReadyToRun], [IsCompleted], [SurrogateIdentityId]) VALUES (N'b0f0b33c-f1fb-44dc-9f4f-50359dd2c2e0', 6, NULL, NULL, 0x1F8B0800000000000400ED5BCD73DBC61517244A22F561D94E9CAF26B1E2266D1D4B20294A96A5C415647DD8ACF5654996DDAA16B8049612221060F02199EE74468E6662AB692F9DC9C4CCC59373FF805EFA8FF4D89E7AEFA1D73E2C764110102956243B233BE3836870F176F7F7DEBEF77BFB1E859E15432F60C352B02944E9E7A270E52E2E6E20D5C62B483196730F97501E23ADB85E2C606D69717F7F63094DB5A7E5AFA622CEA317FF5E2B9A16CEF333BAAA62C95274CDE46F630D1B8AC4FB2565463637E9D08779955F50B42F79227B6830F0786870031B2608BA39CA279C7F438333B66AD906BEA961DB32903A34B86267554502F9EBFA2ED66E66C7C7D19834763D39911AC5891B138F86D85CCBD92F605543837953D20D55C93643F8A3A9E8B469E27C562D1E446FED585661321E37A51D9C47262F230B49BA06CB942C5E37B6E32389C4683C311EAF8E538C53AE5229FBFBFBFC7E8ABD978C3F5C5C5823828715CDB49026E118F724159832AF48866EEA398B97F4BC335F2A9E4CC4D7400548559E20472771A16317171DBD3D6F9FEA9D87B5E90651E98BF368D2D1301B8D0DAAD70F035AE103A33C085EAC06463601E21887C6039B3C09576654424483ED909D76D0ADF4D305AE5986A26DFB95D7569AFD9D6D68935479C31E92C380E4247D6D1AAC7A4F714E491C0C325EF00ECDEF1FE8C66E4ED5F739A173CF393164D6089DF5D3D0EBFCAAAD594A1EF3546271EE31966CD04479492FD6436F9D02CE54329B4BDD18BB8EE4D4F5519C1A132EB295A6A915A5E5E8C4C9008315254698E19661287D9C4DE412D9544A1ACE2573D9E1D151591A9EC88DE686C712A9B109591E91467042E8012BA3C011603A1B985278DB335099ED6141312D9348EE9A8AAC294FF0F34EB09BE993B755711ECBDB62EAD91A64FA61332DA202CF3E3BB39249BB851E13CC49C569707FE449946AFE4A48879EC69994566BBC1EA8ABC0205C2A433DA7ED2986AEE5B1E6EE39568FDC2A56B375CE856B4197884B2290F550C80EC290B17199E4E6E674018117E4177519AB26EF18F33C1CBBB4B6820C38EC16368606DD21E5C392AC377668B6AA3EF2B9F4D61CC11897ADE3C0555189E8732FBD314E1AABD7C62B70CB74CB06CA015804F9BE52A7626DAB458EE384A8B4A3A8B28135F24D7F034A6E6C9BC10375AE962D0E6CC5546A4AAE17384FBD40448C32DB21FBB9406DEC9BB08D6D20889159156792D7D847F6AAC756DCA8D13206D11A736316D3B18A73CFFBF80E4D51BFE6B80030175F43608218BCF12306CFDFA418FCED7407C41741D72C04C110A285C9938F8BE0B6150DCFEDC1A345A4A16DC7538766293BEDBA097F90E1B4DE81B313E550E84BE08367EBF5C1A1EDBAD01094327DCBDABA813413E8A5AE3DCB0C10CA846FE9FA6E1E19BBAE5F7B4B044F8DF3EE7FDEA6BAFA968A3D2EED72288A1335C33333C1AD57C281D8259657FD8EEB9A0F38B1533481A93D15A3E29E9BE43DE5B84CE79736A6ECF9DD18273721A5425D22320CE4663CEFB1D951A7B88391FC14FE9255C05F0B29EA53E45F0DC76D75151004436B8A78CF18F39E8130F9133118AEDE172ECEE8F9828A1D6532A84908FA606B4042AA9A45D2EE03031520E9268F3FA4CAFC2EAC29962ACCDB9A54163A5329C4A7E43319A5B6CE0799B60BF9390AF9561F43CD493E0964974B03CB1AF12D1415BCF5A686B16CAEEBB791B5838D65DB2AD896F90C684D0D223B18240F1F51F2D01D889157A88AFE125611630A3E2DBC5EAE901C8F4BAEAE9AE5114324E5A754014FEA52C0993C06414EF231DDF21FC25B662CB516614D6B566AE48CF1D520049F5008FE783A08C0F9AA706979C641F81905E187D381E073462C18B53EEEB7269D099AC7CF29323F7AE5F2251F23A8ADF6CA8C0E55B2A401F638C0927E11624957ABB2A44F8F6749D7A8B23F0B1F03C692188DA8CA945A7DDF568DC9BC5F9DC90C394C660E0A0545C6646A5396E14AC00799E4E3AED5780AD96B1441A8F91F86AEB3E2210B4C54B5C0E4F1163872862DF02AB39330974E9506802B604343AA5B89C0B52D7034489AC72869EE0C90E6EB14AF5798B3316FEB5C078CFFF5FCFE9FD287E9B6F5B6FEED1F5653F67FBE0906AC1BAF3E22C12D4FBCFA5B664650F3967592E2700C952D6790D7E09E16C39D8384D933EFFAE64CA634624FD6CEC18E6E6348C5C57E45838600B63392C77F4651F97338A83F4479D5F14BDB06A913416741BEA0A85866EFFBF2ED33898D7099ED6855D72D465DEED950ACCF29584ECB04A0CF5F8233FE60EE71C1C0A6D30C516DDCCD971DDCBF38A10F7B23D3F2518770AEFCFF75FCD8ADDEFDB2145D82CFD07AB12B5CC8E946DAB9AB72EE2109CECF84B7545A4FF18C71C629BB91E54CB9FAFA7E82A30AABE3E271DD06F9BEBE8F5668CB6BF4709A519A9CEF35595C99831EC06D09FFBFDD1F67FCD7A9028DBB91CCBB04E3E59C495A1B1C0CEE5FDFD153B7765C239ACE74E745A73E9D244ABC558A3CC8A535F670843C9CA9EC07794F9ABCAF2956911581896DDCD155D9EB0CB94C2DA0EA30AF35E44088CC423B0C9966961EF85ACD181F55D42B8FABF30A3132ABB35122758E4AEDA36B22771F3EA0A36D4711A18F75EB78B788F3752CE666431565B8D53E4137B7991A5CDDDC29F5CED88673ED7CDFC406FBCE5551FAFFA3A25FD5814AA5FA82EAB87B3A752CD431F1DD2676709DAC9C45A60057394B65CFC9BE1871AFAAD32CEF3D49DDCBEC4557E24AA96FB9A068E0D8E715ACCAECCBA054A88D9052C55124E3D5288E229C10287DDFA3009EAE2AC4026BEB6F872AAB42ABCC8DF9D20742A57A28A8C1E717AA3CBF58E5F91B4C39B4EC7404AD01ACEEE4A0D8674000F65A72C8D451F64A90CEAE51885FF94E950A52DBEBC271EA9E13E82EA9BCB61866F80AB1AC6DC2D507B4C41D3AECC5C29A8C652F5CAC8B97B2404776A1C38A5D5EBA63C558B6A23A7A3F94DE6F88449C93D612874FF43ACEE60556D5AEC847DD42A7BE0FA494449107A50B690B02DE9E2291DAEB22D45EE9B84EFFB887A5E81A865A25D074FA75C4FFF5AF4BFD2C9F26152A3AA6DD3FE637A53E7F65DC1DD240C3CDA15FF86603824A310F026EAB87B14D20A304BECF197C7536C7FDB6A2398E88A045BD7A9658A50DAA725D4EE6FDE865BB6361F535EC6D85D744AFE79ABA261108F9DFEB5E5426BC287A63D3D4452158D43FEA5E5436BCA8846B004D5D94048BFA27E88F137AD9995EDC764F6423EDA9E0592A3C04763DF7F79FD44A5D6615D2BB8E8CA22F61A1A7003A7F79E6845A1423BD34C63725BBDC6653078AFF2D5A89AF1312D214146C5AF43AA46BF49A4F3B9D17A6D04DDBF8898BCDD1F0599DA81F0A51272F86CE0BD704B6E91BD7C237040C916BEC83F7A2977AB4A60E156D8366C93BC8DC71DA8DC9BE764EDC1724E3FDFE1F42B87D3C0A35CAABB58CD2FFDAEB6E969B7EC37489E357D13661CC8FD1728E1904FB1B383385E463EBCEBD1BF79AF1AB0DF7171524B46DB8CEB1A1E6D78ADF107C01A21A6F6417ABB4D7505F0EA42E78BA8FF99145956E6E4E0CD713764BE797B5556CDA79AF834D8C324DB83CC243AA9EA9ABD1001232BA34E08C69F990132EEC20139AE8A45D2C03B5322CDC48F078269C5391E925050DFD4E0248E63BCE2AC9E280C8AE62F80D92BC64E7B3D8A827905681FEE8528DC4A501B990553ABF83916D957A60B511618E92FE0B6DD5DAAE62360000, 0x1F8B08000000000004009D91CF4A234110C619891085F519869CC3F4C4897F904C4CD44B90152141BC76DA4AD2D8D313BA6BC4897858F6B40BB22E78C8C18BE0553C88B8ECC507F19A64F318DB6314920822D2A7AEAEEFABAF7F555AD80FC4AE0ADBA030DEA0CDF5542D6E4377B11A6B84C02933E4471C3968672B52B42EA0223552C9B86C3A53CA74596B08EA22EE363EA0CEDA7BA0340FA59F77DCE464EDCD4860A4C09710A1A2226BEF4675C1D936C4B5F010A4EFE5EA0D6F7569991E78CB79F096D2DB2DC4F61A219AB520A0DA39A04859288D98A113AA265974DD3C7157C807F2CC591D6FCA2EE04C853A6CA0C3C220F1F248CE2555509C0ADEA168C293D2FC0B3C83A8947E05999ADDDFA101744B27EF5AC231824C186862F86B6E904B06A75B5CB7058D1387D4681D33B97C6A768F8A08BA731534098E3803EBEDBCF2A7E6559122D40CB443506F073E159EDFBF52D6E212B4D992522071BCE867C66F99E29779DB9E50D9C95FA6BA268CFCCCF0FE6178F6A3521B5C9EF57F5EFDBBB81BDE3E8C9C8C9709673825C08BFDF3DFBDC7ABC1B7DBDE9F9BFEE3F7C1AFF3DEDFEB517B818CF53D6720E3B94CACC24441172DCBFA0F5127464C01030000, NULL, NULL, 1, 0, 1, NULL, CAST(N'2015-07-30T16:27:18.847' AS DateTime), CAST(N'2015-07-30T16:27:18.837' AS DateTime), NULL, NULL, NULL, NULL, N'[起草IT服务申请: ItServiceBookMark]
', N'HERO-20150527KX', N'Idle', 1, 0, 0, 0, 1)
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[InstancesTable] OFF
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[LockOwnersTable] ON 

INSERT [System.Activities.DurableInstancing].[LockOwnersTable] ([Id], [SurrogateLockOwnerId], [LockExpiration], [WorkflowHostType], [MachineName], [EnqueueCommand], [DeletesInstanceOnCompletion], [PrimitiveLockOwnerData], [ComplexLockOwnerData], [WriteOnlyPrimitiveLockOwnerData], [WriteOnlyComplexLockOwnerData], [EncodingOption], [WorkflowIdentityFilter]) VALUES (N'085eda62-afc7-4ef5-80d0-1d5c48c7f07a', 14, CAST(N'2015-07-30T14:42:06.553' AS DateTime), NULL, N'HERO-20150527KX', 0, 0, NULL, NULL, NULL, NULL, 1, 0)
INSERT [System.Activities.DurableInstancing].[LockOwnersTable] ([Id], [SurrogateLockOwnerId], [LockExpiration], [WorkflowHostType], [MachineName], [EnqueueCommand], [DeletesInstanceOnCompletion], [PrimitiveLockOwnerData], [ComplexLockOwnerData], [WriteOnlyPrimitiveLockOwnerData], [WriteOnlyComplexLockOwnerData], [EncodingOption], [WorkflowIdentityFilter]) VALUES (N'1733df58-b8ee-42e4-a24f-74ccb5b775a1', 34, CAST(N'2015-07-30T16:29:17.623' AS DateTime), NULL, N'HERO-20150527KX', 0, 0, NULL, NULL, NULL, NULL, 1, 0)
INSERT [System.Activities.DurableInstancing].[LockOwnersTable] ([Id], [SurrogateLockOwnerId], [LockExpiration], [WorkflowHostType], [MachineName], [EnqueueCommand], [DeletesInstanceOnCompletion], [PrimitiveLockOwnerData], [ComplexLockOwnerData], [WriteOnlyPrimitiveLockOwnerData], [WriteOnlyComplexLockOwnerData], [EncodingOption], [WorkflowIdentityFilter]) VALUES (N'e6621096-2e32-4617-9496-64c266a4002f', 35, CAST(N'2015-07-30T16:29:28.537' AS DateTime), NULL, N'HERO-20150527KX', 0, 0, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [System.Activities.DurableInstancing].[LockOwnersTable] OFF
INSERT [System.Activities.DurableInstancing].[RunnableInstancesTable] ([SurrogateInstanceId], [WorkflowHostType], [ServiceDeploymentId], [RunnableTime], [SurrogateIdentityId]) VALUES (2, NULL, NULL, CAST(N'2015-07-30T14:42:21.760' AS DateTime), 1)
INSERT [System.Activities.DurableInstancing].[SqlWorkflowInstanceStoreVersionTable] ([Major], [Minor], [Build], [Revision], [LastUpdated]) VALUES (4, 5, 0, 0, CAST(N'2015-07-30T02:36:22.793' AS DateTime))
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [PrimitiveDataProperties]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [ComplexDataProperties]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [WriteOnlyPrimitiveDataProperties]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [WriteOnlyComplexDataProperties]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [MetadataProperties]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [DataEncodingOption]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [MetadataEncodingOption]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [LastUpdated]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [SuspensionExceptionName]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [SuspensionReason]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [BlockingBookmarks]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [LastMachineRunOn]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT (NULL) FOR [ExecutionStatus]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [IsInitialized]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [IsSuspended]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [IsReadyToRun]
GO
ALTER TABLE [System.Activities.DurableInstancing].[InstancesTable] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [System.Activities.DurableInstancing].[LockOwnersTable] ADD  DEFAULT (NULL) FOR [PrimitiveLockOwnerData]
GO
ALTER TABLE [System.Activities.DurableInstancing].[LockOwnersTable] ADD  DEFAULT (NULL) FOR [ComplexLockOwnerData]
GO
ALTER TABLE [System.Activities.DurableInstancing].[LockOwnersTable] ADD  DEFAULT (NULL) FOR [WriteOnlyPrimitiveLockOwnerData]
GO
ALTER TABLE [System.Activities.DurableInstancing].[LockOwnersTable] ADD  DEFAULT (NULL) FOR [WriteOnlyComplexLockOwnerData]
GO
ALTER TABLE [System.Activities.DurableInstancing].[LockOwnersTable] ADD  DEFAULT ((0)) FOR [EncodingOption]
GO
ALTER TABLE [dbo].[ApplicationRoleMenus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleMenus_dbo.AspNetRoles_ApplicationRole_Id] FOREIGN KEY([ApplicationRole_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleMenus] CHECK CONSTRAINT [FK_dbo.ApplicationRoleMenus_dbo.AspNetRoles_ApplicationRole_Id]
GO
ALTER TABLE [dbo].[ApplicationRoleMenus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleMenus_dbo.Menus_Menu_ID] FOREIGN KEY([Menu_ID])
REFERENCES [dbo].[Menus] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleMenus] CHECK CONSTRAINT [FK_dbo.ApplicationRoleMenus_dbo.Menus_Menu_ID]
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
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUsers_dbo.Organizations_OrganizationID] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_dbo.AspNetUsers_dbo.Organizations_OrganizationID]
GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[AssociateKeys]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[AssociateKeys]
	@surrogateInstanceId bigint,
	@keysToAssociate xml = null,
	@concatenatedKeyProperties varbinary(max) = null,
	@encodingOption tinyint,
	@singleKeyId uniqueidentifier
as
begin	
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	declare @badKeyId uniqueidentifier
	declare @numberOfKeys int
	declare @result int
	declare @keys table([KeyId] uniqueidentifier, [Properties] varbinary(max))
	
	set @result = 0
	
	if (@keysToAssociate is not null)
	begin
		insert into @keys
		select T.Item.value('@KeyId', 'uniqueidentifier') as [KeyId],
			   [System.Activities.DurableInstancing].[ParseBinaryPropertyValue](T.Item.value('@StartPosition', 'int'), T.Item.value('@BinaryLength', 'int'), @concatenatedKeyProperties) as [Properties]
	    from @keysToAssociate.nodes('/CorrelationKeys/CorrelationKey') as T(Item)
		option (maxdop 1)

		select @numberOfKeys = count(1) from @keys
		
		insert into [KeysTable] ([Id], [SurrogateInstanceId], [IsAssociated])
		select [KeyId], @surrogateInstanceId, 1
		from @keys as [Keys]
		
		if (@@rowcount != @numberOfKeys)
		begin
			select top 1 @badKeyId = [Keys].[KeyId] 
			from @keys as [Keys]
			join [KeysTable] on [Keys].[KeyId] = [KeysTable].[Id]
			where [KeysTable].[SurrogateInstanceId] != @surrogateInstanceId
			
			if (@@rowcount != 0)
			begin
				select 3 as 'Result', @badKeyId
				return 3
			end
		end
		
		update [KeysTable]
		set [Properties] = [Keys].[Properties],
			[EncodingOption] = @encodingOption
		from @keys as [Keys]
		join [KeysTable] on [Keys].[KeyId] = [KeysTable].[Id]
		where [KeysTable].[EncodingOption] is null
	end
	
	if (@singleKeyId is not null)
	begin
InsertSingleKey:
		update [KeysTable]
		set [Properties] = @concatenatedKeyProperties,
			[EncodingOption] = @encodingOption
		where ([Id] = @singleKeyId) and ([SurrogateInstanceId] = @surrogateInstanceId)
			  
		if (@@rowcount != 1)
		begin
			if exists (select [Id] from [KeysTable] where [Id] = @singleKeyId)
			begin
				select 3 as 'Result', @singleKeyId
				return 3
			end
			
			insert into [KeysTable] ([Id], [SurrogateInstanceId], [IsAssociated], [Properties], [EncodingOption])
			values (@singleKeyId, @surrogateInstanceId, 1, @concatenatedKeyProperties, @encodingOption)
			
			if (@@rowcount = 0)
				goto InsertSingleKey
		end
	end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[CompleteKeys]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[CompleteKeys]
	@surrogateInstanceId bigint,
	@keysToComplete xml = null
as
begin	
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	declare @badKeyId uniqueidentifier
	declare @numberOfKeys int
	declare @result int
	declare @keyIds table([KeyId] uniqueidentifier)
	
	set @result = 0
	
	if (@keysToComplete is not null)
	begin
		insert into @keyIds
		select T.Item.value('@KeyId', 'uniqueidentifier')
		from @keysToComplete.nodes('//CorrelationKey') as T(Item)
		option(maxdop 1)
		
		select @numberOfKeys = count(1) from @keyIds
		
		update [KeysTable]
		set [IsAssociated] = 0
		from @keyIds as [KeyIds]
		join [KeysTable] on [KeyIds].[KeyId] = [KeysTable].[Id]
		where [SurrogateInstanceId] = @surrogateInstanceId
		
		if (@@rowcount != @numberOfKeys)
		begin
			select top 1 @badKeyId = [MissingKeys].[MissingKeyId]
			from
				(select [KeyIds].[KeyId] as [MissingKeyId] 
				 from @keyIds as [KeyIds]
				 except
				 select [Id] from [KeysTable] where [SurrogateInstanceId] = @surrogateInstanceId) as MissingKeys
		
			select 4 as 'Result', @badKeyId
			return 4
		end
	end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[CreateInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[CreateInstance]
	@instanceId uniqueidentifier,
	@surrogateLockOwnerId bigint,
	@workflowHostType uniqueidentifier,
	@serviceDeploymentId bigint,
	@surrogateInstanceId bigint output,
	@result int output
as
begin
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	set @surrogateInstanceId = 0
	set @result = 0
	declare	@surrogateIdentityId bigint
	
	select	@surrogateIdentityId = [SurrogateIdentityId]
	from	[System.Activities.DurableInstancing].[DefinitionIdentityTable]
	where	[DefinitionIdentityHash] = '00000000-0000-0000-0000-000000000000'
	and		[DefinitionIdentityAnyRevisionHash] = '00000000-0000-0000-0000-000000000000'
	and		[Name] is null
	and		[Package] is null
	and		[Build] is null
	and		[Major] is null
	and		[Minor] is null
	and		[Revision] is null

	if @surrogateIdentityId is null
	 begin
		goto Error
	 end
	else
	 begin
		begin try
			insert into [InstancesTable] ([Id], [SurrogateLockOwnerId], [CreationTime], [WorkflowHostType], [ServiceDeploymentId], [Version], [SurrogateIdentityId])
			values (@instanceId, @surrogateLockOwnerId, getutcdate(), @workflowHostType, @serviceDeploymentId, 1, @surrogateIdentityId)
			
			set @surrogateInstanceId = scope_identity()		
		end try
		begin catch
			if (error_number() != 2601)
			begin
				goto Error
			end
		end catch
	 end
	 
	 goto Done

Error:
	set @result = 99
	select @result as 'Result'
	
Done:

end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[CreateLockOwner]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[CreateLockOwner]
	@lockOwnerId uniqueidentifier,
	@lockTimeout int,
	@workflowHostType uniqueidentifier,
	@enqueueCommand bit,
	@deleteInstanceOnCompletion bit,	
	@primitiveLockOwnerData varbinary(max),
	@complexLockOwnerData varbinary(max),
	@writeOnlyPrimitiveLockOwnerData varbinary(max),
	@writeOnlyComplexLockOwnerData varbinary(max),
	@encodingOption tinyint,
	@machineName nvarchar(128),
	@identityMetadata xml = null
as
begin
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	begin transaction
	
	declare @lockAcquired bigint
	declare @lockExpiration datetime
	declare @now datetime
	declare @result int
	declare @surrogateLockOwnerId bigint
	declare @workflowIdentityFilter tinyint

	set @result = 0
	
	exec @lockAcquired = sp_getapplock @Resource = 'InstanceStoreLock', @LockMode = 'Shared', @LockTimeout = 10000
		
	if (@lockAcquired < 0)
	begin
		select @result as 'Result'
		set @result = 13
	end
	
	if (@result = 0)
	begin
		-- insert the list of identity to the DefinitionIdentityTable
		exec [System.Activities.DurableInstancing].[InsertDefinitionIdentity] @identityMetadata
		
		if (@identityMetadata is not null)
		 begin
			select @workflowIdentityFilter = T.Item.value('WorkflowIdentityFilter[1]', 'tinyint')
			from @identityMetadata.nodes('/IdentityMetadata') as T(Item)
		 end
		
		if @workflowIdentityFilter is null
			set @workflowIdentityFilter = 0

		--Create Lock Owner entry 
		set @now = getutcdate()
		
		if (@lockTimeout = 0)
			set @lockExpiration = '9999-12-31T23:59:59';
		else 
			set @lockExpiration = dateadd(second, @lockTimeout, getutcdate());
		
		insert into [LockOwnersTable] ([Id], [LockExpiration], [MachineName], [WorkflowHostType], [EnqueueCommand], [DeletesInstanceOnCompletion], [PrimitiveLockOwnerData], [ComplexLockOwnerData], [WriteOnlyPrimitiveLockOwnerData], [WriteOnlyComplexLockOwnerData], [EncodingOption], [WorkflowIdentityFilter])
		values (@lockOwnerId, @lockExpiration, @machineName, @workflowHostType, @enqueueCommand, @deleteInstanceOnCompletion, @primitiveLockOwnerData, @complexLockOwnerData, @writeOnlyPrimitiveLockOwnerData, @writeOnlyComplexLockOwnerData, @encodingOption, @workflowIdentityFilter)
		
		set @surrogateLockOwnerId = scope_identity()
		
		-- insert identity collection with its lock owner.
		if (@identityMetadata is not null)
		 begin
			insert into [System.Activities.DurableInstancing].[IdentityOwnerTable] 
			(
						[SurrogateIdentityId], 
						[SurrogateLockOwnerId]
			)
			select		[System.Activities.DurableInstancing].[DefinitionIdentityTable].[SurrogateIdentityId], 
						@surrogateLockOwnerId
			from		[System.Activities.DurableInstancing].[DefinitionIdentityTable]
			where		[System.Activities.DurableInstancing].[DefinitionIdentityTable].[DefinitionIdentityHash] in
						(
							select	T.Item.value('DefinitionIdentityHash[1]', 'uniqueidentifier') 
							from	@identityMetadata.nodes('/IdentityMetadata/IdentityCollection/Identity') as T(Item)
						)
		 end
		else
		 begin
			insert into [System.Activities.DurableInstancing].[IdentityOwnerTable] 
			(
				[SurrogateIdentityId], 
				[SurrogateLockOwnerId]
			)
			select  [SurrogateIdentityId], @surrogateLockOwnerId
			from	[System.Activities.DurableInstancing].[DefinitionIdentityTable]
			where	[DefinitionIdentityHash] = '00000000-0000-0000-0000-000000000000'
		 end 
	end
	
	if (@result != 13)
		exec sp_releaseapplock @Resource = 'InstanceStoreLock'
	
	if (@result = 0)
	begin
		commit transaction
		select 0 as 'Result', @surrogateLockOwnerId
	end
	else
		rollback transaction
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[CreateServiceDeployment]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[CreateServiceDeployment]	
	@serviceDeploymentHash uniqueIdentifier,
	@siteName nvarchar(max),
	@relativeServicePath nvarchar(max),
	@relativeApplicationPath nvarchar(max),
	@serviceName nvarchar(max),
    @serviceNamespace nvarchar(max),
    @serviceDeploymentId bigint output
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	
	
		--Create or select the service deployment id
		insert into [ServiceDeploymentsTable]
			([ServiceDeploymentHash], [SiteName], [RelativeServicePath], [RelativeApplicationPath], [ServiceName], [ServiceNamespace])
			values (@serviceDeploymentHash, @siteName, @relativeServicePath, @relativeApplicationPath, @serviceName, @serviceNamespace)
			
		if (@@rowcount = 0)
		begin		
			select @serviceDeploymentId = [Id]
			from [ServiceDeploymentsTable]
			where [ServiceDeploymentHash] = @serviceDeploymentHash		
		end
		else			
		begin
			set @serviceDeploymentId = scope_identity()		
		end	
		
		select 0 as 'Result', @serviceDeploymentId		
end	

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[DeleteInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[DeleteInstance]
	@surrogateInstanceId bigint = null
as
begin	
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	
	
	delete [InstancePromotedPropertiesTable]
	where [SurrogateInstanceId] = @surrogateInstanceId
		
	delete [KeysTable]
	where [SurrogateInstanceId] = @surrogateInstanceId
		
	delete [InstanceMetadataChangesTable]
	where [SurrogateInstanceId] = @surrogateInstanceId

	delete [RunnableInstancesTable] 
	where [SurrogateInstanceId] = @surrogateInstanceId

	delete [InstancesTable] 
	where [SurrogateInstanceId] = @surrogateInstanceId

end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[DeleteLockOwner]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[DeleteLockOwner]
	@surrogateLockOwnerId bigint
as
begin
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low
	set xact_abort on;	
	
	begin transaction
	
	declare @lockAcquired bigint
	declare @result int
	set @result = 0
	
	exec @lockAcquired = sp_getapplock @Resource = 'InstanceStoreLock', @LockMode = 'Shared', @LockTimeout = 10000
		
	if (@lockAcquired < 0)
	begin
		select @result as 'Result'
		set @result = 13
	end
	
	if (@result = 0)
	begin
		update [LockOwnersTable]
		set [LockExpiration] = '2000-01-01T00:00:00'
		where [SurrogateLockOwnerId] = @surrogateLockOwnerId
	end
	
	if (@result != 13)
		exec sp_releaseapplock @Resource = 'InstanceStoreLock' 
	
	if (@result = 0)
	begin
		commit transaction
		select 0 as 'Result'
	end
	else
		rollback transaction
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[DetectRunnableInstances]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[DetectRunnableInstances]
	@workflowHostType uniqueidentifier,
	@surrogateLockOwnerId bigint = null
as
begin
	set nocount on
	set transaction isolation level read committed	
	set xact_abort on;	
	set deadlock_priority low
	
	declare @nextRunnableTime datetime
	declare @workflowIdentityFilter tinyint
	
	if (@surrogateLockOwnerId is not null)
	 begin
		select @workflowIdentityFilter = [WorkflowIdentityFilter]
		from [LockOwnersTable]
		where [LockOwnersTable].SurrogateLockOwnerId = @surrogateLockOwnerId
	 end
	
	if (@workflowIdentityFilter is null)
		set @workflowIdentityFilter = 0
				
	if (@workflowIdentityFilter = 1)
	begin
		-- Any Identity
		select top 1 @nextRunnableTime = [RunnableInstancesTable].[RunnableTime]
				  from [RunnableInstancesTable] with (readpast)
				  where [WorkflowHostType] = @workflowHostType
				  order by [WorkflowHostType], [RunnableTime]
	end
	else if (@workflowIdentityFilter = 2)
	begin
		--AnyRevision
		declare @AnyRevisionFilter table
		(
			DefinitionIdentityAnyRevisionHash uniqueidentifier
			UNIQUE (DefinitionIdentityAnyRevisionHash)
		)

		insert into @AnyRevisionFilter 
		select distinct [DefinitionIdentityAnyRevisionHash]
		from [DefinitionIdentityTable] as IdentityTable, [IdentityOwnerTable] as IdentityOwnerTable
		where IdentityOwnerTable.[SurrogateLockOwnerId] = @surrogateLockOwnerId 
			and 
			IdentityTable.[SurrogateIdentityId] = IdentityOwnerTable.[SurrogateIdentityId]
		
		select top 1 @nextRunnableTime = RunnableInstance.[RunnableTime]
				  from [RunnableInstancesTable] as RunnableInstance with (readpast) 
					inner loop join (
						select IdentityTable.[SurrogateIdentityId] as IdentityId
						from [System.Activities.DurableInstancing].[DefinitionIdentityTable] as IdentityTable, @AnyRevisionFilter as AnyRevision
						where IdentityTable.[DefinitionIdentityAnyRevisionHash] = AnyRevision.DefinitionIdentityAnyRevisionHash
					) as FilteredIdentities
					on RunnableInstance.[SurrogateIdentityId] =  FilteredIdentities.IdentityId
				  where RunnableInstance.[WorkflowHostType] = @workflowHostType
				  order by [WorkflowHostType], [RunnableTime]	
	end 
	else
		begin
			-- default to Exact
			if (@surrogateLockOwnerId is null)
			 begin
				declare	@surrogateIdentityId bigint
	
				select		@surrogateIdentityId = [SurrogateIdentityId]
				from		[System.Activities.DurableInstancing].[DefinitionIdentityTable]
				where		[DefinitionIdentityHash] = '00000000-0000-0000-0000-000000000000'
				and			[DefinitionIdentityAnyRevisionHash] = '00000000-0000-0000-0000-000000000000'
				and			[Name] is null
				and			[Package] is null
				and			[Build] is null
				and			[Major] is null
				and			[Minor] is null
				and			[Revision] is null
				
				select		top 1 @nextRunnableTime = RunnableInstances.[RunnableTime]
				from		[RunnableInstancesTable] as RunnableInstances with (readpast)
				where		[WorkflowHostType] = @workflowHostType
				and			[SurrogateIdentityId] = @surrogateIdentityId
				order by	[WorkflowHostType], [RunnableTime]	
			 end
			else
			 begin
				select top 1 @nextRunnableTime = RunnableInstances.[RunnableTime]
						  from [RunnableInstancesTable] as RunnableInstances with (readpast)
							inner loop join (
								select [SurrogateIdentityId] as IdentityId
								from [IdentityOwnerTable] 
								where [SurrogateLockOwnerId] = @surrogateLockOwnerId
							) as FilteredIdentities
							on RunnableInstances.[SurrogateIdentityId] = FilteredIdentities.IdentityId 
						  where [WorkflowHostType] = @workflowHostType
						  order by [WorkflowHostType], [RunnableTime]	
			 end
		end
	
	
	select 0 as 'Result', @nextRunnableTime, getutcdate()
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[ExtendLock]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[ExtendLock]
	@surrogateLockOwnerId bigint,
	@lockTimeout int	
as
begin
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	begin transaction	
	
	declare @now datetime
	declare @newLockExpiration datetime
	declare @result int
	
	set @now = getutcdate()
	set @result = 0
	
	if (@lockTimeout = 0)
		set @newLockExpiration = '9999-12-31T23:59:59'
	else
		set @newLockExpiration = dateadd(second, @lockTimeout, @now)
	
	update [LockOwnersTable]
	set [LockExpiration] = @newLockExpiration
	where ([SurrogateLockOwnerId] = @surrogateLockOwnerId) and
		  ([LockExpiration] > @now)
	
	if (@@rowcount = 0) 
	begin
		if exists (select * from [LockOwnersTable] where ([SurrogateLockOwnerId] = @surrogateLockOwnerId))
		begin
			exec [System.Activities.DurableInstancing].[DeleteLockOwner] @surrogateLockOwnerId
			set @result = 11
		end
		else
			set @result = 12
	end
	
	select @result as 'Result'
	commit transaction
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[FreeKeys]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[FreeKeys]
	@surrogateInstanceId bigint,
	@keysToFree xml = null
as
begin	
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	declare @badKeyId uniqueidentifier
	declare @numberOfKeys int
	declare @result int
	declare @keyIds table([KeyId] uniqueidentifier)
	
	set @result = 0
	
	if (@keysToFree is not null)
	begin
		insert into @keyIds
		select T.Item.value('@KeyId', 'uniqueidentifier')
		from @keysToFree.nodes('//CorrelationKey') as T(Item)
		option(maxdop 1)
		
		select @numberOfKeys = count(1) from @keyIds
		
		delete [KeysTable]
		from @keyIds as [KeyIds]
		join [KeysTable] on [KeyIds].[KeyId] = [KeysTable].[Id]
		where [SurrogateInstanceId] = @surrogateInstanceId

		if (@@rowcount != @numberOfKeys)
		begin
			select top 1 @badKeyId = [MissingKeys].[MissingKeyId] from
				(select [KeyIds].[KeyId] as [MissingKeyId]
				 from @keyIds as [KeyIds]
				 except
				 select [Id] from [KeysTable] where [SurrogateInstanceId] = @surrogateInstanceId) as MissingKeys
		
			select 4 as 'Result', @badKeyId
			return 4
		end
	end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[GetActivatableWorkflowsActivationParameters]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[GetActivatableWorkflowsActivationParameters]
	@machineName nvarchar(128)
as
begin
	set nocount on
	set transaction isolation level read committed	
	set xact_abort on;	
	set deadlock_priority low
	
	declare @now datetime
	set @now = getutcdate()
	
	select 0 as 'Result'
	
	select top(1000) serviceDeployments.[SiteName], serviceDeployments.[RelativeApplicationPath], serviceDeployments.[RelativeServicePath]
	from (
		select distinct [ServiceDeploymentId], [WorkflowHostType]
		from [RunnableInstancesTable] with (readpast)
		where [RunnableTime] <= @now
		) runnableWorkflows inner join [ServiceDeploymentsTable] serviceDeployments
		on runnableWorkflows.[ServiceDeploymentId] = serviceDeployments.[Id]
	where not exists (
						select top (1) 1
						from [LockOwnersTable] lockOwners
						where lockOwners.[LockExpiration] > @now
						and lockOwners.[MachineName] = @machineName
						and lockOwners.[WorkflowHostType] = runnableWorkflows.[WorkflowHostType]
					  )
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[GetWorkflowInstanceStoreVersion]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[GetWorkflowInstanceStoreVersion]
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	
		
	select		Major
				,Minor
				,Build
				,Revision
	from		[System.Activities.DurableInstancing].[SqlWorkflowInstanceStoreVersionTable]
	
end	

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[InsertDefinitionIdentity]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[InsertDefinitionIdentity]	
	@identityMetadata xml = null
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;
	
	if (@identityMetadata is not null)
	 begin
		insert into [System.Activities.DurableInstancing].[DefinitionIdentityTable]
		(
				[DefinitionIdentityHash],
				[DefinitionIdentityAnyRevisionHash],
				[Name],
				[Package],
				[Build],
				[Major],
				[Minor],
				[Revision]
		)
		select 	T.Item.value('DefinitionIdentityHash[1]', 'uniqueidentifier'),
				T.Item.value('DefinitionIdentityAnyRevisionHash[1]', 'uniqueidentifier'),
				T.Item.value('Name[1]', 'nvarchar(max)'),
				T.Item.value('Package[1]', 'nvarchar(max)'),
				T.Item.value('Build[1]', 'bigint'),
				T.Item.value('Major[1]', 'bigint'),
				T.Item.value('Minor[1]', 'bigint'),
				T.Item.value('Revision[1]', 'bigint')
		from	@identityMetadata.nodes('/IdentityMetadata/IdentityCollection/Identity') as T(Item)
	 end	
end	

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[InsertPromotedProperties]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[InsertPromotedProperties]
	@instanceId uniqueidentifier,
	@promotionName nvarchar(400),
	@value1 sql_variant = null,
	@value2 sql_variant = null,
	@value3 sql_variant = null,
	@value4 sql_variant = null,
	@value5 sql_variant = null,
	@value6 sql_variant = null,
	@value7 sql_variant = null,
	@value8 sql_variant = null,
	@value9 sql_variant = null,
	@value10 sql_variant = null,
	@value11 sql_variant = null,
	@value12 sql_variant = null,
	@value13 sql_variant = null,
	@value14 sql_variant = null,
	@value15 sql_variant = null,
	@value16 sql_variant = null,
	@value17 sql_variant = null,
	@value18 sql_variant = null,
	@value19 sql_variant = null,
	@value20 sql_variant = null,
	@value21 sql_variant = null,
	@value22 sql_variant = null,
	@value23 sql_variant = null,
	@value24 sql_variant = null,
	@value25 sql_variant = null,
	@value26 sql_variant = null,
	@value27 sql_variant = null,
	@value28 sql_variant = null,
	@value29 sql_variant = null,
	@value30 sql_variant = null,
	@value31 sql_variant = null,
	@value32 sql_variant = null,
	@value33 varbinary(max) = null,
	@value34 varbinary(max) = null,
	@value35 varbinary(max) = null,
	@value36 varbinary(max) = null,
	@value37 varbinary(max) = null,
	@value38 varbinary(max) = null,
	@value39 varbinary(max) = null,
	@value40 varbinary(max) = null,
	@value41 varbinary(max) = null,
	@value42 varbinary(max) = null,
	@value43 varbinary(max) = null,
	@value44 varbinary(max) = null,
	@value45 varbinary(max) = null,
	@value46 varbinary(max) = null,
	@value47 varbinary(max) = null,
	@value48 varbinary(max) = null,
	@value49 varbinary(max) = null,
	@value50 varbinary(max) = null,
	@value51 varbinary(max) = null,
	@value52 varbinary(max) = null,
	@value53 varbinary(max) = null,
	@value54 varbinary(max) = null,
	@value55 varbinary(max) = null,
	@value56 varbinary(max) = null,
	@value57 varbinary(max) = null,
	@value58 varbinary(max) = null,
	@value59 varbinary(max) = null,
	@value60 varbinary(max) = null,
	@value61 varbinary(max) = null,
	@value62 varbinary(max) = null,
	@value63 varbinary(max) = null,
	@value64 varbinary(max) = null
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	

	declare @surrogateInstanceId bigint

	select @surrogateInstanceId = [SurrogateInstanceId]
	from [InstancesTable]
	where [Id] = @instanceId

	insert into [System.Activities.DurableInstancing].[InstancePromotedPropertiesTable]
	values (@surrogateInstanceId, @promotionName, @value1, @value2, @value3, @value4, @value5, @value6, @value7, @value8,
			@value9, @value10, @value11, @value12, @value13, @value14, @value15, @value16, @value17, @value18, @value19,
			@value20, @value21, @value22, @value23, @value24, @value25, @value26, @value27, @value28, @value29, @value30,
			@value31, @value32, @value33, @value34, @value35, @value36, @value37, @value38, @value39, @value40, @value41,
			@value42, @value43, @value44, @value45, @value46, @value47, @value48, @value49, @value50, @value51, @value52,
			@value53, @value54, @value55, @value56, @value57, @value58, @value59, @value60, @value61, @value62, @value63,
			@value64)
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[InsertRunnableInstanceEntry]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[InsertRunnableInstanceEntry]
	@surrogateInstanceId bigint,
	@workflowHostType uniqueidentifier,
	@serviceDeploymentId bigint, 
	@isSuspended bit,
	@isReadyToRun bit,
	@pendingTimer datetime,
	@surrogateIdentityId bigint
AS
begin    
	set nocount on;
	set transaction isolation level read committed;
	set xact_abort on;	
	
	declare @runnableTime datetime
	
	if (@isSuspended  = 0)
	begin
		if (@isReadyToRun = 1)
		begin
			set @runnableTime = getutcdate()					
		end
		else if (@pendingTimer is not null)
		begin
			set @runnableTime = @pendingTimer
		end
	end
		
	if (@runnableTime is not null and @workflowHostType is not null)
	begin	
		insert into [RunnableInstancesTable]
			([SurrogateInstanceId], [WorkflowHostType], [ServiceDeploymentId], [RunnableTime], [SurrogateIdentityId])
			values( @surrogateInstanceId, @workflowHostType, @serviceDeploymentId, @runnableTime, @surrogateIdentityId)
	end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[LoadInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[LoadInstance]
	@surrogateLockOwnerId bigint,
	@operationType tinyint,
	@handleInstanceVersion bigint,
	@handleIsBoundToLock bit,
	@keyToLoadBy uniqueidentifier = null,
	@instanceId uniqueidentifier = null,
	@keysToAssociate xml = null,
	@encodingOption tinyint,
	@concatenatedKeyProperties varbinary(max) = null,
	@singleKeyId uniqueidentifier,
	@operationTimeout int
as
begin
	set nocount on
	set transaction isolation level read committed	
	set xact_abort on;		
	set deadlock_priority low
	begin transaction
	
	declare @result int
	declare @lockAcquired bigint
	declare @isInitialized bit
	declare @createKey bit
	declare @createdInstance bit
	declare @keyIsAssociated bit
	declare @loadedByKey bit
	declare @now datetime
	declare @surrogateInstanceId bigint

	set @createdInstance = 0
	set @isInitialized = 0
	set @keyIsAssociated = 0
	set @result = 0
	set @surrogateInstanceId = null
	
	exec @lockAcquired = sp_getapplock @Resource = 'InstanceStoreLock', @LockMode = 'Shared', @LockTimeout = @operationTimeout
	
	if (@lockAcquired < 0)
	begin
		set @result = 13
		select @result as 'Result'
	end
	
	if (@result = 0)
	begin
		set @now = getutcdate()

		if (@operationType = 0) or (@operationType = 2)
		begin
MapKeyToInstanceId:
			set @loadedByKey = 0
			set @createKey = 0
			
			select @surrogateInstanceId = [SurrogateInstanceId],
				   @keyIsAssociated = [IsAssociated]
			from [KeysTable]
			where [Id] = @keyToLoadBy
			
			if (@@rowcount = 0)
			begin
				if (@operationType = 2)
				begin
					set @result = 4
					select @result as 'Result', @keyToLoadBy 
				end
					set @createKey = 1
			end
			else if (@keyIsAssociated = 0)
			begin
				set @result = 8
				select @result as 'Result', @keyToLoadBy
			end
			else
			begin
				select @instanceId = [Id]
				from [InstancesTable]
				where [SurrogateInstanceId] = @surrogateInstanceId

				if (@@rowcount = 0)
					goto MapKeyToInstanceId

				set @loadedByKey = 1
			end
		end
	end

	if (@result = 0)
	begin
LockOrCreateInstance:
		exec [System.Activities.DurableInstancing].[LockInstance] @instanceId, @surrogateLockOwnerId, @handleInstanceVersion, @handleIsBoundToLock, @surrogateInstanceId output, null, @result output
														  
		if (@result = 0 and @surrogateInstanceId = 0)
		begin
			if (@loadedByKey = 1)
				goto MapKeyToInstanceId
			
			if (@operationType > 1)
			begin
				set @result = 1
				select @result as 'Result', @instanceId as 'InstanceId'
			end
			else
			begin				
				exec [System.Activities.DurableInstancing].[CreateInstance] @instanceId, @surrogateLockOwnerId, null, null, @surrogateInstanceId output, @result output
			
				if (@result = 0 and @surrogateInstanceId = 0)
					goto LockOrCreateInstance
				else if (@surrogateInstanceId > 0)
					set @createdInstance = 1
			end
		end
		else if (@result = 0)
		begin
			delete from [RunnableInstancesTable]
			where [SurrogateInstanceId] = @surrogateInstanceId
		end
	end
		
	if (@result = 0)
	begin
		if (@createKey = 1) 
		begin
			select @isInitialized = [IsInitialized]
			from [InstancesTable]
			where [SurrogateInstanceId] = @surrogateInstanceId
			
			if (@isInitialized = 1)
			begin
				set @result = 5
				select @result as 'Result', @instanceId
			end
			else
			begin													
				insert into [KeysTable] ([Id], [SurrogateInstanceId], [IsAssociated])
				values (@keyToLoadBy, @surrogateInstanceId, 1)
				
				if (@@rowcount = 0)
				begin
					if (@createdInstance = 1)
					begin
						delete [InstancesTable]
						where [SurrogateInstanceId] = @surrogateInstanceId
					end
					else
					begin
						update [InstancesTable]
						set [SurrogateLockOwnerId] = null
						where [SurrogateInstanceId] = @surrogateInstanceId
					end
					
					goto MapKeyToInstanceId
				end
			end
		end
		else if (@loadedByKey = 1 and not exists(select [Id] from [KeysTable] where ([Id] = @keyToLoadBy) and ([IsAssociated] = 1)))
		begin
			set @result = 8
			select @result as 'Result', @keyToLoadBy
		end
		
		if (@operationType > 1 and not exists(select [Id] from [InstancesTable] where ([Id] = @instanceId) and ([IsInitialized] = 1)))
		begin
			set @result = 1
			select @result as 'Result', @instanceId as 'InstanceId'
		end
		
		if (@result = 0)
			exec @result = [System.Activities.DurableInstancing].[AssociateKeys] @surrogateInstanceId, @keysToAssociate, @concatenatedKeyProperties, @encodingOption, @singleKeyId
		
		-- Ensure that this key's data will never be overwritten.
		if (@result = 0 and @createKey = 1)
		begin
			update [KeysTable]
			set [EncodingOption] = @encodingOption
			where [Id] = @keyToLoadBy
		end
	end
	
	if (@result != 13)
		exec sp_releaseapplock @Resource = 'InstanceStoreLock'
		
	if (@result = 0)
	begin
		select @result as 'Result',
			   [Id],
			   [SurrogateInstanceId],
			   [PrimitiveDataProperties],
			   [ComplexDataProperties],
			   [MetadataProperties],
			   [DataEncodingOption],
			   [MetadataEncodingOption],
			   [Version],
			   [IsInitialized],
			   @createdInstance
		from [InstancesTable]
		where [SurrogateInstanceId] = @surrogateInstanceId
		
		if (@createdInstance = 0)
		begin
			select @result as 'Result',
				   [EncodingOption],
				   [Change]
			from [InstanceMetadataChangesTable]
			where [SurrogateInstanceId] = @surrogateInstanceId
			order by([ChangeTime])
			
			if (@@rowcount = 0)
			select @result as 'Result', null, null
				
			select @result as 'Result',
				   [Id],
				   [IsAssociated],
				   [EncodingOption],
				   [Properties]
			from [KeysTable] with (index(NCIX_KeysTable_SurrogateInstanceId))
			where ([KeysTable].[SurrogateInstanceId] = @surrogateInstanceId)
			
			if (@@rowcount = 0)
				select @result as 'Result', null, null, null, null
		end

		commit transaction
	end
	else if (@result = 2 or @result = 14)
		commit transaction
	else
		rollback transaction
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[LockInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[LockInstance]
	@instanceId uniqueidentifier,
	@surrogateLockOwnerId bigint,
	@handleInstanceVersion bigint,
	@handleIsBoundToLock bit,
	@surrogateInstanceId bigint output,
	@lockVersion bigint output,
	@result int output
as
begin
	set nocount on
	set transaction isolation level read committed
	set xact_abort on;	
	
	declare @isCompleted bit
	declare @currentLockOwnerId bigint
	declare @currentVersion bigint

TryLockInstance:
	set @currentLockOwnerId = 0
	set @surrogateInstanceId = 0
	set @result = 0
	
	update [InstancesTable]
	set [SurrogateLockOwnerId] = @surrogateLockOwnerId,
		@lockVersion = [Version] = case when ([InstancesTable].[SurrogateLockOwnerId] is null or 
											  [InstancesTable].[SurrogateLockOwnerId] != @surrogateLockOwnerId)
									then [Version] + 1
									else [Version]
								  end,
		@surrogateInstanceId = [SurrogateInstanceId]
	from [InstancesTable]
	left outer join [LockOwnersTable] on [InstancesTable].[SurrogateLockOwnerId] = [LockOwnersTable].[SurrogateLockOwnerId]
	where ([InstancesTable].[Id] = @instanceId) and
		  ([InstancesTable].[IsCompleted] = 0) and
		  (
		   (@handleIsBoundToLock = 0 and
		    (
		     ([InstancesTable].[SurrogateLockOwnerId] is null) or
		     ([LockOwnersTable].[SurrogateLockOwnerId] is null) or
			  (
		       ([LockOwnersTable].[LockExpiration] < getutcdate()) and
               ([LockOwnersTable].[SurrogateLockOwnerId] != @surrogateLockOwnerId)
			  )
		    )
		   ) or 
		   (
			(@handleIsBoundToLock = 1) and
		    ([LockOwnersTable].[SurrogateLockOwnerId] = @surrogateLockOwnerId) and
		    ([LockOwnersTable].[LockExpiration] > getutcdate()) and
		    ([InstancesTable].[Version] = @handleInstanceVersion)
		   )
		  )
	
	if (@@rowcount = 0)
	begin
		if not exists (select * from [LockOwnersTable] where ([SurrogateLockOwnerId] = @surrogateLockOwnerId) and ([LockExpiration] > getutcdate()))
		begin
			if exists (select * from [LockOwnersTable] where [SurrogateLockOwnerId] = @surrogateLockOwnerId)
				set @result = 11
			else
				set @result = 12
			
			select @result as 'Result'
			return 0
		end
		
		select @currentLockOwnerId = [SurrogateLockOwnerId],
			   @isCompleted = [IsCompleted],
			   @currentVersion = [Version]
		from [InstancesTable]
		where [Id] = @instanceId
	
		if (@@rowcount = 1)
		begin
			if (@isCompleted = 1)
				set @result = 7
			else if (@currentLockOwnerId = @surrogateLockOwnerId)
			begin
				if (@handleIsBoundToLock = 1)
					set @result = 10
				else
					set @result = 14
			end
			else if (@handleIsBoundToLock = 0)
				set @result = 2
			else
				set @result = 6
		end
		else if (@handleIsBoundToLock = 1)
			set @result = 6
	end

	if (@result != 0 and @result != 2)
		select @result as 'Result', @instanceId, @currentVersion
	else if (@result = 2)
	begin
		select @result as 'Result', @instanceId, [LockOwnersTable].[Id], [LockOwnersTable].[EncodingOption], [PrimitiveLockOwnerData], [ComplexLockOwnerData]
		from [LockOwnersTable]
		join [InstancesTable] on [InstancesTable].[SurrogateLockOwnerId] = [LockOwnersTable].[SurrogateLockOwnerId]
		where [InstancesTable].[SurrogateLockOwnerId] = @currentLockOwnerId and
			  [InstancesTable].[Id] = @instanceId
		
		if (@@rowcount = 0)
			goto TryLockInstance
	end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[RecoverInstanceLocks]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[RecoverInstanceLocks]
as
begin
	set nocount on;
	set transaction isolation level read committed;
	set xact_abort on;
	set deadlock_priority low;
    
	declare @now as datetime
	set @now = getutcdate()	
	
	insert into [RunnableInstancesTable] ([SurrogateInstanceId], [WorkflowHostType], [ServiceDeploymentId], [RunnableTime], [SurrogateIdentityId])
		select top (1000) instances.[SurrogateInstanceId], instances.[WorkflowHostType], instances.[ServiceDeploymentId], @now, instances.[SurrogateIdentityId]
		from [LockOwnersTable] lockOwners with (readpast) inner loop join
			 [InstancesTable] instances with (readpast)
				on instances.[SurrogateLockOwnerId] = lockOwners.[SurrogateLockOwnerId]
			where 
				lockOwners.[LockExpiration] <= @now and
				instances.[IsInitialized] = 1 and
				instances.[IsSuspended] = 0
	
	delete from [IdentityOwnerTable] with (readpast)
	where [IdentityOwnerTable].[SurrogateLockOwnerId] in
	(
		select [SurrogateLockOwnerId]
		from [System.Activities.DurableInstancing].[LockOwnersTable] lockOwners
		where [LockExpiration] <= @now
		and not exists
		(
			select top (1) 1
			from [System.Activities.DurableInstancing].[InstancesTable] instances with (nolock)
			where instances.[SurrogateLockOwnerId] = lockOwners.[SurrogateLockOwnerId]
		)
	)

	delete from [LockOwnersTable] with (readpast)
	from [LockOwnersTable] lockOwners
	where [LockExpiration] <= @now
	and not exists
	(
		select top (1) 1
		from [InstancesTable] instances with (nolock)
		where instances.[SurrogateLockOwnerId] = lockOwners.[SurrogateLockOwnerId]
	)
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[SaveInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[SaveInstance]
	@instanceId uniqueidentifier,
	@surrogateLockOwnerId bigint,
	@handleInstanceVersion bigint,
	@handleIsBoundToLock bit,
	@primitiveDataProperties varbinary(max),
	@complexDataProperties varbinary(max),
	@writeOnlyPrimitiveDataProperties varbinary(max),
	@writeOnlyComplexDataProperties varbinary(max),
	@metadataProperties varbinary(max),
	@metadataIsConsistent bit,
	@encodingOption tinyint,
	@timerDurationMilliseconds bigint,
	@suspensionStateChange tinyint,
	@suspensionReason nvarchar(max),
	@suspensionExceptionName nvarchar(450),
	@keysToAssociate xml,
	@keysToComplete xml,
	@keysToFree xml,
	@concatenatedKeyProperties varbinary(max),
	@unlockInstance bit,
	@isReadyToRun bit,
	@isCompleted bit,
	@singleKeyId uniqueidentifier,
	@lastMachineRunOn nvarchar(450),
	@executionStatus nvarchar(450),
	@blockingBookmarks nvarchar(max),
	@workflowHostType uniqueidentifier,
	@serviceDeploymentId bigint,
	@operationTimeout int,
	@identityMetadata xml = null
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	

	declare @currentInstanceVersion bigint
	declare @deleteInstanceOnCompletion bit
	declare @enqueueCommand bit
	declare @isSuspended bit
	declare @lockAcquired bigint
	declare @metadataUpdateOnly bit
	declare @now datetime
	declare @result int
	declare @surrogateInstanceId bigint
	declare @pendingTimer datetime
	declare @definitionIdentityHash uniqueidentifier
	declare @surrogateIdentityId bigint

	set @result = 0
	set @metadataUpdateOnly = 0
	
	exec @lockAcquired = sp_getapplock @Resource = 'InstanceStoreLock', @LockMode = 'Shared', @LockTimeout = @operationTimeout
		
	if (@lockAcquired < 0)
	begin
		select @result as 'Result'
		set @result = 13
	end
	
	set @now = getutcdate()
	
	if (@primitiveDataProperties is null and @complexDataProperties is null and @writeOnlyPrimitiveDataProperties is null and @writeOnlyComplexDataProperties is null)
		set @metadataUpdateOnly = 1

LockOrCreateInstance:
	if (@result = 0)
	begin
		exec [System.Activities.DurableInstancing].[LockInstance] @instanceId, @surrogateLockOwnerId, @handleInstanceVersion, @handleIsBoundToLock, @surrogateInstanceId output, @currentInstanceVersion output, @result output
															  
		if (@result = 0 and @surrogateInstanceId = 0)
		begin
			exec [System.Activities.DurableInstancing].[CreateInstance] @instanceId, @surrogateLockOwnerId, @workflowHostType, @serviceDeploymentId, @surrogateInstanceId output, @result output
			
			if (@result = 0 and @surrogateInstanceId = 0)
				goto LockOrCreateInstance
			
			set @currentInstanceVersion = 1
		end
	end
	
	if (@result = 0)
	begin
		select @enqueueCommand = [EnqueueCommand],
			   @deleteInstanceOnCompletion = [DeletesInstanceOnCompletion]
		from [LockOwnersTable]
		where ([SurrogateLockOwnerId] = @surrogateLockOwnerId)
		
		if (@isCompleted = 1 and @deleteInstanceOnCompletion = 1)
		begin
			exec [System.Activities.DurableInstancing].[DeleteInstance] @surrogateInstanceId
			goto Finally
		end
		
		if @identityMetadata is not null
		begin
			select @definitionIdentityHash = T.Item.value('DefinitionIdentityHash[1]', 'uniqueidentifier') 
			from @identityMetadata.nodes('/IdentityMetadata/IdentityCollection/Identity') as T(Item)
			
			if (@definitionIdentityHash is null)
			begin
				set @result = 15
				goto Finally 
			end
			else
			begin
				if not exists (
					select 1
					from [DefinitionIdentityTable]
					where [DefinitionIdentityHash] = @definitionIdentityHash
					)
				begin
					--insert the new identity
					exec [System.Activities.DurableInstancing].[InsertDefinitionIdentity] @identityMetadata
				end

                select @surrogateIdentityId = [SurrogateIdentityId]
                from [DefinitionIdentityTable]
                where ([DefinitionIdentityHash] = @definitionIdentityHash)
			end
		end
		
		update [InstancesTable] 
		set @instanceId = [InstancesTable].[Id],
			@workflowHostType = [WorkflowHostType] = 
					case when (@workflowHostType is null)
						then [WorkflowHostType]
						else @workflowHostType 
					end,
			@serviceDeploymentId = [ServiceDeploymentId] = 
					case when (@serviceDeploymentId is null)
						then [ServiceDeploymentId]
						else @serviceDeploymentId 
					end,
			@pendingTimer = [PendingTimer] = 
					case when (@metadataUpdateOnly = 1)
						then [PendingTimer]
						else [System.Activities.DurableInstancing].[GetExpirationTime](@timerDurationMilliseconds)
					end,
			@isReadyToRun = [IsReadyToRun] = 
					case when (@metadataUpdateOnly = 1)
						then [IsReadyToRun]
						else @isReadyToRun
					end,
			@isSuspended = [IsSuspended] = 
					case when (@suspensionStateChange = 0) then [IsSuspended]
						 when (@suspensionStateChange = 1) then 1
						 else 0
					end,
			[SurrogateLockOwnerId] = case when (@unlockInstance = 1 or @isCompleted = 1)
										then null
										else @surrogateLockOwnerId
									 end,
			[PrimitiveDataProperties] = case when (@metadataUpdateOnly = 1)
										then [PrimitiveDataProperties]
										else @primitiveDataProperties
									   end,
			[ComplexDataProperties] = case when (@metadataUpdateOnly = 1)
										then [ComplexDataProperties]
										else @complexDataProperties
									   end,
			[WriteOnlyPrimitiveDataProperties] = case when (@metadataUpdateOnly = 1)
										then [WriteOnlyPrimitiveDataProperties]
										else @writeOnlyPrimitiveDataProperties
									   end,
			[WriteOnlyComplexDataProperties] = case when (@metadataUpdateOnly = 1)
										then [WriteOnlyComplexDataProperties]
										else @writeOnlyComplexDataProperties
									   end,
			[MetadataProperties] = case
									 when (@metadataIsConsistent = 1) then @metadataProperties
									 else [MetadataProperties]
								   end,
			[SuspensionReason] = case
									when (@suspensionStateChange = 0) then [SuspensionReason]
									when (@suspensionStateChange = 1) then @suspensionReason
									else null
								 end,
			[SuspensionExceptionName] = case
									when (@suspensionStateChange = 0) then [SuspensionExceptionName]
									when (@suspensionStateChange = 1) then @suspensionExceptionName
									else null
								 end,
			[IsCompleted] = @isCompleted,
			[IsInitialized] = case
								when (@metadataUpdateOnly = 0) then 1
								else [IsInitialized]
							  end,
			[DataEncodingOption] = case
									when (@metadataUpdateOnly = 0) then @encodingOption
									else [DataEncodingOption]
								   end,
			[MetadataEncodingOption] = case
									when (@metadataIsConsistent = 1) then @encodingOption
									else [MetadataEncodingOption]
								   end,
			[BlockingBookmarks] = case
									when (@metadataUpdateOnly = 0) then @blockingBookmarks
									else [BlockingBookmarks]
								  end,
			[LastUpdated] = @now,
			[LastMachineRunOn] = case
									when (@metadataUpdateOnly = 0) then @lastMachineRunOn
									else [LastMachineRunOn]
								 end,
			[ExecutionStatus] = case
									when (@metadataUpdateOnly = 0) then @executionStatus
									else [ExecutionStatus]
								end,
			@surrogateIdentityId = [SurrogateIdentityId] = 
								case
									when (@identityMetadata is null) then [SurrogateIdentityId]
									else @surrogateIdentityId
								end
		from [InstancesTable]		
		where ([InstancesTable].[SurrogateInstanceId] = @surrogateInstanceId)
	
		if (@@rowcount = 0)
		begin
			set @result = 99
			select @result as 'Result' 
		end
		else
		begin
			if (@keysToAssociate is not null or @singleKeyId is not null)
				exec @result = [System.Activities.DurableInstancing].[AssociateKeys] @surrogateInstanceId, @keysToAssociate, @concatenatedKeyProperties, @encodingOption, @singleKeyId
			
			if (@result = 0 and @keysToComplete is not null)
				exec @result = [System.Activities.DurableInstancing].[CompleteKeys] @surrogateInstanceId, @keysToComplete
			
			if (@result = 0 and @keysToFree is not null)
				exec @result = [System.Activities.DurableInstancing].[FreeKeys] @surrogateInstanceId, @keysToFree
			
			if (@result = 0) and (@metadataUpdateOnly = 0)
			begin
				delete from [InstancePromotedPropertiesTable]
				where [SurrogateInstanceId] = @surrogateInstanceId
			end
			
			if (@result = 0)
			begin
				if (@metadataIsConsistent = 1)
				begin
					delete from [InstanceMetadataChangesTable]
					where [SurrogateInstanceId] = @surrogateInstanceId
				end
				else if (@metadataProperties is not null)
				begin
					insert into [InstanceMetadataChangesTable] ([SurrogateInstanceId], [EncodingOption], [Change])
					values (@surrogateInstanceId, @encodingOption, @metadataProperties)
				end
			end
			
			if (@result = 0 and @unlockInstance = 1 and @isCompleted = 0)
				exec [System.Activities.DurableInstancing].[InsertRunnableInstanceEntry] @surrogateInstanceId, @workflowHostType, @serviceDeploymentId, @isSuspended, @isReadyToRun, @pendingTimer, @surrogateIdentityId	
		end
	end

Finally:
	if (@result != 13)
		exec sp_releaseapplock @Resource = 'InstanceStoreLock'
	
	if (@result = 0)
		select @result as 'Result', @currentInstanceVersion

	return @result
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[TryLoadRunnableInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [System.Activities.DurableInstancing].[TryLoadRunnableInstance]
	@surrogateLockOwnerId bigint,
	@workflowHostType uniqueidentifier,
	@operationType tinyint,
	@handleInstanceVersion bigint,
	@handleIsBoundToLock bit,
	@encodingOption tinyint,	
	@operationTimeout int
as
begin
	set nocount on
	set transaction isolation level read committed	
	set xact_abort on;	
	set deadlock_priority -6
	begin tran
	
	declare @instanceId uniqueIdentifier
	declare @now datetime
	set @now = getutcdate()
	
	declare @workflowIdentityFilter tinyint
	
	select @workflowIdentityFilter = [WorkflowIdentityFilter]
	from [LockOwnersTable]
	where [LockOwnersTable].SurrogateLockOwnerId = @surrogateLockOwnerId
	
	if (@workflowIdentityFilter = null)
		set @workflowIdentityFilter = 0
		
	if (@workflowIdentityFilter = 1)
	begin
		-- Load any Runnable instances of specified WorkflowHostType
		select top (1) @instanceId = instances.[Id]
		from [RunnableInstancesTable] runnableInstances with (readpast, updlock)
			inner loop join [InstancesTable] instances with (readpast, updlock)
			on runnableInstances.[SurrogateInstanceId] = instances.[SurrogateInstanceId]
		where runnableInstances.[WorkflowHostType] = @workflowHostType
			  and 
			  runnableInstances.[RunnableTime] <= @now	
	end
	else if (@workflowIdentityFilter = 2)
	begin
		declare @AnyRevisionFilter table
		(
			DefinitionIdentityAnyRevisionHash uniqueidentifier
			UNIQUE (DefinitionIdentityAnyRevisionHash)
		)

		insert into @AnyRevisionFilter 
		select distinct [DefinitionIdentityAnyRevisionHash]
		from [DefinitionIdentityTable] as IdentityTable, [IdentityOwnerTable] as IdentityOwnerTable
		where IdentityOwnerTable.[SurrogateLockOwnerId] = @surrogateLockOwnerId 
			and 
			IdentityTable.[SurrogateIdentityId] = IdentityOwnerTable.[SurrogateIdentityId]
	
		-- Load Runnables instances of specified WorkflowHostType and ignore revision field on supported identities. 
		select top (1) @instanceId = instances.[Id]
		from [RunnableInstancesTable] runnableInstances with (readpast, updlock)
			inner loop join [InstancesTable] instances with (readpast, updlock)
			on runnableInstances.[SurrogateInstanceId] = instances.[SurrogateInstanceId]
			inner loop join (
						select IdentityTable.[SurrogateIdentityId] as IdentityId
						from [System.Activities.DurableInstancing].[DefinitionIdentityTable] as IdentityTable, @AnyRevisionFilter as AnyRevision
						where IdentityTable.[DefinitionIdentityAnyRevisionHash] = AnyRevision.DefinitionIdentityAnyRevisionHash
					) as FilteredIdentities 
			on runnableInstances.SurrogateIdentityId = FilteredIdentities.IdentityId
		where runnableInstances.[WorkflowHostType] = @workflowHostType
			  and 
			  runnableInstances.[RunnableTime] <= @now	  			
	end
	else
	begin
		-- Load Runnable instances of specified WorkflowHostType and the supported identities
		select top (1) @instanceId = instances.[Id]
		from [RunnableInstancesTable] runnableInstances with (readpast, updlock)
			inner loop join [InstancesTable] instances with (readpast, updlock)
			on runnableInstances.[SurrogateInstanceId] = instances.[SurrogateInstanceId]
			inner loop join (
				select [SurrogateIdentityId] as IdentityId 
				from [IdentityOwnerTable] 
				where [SurrogateLockOwnerId] = @surrogateLockOwnerId
			) as FilteredIdentities  
			on runnableInstances.[SurrogateIdentityId] = FilteredIdentities.IdentityId
		where runnableInstances.[WorkflowHostType] = @workflowHostType
			  and 
			  runnableInstances.[RunnableTime] <= @now
	end	       

    if (@@rowcount = 1)
    begin
		select 0 as 'Result', cast(1 as bit)				
		exec [System.Activities.DurableInstancing].[LoadInstance] @surrogateLockOwnerId, @operationType, @handleInstanceVersion, @handleIsBoundToLock, null, @instanceId, null, @encodingOption, null, null, @operationTimeout
    end	
    else
    begin
		select 0 as 'Result', cast(0 as bit)
    end
    
    if (@@trancount > 0)
    begin
		commit tran
    end
end

GO
/****** Object:  StoredProcedure [System.Activities.DurableInstancing].[UnlockInstance]    Script Date: 2016/3/26 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [System.Activities.DurableInstancing].[UnlockInstance]
	@surrogateLockOwnerId bigint,
	@instanceId uniqueidentifier,
	@handleInstanceVersion bigint
as
begin
	set nocount on
	set transaction isolation level read committed		
	set xact_abort on;	
	begin transaction
	
	declare @pendingTimer datetime
	declare @surrogateInstanceId bigint
	declare @workflowHostType uniqueidentifier
	declare @serviceDeploymentId bigint
	declare @enqueueCommand bit	
	declare @isReadyToRun bit	
	declare @isSuspended bit
	declare @now datetime
	declare @surrogateIdentityId bigint
	
	set @now = getutcdate()
		
	update [InstancesTable]
	set [SurrogateLockOwnerId] = null,
	    @surrogateInstanceId = [SurrogateInstanceId],
	    @workflowHostType = [WorkflowHostType],
   	    @serviceDeploymentId = [ServiceDeploymentId],
	    @pendingTimer = [PendingTimer],
	    @isReadyToRun =  [IsReadyToRun],
	    @isSuspended = [IsSuspended],
	    @surrogateIdentityId = [SurrogateIdentityId]
	where [Id] = @instanceId and
		  [SurrogateLockOwnerId] = @surrogateLockOwnerId and
		  [Version] = @handleInstanceVersion
	
	exec [System.Activities.DurableInstancing].[InsertRunnableInstanceEntry] @surrogateInstanceId, @workflowHostType, @serviceDeploymentId, @isSuspended, @isReadyToRun, @pendingTimer, @surrogateIdentityId    
	
	commit transaction
end

GO
