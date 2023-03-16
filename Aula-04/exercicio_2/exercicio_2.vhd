 LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_2 IS
	GENERIC(N : INTEGER :=4);
	  PORT (A: IN std_logic_vector (N-1 downto 0);
			  B: OUT std_logic_vector (N-1 downto 0);
			  C: OUT INTEGER range 0 to 7);
END exercicio_2;

ARCHITECTURE logica OF exercicio_2 IS
BEGIN


	B <= (B'RIGHt=>'1' , B'LEFT=>'1', OTHERS=>'0');
 	C <= A'LENGTH;
	
END logica;