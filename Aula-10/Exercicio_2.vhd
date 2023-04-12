LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_2 IS
	PORT (	KEY: IN std_logic_vector(0 to 0);
			   HEX0: OUT std_logic_vector(0 to 6));
END Exercicio_2;

ARCHITECTURE logica OF Exercicio_2 IS
BEGIN
	PROCESS (KEY(0))
		variable x: INTEGER RANGE 0 to 15 := 0;
	BEGIN
		IF (KEY(0) = '1' and KEY(0)'event) then
			CASE x IS 
				WHEN 0 => HEX0 <= "0000001" ;
				WHEN 1 => HEX0 <= "1001111" ;
				WHEN 2 => HEX0 <= "0010010" ;
				WHEN 3 => HEX0 <= "0000110" ;
				WHEN 4 => HEX0 <= "1001100" ;
				WHEN 5 => HEX0 <= "0100100" ;
				WHEN 6 => HEX0 <= "0100000" ;
				WHEN 7 => HEX0 <= "0001111" ;
				WHEN 8 => HEX0 <= "0000000" ;
				WHEN 9 => HEX0 <= "0000100" ;
				WHEN OTHERS => HEX0 <= "0110000" ;
			END case;
			x := x + 1;
		END IF;
		
	END PROCESS;
END logica;