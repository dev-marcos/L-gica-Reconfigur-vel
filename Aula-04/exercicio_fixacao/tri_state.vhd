LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY tri_state IS
	PORT (input, ena : IN STD_LOGIC;
	      output: OUT STD_LOGIC);
END tri_state;

ARCHITECTURE logica OF tri_state IS
BEGIN
	output <= input WHEN ena='1' ELSE 'Z';
END logica;