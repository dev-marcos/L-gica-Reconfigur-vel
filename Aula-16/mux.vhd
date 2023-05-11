library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( SEL : in  STD_LOGIC;
           A, EN   : in  STD_LOGIC;
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           X   : out STD_LOGIC_VECTOR (7 downto 0));
end mux;

architecture funcao of mux is
Signal A1: std_logic_vector(7 downto 0);
begin
	process (A)
	Begin
	for i in A1'range loop
		A1(i)<=A;
	END LOOP;
	END PROCESS;

	X <= A1 WHEN EN='1' AND SEL='1' ELSE 
		  B  WHEN EN='1' AND SEL='0' ELSE
		  "00000000";
end funcao;