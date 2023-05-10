--package 1 
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

PACKAGE my_package IS 
	FUNCTION CALC (SIGNAL A,B: INTEGER) RETURN INTEGER; 
END my_package; 
----------------------------------------
PACKAGE BODY my_package IS 
	FUNCTION CALC (SIGNAL A,B: INTEGER) RETURN INTEGER IS 
	BEGIN 
		RETURN A+B; 
	END CALC; 
END my_package; 