
------------- PACKAGE package_calculadora.vhd ---------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE package_calculadora IS
	FUNCTION SOMA(ENTRADA_F1, ENTRADA_F2: INTEGER) RETURN INTEGER;
	
	PROCEDURE calculadora(SIGNAL ENTRADA_1, ENTRADA_2: IN INTEGER; SIGNAL ENTRADA_3 : IN STD_LOGIC;
										 SIGNAL SAIDA_1 : OUT INTEGER);
	
end package_calculadora;

----------------------------------------------------------------------------------------------------
PACKAGE BODY package_calculadora IS

	FUNCTION SOMA (ENTRADA_F1, ENTRADA_F2: INTEGER) RETURN INTEGER IS
	
	BEGIN
		RETURN ENTRADA_F1 + ENTRADA_F2;
	END SOMA;
	
	
	PROCEDURE calculadora(SIGNAL ENTRADA_1, ENTRADA_2: IN INTEGER; SIGNAL ENTRADA_3 : IN STD_LOGIC;
										 SIGNAL SAIDA_1 : OUT INTEGER) IS
	BEGIN
		
		IF (ENTRADA_3 = '1') THEN
		   -- Executa a FUNCTION SOMA
			SAIDA_1 <= SOMA(ENTRADA_1, ENTRADA_2);
		ELSE 
			SAIDA_1 <= ENTRADA_1 * ENTRADA_2;
		END IF;
		
	END calculadora;
	
END package_calculadora;