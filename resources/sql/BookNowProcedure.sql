USE [cabins]
GO
/****** Object:  StoredProcedure [dbo].[BookNow]    Script Date: 12/16/2019 04:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BookNow] 
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
	INSERT INTO Reservations (
		userId,
		checkIn,
		checkOut,
		people,
		cabinType,
		reservationStatus,
		asignatedCabin
	) VALUES (
		(SELECT userId FROM Users WHERE username = @username),
		@checkIn,
		@checkOut,
		@people,
		@cabinType,
		0,
		0
	)

END
