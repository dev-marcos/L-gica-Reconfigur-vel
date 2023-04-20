library ieee;
use ieee.std_logic_1164.all;
entity pwm2 is
port (sys_clock_50mhz : in std_logic;          -- PIN_R8
			SEL : IN std_logic_vector(1 downto 0);-- PIN_M1 e PIN_T8
		   led : out std_logic;                  -- PIN_A15
		  led1 : out std_logic:='1');            -- PIN_A13
end entity pwm2;
architecture funcao of pwm2 is 
begin
	process(sys_clock_50mhz)
		variable clock_5k : INTEGER range 0 to 10000 := 0;
		variable     duty : INTEGER range 0 to 100 := 0;
	begin
	-- 5KHz e duty cicle de 10%
		if rising_edge(sys_clock_50mhz) then 
		
			clock_5k := clock_5k + 1;
			
			if (clock_5k >= 9000) then  -- 5Khz
				led <= '1';	
				if (clock_5k = 10000) then --10%
					clock_5k := 0;
					led <= '0'; 
				end if;
			end if;	
		end if;	
	end process;
end architecture funcao;