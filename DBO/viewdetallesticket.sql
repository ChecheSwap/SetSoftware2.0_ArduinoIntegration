--JESUS JOSE NAVARRETE BACA @CHECHESWAP
--NOVEMBER 2019

CREATE OR REPLACE VIEW VIEWDETALLESTICKET AS 

SELECT CONVERT(SUM(A.CANTIDAD),CHAR) AS CANTIDAD, 

		(CASE WHEN A.DESCUENTO > 0 

		THEN 
		
			CONCAT(B.NOMBRE,'-',A.DESCUENTO,'%') 
		ELSE 
			B.NOMBRE 
		
		END ) AS NOMBRE, 
			
            CONVERT(A.PRECIO,CHAR) AS PRECIO, CONVERT(SUM(A.CANTIDAD * A.PRECIO)-((SUM(A.CANTIDAD * A.PRECIO)/100)*A.DESCUENTO),CHAR) AS IMPORTE    
			
            FROM DETALLE A INNER JOIN PRODUCTO B
					
                    ON A.PKPRODUCTO = B.PKPRODUCTO   				
						
                        GROUP BY  A.IDVENTA,  A.PKPRODUCTO, A.DESCUENTO;
                                               
                        				
					
                        
                        
              
