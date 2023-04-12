LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_1 IS
	PORT (	SW: IN std_logic_vector(3 downto 0);
			   HEX0: OUT std_logic_vector(0 to 6));
END Exercicio_1;

ARCHITECTURE logica OF Exercicio_1 IS
BEGIN
	PROCESS (SW)
	BEGIN
		CASE SW IS 
			WHEN "0000" => HEX0 <= "0000001" ;
			WHEN "0001" => HEX0 <= "1001111" ;
			WHEN "0010" => HEX0 <= "0010010" ;
			WHEN "0011" => HEX0 <= "0000110" ;
			WHEN "0100" => HEX0 <= "1001100" ;
			WHEN "0101" => HEX0 <= "0100100" ;
			WHEN "0110" => HEX0 <= "0100000" ;
			WHEN "0111" => HEX0 <= "0001111" ;
			WHEN "1000" => HEX0 <= "0000000" ;
			WHEN "1001" => HEX0 <= "0000100" ;
			WHEN OTHERS => HEX0 <= "0110000" ;
		END case;
	END PROCESS;
END logica;