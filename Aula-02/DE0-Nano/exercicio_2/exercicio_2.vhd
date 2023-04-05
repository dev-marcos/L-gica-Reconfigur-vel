LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_2 IS
	PORT (
		a_vec : in  STD_LOGIC_VECTOR(0 to 1);
	 out_vec : out  STD_LOGIC_VECTOR(0 to 1));
END exercicio_2;

ARCHITECTURE logica OF exercicio_2 IS
	SIGNAL X : std_logic;
BEGIN
		out_vec <= a_vec;
END logica;