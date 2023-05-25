-- Nome Projeto: Trabalho 4
-- Data: 25/05/23
-- Nome: Marcos Vinicius Rocha da Silva / 2159678
--       Felipe Moreira da Silva / 1992791


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_package.all;


ENTITY Trabalho_4 IS
  PORT (
    SW : IN std_logic_vector(3 downto 0);
    LEDR : OUT std_logic_vector(3 downto 0)
  );
END ENTITY;

ARCHITECTURE funcao OF Trabalho_4 IS
BEGIN
--              EN,    SEL,       AX,   Saida     
	conversor(SW(3), SW(2), SW(1 downto 0), LEDR);
end funcao;
