LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY exercicio_1 IS
	PORT (IN1 : IN std_logic;
			IN2 : IN std_logic;
			IN3 : IN std_logic;
		SAIDA1 : OUT std_logic;
		SAIDA2 : OUT std_logic;
		SAIDA3 : OUT std_logic);
END exercicio_1;

ARCHITECTURE logica OF exercicio_1 IS
SIGNAL X : std_logic;
BEGIN
	X <= (IN1 XOR IN2);
	SAIDA1<= (IN1 AND IN2) OR IN3;
	SAIDA2<= X AND (NOT IN3);
	SAIDA3<= X;
END logica;