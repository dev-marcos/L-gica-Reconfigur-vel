
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY gerador_sim IS
PORT (sig1, sig2, y : IN std_logic;
                x : OUT std_logic);
END gerador_sim;
ARCHITECTURE logica OF gerador_sim IS
BEGIN
    WITH y SELECT x <= sig1 xor sig2 when '0',
                       sig1 xnor sig2 when
    others;
END ARCHITECTURE;
