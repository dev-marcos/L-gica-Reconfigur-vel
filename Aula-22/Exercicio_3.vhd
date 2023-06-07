--Faça uma máquina de estados MOORE que controle a movimentação
--de um motor de passos (passo completo 1) com controle do sentido de
--rotação. Use clock 50MHz para clk (0,5 Hz), e DIP [0] para a direção.
--Como saída use LED [0-3]. Faça pelo modelo 2.



LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
entity Exercicio_3 is
port( sys_clk_50mhz : in std_logic;
		clk, dir, reset: in std_logic;
		
      saida: out std_logic_vector(0 to 3));
end Exercicio_3;
-------------------------------------------------------------------
architecture Maq_est_Moore of Exercicio_3 is

type MEUS_ESTADOS is (A, B, C, D);
signal estado: MEUS_ESTADOS;

begin

process(sys_clk_50mhz)
	variable contador : NATURAL range 0 to 50000000;

	begin
		if rising_edge(sys_clk_50mhz) then
			contador := contador + 1;
		if contador = 50000000 then
			contador := 0;
			
			
			if dir= '1' then
				case estado is
					when A => estado <=B;
					when B => estado <=C;
					when C => estado <=D;
					when D => estado <=A;
				end case;
			else
				case estado is
					when A => estado <=D;
					when D => estado <=C;
					when C => estado <=B;
					when B => estado <=A;
				end case;
			end if;
		end if;
	end if;
end process;



process (estado)
begin 
	case estado is 
		when A => saida <= "1000";
		when B => saida <= "0100";
		when C => saida <= "0010";
		when D => saida <= "0001";
	end case;
end process;

end Maq_est_Moore;