ENTITY testbench3 IS END;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ARCHITECTURE tb_dec2para4 OF testbench3 IS
    COMPONENT dec2para4
        PORT (
            a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR (0 TO 3));
    END COMPONENT;
    SIGNAL a_0 : STD_LOGIC := '0';
    SIGNAL a_1 : STD_LOGIC := '0';
BEGIN
    decodificador : dec2para4 PORT MAP(a(0) => a_0, a(1) => a_1);
    estimulo : PROCESS
    BEGIN
        WAIT FOR 40ns;
        a_0 <= NOT a_0;
        WAIT FOR 40ns;
        a_0 <= NOT a_0;
        a_1 <= NOT a_1;
    END PROCESS estimulo;
END tb_dec2para4;