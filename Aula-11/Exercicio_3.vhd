LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_3 IS
	PORT (	A : IN INTEGER RANGE 0 to 7;
			   Z : OUT STD_LOGIC_VECTOR(3 downto 0));
END Exercicio_3;

ARCHITECTURE logica OF Exercicio_3 IS
BEGIN
	PROCESS (A)
		variable I: integer range 0 to 4;
	BEGIN
	
		Z <= "0000"; 
		I := 0;
		
		while (i <= 3) loop
			if (A = I) then
				Z(I) <= '1';
				
			end if;
			I := I + 1;		 
		end loop;
	END PROCESS;
END logica;