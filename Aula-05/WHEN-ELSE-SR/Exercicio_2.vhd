LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_2 IS
	PORT (
			 SEL: IN std_logic_vector(1 downto 0);
				X: OUT std_logic_vector(7 downto 0));
END Exercicio_2;

ARCHITECTURE logica OF Exercicio_2 IS
BEGIN
	X <= "11000000" WHEN SEL="00" ELSE
		  "00110000" WHEN SEL="01" ELSE
		  "00001100" WHEN SEL="10" ELSE
		  "00000011" WHEN SEL="11" ELSE
		  "00000000";
END logica;