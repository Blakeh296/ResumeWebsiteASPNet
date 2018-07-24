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

	--SELECT HashBytes('MD5', 'User123')
	--exec UserNameandPassword @UserName = 'Admin123', @Password = 'Password123'