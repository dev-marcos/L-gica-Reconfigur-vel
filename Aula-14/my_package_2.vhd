--package 2 
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

PACKAGE my_package_2 IS 
	FUNCTION CALC (SIGNAL A,B: INTEGER) RETURN INTEGER; 
END my_package_2; 
----------------------------------------
PACKAGE BODY my_package_2 IS 
	FUNCTION CALC (SIGNAL A,B: INTEGER) RETURN INTEGER IS 
	BEGIN 
		RETURN A-B; 
	END CALC; 
END my_package_2; 