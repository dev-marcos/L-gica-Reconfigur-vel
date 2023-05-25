------------ PACKAGE ------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
PACKAGE my_package IS

	FUNCTION tabela (
		SEL: STD_LOGIC; 
		AX : STD_LOGIC_VECTOR(1 downto 0))  
		RETURN STD_LOGIC_VECTOR;
	
	
	PROCEDURE conversor (
		SIGNAL EN, SEL: IN STD_LOGIC;
		SIGNAL AX : IN STD_LOGIC_VECTOR(1 downto 0);
		SIGNAL SAIDA : OUT STD_LOGIC_VECTOR(3 downto 0));
	
END my_package;

---------------------------------

PACKAGE BODY my_package IS 

	FUNCTION tabela (SEL: STD_LOGIC; 
	AX : STD_LOGIC_VECTOR(1 downto 0))  
	RETURN STD_LOGIC_VECTOR IS 
	VARIABLE RETORNO : STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
		IF (SEL = '1') THEN
			case AX(1 downto 0) is 
				when "00" => RETORNO := "1000";  
				when "01" => RETORNO := "0100";  
				when "11" => RETORNO := "0010";  
				when "10" => RETORNO := "0001"; 
			end case;
		ELSE
			case AX(1 downto 0) is 
				when "00" => RETORNO := "0001";  
				when "01" => RETORNO := "0010";  
				when "11" => RETORNO := "0100";  
				when "10" => RETORNO := "1000"; 
			end case;

		END IF; 
		
		RETURN RETORNO;
	END tabela;
	
	
	PROCEDURE conversor (
		SIGNAL EN, SEL: IN STD_LOGIC;
		SIGNAL AX : IN STD_LOGIC_VECTOR(1 downto 0);
		SIGNAL SAIDA : OUT STD_LOGIC_VECTOR(3 downto 0)) IS
		--VARIABLE RETORNO: STD_LOGIC_VECTOR(1 downto 0);
	BEGIN
	
		IF (EN = '1') THEN
			SAIDA <= tabela(SEL, AX);
			
		ELSE 
			SAIDA <="ZZZZ";
		END IF;
	
		
		
	END conversor;
END my_package;