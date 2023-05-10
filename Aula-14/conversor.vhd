--Exercício 3: Escreva um código em VHDL com uma função
--capaz de converter um valor INTEGER (0 a 15) em um valor
--STD_LOGIC_VECTOR, chamada conv_std_logic( )

ENTITY conversor IS
PORT (input: IN INTEGER RANGE 0 TO 15;
		output: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END conversor;
ARCHITECTURE comportamento OF conversor IS
	FUNCTION conv_std_logic (inp: INTEGER) RETURN STD_LOGIC_VECTOR IS
		VARIABLE temp : INTEGER RANGE 0 TO 15;
		VARIABLE resultado: STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
		temp := inp;
		
		FOR i IN 3 DOWNTO 0 LOOP
			IF(temp >= 2**i) THEN
				resultado(i) := '1';
				temp := temp - 2**i;
			ELSE
				resultado(i) := '0';
			END IF;
		END LOOP;
		
		RETURN resultado;
	END conv_std_logic;
BEGIN
	output<= conv_std_logic(input);
END comportamento;
