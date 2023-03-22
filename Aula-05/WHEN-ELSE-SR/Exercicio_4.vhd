LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_4 IS
	PORT (
		a: IN INTEGER RANGE 0 to 7;
		b: IN INTEGER RANGE 0 to 7;
		sum: OUT INTEGER RANGE 0 to 15;
		comp: OUT std_logic);
END Exercicio_4;

ARCHITECTURE logica OF Exercicio_4 IS
BEGIN
	sum <= a + b;
  
	comp <= '1' WHEN a > b ELSE '0';
END logica;