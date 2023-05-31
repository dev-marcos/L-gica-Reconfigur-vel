-- produz na saída um clock de 9600 Khz necessário para o protocolo serial

library ieee;
use ieee.std_logic_1164.all;

entity clock9600 is 

port (clk_out: out std_logic;
		CLOCK_50: in std_logic);
      
end clock9600;

architecture basica of clock9600 is
signal count: integer range 0 to 5208 :=0;

begin
 
process (CLOCK_50)			
begin
	if (CLOCK_50='1' and CLOCK_50'event) then
		count<=count+1;
		
		if (count<=2604) then
		clk_out<='1';
		else
		clk_out<='0';
		end if;
		
		if (count=5208) then
		count<=0;
		end if;
		
	end if;
	
end process;

end basica;


