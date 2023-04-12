LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Exercicio_3 IS
	PORT (	A, B : IN INTEGER RANGE 0 to 7;
				OPERACAO: IN std_logic_vector(0 to 1);
			   SAIDA: OUT INTEGER RANGE -7 to 63);
END Exercicio_3;

ARCHITECTURE logica OF Exercicio_3 IS
BEGIN
	PROCESS (A, B, OPERACAO)
	BEGIN
		CASE OPERACAO IS 
			WHEN "00" => SAIDA <= A + B; --ADD
			WHEN "01" => SAIDA <= A - B; --SUB
			WHEN "10" => SAIDA <= A * B; --MULT
			WHEN "11" => SAIDA <= A / B; --DIV
		END case;
	END PROCESS;
END logica;