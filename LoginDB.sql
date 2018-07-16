use [master]
GO

IF EXISTS (SELECT * FROM Sys.databases WHERE Name = 'LoginDB') DROP DATABASE LoginDB

	PRINT '[LoginDB] DROPPED'

CREATE DATABASE [LoginDB]
GO

	PRINT '[LoginDB] CREATED'

USE LoginDB
GO

CREATE TABLE Users
	(UserID INT IDENTITY NOT NULL,
	UserName VARCHAR(30) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	PRIMARY KEY (UserID))
	GO

	PRINT '[Users] TABLE CREATED'
	GO

	CREATE PROC UserNameandPassword
	(@UserName VARCHAR(20), @Password VARCHAR(20))
	AS
		BEGIN
			SELECT	UserName
			FROM	Users
			WHERE UserName = @UserName AND Password = @Password
		END
	GO

	PRINT 'PROC [UserNameandPassword] CREATED'

	INSERT INTO Users (UserName, [Password])
	VALUES ('Admin123', 'Password123'), ('User1', 'User123');

	-- exec UserNameandPassword @UserName = 'Admin123', @Password = 'Password123'