library IEEE;
use IEEE.std_logic_1164.all;

entity sistema is 
	generic(n: integer := 2);
	port (inp: IN BIT_VECTOR (n DOWNTO 0);
			outp: OUT BIT_VECTOR (n+1 DOWNTO 0));
end sistema;

architecture comportamento of sistema is
	component gerador_de_paridade is 
		generic(n: positive);
		port (input : IN BIT_VECTOR (n DOWNTO 0);
				output : OUT BIT_VECOTR(n+1 DOWNTO 0));
	end component;
begin
	C1: gerador_de_paridade GENERIC MAP (n) PORT MAP (inp, outp);
end comportamento;
