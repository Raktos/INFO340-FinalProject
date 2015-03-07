/*
** Workout Facebook database creation of the base tables
** Jason Ho
*/

CREATE DATABASE WORKOUT_FACEBOOK;

USE WORKOUT_FACEBOOK;

CREATE TABLE tblUSER(
	UserID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserFName varchar(60) NOT NULL,
	UserLName varchar(60) NOT NULL,
	UserSex int,
	UserDOB date NOT NULL,
	UserEmail varchar(60) NOT NULL,
	UserPassHash varchar(60) NOT NULL,
	UserPassSalt int NOT NULL,
);

CREATE TABLE tblUSER_HEIGHT_WEIGHT(
	UserHeightWeightID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	HWDate date NOT NULL,
	UserHeight decimal(5,2),
	UserWeight decimal(5,2)
);

CREATE TABLE tblMESSAGE(
	MessageID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	MessageRecipietUserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	MessageSenderUserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	MessageTimestamp timestamp NOT NULL,
	MessageContent varchar(250) NOT NULL
);

CREATE TABLE tblUSER_FRIEND(
	UserID1 int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	UserID2 int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	CONSTRAINT UserFriendPK PRIMARY KEY(UserID1, UserID2)
);

CREATE TABLE tblSLEEP(
	SleepID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	SleepStartTime datetime NOT NULL,
	SleepEndTime datetime NOT NULL,
	SleepComment varchar(250)
);

CREATE TABLE tblSLEEP_BAND_DATA(
	SleepBandDataID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SleepID int FOREIGN KEY REFERENCES tblSLEEP(SleepID) NOT NULL,
	SleepBandDataTime datetime NOT NULL,
	SleepMovementData int NOT NULL
);

CREATE TABLE tblGROUP(
	GroupID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	GroupName varchar(60) NOT NULL,
	GroupDesc varchar(250)
);

CREATE TABLE tblUSER_GROUPS(
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	GroupID int FOREIGN KEY REFERENCES tblGROUP(GroupID) NOT NULL,
	CONSTRAINT UserGroupPK PRIMARY KEY(UserID, GroupID)
);

CREATE TABLE tblMEAL(
	MealID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	MealDate datetime NOT NULL,
	MealComment varchar(250)
);

CREATE TABLE tblFOOD_GROUP(
	FoodGroupID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FoodGroupName varchar(60) NOT NULL,
	FoodGroupDesc varchar(250)
);

CREATE TABLE tblMEAL_ITEM(
	MealItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	MealID int FOREIGN KEY REFERENCES tblMEAL(MealID) NOT NULL,
	FoodGroupID int FOREIGN KEY REFERENCES tblFOOD_GROUP(FoodGroupID) NOT NULL,
	MealItemDesc varchar(250),
	MealItemCalories int
);

CREATE TABLE tblLOCATION(
	LocationID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	LocationName varchar(60) NOT NULL,
	LocationLat decimal(8,5) NOT NULL,
	LocationLong decimal(8,5) NOT NULL
);

CREATE TABLE tblWORKOUT_TYPE(
	WorkoutTypeID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	WorkoutTypeName varchar(60),
	WorkoutTypeDesc varchar(250),
	WorkoutBasePts int NOT NULL
);

CREATE TABLE tblWORKOUT(
	WorkoutID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	WorkoutTypeID int FOREIGN KEY REFERENCES tblWORKOUT_TYPE(WorkoutTypeID) NOT NULL,
	LocationID int FOREIGN KEY REFERENCES tblLOCATION(LocationID) NOT NULL,
	WorkoutStartTime datetime NOT NULL,
	WorkoutEndTime datetime NOT NULL,
	WorkoutComment varchar(250),
	WorkoutBandSteps int,
	WorkoutCaloriesBurned int
);

CREATE TABLE tblWORKOUT_BAND_DATA(
	WorkoutBandDataID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	WorkoutID int FOREIGN KEY REFERENCES tblWORKOUT(WorkoutID) NOT NULL,
	WorkoutHeartRate int
);

CREATE TABLE tblBADGES(
	BadgeID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	BadgeName varchar(60) NOT NULL,
	BadgeDesc varchar(250) NOT NULL
);

CREATE TABLE tblWORKOUT_TYPE_BADGES(
	BadgeID int FOREIGN KEY REFERENCES tblBADGES(BadgeID) NOT NULL,
	WorkoutTypeID int FOREIGN KEY REFERENCES tblWORKOUT_TYPE(WorkoutTypeID) NOT NULL,
	WorkoutPtsReq int NOT NULL,
	CONSTRAINT WorkoutTypeBadgesPK PRIMARY KEY(BadgeID, WorkoutTypeID)
);

CREATE TABLE tblPLANNED_ACTIVITY(
	ActivityID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UserID int FOREIGN KEY REFERENCES tblUSER(UserID) NOT NULL,
	LocationID int FOREIGN KEY REFERENCES tblLOCATION(LocationID),
	IsGroup bit NOT NULL,
	ActivityName varchar(60) NOT NULL,
	ActivityStartDate datetime NOT NULL,
	ActivityEndDate datetime NOT NULL,
	ActivityDesc varchar(250)
);

CREATE TABLE tblGROUP_WORKOUT_TYPE(
	GroupID int FOREIGN KEY REFERENCES tblGROUP(GroupID) NOT NULL,
	WorkoutTypeID int FOREIGN KEY REFERENCES tblWORKOUT_TYPE(WorkoutTypeID) NOT NULL,
	CONSTRAINT GroupWorkoutTypePK PRIMARY KEY(GroupID, WorkoutTypeID)
);

CREATE TABLE tblGROUP_ACTIVITY(
	GroupActivityID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ActivityID int FOREIGN KEY REFERENCES tblPLANNED_ACTIVITY(ActivityID) NOT NULL
);

CREATE TABLE tblGROUP_ACTIVITY_GROUP(
	GroupID int FOREIGN KEY REFERENCES tblGROUP(GroupID) NOT NULL,
	GroupActivityID int FOREIGN KEY REFERENCES tblGROUP_ACTIVITY(GroupActivityID) NOT NULL,
	CONSTRAINT GroupActivityGroupPK PRIMARY KEY(GroupID, GroupActivityID)
);