LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_4 IS
	PORT (	A : IN INTEGER RANGE 0 to 7;
			  Z:  OUT STD_LOGIC_VECTOR(0 to 3) := "0000");
END Exercicio_4;

ARCHITECTURE logica OF Exercicio_4 IS
BEGIN
	PROCESS
	BEGIN 
		wait until (A >= 2);
		Z <= "1111"; 
		
	END PROCESS;
END logica;