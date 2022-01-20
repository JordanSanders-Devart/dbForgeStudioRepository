CREATE TABLE [dbo].[Address] (
  [AddressID] [int] NULL,
  [AddressLine1] [nvarchar](50) NULL,
  [AddressLine2] [nvarchar](50) NULL,
  [City] [nvarchar](50) NULL,
  [StateProvinceID] [int] NULL,
  [PostalCode] [nvarchar](50) NULL,
  [SpatialLocation] [nvarchar](100) NULL,
  [rowguid] [nvarchar](50) NULL,
  [ModifiedDate] [datetime2] NULL
)
ON [PRIMARY]
GO