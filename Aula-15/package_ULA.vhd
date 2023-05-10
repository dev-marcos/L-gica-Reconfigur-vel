----------------PACKAGE----------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE package_ULA IS

	PROCEDURE ULA_CORE(SIGNAL A, B: IN INTEGER;
							 SIGNAL OPERACAO: IN STD_LOGIC_VECTOR;
							 SIGNAL SAIDA: OUT INTEGER);
END package_ULA;

PACKAGE BODY package_ULA IS
	PROCEDURE ULA_CORE(SIGNAL A, B: IN INTEGER;
							 SIGNAL OPERACAO: IN STD_LOGIC_VECTOR;
							 SIGNAL SAIDA: OUT INTEGER) IS
	BEGIN
		CASE OPERACAO IS 
			WHEN "00" => SAIDA <= A + B; --ADD
			WHEN "01" => SAIDA <= A - B; --SUB
			WHEN "10" => SAIDA <= A * B; --MULT
			WHEN "11" => SAIDA <= A / B; --DIV
		END case;
	END ULA_CORE;
END package_ULA;