LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_3 IS
	PORT (
		in_vec : in  STD_LOGIC_VECTOR(0 to 3);
		 s_vec : in  STD_LOGIC_VECTOR(0 to 1);
	    SAIDA : OUT std_logic);
END exercicio_3;

ARCHITECTURE logica OF exercicio_3 IS
	SIGNAL x_vec : STD_LOGIC_VECTOR(0 to 3);
BEGIN
	x_vec(0) <= in_vec(0) AND NOT(s_vec(0)) AND NOT(s_vec(1));
	x_vec(1) <= in_vec(1) AND NOT(s_vec(0)) AND     s_vec(1);
	x_vec(2) <= in_vec(2) AND     s_vec(0)  AND NOT(s_vec(1));
	x_vec(3) <= in_vec(3) AND     s_vec(0)  AND     s_vec(1);

  SAIDA <= x_vec(0) OR x_vec(1) OR x_vec(2) OR x_vec(3);
END logica;