
 /*---------------------------------------------------------------------
  -                                                                    -
  -               Stored Procedure spgetdetallesticket DDL             -
  -                           MySQL RDBMS                              -
  -             Ing. Jesús José Navarrete Baca (@checheswap)           -
  -                            November 2019                           -
  -                                                                    -
  ---------------------------------------------------------------------*/

DROP PROCEDURE IF EXISTS spgetdetallesticket;
DELIMITER //
CREATE PROCEDURE spgetdetallesticket(IN NUMEROVENTA INT)
BEGIN
SELECT SUM(A.CANTIDAD) AS CANTIDAD, (CASE WHEN A.DESCUENTO > 0 THEN CONCAT(B.NOMBRE,'-',A.DESCUENTO,'%') ELSE B.NOMBRE END ) AS NOMBRE, 
       A.PRECIO AS PRECIO, SUM(A.CANTIDAD * A.PRECIO)-((SUM(A.CANTIDAD * A.PRECIO)/100)*A.DESCUENTO)AS IMPORTE    
FROM   DETALLE A 
INNER 
JOIN   PRODUCTO B
ON     A.PKPRODUCTO = B.PKPRODUCTO   
WHERE  A.IDVENTA    = NUMEROVENTA
GROUP  BY A.PKPRODUCTO, A.DESCUENTO;
END
//


