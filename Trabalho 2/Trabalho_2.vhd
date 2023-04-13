-- Nome Projeto: Trabalho 2
-- Data: 13/04/23
-- Nome: Marcos Vinicius Rocha da Silva / 2159678
--       Felipe Moreira da Silva / 1992791

LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Trabalho_2 IS
GENERIC(N : INTEGER :=7); -- N bits 
PORT (
		SW : IN std_logic_vector(9 downto 7-N); -- Input -> SW(6-0) | CLR -> SW(7) | CARG -> SW(8) | EN -> SW(9)
		KEY: IN std_logic_vector (0 downto 0);-- Botao de Clock	
	  LEDR: OUT std_logic_vector(6 downto 7-N)); --Saida para LED
END Trabalho_2;
ARCHITECTURE logica OF Trabalho_2 IS
	SIGNAL SAIDA : std_logic_vector(6 downto 7-N);
BEGIN

	GEN1: FOR i IN 6 DOWNTO (7-N) GENERATE --Generate para percorrer N Bits
	
		PROCESS(KEY(0), SW(7), SW(9)) 
		BEGIN 
			--Caso o Clock esteja na borda de Subida e a Carga ativa
			IF (KEY(0) = '1' and KEY(0)'event and SW(8) = '1') then  
				SAIDA(i) <= SW(i);  --Saida do LED recebe a Entrada
			END IF;
			
			IF (SW(7) = '1') then -- Verifica se o Clear está Ativo
				SAIDA(i) <= '0';

			END IF;
			
			IF (SW(9) = '1') then    -- Verifica o estado do ENABLE	
				LEDR(i) <= SAIDA(i);  -- LED recebe a Saida
			ELSE 
				LEDR(i) <= 'Z';       -- Deixa em Alta Impedancia
			END IF;
		END PROCESS;
	END GENERATE GEN1;
END logica;
