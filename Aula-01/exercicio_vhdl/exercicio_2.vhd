LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_2 IS
	PORT (A : IN std_logic;
			B : IN std_logic;
			C : IN std_logic;
			D : IN std_logic;
		  S1 : IN std_logic;
		  S2 : IN std_logic;
	  SAIDA : OUT std_logic);
END exercicio_2;

ARCHITECTURE logica OF exercicio_2 IS
	SIGNAL x1, x2, x3, x4 : std_logic;
BEGIN

	x1 <= A AND (NOT S1) AND (NOT S2);
	x2 <= B AND (NOT S1) AND      S2;
	x3 <= C AND      S1  AND (NOT S2);
	x4 <= D AND      S1  AND      S2;
	
	SAIDA<= x1 OR x2 OR x3 OR x4;

END logica;