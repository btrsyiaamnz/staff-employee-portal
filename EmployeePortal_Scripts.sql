-- DATABASE FOR EMPLOYEE PORTAL --

DROP DATABASE IF EXISTS EmployeeP;
CREATE DATABASE EmployeeP;
USE EmployeeP;

SET
	NAMES utf8;
-- Employee table --
CREATE TABLE IF NOT EXISTS EmployeeDetails(
empID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
IC VARCHAR(20),
ExpiryDate datetime,
PassportPhotocopy VARCHAR(50),
DOB datetime,
Nationality VARCHAR(20) NOT NULL,
Status VARCHAR(10) NOT NULL,
MobileNo INT NOT NULL,
HouseNo INT NOT NULL,
EmailAddress VARCHAR(60) NOT NULL,
Address1 VARCHAR(50) NOT NULL,
Address2 VARCHAR(50) NOT NULL,
City1 VARCHAR(20) NOT NULL,
State1 VARCHAR(20) NOT NULL,
Postcode1 INT NOT NULL,
Country1 VARCHAR(10) NOT NULL,
AddressCurrent1 VARCHAR(50) NOT NULL,
AddressCurrent2 VARCHAR(50) NOT NULL,
City2 VARCHAR(20) NOT NULL,
State2 VARCHAR(20) NOT NULL,
Postcode2 INT NOT NULL,
Country2 VARCHAR(10) NOT NULL,
PRIMARY KEY(empID)
);

-- EmergencyContact table --
CREATE TABLE IF NOT EXISTS EmergencyContact(
emID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
emName VARCHAR(50) NOT NULL,
emRelay VARCHAR(15) NOT NULL,
emContact INT NOT NULL,
CONSTRAINT FK_EmergencyContact_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (emID)
);

-- Spouse table --
CREATE TABLE IF NOT EXISTS Spouse(
spID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
spOccupation VARCHAR(10) NOT NULL,
spContact INT NOT NULL,
spCertificate VARCHAR(50) NOT NULL,
spChild INT NOT NULL,
CONSTRAINT FK_Spouse_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (spID)
);

-- ChildrenInfo table --
CREATE TABLE IF NOT EXISTS ChildrenInfo(
chID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
chName VARCHAR(50) NOT NULL, 
chDOB datetime,
chCertificate VARCHAR(30) NOT NULL,
chNationality VARCHAR(30) NOT NULL,
chStudy VARCHAR(15) NOT NULL, 
CONSTRAINT FK_ChildrenInfo_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (chID)
);

--  Education table --
CREATE TABLE IF NOT EXISTS Education(
edID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
edName VARCHAR(30) NOT NULL,
edYear datetime,
edCertificate VARCHAR(15) NOT NULL, 
edCertCopy VARCHAR(15) NOT NULL, 
CONSTRAINT FK_Education_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (edID)
);

-- Skills table --
CREATE TABLE IF NOT EXISTS Skills(
skID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
skLevel INT,
skYears INT(2) NOT NULL,
CONSTRAINT FK_Skills_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (skID)
);

-- RequestStatus table --
CREATE TABLE IF NOT EXISTS RequestStatus(
reID INT NOT NULL AUTO_INCREMENT,
employeeID INT,
reSubject VARCHAR(100) NOT NULL,
reStatus VARCHAR(10) NOT NULL,
CONSTRAINT FK_RequestStatus_employeeID FOREIGN KEY (employeeID) REFERENCES EmployeeDetails(empID),
PRIMARY KEY (reID)
);

-- ************************** -- 
--     DUMMY DATA SCRIPTS     --
-- ************************** --

-- EmployeeDetails --
INSERT INTO
EmployeeDetails(
Name,
IC,
ExpiryDate,
PassportPhotocopy,
DOB,
Nationality,
Status,
MobileNo,
HouseNo,
EmailAddress,
Address1,
Address2,
City1,
State1,
Postcode1,
Country1,
AddressCurrent1,
AddressCurrent2,
City2,
State2,
Postcode2,
Country2
)
SELECT
	'Employee 1',
    '670417035256',
    '20250101',
    'Example 1',
    '19670202',
    'Malaysia',
    'Married',
    '0123456789',
    '1234',
    'employee1@sicmsb.com',
    'Residenci Example',
    'Jalan Bukit Jalil',
    'Kuala Lumpur',
    'Kualu Lumpur',
    '58200',
    'Malaysia',
    'Residenci Example',
    'Jalan Bukit Jalil',
    'Kuala Lumpur',
    'Kualu Lumpur',
    '58200',
    'Malaysia'
FROM
  DUAL
WHERE
  not EXISTS (
    SELECT
      EmailAddress
    FROM
      EmployeeDetails
    WHERE 
      EmailAddress = 'employee1@sicmsb.com'
  );
    
-- EmergencyContact --
INSERT INTO
EmergencyContact(
employeeID, emName, emRelay, emContact)
SELECT
'1',
'Spouse 1',
'Wife',
'0123456788'

-- Spouse --
INSERT INTO	
Spouse(
employeeID, spOccupation, spContact, spCertificate, spChild)
SELECT
'1',
'Teacher',
'013245679',
'Degree',
'3'

-- ChildrenInfo --
INSERT INTO
ChildrenInfo(
employeeID, chName, chDOB, chCertificate, chNationality, chStudy)
SELECT
'1', 
'Children 1',
'20000202',
'Sijil Lahir',
'Malaysian',
'ALevel'

-- Education --
INSERT INTO
Education(
employeeID, 
edName,
edYear,
edCertificate,
edCertCopy)
SELECT
'1',
'Universiti Teknologi Petronas',
'20120808',
'Bachelor ',
'Degree'

-- Skills --
INSERT INTO
Skills(
employeeID, skLevel, skYears)
SELECT
'1',
'2',
'3'

-- RequestStatus --
INSERT INTO
RequestStatus(
employeeID, reSubject, reStatus)
SELECT
'1',
'Personal Details change',
'Approved'


