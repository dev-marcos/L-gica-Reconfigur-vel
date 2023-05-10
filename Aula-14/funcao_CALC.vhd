--Exercício 2: Faça um código com 2 package com a função CALC,
--sendo que na package 1 ela faça a soma (PORT de saída C), e na
--package 2 faça a subtração (PORT de saída D).

---CÓDIGO PRINCIPAL

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE work.my_package.all; 
USE work.my_package_2.all; 

ENTITY funcao_CALC IS 
	PORT ( A, B: IN INTEGER RANGE 0 TO 7; 
		C, D: OUT INTEGER RANGE 0 TO 15); 
END funcao_CALC; 

ARCHITECTURE comportamento OF funcao_CALC IS 
BEGIN 
	PROCESS (A,B) 
	BEGIN 
		C<=work.my_package.CALC(A,B); -- SOMA 
		D<=work.my_package_2.CALC(A,B); --SUBTRAÇÃO
	END PROCESS; 
END comportamento; 
