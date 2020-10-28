#1.

CREATE PROCEDURE admision(peso INT, estado VARCHAR(15))

BEGIN

	IF peso < 50 THEN
    	
        SET estado = 'Admitido';
        
    ELSE
    
    	SET estado = 'No admitido';
        
    END IF;
END

#2.

DELIMITER $$

CREATE PROCEDURE insertar(cedula BIGINT, nombre VARCHAR(30), apellido VARCHAR(30))

BEGIN 

	INSERT INTO clientes (cedula, nombre, apellido)
    
    VALUES
    
    (1005336943, 'Hendrik', 'López');
    
    
END $$

#3.

BEGIN

	UPDATE clientes
    
    SET nombre = 'Henry' WHERE cedula = '1005336943';
    
END

#4.

DELIMITER $$

CREATE PROCEDURE eliminar(cedula BIGINT)

BEGIN

	DELETE FROM clientes WHERE cedula = '1005336943';
    
END $$

#5.

#6.

delimiter $$
CREATE procedure ej(IN val int)   
  begin
    define i int;
    set i = 0;
    while i<5 do
      INSERT INTO prueba VALUES (i);
      set i=i+1;
    end while;
  end$$


