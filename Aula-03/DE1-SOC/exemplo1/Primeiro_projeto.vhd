LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Primeiro_projeto IS
PORT (SW : IN std_logic_vector(1 downto 0);
	 LEDR : OUT std_logic_vector(0 downto 0));
END Primeiro_projeto;
ARCHITECTURE logica OF Primeiro_projeto
IS
BEGIN
	LEDR(0) <= SW(1) AND SW(0);
END logica;