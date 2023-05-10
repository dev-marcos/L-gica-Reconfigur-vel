--Exemplo 2: Faça uma calculadora com as operações:
--• Soma (function), quando SEL = ‘1’;
--• Multiplicação (procedure), quando SEL = ‘0’;


----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USE work.package_calculadora.all;


------------------------------------------------------------------------------------------------------------------------------------------------------------
ENTITY calc IS
	PORT(A, B : IN INTEGER RANGE 0 TO 7;
		  SEL : IN std_logic;
		  OUTPUT : OUT INTEGER RANGE 0 TO 63);
END calc;

------------------------------------------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE logic of calc IS
BEGIN
	calculadora(A, B, SEL, OUTPUT);
END logic;
------------------------------------------------------------------------------------------------------------------------------------------------------------

