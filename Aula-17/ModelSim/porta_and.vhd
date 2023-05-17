LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY porta_and IS
    PORT (in1 : IN std_logic;
        in2 : IN std_logic;
        saida : OUT std_logic);
END porta_and;

ARCHITECTURE logica OF porta_and IS
BEGIN
    saida<=IN1 AND IN2;
END logica;
