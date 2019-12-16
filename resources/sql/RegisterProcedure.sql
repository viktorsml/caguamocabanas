SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Samuel
-- Create date: 15-12-2019
-- Description:	Register users
-- =============================================
CREATE PROCEDURE Register 
	@username VARCHAR(50),
	@password VARCHAR(64),
	@type INT,
	@name VARCHAR(50),
	@lastName VARCHAR(50),
	@phone VARCHAR(50),
	@rfc VARCHAR(50),
	@sex INT,
	@age INT,
	@address VARCHAR(70)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO Users
	( username, password, type, name, lastName, phone, rfc, sex, age, address)
	VALUES
	(@username, @password, @type, @name, @lastName, @phone, @rfc, @sex, @age, @address)
	
END
GO
