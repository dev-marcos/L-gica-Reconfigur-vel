--Exercício 1: Implemente a ULA vista na aula 10 utilizando
--PROCEDURE com PACKAGE.

--Projete e simule uma ULA (unidade lógica aritmética) que faça as 4 operações
--básicas. As entradas devem variar até 7. Utilize a tabela abaixo:

--.---------------.
--|Operação|Código|
--|--------|------|
--|  ADD   |  00  |
--|  SUB   |  01  |
--|  MULT  |  10  |
--|  DIV   |  11  |
--|________|______|



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.package_ULA.all;
-----------------------

ENTITY ULA IS
	PORT (	A, B : IN INTEGER RANGE 0 to 7;
				OPERACAO: IN std_logic_vector(0 to 1);
			   SAIDA: OUT INTEGER RANGE -7 to 63);
END ULA;
----------------------

ARCHITECTURE logica OF ULA IS
BEGIN
	--chamada da PROCEDURE
	ULA_CORE(A, B, OPERACAO, SAIDA);
	
END logica;