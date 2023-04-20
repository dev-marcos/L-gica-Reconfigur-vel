library ieee;
use ieee.std_logic_1164.all;
entity pwm1 is
port (sys_clock_50mhz : in std_logic; -- PIN_R8
		   led : out std_logic;         -- PIN_A15
		  led1 : out std_logic:='1');   -- PIN_A13
end entity pwm1;
architecture funcao of pwm1 is 
begin



	process(sys_clock_50mhz)
		variable x : INTEGER range 0 to 10000 := 0;
		variable duty : INTEGER range 0 to 100 := 0;
	begin
		if rising_edge(sys_clock_50mhz) then 
			x := x + 1;
			if (x = 10000) then  -- 5Khz
				x := 0;	
				
				duty := duty +1;
				
				if (duty <= 10) then --10%
					led <= '1'; 
				else
					led <= '0'; 
				end if;
				
				if (duty = 100) then
					duty := 0;
				end if;
				
			end if;	
		end if;	
	end process;
end architecture funcao;