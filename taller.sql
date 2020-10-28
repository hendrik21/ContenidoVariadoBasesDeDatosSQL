#1.

SELECT * FROM articulo WHERE ciudad LIKE 'Caceres'

#2.

SELECT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
WHERE a.codigot LIKE 'T1'

#3.

SELECT DISTINCT c.color, c.ciudad FROM componente AS c

#4. 

SELECT a.codigot, a.ciudad FROM articulo AS a WHERE a.ciudad LIKE '%d'
UNION
SELECT a.codigot, a.ciudad FROM articulo AS a WHERE a.ciudad LIKE '%e%'

#5.

SELECT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
INNER JOIN componente AS c ON c.codigoc = e.codigoc
WHERE a.codigot LIKE 'T1' AND c.codigoc LIKE 'C1'

#6.

SELECT a.Tnombre FROM articulo AS a
INNER JOIN envio AS e ON e.codigot = a.codigot
INNER JOIN proveedor AS p ON p.codigop = e.codigop
WHERE p.codigop = 'P1'
ORDER BY a.Tnombre ASC

#7.

SELECT DISTINCT c.codigoc FROM componente AS c
INNER JOIN envio AS e ON e.codigoc = c.codigoc
INNER JOIN articulo AS a ON a.codigot = e.codigot
WHERE a.ciudad = 'Madrid'

#8.

SELECT DISTINCT c.codigoc FROM componente AS c
INNER JOIN envio AS e ON e.codigoc = c.codigoc
INNER JOIN articulo AS a ON a.codigot = e.codigot
WHERE C.peso = 12

#9.

SELECT DISTINCT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
WHERE a.codigot = 'T1'
UNION
SELECT DISTINCT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
WHERE a.codigot = 'T2'

#10.

SELECT DISTINCT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
INNER JOIN componente AS c on c.codigoc = e.codigoc
WHERE a.ciudad = 'Sevilla' AND c.color = 'Rojo'
UNION
SELECT DISTINCT p.codigop FROM proveedor AS p
INNER JOIN envio AS e ON e.codigop = p.codigop
INNER JOIN articulo AS a ON a.codigot = e.codigot
INNER JOIN componente AS c on c.codigoc = e.codigoc
WHERE a.ciudad = 'Madrid' AND c.color = 'Rojo'

#11. (CORREGIR: APARECEN DOS DATOS ERRONEOS)

SELECT DISTINCT c.codigoc FROM componente AS c
JOIN envio AS e ON e.codigoc = c.codigoc
JOIN articulo AS a ON a.codigot = e.codigot
WHERE a.ciudad = (
    SELECT a.ciudad FROM articulo AS A 
    JOIN envio AS e ON e.codigot = a.codigot
	JOIN proveedor AS p ON p.codigop = e.codigop
    WHERE p.ciudad LIKE 'Sevilla' AND a.ciudad LIKE 'Sevilla'
	)

#12.

SELECT DISTINCT a.codigot FROM articulo AS a
JOIN envio AS e ON e.codigot = a.codigot
JOIN componente AS c ON c.codigoc = e.codigoc
WHERE c.codigoc = (
    SELECT DISTINCT c.codigoc FROM componente AS c
    JOIN envio AS e ON e.codigoc = c.codigoc
    JOIN proveedor AS p ON p.codigop = e.codigop
    WHERE p.codigop LIKE 'P1'
    )

#13.

SELECT DISTINCT p.ciudad AS ciudad_proveedor, c.codigoc, a.ciudad AS ciudad_articulo FROM componente AS c
JOIN envio AS e ON e.codigoc = c.codigoc
JOIN proveedor AS p ON p.codigop = e.codigop
JOIN articulo AS a ON a.codigot = e.codigot

#14.

SELECT DISTINCT p.ciudad AS ciudad_proveedor, c.codigoc, a.ciudad AS ciudad_articulo FROM componente AS c
JOIN envio AS e ON e.codigoc = c.codigoc
JOIN proveedor AS p ON p.codigop = e.codigop
JOIN articulo AS a ON a.codigot = e.codigot
WHERE p.ciudad != a.ciudad

#15. 

SELECT DISTINCT COUNT(codigoc) AS numero_suministros, COUNT(codigot) AS numero_articulos, cantidad FROM envio 
WHERE codigop = 'P2'

#16.

SELECT DISTINCT codigoc, codigot, cantidad FROM envio

#17.

SELECT DISTINCT a.codigot FROM articulo AS a
JOIN envio AS e ON e.codigot = a.codigot
JOIN componente AS c ON c.codigoc = e.codigoc
JOIN proveedor AS p ON p.codigop = e.codigop
WHERE p.ciudad = 'Madrid' AND p.ciudad != a.ciudad

#18.

SELECT DISTINCT p.codigop FROM proveedor AS p
JOIN envio AS e ON e.codigop = p.codigop
JOIN componente AS c ON c.codigoc = e.codigoc
WHERE c.color = (
    SELECT DISTINCT c.color FROM componente AS c
    JOIN envio AS e ON e.codigoc = c.codigoc
    JOIN proveedor AS p ON p.codigop = e.codigop
    WHERE c.color = 'Rojo'
    )

#19.

SELECT codigot, avg(cantidad) AS promedio FROM envio
GROUP BY codigot
HAVING promedio > 320

#20. (?)



#21.

SELECT codigoc FROM envio WHERE codigot = 'T2' AND codigop = 'P2'

#22.

SELECT DISTINCT e.codigop, e.codigoc, e.codigot, e.cantidad FROM envio AS e
JOIN componente AS c ON c.codigoc = e.codigoc
WHERE c.color != 'Rojo'

#23.

SELECT DISTINCT codigoc FROM envio WHERE codigot = 'T1'
UNION
SELECT DISTINCT codigoc FROM envio WHERE codigot = 'T2'

#24. (?)



#25.

SELECT DISTINCT c.color FROM componente AS c
JOIN envio AS e ON e.codigoc = c.codigoc
JOIN proveedor AS p ON p.codigop = e.codigop
WHERE p.codigop = 'P1'

#26.

SELECT DISTINCT e.codigop, e.codigoc, e.codigot, e.cantidad, p.ciudad FROM envio AS e
JOIN proveedor AS p ON p.codigop = e.codigop
JOIN articulo AS a ON a.codigot = e.codigot
JOIN componente AS c ON c.codigoc = e.codigoc
WHERE p.ciudad = c.ciudad AND c.ciudad = a.ciudad

#27. (?)



#28. (?)



#29. (?)



#30. (?)



#31. (?)



#32.

#SELECCIONAR LOS COMPONENTES DE SEVILLA QUE VAYAN A SER ENVIADOS PARA SU MONTAJE EN CUALQUIER OTRA CIUDAD FUERA DE SEVILLA

SELECT DISTINCT c.codigoc FROM componente AS c
JOIN envio AS e ON e.codigoc = c.codigoc
JOIN articulo AS a ON a.codigot = e.codigot
WHERE c.ciudad = 'Sevilla' AND a.ciudad != 'Sevilla'









