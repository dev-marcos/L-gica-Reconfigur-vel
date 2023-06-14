--▪ Exercício 1: Refaça o exercício 2 da aula anterior, no entanto, quando
--dir = ‘1’, a saída deve ser “11” (quando não estiver resetado).
--Exercício aula anterior,
--alterar para qdo dir = ‘1’
--a saída ser 11


LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
entity Exercicio_1 is
port( clk, dir, reset: in std_logic;
		
      saida: out std_logic_vector(1 downto 0));
end Exercicio_1;
-------------------------------------------------------------------
architecture Maq_est_Mealy of Exercicio_1 is

type MEUS_ESTADOS is (A, B, C, D);
signal estado: MEUS_ESTADOS;

begin
process(clk)
	begin
	if	clk'event	and	clk= '1' then
------ Maquina de estados	
		if reset = '1' then	
			
		else
			case estado is
				when A => 
					if dir = '1' then
						estado <=B;
					else
						estado <=D;
					end if;
					
				when B => 

					if dir = '1' then
						estado <=C;
					else
						estado <=A;
					end if;
					
				when C => 

					if dir = '1' then
						estado <=D;
					else
						estado <=B;
					end if;
					
				when D => 
					if dir = '1' then
						estado <=A;
					else
						estado <=C;
					end if;
			end case;
		end if;
		
	end if;
end process;
------- Processo do controle de saída
process (estado, dir)
begin 
	if (dir = '1' and reset ='1') then	
		saida <= "11";
	end if;
	case estado is 
		when A => saida <= "00";
		when B => saida <= "01";
		when C => saida <= "10";
		when D => saida <= "11";
	end case;
end process;
------- Fim controle de saída
end Maq_est_Mealy;

-------------------------------------------------------------------