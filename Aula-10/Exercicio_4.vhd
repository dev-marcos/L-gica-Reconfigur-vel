LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_4 IS
	PORT (	KEY: IN std_logic_vector(0 to 0);
			   LEDR: OUT std_logic_vector(3 downto 0));
END Exercicio_4;

ARCHITECTURE logica OF Exercicio_4 IS
BEGIN
	PROCESS (KEY(0))
		variable X: INTEGER RANGE 0 to 3 := 0;
	BEGIN
		IF (KEY(0) = '1' and KEY(0)'event) then
			CASE X IS 
				WHEN 0 => LEDR <= "1000" ;
				WHEN 1 => LEDR <= "0100" ;
				WHEN 2 => LEDR <= "0010" ;
				WHEN 3 => LEDR <= "0001" ;
				
			END case;
			X := X + 1;
		END IF;
		
	END PROCESS;
END logica;