/*
** Stored Procedures creation
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK;

--Create Stored Procedure to Insert an existing users height and weight into tblUSER_HEIGHT_WEIGHT
CREATE PROCEDURE uspUpdateUserHeightWeight
	@UserID int,
	@Height decimal(5,2),
	@Weight decimal(5,2)
AS
INSERT INTO tblUSER_HEIGHT_WEIGHT(UserID, HWDate, UserHeight, UserWeight)
VALUES(@UserID, GETDATE(), @Height, @Weight)
GO

EXEC dbo.uspUpdateUserHeightWeight 1750, 72, 350;

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


--Stored Procedure: update user activity 
CREATE PROCEDURE activityUpdate
	@ActivityID int,
	@UserID int,
	@LocationID int,
	@ActivityName varchar(60),
	@ActivityStartDate datetime,
	@ActivityEndDate datetime,
	@ActivityDesc varchar(250)
AS
BEGIN TRAN updateActivity;
UPDATE tblPLANNED_ACTIVITY
	SET UserID = @UserID, 
	LocationID = @LocationID,
	ActivityName = @ActivityName,
	ActivityStartDate = @ActivityStartDate,
	ActivityEndDate = @ActivityEndDate,
	ActivityDesc = @ActivityDesc
WHERE ActivityID = @ActivityID

COMMIT TRAN updateActivity;
GO

DROP PROCEDURE dbo.activityUpdate

EXEC dbo.activityUpdate 5003,1900,600,'UPDATED','2013-03-06 11:11:11.000','2014-03-06 11:11:11.000','UPDATED DESCRIPTION';

--Create Stored Procedure to Insert new Group Activity
