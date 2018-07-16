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
	Password VARCHAR(30) NOT NULL,
	PRIMARY KEY (UserID))		-- Make user ID primary key
	GO

	PRINT '[Users] TABLE CREATED'	-- Display occurance
	GO

		INSERT INTO Users (UserName, [Password])
	VALUES ('Admin123', 'Password123'), ('User1', 'User123');
	GO

	CREATE PROC UserNameandPassword		--Make a stored procedure that accepts a user name and password communicate back to C#
	(@UserName VARCHAR(20), @Password VARCHAR(20))
	AS
		BEGIN
			SELECT	UserName -- Only display user name 
			FROM	Users
			WHERE UserName = @UserName AND Password = @Password -- But both User name and Password have to match
		END
	GO

	PRINT 'PROC [UserNameandPassword] CREATED' -- Display Occurance

	--EXEC sp_configure 'remote access', 0;
	--GO
	--RECONFIGURE ;
	--GO

	-- exec UserNameandPassword @UserName = 'Admin123', @Password = 'Password123'