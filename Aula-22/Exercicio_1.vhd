--Faça uma máquina de estados do tipo Moore, de acordo
--com o diagrama de estados abaixo, utilizando o modelo 1:

--Entradas síncronas:
--▪ CLK: KEY[0]
--▪ RESET: KEY[1]
--▪ DIR: DIP SWITCH[0]

--Saída
--▪ ESTADO: LED[0-1]

LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
entity Exercicio_1 is
port( clk, dir, reset: in std_logic;
		
      saida: out std_logic_vector(1 downto 0));
end Exercicio_1;
-------------------------------------------------------------------
architecture Maq_est_Moore of Exercicio_1 is

type MEUS_ESTADOS is (A, B, C, D);
signal estado: MEUS_ESTADOS;

begin
process(clk)
	begin
	if	clk'event	and	clk= '1' then
------ Maquina de estados	
		if reset = '1' then	
			estado <=A;
			saida <= "00";	
		else

			case estado is
				when A => 
					saida <= "00";
					if dir = '1' then
						estado <=B;
					else
						estado <=D;
					end if;
					
				when B => 
				saida <= "01";
					if dir = '1' then
						estado <=C;
					else
						estado <=A;
					end if;
					
				when C => 
				saida <= "10";
					if dir = '1' then
						estado <=D;
					else
						estado <=B;
					end if;
					
				when D => 
				saida <= "11";
					if dir = '1' then
						estado <=A;
					else
						estado <=C;
					end if;
			end case;
		end if;
		
	end if;
end process;
end Maq_est_Moore;

-------------------------------------------------------------------