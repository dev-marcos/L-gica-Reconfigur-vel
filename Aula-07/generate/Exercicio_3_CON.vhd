LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Exercicio_3_CON IS
PORT (B: IN  std_logic_Vector (0 to 3);
		  G: OUT std_logic_Vector (0 to 3));
END ENTITY;

ARCHITECTURE funcao Of Exercicio_3_CON IS
BEGIN

	gen: FOR i IN B'RANGE GENERATE
			
		if1 : IF i /= 0 GENERATE
			G(i) <= B(i);
		END GENERATE if1;
		
		
		if2 : IF i = 0 GENERATE
			G(i) <= B(i) XOR B(i+1);
		END GENERATE if2;
		
		
	END GENERATE gen;
	
	
END funcao;