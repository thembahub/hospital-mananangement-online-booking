# DB VERSION CREATED FOR TRACKING THE SCHEMA CHANGES

CREATE TABLE `db_version` (  
  `version` VARCHAR(10) NOT NULL
);


INSERT INTO `db_version` (`version`) VALUES ('1.0.1'); 




# "prescription" table column "duration" updated nullable & default is NULL
ALTER TABLE `prescription` CHANGE `duration` `duration` INT(11) DEFAULT NULL NULL; 

# Migrate previous values from 0 to NULL
update `prescription` set `duration` = NULL where `duration` = 0;


# DEFAULTS TABLE ADDED...

CREATE TABLE Patient(  

  patient_id INT PRIMARY KEY, 
  lastname VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  symptoms VARCHAR(50) NOT NULL,
  appointmentdate DATE
)


CREATE TABLE appointment(  
   
  appointmentdate DATE,
  duration VARCHAR(100) NOT NULL,
  app_reason VARCHAR(100) NOT NULL,
  doctor_id INT FOREIGN KEY
)



CREATE TABLE doctor(  

  doctor_id INT PRIMARY KEY, 
  name VARCHAR(100) NOT NULL,
  emailaddress VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  
)


CREATE TABLE hospitals(  

  hospital_code INT PRIMARY KEY, 
  hospital_name VARCHAR(100) NOT NULL,
  emailaddress VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  appointmentdate DATE
)

CREATE TABLE Patient(  

  patient_id INT(13) PRIMARY KEY , 
  lastname VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  symptoms VARCHAR(50) NOT NULL,
  appointmentdate DATE
)
CREATE TABLE doctor(  

  doctor_id INT PRIMARY KEY, 
  name VARCHAR(100) NOT NULL,
  emailaddress VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  
)
CREATE TABLE hospitals(  

  hospital_code INT PRIMARY KEY, 
  hospital_name VARCHAR(100) NOT NULL,
  emailaddress VARCHAR(100) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  appointmentdate DATE
  
  CREATE TABLE appointment(  
   
  appointmentdate DATE,
  duration VARCHAR(100) NOT NULL,
  app_reason VARCHAR(100) NOT NULL,
  

)



# DATA FOR DEFAULTS TABLE COPIED FROM UC ACTIVITY EXCEL Defaults Table TAB
Insert into Patient  values (9303065893082,'shabangu','themba','55 ext 28 vosloorus ','0848973011','flue ,headack ,cougth','2021/02/12');
Insert into hospitals values (1475,'thelemokgorane','thelehospicegmail.com','011 456 7878',' 567 ext 14 vosloorus','2021/02/12');
Insert into doctor values (1475333242,'thelemokgorane','compscie@gmail.com','083 346 6789 309');
Insert into appointment values ('2021/02/12','50 munites', 'check up');
Insert into defaults values ('SPO2','Oxygen Saturation','Measure of how much oxygen your blood is carrying as a % of the maximum it could carry.','Numeric','%','0','100','');
Insert into defaults values ('WT','Weight','','Numeric','Kg','0.1','300','');
Insert into defaults values ('HR','Pulse','Heart Rate','Numeric','','30','300','');
Insert into defaults values ('TEMP','Temperature','','Numeric','F','90','120','');
Insert into defaults values ('RR','Respiratory Rate','','Numeric','','2','200','');
Insert into defaults values ('RBS','Blood Sugar','','Numeric','','30','800','');
Insert into defaults values ('HB','Hb','Haemoglobin','Numeric','','1','20','');
Insert into defaults values ('HBAIC','HbA1c','Glycated Haemoglobin: measures average sugar levels(glycation of the haemoglobin molecule) over a three month average','Numeric','','3','10','');
Insert into defaults values ('SYMPTOMSALERT','Mandatory Symptoms for Prescription','Medicine prescription is not permitted without Symptoms or Clinical Notes or Diagnosis being mentioned','Text','','','','');
Insert into defaults values ('SIGNOFFALERT','Mandatory Doctor sign off for Prescription','Medicine prescription is not permitted without Doctor sign off. Please ensure treating Doctor signs off this consultation','Text','','','','');
Insert into defaults values ('RANGEALERT','Outside of Range','Out of Range','Text','','','','');

ALTER TABLE `patient_visit` ADD COLUMN `spo2` INT(3) NULL AFTER `dbp`;


update `db_version` set `version` = '1.0.1';