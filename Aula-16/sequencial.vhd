--Exercício 1: Faça o projeto de um shift register de 8 bits, sendo que o bit a ser deslocado
--(ida e volta) tenha o efeito fade-in / fade-out. Usar o arquivo disponível no MOODLE para
--o efeito fade-in / fade-out (PWM).

--Faça o arquivo referente ao sequencial. O tempo de troca entre um bit e outro é de 1
--segundo. O bit de do bit 0 ao 7 e depois voltar, e assim sucessivamente.

--Funcionamento do exercício: O shift register terá o funcionamento padrão, porém, ao
--invés de associar nível lógico ‘1’ no bit de deslocamento, será associada a variável de
--saída ‘LED’ do bloco pwm1, que dará o efeito desejado aos LEDs.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sequencial IS
PORT (clk, Entrada: IN STD_LOGIC;
		LEDR: OUT STD_LOGIC_vector(7 downto 0));
END sequencial;

ARCHITECTURE comportamento OF sequencial IS
	signal ledr_delay : NATURAL range 0 to 50000000; -- duty cicle
	signal seg : STD_LOGIC;
	signal cont : NATURAL;
 
begin
	process(clk)
	VARIABLE ledr_reg : STD_LOGIC;
		begin
		 IF rising_edge(clk) THEN  
			 ledr_delay <= ledr_delay + 1;   
			 if ledr_delay = 25000000 then   
				ledr_delay <= 0;   
				ledr_reg := not ledr_reg; 
			 end if;	 

		 seg<=ledr_reg;
		 end if;
	end process;

	process(clk) 
		VARIABLE sobe: std_logic;
	begin
	
		if rising_edge(seg) then   
			if sobe='1' then
				cont <= cont+1;
				if cont=7 then
					sobe := '0';
					cont <= 6;
				end if;
			else
				cont<= cont -1 ;
				if cont=0 then
					sobe :='1';
					cont <= 1;
				end if;
			end if;
		end if;
		ledr <= "00000000";
		ledr(cont) <= Entrada;
	end process; 
  
 End comportamento;