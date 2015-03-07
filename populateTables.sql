/*
** Populates the tables with dummy data
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK

--Create 15 dummy users and insert them into tblUSER
--EXECUTED
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Yetta','Flynn',0,'10/21/93','Nunc.pulvinar.arcu@turpisnecmauris.ca','AHF38QND4ER',636);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Vernon','Chandler',0,'07/30/92','Aliquam@Quisqueac.co.uk','QGX07TAI3OK',288);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Ruby','Calderon',1,'04/17/92','massa.Integer.vitae@in.com','QPD67HIW4GB',471);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Aladdin','Avery',1,'04/19/90','nonummy.ultricies.ornare@lobortismaurisSuspendisse.net','SRO02VSU1TW',531);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Nomlanga','Kirkland',0,'12/29/91','ipsum@turpisIncondimentum.edu','LMG87TJT7GT',959);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Dora','Graham',0,'05/21/92','neque.Nullam@pellentesque.com','UHJ25HFD9SA',154);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Leo','Mosley',1,'12/05/93','non.vestibulum.nec@enimdiam.edu','WHL99STR9OK',769);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Alice','Graham',1,'09/22/92','dignissim@tacitisociosquad.org','TYF87AFF7RM',743);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Berk','Barrett',0,'05/22/93','turpis.In@dapibus.co.uk','PUJ44SOU2LP',457);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Arsenio','Diaz',0,'09/23/92','enim@cursuset.ca','YNI11SYS7BQ',554);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Althea','Barber',0,'05/13/93','a.purus.Duis@penatibusetmagnis.com','TFA10LBL5US',496);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Dakota','Montoya',1,'12/25/90','mattis.Integer@luctussitamet.net','INB01LIU2WP',235);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Octavia','Mitchell',1,'04/29/94','adipiscing.elit.Etiam@nisiAenean.edu','SRE42OMZ3TT',257);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Sopoline','Richmond',1,'04/22/94','Donec.non@musAenean.org','RLT62UPU8YJ',195);
INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('Bruce','Davenport',1,'01/15/91','adipiscing@maurisMorbi.edu','ZFL60QSX8OP',801);

--Create a single user height and weight update for each existing user in the database and inserts them into tblUSER_HEIGHT_WEIGHT
--EXECUTED
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(1,'07/04/14',129.22,167.22);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(2,'06/01/14',124.56,124.65);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(3,'10/28/14',100.28,154.46);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(4,'04/11/14',111.65,138.76);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(5,'05/07/14',107.88,179.12);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(6,'06/02/14',146.23,197.65);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(7,'08/29/14',106.56,121.23);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(8,'05/10/14',122.61,193.55);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(9,'07/03/14',131.65,151.78);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(10,'08/02/14',126.12,145.65);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(11,'08/29/14',143.65,166.65);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(12,'06/21/14',115.33,129.23);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(13,'03/26/14',105.78,173.53);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(14,'12/16/14',120.12,184.87);
INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(15,'12/10/14',116.65,182.23);

--Creates messages sent by users with the current time used as a timpestamp and inserts them into tblMessage
--EXECUTED
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(1,15, 'netus et malesuada fames ac turpis egestas. Fusce aliquet magna');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(2,14, 'vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(3,13, 'vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(4,12, 'malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(5,11, 'ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(6,10, 'porta elit, a feugiat tellus lorem eu metus. In lorem.');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(7,9, 'amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(8,7, 'et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(9,7, 'posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(10,6, 'congue a, aliquet vel, vulputate eu, odio. Phasellus at augue');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(11,5, 'nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(12,4, 'nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(13,3, 'dui lectus rutrum urna, nec luctus felis purus ac tellus.');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(14,2, 'Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet');
INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(15,1, 'nulla. Donec non justo. Proin non massa non ante bibendum');

--Creates friendship relationship and inserts them into tblUSER_FRIEND
--EXECUTED
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(11,12);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(7,8);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(7,12);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(5,8);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(3,15);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(12,10);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(11,7);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(5,12);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(8,9);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(13,15);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(3,7);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(13,15);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(10,13);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(10,1);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(10,2);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(12,9);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(4,15);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(10,7);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(15,2);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(8,9);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(15,6);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(2,15);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(7,9);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(9,6);
INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(8,3);

--Creates a workout event for different users and inserts them into tblWORKOUT
--EXECUTED
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(1,6,12,'2014-12-02 12:53:44','2015-07-27 10:07:33','vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque',3764,405);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(2,13,5,'2015-03-12 22:26:56','2015-06-19 20:08:25','Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada',4315,496);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(3,5,1,'2014-12-18 09:01:24','2014-07-14 08:52:32','congue a, aliquet vel, vulputate eu, odio. Phasellus at augue',4516,239);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(4,14,14,'2015-09-26 09:00:52','2015-10-30 03:26:24','feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam',4220,286);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(5,5,5,'2015-08-07 15:37:31','2014-06-13 21:51:33','Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.',3536,375);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(6,11,12,'2014-08-20 12:04:40','2014-05-08 05:29:31','est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia',4390,257);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(7,11,14,'2014-12-17 07:11:55','2016-01-15 22:43:15','ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris',4871,440);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(8,4,11,'2015-10-03 12:38:23','2015-06-30 12:13:45','ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra',3653,276);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(9,12,2,'2015-12-05 07:38:39','2015-01-07 14:45:02','diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est',4347,381);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(10,13,5,'2015-07-07 19:20:12','2015-12-27 22:19:21','ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,',4970,289);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(11,11,4,'2014-10-31 06:57:28','2015-06-25 07:48:26','dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer',3474,465);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(12,4,15,'2015-09-29 11:09:23','2014-03-08 18:59:06','Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,',4132,369);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(13,7,1,'2015-10-05 03:07:24','2016-01-04 06:20:58','Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean',3548,389);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(14,1,2,'2014-05-16 05:41:19','2014-11-20 09:20:28','lorem ipsum sodales purus, in molestie tortor nibh sit amet',4021,351);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(15,11,9,'2015-06-16 04:05:08','2015-02-11 21:35:12','amet ante. Vivamus non lorem vitae odio sagittis semper. Nam',4321,378);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(16,5,10,'2014-09-11 14:02:32','2015-04-20 16:39:19','viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis,',3141,359);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(17,9,11,'2014-07-28 12:02:15','2014-12-01 03:07:36','gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.',3131,223);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(18,14,5,'2014-09-15 08:28:51','2014-06-21 19:37:24','lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet',4813,486);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(19,8,4,'2014-11-25 05:55:36','2014-08-03 18:15:44','enim non nisi. Aenean eget metus. In nec orci. Donec',4841,445);
INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(20,9,14,'2014-07-05 03:48:24','2015-12-25 02:55:59','adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis',3762,412);

--Creates workout band data and inserts it into tblWORKOUT_BAND_DATA
--EXECUTED
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(15,112);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(15,109);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(1,101);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(3,126);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(4,105);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(10,125);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(16,104);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(5,110);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(10,120);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(14,112);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(14,125);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(11,130);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(4,109);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(20,121);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(2,121);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(11,128);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(14,125);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(8,130);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(5,110);
INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutHeartRate]) VALUES(20,120);

--Inserts different workout types and their description into tblWORKOUT_TYPE
--EXECUTED
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Soccer','Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut',42);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Tennis','urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat',34);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Running','et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus',83);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Boating','Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,',26);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Basketball','vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.',22);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Football','sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit',74);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Swimming','congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum',75);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Frisbee','erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat',97);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Volleyball','nibh enim, gravida sit amet, dapibus id, blandit at, nisi.',63);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Badmitton','eros non enim commodo hendrerit. Donec porttitor tellus non magna.',99);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Softball','Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla.',47);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Baseball','sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue',28);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Shotput','Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.',68);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Jogging','consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam',76);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Rugby','nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat',98);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Archery','Donec vitae erat vel pede blandit congue. In scelerisque scelerisque',27);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('WaterPolo','Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.',33);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Fishing','cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet',48);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('HighJump','ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac',36);
INSERT INTO tblWORKOUT_TYPE([WorkoutTypeID],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('Bowling','montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque',60);

--Inserts the associative entities between workout types and badges
--EXECUTED
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(179);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(129);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(198);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(184);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(185);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(178);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(161);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(176);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(170);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(105);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(123);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(138);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(186);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(107);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(125);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(112);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(188);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(138);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(137);
INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutPtsReq]) VALUES(116);

--Inserts badges into tblBadges
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Active','erat semper rutrum. Fusce dolor quam, elementum at, egestas a,');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Hot Shooter','sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero');
INSERT INTO tblBadges([BadgeName],[BadgeDesc]) VALUES('Speedy','Sed et libero. Proin mi. Aliquam gravida mauris ut mi.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Endurance Badge','penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Cant stop, Wont stop','vitae erat vel pede blandit congue. In scelerisque scelerisque dui.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Gainz','ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Swole,','justo eu arcu. Morbi sit amet massa. Quisque porttitor eros');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Frat Star','libero lacus, varius et, euismod et, commodo at, libero. Morbi');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Runner','erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Baller','elit erat vitae risus. Duis a mi fringilla mi lacinia');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('All-Star','sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Active Streak','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Grind Mode','parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Greatness','Maecenas libero est, congue a, aliquet vel, vulputate eu, odio.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Pledge','primis in faucibus orci luctus et ultrices posuere cubilia Curae;');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Marathon Runner','mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Fit','magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna.');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Pro Athlete','Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a,');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Amatuer','pede sagittis augue, eu tempor erat neque non quam. Pellentesque');
INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('Rookie','mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla,');
