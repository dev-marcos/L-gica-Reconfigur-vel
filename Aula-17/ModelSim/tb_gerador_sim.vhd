
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY testbench2 IS END;

ARCHITECTURE tb_gerador_sim OF testbench2 IS
    COMPONENT gerador_sim
        PORT (
            sig1, sig2, y : IN STD_LOGIC;
            x : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL sig_1, sig_2, y_1 : STD_LOGIC;
BEGIN
    funcao : gerador_sim PORT MAP(
        sig1 => sig_1,
        sig2 => sig_2, y => y_1, x => OPEN);

    PROCESS
    BEGIN
        --signal sig1:--
        sig_1 <= '1';
        WAIT FOR 25 ns;
        sig_1 <= '0';
        WAIT FOR 50 ns;
    END PROCESS;

    PROCESS
    BEGIN
        --signal sig2:--
        sig_2 <= '1';
        WAIT FOR 25 ns;
        sig_2 <= '0';
        WAIT FOR 50 ns;
        sig_2 <= '1';
        WAIT FOR 25 ns;
        sig_2 <= '0';
        WAIT FOR 25 ns;
        sig_2 <= '1';
        WAIT FOR 50 ns;
        sig_2 <= '0';
        WAIT FOR 25 ns;
    END PROCESS;

    PROCESS
    BEGIN
        --signal y:--
        y_1 <= '1';
        WAIT FOR 20 ns;
        y_1 <= '0';
        WAIT FOR 10 ns;
        y_1 <= '1';
        WAIT FOR 10 ns;
        y_1 <= '0';
        WAIT FOR 40 ns;
    END PROCESS;
END tb_gerador_sim;