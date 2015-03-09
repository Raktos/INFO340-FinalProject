--Constraints
--Annie Tao, Austin Woehrle, Jason Ho, Akash Puri
USE WORKOUT_FACEBOOK;

--Add a constraint that ensures that all users in the database were born more than 12 years ago
--This maintains a minimum age for users in our database
ALTER TABLE tblUSER
ADD CONSTRAINT minAge
CHECK ((DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, UserDOB)) > 12)

--This fails
INSERT INTO tblUSER(UserFName, UserLName, UserSex, UserDOB, UserEmail, UserPassHash, UserPassSalt)
VALUES('Akash', 'Puri', 1, '2007-02-02', 'akasd@adfaf.co', 23435, 345) 

--This works
INSERT INTO tblUSER(UserFName, UserLName, UserSex, UserDOB, UserEmail, UserPassHash, UserPassSalt)
VALUES('Akash', 'Puri', 1, '1997-02-02', 'akasd@adfaf.co', 23435, 345) 

SELECT * FROM tblUSER