LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY dec2para4 IS
    PORT (
        a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR (0 TO 3));
END dec2para4;
ARCHITECTURE funcao OF dec2para4 IS
BEGIN
    PROCESS (a)
    BEGIN
        CASE a IS
            WHEN "00" => y <= "1000";
            WHEN "01" => y <= "0100";
            WHEN "10" => y <= "0010";
            WHEN OTHERS => y <= "0001";
        END CASE;
    END PROCESS;
END funcao;