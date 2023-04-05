-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Wed Mar 15 15:47:26 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY diagrama_bloco IS 
	PORT
	(
		SW :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		LEDR :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END diagrama_bloco;

ARCHITECTURE bdf_type OF diagrama_bloco IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 
LEDR(2) <= SYNTHESIZED_WIRE_0;



SYNTHESIZED_WIRE_2 <= SW(0) AND SW(1);


LEDR(1) <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_0 <= SW(0) XOR SW(1);


LEDR(0) <= SW(2) OR SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_1 <= NOT(SW(2));



END bdf_type;