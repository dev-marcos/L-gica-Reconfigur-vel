--Exercício 1: Faça um código que some as entradas A e B
--(variando de 0 a 7) e retorne o resultado na saída C. Utilize
--FUNCTION com PACKAGE.

--- CODIGO PRINCIPAL
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.add_package.all;

ENTITY funcao_ADD IS
	PORT ( A, B: IN INTEGER RANGE 0 TO 7;
		C: OUT INTEGER RANGE 0 TO 15);
END funcao_ADD;

ARCHITECTURE comportamento OF funcao_ADD IS
BEGIN
	C<=ADD(A,B) ;
END comportamento;