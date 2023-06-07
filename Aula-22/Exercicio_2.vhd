--Exercício 2: Refaça o exercício utilizando o modelo com o controle de
--estados e o controle da saída.



LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
entity Exercicio_2 is
port( clk, dir, reset: in std_logic;
		
      saida: out std_logic_vector(1 downto 0));
end Exercicio_2;
-------------------------------------------------------------------
architecture Maq_est_Moore of Exercicio_2 is

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

process (estado)
begin 
	case estado is 
		when A => saida <= "00";
		when B => saida <= "01";
		when C => saida <= "10";
		when D => saida <= "11";
	end case;
end process;

end Maq_est_Moore;

-------------------------------------------------------------------