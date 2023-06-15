LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity rs232_maq is
port( dados : in std_logic_vector(7 downto 0); --dados do decoder
		   clk: in std_logic; -- clock de 9600khz
		enable: in std_logic; -- habilita transmissão
		    tx: out std_logic := '1'); -- dados enviados de forma serial
end rs232_maq;
-------------------------------------------------------------------
architecture funcionamento of rs232_maq is
type estados_type is (StartStop_bit, B0, B1, B2, B3, B4, B5, B6, B7, Idle);
signal estado: estados_type := idle;

begin
	--PROCESSO DE ENVIO
	Serial : process (clk, enable)
	variable dados_velho: std_logic_vector(7 downto 0);
	begin
		if (enable='1') then
			if rising_edge(clk) then
				if (dados /= dados_velho) then
					case estado is 
						when idle => estado <= StartStop_bit;
						when StartStop_bit => estado <= B0;
						when B0 => estado <= B1;
						when B1 => estado <= B2;
						when B2 => estado <= B3;
						when B3 => estado <= B4;
						when B4 => estado <= B5;
						when B5 => estado <= B6;
						when B6 => estado <= B7;
						when B7 => estado <= StartStop_bit;
								dados_velho := dados;
					end case;
				else
					estado <= idle;
				end if;
			end if;
		else
			estado <= idle;
		end if;
	end process;
	 

	
	process (estado)
	begin
		case estado is 
			when StartStop_bit => tx <= '0';
			when B0 => tx <= dados(0);
			when B1 => tx <= dados(1);
			when B2 => tx <= dados(2);
			when B3 => tx <= dados(3);
			when B4 => tx <= dados(4);
			when B5 => tx <= dados(5);
			when B6 => tx <= dados(6);
			when B7 => tx <= dados(7);	
			when idle => tx <= '1';
		end case;
	end process;
end funcionamento;