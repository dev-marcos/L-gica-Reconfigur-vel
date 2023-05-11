--Exercício 3: Altere o arquivo do sequencial adicionando uma entrada de
--seleção de forma que quando estiver em ‘0’ a frequência do sequencial
--seja de 1 Hz e quando estiver em ‘1’ seja em 2Hz


library ieee;
use ieee.std_logic_1164.all;  

  entity sequencial_2 is   
  port (CLOCK_50: in std_logic;
		  Entrada, sel : in std_logic;
	ledr : out std_logic_vector (7 downto 0));   
  end entity sequencial_2;
   
  architecture funcao of sequencial_2 is   
  signal ledr_delay : NATURAL range 0 to 50000000;
  signal contagem : NATURAL range 0 to 50000000;   
  signal seg : std_logic; -- variavel com o tempo do clock
  signal cont: natural;	
  begin
  
  WITH sel SELECT
  contagem <= 25000000 WHEN '0', -- 1HZ
				  12000000 WHEN OTHERS; -- 2HZ
				  
--- Gera freq de 1 Hz ---
  process(CLOCK_50)
  Variable ledr_reg : std_logic;
  begin  
       if rising_edge(CLOCK_50) then   
       ledr_delay <= ledr_delay + 1;   
       if ledr_delay = contagem then   -- 1hz
         ledr_delay <= 0;   
         ledr_reg := not ledr_reg; 
    end if;   
    end if;
	 seg<=ledr_reg;
	end process;
	
--- Faz o deslocamento ---
PROCESS (CLOCK_50)
Variable sobe: std_logic;
    BEGIN
         IF seg'EVENT AND seg = '1' THEN
					if sobe='1' then
					cont<=cont+1;
						if cont=7 then
						sobe:='0';
						cont<=6;
						end if;
			   	END IF;
			END IF;
         IF seg'EVENT AND seg = '1' THEN
					if sobe='0' then
					cont<=cont-1;
						if cont=0 then
						sobe:='1';
						cont<=1;
						end if;
					END IF;
    		END IF;
		ledr <= "00000000";
		ledr(cont) <= Entrada;
 END PROCESS;
end architecture funcao;
