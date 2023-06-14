--A partir do exercício 3 (motor de passos) da aula passada, adicione um
--sinal de alerta ao final de cada passo completo do motor quando o
--mesmo estiver girando em sentido horário. Use clock 50MHz para clk
--(0,5 Hz), e DIP [0] para direção. Como saída para o motor use LED [0-3]
--e como alerta, o LED[7].

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Exercicio_2 is
port(clk, dir: in std_logic;
	LED: OUT std_logic_vector(0 TO 3);
	SINAL: OUT std_logic);
end Exercicio_2;
-------------------------------------------------------------------
architecture funcionamento of Exercicio_2 is
type estados_type is (S0, S1, S2, S3);
signal estado: estados_type := S0;
signal seg: integer range 0 to 100000000 := 0;

begin
--PROCESSO DE CONTROLE DE ESTADO
 processo_estados : process(clk)
 begin
	if clk'event and clk= '1' then
		if seg = 10000000 then
		-------MAQUINA DE ESTADOS--------------
			case estado is
				when S0 => if dir = '1' then
				estado <= S1; else estado <= S3;
				end if;
				when S1 => if dir = '1' then
				estado <= S2; else estado <= S0;
				end if;
				when S2 => if dir = '1' then
				estado <= S3; else estado <= S1;
				end if;
				when S3 => if dir = '1' then
				estado <= S0; else estado <= S2;
				end if;
		end case;
		---------------------------------------
			seg <= 0;
		else
			seg <= seg+1;
		end if;
	end if;
end process;

--PROCESSO DE CONTROLE DE SAÍDA
saida_led : process (estado, dir)
begin
	case estado is
		when s0 => LED <="0001";
		when s1 => LED <="0010";
		when s2 => LED <="0100";
		when s3 => LED <="1000";
	end case;
	
	if dir = '1' and estado = s3 then
		SINAL <= '1';
	else 
		SINAL <= '0';
	end if;
end process;

end funcionamento;