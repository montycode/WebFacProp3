USE [sistemaFacturacion]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[ID_CIUDAD] [int] IDENTITY(1,1) NOT NULL,
	[NOM_CIUDAD] [varchar](100) NOT NULL,
	[ID_ESTADO] [int] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[ID_CIUDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cte] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cte] [nchar](200) NOT NULL,
	[Direccion_cte] [nchar](200) NOT NULL,
	[Tel_cte] [char](10) NOT NULL,
	[Email_cte] [nchar](200) NULL,
	[FechaNac_cte] [date] NULL,
	[RFC_cte] [char](13) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[Folio_Fact] [int] NOT NULL,
	[Consecutivo_Det] [int] NOT NULL,
	[Id_Prod] [int] NULL,
	[Cantidad_Det] [int] NULL,
	[Subtotal_Det] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[ID_ESTADO] [int] IDENTITY(1,1) NOT NULL,
	[NOM_ESTADO] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Folio_cte] [int] IDENTITY(1,1) NOT NULL,
	[Id_cte] [int] NOT NULL,
	[Fecha_Fact] [datetime] NOT NULL,
	[Total_Fact] [money] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[Folio_cte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Prod] [varchar](300) NOT NULL,
	[Precio_Prod] [money] NOT NULL,
	[FechaCaducidad_Prod] [date] NOT NULL,
	[CodigBarras_Prod] [varchar](100) NOT NULL,
	[Proveedor_Prod] [varchar](200) NOT NULL,
 CONSTRAINT [PK__Producto__2085A9CFC1A886BD] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ID_PROVEEDOR] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[DIRECCION] [varchar](100) NOT NULL,
	[ID_CIUDAD] [int] NOT NULL,
	[TELEFONO] [char](10) NOT NULL,
	[EMAIL] [varchar](100) NOT NULL,
	[CP] [varchar](5) NOT NULL,
	[RFC] [varchar](13) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ID_PROVEEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelPrPrSu]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelPrPrSu](
	[Id_RelPrPrSu] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[ID_PROVEEDOR] [int] NOT NULL,
	[ID_SUCURSAL] [int] NOT NULL,
	[Precio_Unitario] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[ID_SUCURSAL] [int] IDENTITY(1,1) NOT NULL,
	[NOM_SUCURSAL] [varchar](100) NOT NULL,
	[TEL_SUCURSAL] [char](10) NOT NULL,
	[DIREC_SUCURSAL] [varchar](100) NOT NULL,
	[ID_CIUDAD] [int] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[ID_SUCURSAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[ID_VENDEDOR] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](50) NOT NULL,
	[CONTRASEÑA] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DIRECCION] [varchar](50) NOT NULL,
	[TELEFONO] [char](10) NOT NULL,
	[ID_SUCURSAL] [int] NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[ID_VENDEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([Folio_Fact])
REFERENCES [dbo].[Factura] ([Folio_cte])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Productos] FOREIGN KEY([Id_Prod])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Productos]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_cliente] FOREIGN KEY([Id_cte])
REFERENCES [dbo].[cliente] ([id_cte])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_cliente]
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaCliente]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaCliente] 
	@id_cte INT,
	@nombre_cte VARCHAR(200),
	@Direccion_cte VARCHAR(200),
	@Tel_cte CHAR(10),
	@Email_cte VARCHAR(200),
	@FechaNac_cte DATE,
	@RFC_cte CHAR(13)
AS
BEGIN
	UPDATE cliente
	SET nombre_cte = @nombre_cte,
	Direccion_cte = @Direccion_cte,
	Tel_cte = @Tel_cte,
	Email_cte = @Email_cte,
	FechaNac_cte = @FechaNac_cte,
	RFC_cte = @RFC_cte
	WHERE id_cte = @id_cte; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaDetalleFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaDetalleFactura] 
	@folio_fact INT,
	@id_prod INT,
	@id_consecutivo INT,
	@cantidad_det INT,
	@subtotal_det MONEY
AS
BEGIN
	UPDATE DetalleFactura SET
		Id_Prod = @id_prod,
		Consecutivo_Det = @id_consecutivo,
		Cantidad_Det = @cantidad_det,
		Subtotal_Det = @subtotal_det
	WHERE Folio_Fact = @folio_fact;
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaFactura] 
	@folio_cte INT,
	@id_cte INT,
	@fecha_fact DATETIME,
	@total_fact MONEY
AS
BEGIN
	UPDATE Factura SET
		Id_cte = @id_cte,
		Fecha_Fact = @fecha_fact,
		Total_Fact = @total_fact
	WHERE Folio_cte = @folio_cte;
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaProducto]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaProducto] 
	@id_Prod INT,
	@Descripcion_Prod VARCHAR(300),
	@Precio_Prod MONEY,
	@FechaCaducidad_Prod DATE,
	@CodigoBarras_Prod VARCHAR(100),
	@Proveedor_Prod VARCHAR(200)
AS
BEGIN
	UPDATE Productos SET
		Descripcion_Prod = @Descripcion_Prod,
		Precio_Prod = @Precio_Prod,
		FechaCaducidad_Prod = @FechaCaducidad_Prod,
		CodigBarras_Prod = @CodigoBarras_Prod,
		Proveedor_Prod = @Proveedor_Prod
	WHERE Id_Producto = @id_Prod; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaProveedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaProveedor]
	@ID_PROVEEDOR INT,
	@NOMBRE VARCHAR(100),
	@DIRECCION VARCHAR(100),
	@ID_CIUDAD INT,
	@TELEFONO CHAR(10),
	@EMAIL VARCHAR(100),
	@CP CHAR (5),
	@RFC CHAR(13)
AS
BEGIN
	UPDATE Proveedor
	SET
		NOMBRE = @NOMBRE,
		DIRECCION = @DIRECCION,
		ID_CIUDAD = @ID_CIUDAD,
		TELEFONO = @TELEFONO,
		EMAIL = @EMAIL,
		CP = @CP,
		RFC = @RFC
	WHERE ID_PROVEEDOR = @ID_PROVEEDOR
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_Actualizar_RelPrPrSu]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_Actualizar_RelPrPrSu]
	@Id_RelPrPrSu INT,
	@Id_Producto INT,
	@ID_PROVEEDOR INT,
	@ID_SUCURSAL INT,
	@Precio_Unitario MONEY
AS
BEGIN
	UPDATE RelPrPrSu
	SET 
		Id_Producto = @Id_Producto,
		ID_PROVEEDOR = @ID_PROVEEDOR,
		ID_SUCURSAL = @ID_SUCURSAL,
		Precio_Unitario = @Precio_Unitario
	WHERE 
		Id_RelPrPrSu = @Id_RelPrPrSu
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaSucursal]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaSucursal]
	@ID_SUCURSAL INT,
	@NOM_SUCURSAL VARCHAR(100),
	@TEL_SUCURSAL CHAR(10),
	@DIREC_SUCURSAL VARCHAR(100),
	@ID_CIUDAD INT
AS
BEGIN
	UPDATE Sucursal
	SET
		NOM_SUCURSAL = @NOM_SUCURSAL,
		TEL_SUCURSAL = @TEL_SUCURSAL,
		DIREC_SUCURSAL = @DIREC_SUCURSAL,
		ID_CIUDAD = @ID_CIUDAD
	WHERE ID_SUCURSAL = @ID_SUCURSAL
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ActualizaVendedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<VICTOR ARROYO>
-- Create date: <20 DE MARZO DE 2020>
-- Description:	<PROCEDIMIENTO ALMACENADO PARA ACTUALIZAR A UN VENDEDOR>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ActualizaVendedor] 
	@ID_VENDEDOR int,
	@USUARIO varchar(50),
	@CONTRASEÑA varchar(50),
	@NOMBRE varchar(50),
	@DIRECCION varchar(50),
	@TELEFONO char(10),
	@ID_SUCURSAL int
AS
BEGIN
	UPDATE Vendedor
	SET
		USUARIO = @USUARIO,
		CONTRASEÑA = @CONTRASEÑA,
		NOMBRE = @NOMBRE,
		DIRECCION = @DIRECCION,
		TELEFONO = @TELEFONO,
		ID_SUCURSAL = @ID_SUCURSAL
	WHERE ID_VENDEDOR = @ID_VENDEDOR
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_Alta_RelPrPrSu]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_Alta_RelPrPrSu]
	@Id_RelPrPrSu INT OUTPUT,
	@Id_Producto INT,
	@ID_PROVEEDOR INT,
	@ID_SUCURSAL INT, 
	@Precio_Unitario MONEY
AS
BEGIN	
	INSERT INTO RelPrPrSu(Id_Producto, ID_PROVEEDOR, ID_SUCURSAL, Precio_Unitario)
	VALUES (@Id_Producto, @ID_PROVEEDOR, @ID_SUCURSAL, @Precio_Unitario)
		
	SET @Id_RelPrPrSu = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaCliente]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David,,Jarillo>
-- Create date: <23-10-2019,,>
-- Description:	<Alta los registros de catalogo clientes,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaCliente]
	@id_cte INT OUTPUT,
	@nombre_cte VARCHAR(200),
	@direccion_cte VARCHAR(200),
	@tel_cte char(10),
	@email_cte VARCHAR(200),
	@fechaNac_cte DATE,
	@rfc_cte char(13)
AS
BEGIN
	INSERT INTO cliente
	(
		Nombre_cte, 
		Direccion_cte,
		Tel_cte,
		Email_cte,
		FechaNac_cte,
		RFC_cte
	) VALUES 
	(
		@nombre_cte, 
		@direccion_cte,
		@tel_cte,
		@email_cte,
		@fechaNac_cte,
		@rfc_cte
	)

	SET @id_cte = SCOPE_IDENTITY()
	
	END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaDetalleFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaDetalleFactura] 
	@folio_fact INT,
	@id_prod INT,
	@consecutivo_det INT,
	@cantidad_det INT,
	@subtotal_det INT
AS
BEGIN
	INSERT INTO DetalleFactura (
	    Folio_Fact,
		Id_Prod,
		Consecutivo_Det,
		Cantidad_Det,
		Subtotal_Det
	) VALUES (
	    @folio_fact,
		@id_prod,
		@consecutivo_det,
		@cantidad_det,
		@subtotal_det
	)

	UPDATE Factura SET Total_Fact = (Total_Fact + @subtotal_det)
	WHERE Folio_cte = @folio_fact;
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaFactura] 
	@folio_fact INT OUTPUT,
	@id_cte INT,
	@fecha_fact DATETIME,
	@total_fact MONEY
AS
BEGIN
	INSERT INTO Factura (
		Id_cte,
		Fecha_Fact,
		Total_Fact
	) VALUES (
		@id_cte,
		@fecha_fact,
		@total_fact
	);

	SET @folio_fact = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaProducto]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaProducto]
    @Id_Producto INT OUTPUT,
	@Descripcion_Prod VARCHAR(300),
	@Precio_Prod MONEY,
	@FechaCaducidad_Prod DATE,
	@CodigoBarras_Prod VARCHAR(100),
	@Proveedor_Prod VARCHAR(200)
AS
BEGIN
	INSERT INTO Productos(
		Descripcion_Prod,
		Precio_Prod,
		FechaCaducidad_Prod,
		CodigBarras_Prod,
		Proveedor_Prod
	) VALUES (
		@Descripcion_Prod,
		@Precio_Prod,
		@FechaCaducidad_Prod,
		@CodigoBarras_Prod,
		@Proveedor_Prod
	)
	
	SET @Id_Producto = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaProveedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaProveedor]
	@ID_PROVEEDOR INT OUTPUT,
	@NOMBRE VARCHAR(100),
	@DIRECCION VARCHAR(100),
	@ID_CIUDAD INT,
	@TELEFONO CHAR(10),
	@EMAIL VARCHAR(100),
	@CP VARCHAR (5),
	@RFC VARCHAR(13)
AS
BEGIN
	INSERT INTO Proveedor
	(NOMBRE, DIRECCION, ID_CIUDAD, TELEFONO, EMAIL, CP, RFC)
	VALUES
	(@NOMBRE, @DIRECCION, @ID_CIUDAD, @TELEFONO, @EMAIL, @CP, @RFC)

	SET @ID_PROVEEDOR = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaSucursal]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaSucursal]
	@ID_SUCURSAL INT OUTPUT,
	@NOM_SUCURSAL VARCHAR(50),
	@TEL_SUCURSAL CHAR(10),
	@DIREC_SUCURSAL VARCHAR (100),
	@ID_CIUDAD INT
AS
BEGIN
	INSERT INTO Sucursal(NOM_SUCURSAL, TEL_SUCURSAL, DIREC_SUCURSAL, ID_CIUDAD)
	VALUES(@NOM_SUCURSAL, @TEL_SUCURSAL, @DIREC_SUCURSAL, @ID_CIUDAD)

	SET @ID_SUCURSAL = SCOPE_IDENTITY()
END

GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_AltaVendedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Victor Arroyo>
-- Create date: <20 de Marzo 2020>
-- Description:	<Procedimiento almacenado para subir datos>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_AltaVendedor]
  @ID_VENDEDOR int output,
	@USUARIO varchar(50),
	@CONTRASEÑA varchar (50),
	@NOMBRE varchar(50),
	@DIRECCION varchar(50),
	@TELEFONO char(10),
	@ID_SUCURSAL int
AS
BEGIN
	INSERT INTO Vendedor(USUARIO, CONTRASEÑA, NOMBRE, DIRECCION, TELEFONO, ID_SUCURSAL)
	VALUES(@USUARIO, @CONTRASEÑA, @NOMBRE, @DIRECCION, @TELEFONO, @ID_SUCURSAL)
	
  SET @ID_VENDEDOR = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_Baja_RelPrPrSu]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_Baja_RelPrPrSu]
	@Id_RelPrPrSu INT
AS
BEGIN
	DELETE FROM RelPrPrSu WHERE Id_RelPrPrSu = @Id_RelPrPrSu   
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaCliente]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaCliente] 
	@id_cte INT
AS
BEGIN
	DELETE FROM cliente WHERE id_cte = @id_cte;
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaDetalleFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaDetalleFactura] 
	@folio_fact INT
AS
BEGIN
	DELETE DetalleFactura WHERE Folio_Fact = @folio_fact; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaFactura]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaFactura] 
	@folio_cte INT
AS
BEGIN
	DELETE Factura WHERE Folio_cte = @folio_cte; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaProducto]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaProducto] 
	@id_Prod INT
AS
BEGIN
	DELETE Productos WHERE Id_Producto = @id_Prod; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaProveedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaProveedor]
	@ID_PROVEEDOR INT
AS
BEGIN
	DELETE FROM Proveedor WHERE ID_PROVEEDOR = @ID_PROVEEDOR
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaSucursal]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaSucursal]
	@ID_SUCURSAL INT
AS
BEGIN
	DELETE FROM Sucursal WHERE ID_SUCURSAL = @ID_SUCURSAL
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_BajaVendedor]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<VICTOR ARROYO>
-- Create date: <20 DE MARZO DE 2020>
-- Description:	<PROCEDIMIENTO ALMACENADO PARA DAR DE BAJA A UN VENDEDOR>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_BajaVendedor] 
	@ID_VENDEDOR int
AS
BEGIN
	DELETE Vendedor WHERE ID_VENDEDOR = @ID_VENDEDOR; 
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_Consulta_RelPrPrSu]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_Consulta_RelPrPrSu]
		@Id_Producto INT = NULL,
		@ID_PROVEEDOR INT = NULL,
		@ID_SUCURSAL INT = NULL,
		@Precio_Unitario MONEY = NULL
AS
BEGIN

	SELECT P.NOMBRE, S.NOM_SUCURSAL, Pr.Descripcion_Prod, R.Precio_Unitario FROM RelPrPrSu R
	JOIN Proveedor P ON P.ID_PROVEEDOR = R.ID_PROVEEDOR
	JOIN Sucursal S ON S.ID_SUCURSAL = R.ID_SUCURSAL
	JOIN Productos Pr ON Pr.Id_Producto = R.Id_Producto
		WHERE
		P.ID_PROVEEDOR = ISNULL(@ID_PROVEEDOR, P.ID_PROVEEDOR) AND
		S.ID_SUCURSAL = ISNULL(@ID_SUCURSAL, S.ID_SUCURSAL) AND
		Pr.Id_Producto = ISNULL(@Id_Producto, Pr.Id_Producto)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaCiudades]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaCiudades]
	@ID_CIUDAD INT = NULL,
	@NOM_CIUDAD VARCHAR(100) = NULL,
	@ID_ESTADO INT = NULL
AS
BEGIN
	SELECT * FROM Ciudad
	WHERE
		ID_CIUDAD = ISNULL(@ID_CIUDAD, ID_CIUDAD) AND
		NOM_CIUDAD = ISNULL(@NOM_CIUDAD, NOM_CIUDAD) AND
		ID_ESTADO = ISNULL(@ID_ESTADO, ID_ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaClientes]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaClientes] 
	@id_cte INT=null,
	@nombre_cte VARCHAR(200)=null,
	@RFC_cte VARCHAR(13)=null
AS
BEGIN
	SELECT * FROM cliente WHERE 
	id_cte = ISNULL(@id_cte, id_cte) and   
	(nombre_cte = ISNULL(@nombre_cte, nombre_cte) or  nombre_cte like '%' + @nombre_cte  + '%')and
	RFC_cte = ISNULL(@RFC_cte, RFC_cte)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaDetalleFacturas]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaDetalleFacturas] 
	@folio_fact INT = null
AS
BEGIN
	SELECT * FROM DetalleFactura 
	WHERE Folio_Fact = ISNULL(@folio_fact, Folio_Fact);
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaEstados]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaEstados]
	@ID_ESTADO INT = NULL,
	@NOM_ESTADO VARCHAR(100) = NULL
AS
BEGIN
	SELECT * FROM Estado
	WHERE
		ID_ESTADO = ISNULL(@ID_ESTADO, ID_ESTADO) AND
		NOM_ESTADO = ISNULL(@NOM_ESTADO, NOM_ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaFacturas]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaFacturas] 
	@folio_cte INT
AS
BEGIN
	SELECT * FROM Factura WHERE Folio_cte = @folio_cte;
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaProductos]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaProductos] 
	@id_Producto INT = null
AS
BEGIN
	SELECT * FROM Productos
	WHERE Id_Producto = ISNULL(@id_Producto, Id_Producto)  
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaProveedores]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaProveedores]
	@ID_PROVEEDOR INT = NULL,
	@NOMBRE VARCHAR(100) = NULL,
	@DIRECCION VARCHAR(100) = NULL,
	@NOM_CIUDAD VARCHAR(100) = NULL,
	@NOM_ESTADO VARCHAR(100) = NULL,
	@TELEFONO CHAR(10) = NULL,
	@EMAIL VARCHAR(100) = NULL,
	@CP VARCHAR(5) = NULL,
	@RFC VARCHAR(13) = NULL
AS
BEGIN
	SELECT P.ID_PROVEEDOR, P.NOMBRE, P.DIRECCION, P.CP, 
	C.NOM_CIUDAD, E.NOM_ESTADO, P.TELEFONO, P.EMAIL, P.RFC, C.ID_CIUDAD FROM Proveedor P
	JOIN Ciudad C
	ON P.ID_CIUDAD = C.ID_CIUDAD
	JOIN Estado E
	ON C.ID_ESTADO = E.ID_ESTADO
	WHERE
		ID_PROVEEDOR = ISNULL(@ID_PROVEEDOR, ID_PROVEEDOR) AND
		NOMBRE = ISNULL(@NOMBRE, NOMBRE) AND
		DIRECCION = ISNULL(@DIRECCION, DIRECCION) AND
		NOM_CIUDAD = ISNULL(@NOM_CIUDAD, NOM_CIUDAD) AND
		NOM_ESTADO = ISNULL(@NOM_ESTADO, NOM_ESTADO) AND
		TELEFONO = ISNULL(@TELEFONO, TELEFONO) AND
		EMAIL = ISNULL(@EMAIL, EMAIL) AND
		CP = ISNULL (@CP, CP) AND
		RFC = ISNULL(@RFC, RFC)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaSucursales]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaSucursales]
	@ID_SUCURSAL INT = NULL,
	@NOM_SUCURSAL VARCHAR(100) = NULL,
	@TEL_SUCURSAL CHAR(10) = NULL,
	@DIREC_SUCURSAL VARCHAR(100) = NULL,
	@NOM_CIUDAD VARCHAR(100) = NULL,
	@NOM_ESTADO VARCHAR(100) = NULL,
	@ID_CIUDAD INT = NULL
AS
BEGIN
	SELECT S.ID_SUCURSAL, S.NOM_SUCURSAL, S.TEL_SUCURSAL, S.DIREC_SUCURSAL, C.NOM_CIUDAD, E.NOM_ESTADO, C.ID_CIUDAD FROM Sucursal S
	JOIN Ciudad C
	ON S.ID_CIUDAD = C.ID_CIUDAD
	JOIN Estado E
	ON C.ID_ESTADO = E.ID_ESTADO
	WHERE
		ID_SUCURSAL = ISNULL(@ID_SUCURSAL, ID_SUCURSAL) AND
		NOM_SUCURSAL = ISNULL(@NOM_SUCURSAL, NOM_SUCURSAL) AND
		TEL_SUCURSAL = ISNULL(@TEL_SUCURSAL, TEL_SUCURSAL) AND
		DIREC_SUCURSAL = ISNULL(@DIREC_SUCURSAL, DIREC_SUCURSAL) AND
		NOM_CIUDAD = ISNULL(@NOM_CIUDAD, NOM_CIUDAD) AND
		NOM_ESTADO = ISNULL(@NOM_ESTADO, NOM_ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[CATALOGOS_SP_ConsultaVendedores]    Script Date: 25/03/2020 08:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<VICTOR ARROYO>
-- Create date: <20 DE MARZO DE 2020>
-- Description:	<PROCEDIMIENTO ALMACENADO PARA CONSULTAR UN VENDEDOR>
-- =============================================
CREATE PROCEDURE [dbo].[CATALOGOS_SP_ConsultaVendedores] 
	@NOMBRE varchar(50)
AS
BEGIN
	SELECT * FROM Vendedor
	WHERE NOMBRE = ISNULL (@NOMBRE, NOMBRE)
END
GO

/* Insertando Estados */

GO
SET IDENTITY_INSERT [dbo].[Estado] ON 
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (1, N'Ciudad de Mexico')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (2, N'Aguascalientes')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (3, N'Baja California')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (4, N'Baja California Sur')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (5, N'Campeche')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (6, N'Chiapas')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (7, N'Chihuahua')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (8, N'Coahuila')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (9, N'Colima')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (10, N'Durango')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (11, N'Guanajuato')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (12, N'Guerrero')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (13, N'Hidalgo')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (14, N'Jalisco')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (15, N'Mexico')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (16, N'Michoacan')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (17, N'Morelos')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (18, N'Nayarit')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (19, N'Nuevo Leon')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (20, N'Oaxaca')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (21, N'Puebla')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (22, N'Queretaro')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (23, N'Quintana Roo')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (24, N'San Luis Potosi')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (25, N'Sinaloa')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (26, N'Sonora')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (27, N'Tabasco')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (28, N'Tamaulipas')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (29, N'Tlaxcala')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (30, N'Veracruz')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (31, N'Yucatan')
GO
INSERT [dbo].[Estado] ([ID_ESTADO], [NOM_ESTADO]) VALUES (32, N'Zacatecas')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO

/* Insertando Ciudades */

GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (1, N'Ciudad de Mexico', 1)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (2, N'Ecatepec', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (3, N'Guadalajara', 14)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (4, N'Puebla de Zaragoza', 21)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (5, N'Tijuana', 3)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (6, N'Ciudad Juarez', 7)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (7, N'Leon', 11)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (8, N'Zapopan', 14)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (9, N'Monterrey', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (10, N'Nezahualcoyotl', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (11, N'Hermosillo', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (12, N'Chihuahua', 7)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (13, N'Naucalpan de Juarez', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (14, N'Mérida', 31)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (15, N'San Luis Potosi', 24)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (16, N'Aguascalientes', 2)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (17, N'Saltillo', 8)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (18, N'Mexicali', 3)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (19, N'Culiacan Rosales', 25)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (20, N'Guadalupe', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (21, N'Acapulco de Juarez', 12)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (22, N'Tlalnepantla de Baz', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (23, N'Cancun', 23)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (24, N'Santiago de Queretaro', 22)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (25, N'Chimalhuacan', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (26, N'Torreon', 8)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (27, N'Morelia', 16)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (28, N'Reynosa', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (29, N'Tlaquepaque', 14)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (30, N'Tuxtla Gutierrez', 6)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (31, N'Victoria de Durango', 10)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (32, N'Toluca de Lerdo', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (33, N'Ciudad Lopez Mateos', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (34, N'Cuautitlan Izcalli', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (35, N'Apodaca', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (36, N'Heroica Matamoros', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (37, N'San Nicolas de los Garza', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (38, N'Veracruz', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (39, N'Xalapa', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (40, N'Tonala', 14)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (41, N'Mazatlan', 25)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (42, N'Irapuato', 11)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (43, N'Nuevo Laredo', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (44, N'Xico', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (45, N'Villahermosa', 27)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (46, N'General Escobedo', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (47, N'Celaya', 11)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (48, N'Cuernavaca', 17)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (49, N'Tepic', 18)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (50, N'Ixtapaluca', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (51, N'Ciudad Victoria', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (52, N'Ciudad Obregon', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (53, N'Tampico', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (54, N'Villa Nicolas Romero', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (55, N'Ensenada', 3)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (56, N'San Francisco Coacalco', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (57, N'Santa Catarina', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (58, N'Uruapan', 16)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (59, N'Gomez Palacio', 10)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (60, N'Los Mochis', 25)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (61, N'Pachuca de Soto', 13)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (62, N'Oaxaca de Juarez', 20)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (63, N'Soledad de Graciano Sanchez', 24)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (64, N'Tehuacan', 21)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (65, N'Ojo de Agua', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (66, N'Coatzacoalcos', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (67, N'San Francisco de Campeche', 5)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (68, N'Monclova', 8)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (69, N'La Paz', 4)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (70, N'Heroica Nogales', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (71, N'Buenavista', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (72, N'Manzanillo', 9)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (73, N'Puerto Vallarta', 14)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (74, N'Tapachula', 6)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (75, N'Ciudad Madero', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (76, N'San Pablo de las Salinas', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (77, N'Chilpancingo de los Bravo', 12)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (78, N'Poza Rica de Hidalgo', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (79, N'Chicoloapan', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (80, N'Ciudad del Carmen', 5)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (81, N'Chalco de Diaz Covarrubias', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (82, N'Jiutepec', 17)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (83, N'Salamanca', 11)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (84, N'San Luis Rio Colorado', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (85, N'San Cristobal de las Casas', 6)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (86, N'Cuautla de Morelos', 17)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (87, N'Juarez', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (88, N'Chetumal', 23)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (89, N'Piedras Negras', 8)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (90, N'Playa del Carmen', 23)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (91, N'Zamora', 16)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (92, N'Cordoba', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (93, N'San Juan del Rio', 22)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (94, N'Colima', 9)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (95, N'Ciudad Acuna', 8)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (96, N'Zacatecas', 32)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (97, N'Veracruz', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (98, N'Ciudad Valles', 24)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (99, N'Guadalupe', 32)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (100, N'San Pedro Garza Garcia', 19)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (101, N'Naucalpan de Juarez', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (102, N'Fresnillo', 32)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (103, N'Orizaba', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (104, N'Miramar', 28)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (105, N'Iguala', 12)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (106, N'Delicias', 7)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (107, N'Villa de Alvarez', 9)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (108, N'Ciudad Cuauhtemoc', 7)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (109, N'Navojoa', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (110, N'Guaymas', 26)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (111, N'Minatitlan', 30)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (112, N'Cuautitlan', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (113, N'Texcoco de Mora', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (114, N'Hidalgo del Parral', 7)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (115, N'Tepexpan', 15)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (116, N'Tulancingo de Bravo', 13)
GO
INSERT [dbo].[Ciudad] ([ID_CIUDAD], [NOM_CIUDAD], [ID_ESTADO]) VALUES (117, N'San Juan Bautista Tuxtepec', 20)
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO