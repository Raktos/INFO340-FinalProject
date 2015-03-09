/*
** View creation
** Jason Ho
*/
USE WORKOUT_FACEBOOK;

--Display all badges for a given User id
--DROP VIEW vwDifficultBadges
CREATE VIEW vwDifficultBadges
AS
SELECT TOP 100 b.BadgeName, SUM(wtb.WorkoutPtsReq) AS PointsRequired
FROM tblWORKOUT_TYPE_BADGES wtb
	JOIN tblBADGES b
		ON b.BadgeID = wtb.BadgeID
GROUP BY b.BadgeName
ORDER BY PointsRequired DESC
GO

--Display all activities that have occured already today
--DROP VIEW vwTodaysActivities
CREATE VIEW vwTodaysActivities
AS
SELECT w.WorkoutID, u.UserFName, u.UserLName, l.LocationName, wt.WorkoutTypeName, 
	   w.WorkoutComment, w.WorkoutCaloriesBurned, w.WorkoutBandSteps
FROM tblWORKOUT w
	JOIN tblLOCATION l
		ON l.LocationID = w.LocationID
	JOIN tblUSER u 
		ON u.UserID = w.UserID
	JOIN tblWORKOUT_TYPE wt
		ON wt.WorkoutTypeID = w.WorkoutTypeID
WHERE (DATEPART(year, GETDATE()) = DATEPART(year, w.WorkoutStartTime))
AND (DATEPART(month, GETDATE()) = DATEPART(month, w.WorkoutStartTime))
AND (DATEPART(day, GETDATE()) = DATEPART(day, w.WorkoutStartTime))
GO
SELECT * FROM vwTodaysActivities

