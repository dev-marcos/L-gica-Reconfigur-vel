-- Nome Projeto: Trabalho 3
-- Data: 03/05/23
-- Nome: Marcos Vinicius Rocha da Silva / 2159678
--       Felipe Moreira da Silva / 1992791

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY display is
  PORT (
    valor : in integer range 0 to 9;
    segmentos : out std_logic_vector(0 to 6)
  );
END ENTITY;

ARCHITECTURE logica OF display IS
  

BEGIN
    -- Conversão do valor para segmentos do display
	WITH valor SELECT
   	segmentos <="0000001" when 0,  -- 0
						"1001111" when 1,  -- 1
						"0010010" when 2,  -- 2
						"0000110" when 3,  -- 3
						"1001100" when 4,  -- 4
						"0100100" when 5,  -- 5
						"0100000" when 6,  -- 6
						"0001111" when 7,  -- 7
						"0000000" when 8,  -- 8
						"0000100" when 9,  -- 9
						"0110000" when others;-- E 


end logica;
