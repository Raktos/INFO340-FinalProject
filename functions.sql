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
	SELECT @Ave = AVG(CAST(sbd.SleepMovementData AS decimal))
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