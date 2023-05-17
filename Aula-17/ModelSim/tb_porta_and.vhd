entity testbench1 is end;
library IEEE;
use IEEE.std_logic_1164.all;
architecture tb_porta_and of testbench1 is
component porta_and
    port(in1 : in std_logic;
        in2 : in std_logic;
        saida : out std_logic);
end component;
signal i_1 : std_logic;
signal i_2 : std_logic;
begin
    and1: porta_and port map (in1 => i_1, in2 => i_2, saida => open);
    estimulo : process
    begin
        wait for 5 ns; i_1<= '0'; i_2 <= '0';
        wait for 5 ns; i_1<= '1';
        wait for 5 ns; i_2<= '1';
        wait for 5 ns; i_1<= '0';
        wait;
    end process estimulo;
end tb_porta_and;
