-- Nome Projeto: Trabalho 5
-- Data: 22/06/23
-- Nome: Marcos Vinicius Rocha da Silva / 2159678
--       Felipe Moreira da Silva / 1992791


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity semaforo is
	port(
        CLOCK_50: in std_logic;
        SW : in  std_logic_vector(0 to 0); -- desativar os semáforos 
		  
		   --S1 – LEDR [2-0] S2 – LEDR [6-4] S3 – LEDR [9-8]
        LEDR : out std_logic_vector (9 downto 0);
        HEX0: out std_logic_vector (6 downto 0)
	 );
end semaforo;
-------------------------------------------------------------------
architecture funcionamento of semaforo is
--Q0: S1>=Verde S2=Vermelho S3 Verde Count<=9 8s
--Q1: S1>=Amarelo S2=Vermelho S3 Verde        2s
--Q2: S1>=Vermelho S2=Vermelho S3 Vermelho    1s
--Q3: S1>=Vermelho S2=Verde S3 Vermelho       8s
--Q4: S1>=Vermelho S2=Amarelo S3 Vermelho     2s
--Q5: S1>=Vermelho S2=Vermelho S3 Vermelho    1s
--Q6: S1>=Amarelo S2=Amarelo S3 Desligado  Todo mundo pisca a cada 2S;



type state_type is (Q0, Q1, Q2, Q3, Q4, Q5, Q6);
signal estado : state_type := Q0;

signal countdown : integer range -1 to 9 := -1;
signal acende : BOOLEAN ;
 
	 
signal seg: integer range 0 to 50000000 := 0;

begin

--PROCESSO DE CONTROLE DE ESTADO

processo_estados : process(CLOCK_50)
 

variable aguarda : integer range 0 to 10 := 0; 
variable segundo : integer range 0 to 60 := 0;  
begin


	if rising_edge(CLOCK_50) then
		if SW(0) = '1' then
			estado <= Q6;
			aguarda := 0;
			countdown <= -1;
		end if;
	
		if seg = 50000000 then
			
			if  segundo >= aguarda then
				segundo := 0;
				
				case estado is
					when Q0 => 
						aguarda := 2;
						estado <= Q1;

					when Q1 =>  
						aguarda := 1;
						estado <= Q2;

					when Q2 =>  
						aguarda := 8;
						estado <= Q3;

					when Q3 =>  
						aguarda := 2;
						estado <= Q4;

					when Q4 =>  
						aguarda := 1;
						estado <= Q5;

					when Q5 =>  
						aguarda := 8;
						countdown <= 9;
						estado <= Q0;

					when Q6 =>
					if SW(0) = '0' then
							aguarda := 8;
							countdown <= 9;
							estado <= Q0;	
					else

						acende <= not acende;
						estado <= Q6;
						
					end if;
				end case;
			end if;
			
		
			seg <= 0;
			
			segundo := segundo + 1;
			
			if countdown >= 0 then
				countdown <= countdown -1;
			end if;
			
		else
			seg <= seg+1;
			
		end if;

	end if;


		-------MAQUINA DE ESTADOS-------------
end process;





--PROCESSO DE CONTROLE DE SAÍDA
process (estado)
begin
	case estado is
		when Q0 => 
			LEDR(2 downto 0) <="001"; --Verde
			LEDR(6 downto 4) <="100"; --Vermelho
			LEDR(9 downto 8) <="01";  --Verde
		when Q1 => 
			LEDR(2 downto 0) <="010"; --Amarelo
			LEDR(6 downto 4) <="100"; --Vermelho
			LEDR(9 downto 8) <="01";  --Verde
			
		when Q2 =>
			LEDR(2 downto 0) <="100"; --Vermelho
			LEDR(6 downto 4) <="100"; --Vermelho
			LEDR(9 downto 8) <="10";  --Vermelho
			
		when Q3 => 
			LEDR(2 downto 0) <="100"; --Vermelho
			LEDR(6 downto 4) <="001"; --Verde
			LEDR(9 downto 8) <="10";  --Vermelho

			
		when Q4 => 
			LEDR(2 downto 0) <="100"; --Vermelho
			LEDR(6 downto 4) <="010"; --Amarelo
			LEDR(9 downto 8) <="10";  --Vermelho
			
		when Q5 => 
			LEDR(2 downto 0) <="100"; --Vermelho
			LEDR(6 downto 4) <="100"; --Vermelho
			LEDR(9 downto 8) <="10";  --Vermelho
			
		when Q6 =>
				--fazer magina para piscar
			if acende then
				
				LEDR(2 downto 0) <="010"; --Vermelho
				LEDR(6 downto 4) <="010"; --Vermelho
				LEDR(9 downto 8) <="00";  --Vermelho
			else
				LEDR(2 downto 0) <="000"; --Vermelho
				LEDR(6 downto 4) <="000"; --Vermelho
				LEDR(9 downto 8) <="00";  --Vermelho
			end if;
			
	end case;

end process;


process (countdown)
begin
  case countdown is
		when 0 => HEX0 <= "1000000"; -- 0
		when 1 => HEX0 <= "1111001"; -- 1
		when 2 => HEX0 <= "0100100"; -- 2
		when 3 => HEX0 <= "0110000"; -- 3
		when 4 => HEX0 <= "0011001"; -- 4
		when 5 => HEX0 <= "0010010"; -- 5
		when 6 => HEX0 <= "0000010"; -- 6
		when 7 => HEX0 <= "1011000"; -- 7
		when 8 => HEX0 <= "0000000"; -- 8
		when 9 => HEX0 <= "0010000"; -- 9
		when others => HEX0 <= "1111111"; -- Apaga
  end case;
end process;

end funcionamento;