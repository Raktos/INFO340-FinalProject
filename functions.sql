/*
** User-Defined Function creation
** Jason Ho
*/

USE WORKOUT_FACEBOOK;

--Average Sleep Movement for User
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

SELECT dbo.AverageSleepMovement(1780);

--Average Calories per Meal for User
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

SELECT dbo.AverageCaloriesPerMeal(1511);



--Net change in weight for a user

Use WORKOUT_FACEBOOK;
SELECT *
FROM tblUSER_HEIGHT_WEIGHT uhw
WHERE UserID = 1780
ORDER BY uhw.HWDate ASC;


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

DROP FUNCTION dbo.UserWeightNetChange;

SELECT dbo.UserWeightNetChange(1780);



--Function: Most popular workout location for a given day (IN PROGRESS)
SELECT *
FROM tblLOCATION l;

SELECT * 
FROM tblWORKOUT w
WHERE CAST(WorkoutStartTime AS date) = '2014-11-10';

CREATE FUNCTION PopularWorkoutLocation(@Date date) 
RETURNS varchar
AS
BEGIN	
	DECLARE @Location varchar

END;
GO
