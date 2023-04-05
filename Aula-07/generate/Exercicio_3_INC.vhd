LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Exercicio_3_INC IS
PORT (B: IN  std_logic_Vector (0 to 3);
		  G: OUT std_logic_Vector (0 to 3));
END ENTITY;

ARCHITECTURE funcao Of Exercicio_3_INC IS
BEGIN


	G(0) <= B(0);
	
	gen: FOR i IN 1 to B'LENGTH GENERATE	
	
		G(i) <= B(i) XOR B(i+1);
		
	END GENERATE gen;
	
	
END funcao;