--Faça um contador de 10 bits, que mostre o resultado em
--binário nos LEDs LEDR[0-9].
--▪ Utilize a saída de 8 MHz do PLL como frequência de entrada,
--e 10 Hz no contador.
--▪ Para converter de integer para std_logic_vector, pode-se utilizar a
--função:
--▪ Saida<=std_logic_vector(to_unsigned(INTEGER,TAMANHO_VETOR))
--• Para utilizar essa função, adicione a biblioteca:
--– use ieee.numeric_std.all;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
---------------
ENTITY PLL_1 IS
PORT (CLOCK_50 : IN std_logic; --Clock de 50 MHz da DE1
                LEDR : OUT std_logic_vector(9 downto 0));
END ENTITY;
---------------
ARCHITECTURE comportamento OF PLL_1 IS

SIGNAL locked_sig : STD_LOGIC;
SIGNAL clock_8MHz : STD_LOGIC;
SIGNAL counter : INTEGER RANGE 0 to 400000 := 0;
SIGNAL result : INTEGER RANGE 0 to 1023 := 0;

COMPONENT PLL_1_IPCatalog IS
	PORT
	(
		refclock   : in  std_logic := '0';
		rst        : in  std_logic := '0';
		outclock_0 : out std_logic;
		locked     : out std_logic);
END COMPONENT PLL_1_IPCatalog;

BEGIN
------------ PLL
pll_inst : PLL_1_IPCatalog PORT MAP (rst => '0',
				refclock => CLOCK_50,
				outclock_0 => clock_8MHz,
				locked => locked_sig);

------------ DIVISOR
	LEDR<= std_logic_vector(to_unsigned(result,10));
	PROCESS (clock_8MHz, locked_sig)
	BEGIN
		IF (locked_sig = '1') THEN
			IF (RISING_EDGE(clock_8MHz)) THEN
				counter <= counter + 1;
				IF counter = 400000 THEN
					counter <= 0;
				END IF;
				
				IF (counter=0) THEN
					IF (result<1023) THEN
						result <= result +1;
					ELSE
						result <=0;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;
