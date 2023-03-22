LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_1 IS
	PORT (	A: IN std_logic_vector(1 downto 0);
				B: IN std_logic_vector(1 downto 0);
			 SEL: IN std_logic;
	     X: OUT std_logic_vector(1 downto 0));
END Exercicio_1;

ARCHITECTURE logica OF Exercicio_1 IS
BEGIN
	X <= A WHEN SEL='1' ELSE B;
END logica;