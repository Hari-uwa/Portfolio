DROP TABLE IF EXISTS Dim_Time
GO

Create table Dim_Time 
(
date_ date,
month_ varchar(50),
year_ int,
dayID int PRIMARY KEY IDENTITY(1,1)
)
Go

BULK INSERT Dim_Time  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Dimensions\dim_time.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

------Dim_Time------

DROP TABLE IF EXISTS Dim_Location
GO

Create table Dim_Location
(
country varchar(50),
iso_code varchar(50),
continent varchar(50),
population_ float,
life_expectancy float,
locationID int PRIMARY KEY IDENTITY(1,1),
size varchar(50)

)
Go

BULK INSERT Dim_Location  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Dimensions\dim_location.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

-------------- Dim_Location -----------------

DROP TABLE IF EXISTS Dim_Case
GO

Create table Dim_Case
(
case_name varchar(50),
caseID int PRIMARY KEY IDENTITY(1,1)
)
Go

BULK INSERT Dim_Case  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Dimensions\dim_cases.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

-----------------Dim_Case------------------
-----------------Dim_Case------------------


-----------------Fact tables-------------------


DROP TABLE IF EXISTS Fact_Covid_effect
GO

Create table Fact_Covid_effect
(
locationID int,
dayID int,
caseID int,
people int
)
Go

---ADD CONSTRAINTS
AlTER TABLE Fact_Covid_effect ADD CONSTRAINT
FK_locationID FOREIGN KEY (locationID)REFERENCES Dim_Location(locationID);
AlTER TABLE Fact_Covid_effect ADD CONSTRAINT
FK_timeID FOREIGN KEY (dayID)REFERENCES Dim_Time(dayID);
AlTER TABLE Fact_Covid_effect ADD CONSTRAINT
FK_caseID FOREIGN KEY (caseID)REFERENCES Dim_Case(caseID);
Go


BULK INSERT Fact_Covid_effect  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Fact tables\fact_confirmed2.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY
    TABLOCK
);

BULK INSERT Fact_Covid_effect  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Fact tables\fact_recovered2.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

BULK INSERT Fact_Covid_effect  FROM 'C:\UNIVERSITY\Year 2\Sem 1\CITS3401\project1.0\Data\Fact tables\fact_deaths2.csv'  ---bulk insert CSV data
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);



----------------------------FACT TABLE-------------------------------
