-- Nome Projeto: Trabalho 1
-- Data: 30/03/2023
-- Nome: Marcos Vinicius Rocha da Silva/2159678
--       Felipe Moreira da Silva/1992791

LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Trabalho_1 IS
PORT (
		SW : IN std_logic_vector(5 downto 0); --Input de SW
	 HEX0 : OUT std_logic_vector(0 to 6)); --Saida para Display 7 Segmentos
END Trabalho_1;
ARCHITECTURE logica OF Trabalho_1 IS
SIGNAL bin, gray : std_logic_vector(0 to 6); --Armazena conversao de binario e gray
BEGIN
	WITH SW(5 downto 2) SELECT --trabalhando com a entrada de dados e convertendo para Binario
	 bin <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "0110000" when others;
			  
			  
	WITH SW(5 downto 2) SELECT --trabalhando com a entrada de dados e convertendo para Gray		  
	gray <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0011",
			  "0000110" when "0010",
			  "1001100" when "0110",
			  "0100100" when "0111",
			  "0100000" when "0101",
			  "0001111" when "0100",
			  "0000000" when "1100",
			  "0000100" when "1101",
			  "0110000" when others;		  
			 	

		HEX0 <= bin WHEN SW(1) = '0' AND SW(0) = '1' ELSE --Caso seja binario
				 gray WHEN SW(1) = '1' AND SW(0) = '1' ELSE --Caso seja Gray
				 "1111111"; --Caso o Enable Seja igual a 0

END logica;