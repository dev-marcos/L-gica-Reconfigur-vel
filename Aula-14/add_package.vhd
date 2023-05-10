LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE add_package IS
	FUNCTION ADD (SIGNAL A,B: INTEGER) RETURN INTEGER;
END add_package;
----------------------------------------------
PACKAGE BODY add_package  IS
	FUNCTION ADD (SIGNAL A,B: INTEGER) RETURN INTEGER IS
	BEGIN
		RETURN A+B;
	END ADD;
END add_package ;
