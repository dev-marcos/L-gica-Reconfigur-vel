LIBRARY ieee;
USE ieee.std_logic_1164.all;

---------------------------------------
ENTITY flipflop IS
	PORT ( d, clk, rst: IN STD_LOGIC_VECTOR(2 downto 0);
				q: OUT STD_LOGIC_VECTOR(2 downto 0));
END flipflop;
---------------------------------------
ARCHITECTURE funcao OF flipflop IS
BEGIN
	PROCESS (rst, clk)
	BEGIN
		flip: FOR i IN d'RANGE LOOP
			IF (rst(i)='1') THEN
				q(i) <= '0';
			ELSIF (clk(i)'EVENT AND clk(i)='1') THEN
				q(i) <= d(i);
			END IF;
		END LOOP;
	END PROCESS;
END funcao;
