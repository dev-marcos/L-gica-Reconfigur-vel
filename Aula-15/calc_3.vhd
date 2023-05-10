----------------------------------------------------
-- Código top-level calc_3.vhd

--Exercício 3: Refaça a calculadora do exemplo 2 (arquivos originais no
--moodle) da seguinte forma:
--▪ SW(2 downto 0) para a entrada A;
--▪ SW(5 downto 3) para a entrada B;
--▪ SW(6) para a entrada SEL;
--▪ HEX3 para apresentar a entrada A;
--▪ HEX2 para apresentar a entrada B;
--▪ HEX0 e HEX 1 para apresentar a saída;
--Caso precisem converter de binário para inteiro:
--• USE ieee.numeric_std.all;
--• to_integer(unsigned(VALOR BINARIO));
--Procedure para separar o display no moodle.

----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USE work.package_calculadora_3.all;


------------------------------------------------------------------------------------------------------------------------------------------------------------
ENTITY calc_3 IS
	PORT(SW : IN STD_LOGIC_VECTOR(6 downto 0); --SW 012 A; SW 345 B; SW 6 SEL;	
	     HEX0: OUT STD_LOGIC_VECTOR(6 downto 0);
        HEX1: OUT STD_LOGIC_VECTOR(6 downto 0);
        HEX2: OUT STD_LOGIC_VECTOR(6 downto 0);
        HEX3: OUT STD_LOGIC_VECTOR(6 downto 0));
END calc_3;

------------------------------------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE logic of calc_3 IS
Signal A, B : INTEGER RANGE 0 TO 7;
Signal OUTPUT : INTEGER RANGE 0 TO 63;
Signal unidade, dezena, centena, milhar: INTEGER RANGE 0 TO 15;
BEGIN
	PROCESS(SW)
	Begin
	A <= to_integer(unsigned(SW(2 downto 0)));
	B <= to_integer(unsigned(SW(5 downto 3)));
	inteiroparasegmentos(B, HEX3);
	inteiroparasegmentos(A, HEX2);
	calculadora(A, B, SW(6), OUTPUT);
	separar_display(OUTPUT, unidade, dezena, centena, milhar);
	inteiroparasegmentos(unidade, HEX0);
   inteiroparasegmentos(dezena, HEX1);
	
	END PROCESS;
END logic;
------------------------------------------------------------------------------------------------------------------------------------------------------------

