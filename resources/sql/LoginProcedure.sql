USE [cabins]
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/15/2019 13:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Samuel
-- Create date: 15-12-2019
-- Description:	A simple procedure for obtaining the userId when login.
-- =============================================
ALTER PROCEDURE [dbo].[Login] 
	@username VARCHAR(50),
	@password VARCHAR(64),
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT  userId FROM Users WHERE username=@username AND password=@password)
		SET @return = 1
	ELSE
		SET @return = 0
	END
END
