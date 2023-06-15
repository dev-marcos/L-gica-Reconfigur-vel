--Faça o controle de um motor de passo com as seguintes especificações:
--▪ Chave seletora SW [2] para o sentido de rotação;
--▪ Chave seletora SW [1] para escolher entre velocidade alta (100Hz motor) e
--  velocidade baixa (1Hz LEDs);
--▪ Chave seletora SW [0] para escolher entre meio-passo e passo completo.
--▪ Ligue as saídas nos LEDR[0-3] e/ou em um motor de passo externo caso
----queira testar ( GPIO_1[0-3] ).

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Exercicio_1 is
port( CLOCK_50 : IN std_logic; --CLICK_50
	         SW : in std_logic_vector(3 downto 0); --rot(2), vel(1), passo(0)
	      GPIO_1: OUT std_logic_vector(0 TO 3); --MOTOR
	        LEDR: OUT std_logic_vector(0 TO 3));
end Exercicio_1;
-------------------------------------------------------------------
architecture funcionamento of Exercicio_1 is
type estados_type is (S0, S1, S2, S3);
signal estado: estados_type := S0;
signal seg: integer range 0 to 50000000 := 0;
signal contagem: integer range 0 to 50000000 := 0;
signal cont_passo: integer range 0 to 50000000;

begin
--PROCESSO DE CONTROLE DE VELOCIDADE
 velocidade : process (SW(1))
 begin
	if SW(1) = '0' then
		contagem <= 50000000; --1Hz
	else contagem <= 500000; --100Hz para o motor de passo
	end if;
 end process;
 
 --PROCESSO DE CONTROLE DE PASSO
 passo_ctrl : process (SW(0)) 
 begin
	if SW(0) = '0' then
		cont_passo<=contagem;
	else cont_passo<=contagem/2;
	end if;
 end process;
 
 --PROCESSO DE CONTROLE DE ESTADO
 processo_estados : process(CLOCK_50)
 begin
	if CLOCK_50'event and CLOCK_50= '1' then
		if seg = contagem then
			case estado is
				when S0 => if SW(2) = '1' then
				estado <= S1; else estado <= S3;
				end if;
				when S1 => if SW(2) = '1' then
				estado <= S2; else estado <= S0;
				end if;
				when S2 => if SW(2) = '1' then
				estado <= S3; else estado <= S1;
				end if;
				when S3 => if SW(2) = '1' then
				estado <= S0; else estado <= S2;
				end if;
			end case;
			seg <= 0;
		else
			seg <= seg+1;
		end if;
	end if;
end process;

--PROCESSO DE CONTROLE DE SAÍDA
saida_led : process (seg)
begin
	if  SW(2)='1' then
		case estado is
			when S0 => if seg<=cont_passo then
				  LEDR <= "0001"; GPIO_1 <= "0001";
				  else LEDR <= "0011"; GPIO_1 <= "0011";
				  end if;
			when S1 => if seg<=cont_passo then
				  LEDR <= "0010"; GPIO_1 <= "0010";
				  else LEDR <= "0110"; GPIO_1 <= "0110";
				  end if;
			when S2 => if seg<=cont_passo then
				  LEDR <= "0100"; GPIO_1 <= "0100"; 
				  else LEDR <= "1100"; GPIO_1 <= "1100";
				  end if;
			when S3 => if seg<=cont_passo then
				  LEDR <= "1000"; GPIO_1 <= "1000"; 
				  else LEDR <= "1001"; GPIO_1 <= "1001";
				  end if;
		end case;
	else
		case estado is
			when S0 => if seg<=cont_passo then
				  LEDR <= "0001"; GPIO_1 <= "0001";
				  else LEDR <= "1001"; GPIO_1 <= "1001";
				  end if;
			when S1 => if seg<=cont_passo then
				  LEDR <= "0010"; GPIO_1 <= "0010"; 
				  else LEDR <= "0011"; GPIO_1 <= "0011";
				  end if;
			when S2 => if seg<=cont_passo then
				  LEDR <= "0100"; GPIO_1 <= "0100"; 
				  else LEDR <= "0110"; GPIO_1 <= "0110";
				  end if;
			when S3 => if seg<=cont_passo then
				  LEDR <= "1000"; GPIO_1 <= "1000"; 
				  else LEDR <= "1100"; GPIO_1 <= "1100";
				  end if;
		end case;
	end if;
	
end process;

end funcionamento;