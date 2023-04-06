LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_2 IS
	PORT (	a, b, clk: IN std_logic;
			   q: OUT std_logic);
END Exercicio_2;

ARCHITECTURE logica OF Exercicio_2 IS
SIGNAL x : std_logic;
BEGIN
	x  <= a NAND b;
	PROCESS (clk)
	begin 
		if (clk = '1' and clk'event) then
			q <= x;
		end if;
	end PROCESS;
END logica;