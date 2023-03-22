LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_3 IS
	PORT (
	  contador: IN INTEGER RANGE 0 to 15;
				X: OUT std_logic_vector (1 downto 0));
END Exercicio_3;

ARCHITECTURE logica OF Exercicio_3 IS
BEGIN
	X <= "00" WHEN contador < 7  ELSE
		  "11" WHEN contador > 10 ELSE
		  "ZZ";
END logica;