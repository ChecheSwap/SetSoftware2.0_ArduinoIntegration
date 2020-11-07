  
 /*---------------------------------------------------------------------
  -                                                                    -
  -         Stored Procedure spgetclientesnombreapellido DDL           -
  -                             MySQL RDBMS                            -
  -             Ing. Jesús José Navarrete Baca (@checheswap)           -
  -                            November 2019                           -
  -                                                                    -
  ---------------------------------------------------------------------*/
  

DROP PROCEDURE IF EXISTS spgetclientesnombreapellido;

DELIMITER //

CREATE PROCEDURE spgetclientesnombreapellido(IN INCIDENCIA VARCHAR(128))

BEGIN
		SELECT ID_CLIENTE, CONCAT(NOMBRE, " ", APELLIDO) NOMBRE, CONCAT(CALLE," ",COLONIA) CALLE_COL, CONCAT(CIUDAD," ",ESTADO) CD_EDO, CP, FECHA_NACIMIENTO, TELEFONO, EMAIL, CURP, RFC
        FROM CLIENTE WHERE UPPER(REPLACE(CONCAT(NOMBRE,APELLIDO)," ","")) LIKE CONCAT('%',REPLACE(UPPER(INCIDENCIA),' ',''),'%');
END

//


