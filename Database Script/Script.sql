/****** Object:  Table [dbo].[ACCOUNTING_LOG]    Script Date: 9/4/2019 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNTING_LOG](
	[AId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Debit] [money] NOT NULL,
	[Credit] [money] NOT NULL,
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_ACCOUNTING_LOG] PRIMARY KEY CLUSTERED 
(
	[AId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/4/2019 11:02:24 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/4/2019 11:02:24 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/4/2019 11:02:24 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/4/2019 11:02:25 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/4/2019 11:02:25 AM ******/
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
/****** Object:  Table [dbo].[DRIVERS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVERS](
	[UId] [bigint] NOT NULL,
	[CreditLimit] [money] NOT NULL,
	[LastLongitude] [decimal](11, 8) NOT NULL,
	[LastLatitude] [decimal](10, 8) NOT NULL,
	[CNIC_Number] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DRIVERS] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_CNIC_NUMBER] UNIQUE NONCLUSTERED 
(
	[CNIC_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FARES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FARES](
	[FareId] [int] IDENTITY(1,1) NOT NULL,
	[PickUpFare] [smallmoney] NOT NULL,
	[DropOffFare] [smallmoney] NOT NULL,
	[GSTPercent] [decimal](5, 2) NOT NULL,
	[ServiceChargesPercent] [decimal](5, 2) NOT NULL,
	[DistanceTravelledPerKmFee] [smallmoney] NOT NULL,
	[Date] [date] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_FARES] PRIMARY KEY CLUSTERED 
(
	[FareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANUAL_TRANSACTIONS_LOG]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUAL_TRANSACTIONS_LOG](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_MANUAL_TRANSACTION_LOG] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOBILE_ACCOUNT_TRANSACTIONS_LOG]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOBILE_ACCOUNT_TRANSACTIONS_LOG](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[RefId] [varchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[MobileAccountService] [varchar](50) NOT NULL,
	[Amount] [money] NOT NULL,
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_MOBILE_ACCOUNT_TRANSACTION_LOG] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_REFERENCE_ID] UNIQUE NONCLUSTERED 
(
	[RefId] ASC,
	[MobileAccountService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROMO_CODES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMO_CODES](
	[PromoId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[DiscountPercent] [smallint] NOT NULL,
	[IsOpen] [bit] NOT NULL,
 CONSTRAINT [PK_PROMO_CODES] PRIMARY KEY CLUSTERED 
(
	[PromoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_CODE] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDE_ROUTE]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDE_ROUTE](
	[RideId] [bigint] NOT NULL,
	[RoutId] [bigint] IDENTITY(1,1) NOT NULL,
	[Latitude] [decimal](10, 8) NOT NULL,
	[Longitude] [decimal](11, 8) NOT NULL,
 CONSTRAINT [PK_RIDE_ROUTE] PRIMARY KEY CLUSTERED 
(
	[RideId] ASC,
	[RoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDERS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDERS](
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_RIDER] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDERS_PAY_FARES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDERS_PAY_FARES](
	[UId] [bigint] NOT NULL,
	[FareId] [int] NOT NULL,
	[RideId] [bigint] NOT NULL,
	[TotalFare] [money] NOT NULL,
	[Gst] [smallmoney] NOT NULL,
	[ServiceCharges] [smallmoney] NOT NULL,
	[Discount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_RIDERS_PAY_FARES] PRIMARY KEY CLUSTERED 
(
	[UId] ASC,
	[FareId] ASC,
	[RideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDERS_RATE_DRIVERS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDERS_RATE_DRIVERS](
	[RId] [bigint] IDENTITY(1,1) NOT NULL,
	[RUId] [bigint] NOT NULL,
	[DUId] [bigint] NOT NULL,
	[Rating] [smallint] NOT NULL,
	[Comment] [text] NOT NULL,
 CONSTRAINT [PK_RIDERS_RATE_DRIVERS] PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDES](
	[RideId] [bigint] IDENTITY(1,1) NOT NULL,
	[BookingTime] [datetime] NOT NULL,
	[PickUpTime] [datetime] NULL,
	[DropOffTime] [datetime] NULL,
	[IsEnded] [bit] NOT NULL,
	[PickupLongitude] [decimal](11, 8) NOT NULL,
	[PickupLatitude] [decimal](10, 8) NOT NULL,
	[DestLongitude] [decimal](11, 8) NOT NULL,
	[DestLatitude] [decimal](10, 8) NOT NULL,
	[DropLongitude] [decimal](11, 8) NULL,
	[DropLatitude] [decimal](10, 8) NULL,
	[TypeId] [int] NOT NULL,
	[RUId] [bigint] NULL,
	[DUId] [bigint] NOT NULL,
	[IsCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_RIDES] PRIMARY KEY CLUSTERED 
(
	[RideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDES_HAS_PROMO_CODES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDES_HAS_PROMO_CODES](
	[RideId] [bigint] NOT NULL,
	[PromoId] [int] NOT NULL,
 CONSTRAINT [PK_RIDES_HAS_PROMO_CODES] PRIMARY KEY CLUSTERED 
(
	[RideId] ASC,
	[PromoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMSES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSES](
	[SMSId] [bigint] IDENTITY(1,1) NOT NULL,
	[SentDataTime] [datetime] NOT NULL,
	[Body] [text] NOT NULL,
 CONSTRAINT [PK_SMSES] PRIMARY KEY CLUSTERED 
(
	[SMSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUB_ADMIN_AREAS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUB_ADMIN_AREAS](
	[UId] [bigint] NOT NULL,
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_SUB_ADMIN_AREAS] PRIMARY KEY CLUSTERED 
(
	[UId] ASC,
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUB_ADMINS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUB_ADMINS](
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_SUB_ADMINS] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_RECEIVES_SMS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_RECEIVES_SMS](
	[UId] [bigint] NOT NULL,
	[SMSId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[CountryCode] [varchar](3) NOT NULL,
	[CompanyCode] [varchar](3) NOT NULL,
	[PhoneNumber] [varchar](7) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_CONTACT] UNIQUE NONCLUSTERED 
(
	[CountryCode] ASC,
	[CompanyCode] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS_HAVE_ACTIVE_STATUSES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS_HAVE_ACTIVE_STATUSES](
	[UId] [bigint] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_USERS_HAVE_ACTIVE_STATUSES] PRIMARY KEY CLUSTERED 
(
	[UId] ASC,
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS_HAVE_IDENTITY]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS_HAVE_IDENTITY](
	[IdentityId] [nvarchar](128) NOT NULL,
	[UId] [bigint] NOT NULL,
 CONSTRAINT [PK_USERS_HAVE_IDENTITY] PRIMARY KEY CLUSTERED 
(
	[IdentityId] ASC,
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLE_TYPES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLE_TYPES](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VEHICLE_TYPES] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLES]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLES](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[RNumber] [smallint] NOT NULL,
	[RAlphabets] [varchar](3) NOT NULL,
	[RYear] [smallint] NOT NULL,
	[Model] [varchar](max) NOT NULL,
	[Color] [int] NOT NULL,
	[EngineCC] [smallint] NOT NULL,
	[IsAC] [bit] NOT NULL,
	[UId] [bigint] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_VEHICLE] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_REGISTRATION_NUMBER] UNIQUE NONCLUSTERED 
(
	[RAlphabets] ASC,
	[RNumber] ASC,
	[RYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PROMO_CODES] ADD  CONSTRAINT [DF_PROMO_CODES_IsOpen]  DEFAULT ((1)) FOR [IsOpen]
GO
ALTER TABLE [dbo].[RIDES] ADD  CONSTRAINT [DF_RIDES_IsCanceled]  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[ACCOUNTING_LOG]  WITH CHECK ADD  CONSTRAINT [DRIVERS_HAS_ACCOUNTING_LOG] FOREIGN KEY([UId])
REFERENCES [dbo].[DRIVERS] ([UId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACCOUNTING_LOG] CHECK CONSTRAINT [DRIVERS_HAS_ACCOUNTING_LOG]
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
ALTER TABLE [dbo].[DRIVERS]  WITH CHECK ADD  CONSTRAINT [DRIVERS_ARE_USERS] FOREIGN KEY([UId])
REFERENCES [dbo].[USERS] ([UId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DRIVERS] CHECK CONSTRAINT [DRIVERS_ARE_USERS]
GO
ALTER TABLE [dbo].[FARES]  WITH CHECK ADD  CONSTRAINT [FK_FARES_VEHICLE_TYPES] FOREIGN KEY([TypeId])
REFERENCES [dbo].[VEHICLE_TYPES] ([TypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FARES] CHECK CONSTRAINT [FK_FARES_VEHICLE_TYPES]
GO
ALTER TABLE [dbo].[MANUAL_TRANSACTIONS_LOG]  WITH CHECK ADD  CONSTRAINT [DRIVERS_MAKES_MANUAL_TRANSACTIONS_LOG] FOREIGN KEY([UId])
REFERENCES [dbo].[DRIVERS] ([UId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MANUAL_TRANSACTIONS_LOG] CHECK CONSTRAINT [DRIVERS_MAKES_MANUAL_TRANSACTIONS_LOG]
GO
ALTER TABLE [dbo].[MOBILE_ACCOUNT_TRANSACTIONS_LOG]  WITH CHECK ADD  CONSTRAINT [DRIVERS_MAKE_MOBILE_TRANSACTIONS] FOREIGN KEY([UId])
REFERENCES [dbo].[DRIVERS] ([UId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MOBILE_ACCOUNT_TRANSACTIONS_LOG] CHECK CONSTRAINT [DRIVERS_MAKE_MOBILE_TRANSACTIONS]
GO
ALTER TABLE [dbo].[RIDE_ROUTE]  WITH CHECK ADD  CONSTRAINT [RIDE_HAS_ROUTE] FOREIGN KEY([RideId])
REFERENCES [dbo].[RIDES] ([RideId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RIDE_ROUTE] CHECK CONSTRAINT [RIDE_HAS_ROUTE]
GO
ALTER TABLE [dbo].[RIDERS]  WITH CHECK ADD  CONSTRAINT [RIDERS_ARE_USERS] FOREIGN KEY([UId])
REFERENCES [dbo].[USERS] ([UId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RIDERS] CHECK CONSTRAINT [RIDERS_ARE_USERS]
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES]  WITH CHECK ADD  CONSTRAINT [FK_RIDERS_PAY_FARES_FARES] FOREIGN KEY([FareId])
REFERENCES [dbo].[FARES] ([FareId])
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES] CHECK CONSTRAINT [FK_RIDERS_PAY_FARES_FARES]
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES]  WITH CHECK ADD  CONSTRAINT [FK_RIDERS_PAY_FARES_RIDES] FOREIGN KEY([RideId])
REFERENCES [dbo].[RIDES] ([RideId])
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES] CHECK CONSTRAINT [FK_RIDERS_PAY_FARES_RIDES]
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES]  WITH CHECK ADD  CONSTRAINT [RIDERS_PAY_FARE] FOREIGN KEY([UId])
REFERENCES [dbo].[RIDERS] ([UId])
GO
ALTER TABLE [dbo].[RIDERS_PAY_FARES] CHECK CONSTRAINT [RIDERS_PAY_FARE]
GO
ALTER TABLE [dbo].[RIDERS_RATE_DRIVERS]  WITH CHECK ADD  CONSTRAINT [FK_RIDERS_RATE_DRIVERS_DRIVERS] FOREIGN KEY([DUId])
REFERENCES [dbo].[DRIVERS] ([UId])
GO
ALTER TABLE [dbo].[RIDERS_RATE_DRIVERS] CHECK CONSTRAINT [FK_RIDERS_RATE_DRIVERS_DRIVERS]
GO
ALTER TABLE [dbo].[RIDERS_RATE_DRIVERS]  WITH CHECK ADD  CONSTRAINT [FK_RIDERS_RATE_DRIVERS_RIDERS] FOREIGN KEY([RUId])
REFERENCES [dbo].[RIDERS] ([UId])
GO
ALTER TABLE [dbo].[RIDERS_RATE_DRIVERS] CHECK CONSTRAINT [FK_RIDERS_RATE_DRIVERS_RIDERS]
GO
ALTER TABLE [dbo].[RIDES]  WITH CHECK ADD  CONSTRAINT [DRIVERS_PICK-UP_RIDES] FOREIGN KEY([DUId])
REFERENCES [dbo].[DRIVERS] ([UId])
GO
ALTER TABLE [dbo].[RIDES] CHECK CONSTRAINT [DRIVERS_PICK-UP_RIDES]
GO
ALTER TABLE [dbo].[RIDES]  WITH CHECK ADD  CONSTRAINT [RIDERS_BOOK_RIDES] FOREIGN KEY([RUId])
REFERENCES [dbo].[RIDERS] ([UId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[RIDES] CHECK CONSTRAINT [RIDERS_BOOK_RIDES]
GO
ALTER TABLE [dbo].[RIDES]  WITH CHECK ADD  CONSTRAINT [RIDES_BELONG_TO_VEHICLE_TYPE] FOREIGN KEY([TypeId])
REFERENCES [dbo].[VEHICLE_TYPES] ([TypeId])
GO
ALTER TABLE [dbo].[RIDES] CHECK CONSTRAINT [RIDES_BELONG_TO_VEHICLE_TYPE]
GO
ALTER TABLE [dbo].[RIDES_HAS_PROMO_CODES]  WITH CHECK ADD  CONSTRAINT [FK_RIDES_HAS_PROMO_CODES_PROMO_CODES] FOREIGN KEY([PromoId])
REFERENCES [dbo].[PROMO_CODES] ([PromoId])
GO
ALTER TABLE [dbo].[RIDES_HAS_PROMO_CODES] CHECK CONSTRAINT [FK_RIDES_HAS_PROMO_CODES_PROMO_CODES]
GO
ALTER TABLE [dbo].[RIDES_HAS_PROMO_CODES]  WITH CHECK ADD  CONSTRAINT [FK_RIDES_HAS_PROMO_CODES_RIDES] FOREIGN KEY([RideId])
REFERENCES [dbo].[RIDES] ([RideId])
GO
ALTER TABLE [dbo].[RIDES_HAS_PROMO_CODES] CHECK CONSTRAINT [FK_RIDES_HAS_PROMO_CODES_RIDES]
GO
ALTER TABLE [dbo].[SUB_ADMIN_AREAS]  WITH CHECK ADD  CONSTRAINT [SUB_ADMIN_HAS_AREAS] FOREIGN KEY([UId])
REFERENCES [dbo].[SUB_ADMINS] ([UId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUB_ADMIN_AREAS] CHECK CONSTRAINT [SUB_ADMIN_HAS_AREAS]
GO
ALTER TABLE [dbo].[SUB_ADMINS]  WITH CHECK ADD  CONSTRAINT [SUB_ADMINS_ARE_USERES] FOREIGN KEY([UId])
REFERENCES [dbo].[USERS] ([UId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUB_ADMINS] CHECK CONSTRAINT [SUB_ADMINS_ARE_USERES]
GO
ALTER TABLE [dbo].[USERS_HAVE_ACTIVE_STATUSES]  WITH CHECK ADD  CONSTRAINT [ACTIVE_STATUSES_BELONG_TO_USER] FOREIGN KEY([UId])
REFERENCES [dbo].[USERS] ([UId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USERS_HAVE_ACTIVE_STATUSES] CHECK CONSTRAINT [ACTIVE_STATUSES_BELONG_TO_USER]
GO
ALTER TABLE [dbo].[USERS_HAVE_IDENTITY]  WITH CHECK ADD  CONSTRAINT [FK_USERS_HAVE_IDENTITY_AspNetUsers] FOREIGN KEY([IdentityId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[USERS_HAVE_IDENTITY] CHECK CONSTRAINT [FK_USERS_HAVE_IDENTITY_AspNetUsers]
GO
ALTER TABLE [dbo].[USERS_HAVE_IDENTITY]  WITH CHECK ADD  CONSTRAINT [FK_USERS_HAVE_IDENTITY_USERS] FOREIGN KEY([UId])
REFERENCES [dbo].[USERS] ([UId])
GO
ALTER TABLE [dbo].[USERS_HAVE_IDENTITY] CHECK CONSTRAINT [FK_USERS_HAVE_IDENTITY_USERS]
GO
ALTER TABLE [dbo].[VEHICLES]  WITH CHECK ADD  CONSTRAINT [DRIVER_HAS_VEHICLE] FOREIGN KEY([UId])
REFERENCES [dbo].[DRIVERS] ([UId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VEHICLES] CHECK CONSTRAINT [DRIVER_HAS_VEHICLE]
GO
ALTER TABLE [dbo].[VEHICLES]  WITH CHECK ADD  CONSTRAINT [VEHICLE_BELONGS_TO_A_VEHICLE_TYPE] FOREIGN KEY([TypeId])
REFERENCES [dbo].[VEHICLE_TYPES] ([TypeId])
GO
ALTER TABLE [dbo].[VEHICLES] CHECK CONSTRAINT [VEHICLE_BELONGS_TO_A_VEHICLE_TYPE]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAccountingLog]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewAccountingLog]
	@uId bigint,
	@dateTime datetime,
	@debit money,
	@credit money
AS
BEGIN
	INSERT INTO [ACCOUNTING_LOG]
           ([DateTime]
           ,[Debit]
           ,[Credit]
           ,[UId])
     VALUES
           (@dateTime
           ,@debit
           ,@credit
           ,@uId);
	SELECT SCOPE_IDENTITY() AS PK;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewAreaSubAdmin]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewAreaSubAdmin]
	@uId bigint,
	@name varchar(MAX)
AS
BEGIN
	INSERT INTO SUB_ADMIN_AREAS
	([AreaName], [UId])
	VALUES
	(@name, @uId);
	SELECT SCOPE_IDENTITY() AS AREA_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewDriver]
	@id bigint,
	@creditLimit money,
	@lLongitude decimal(11,8),
	@lLatitude decimal(10,8),
	@cnic nchar(15)
AS
BEGIN
	INSERT INTO [dbo].[DRIVERS]
           ([UId]
           ,[CreditLimit]
           ,[LastLongitude]
           ,[LastLatitude]
		   ,[CNIC_Number])
     VALUES
           (@id
           ,@creditLimit
           ,@lLongitude
           ,@lLatitude
		   ,@cnic);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewFare]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewFare]
	@tId int,
	@pickupFare smallmoney,
	@dropoffFare smallmoney,
	@gst decimal(5,2),
	@sCharges decimal(5,2),
	@distanceTravelledPerKmFee smallmoney,
	@date date
AS
BEGIN
	INSERT INTO [dbo].[FARES]
           ([PickUpFare]
           ,[DropOffFare]
           ,[GSTPercent]
           ,[ServiceChargesPercent]
           ,[DistanceTravelledPerKmFee]
           ,[Date]
           ,[TypeId])
     VALUES
           (@pickupFare
           ,@dropoffFare
           ,@gst
           ,@sCharges
           ,@distanceTravelledPerKmFee
           ,@date
           ,@tId);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddnewIdentityUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddnewIdentityUser]
	-- Add the parameters for the stored procedure here
	@uId bigint,
	@id nvarchar(128)
AS
BEGIN
	INSERT INTO [dbo].[USERS_HAVE_IDENTITY]
           ([IdentityId]
           ,[UId])
     VALUES
           (@id
           ,@uId);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewMobileTransaction]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewMobileTransaction]
	@uId bigint,
	@ref varchar(MAX),
	@dateTime datetime,
	@isVerified bit,
	@mService varChar(50),
	@amount money
AS
BEGIN
	INSERT INTO [MOBILE_ACCOUNT_TRANSACTIONS_LOG]
           ([RefId]
           ,[DateTime]
           ,[IsVerified]
           ,[MobileAccountService]
           ,[Amount]
           ,[UId])
     VALUES
           (@ref
           ,@dateTime
           ,@isVerified
           ,@mService
           ,@amount
           ,@uId);
	SELECT SCOPE_IDENTITY() as pk;

END
GO
/****** Object:  StoredProcedure [dbo].[AddNewPromoCode]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewPromoCode]
	@code varchar(20),
	@discount smallint
AS
BEGIN
	INSERT INTO [dbo].[PROMO_CODES]
           ([Code]
           ,[DiscountPercent])
     VALUES
           (@code
           ,@discount);
	SELECT SCOPE_IDENTITY() AS PK;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewRide]
	@bookingTime datetime,
	@pickUpLongitude decimal(11,8),
	@pickUpLatitude decimal(10,8),
	@destLongitude decimal(11,8),
	@destLatitude decimal(10,8),
	@isEnded bit,
	@tId int,
	@rId bigint,
	@dId bigint
AS
BEGIN
	INSERT INTO [dbo].[RIDES]
           ([BookingTime]
           ,[IsEnded]
           ,[PickupLongitude]
           ,[PickupLatitude]
           ,[DestLongitude]
           ,[DestLatitude]
           ,[TypeId]
           ,[RUId]
           ,[DUId])
     VALUES
           (@bookingTime
           ,@isEnded
           ,@pickUpLongitude
           ,@pickUpLatitude
           ,@destLongitude
           ,@destLatitude
           ,@tId
           ,@rId
           ,@dId);
		SELECT SCOPE_IDENTITY() AS PK;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewSms]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewSms]
	@dateTime datetime,
	@body text
AS
BEGIN
	INSERT INTO [dbo].[SMSES]
           ([SentDataTime]
           ,[Body])
     VALUES
           (@dateTime
           ,@body);
	SELECT SCOPE_IDENTITY() as pk;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewTransaction]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewTransaction]
	@dateTime datetime,
	@amount money,
	@uId bigint
AS
BEGIN
	INSERT INTO [dbo].[MANUAL_TRANSACTIONS_LOG]
           ([DateTime]
           ,[Amount]
           ,[UId])
     VALUES
           (@dateTime
           ,@amount
           ,@uId);
	SELECT SCOPE_IDENTITY() as pk;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser]
	@fName varchar(MAX), 
	@lName varchar(MAX),
	@cCode varchar(3),
	@comCode varchar(3),
	@phoneNumber varchar(7),
	@isBlocked bit = 0
AS
BEGIN
	INSERT INTO [dbo].[USERS]
           ([FirstName]
           ,[LastName]
           ,[CountryCode]
           ,[CompanyCode]
           ,[PhoneNumber]
           ,[IsBlocked])
     VALUES
           (@fName
           ,@lName
           ,@cCode
           ,@comCode
           ,@phoneNumber
           ,@isBlocked);
SELECT SCOPE_IDENTITY() as pk;
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewVehicle]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewVehicle]
	@uId bigint,
	@rNum smallint,
	@rAlpha varchar(3),
	@rYear smallint,
	@model varchar(MAX),
	@color varchar(20),
	@engine smallint,
	@isAc bit,
	@tId int
AS
BEGIN
	INSERT INTO [dbo].[VEHICLES]
           ([RNumber]
           ,[RAlphabets]
           ,[RYear]
           ,[Model]
           ,[Color]
           ,[EngineCC]
           ,[IsAC]
           ,[UId]
           ,[TypeId])
     VALUES
           (@rNum
           ,@rAlpha
           ,@rYear
           ,@model
           ,@color
           ,@engine
           ,@isAc
           ,@uId
           ,@tId);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewVehicleType]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewVehicleType]
	@name varchar(50),
	@pickupFare smallmoney,
	@dropoffFare smallmoney,
	@gst decimal(5,2),
	@sCharges decimal(5,2),
	@distanceTravelledPerKmFee smallmoney,
	@date date
AS
BEGIN
	INSERT INTO [dbo].[VEHICLE_TYPES]
           ([Name])
     VALUES
           (@name);
	DECLARE @tId INT;
	SET @tId=SCOPE_IDENTITY();
	INSERT INTO [dbo].[FARES]
           ([PickUpFare]
           ,[DropOffFare]
           ,[GSTPercent]
           ,[ServiceChargesPercent]
           ,[DistanceTravelledPerKmFee]
           ,[Date]
           ,[TypeId])
     VALUES
           (@pickupFare
           ,@dropoffFare
           ,@gst
           ,@sCharges
           ,@distanceTravelledPerKmFee
           ,@date
           ,@tId);
	DECLARE @fId INT;
	SET @fId=SCOPE_IDENTITY();
	SELECT @tId AS [TYPE_ID];
END
GO
/****** Object:  StoredProcedure [dbo].[AddPromoRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPromoRide]
	@rId bigint,
	@pId int
AS
BEGIN
	IF NOT EXISTS(
	SELECT PromoId 
	FROM RIDES_HAS_PROMO_CODES 
	WHERE RideId=@rId)
	BEGIN
		INSERT INTO [dbo].[RIDES_HAS_PROMO_CODES]
           ([RideId]
           ,[PromoId])
     VALUES
           (@rId
           ,@pId);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddRatingsRider]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRatingsRider]
	@rating smallint,
	@comment text,
	@rId bigint,
	@dId bigint
AS
BEGIN
	INSERT INTO [dbo].[RIDERS_RATE_DRIVERS]
           ([RUId]
           ,[DUId]
           ,[Rating]
           ,[Comment])
     VALUES
           (@rId
           ,@dId
           ,@rating
           ,@comment);
END
GO
/****** Object:  StoredProcedure [dbo].[AddRoute]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRoute]
	@rId bigint,
	@latitude decimal(10,8),
	@longitude decimal(11,8)
AS
BEGIN
	INSERT INTO [dbo].[RIDE_ROUTE]
           ([RideId]
           ,[Latitude]
           ,[Longitude])
     VALUES
           (@rId
           ,@latitude
           ,@longitude);
END
GO
/****** Object:  StoredProcedure [dbo].[GetAccountingLog]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountingLog]
	@aId bigint
AS
BEGIN
	SELECT *
	FROM ACCOUNTING_LOG
	WHERE AId=@aId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetActiveRides]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActiveRides]
AS
BEGIN
	SELECT RideId
	FROM RIDES
	WHERE IsEnded!='TRUE' OR IsCanceled!='TRUE';
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminBalance]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminBalance]
AS
BEGIN
	--ADMIN'S DEBIT AND CREDIT ARE OPPOSITES OF USER'S DEBIT AND CREDIT
	DECLARE @balance MONEY=0;
	DECLARE @credit MONEY;
	DECLARE @debit MONEY;
	SELECT @debit=SUM(Credit), @credit=SUM(Debit)
	FROM ACCOUNTING_LOG;
	SET @balance=@debit-@credit;
	SELECT @balance AS Balance;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminBalanceByMonth]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminBalanceByMonth]
	@startDate DATETIME,
	@endDate DATETIME
AS
BEGIN
	--ADMIN'S DEBIT AND CREDIT ARE OPPOSITES OF USER'S DEBIT AND CREDIT
	DECLARE @balance MONEY=0;
	DECLARE @credit MONEY;
	DECLARE @debit MONEY;
	SELECT @debit=SUM(Credit), @credit=SUM(Debit)
	FROM ACCOUNTING_LOG
	WHERE [DateTime] BETWEEN @startDate AND @endDate;
	SET @balance=@debit-@credit;
	SELECT @balance AS Balance;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminCredit]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminCredit]
AS
BEGIN
	SELECT SUM(Debit)
	FROM ACCOUNTING_LOG
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminCreditedAmount]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminCreditedAmount]
AS
BEGIN
	DECLARE @collection DECIMAL;
	SELECT @collection=(SUM(Debit)-SUM(Credit))
	FROM ACCOUNTING_LOG;
	IF(@collection>0)
	BEGIN
		SELECT @collection AS CREDIT_DUE;
	END
	ELSE
	BEGIN
		SELECT 0 AS CREDIT_DUE;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminDebit]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminDebit]
AS
BEGIN
	SELECT SUM(Credit)
	FROM ACCOUNTING_LOG;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminDebitByMonth]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminDebitByMonth]
	@startDate datetime,
	@endDate datetime
AS
BEGIN
	SELECT SUM(Credit)
	FROM ACCOUNTING_LOG
	WHERE [DateTime] BETWEEN @startDate AND @endDate; 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminTotalCollectionDue]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminTotalCollectionDue]
AS
BEGIN
	DECLARE @collection DECIMAL;
	SELECT @collection=(SUM(Credit)-SUM(Debit))
	FROM ACCOUNTING_LOG;
	IF(@collection>0)
	BEGIN
		SELECT @collection AS COLLECTION_DUE;
	END
	ELSE
	BEGIN
		SELECT 0 AS COLLECTION_DUE;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminTotalCollectionDueByMonth]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminTotalCollectionDueByMonth]
	@startDate datetime,
	@endDate datetime	
AS
BEGIN
	DECLARE @collection DECIMAL;
	SELECT @collection=(SUM(Credit)-SUM(Debit))
	FROM ACCOUNTING_LOG
	WHERE [DateTime] BETWEEN @startDate AND @endDate;
	IF (@collection>0)
	BEGIN
		SELECT @collection AS COLLECTION_DUE;
	END
	ELSE
	BEGIN
		SELECT 0 AS COLLECTION_DUE;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAreasSubAdmin]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAreasSubAdmin]
	@uId int
AS
BEGIN
	SELECT AreaName, AreaId
	FROM SUB_ADMIN_AREAS
	WHERE UId=@uId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMobileTransactions]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMobileTransactions]
AS
BEGIN
	SELECT TransactionId
	FROM MOBILE_ACCOUNT_TRANSACTIONS_LOG
	ORDER BY [DateTime] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMobileTransactionsDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMobileTransactionsDriver]
	@uId bigint
AS
BEGIN
	SELECT TOP(100) TransactionId
	FROM MOBILE_ACCOUNT_TRANSACTIONS_LOG
	WHERE [UId]=@uId
	ORDER BY [DateTime] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSmses]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSmses]
AS
BEGIN
	SELECT COUNT(UId) AS [COUNT], SMSId
	FROM USER_RECEIVES_SMS
	GROUP BY SMSId
	ORDER BY [COUNT] DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllVehicleTypes]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllVehicleTypes]
AS
BEGIN
	SELECT TypeId
	FROM VEHICLE_TYPES
END
GO
/****** Object:  StoredProcedure [dbo].[GetBalanceDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBalanceDriver]
	@uId bigint
AS
BEGIN
	DECLARE @balance MONEY=0;
	DECLARE @credit MONEY;
	DECLARE @debit MONEY;
	IF EXISTS(SELECT * FROM ACCOUNTING_LOG WHERE UId=@uId)
	BEGIN
		SELECT @credit=SUM(Credit), @debit=SUM(Debit)
		FROM ACCOUNTING_LOG
		WHERE [UId]=@uId;
		SET @balance=@debit-@credit;
	END
	SELECT @balance;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompletedRidesByMonth]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompletedRidesByMonth]
	@startDate DATETIME,
	@endDate DATETIME
AS
BEGIN
	SELECT RideId
	FROM RIDES
	WHERE DropOffTime BETWEEN @startDate AND @endDate;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompletedRidesUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompletedRidesUser]
	@uId bigint
AS
BEGIN
	IF EXISTS(SELECT * FROM DRIVERS WHERE UId=@uId)
	BEGIN
		SELECT RideId
		FROM RIDES
		WHERE DUId=@uId AND IsEnded='TRUE'
		ORDER BY RideId;
	END
	ELSE IF EXISTS(SELECT * FROM RIDERS WHERE UId=@uId)
	BEGIN
		SELECT RideId
		FROM RIDES
		WHERE RUId=@uId AND IsEnded='TRUE'
		ORDER BY RideId;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCreditedAmountByMonth]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCreditedAmountByMonth]
	@startDate datetime,
	@endDate datetime	
AS
BEGIN
	DECLARE @collection DECIMAL;
	SELECT @collection=(SUM(Debit)-SUM(Credit))
	FROM ACCOUNTING_LOG
	WHERE [DateTime] BETWEEN @startDate AND @endDate;
	IF (@collection>0)
	BEGIN
		SELECT @collection AS COLLECTION_DUE;
	END
	ELSE
	BEGIN
		SELECT 0 AS COLLECTION_DUE;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDriver]
	@id bigint
AS
BEGIN
	SELECT *
	FROM DRIVERS
	WHERE UId=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFare]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFare]
	@fId int
AS
BEGIN
	
	SELECT *
	FROM FARES
	WHERE FareId=@fId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFareVehicleType]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFareVehicleType]
	@vId int
AS
BEGIN
	SELECT MAX(FareId)
	FROM FARES
	WHERE TypeId=@vId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIsActiveDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIsActiveDriver]
	@uId bigint
AS
BEGIN
	SELECT *
	FROM USERS_HAVE_ACTIVE_STATUSES 
	WHERE UId=@uId AND [DateTime]=(SELECT MAX([DateTime])
								   FROM USERS_HAVE_ACTIVE_STATUSES
								   WHERE UId=@uId);
END
GO
/****** Object:  StoredProcedure [dbo].[GetIsBookedDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIsBookedDriver]
	@uId bigint
AS
BEGIN
	IF EXISTS(SELECT * FROM RIDES WHERE DUId=@uId AND IsEnded=0 AND IsCanceled=0)
	BEGIN
		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetManualTransactionsDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManualTransactionsDriver]
	@uId bigint
AS
BEGIN
	SELECT TOP(100) TransactionId
	FROM MANUAL_TRANSACTIONS_LOG
	WHERE UId=@uId
	ORDER BY [DateTime] DESC;

END
GO
/****** Object:  StoredProcedure [dbo].[GetMobileAccountTransaction]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMobileAccountTransaction]
	@tId bigint
AS
BEGIN
	SELECT *
	FROM MOBILE_ACCOUNT_TRANSACTIONS_LOG
	WHERE TransactionId=@tId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetMonthDiscounts]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMonthDiscounts]
	@startDate datetime,
	@endDate datetime
AS
BEGIN
	SELECT SUM(Discount)
	FROM RIDERS_PAY_FARES F, (SELECT RideId
								FROM RIDES
								WHERE ISENDED='TRUE' AND DropOffTime BETWEEN @startDate AND @endDate) AS R
	WHERE F.RideId=R.RideId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPromoCode]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPromoCode]
	@pId int
AS
BEGIN
	SELECT *
	FROM PROMO_CODES
	WHERE PromoId=@pId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPromoCodeByCode]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPromoCodeByCode]
	@code varchar(20)
AS
BEGIN
	SELECT PromoId
	FROM PROMO_CODES
	WHERE Code=@code;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPromoCodeRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPromoCodeRide]
	@rId bigint
AS
BEGIN
	IF EXISTS(
	SELECT PromoId 
	FROM RIDES_HAS_PROMO_CODES 
	WHERE RideId=@rId)
	BEGIN
		SELECT PromoId
		FROM RIDES_HAS_PROMO_CODES
		WHERE RideId=@rId;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetRatingsDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRatingsDriver] 
	@dId bigint
AS
BEGIN
	SELECT R.Rating, R.Comment, R.RUId
	FROM (SELECT TOP (50) *
			FROM RIDERS_RATE_DRIVERS
			WHERE DUId=@dId) AS R
	ORDER BY R.RId DESC;

END
GO
/****** Object:  StoredProcedure [dbo].[GetReceivedSMS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceivedSMS]
	@uId bigint
AS
BEGIN
	SELECT SMSId
	FROM USER_RECEIVES_SMS
	WHERE UId=@uId
	ORDER BY SMSId DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetReceiversSms]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceiversSms]
	@smsId bigint
AS
BEGIN
	SELECT DISTINCT UId
	FROM USER_RECEIVES_SMS
	WHERE SMSId=@smsId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRide]
	@rId bigint
AS
BEGIN
	SELECT *
	FROM RIDES
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRouteForRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRouteForRide]
	@rId bigint
AS
BEGIN
	SELECT *
	FROM RIDE_ROUTE
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetSms]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSms]
	@smsId bigint
AS
BEGIN
	SELECT *
	FROM SMSES
	WHERE SMSId=@smsId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalRatingsDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalRatingsDriver]
	@dId bigint
AS
BEGIN
	SELECT AVG(CONVERT(decimal(3,2),[Rating]))
	FROM RIDERS_RATE_DRIVERS
	WHERE DUId=@dId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTransaction]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTransaction]
	@tId bigint
AS
BEGIN
	SELECT *
	FROM MANUAL_TRANSACTIONS_LOG
	WHERE TransactionId=@tId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser]
	@uId bigint
AS
BEGIN
	SELECT *
	FROM USERS
	WHERE UId=@uId
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByUsername]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByUsername] 
	@username nvarchar(256)
AS
BEGIN
	SELECT [UId]
	FROM USERS_HAVE_IDENTITY I, AspNetUsers U
	WHERE U.UserName=@username AND I.IdentityId=U.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRole]
	@id bigint
AS
BEGIN
	IF EXISTS(SELECT * FROM SUB_ADMINS WHERE UId=@id)
	BEGIN
		SELECT 2;
	END
	ELSE IF EXISTS(SELECT * FROM DRIVERS WHERE UId=@id)
	BEGIN
		SELECT 3;
	END
	ELSE IF EXISTS(SELECT * FROM RIDERS WHERE UId=@id)
	BEGIN
		SELECT 4;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicle]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicle]
	@vId int
AS
BEGIN
	SELECT *
	FROM VEHICLES
	WHERE VehicleId=@vId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleDriver]
	@uId bigint
AS
BEGIN
	SELECT VehicleId
	FROM VEHICLES
	WHERE UId=@uId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleType]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleType]
	@tId int
AS
BEGIN
	SELECT *
	FROM VEHICLE_TYPES
	WHERE TypeId=@tId;
END
GO
/****** Object:  StoredProcedure [dbo].[IsPromoCodeUsed]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsPromoCodeUsed]
	@pId int,
	@uId bigint
AS
BEGIN
	IF EXISTS(SELECT *
				FROM RIDES_HAS_PROMO_CODES P, RIDES R 
				WHERE R.RideId=P.RideId AND P.PromoId=@pId AND R.RUId=@uId)
	BEGIN
		SELECT 'TRUE' AS FLAG;
	END
	ELSE
	BEGIN
		SELECT 'FALSE' AS FLAG; 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[IsUsernameTaken]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsUsernameTaken] 
	@username nvarchar(256)
AS
BEGIN
	SELECT COUNT(*)
	FROM AspNetUsers
	WHERE UserName=@username;
END
GO
/****** Object:  StoredProcedure [dbo].[PayForRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PayForRide]
	@uId bigint,
	@fId int,
	@rId bigint,
	@totalFare money,
	@gst smallmoney,
	@serviceCharges money,
	@discount money
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM RIDERS_PAY_FARES WHERE RideId=@rId)
	BEGIN
		INSERT INTO [dbo].[RIDERS_PAY_FARES]
           ([UId]
           ,[FareId]
           ,[RideId]
           ,[TotalFare]
           ,[Gst]
           ,[ServiceCharges]
           ,[Discount])
     VALUES
           (@uId
           ,@fId
           ,@rId
           ,@totalFare
           ,@gst
           ,@serviceCharges
           ,@discount);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveAreaSubAdmin]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveAreaSubAdmin]
	@aId int
AS
BEGIN
	DELETE SUB_ADMIN_AREAS
	WHERE AreaId=@aId;
END
GO
/****** Object:  StoredProcedure [dbo].[SendSMS]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendSMS]
	@smsId bigint,
	@uId bigint
AS
BEGIN
	INSERT INTO [dbo].[USER_RECEIVES_SMS]
           ([UId]
           ,[SMSId])
     VALUES
           (@uId
           ,@smsId);
END
GO
/****** Object:  StoredProcedure [dbo].[SetCreditLimit]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetCreditLimit]
	@uId bigint,
	@creditLimit money
AS
BEGIN
	UPDATE DRIVERS
	SET CreditLimit=@creditLimit
	WHERE UId=@uId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetDropOffLocation]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetDropOffLocation]
	@rId bigint,
	@dLatitude decimal(10,8),
	@dLongitude decimal(11,8)
AS
BEGIN
	UPDATE RIDES
	SET DropLatitude=@dLatitude, DropLongitude=@dLongitude
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetDropOffTimeRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetDropOffTimeRide]
	@rId bigint,
	@dTime datetime
AS
BEGIN
	UPDATE RIDES
	SET DropOffTime=@dTime
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetIsActiveUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetIsActiveUser]
	@uId bigint,
	@dateTime datetime,
	@isActive bit
AS
BEGIN
	INSERT INTO [USERS_HAVE_ACTIVE_STATUSES]
           ([UId]
           ,[DateTime]
           ,[IsActive])
     VALUES
           (@uId
           ,@dateTime
           ,@isActive);
END
GO
/****** Object:  StoredProcedure [dbo].[SetIsACVehicle]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetIsACVehicle]
	@vId int,
	@isAc INT
AS
BEGIN
	UPDATE VEHICLES
	SET IsAC=@isAc
	WHERE VehicleId=@vId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetIsCanceledRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetIsCanceledRide]
	@rId bigint,
	@isCanceled bit
AS
BEGIN
	UPDATE RIDES
	SET IsCanceled=@isCanceled
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetIsEndedRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetIsEndedRide]
	@rId bigint,
	@isEnded bit
AS
BEGIN
	UPDATE RIDES
	SET IsEnded=@isEnded
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetIsVerifiedMobileTransaction]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetIsVerifiedMobileTransaction]
	@tId bigint,
	@isVerified bit
AS
BEGIN
	UPDATE MOBILE_ACCOUNT_TRANSACTIONS_LOG
	SET IsVerified=@isVerified
	WHERE TransactionId=@tId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetPickUpLocation]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPickUpLocation]
	@rId bigint,
	@pLatitude decimal(10,8),
	@pLongitude decimal(11,8)
AS
BEGIN
	UPDATE RIDES
	SET PickupLatitude=@pLatitude, PickupLongitude=@pLongitude
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetPickUpTimeRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPickUpTimeRide]
	@rId bigint,
	@pickUpTime datetime
AS
BEGIN
	UPDATE RIDES
	SET PickUpTime=@pickUpTime
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetTypeVehicle]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetTypeVehicle]
	@vId int,
	@tId INT
AS
BEGIN
	UPDATE VEHICLES
	SET TypeId=@tId
	WHERE VehicleId=@vId;
END
GO
/****** Object:  StoredProcedure [dbo].[SetVehicleDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetVehicleDriver]
	@uId bigint
AS
BEGIN
	IF EXISTS(SELECT * FROM VEHICLES WHERE UId=@uId)
	BEGIN
		DECLARE @vId INT;
		SELECT @vId=VehicleId
		FROM VEHICLES
		WHERE UId=@uId;
		DELETE VEHICLES
		WHERE VehicleId=@vId;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateContactUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateContactUser]
	@id bigint,
	@cCode varchar(3),
	@comCode varchar(3),
	@phone varchar(7)
AS
BEGIN
	UPDATE USERS
	SET CountryCode=@cCode, CompanyCode=@comCode, PhoneNumber=@phone
	WHERE UId=@id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDriverRide]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDriverRide]
	@rId bigint,
	@dId bigInt
AS
BEGIN
	UPDATE RIDES
	SET DUId=@dId
	WHERE RideId=@rId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsBlockedUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsBlockedUser]
	@id bigint,
	@isBlocked bit
AS
BEGIN
	UPDATE USERS
	SET IsBlocked=@isBlocked
	WHERE UId=@id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsOpenPromo]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsOpenPromo] 
		@pId int,
		@isOpen bit
AS
BEGIN
	UPDATE PROMO_CODES
	SET [IsOpen]=@isOpen
	WHERE PromoId=@pId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocationDriver]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLocationDriver] 
	-- Add the parameters for the stored procedure here
	@lat decimal(10,8), 
	@lng decimal(11,8),
	@id bigint
AS
BEGIN
	UPDATE DRIVERS
	SET LastLatitude=@lat, LastLongitude=@lng
	WHERE [UId]=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateNameUser]    Script Date: 9/4/2019 11:02:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNameUser]
	@id bigint,
	@fName varchar(MAX),
	@lName varchar(MAX)
AS
BEGIN
	UPDATE USERS
	SET FirstName=@fName, LastName=@lName
	WHERE UId=@id
END
GO
