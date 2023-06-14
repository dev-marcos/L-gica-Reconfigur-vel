--Faça um código (reutilize exercício 3 da aula passada) para um motor
--de passo com controle de direção utilizando meio passo. A velocidade
--do meio passo deve ser a mesma do passo completo.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
entity Exercicio_4 is
port( sys_clk_50mhz : in std_logic;
		dir: in std_logic;
		
      saida: out std_logic_vector(0 to 3));
end Exercicio_4;
-------------------------------------------------------------------
architecture Maq_est_Moore of Exercicio_4 is

type MEUS_ESTADOS is (A, B, C, D);
signal estado: MEUS_ESTADOS;
signal contador: integer range 0 to 100000000 := 0;

begin

process(sys_clk_50mhz)
	begin
		if rising_edge(sys_clk_50mhz) then
			contador <= contador + 1;
		if contador = 100000000 then
			contador <= 0;
			
			
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



process (estado, contador)
begin 
	if dir='1' then 
		case estado is 
			when A => 
				if contador<=50000000 then 
					saida <= "0001"; 
				else 
					saida <="0011";
				end if;
			when B => 
				if contador<=50000000 then 
					saida <= "0010"; 
				else 
					saida <="0110";
				end if;
			when C => 
				if contador<=50000000 then 
					saida <= "0100"; 
				else 
					saida <="1100";
				end if;
			when D => 
				if contador<=50000000 then 
					saida <= "1000"; 
				else 
					saida <="1001";
				end if;
		end case;
	else 
		case estado is 
			when A => 
				if contador<=50000000 then 
					saida <= "0001"; 
				else 
					saida <="1001";
				end if;
			when B => 
				if contador<=50000000 then 
					saida <= "0010"; 
				else 
					saida <="0011";
				end if;
			when C => 
				if contador<=50000000 then 
					saida <= "0100"; 
				else 
					saida <="0110";
				end if;
			when D => 
				if contador<=50000000 then 
					saida <= "1000"; 
				else 
					saida <="1100";
				end if;
		end case;
	
	end if;
			
				

end process;

end Maq_est_Moore;