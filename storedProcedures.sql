/*
** Stored Procedures creation
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK;

--Create Stored Procedure to Insert an existing users height and weight into tblUSER_HEIGHT_WEIGHT
--In Progress
 GO
 CREATE PROCEDURE uspUpdateUserHeightWeight
	@UserID int NOT NULL
	@Date date NOT NULL
	@Height decimal(5,2)
	@Weight decimal(5,2)
AS
INSERT INTO tblUSER_HEIGHT_WEIGHT(UserID, HWDate, UserHeight, UserWeight)
VALUES(@UserID, @Date, @Height, @Weight
GO