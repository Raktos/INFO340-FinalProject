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
	@UserID int,
	@Date date,
	@Height decimal(5,2),
	@Weight decimal(5,2)
AS
INSERT INTO tblUSER_HEIGHT_WEIGHT(UserID, HWDate, UserHeight, UserWeight)
VALUES(@UserID, @Date, @Height, @Weight
GO

--New User with initial Height Weight
CREATE PROCEDURE uspInsertUser(
	@FName varchar(60),
	@LName varchar(60),
	@Sex bit,
	@DOB date,
	@Email varchar(60),
	@PassHash varchar(60),
	@PassSalt int,
	@Height decimal(5,2),
	@Weight decimal(5,2)
)
AS
DECLARE @ID int;
BEGIN TRAN UserInsert;
INSERT INTO tblUSER(
	[UserFName],
	[UserLName],
	[UserSex],
	[UserDOB],
	[UserEmail],
	[UserPassHash],
	[UserPassSalt]
)VALUES(
	@Fname,
	@LName,
	@Sex,
	@DOB,
	@Email,
	@PassHash,
	@PassSalt
);
SELECT @ID = SCOPE_IDENTITY();
INSERT INTO tblUSER_HEIGHT_WEIGHT(
	[UserID],
	[HWDate],
	[UserHeight],
	[UserWeight]
)VALUES(
	@ID,
	GETDATE(),
	@Height,
	@Weight
);
COMMIT TRAN UserInsert;
GO

EXEC dbo.uspInsertUser 'John','Holt',0,'3-15-1987','email@email.com','878954',100,150.54,66.57;
SELECT * FROM tblUSER;