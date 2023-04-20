library ieee;
use ieee.std_logic_1164.all;
entity pisca_led_reset is
port (sys_clock_50mhz : in std_logic;
		reset : IN std_logic;
		  led : BUFFER std_logic);
end entity pisca_led_reset;

architecture funcao of pisca_led_reset is 
begin
	
	process(sys_clock_50mhz, reset)
		variable contador : NATURAL range 0 to 50000000 := 0;
	begin
		if (reset = '0') then
			led <= '0';
			contador := 0;
		else
			if rising_edge(sys_clock_50mhz) then 
				contador := contador + 1;
				if (contador = 50000000) then 
					contador := 0;
					led <= not led; 
				end if;	
			end if;
		end if;	
	end process;
end architecture funcao;