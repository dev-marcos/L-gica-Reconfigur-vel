
------------- PACKAGE package_calculadora_3.vhd ---------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE package_calculadora_3 IS
	PROCEDURE calculadora(SIGNAL ENTRADA_1, ENTRADA_2: IN INTEGER; SIGNAL ENTRADA_3 : IN STD_LOGIC;
										 SIGNAL SAIDA_1 : OUT INTEGER);
										 
   PROCEDURE separar_display (SIGNAL inteiro: IN INTEGER; SIGNAL unidade, dezena, centena, milhar: OUT INTEGER RANGE 0 TO 15);										
										 
   PROCEDURE inteiroparasegmentos (SIGNAL bs: IN INTEGER; SIGNAL dsp: OUT STD_LOGIC_VECTOR);
	
	FUNCTION SOMA(ENTRADA_F1, ENTRADA_F2: INTEGER) RETURN INTEGER;
end package_calculadora_3;

----------------------------------------------------------------------------------------------------
PACKAGE BODY package_calculadora_3 IS

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
	
PROCEDURE inteiroparasegmentos (SIGNAL bs: IN INTEGER; SIGNAL dsp: OUT STD_LOGIC_VECTOR) IS
	BEGIN
	CASE bs IS
	 WHEN 0 => dsp <= "1000000"; --0
	 WHEN 1 => dsp <= "1111001"; --1
	 WHEN 2 => dsp <= "0100100"; --2
	 WHEN 3 => dsp <= "0110000"; --3
	 WHEN 4 => dsp <= "0011001"; --4
	 WHEN 5 => dsp <= "0010010"; --5
	 WHEN 6 => dsp <= "0000010"; --6
	 WHEN 7 => dsp <= "1111000"; --7
	 WHEN 8 => dsp <= "0000000"; --8
	 WHEN 9 => dsp <= "0010000"; --9
	 WHEN OTHERS => dsp <= "0000000";
	END CASE;
END inteiroparasegmentos;

PROCEDURE separar_display (SIGNAL inteiro: IN INTEGER; SIGNAL unidade, dezena, centena, milhar: OUT INTEGER RANGE 0 TO 15) IS

BEGIN

if inteiro>999 then
unidade <= inteiro mod 10;
dezena <= (inteiro/10) mod 10;
centena <= (inteiro/100) mod 10;
milhar <= inteiro/1000;
elsif inteiro>99 then
unidade <= inteiro mod 10;
dezena <= (inteiro/10) mod 10;
centena <= (inteiro/100) mod 10;
milhar <= 0;
elsif inteiro>9 then
unidade <= inteiro mod 10;
dezena <= (inteiro/10) mod 10;
centena <= 0;
milhar <= 0;
else
unidade <= inteiro;
dezena <= 0;
centena <= 0;
milhar <= 0;
End if;
END separar_display;	
	
END package_calculadora_3;
-----------------------------------------------------------------------------------------------------



