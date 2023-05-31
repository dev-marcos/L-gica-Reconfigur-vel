
library ieee;
use ieee.std_logic_1164.all;

entity rs322 is 

port (dados: in std_logic_vector (7 downto 0);
		clk: in std_logic;
		enable: in std_logic;
		tx: out std_logic := '1');


end rs322;

architecture basica of rs322 is
signal indice: integer range 0 to 10 :=0;
signal transmitir: std_logic_vector (7 downto 0);
begin
 
process (clk)
begin	

	if (enable='1' ) then
		if (rising_edge(clk)) then

			if (indice=0 and dados /= transmitir) then
				tx <= '0'; --start bit
				indice<=indice+1;
				transmitir <= dados;
				
			end if;
			
			if (indice > 0 and indice < 9)  then
				tx <= transmitir(indice - 1 ); --8 data bits
				indice<=indice+1; 
			end if;
			
			if indice >= 9 then
				tx <= '1'; -- stop bit
				indice<=0;
			end if;
		end if;
	end if;

end process;

end basica;

