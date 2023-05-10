LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY conv_contador_dec_debounce IS
GENERIC(
    clk_freq    : NATURAL := 50000000;  -- Clock utilizado na FPGA em Hz
    debounce_ms : NATURAL := 300);      -- tempo em que o sinal deve ficar estável

PORT (KEY: IN std_logic_vector(0 downto 0);
		HEX0: OUT std_logic_vector(6 downto 0);
		CLOCK_50 : IN  STD_LOGIC);  -- entrada de clock
END conv_contador_dec_debounce;

ARCHITECTURE logica OF conv_contador_dec_debounce IS

SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); -- flip-flops de entrada
SIGNAL counter_set : STD_LOGIC;                    -- comparação dos FF (xor)
SIGNAL saida_b     : STD_LOGIC;

BEGIN

	PROCESS(saida_b)
	--Se colocar o range 0 to 10, ele vai reiniciar em 15 também
	variable contador : integer range 0 to 15 := 0;
	BEGIN
		if (saida_b='0' and saida_b'event) then
			CASE contador IS
				WHEN 0 => HEX0 <= "1000000";
				WHEN 1 => HEX0 <= "1111001";
				WHEN 2 => HEX0 <= "0100100";
				WHEN 3 => HEX0 <= "0110000";
				WHEN 4 => HEX0 <= "0011001";
				WHEN 5 => HEX0 <= "0010010";
				WHEN 6 => HEX0 <= "0000010";
				WHEN 7 => HEX0 <= "1111000";
				WHEN 8 => HEX0 <= "0000000";
				WHEN 9 => HEX0 <= "0010000";
				WHEN OTHERS => HEX0 <= "0000110";
			END CASE;
		contador:=contador+1;
		end if;
	END PROCESS;

counter_set <= flipflops(0) xor flipflops(1);  -- Determina se houve mudança na entrada
  
  PROCESS(CLOCK_50)
  VARIABLE count :  NATURAL RANGE 0 TO ((clk_freq/1000) * debounce_ms);  -- tempo de contagem (ciclos)
  BEGIN
    IF(CLOCK_50'EVENT and CLOCK_50 = '1') THEN           		
      flipflops(0) <= KEY(0);                      	
      flipflops(1) <= flipflops(0);                
		count := count + 1;
			If(counter_set = '1') THEN                -- se a entrada mudar, reseta a contagem
				count := 0;                            
				ELSIF(count >= ((clk_freq/1000) * debounce_ms)) THEN  -- se a contagem for maior que o debounce, ativa a saida
				saida_b <= flipflops(1);
				count := 0;
			END IF;
    END IF;
  END PROCESS;

END logica;

