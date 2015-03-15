/*
** Creates Constraints
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK;

--Add a constraint that ensures that all users in the database were born more than 12 years ago
--This maintains a minimum age for users in our database
ALTER TABLE tblUSER
ADD CONSTRAINT minAge
CHECK (DATEDIFF(day, UserDOB, GETDATE()) > 3650)

--This fails
INSERT INTO tblUSER(UserFName, UserLName, UserSex, UserDOB, UserEmail, UserPassHash, UserPassSalt)
VALUES('Akash', 'Puri', 1, '2007-02-02', 'akasd@adfaf.co', 23435, 345) 

--This works
INSERT INTO tblUSER(UserFName, UserLName, UserSex, UserDOB, UserEmail, UserPassHash, UserPassSalt)
VALUES('Akash', 'Puri', 1, '1997-02-02', 'akasd@adfaf.co', 23435, 345) 


--Maintains that the workout end time is not before the workout start time 
ALTER TABLE tblWORKOUT
ADD CONSTRAINT workoutTimeCheck
CHECK (WorkoutStartTime < WorkoutEndTime)

--Fail
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) 
VALUES(1,6,6,'2014-12-02 12:53:44','2011-07-27 10:07:33','vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque',3764,405);


--Maintains that the planned activity end time is not before the planned activity  start time 
ALTER TABLE tblPLANNED_ACTIVITY
ADD CONSTRAINT activityTimeCheck
CHECK (ActivityStartDate < ActivityEndDate)

--Fail
INSERT INTO tblPLANNED_ACTIVITY([UserID],[LocationID],[IsGroup],[ActivityName],[ActivityStartDate],[ActivityEndDate]) 
VALUES(1900,600,0,'Etiam','2014-03-06 00:00:00','2010-03-06 00:00:00');


--Maintains that a sleep end time is not before the sleep start time 
ALTER TABLE tblSLEEP
ADD CONSTRAINT SleepTimeCheck
CHECK (SleepStartTime < SleepEndTime)

--Fail
INSERT INTO tblSLEEP([UserID],[SleepStartTime],[SleepEndTime]) 
VALUES(2,'2014-03-06 00:00:00','2011-03-06 08:00:00');
