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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/16/2023 15:47:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          tri_state
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tri_state_vhd_vec_tst IS
END tri_state_vhd_vec_tst;
ARCHITECTURE tri_state_arch OF tri_state_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ena : STD_LOGIC;
SIGNAL input : STD_LOGIC;
SIGNAL output : STD_LOGIC;
COMPONENT tri_state
	PORT (
	ena : IN STD_LOGIC;
	input : IN STD_LOGIC;
	output : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : tri_state
	PORT MAP (
-- list connections between master ports and signals
	ena => ena,
	input => input,
	output => output
	);

-- input
t_prcs_input: PROCESS
BEGIN
LOOP
	input <= '0';
	WAIT FOR 50000 ps;
	input <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_input;

-- ena
t_prcs_ena: PROCESS
BEGIN
LOOP
	ena <= '0';
	WAIT FOR 100000 ps;
	ena <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_ena;
END tri_state_arch;
