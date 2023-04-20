library ieee;
use ieee.std_logic_1164.all;
entity fade is
port (sys_clock_50mhz : in std_logic; -- PIN_R8
		   led : out std_logic;         -- PIN_A15
		  led1 : out std_logic:='0');   -- PIN_A13
end entity fade;
architecture funcao of fade is 
begin
	process(sys_clock_50mhz)
		variable x : INTEGER range 0 to 10000 := 0;
		variable y : INTEGER range 0 to 100 := 0;
		variable duty  : INTEGER range 0 to 100 := 0;
	begin
	-- 5KHz e duty cicle de 10%
		if rising_edge(sys_clock_50mhz) then 
			x := x + 1;
			if (x = 10000) then  -- 5Khz
				x := 0;	
				
				y := y +1;
				
				if (y <= duty) then 
					led <= '1'; 
				else
					led <= '0'; 
				end if;
				
				if (y = 100) then
					y := 0;
					duty := duty+1;
					if (duty = 100) then
						duty := 0;
					end if;
				end if;
				
			end if;	
		end if;	
	end process;
end architecture funcao;