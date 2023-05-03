-- Nome Projeto: Trabalho 3
-- Data: 03/05/23
-- Nome: Marcos Vinicius Rocha da Silva / 2159678
--       Felipe Moreira da Silva / 1992791

LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Trabalho_3 IS
  PORT (
    SW : IN std_logic_vector(7 downto 0);
    HEX0, HEX1, HEX2 : OUT std_logic_vector(0 to 6)
  );
END ENTITY;

ARCHITECTURE funcao OF Trabalho_3 IS
  
	COMPONENT display IS
		PORT (
			valor : in integer range 0 to 9;
			segmentos : OUT std_logic_vector(0 to 6)
		);
	END COMPONENT;

	SIGNAL count_zeros: INTEGER range 0 to 9 := 0;
	SIGNAL count_msb: INTEGER range 0 to 9 := 0;
	SIGNAL count_lsb: INTEGER range 0 to 9 := 0;
BEGIN
  

	process(SW)
		variable var_zeros, var_msb, var_lsb , aux : INTEGER range 0 to 9 := 0;
	
	begin
	-- Contando o número de 0's e 1's do número
	
		var_zeros := 0;
		var_msb := 0;
		var_lsb := 0;
		
		aux := 0; --variavel auxiliar
		
		for i in 0 to 7 loop
			if SW(i) = '0' then
				var_zeros := var_zeros + 1;
				aux := 1;
			else 
				if aux = 0 then		
					
					var_lsb := var_lsb + 1;
				end if;	
			end if;	
		end loop;
		
		
		aux := 0; --variavel auxiliar
		for i in 7 downto 0 loop
			if SW(i) = '1' and aux = 0 then
				var_msb := var_msb + 1;
			else 
				aux := 1;
			end if;	
		end loop;

	--Atribuindo das variaveis para o signal
	count_zeros <= var_zeros;
	count_msb <= var_msb;
	count_lsb <= var_lsb;
	
	
	end process;
	
	-- Exibindo os valores nas saídas HEX0, HEX1 e HEX2 usando o componente display
	display_zero : display port map (count_zeros, HEX2);
	display_msb : display port map (count_msb, HEX1);
	display_lsb : display port map (count_lsb, HEX0);
end funcao;
