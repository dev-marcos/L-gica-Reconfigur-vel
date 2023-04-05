LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_4 IS
	PORT (	 A, B, T, En: IN std_logic;
		SUM, Cout: OUT std_logic;

END Exercicio_4;

ARCHITECTURE logica OF Exercicio_4 IS
BEGIN
	bloco1: BLOCK(En='1')
	BEGIN
	      SUM <= GUARDED (A XOR B) WHEN T='1' ELSE 'Z';
	     Cout <= GUARDED (A AND B) WHEN T='1' ELSE 'Z';
	END BLOCK bloco1;
END logica;
