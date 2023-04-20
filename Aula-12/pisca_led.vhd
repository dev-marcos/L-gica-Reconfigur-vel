library ieee;
use ieee.std_logic_1164.all;
entity pisca_led is
port (sys_clock_50mhz : in std_logic;
		led : buffer std_logic);
end entity pisca_led;

architecture funcao of pisca_led is 
begin
	process(sys_clock_50mhz)
		variable x : INTEGER range 0 to 50000000 := 0;
	begin
		if rising_edge(sys_clock_50mhz) then 
			x := x + 1;
			if (x = 50000000) then 
				x := 0;
				led <= not led; 
			end if;	
		end if;	
	end process;
end architecture funcao;