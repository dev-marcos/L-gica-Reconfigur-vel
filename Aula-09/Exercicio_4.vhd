LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_4 IS
	PORT (	clk, entrada : IN std_logic;
			   saida: BUFFER std_logic_vector(4 downto 0));
END Exercicio_4;

ARCHITECTURE logica OF Exercicio_4 IS
	
BEGIN
	
	PROCESS (clk)
	begin 
		if (clk = '1' and clk'event) then
			
			saida(4) <= saida(3);
			saida(3) <= saida(2);
			saida(2) <= saida(1);
			saida(1) <= entrada;	
		end if;
	end PROCESS;
END logica;