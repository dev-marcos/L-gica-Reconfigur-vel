LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Exercicio_1 IS
PORT (D: IN std_logic_Vector (0 to 5);
		S: OUT std_logic);
END ENTITY;

ARCHITECTURE funcao Of Exercicio_1 IS
	SIGNAL aux: std_logic_vector (0 to 3);
BEGIN
	aux(0) <= (D(0) AND D(1)) XOR (D(1) AND D(2));
	
	GEN: FOR i IN 1 to 3 GENERATE
	
		aux(i) <= aux(i-1) XOR D(i+2);
		
	END GENERATE GEN;
	
	S <= aux(3);
	
END funcao;