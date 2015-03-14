/*
** View creation
** Jason Ho
*/
USE WORKOUT_FACEBOOK;

--Display the top 100 badges sorted by the most total points required to earn each badge
--In this regard, the badges are ordered by difficulty with the harder badges requiring more points
--DROP VIEW vwDifficultBadges
CREATE VIEW vwDifficultBadges
AS
SELECT TOP 100 b.BadgeName, b.BadgeDesc, SUM(wtb.WorkoutPtsReq) AS PointsRequired
FROM tblWORKOUT_TYPE_BADGES wtb
	JOIN tblBADGES b
		ON b.BadgeID = wtb.BadgeID
GROUP BY b.BadgeID, b.BadgeName, b.BadgeDesc
ORDER BY PointsRequired DESC
GO
SELECT * FROM vwDifficultBadges

--Display all activities that have occured already today
--DROP VIEW vwTodaysActivities
CREATE VIEW vwTodaysActivities
AS
SELECT pa.ActivityID, u.UserFName, u.UserLName, l.LocationName,
	   pa.ActivityDesc, pa.ActivityStartDate
FROM tblPLANNED_ACTIVITY pa
	JOIN tblLOCATION l
		ON l.LocationID = pa.LocationID
	JOIN tblUSER u 
		ON u.UserID = pa.UserID
WHERE (DATEPART(year, GETDATE()) = DATEPART(year, pa.ActivityStartDate))
AND (DATEPART(month, GETDATE()) = DATEPART(month, pa.ActivityStartDate))
AND (DATEPART(day, GETDATE()) = DATEPART(day, pa.ActivityStartDate))
GO
SELECT * FROM vwTodaysActivities

--Displays the highest calorie meals currently in the database
CREATE VIEW vwHighestCalorieMeals
AS
SELECT u.UserFName, u.UserLName, m.MealID, SUM(mi.MealItemCalories) AS Calories
FROM tblMEAL m
	JOIN tblMEAL_ITEM mi
		ON mi.MealID = m.MealID
	JOIN tblUSER u
		ON u.UserID = m.UserID
GROUP BY m.MealID, u.UserFName, u.UserLName
ORDER BY Calories DESC
GO

SELECT * FROM vwHighestCalorieMeals

--Displays 