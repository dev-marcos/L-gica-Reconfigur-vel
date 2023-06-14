--Faça um código (reutilize exercício 3 da aula passada) que tenha saída
--para 2 motores de passo sendo que cada motor gire em sentidos
--opostos, e que seus passos possuam 0,5 segundo de atraso entre os
--motores. Utilize LED [4-7] para o segundo motor.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Exercicio_3 is
port(clk, dir: in std_logic;
	LED: OUT std_logic_vector(0 TO 3);
	LED2: OUT std_logic_vector(0 TO 3));
end Exercicio_3;
-------------------------------------------------------------------
architecture funcionamento of Exercicio_3 is
type estados_type is (S0, S1, S2, S3);
signal estado: estados_type := S0;
signal seg: integer range 0 to 100000000 := 0;

begin
--PROCESSO DE CONTROLE DE ESTADO
 processo_estados : process(clk)
 begin
	if clk'event and clk= '1' then
		if seg = 100000000 then
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
saida_led : process (estado, seg)
begin

	if seg = 25000000 then

		case estado is
			when s0 => LED <="0001";
			when s1 => LED <="0010";
			when s2 => LED <="0100";
			when s3 => LED <="1000";
		end case;
	end if;
	
	case estado is
		when s0 => LED2 <="1000";
		when s1 => LED2 <="0100";
		when s2 => LED2 <="0010";
		when s3 => LED2 <="0001";
	end case;
	
end process;

end funcionamento;