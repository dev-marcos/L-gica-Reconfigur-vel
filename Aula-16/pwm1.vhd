LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pwm1 IS
PORT (clk: IN STD_LOGIC;
		LED: OUT STD_LOGIC);
END pwm1;

ARCHITECTURE comportamento OF pwm1 IS


constant periodo : Natural := 50; -- 100us para 10k de freq
signal duty : NATURAL range 0 to 100; -- duty cicle

signal led_reg : std_logic;
signal clk_1us : std_logic;
signal clk_100us : std_logic;
signal duty1 : NATURAL range 0 to periodo;
 
begin

---- Cria constante de tempo de 1us e 100us ----
	
process(clk)
VARIABLE led_delay : NATURAL range 0 to 25;
VARIABLE clk_1us1 : STD_LOGIC;
VARIABLE led_delay100 : NATURAL range 0 to 2500;
VARIABLE clk_100us1 : STD_LOGIC;
	begin
	 IF (clk'EVENT AND clk='1') THEN  
       led_delay := led_delay + 1;   
       if led_delay = 25 then   
         led_delay := 0;   
         clk_1us1 := not clk_1us1; 
       end if;
       led_delay100 := led_delay100 + 1;   
       if led_delay100 = 2500 then   
         led_delay100 := 0;   
         clk_100us1 := not clk_100us1; 
       end if;		 
    end if;
    clk_1us<=clk_1us1;
	 clk_100us<=clk_100us1;
end process;

LED<=led_reg;

 ---- Sinal PWM de 10khz, controlado pela variavel duty ----
 
 process(clk_1us) 
 VARIABLE led_on : NATURAL range 0 to periodo;
		begin
      		
      if rising_edge(clk_1us) then   
       led_on := led_on + 1;   
       if led_on >= periodo-duty then   -- max 100 
        led_reg <= '1'; 
			if led_on = periodo then
			led_on:=0;
			led_reg<='0';
			end if;
		 end if;   
      end if;   
  end process;
  
 ---- Variação do duty ----

 process(clk_100us) 
 VARIABLE incrementa : std_logic;
 VARIABLE count : natural range 0 to 1000;
		begin
      if rising_edge(clk_100us) then -- a contagem garante a mudança do duty cicle a cada 10ms
			count:=count+1;
			if count=100 then
			   count:=0;
				if incrementa = '1' then   
				duty1 <= duty1 + 1;   
				if duty1 >= periodo then   -- max 50 - 1 segundo para um ciclo completo
				duty1<=periodo;
				incrementa := '0'; 	
			   end if;   
		   end if;
		  if incrementa = '0' then   
        duty1 <= duty1 - 1;   
        if duty1 <= 0 then   -- max 100
		  duty1<=0; 
        incrementa := '1';
		 end if;   
      end if;
		end if;
	end if;
  duty<=duty1; 
  end process; 
  
 End comportamento;