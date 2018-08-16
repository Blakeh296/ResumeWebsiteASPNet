use [master]
GO
-- Check to see if the DB is already installed
-- if so DROP DB
IF EXISTS (SELECT * FROM Sys.databases WHERE Name = 'LoginDB') DROP DATABASE LoginDB

	PRINT '[LoginDB] DROPPED'	-- Display Occurance

CREATE DATABASE [LoginDB]	-- Create database
GO

	PRINT '[LoginDB] CREATED'	-- Display that DB was created

USE LoginDB		-- Ready the DB for use
GO

CREATE TABLE Users		-- Add a table with 2 columns, user name and password. to store login information
	(UserID INT IDENTITY NOT NULL,
	UserName VARCHAR(30) NOT NULL,
	Password VARCHAR(MAX) NOT NULL,
	PRIMARY KEY (UserID))		-- Make user ID primary key
	GO

CREATE TABLE Contacts
	(ContactID int IDENTITY NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	CompanyName VARCHAR(75) NULL,
	MiddleInit VARCHAR(50) NULL,
	AddressLine1 VARCHAR(75)NULL,
	AddressLine2 VARCHAR(75) NULL,
	City VARCHAR(50) NULL,
	[State] VARCHAR(50) NULL,
	PostalCode VARCHAR(10) NULL,
	Email VARCHAR(60) NULL,
	PRIMARY KEY (ContactID))
	GO

	PRINT '[Users] TABLE CREATED'	-- Display occurance
	GO

		INSERT INTO Users (UserName, [Password])
	VALUES ('Admin123', '42F749ADE7F9E195BF475F37A44CAFCB'), ('User1', '5A30C9609B52FE348FB6925896E061DE');
	GO

	CREATE PROC UserNameandPassword		--Make a stored procedure that accepts a user name and password communicate back to C#
	AS
		BEGIN
			SELECT	* -- Only display user name 
			FROM	Users
			 -- But both User name and Password have to match
		END
	GO

	PRINT 'PROC [UserNameandPassword] CREATED' -- Display Occurance
	GO

	CREATE PROC InsertNewUser (@UserName VARCHAR(40), @Password VARCHAR(MAX))
	AS
		BEGIN
				INSERT INTO Users
				VALUES (@UserName, @Password)
				RETURN
		END
		GO
	CREATE PROC [dbo].[AddContact]
		@FirstName VARCHAR(50),
		@LastName VARCHAR(50),
		@MiddleInit VARCHAR(50),
		@CompanyName VARCHAR(75),
		@AddressLine1 VARCHAR(75),
		@AddressLine2 VARCHAR(75),
		@City VARCHAR(50),
		@State VARCHAR(50),
		@PostalCode VARCHAR(10),
		@Email VARCHAR(50)
	AS
	BEGIN
		INSERT INTO Contacts
					(FirstName,LastName,MiddleInit,CompanyName,AddressLine1,AddressLine2,
					City,[State], PostalCode, Email)
		VALUES		(@FirstName,@LastName,@MiddleInit,@CompanyName,@AddressLine1,@AddressLine2,
					@City,@State, @PostalCode, @Email)
	END
	GO
	--SELECT HashBytes('MD5', 'User123')
	--exec UserNameandPassword @UserName = 'Admin123', @Password = 'Password123'
	--select * from Contacts

	--select * from Users