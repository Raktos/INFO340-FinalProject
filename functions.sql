/*
** Creates User Defined Functions
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK;

--Average Sleep Movement for User across all sleeps hat have sleep movement data
--Takes an int UserID of the user to check
--Returns the average as a number
CREATE FUNCTION AverageSleepMovement(@UserID int)
RETURNS decimal

AS
BEGIN
	DECLARE @Ave decimal;
	SELECT @Ave = AVG(CONVERT(decimal(8,4), sbd.SleepMovementData))
	FROM tblSLEEP_BAND_DATA sbd
		JOIN tblSLEEP s
			ON s.SleepID = sbd.SleepID
		JOIN tblUSER u
			ON u.UserID = s.UserID
	WHERE u.UserID = @UserID
	GROUP BY u.UserID;

	IF @Ave is NULL
		SET @Ave = 0; 

	RETURN @Ave;
END
GO

--Tests on user with ID 1780
SELECT dbo.AverageSleepMovement(1780);



--Average Calories per Meal for User across all meals for that user
--Takes an int UserID of the user to check
--Returns the average as a number
CREATE FUNCTION AverageCaloriesPerMeal(@UserID int)
RETURNS decimal

AS
BEGIN
	DECLARE @Ave decimal;
	SELECT @Ave = AVG(Meals)
	FROM(
		SELECT SUM(mi.MealItemCalories) AS Meals
		FROM tblMEAL m
			JOIN tblMEAL_ITEM mi
				ON mi.MealID = m.MealID
			JOIN tblUSER u
				ON u.UserID = m.UserID
		WHERE u.UserID = @UserID
		GROUP BY m.MealID
	)Meals

	IF @Ave is NULL
		SET @Ave = 0; 

	RETURN @Ave;
END
GO

--Tests on user 1511
SELECT dbo.AverageCaloriesPerMeal(1511);



--Net change in weight for a user, from initial weight to most current weight
--Takes an int UserID of the user to check
--Returns the difference as a number
CREATE FUNCTION UserWeightNetChange(@UserID int) 
RETURNS decimal
AS
BEGIN	
	DECLARE @FirstWeight decimal
	DECLARE @LastWeight decimal
	DECLARE @WeightChange decimal

	SELECT TOP 1 @FirstWeight = uhw.UserWeight
	FROM tblUSER_HEIGHT_WEIGHT uhw
	WHERE uhw.UserID = @UserID
	ORDER BY uhw.HWDate ASC;

	SELECT TOP 1 @LastWeight = uhw.UserWeight
	FROM tblUSER_HEIGHT_WEIGHT uhw
	WHERE uhw.UserID = @UserID
	ORDER BY uhw.HWDate DESC;

	SET @WeightChange = @LastWeight - @FirstWeight;

	RETURN @WeightChange;
END;
GO

--Tests on User 1780
SELECT dbo.UserWeightNetChange(1780);



--Most popular workout location for a given day
--Takes a date as the date to check
--returns the name of the most popular location
CREATE FUNCTION PopularWorkoutLocation(@Date date) 
RETURNS varchar(60)
AS
BEGIN	
	DECLARE @LocationName varchar(60)

	SELECT TOP 1 @LocationName = l.LocationName
	FROM tblWORKOUT w
		JOIN tblLOCATION l
			ON w.LocationID = l.LocationID
	WHERE CAST(WorkoutStartTime AS date) = @Date
	GROUP BY w.LocationID, l.LocationName
	ORDER BY COUNT(w.LocationID) DESC

	RETURN @LocationName;
END;
GO

--Tests on 11-10-2013
SELECT dbo.PopularWorkoutLocation('2013-11-10');