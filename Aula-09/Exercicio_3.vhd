LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_3 IS
	PORT (	a, b: IN INTEGER RANGE 0 to 7;
				clk : IN std_logic;
			   reg_comp: OUT std_logic;
				reg_sum: OUT INTEGER RANGE 0 to 15);
END Exercicio_3;

ARCHITECTURE logica OF Exercicio_3 IS
	SIGNAL comp : std_logic;
	SIGNAL sum : INTEGER RANGE 0 to 15;
BEGIN
	comp <= '1' when a > b else '0';
	sum <= a + b;
	
	PROCESS (clk)
	begin 
		if (clk = '1' and clk'event) then
			reg_comp <= comp;
			reg_sum <= sum;
			
		end if;
	end PROCESS;
END logica;