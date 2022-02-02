-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"
-- CREATED		"Wed Feb 02 01:51:12 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Esquematico_Logic_h0 IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		windows :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		store :  IN  STD_LOGIC;
		rst_on :  IN  STD_LOGIC;
		gtin1 :  IN  STD_LOGIC;
		datab5 :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		datab7 :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Led_Green :  OUT  STD_LOGIC;
		Led_Blue :  OUT  STD_LOGIC;
		Led_Red :  OUT  STD_LOGIC
	);
END Esquematico_Logic_h0;

ARCHITECTURE bdf_type OF Esquematico_Logic_h0 IS 

COMPONENT dsf_upcounter
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 count_en : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_datareg
	PORT(enable : IN STD_LOGIC;
		 areset : IN STD_LOGIC;
		 load_en : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_compare
	PORT(enable : IN STD_LOGIC;
		 gtin : IN STD_LOGIC;
		 ltin : IN STD_LOGIC;
		 eqin : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 gtout : OUT STD_LOGIC;
		 ltout : OUT STD_LOGIC;
		 eqout : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT logic_h0
	PORT(gt : IN STD_LOGIC;
		 lt : IN STD_LOGIC;
		 q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 
Led_Green <= SYNTHESIZED_WIRE_4;
Led_Red <= SYNTHESIZED_WIRE_3;



b2v_inst0 : dsf_upcounter
PORT MAP(enable => enable,
		 areset => reset,
		 count_en => windows,
		 clk => clk,
		 q => SYNTHESIZED_WIRE_0);


b2v_inst1 : dsf_datareg
PORT MAP(enable => enable,
		 areset => rst_on,
		 load_en => store,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_0,
		 q => SYNTHESIZED_WIRE_5);


b2v_inst2 : dsf_compare
PORT MAP(enable => enable,
		 gtin => gtin1,
		 dataa => SYNTHESIZED_WIRE_5,
		 datab => datab7,
		 gtout => SYNTHESIZED_WIRE_3);


b2v_inst3 : dsf_compare
PORT MAP(enable => enable,
		 gtin => gtin1,
		 dataa => SYNTHESIZED_WIRE_5,
		 datab => datab5,
		 ltout => SYNTHESIZED_WIRE_4);


b2v_inst4 : logic_h0
PORT MAP(gt => SYNTHESIZED_WIRE_3,
		 lt => SYNTHESIZED_WIRE_4,
		 q => Led_Blue);


END bdf_type;