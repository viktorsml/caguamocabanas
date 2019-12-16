SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE MakeReservation
	-- Add the parameters for the stored procedure here
	@username VARCHAR(50),
	@checkIn VARCHAR(50),
	@checkOut VARCHAR(50),
	@people INT,
	@cabinType INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Reservations] (
		userId,
		checkIn,
		checkOut,
		people,
		cabinType
	) VALUES (
		(SELECT userId FROM Users WHERE username = @username),
		@checkIn,
		@checkOut,
		@people,
		@cabinType
	)
	
	
	
END
GO
