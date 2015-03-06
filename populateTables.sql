/*
** Populates the tables with dummy data
** Jason Ho
** Akash Puri
** Austin Woehrle
** Annie Tao
*/

USE WORKOUT_FACEBOOK

--Create 15 dummy users and insert them into tblUSER
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

--Create a single user height and weight update for each existing user in the database
--Need to make sure that the UserID passed (1 - 15) works out*
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
