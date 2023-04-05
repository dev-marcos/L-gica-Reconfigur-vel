LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_4 IS
	PORT (A0 : IN std_logic;
			A1 : IN std_logic;
			D0 : OUT std_logic;
			D1 : OUT std_logic;
			D2 : OUT std_logic;
			D3 : OUT std_logic);
END exercicio_4;

ARCHITECTURE logica OF exercicio_4 IS
BEGIN
	
	D0 <= (NOT A0) AND (NOT A1);
	D1 <= A0 AND (NOT A1);
	D2 <= (NOT A0) AND A1;
	D3 <= A0 AND A1;
END logica;