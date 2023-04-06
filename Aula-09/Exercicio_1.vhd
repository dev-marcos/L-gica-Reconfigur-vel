LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_1 IS
	PORT (	d, clk, rst: IN std_logic;
			   q: OUT std_logic);
END Exercicio_1;

ARCHITECTURE logica OF Exercicio_1 IS
BEGIN
	PROCESS (clk, rst)
	begin 
		 
		if (rst = '1') then
			q <= '0';
		else
			if (clk = '1' and clk'event) then
				q <= d;
			end if;
		end if;
	 
	end PROCESS;
END logica;