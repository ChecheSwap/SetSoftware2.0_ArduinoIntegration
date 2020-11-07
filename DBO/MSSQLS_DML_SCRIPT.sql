  
 /*---------------------------------------------------------------------
  -                                                                    -
  -                 Database Objects Script (DDL/DML)                  -
  -                         Microsoft Sql Server                       -
  -             Ing. Jesús José Navarrete Baca (@checheswap)           -
  -                            November 2019                           -
  -                                                                    -
  ---------------------------------------------------------------------*/
    
IF NOT EXISTS(SELECT 1
			  FROM   SYS.DATABASES
			  WHERE  name = 'setsw')
BEGIN
	CREATE DATABASE setsw;
END;

USE SETSW;

GO

DROP TABLE dbo.credentials;
DROP PROCEDURE dbo.bdExistToken;
DROP PROCEDURE dbo.bdSendMail;

CREATE TABLE credentials(
	id       INT PRIMARY KEY IDENTITY(1,1),
	access_token VARCHAR(200)
);

INSERT INTO CREDENTIALS VALUES ('AAA123');
INSERT INTO CREDENTIALS VALUES ('ABC123');
INSERT INTO CREDENTIALS VALUES ('CCC123');

GO

CREATE PROCEDURE bdExistToken(@access_token VARCHAR(150)) AS
BEGIN
	SELECT 1
	FROM   credentials
	WHERE  access_token = @access_token;
END;

GO

CREATE PROCEDURE bdSendMail(@msg VARCHAR(500))AS
BEGIN

SET @msg = @msg + CONVERT(VARCHAR,GETDATE());

EXEC msdb.dbo.sp_send_dbmail  
    @profile_name = 'JJNAVARRETE_INTERCERAMIC_SDP'  
  , @recipients = 'cXXXX@hotmail.com'  
  , @subject = 'Set Software Agente de Inicio de Sesion'  
  , @body = @msg 
  , @importance ='HIGH'   
END;
