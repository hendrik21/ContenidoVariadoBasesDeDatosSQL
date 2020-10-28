#1.

#a.

DELIMITER $$

CREATE FUNCTION transporte(salario BIGINT)

RETURNS FLOAT DETERMINISTIC

BEGIN

	DECLARE transporte FLOAT DEFAULT 0;
    SET transporte = salario*0.07;
    
    RETURN transporte;
    
END $$

#b.

DELIMITER $$

CREATE FUNCTION salud(salario BIGINT)

RETURNS FLOAT DETERMINISTIC

BEGIN

	DECLARE salud FLOAT DEFAULT 0;
    SET salud = salario*0.04;
    
    RETURN salud;
    
END $$

#c.

DELIMITER $$

CREATE FUNCTION pension(salario BIGINT)

RETURNS FLOAT DETERMINISTIC

BEGIN

	DECLARE pension FLOAT DEFAULT 0;
    SET pension = salario*0.04;
    
    RETURN pension;
    
END $$

#d.

DELIMITER $$

CREATE FUNCTION bono(salario BIGINT)

RETURNS FLOAT DETERMINISTIC

BEGIN

	DECLARE bono FLOAT DEFAULT 0;
    SET bono = salario*0.08;
    
    RETURN bono;
    
END $$

#e.

DELIMITER $$

CREATE FUNCTION integral(salario BIGINT, transporte FLOAT, salud FLOAT, pension float, bono FLOAT)

RETURNS FLOAT DETERMINISTIC

BEGIN

	DECLARE integral FLOAT DEFAULT 0;
    SET integral = salario - salud - pension + bono + transporte;
    
    RETURN integral;
    
END $$

# PROCEDIMIENTO

#2.

# PROCEDIMIENTO

DELIMITER $$

CREATE PROCEDURE insertar(salario BIGINT, transporte FLOAT, salud FLOAT, pension float, bono FLOAT, integral FLOAT)

BEGIN

	INSERT INTO empleado (salario, transporte, salud, pension, bono, integral);
    SELECT transporte(salario) FROM empleado;
    SELECT salud(salario) FROM empleado;
    SELECT pension(salario) FROM empleado;
    SELECT bono(salario) FROM empleado;
    SELECT integral(salario, transporte, salud, pension, bono) FROM empleado;
    
END $$




