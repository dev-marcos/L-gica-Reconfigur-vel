LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_1 IS
	GENERIC (N: INTEGER := 4);
	PORT (	serial, clk : IN std_logic;
			   Q: BUFFER std_logic_vector(N-1 downto 0));
END Exercicio_1;

ARCHITECTURE logica OF Exercicio_1 IS
BEGIN
	PROCESS
	BEGIN
			WAIT UNTIL clk = '1' ;
			
			deslocador: FOR i IN 0 TO N-2 LOOP
				
				Q(i) <= Q(i+1);
					
			END LOOP;
			Q(N-1) <= serial;

	END PROCESS;
END logica;