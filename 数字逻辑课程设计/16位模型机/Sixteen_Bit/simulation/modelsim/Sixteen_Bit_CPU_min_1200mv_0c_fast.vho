-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Full Version"

-- DATE "07/19/2020 21:19:06"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Sixteen_Bit_CPU IS
    PORT (
	CLK : IN std_logic;
	CLR : IN std_logic;
	CS : IN std_logic;
	WR : IN std_logic;
	Add_IN : IN std_logic_vector(3 DOWNTO 0);
	Input : IN std_logic_vector(15 DOWNTO 0);
	ALU_OUT : BUFFER std_logic_vector(15 DOWNTO 0);
	Zero : BUFFER std_logic;
	Over : BUFFER std_logic;
	Nege : BUFFER std_logic;
	ERROR : BUFFER std_logic;
	STOP : BUFFER std_logic;
	Tap : BUFFER std_logic_vector(7 DOWNTO 0);
	Code_IR : BUFFER std_logic_vector(3 DOWNTO 0);
	IPC_O : BUFFER std_logic;
	IMAR_O : BUFFER std_logic;
	IDR_O : BUFFER std_logic;
	EDR_O : BUFFER std_logic;
	W_O : BUFFER std_logic;
	R_O : BUFFER std_logic;
	ISUM_O : BUFFER std_logic;
	ESUM_O : BUFFER std_logic;
	IIR_O : BUFFER std_logic;
	ABUS_O : BUFFER std_logic_vector(3 DOWNTO 0);
	dbus_O : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END Sixteen_Bit_CPU;

-- Design Ports Information
-- ALU_OUT[0]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[1]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[2]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[3]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[4]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[5]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[6]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[7]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[8]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[9]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[10]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[11]	=>  Location: PIN_3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[12]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[13]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[14]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OUT[15]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zero	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Over	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Nege	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ERROR	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STOP	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[0]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[1]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[2]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[3]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[4]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[5]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[6]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tap[7]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Code_IR[0]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Code_IR[1]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Code_IR[2]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Code_IR[3]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IPC_O	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IMAR_O	=>  Location: PIN_143,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IDR_O	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- EDR_O	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- W_O	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_O	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ISUM_O	=>  Location: PIN_2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESUM_O	=>  Location: PIN_144,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IIR_O	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ABUS_O[0]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ABUS_O[1]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ABUS_O[2]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ABUS_O[3]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[0]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[1]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[2]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[3]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[4]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[5]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[6]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[7]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[8]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[9]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[10]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[11]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[12]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[13]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[14]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dbus_O[15]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLR	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CS	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WR	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[0]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Add_IN[0]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Add_IN[1]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Add_IN[2]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Add_IN[3]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[1]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[2]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[3]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[4]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[5]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[6]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[7]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[8]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[9]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[10]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[11]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[12]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[13]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[14]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input[15]	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Sixteen_Bit_CPU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_CLR : std_logic;
SIGNAL ww_CS : std_logic;
SIGNAL ww_WR : std_logic;
SIGNAL ww_Add_IN : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Input : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ALU_OUT : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Zero : std_logic;
SIGNAL ww_Over : std_logic;
SIGNAL ww_Nege : std_logic;
SIGNAL ww_ERROR : std_logic;
SIGNAL ww_STOP : std_logic;
SIGNAL ww_Tap : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Code_IR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_IPC_O : std_logic;
SIGNAL ww_IMAR_O : std_logic;
SIGNAL ww_IDR_O : std_logic;
SIGNAL ww_EDR_O : std_logic;
SIGNAL ww_W_O : std_logic;
SIGNAL ww_R_O : std_logic;
SIGNAL ww_ISUM_O : std_logic;
SIGNAL ww_ESUM_O : std_logic;
SIGNAL ww_IIR_O : std_logic;
SIGNAL ww_ABUS_O : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_dbus_O : std_logic_vector(15 DOWNTO 0);
SIGNAL \RAMM|DO[15]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CL|temp~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \A|temp[0]~85clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CTRLM|R~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~10clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~13clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~12clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~11clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALU_OUT[0]~output_o\ : std_logic;
SIGNAL \ALU_OUT[1]~output_o\ : std_logic;
SIGNAL \ALU_OUT[2]~output_o\ : std_logic;
SIGNAL \ALU_OUT[3]~output_o\ : std_logic;
SIGNAL \ALU_OUT[4]~output_o\ : std_logic;
SIGNAL \ALU_OUT[5]~output_o\ : std_logic;
SIGNAL \ALU_OUT[6]~output_o\ : std_logic;
SIGNAL \ALU_OUT[7]~output_o\ : std_logic;
SIGNAL \ALU_OUT[8]~output_o\ : std_logic;
SIGNAL \ALU_OUT[9]~output_o\ : std_logic;
SIGNAL \ALU_OUT[10]~output_o\ : std_logic;
SIGNAL \ALU_OUT[11]~output_o\ : std_logic;
SIGNAL \ALU_OUT[12]~output_o\ : std_logic;
SIGNAL \ALU_OUT[13]~output_o\ : std_logic;
SIGNAL \ALU_OUT[14]~output_o\ : std_logic;
SIGNAL \ALU_OUT[15]~output_o\ : std_logic;
SIGNAL \Zero~output_o\ : std_logic;
SIGNAL \Over~output_o\ : std_logic;
SIGNAL \Nege~output_o\ : std_logic;
SIGNAL \ERROR~output_o\ : std_logic;
SIGNAL \STOP~output_o\ : std_logic;
SIGNAL \Tap[0]~output_o\ : std_logic;
SIGNAL \Tap[1]~output_o\ : std_logic;
SIGNAL \Tap[2]~output_o\ : std_logic;
SIGNAL \Tap[3]~output_o\ : std_logic;
SIGNAL \Tap[4]~output_o\ : std_logic;
SIGNAL \Tap[5]~output_o\ : std_logic;
SIGNAL \Tap[6]~output_o\ : std_logic;
SIGNAL \Tap[7]~output_o\ : std_logic;
SIGNAL \Code_IR[0]~output_o\ : std_logic;
SIGNAL \Code_IR[1]~output_o\ : std_logic;
SIGNAL \Code_IR[2]~output_o\ : std_logic;
SIGNAL \Code_IR[3]~output_o\ : std_logic;
SIGNAL \IPC_O~output_o\ : std_logic;
SIGNAL \IMAR_O~output_o\ : std_logic;
SIGNAL \IDR_O~output_o\ : std_logic;
SIGNAL \EDR_O~output_o\ : std_logic;
SIGNAL \W_O~output_o\ : std_logic;
SIGNAL \R_O~output_o\ : std_logic;
SIGNAL \ISUM_O~output_o\ : std_logic;
SIGNAL \ESUM_O~output_o\ : std_logic;
SIGNAL \IIR_O~output_o\ : std_logic;
SIGNAL \ABUS_O[0]~output_o\ : std_logic;
SIGNAL \ABUS_O[1]~output_o\ : std_logic;
SIGNAL \ABUS_O[2]~output_o\ : std_logic;
SIGNAL \ABUS_O[3]~output_o\ : std_logic;
SIGNAL \dbus_O[0]~output_o\ : std_logic;
SIGNAL \dbus_O[1]~output_o\ : std_logic;
SIGNAL \dbus_O[2]~output_o\ : std_logic;
SIGNAL \dbus_O[3]~output_o\ : std_logic;
SIGNAL \dbus_O[4]~output_o\ : std_logic;
SIGNAL \dbus_O[5]~output_o\ : std_logic;
SIGNAL \dbus_O[6]~output_o\ : std_logic;
SIGNAL \dbus_O[7]~output_o\ : std_logic;
SIGNAL \dbus_O[8]~output_o\ : std_logic;
SIGNAL \dbus_O[9]~output_o\ : std_logic;
SIGNAL \dbus_O[10]~output_o\ : std_logic;
SIGNAL \dbus_O[11]~output_o\ : std_logic;
SIGNAL \dbus_O[12]~output_o\ : std_logic;
SIGNAL \dbus_O[13]~output_o\ : std_logic;
SIGNAL \dbus_O[14]~output_o\ : std_logic;
SIGNAL \dbus_O[15]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CL|counter[0]~3_combout\ : std_logic;
SIGNAL \CL|counter[0]~feeder_combout\ : std_logic;
SIGNAL \CL|counter[1]~1_combout\ : std_logic;
SIGNAL \CL|counter[1]~feeder_combout\ : std_logic;
SIGNAL \CL|counter[2]~2_combout\ : std_logic;
SIGNAL \CL|counter[3]~0_combout\ : std_logic;
SIGNAL \CL|Equal0~0_combout\ : std_logic;
SIGNAL \CL|temp~0_combout\ : std_logic;
SIGNAL \CL|temp~0clkctrl_outclk\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \CT|temp[0]~0_combout\ : std_logic;
SIGNAL \CT|temp[1]~1_combout\ : std_logic;
SIGNAL \CTRLM|T4~0_combout\ : std_logic;
SIGNAL \CTRLM|T4~1_combout\ : std_logic;
SIGNAL \CTRLM|T4~2_combout\ : std_logic;
SIGNAL \WR~input_o\ : std_logic;
SIGNAL \CS~input_o\ : std_logic;
SIGNAL \RAMM|DO[15]~0_combout\ : std_logic;
SIGNAL \RAMM|DO[15]~0clkctrl_outclk\ : std_logic;
SIGNAL \CTRLM|T5~0_combout\ : std_logic;
SIGNAL \CTRLM|T6~0_combout\ : std_logic;
SIGNAL \CTRLM|T5~1_combout\ : std_logic;
SIGNAL \CTRLM|T3~0_combout\ : std_logic;
SIGNAL \CTRLM|IDR~0_combout\ : std_logic;
SIGNAL \CTRLM|IIR~2_combout\ : std_logic;
SIGNAL \CTRLM|T3~1_combout\ : std_logic;
SIGNAL \CTRLM|IMAR~0_combout\ : std_logic;
SIGNAL \CTRLM|IMAR~1_combout\ : std_logic;
SIGNAL \Add_IN[3]~input_o\ : std_logic;
SIGNAL \Add_IN[0]~input_o\ : std_logic;
SIGNAL \Add_IN[1]~input_o\ : std_logic;
SIGNAL \Add_IN[2]~input_o\ : std_logic;
SIGNAL \RAMM|Data~431_combout\ : std_logic;
SIGNAL \rtl~15_combout\ : std_logic;
SIGNAL \Input[6]~input_o\ : std_logic;
SIGNAL \RAMM|Data~246_combout\ : std_logic;
SIGNAL \RAMM|Data~429_combout\ : std_logic;
SIGNAL \rtl~13_combout\ : std_logic;
SIGNAL \rtl~13clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~230_combout\ : std_logic;
SIGNAL \RAMM|Data~430_combout\ : std_logic;
SIGNAL \rtl~14_combout\ : std_logic;
SIGNAL \RAMM|Data~198_combout\ : std_logic;
SIGNAL \P|temp[0]~0_combout\ : std_logic;
SIGNAL \RAMM|Data~428_combout\ : std_logic;
SIGNAL \rtl~12_combout\ : std_logic;
SIGNAL \rtl~12clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~214_combout\ : std_logic;
SIGNAL \RAMM|Data~323_combout\ : std_logic;
SIGNAL \RAMM|Data~324_combout\ : std_logic;
SIGNAL \RAMM|Data~421_combout\ : std_logic;
SIGNAL \rtl~5_combout\ : std_logic;
SIGNAL \RAMM|Data~102_combout\ : std_logic;
SIGNAL \RAMM|Data~423_combout\ : std_logic;
SIGNAL \rtl~7_combout\ : std_logic;
SIGNAL \RAMM|Data~118_combout\ : std_logic;
SIGNAL \RAMM|Data~420_combout\ : std_logic;
SIGNAL \rtl~4_combout\ : std_logic;
SIGNAL \RAMM|Data~86_combout\ : std_logic;
SIGNAL \RAMM|Data~422_combout\ : std_logic;
SIGNAL \rtl~6_combout\ : std_logic;
SIGNAL \RAMM|Data~70_combout\ : std_logic;
SIGNAL \RAMM|Data~316_combout\ : std_logic;
SIGNAL \RAMM|Data~317_combout\ : std_logic;
SIGNAL \P|temp[3]~3_combout\ : std_logic;
SIGNAL \P|temp[3]~4_combout\ : std_logic;
SIGNAL \RAMM|Data~417_combout\ : std_logic;
SIGNAL \rtl~1_combout\ : std_logic;
SIGNAL \rtl~1clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~150_combout\ : std_logic;
SIGNAL \RAMM|Data~419_combout\ : std_logic;
SIGNAL \rtl~3_combout\ : std_logic;
SIGNAL \RAMM|Data~182_combout\ : std_logic;
SIGNAL \RAMM|Data~418_combout\ : std_logic;
SIGNAL \rtl~2_combout\ : std_logic;
SIGNAL \RAMM|Data~134_combout\ : std_logic;
SIGNAL \RAMM|Data~416_combout\ : std_logic;
SIGNAL \rtl~0_combout\ : std_logic;
SIGNAL \rtl~0clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~166_combout\ : std_logic;
SIGNAL \RAMM|Data~318_combout\ : std_logic;
SIGNAL \RAMM|Data~319_combout\ : std_logic;
SIGNAL \RAMM|Data~425_combout\ : std_logic;
SIGNAL \rtl~9_combout\ : std_logic;
SIGNAL \RAMM|Data~22_combout\ : std_logic;
SIGNAL \RAMM|Data~427_combout\ : std_logic;
SIGNAL \rtl~11_combout\ : std_logic;
SIGNAL \rtl~11clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~54_combout\ : std_logic;
SIGNAL \RAMM|Data~424_combout\ : std_logic;
SIGNAL \rtl~8_combout\ : std_logic;
SIGNAL \RAMM|Data~38_combout\ : std_logic;
SIGNAL \RAMM|Data~426_combout\ : std_logic;
SIGNAL \rtl~10_combout\ : std_logic;
SIGNAL \rtl~10clkctrl_outclk\ : std_logic;
SIGNAL \RAMM|Data~6_combout\ : std_logic;
SIGNAL \RAMM|Data~320_combout\ : std_logic;
SIGNAL \RAMM|Data~321_combout\ : std_logic;
SIGNAL \RAMM|Data~322_combout\ : std_logic;
SIGNAL \RAMM|Data~325_combout\ : std_logic;
SIGNAL \DR|temp[6]~feeder_combout\ : std_logic;
SIGNAL \CTRLM|IDR~1_combout\ : std_logic;
SIGNAL \CTRLM|IDR~2_combout\ : std_logic;
SIGNAL \Input[0]~input_o\ : std_logic;
SIGNAL \RAMM|Data~176_combout\ : std_logic;
SIGNAL \RAMM|Data~128_combout\ : std_logic;
SIGNAL \RAMM|Data~144_combout\ : std_logic;
SIGNAL \RAMM|Data~256_combout\ : std_logic;
SIGNAL \RAMM|Data~160_combout\ : std_logic;
SIGNAL \RAMM|Data~257_combout\ : std_logic;
SIGNAL \RAMM|Data~240_combout\ : std_logic;
SIGNAL \RAMM|Data~224_combout\ : std_logic;
SIGNAL \RAMM|Data~192_combout\ : std_logic;
SIGNAL \RAMM|Data~263_combout\ : std_logic;
SIGNAL \RAMM|Data~208_combout\ : std_logic;
SIGNAL \RAMM|Data~264_combout\ : std_logic;
SIGNAL \RAMM|Data~112_combout\ : std_logic;
SIGNAL \RAMM|Data~64_combout\ : std_logic;
SIGNAL \RAMM|Data~96_combout\ : std_logic;
SIGNAL \RAMM|Data~258_combout\ : std_logic;
SIGNAL \RAMM|Data~80_combout\ : std_logic;
SIGNAL \RAMM|Data~259_combout\ : std_logic;
SIGNAL \RAMM|Data~48_combout\ : std_logic;
SIGNAL \RAMM|Data~32_combout\ : std_logic;
SIGNAL \RAMM|Data~16_combout\ : std_logic;
SIGNAL \RAMM|Data~0_combout\ : std_logic;
SIGNAL \RAMM|Data~260_combout\ : std_logic;
SIGNAL \RAMM|Data~261_combout\ : std_logic;
SIGNAL \RAMM|Data~262_combout\ : std_logic;
SIGNAL \RAMM|Data~265_combout\ : std_logic;
SIGNAL \DR|temp[0]~feeder_combout\ : std_logic;
SIGNAL \d|D_OUT[0]~0_combout\ : std_logic;
SIGNAL \CTRLM|T6~1_combout\ : std_logic;
SIGNAL \CTRLM|T6~combout\ : std_logic;
SIGNAL \IR|WideOr2~0_combout\ : std_logic;
SIGNAL \CTRLM|IIR~3_combout\ : std_logic;
SIGNAL \A|Add2~1\ : std_logic;
SIGNAL \A|Add2~2_combout\ : std_logic;
SIGNAL \A|Add2~17\ : std_logic;
SIGNAL \A|Add2~18_combout\ : std_logic;
SIGNAL \A|Add1~1\ : std_logic;
SIGNAL \A|Add1~3\ : std_logic;
SIGNAL \A|Add1~5\ : std_logic;
SIGNAL \A|Add1~7\ : std_logic;
SIGNAL \A|Add1~9\ : std_logic;
SIGNAL \A|Add1~11\ : std_logic;
SIGNAL \A|Add1~13\ : std_logic;
SIGNAL \A|Add1~15\ : std_logic;
SIGNAL \A|Add1~17\ : std_logic;
SIGNAL \A|Add1~18_combout\ : std_logic;
SIGNAL \A|Add0~1\ : std_logic;
SIGNAL \A|Add0~3\ : std_logic;
SIGNAL \A|Add0~5\ : std_logic;
SIGNAL \A|Add0~7\ : std_logic;
SIGNAL \A|Add0~9\ : std_logic;
SIGNAL \A|Add0~11\ : std_logic;
SIGNAL \A|Add0~13\ : std_logic;
SIGNAL \A|Add0~15\ : std_logic;
SIGNAL \A|Add0~17\ : std_logic;
SIGNAL \A|Add0~18_combout\ : std_logic;
SIGNAL \A|temp~24_combout\ : std_logic;
SIGNAL \A|temp~25_combout\ : std_logic;
SIGNAL \A|temp~115_combout\ : std_logic;
SIGNAL \A|temp~116_combout\ : std_logic;
SIGNAL \A|temp[9]~93_combout\ : std_logic;
SIGNAL \A|temp[0]~84_combout\ : std_logic;
SIGNAL \Input[15]~input_o\ : std_logic;
SIGNAL \RAMM|Data~255_combout\ : std_logic;
SIGNAL \RAMM|Data~127_combout\ : std_logic;
SIGNAL \RAMM|Data~63_combout\ : std_logic;
SIGNAL \RAMM|Data~191_combout\ : std_logic;
SIGNAL \RAMM|Data~413_combout\ : std_logic;
SIGNAL \RAMM|Data~414_combout\ : std_logic;
SIGNAL \RAMM|Data~95_combout\ : std_logic;
SIGNAL \RAMM|Data~223_combout\ : std_logic;
SIGNAL \RAMM|Data~31_combout\ : std_logic;
SIGNAL \RAMM|Data~159_combout\ : std_logic;
SIGNAL \RAMM|Data~406_combout\ : std_logic;
SIGNAL \RAMM|Data~407_combout\ : std_logic;
SIGNAL \RAMM|Data~143_combout\ : std_logic;
SIGNAL \RAMM|Data~15_combout\ : std_logic;
SIGNAL \RAMM|Data~79_combout\ : std_logic;
SIGNAL \RAMM|Data~410_combout\ : std_logic;
SIGNAL \RAMM|Data~207_combout\ : std_logic;
SIGNAL \RAMM|Data~411_combout\ : std_logic;
SIGNAL \RAMM|Data~239_combout\ : std_logic;
SIGNAL \RAMM|Data~175_combout\ : std_logic;
SIGNAL \RAMM|Data~47_combout\ : std_logic;
SIGNAL \RAMM|Data~111_combout\ : std_logic;
SIGNAL \RAMM|Data~408_combout\ : std_logic;
SIGNAL \RAMM|Data~409_combout\ : std_logic;
SIGNAL \RAMM|Data~412_combout\ : std_logic;
SIGNAL \RAMM|Data~415_combout\ : std_logic;
SIGNAL \DR|temp[15]~feeder_combout\ : std_logic;
SIGNAL \Input[13]~input_o\ : std_logic;
SIGNAL \RAMM|Data~189_combout\ : std_logic;
SIGNAL \RAMM|Data~253_combout\ : std_logic;
SIGNAL \RAMM|Data~125_combout\ : std_logic;
SIGNAL \RAMM|Data~61_combout\ : std_logic;
SIGNAL \RAMM|Data~393_combout\ : std_logic;
SIGNAL \RAMM|Data~394_combout\ : std_logic;
SIGNAL \RAMM|Data~237_combout\ : std_logic;
SIGNAL \RAMM|Data~109_combout\ : std_logic;
SIGNAL \RAMM|Data~45_combout\ : std_logic;
SIGNAL \RAMM|Data~173_combout\ : std_logic;
SIGNAL \RAMM|Data~386_combout\ : std_logic;
SIGNAL \RAMM|Data~387_combout\ : std_logic;
SIGNAL \RAMM|Data~157_combout\ : std_logic;
SIGNAL \RAMM|Data~221_combout\ : std_logic;
SIGNAL \RAMM|Data~29_combout\ : std_logic;
SIGNAL \RAMM|Data~93_combout\ : std_logic;
SIGNAL \RAMM|Data~388_combout\ : std_logic;
SIGNAL \RAMM|Data~389_combout\ : std_logic;
SIGNAL \RAMM|Data~77_combout\ : std_logic;
SIGNAL \RAMM|Data~205_combout\ : std_logic;
SIGNAL \RAMM|Data~141_combout\ : std_logic;
SIGNAL \RAMM|Data~13_combout\ : std_logic;
SIGNAL \RAMM|Data~390_combout\ : std_logic;
SIGNAL \RAMM|Data~391_combout\ : std_logic;
SIGNAL \RAMM|Data~392_combout\ : std_logic;
SIGNAL \RAMM|Data~395_combout\ : std_logic;
SIGNAL \DR|temp[13]~feeder_combout\ : std_logic;
SIGNAL \Input[12]~input_o\ : std_logic;
SIGNAL \RAMM|Data~188_combout\ : std_logic;
SIGNAL \RAMM|Data~172_combout\ : std_logic;
SIGNAL \RAMM|Data~140_combout\ : std_logic;
SIGNAL \RAMM|Data~156_combout\ : std_logic;
SIGNAL \RAMM|Data~376_combout\ : std_logic;
SIGNAL \RAMM|Data~377_combout\ : std_logic;
SIGNAL \RAMM|Data~252_combout\ : std_logic;
SIGNAL \RAMM|Data~220_combout\ : std_logic;
SIGNAL \RAMM|Data~204_combout\ : std_logic;
SIGNAL \RAMM|Data~236_combout\ : std_logic;
SIGNAL \RAMM|Data~383_combout\ : std_logic;
SIGNAL \RAMM|Data~384_combout\ : std_logic;
SIGNAL \RAMM|Data~92_combout\ : std_logic;
SIGNAL \RAMM|Data~76_combout\ : std_logic;
SIGNAL \RAMM|Data~108_combout\ : std_logic;
SIGNAL \RAMM|Data~378_combout\ : std_logic;
SIGNAL \RAMM|Data~124_combout\ : std_logic;
SIGNAL \RAMM|Data~379_combout\ : std_logic;
SIGNAL \RAMM|Data~60_combout\ : std_logic;
SIGNAL \RAMM|Data~44_combout\ : std_logic;
SIGNAL \RAMM|Data~28_combout\ : std_logic;
SIGNAL \RAMM|Data~12_combout\ : std_logic;
SIGNAL \RAMM|Data~380_combout\ : std_logic;
SIGNAL \RAMM|Data~381_combout\ : std_logic;
SIGNAL \RAMM|Data~382_combout\ : std_logic;
SIGNAL \RAMM|Data~385_combout\ : std_logic;
SIGNAL \Input[11]~input_o\ : std_logic;
SIGNAL \RAMM|Data~123_combout\ : std_logic;
SIGNAL \RAMM|Data~251_combout\ : std_logic;
SIGNAL \RAMM|Data~59_combout\ : std_logic;
SIGNAL \RAMM|Data~187_combout\ : std_logic;
SIGNAL \RAMM|Data~373_combout\ : std_logic;
SIGNAL \RAMM|Data~374_combout\ : std_logic;
SIGNAL \RAMM|Data~91_combout\ : std_logic;
SIGNAL \RAMM|Data~27_combout\ : std_logic;
SIGNAL \RAMM|Data~155_combout\ : std_logic;
SIGNAL \RAMM|Data~366_combout\ : std_logic;
SIGNAL \RAMM|Data~219_combout\ : std_logic;
SIGNAL \RAMM|Data~367_combout\ : std_logic;
SIGNAL \RAMM|Data~235_combout\ : std_logic;
SIGNAL \RAMM|Data~171_combout\ : std_logic;
SIGNAL \RAMM|Data~107_combout\ : std_logic;
SIGNAL \RAMM|Data~43_combout\ : std_logic;
SIGNAL \RAMM|Data~368_combout\ : std_logic;
SIGNAL \RAMM|Data~369_combout\ : std_logic;
SIGNAL \RAMM|Data~139_combout\ : std_logic;
SIGNAL \RAMM|Data~203_combout\ : std_logic;
SIGNAL \RAMM|Data~75_combout\ : std_logic;
SIGNAL \RAMM|Data~11_combout\ : std_logic;
SIGNAL \RAMM|Data~370_combout\ : std_logic;
SIGNAL \RAMM|Data~371_combout\ : std_logic;
SIGNAL \RAMM|Data~372_combout\ : std_logic;
SIGNAL \RAMM|Data~375_combout\ : std_logic;
SIGNAL \A|Add2~19\ : std_logic;
SIGNAL \A|Add2~21\ : std_logic;
SIGNAL \A|Add2~22_combout\ : std_logic;
SIGNAL \A|Add1~19\ : std_logic;
SIGNAL \A|Add1~21\ : std_logic;
SIGNAL \A|Add1~22_combout\ : std_logic;
SIGNAL \A|Add0~19\ : std_logic;
SIGNAL \A|Add0~21\ : std_logic;
SIGNAL \A|Add0~22_combout\ : std_logic;
SIGNAL \A|temp~32_combout\ : std_logic;
SIGNAL \A|temp~33_combout\ : std_logic;
SIGNAL \A|temp~113_combout\ : std_logic;
SIGNAL \A|temp~114_combout\ : std_logic;
SIGNAL \A|temp[11]~94_combout\ : std_logic;
SIGNAL \A|temp~34_combout\ : std_logic;
SIGNAL \d|D_OUT[11]~13_combout\ : std_logic;
SIGNAL \A|Add2~23\ : std_logic;
SIGNAL \A|Add2~24_combout\ : std_logic;
SIGNAL \A|temp~35_combout\ : std_logic;
SIGNAL \A|Add1~23\ : std_logic;
SIGNAL \A|Add1~24_combout\ : std_logic;
SIGNAL \A|Add0~23\ : std_logic;
SIGNAL \A|Add0~24_combout\ : std_logic;
SIGNAL \A|temp~36_combout\ : std_logic;
SIGNAL \A|temp~37_combout\ : std_logic;
SIGNAL \A|temp~38_combout\ : std_logic;
SIGNAL \A|temp[12]~87_combout\ : std_logic;
SIGNAL \A|temp~39_combout\ : std_logic;
SIGNAL \d|D_OUT[12]~14_combout\ : std_logic;
SIGNAL \A|Add2~25\ : std_logic;
SIGNAL \A|Add2~26_combout\ : std_logic;
SIGNAL \A|Add1~25\ : std_logic;
SIGNAL \A|Add1~26_combout\ : std_logic;
SIGNAL \A|Add0~25\ : std_logic;
SIGNAL \A|Add0~26_combout\ : std_logic;
SIGNAL \A|temp~40_combout\ : std_logic;
SIGNAL \A|temp~41_combout\ : std_logic;
SIGNAL \A|temp~111_combout\ : std_logic;
SIGNAL \A|temp~112_combout\ : std_logic;
SIGNAL \A|temp[13]~95_combout\ : std_logic;
SIGNAL \A|temp~42_combout\ : std_logic;
SIGNAL \d|D_OUT[13]~15_combout\ : std_logic;
SIGNAL \A|Add2~27\ : std_logic;
SIGNAL \A|Add2~29\ : std_logic;
SIGNAL \A|Add2~30_combout\ : std_logic;
SIGNAL \A|Add0~27\ : std_logic;
SIGNAL \A|Add0~29\ : std_logic;
SIGNAL \A|Add0~30_combout\ : std_logic;
SIGNAL \A|Add1~27\ : std_logic;
SIGNAL \A|Add1~29\ : std_logic;
SIGNAL \A|Add1~30_combout\ : std_logic;
SIGNAL \A|temp~48_combout\ : std_logic;
SIGNAL \A|temp~49_combout\ : std_logic;
SIGNAL \A|temp~109_combout\ : std_logic;
SIGNAL \A|temp~110_combout\ : std_logic;
SIGNAL \A|temp[15]~96_combout\ : std_logic;
SIGNAL \A|temp~50_combout\ : std_logic;
SIGNAL \d|D_OUT[15]~17_combout\ : std_logic;
SIGNAL \IR|Equal5~3_combout\ : std_logic;
SIGNAL \IR|Equal5~2_combout\ : std_logic;
SIGNAL \IR|Equal5~4_combout\ : std_logic;
SIGNAL \IR|WideOr1~0_combout\ : std_logic;
SIGNAL \A|temp[0]~85_combout\ : std_logic;
SIGNAL \A|temp[0]~85clkctrl_outclk\ : std_logic;
SIGNAL \A|temp~26_combout\ : std_logic;
SIGNAL \Input[9]~input_o\ : std_logic;
SIGNAL \RAMM|Data~185_combout\ : std_logic;
SIGNAL \RAMM|Data~249_combout\ : std_logic;
SIGNAL \RAMM|Data~121_combout\ : std_logic;
SIGNAL \RAMM|Data~57_combout\ : std_logic;
SIGNAL \RAMM|Data~353_combout\ : std_logic;
SIGNAL \RAMM|Data~354_combout\ : std_logic;
SIGNAL \RAMM|Data~233_combout\ : std_logic;
SIGNAL \RAMM|Data~105_combout\ : std_logic;
SIGNAL \RAMM|Data~41_combout\ : std_logic;
SIGNAL \RAMM|Data~169_combout\ : std_logic;
SIGNAL \RAMM|Data~346_combout\ : std_logic;
SIGNAL \RAMM|Data~347_combout\ : std_logic;
SIGNAL \RAMM|Data~25_combout\ : std_logic;
SIGNAL \RAMM|Data~89_combout\ : std_logic;
SIGNAL \RAMM|Data~348_combout\ : std_logic;
SIGNAL \RAMM|Data~153_combout\ : std_logic;
SIGNAL \RAMM|Data~217_combout\ : std_logic;
SIGNAL \RAMM|Data~349_combout\ : std_logic;
SIGNAL \RAMM|Data~201_combout\ : std_logic;
SIGNAL \RAMM|Data~73_combout\ : std_logic;
SIGNAL \RAMM|Data~137_combout\ : std_logic;
SIGNAL \RAMM|Data~9_combout\ : std_logic;
SIGNAL \RAMM|Data~350_combout\ : std_logic;
SIGNAL \RAMM|Data~351_combout\ : std_logic;
SIGNAL \RAMM|Data~352_combout\ : std_logic;
SIGNAL \RAMM|Data~355_combout\ : std_logic;
SIGNAL \d|D_OUT[9]~11_combout\ : std_logic;
SIGNAL \IR|Equal6~2_combout\ : std_logic;
SIGNAL \IR|Equal6~3_combout\ : std_logic;
SIGNAL \IR|WideOr1~1_combout\ : std_logic;
SIGNAL \A|temp~51_combout\ : std_logic;
SIGNAL \A|Add0~2_combout\ : std_logic;
SIGNAL \A|Add1~2_combout\ : std_logic;
SIGNAL \A|temp~52_combout\ : std_logic;
SIGNAL \A|temp~53_combout\ : std_logic;
SIGNAL \A|temp~54_combout\ : std_logic;
SIGNAL \A|temp[1]~89_combout\ : std_logic;
SIGNAL \A|temp~55_combout\ : std_logic;
SIGNAL \Input[1]~input_o\ : std_logic;
SIGNAL \RAMM|Data~241_combout\ : std_logic;
SIGNAL \RAMM|Data~177_combout\ : std_logic;
SIGNAL \RAMM|Data~49_combout\ : std_logic;
SIGNAL \RAMM|Data~113_combout\ : std_logic;
SIGNAL \RAMM|Data~273_combout\ : std_logic;
SIGNAL \RAMM|Data~274_combout\ : std_logic;
SIGNAL \RAMM|Data~145_combout\ : std_logic;
SIGNAL \RAMM|Data~81_combout\ : std_logic;
SIGNAL \RAMM|Data~17_combout\ : std_logic;
SIGNAL \RAMM|Data~268_combout\ : std_logic;
SIGNAL \RAMM|Data~209_combout\ : std_logic;
SIGNAL \RAMM|Data~269_combout\ : std_logic;
SIGNAL \RAMM|Data~65_combout\ : std_logic;
SIGNAL \RAMM|Data~193_combout\ : std_logic;
SIGNAL \RAMM|Data~129_combout\ : std_logic;
SIGNAL \RAMM|Data~1_combout\ : std_logic;
SIGNAL \RAMM|Data~270_combout\ : std_logic;
SIGNAL \RAMM|Data~271_combout\ : std_logic;
SIGNAL \RAMM|Data~272_combout\ : std_logic;
SIGNAL \RAMM|Data~97_combout\ : std_logic;
SIGNAL \RAMM|Data~225_combout\ : std_logic;
SIGNAL \RAMM|Data~33_combout\ : std_logic;
SIGNAL \RAMM|Data~161_combout\ : std_logic;
SIGNAL \RAMM|Data~266_combout\ : std_logic;
SIGNAL \RAMM|Data~267_combout\ : std_logic;
SIGNAL \RAMM|Data~275_combout\ : std_logic;
SIGNAL \d|D_OUT[1]~2_combout\ : std_logic;
SIGNAL \A|Add2~3\ : std_logic;
SIGNAL \A|Add2~5\ : std_logic;
SIGNAL \A|Add2~7\ : std_logic;
SIGNAL \A|Add2~8_combout\ : std_logic;
SIGNAL \A|Add1~8_combout\ : std_logic;
SIGNAL \A|temp~67_combout\ : std_logic;
SIGNAL \A|Add0~8_combout\ : std_logic;
SIGNAL \A|temp~68_combout\ : std_logic;
SIGNAL \A|temp~69_combout\ : std_logic;
SIGNAL \A|temp~70_combout\ : std_logic;
SIGNAL \A|temp[4]~91_combout\ : std_logic;
SIGNAL \A|temp~71_combout\ : std_logic;
SIGNAL \Input[4]~input_o\ : std_logic;
SIGNAL \RAMM|Data~212_combout\ : std_logic;
SIGNAL \RAMM|Data~244_combout\ : std_logic;
SIGNAL \RAMM|Data~196_combout\ : std_logic;
SIGNAL \RAMM|Data~228_combout\ : std_logic;
SIGNAL \RAMM|Data~303_combout\ : std_logic;
SIGNAL \RAMM|Data~304_combout\ : std_logic;
SIGNAL \RAMM|Data~180_combout\ : std_logic;
SIGNAL \RAMM|Data~164_combout\ : std_logic;
SIGNAL \RAMM|Data~132_combout\ : std_logic;
SIGNAL \RAMM|Data~148_combout\ : std_logic;
SIGNAL \RAMM|Data~296_combout\ : std_logic;
SIGNAL \RAMM|Data~297_combout\ : std_logic;
SIGNAL \RAMM|Data~84_combout\ : std_logic;
SIGNAL \RAMM|Data~116_combout\ : std_logic;
SIGNAL \RAMM|Data~100_combout\ : std_logic;
SIGNAL \RAMM|Data~68_combout\ : std_logic;
SIGNAL \RAMM|Data~298_combout\ : std_logic;
SIGNAL \RAMM|Data~299_combout\ : std_logic;
SIGNAL \RAMM|Data~36_combout\ : std_logic;
SIGNAL \RAMM|Data~52_combout\ : std_logic;
SIGNAL \RAMM|Data~20_combout\ : std_logic;
SIGNAL \RAMM|Data~4_combout\ : std_logic;
SIGNAL \RAMM|Data~300_combout\ : std_logic;
SIGNAL \RAMM|Data~301_combout\ : std_logic;
SIGNAL \RAMM|Data~302_combout\ : std_logic;
SIGNAL \RAMM|Data~305_combout\ : std_logic;
SIGNAL \d|D_OUT[4]~6_combout\ : std_logic;
SIGNAL \A|Add2~9\ : std_logic;
SIGNAL \A|Add2~11\ : std_logic;
SIGNAL \A|Add2~13\ : std_logic;
SIGNAL \A|Add2~15\ : std_logic;
SIGNAL \A|Add2~16_combout\ : std_logic;
SIGNAL \A|temp~17_combout\ : std_logic;
SIGNAL \A|Add0~16_combout\ : std_logic;
SIGNAL \A|Add1~16_combout\ : std_logic;
SIGNAL \A|temp~18_combout\ : std_logic;
SIGNAL \A|temp~20_combout\ : std_logic;
SIGNAL \A|temp~21_combout\ : std_logic;
SIGNAL \A|temp[8]~83_combout\ : std_logic;
SIGNAL \A|temp~23_combout\ : std_logic;
SIGNAL \Input[8]~input_o\ : std_logic;
SIGNAL \RAMM|Data~248_combout\ : std_logic;
SIGNAL \RAMM|Data~216_combout\ : std_logic;
SIGNAL \RAMM|Data~232_combout\ : std_logic;
SIGNAL \RAMM|Data~200_combout\ : std_logic;
SIGNAL \RAMM|Data~343_combout\ : std_logic;
SIGNAL \RAMM|Data~344_combout\ : std_logic;
SIGNAL \RAMM|Data~184_combout\ : std_logic;
SIGNAL \RAMM|Data~168_combout\ : std_logic;
SIGNAL \RAMM|Data~136_combout\ : std_logic;
SIGNAL \RAMM|Data~152_combout\ : std_logic;
SIGNAL \RAMM|Data~336_combout\ : std_logic;
SIGNAL \RAMM|Data~337_combout\ : std_logic;
SIGNAL \RAMM|Data~88_combout\ : std_logic;
SIGNAL \RAMM|Data~120_combout\ : std_logic;
SIGNAL \RAMM|Data~72_combout\ : std_logic;
SIGNAL \RAMM|Data~104_combout\ : std_logic;
SIGNAL \RAMM|Data~338_combout\ : std_logic;
SIGNAL \RAMM|Data~339_combout\ : std_logic;
SIGNAL \RAMM|Data~40_combout\ : std_logic;
SIGNAL \RAMM|Data~56_combout\ : std_logic;
SIGNAL \RAMM|Data~24_combout\ : std_logic;
SIGNAL \RAMM|Data~8_combout\ : std_logic;
SIGNAL \RAMM|Data~340_combout\ : std_logic;
SIGNAL \RAMM|Data~341_combout\ : std_logic;
SIGNAL \RAMM|Data~342_combout\ : std_logic;
SIGNAL \RAMM|Data~345_combout\ : std_logic;
SIGNAL \d|D_OUT[8]~10_combout\ : std_logic;
SIGNAL \IR|Equal3~3_combout\ : std_logic;
SIGNAL \IR|Equal3~1_combout\ : std_logic;
SIGNAL \IR|Equal3~2_combout\ : std_logic;
SIGNAL \IR|Equal3~4_combout\ : std_logic;
SIGNAL \IR|WideOr3~0_combout\ : std_logic;
SIGNAL \IR|WideOr3~2_combout\ : std_logic;
SIGNAL \A|Add2~4_combout\ : std_logic;
SIGNAL \A|temp~59_combout\ : std_logic;
SIGNAL \A|Add0~4_combout\ : std_logic;
SIGNAL \A|Add1~4_combout\ : std_logic;
SIGNAL \A|temp~60_combout\ : std_logic;
SIGNAL \A|temp~61_combout\ : std_logic;
SIGNAL \A|temp~62_combout\ : std_logic;
SIGNAL \A|temp[2]~90_combout\ : std_logic;
SIGNAL \A|temp~63_combout\ : std_logic;
SIGNAL \Input[2]~input_o\ : std_logic;
SIGNAL \RAMM|Data~146_combout\ : std_logic;
SIGNAL \RAMM|Data~178_combout\ : std_logic;
SIGNAL \RAMM|Data~130_combout\ : std_logic;
SIGNAL \RAMM|Data~162_combout\ : std_logic;
SIGNAL \RAMM|Data~278_combout\ : std_logic;
SIGNAL \RAMM|Data~279_combout\ : std_logic;
SIGNAL \RAMM|Data~50_combout\ : std_logic;
SIGNAL \RAMM|Data~18_combout\ : std_logic;
SIGNAL \RAMM|Data~34_combout\ : std_logic;
SIGNAL \RAMM|Data~2_combout\ : std_logic;
SIGNAL \RAMM|Data~280_combout\ : std_logic;
SIGNAL \RAMM|Data~281_combout\ : std_logic;
SIGNAL \RAMM|Data~282_combout\ : std_logic;
SIGNAL \RAMM|Data~98_combout\ : std_logic;
SIGNAL \RAMM|Data~114_combout\ : std_logic;
SIGNAL \RAMM|Data~82_combout\ : std_logic;
SIGNAL \RAMM|Data~66_combout\ : std_logic;
SIGNAL \RAMM|Data~276_combout\ : std_logic;
SIGNAL \RAMM|Data~277_combout\ : std_logic;
SIGNAL \RAMM|Data~242_combout\ : std_logic;
SIGNAL \RAMM|Data~226_combout\ : std_logic;
SIGNAL \RAMM|Data~194_combout\ : std_logic;
SIGNAL \RAMM|Data~210_combout\ : std_logic;
SIGNAL \RAMM|Data~283_combout\ : std_logic;
SIGNAL \RAMM|Data~284_combout\ : std_logic;
SIGNAL \RAMM|Data~285_combout\ : std_logic;
SIGNAL \d|D_OUT[2]~3_combout\ : std_logic;
SIGNAL \A|Add2~6_combout\ : std_logic;
SIGNAL \A|Add1~6_combout\ : std_logic;
SIGNAL \A|Add0~6_combout\ : std_logic;
SIGNAL \A|temp~64_combout\ : std_logic;
SIGNAL \A|temp~65_combout\ : std_logic;
SIGNAL \A|temp~105_combout\ : std_logic;
SIGNAL \A|temp~106_combout\ : std_logic;
SIGNAL \A|temp[3]~98_combout\ : std_logic;
SIGNAL \A|temp~66_combout\ : std_logic;
SIGNAL \A|Add2~10_combout\ : std_logic;
SIGNAL \A|Add0~10_combout\ : std_logic;
SIGNAL \A|Add1~10_combout\ : std_logic;
SIGNAL \A|temp~72_combout\ : std_logic;
SIGNAL \A|temp~73_combout\ : std_logic;
SIGNAL \A|temp~103_combout\ : std_logic;
SIGNAL \A|temp~104_combout\ : std_logic;
SIGNAL \A|temp[5]~99_combout\ : std_logic;
SIGNAL \A|temp~74_combout\ : std_logic;
SIGNAL \d|Equal0~1_combout\ : std_logic;
SIGNAL \d|Equal0~2_combout\ : std_logic;
SIGNAL \d|Equal0~3_combout\ : std_logic;
SIGNAL \d|Equal0~0_combout\ : std_logic;
SIGNAL \d|Equal0~4_combout\ : std_logic;
SIGNAL \d|D_OUT[2]~4_combout\ : std_logic;
SIGNAL \IR|Equal5~0_combout\ : std_logic;
SIGNAL \IR|Equal7~1_combout\ : std_logic;
SIGNAL \IR|Equal5~1_combout\ : std_logic;
SIGNAL \CTRLM|C2~5_combout\ : std_logic;
SIGNAL \CTRLM|C2~4_combout\ : std_logic;
SIGNAL \CTRLM|Code8~0_combout\ : std_logic;
SIGNAL \CTRLM|IPC~0_combout\ : std_logic;
SIGNAL \CTRLM|ESUM~1_combout\ : std_logic;
SIGNAL \d|D_OUT[0]~1_combout\ : std_logic;
SIGNAL \IR|Equal6~0_combout\ : std_logic;
SIGNAL \IR|Equal0~0_combout\ : std_logic;
SIGNAL \IR|Equal6~1_combout\ : std_logic;
SIGNAL \IR|Equal7~2_combout\ : std_logic;
SIGNAL \IR|WideOr3~1_combout\ : std_logic;
SIGNAL \CTRLM|EDR~0_combout\ : std_logic;
SIGNAL \CTRLM|R~0_combout\ : std_logic;
SIGNAL \CTRLM|R~0clkctrl_outclk\ : std_logic;
SIGNAL \A|Add2~14_combout\ : std_logic;
SIGNAL \A|Add0~14_combout\ : std_logic;
SIGNAL \A|Add1~14_combout\ : std_logic;
SIGNAL \A|temp~80_combout\ : std_logic;
SIGNAL \A|temp~81_combout\ : std_logic;
SIGNAL \A|temp~101_combout\ : std_logic;
SIGNAL \A|temp~102_combout\ : std_logic;
SIGNAL \A|temp[7]~100_combout\ : std_logic;
SIGNAL \A|temp~82_combout\ : std_logic;
SIGNAL \Input[7]~input_o\ : std_logic;
SIGNAL \RAMM|Data~119_combout\ : std_logic;
SIGNAL \RAMM|Data~247_combout\ : std_logic;
SIGNAL \RAMM|Data~55_combout\ : std_logic;
SIGNAL \RAMM|Data~183_combout\ : std_logic;
SIGNAL \RAMM|Data~333_combout\ : std_logic;
SIGNAL \RAMM|Data~334_combout\ : std_logic;
SIGNAL \RAMM|Data~215_combout\ : std_logic;
SIGNAL \RAMM|Data~87_combout\ : std_logic;
SIGNAL \RAMM|Data~151_combout\ : std_logic;
SIGNAL \RAMM|Data~23_combout\ : std_logic;
SIGNAL \RAMM|Data~326_combout\ : std_logic;
SIGNAL \RAMM|Data~327_combout\ : std_logic;
SIGNAL \RAMM|Data~231_combout\ : std_logic;
SIGNAL \RAMM|Data~167_combout\ : std_logic;
SIGNAL \RAMM|Data~103_combout\ : std_logic;
SIGNAL \RAMM|Data~39_combout\ : std_logic;
SIGNAL \RAMM|Data~328_combout\ : std_logic;
SIGNAL \RAMM|Data~329_combout\ : std_logic;
SIGNAL \RAMM|Data~135_combout\ : std_logic;
SIGNAL \RAMM|Data~199_combout\ : std_logic;
SIGNAL \RAMM|Data~71_combout\ : std_logic;
SIGNAL \RAMM|Data~7_combout\ : std_logic;
SIGNAL \RAMM|Data~330_combout\ : std_logic;
SIGNAL \RAMM|Data~331_combout\ : std_logic;
SIGNAL \RAMM|Data~332_combout\ : std_logic;
SIGNAL \RAMM|Data~335_combout\ : std_logic;
SIGNAL \DR|temp[7]~feeder_combout\ : std_logic;
SIGNAL \d|D_OUT[7]~9_combout\ : std_logic;
SIGNAL \IR|Equal1~0_combout\ : std_logic;
SIGNAL \IR|Equal0~1_combout\ : std_logic;
SIGNAL \IR|Equal0~2_combout\ : std_logic;
SIGNAL \IR|Equal0~3_combout\ : std_logic;
SIGNAL \IR|Equal1~1_combout\ : std_logic;
SIGNAL \IR|Equal2~1_combout\ : std_logic;
SIGNAL \IR|Equal2~0_combout\ : std_logic;
SIGNAL \IR|Equal2~2_combout\ : std_logic;
SIGNAL \IR|Equal2~3_combout\ : std_logic;
SIGNAL \A|temp~16_combout\ : std_logic;
SIGNAL \A|temp~19_combout\ : std_logic;
SIGNAL \A|Add2~12_combout\ : std_logic;
SIGNAL \A|Add1~12_combout\ : std_logic;
SIGNAL \A|Add0~12_combout\ : std_logic;
SIGNAL \A|temp~56_combout\ : std_logic;
SIGNAL \A|temp~57_combout\ : std_logic;
SIGNAL \A|temp~107_combout\ : std_logic;
SIGNAL \A|temp~108_combout\ : std_logic;
SIGNAL \A|temp[6]~97_combout\ : std_logic;
SIGNAL \A|temp~58_combout\ : std_logic;
SIGNAL \d|D_OUT[6]~8_combout\ : std_logic;
SIGNAL \IR|Equal8~0_combout\ : std_logic;
SIGNAL \IR|Equal8~1_combout\ : std_logic;
SIGNAL \IR|WideOr0~2_combout\ : std_logic;
SIGNAL \CTRLM|Code15~combout\ : std_logic;
SIGNAL \CTRLM|IMAR~2_combout\ : std_logic;
SIGNAL \Input[5]~input_o\ : std_logic;
SIGNAL \RAMM|Data~245_combout\ : std_logic;
SIGNAL \RAMM|Data~181_combout\ : std_logic;
SIGNAL \RAMM|Data~53_combout\ : std_logic;
SIGNAL \RAMM|Data~117_combout\ : std_logic;
SIGNAL \RAMM|Data~313_combout\ : std_logic;
SIGNAL \RAMM|Data~314_combout\ : std_logic;
SIGNAL \RAMM|Data~229_combout\ : std_logic;
SIGNAL \RAMM|Data~101_combout\ : std_logic;
SIGNAL \RAMM|Data~37_combout\ : std_logic;
SIGNAL \RAMM|Data~165_combout\ : std_logic;
SIGNAL \RAMM|Data~306_combout\ : std_logic;
SIGNAL \RAMM|Data~307_combout\ : std_logic;
SIGNAL \RAMM|Data~149_combout\ : std_logic;
SIGNAL \RAMM|Data~85_combout\ : std_logic;
SIGNAL \RAMM|Data~21_combout\ : std_logic;
SIGNAL \RAMM|Data~308_combout\ : std_logic;
SIGNAL \RAMM|Data~213_combout\ : std_logic;
SIGNAL \RAMM|Data~309_combout\ : std_logic;
SIGNAL \RAMM|Data~197_combout\ : std_logic;
SIGNAL \RAMM|Data~69_combout\ : std_logic;
SIGNAL \RAMM|Data~133_combout\ : std_logic;
SIGNAL \RAMM|Data~5_combout\ : std_logic;
SIGNAL \RAMM|Data~310_combout\ : std_logic;
SIGNAL \RAMM|Data~311_combout\ : std_logic;
SIGNAL \RAMM|Data~312_combout\ : std_logic;
SIGNAL \RAMM|Data~315_combout\ : std_logic;
SIGNAL \d|D_OUT[5]~7_combout\ : std_logic;
SIGNAL \IR|Equal3~0_combout\ : std_logic;
SIGNAL \IR|Equal4~0_combout\ : std_logic;
SIGNAL \IR|Equal4~1_combout\ : std_logic;
SIGNAL \CTRLM|C2~2_combout\ : std_logic;
SIGNAL \IR|Equal0~4_combout\ : std_logic;
SIGNAL \IR|Equal0~5_combout\ : std_logic;
SIGNAL \IR|WideNor0~combout\ : std_logic;
SIGNAL \CTRLM|C2~3_combout\ : std_logic;
SIGNAL \CTRLM|IPC~1_combout\ : std_logic;
SIGNAL \CTRLM|IPC~2_combout\ : std_logic;
SIGNAL \P|temp[1]~1_combout\ : std_logic;
SIGNAL \P|temp[2]~2_combout\ : std_logic;
SIGNAL \Input[10]~input_o\ : std_logic;
SIGNAL \RAMM|Data~106_combout\ : std_logic;
SIGNAL \RAMM|Data~122_combout\ : std_logic;
SIGNAL \RAMM|Data~74_combout\ : std_logic;
SIGNAL \RAMM|Data~90_combout\ : std_logic;
SIGNAL \RAMM|Data~356_combout\ : std_logic;
SIGNAL \RAMM|Data~357_combout\ : std_logic;
SIGNAL \RAMM|Data~186_combout\ : std_logic;
SIGNAL \RAMM|Data~170_combout\ : std_logic;
SIGNAL \RAMM|Data~138_combout\ : std_logic;
SIGNAL \RAMM|Data~358_combout\ : std_logic;
SIGNAL \RAMM|Data~154_combout\ : std_logic;
SIGNAL \RAMM|Data~359_combout\ : std_logic;
SIGNAL \RAMM|Data~26_combout\ : std_logic;
SIGNAL \RAMM|Data~58_combout\ : std_logic;
SIGNAL \RAMM|Data~42_combout\ : std_logic;
SIGNAL \RAMM|Data~10_combout\ : std_logic;
SIGNAL \RAMM|Data~360_combout\ : std_logic;
SIGNAL \RAMM|Data~361_combout\ : std_logic;
SIGNAL \RAMM|Data~362_combout\ : std_logic;
SIGNAL \RAMM|Data~250_combout\ : std_logic;
SIGNAL \RAMM|Data~234_combout\ : std_logic;
SIGNAL \RAMM|Data~202_combout\ : std_logic;
SIGNAL \RAMM|Data~218_combout\ : std_logic;
SIGNAL \RAMM|Data~363_combout\ : std_logic;
SIGNAL \RAMM|Data~364_combout\ : std_logic;
SIGNAL \RAMM|Data~365_combout\ : std_logic;
SIGNAL \DR|temp[10]~feeder_combout\ : std_logic;
SIGNAL \d|D_OUT[10]~12_combout\ : std_logic;
SIGNAL \A|Add2~20_combout\ : std_logic;
SIGNAL \A|temp~27_combout\ : std_logic;
SIGNAL \A|Add0~20_combout\ : std_logic;
SIGNAL \A|Add1~20_combout\ : std_logic;
SIGNAL \A|temp~28_combout\ : std_logic;
SIGNAL \A|temp~29_combout\ : std_logic;
SIGNAL \A|temp~30_combout\ : std_logic;
SIGNAL \A|temp[10]~86_combout\ : std_logic;
SIGNAL \A|temp~31_combout\ : std_logic;
SIGNAL \d|Equal0~5_combout\ : std_logic;
SIGNAL \Input[3]~input_o\ : std_logic;
SIGNAL \RAMM|Data~83_combout\ : std_logic;
SIGNAL \RAMM|Data~19_combout\ : std_logic;
SIGNAL \RAMM|Data~147_combout\ : std_logic;
SIGNAL \RAMM|Data~286_combout\ : std_logic;
SIGNAL \RAMM|Data~211_combout\ : std_logic;
SIGNAL \RAMM|Data~287_combout\ : std_logic;
SIGNAL \RAMM|Data~243_combout\ : std_logic;
SIGNAL \RAMM|Data~115_combout\ : std_logic;
SIGNAL \RAMM|Data~179_combout\ : std_logic;
SIGNAL \RAMM|Data~51_combout\ : std_logic;
SIGNAL \RAMM|Data~293_combout\ : std_logic;
SIGNAL \RAMM|Data~294_combout\ : std_logic;
SIGNAL \RAMM|Data~227_combout\ : std_logic;
SIGNAL \RAMM|Data~99_combout\ : std_logic;
SIGNAL \RAMM|Data~35_combout\ : std_logic;
SIGNAL \RAMM|Data~288_combout\ : std_logic;
SIGNAL \RAMM|Data~163_combout\ : std_logic;
SIGNAL \RAMM|Data~289_combout\ : std_logic;
SIGNAL \RAMM|Data~131_combout\ : std_logic;
SIGNAL \RAMM|Data~195_combout\ : std_logic;
SIGNAL \RAMM|Data~67_combout\ : std_logic;
SIGNAL \RAMM|Data~3_combout\ : std_logic;
SIGNAL \RAMM|Data~290_combout\ : std_logic;
SIGNAL \RAMM|Data~291_combout\ : std_logic;
SIGNAL \RAMM|Data~292_combout\ : std_logic;
SIGNAL \RAMM|Data~295_combout\ : std_logic;
SIGNAL \d|D_OUT[3]~5_combout\ : std_logic;
SIGNAL \IR|Equal9~0_combout\ : std_logic;
SIGNAL \CTRLM|Code4~0_combout\ : std_logic;
SIGNAL \CTRLM|ESUM~0_combout\ : std_logic;
SIGNAL \CTRLM|W~0_combout\ : std_logic;
SIGNAL \A|Add2~28_combout\ : std_logic;
SIGNAL \A|temp~43_combout\ : std_logic;
SIGNAL \A|Add0~28_combout\ : std_logic;
SIGNAL \A|Add1~28_combout\ : std_logic;
SIGNAL \A|temp~44_combout\ : std_logic;
SIGNAL \A|temp~45_combout\ : std_logic;
SIGNAL \A|temp~46_combout\ : std_logic;
SIGNAL \A|temp[14]~88_combout\ : std_logic;
SIGNAL \A|temp~47_combout\ : std_logic;
SIGNAL \Input[14]~input_o\ : std_logic;
SIGNAL \RAMM|Data~254_combout\ : std_logic;
SIGNAL \RAMM|Data~238_combout\ : std_logic;
SIGNAL \RAMM|Data~222_combout\ : std_logic;
SIGNAL \RAMM|Data~206_combout\ : std_logic;
SIGNAL \RAMM|Data~403_combout\ : std_logic;
SIGNAL \RAMM|Data~404_combout\ : std_logic;
SIGNAL \RAMM|Data~126_combout\ : std_logic;
SIGNAL \RAMM|Data~110_combout\ : std_logic;
SIGNAL \RAMM|Data~78_combout\ : std_logic;
SIGNAL \RAMM|Data~94_combout\ : std_logic;
SIGNAL \RAMM|Data~396_combout\ : std_logic;
SIGNAL \RAMM|Data~397_combout\ : std_logic;
SIGNAL \RAMM|Data~190_combout\ : std_logic;
SIGNAL \RAMM|Data~158_combout\ : std_logic;
SIGNAL \RAMM|Data~174_combout\ : std_logic;
SIGNAL \RAMM|Data~142_combout\ : std_logic;
SIGNAL \RAMM|Data~398_combout\ : std_logic;
SIGNAL \RAMM|Data~399_combout\ : std_logic;
SIGNAL \RAMM|Data~62_combout\ : std_logic;
SIGNAL \RAMM|Data~30_combout\ : std_logic;
SIGNAL \RAMM|Data~46_combout\ : std_logic;
SIGNAL \RAMM|Data~14_combout\ : std_logic;
SIGNAL \RAMM|Data~400_combout\ : std_logic;
SIGNAL \RAMM|Data~401_combout\ : std_logic;
SIGNAL \RAMM|Data~402_combout\ : std_logic;
SIGNAL \RAMM|Data~405_combout\ : std_logic;
SIGNAL \d|D_OUT[14]~16_combout\ : std_logic;
SIGNAL \IR|Equal7~0_combout\ : std_logic;
SIGNAL \IR|WideOr0~3_combout\ : std_logic;
SIGNAL \A|temp~22_combout\ : std_logic;
SIGNAL \A|Add2~0_combout\ : std_logic;
SIGNAL \A|temp~75_combout\ : std_logic;
SIGNAL \A|Add1~0_combout\ : std_logic;
SIGNAL \A|Add0~0_combout\ : std_logic;
SIGNAL \A|temp~76_combout\ : std_logic;
SIGNAL \A|temp~77_combout\ : std_logic;
SIGNAL \A|temp~78_combout\ : std_logic;
SIGNAL \A|temp[0]~92_combout\ : std_logic;
SIGNAL \A|temp~79_combout\ : std_logic;
SIGNAL \A|Equal8~2_combout\ : std_logic;
SIGNAL \A|Equal8~0_combout\ : std_logic;
SIGNAL \A|Equal8~3_combout\ : std_logic;
SIGNAL \A|Equal8~1_combout\ : std_logic;
SIGNAL \A|Equal8~4_combout\ : std_logic;
SIGNAL \A|Zero~combout\ : std_logic;
SIGNAL \A|Add2~33\ : std_logic;
SIGNAL \A|Add2~35\ : std_logic;
SIGNAL \A|Add2~37\ : std_logic;
SIGNAL \A|Add2~39\ : std_logic;
SIGNAL \A|Add2~41\ : std_logic;
SIGNAL \A|Add2~43\ : std_logic;
SIGNAL \A|Add2~45\ : std_logic;
SIGNAL \A|Add2~47\ : std_logic;
SIGNAL \A|Add2~49\ : std_logic;
SIGNAL \A|Add2~51\ : std_logic;
SIGNAL \A|Add2~53\ : std_logic;
SIGNAL \A|Add2~55\ : std_logic;
SIGNAL \A|Add2~57\ : std_logic;
SIGNAL \A|Add2~59\ : std_logic;
SIGNAL \A|Add2~61\ : std_logic;
SIGNAL \A|Add2~62_combout\ : std_logic;
SIGNAL \A|Add2~60_combout\ : std_logic;
SIGNAL \A|Add2~58_combout\ : std_logic;
SIGNAL \A|Add2~56_combout\ : std_logic;
SIGNAL \A|Add2~54_combout\ : std_logic;
SIGNAL \A|Add2~52_combout\ : std_logic;
SIGNAL \A|Add2~50_combout\ : std_logic;
SIGNAL \A|Add2~48_combout\ : std_logic;
SIGNAL \A|Add2~46_combout\ : std_logic;
SIGNAL \A|Add2~44_combout\ : std_logic;
SIGNAL \A|Add2~42_combout\ : std_logic;
SIGNAL \A|Add2~40_combout\ : std_logic;
SIGNAL \A|Add2~38_combout\ : std_logic;
SIGNAL \A|Add2~36_combout\ : std_logic;
SIGNAL \A|Add2~34_combout\ : std_logic;
SIGNAL \A|Add2~32_combout\ : std_logic;
SIGNAL \A|LessThan3~1_cout\ : std_logic;
SIGNAL \A|LessThan3~3_cout\ : std_logic;
SIGNAL \A|LessThan3~5_cout\ : std_logic;
SIGNAL \A|LessThan3~7_cout\ : std_logic;
SIGNAL \A|LessThan3~9_cout\ : std_logic;
SIGNAL \A|LessThan3~11_cout\ : std_logic;
SIGNAL \A|LessThan3~13_cout\ : std_logic;
SIGNAL \A|LessThan3~15_cout\ : std_logic;
SIGNAL \A|LessThan3~17_cout\ : std_logic;
SIGNAL \A|LessThan3~19_cout\ : std_logic;
SIGNAL \A|LessThan3~21_cout\ : std_logic;
SIGNAL \A|LessThan3~23_cout\ : std_logic;
SIGNAL \A|LessThan3~25_cout\ : std_logic;
SIGNAL \A|LessThan3~27_cout\ : std_logic;
SIGNAL \A|LessThan3~29_cout\ : std_logic;
SIGNAL \A|LessThan3~30_combout\ : std_logic;
SIGNAL \A|Over~0_combout\ : std_logic;
SIGNAL \A|LessThan0~1_cout\ : std_logic;
SIGNAL \A|LessThan0~3_cout\ : std_logic;
SIGNAL \A|LessThan0~5_cout\ : std_logic;
SIGNAL \A|LessThan0~7_cout\ : std_logic;
SIGNAL \A|LessThan0~9_cout\ : std_logic;
SIGNAL \A|LessThan0~11_cout\ : std_logic;
SIGNAL \A|LessThan0~13_cout\ : std_logic;
SIGNAL \A|LessThan0~15_cout\ : std_logic;
SIGNAL \A|LessThan0~17_cout\ : std_logic;
SIGNAL \A|LessThan0~19_cout\ : std_logic;
SIGNAL \A|LessThan0~21_cout\ : std_logic;
SIGNAL \A|LessThan0~23_cout\ : std_logic;
SIGNAL \A|LessThan0~25_cout\ : std_logic;
SIGNAL \A|LessThan0~27_cout\ : std_logic;
SIGNAL \A|LessThan0~29_cout\ : std_logic;
SIGNAL \A|LessThan0~30_combout\ : std_logic;
SIGNAL \A|LessThan1~1_cout\ : std_logic;
SIGNAL \A|LessThan1~3_cout\ : std_logic;
SIGNAL \A|LessThan1~5_cout\ : std_logic;
SIGNAL \A|LessThan1~7_cout\ : std_logic;
SIGNAL \A|LessThan1~9_cout\ : std_logic;
SIGNAL \A|LessThan1~11_cout\ : std_logic;
SIGNAL \A|LessThan1~13_cout\ : std_logic;
SIGNAL \A|LessThan1~15_cout\ : std_logic;
SIGNAL \A|LessThan1~17_cout\ : std_logic;
SIGNAL \A|LessThan1~19_cout\ : std_logic;
SIGNAL \A|LessThan1~21_cout\ : std_logic;
SIGNAL \A|LessThan1~23_cout\ : std_logic;
SIGNAL \A|LessThan1~25_cout\ : std_logic;
SIGNAL \A|LessThan1~27_cout\ : std_logic;
SIGNAL \A|LessThan1~29_cout\ : std_logic;
SIGNAL \A|LessThan1~30_combout\ : std_logic;
SIGNAL \A|Over~1_combout\ : std_logic;
SIGNAL \A|Over~2_combout\ : std_logic;
SIGNAL \A|Over~combout\ : std_logic;
SIGNAL \A|Add3~1\ : std_logic;
SIGNAL \A|Add3~3\ : std_logic;
SIGNAL \A|Add3~5\ : std_logic;
SIGNAL \A|Add3~7\ : std_logic;
SIGNAL \A|Add3~9\ : std_logic;
SIGNAL \A|Add3~11\ : std_logic;
SIGNAL \A|Add3~13\ : std_logic;
SIGNAL \A|Add3~15\ : std_logic;
SIGNAL \A|Add3~17\ : std_logic;
SIGNAL \A|Add3~19\ : std_logic;
SIGNAL \A|Add3~21\ : std_logic;
SIGNAL \A|Add3~23\ : std_logic;
SIGNAL \A|Add3~25\ : std_logic;
SIGNAL \A|Add3~27\ : std_logic;
SIGNAL \A|Add3~29\ : std_logic;
SIGNAL \A|Add3~30_combout\ : std_logic;
SIGNAL \A|Add3~28_combout\ : std_logic;
SIGNAL \A|Add3~26_combout\ : std_logic;
SIGNAL \A|Add3~24_combout\ : std_logic;
SIGNAL \A|Add3~22_combout\ : std_logic;
SIGNAL \A|Add3~20_combout\ : std_logic;
SIGNAL \A|Add3~18_combout\ : std_logic;
SIGNAL \A|Add3~16_combout\ : std_logic;
SIGNAL \A|Add3~14_combout\ : std_logic;
SIGNAL \A|Add3~12_combout\ : std_logic;
SIGNAL \A|Add3~10_combout\ : std_logic;
SIGNAL \A|Add3~8_combout\ : std_logic;
SIGNAL \A|Add3~6_combout\ : std_logic;
SIGNAL \A|Add3~4_combout\ : std_logic;
SIGNAL \A|Add3~2_combout\ : std_logic;
SIGNAL \A|Add3~0_combout\ : std_logic;
SIGNAL \A|LessThan4~1_cout\ : std_logic;
SIGNAL \A|LessThan4~3_cout\ : std_logic;
SIGNAL \A|LessThan4~5_cout\ : std_logic;
SIGNAL \A|LessThan4~7_cout\ : std_logic;
SIGNAL \A|LessThan4~9_cout\ : std_logic;
SIGNAL \A|LessThan4~11_cout\ : std_logic;
SIGNAL \A|LessThan4~13_cout\ : std_logic;
SIGNAL \A|LessThan4~15_cout\ : std_logic;
SIGNAL \A|LessThan4~17_cout\ : std_logic;
SIGNAL \A|LessThan4~19_cout\ : std_logic;
SIGNAL \A|LessThan4~21_cout\ : std_logic;
SIGNAL \A|LessThan4~23_cout\ : std_logic;
SIGNAL \A|LessThan4~25_cout\ : std_logic;
SIGNAL \A|LessThan4~27_cout\ : std_logic;
SIGNAL \A|LessThan4~29_cout\ : std_logic;
SIGNAL \A|LessThan4~30_combout\ : std_logic;
SIGNAL \A|LessThan2~1_cout\ : std_logic;
SIGNAL \A|LessThan2~3_cout\ : std_logic;
SIGNAL \A|LessThan2~5_cout\ : std_logic;
SIGNAL \A|LessThan2~7_cout\ : std_logic;
SIGNAL \A|LessThan2~9_cout\ : std_logic;
SIGNAL \A|LessThan2~11_cout\ : std_logic;
SIGNAL \A|LessThan2~13_cout\ : std_logic;
SIGNAL \A|LessThan2~15_cout\ : std_logic;
SIGNAL \A|LessThan2~17_cout\ : std_logic;
SIGNAL \A|LessThan2~19_cout\ : std_logic;
SIGNAL \A|LessThan2~21_cout\ : std_logic;
SIGNAL \A|LessThan2~23_cout\ : std_logic;
SIGNAL \A|LessThan2~25_cout\ : std_logic;
SIGNAL \A|LessThan2~27_cout\ : std_logic;
SIGNAL \A|LessThan2~29_cout\ : std_logic;
SIGNAL \A|LessThan2~30_combout\ : std_logic;
SIGNAL \A|Nege~0_combout\ : std_logic;
SIGNAL \A|Nege~1_combout\ : std_logic;
SIGNAL \A|Nege~combout\ : std_logic;
SIGNAL \IR|STOP~combout\ : std_logic;
SIGNAL \CTRLM|EDR~1_combout\ : std_logic;
SIGNAL \CTRLM|EDR~2_combout\ : std_logic;
SIGNAL \CTRLM|EDR~3_combout\ : std_logic;
SIGNAL \CTRLM|EDR~4_combout\ : std_logic;
SIGNAL \IR|temp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ACC|temp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CT|temp\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \MAR|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \A|temp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \DR|temp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CL|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \P|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \A|DO\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \RAMM|DO\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CL|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \IR|ALT_INV_WideOr3~1_combout\ : std_logic;
SIGNAL \CT|ALT_INV_temp\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \IR|ALT_INV_WideNor0~combout\ : std_logic;
SIGNAL \IR|ALT_INV_WideOr0~2_combout\ : std_logic;
SIGNAL \ALT_INV_CLR~input_o\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_CLR <= CLR;
ww_CS <= CS;
ww_WR <= WR;
ww_Add_IN <= Add_IN;
ww_Input <= Input;
ALU_OUT <= ww_ALU_OUT;
Zero <= ww_Zero;
Over <= ww_Over;
Nege <= ww_Nege;
ERROR <= ww_ERROR;
STOP <= ww_STOP;
Tap <= ww_Tap;
Code_IR <= ww_Code_IR;
IPC_O <= ww_IPC_O;
IMAR_O <= ww_IMAR_O;
IDR_O <= ww_IDR_O;
EDR_O <= ww_EDR_O;
W_O <= ww_W_O;
R_O <= ww_R_O;
ISUM_O <= ww_ISUM_O;
ESUM_O <= ww_ESUM_O;
IIR_O <= ww_IIR_O;
ABUS_O <= ww_ABUS_O;
dbus_O <= ww_dbus_O;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RAMM|DO[15]~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RAMM|DO[15]~0_combout\);

\CL|temp~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CL|temp~0_combout\);

\A|temp[0]~85clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \A|temp[0]~85_combout\);

\CTRLM|R~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CTRLM|R~0_combout\);

\rtl~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~0_combout\);

\rtl~10clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~10_combout\);

\rtl~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~1_combout\);

\rtl~13clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~13_combout\);

\rtl~12clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~12_combout\);

\rtl~11clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~11_combout\);
\CL|ALT_INV_Equal0~0_combout\ <= NOT \CL|Equal0~0_combout\;
\IR|ALT_INV_WideOr3~1_combout\ <= NOT \IR|WideOr3~1_combout\;
\CT|ALT_INV_temp\(0) <= NOT \CT|temp\(0);
\IR|ALT_INV_WideNor0~combout\ <= NOT \IR|WideNor0~combout\;
\IR|ALT_INV_WideOr0~2_combout\ <= NOT \IR|WideOr0~2_combout\;
\ALT_INV_CLR~input_o\ <= NOT \CLR~input_o\;

-- Location: IOOBUF_X16_Y0_N2
\ALU_OUT[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(0),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[0]~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\ALU_OUT[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(1),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\ALU_OUT[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(2),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[2]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\ALU_OUT[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(3),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[3]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\ALU_OUT[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(4),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[4]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\ALU_OUT[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(5),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[5]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\ALU_OUT[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(6),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[6]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\ALU_OUT[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(7),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[7]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\ALU_OUT[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(8),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[8]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\ALU_OUT[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(9),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[9]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\ALU_OUT[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(10),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[10]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\ALU_OUT[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(11),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[11]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\ALU_OUT[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(12),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[12]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\ALU_OUT[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(13),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[13]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\ALU_OUT[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(14),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[14]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\ALU_OUT[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|DO\(15),
	oe => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OUT[15]~output_o\);

-- Location: IOOBUF_X34_Y3_N23
\Zero~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|Zero~combout\,
	devoe => ww_devoe,
	o => \Zero~output_o\);

-- Location: IOOBUF_X34_Y2_N23
\Over~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|Over~combout\,
	devoe => ww_devoe,
	o => \Over~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\Nege~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A|Nege~combout\,
	devoe => ww_devoe,
	o => \Nege~output_o\);

-- Location: IOOBUF_X0_Y21_N9
\ERROR~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|ALT_INV_WideNor0~combout\,
	devoe => ww_devoe,
	o => \ERROR~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\STOP~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|STOP~combout\,
	devoe => ww_devoe,
	o => \STOP~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\Tap[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|ALT_INV_temp\(0),
	devoe => ww_devoe,
	o => \Tap[0]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\Tap[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(1),
	devoe => ww_devoe,
	o => \Tap[1]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\Tap[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(2),
	devoe => ww_devoe,
	o => \Tap[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\Tap[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(3),
	devoe => ww_devoe,
	o => \Tap[3]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\Tap[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(4),
	devoe => ww_devoe,
	o => \Tap[4]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\Tap[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(5),
	devoe => ww_devoe,
	o => \Tap[5]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\Tap[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(6),
	devoe => ww_devoe,
	o => \Tap[6]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\Tap[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CT|temp\(7),
	devoe => ww_devoe,
	o => \Tap[7]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\Code_IR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|ALT_INV_WideOr3~1_combout\,
	devoe => ww_devoe,
	o => \Code_IR[0]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\Code_IR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => \Code_IR[1]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\Code_IR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => \Code_IR[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\Code_IR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|ALT_INV_WideOr0~2_combout\,
	devoe => ww_devoe,
	o => \Code_IR[3]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\IPC_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|IPC~2_combout\,
	devoe => ww_devoe,
	o => \IPC_O~output_o\);

-- Location: IOOBUF_X1_Y24_N2
\IMAR_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|IMAR~2_combout\,
	devoe => ww_devoe,
	o => \IMAR_O~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\IDR_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|IDR~2_combout\,
	devoe => ww_devoe,
	o => \IDR_O~output_o\);

-- Location: IOOBUF_X34_Y2_N16
\EDR_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|EDR~4_combout\,
	devoe => ww_devoe,
	o => \EDR_O~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\W_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|W~0_combout\,
	devoe => ww_devoe,
	o => \W_O~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\R_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|R~0_combout\,
	devoe => ww_devoe,
	o => \R_O~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\ISUM_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|R~0_combout\,
	devoe => ww_devoe,
	o => \ISUM_O~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\ESUM_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|ESUM~1_combout\,
	devoe => ww_devoe,
	o => \ESUM_O~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\IIR_O~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTRLM|IIR~3_combout\,
	devoe => ww_devoe,
	o => \IIR_O~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\ABUS_O[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MAR|temp\(0),
	devoe => ww_devoe,
	o => \ABUS_O[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\ABUS_O[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MAR|temp\(1),
	devoe => ww_devoe,
	o => \ABUS_O[1]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\ABUS_O[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MAR|temp\(2),
	devoe => ww_devoe,
	o => \ABUS_O[2]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\ABUS_O[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MAR|temp\(3),
	devoe => ww_devoe,
	o => \ABUS_O[3]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\dbus_O[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[0]~1_combout\,
	devoe => ww_devoe,
	o => \dbus_O[0]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\dbus_O[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[1]~2_combout\,
	devoe => ww_devoe,
	o => \dbus_O[1]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\dbus_O[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[2]~4_combout\,
	devoe => ww_devoe,
	o => \dbus_O[2]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\dbus_O[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[3]~5_combout\,
	devoe => ww_devoe,
	o => \dbus_O[3]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\dbus_O[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[4]~6_combout\,
	devoe => ww_devoe,
	o => \dbus_O[4]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\dbus_O[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[5]~7_combout\,
	devoe => ww_devoe,
	o => \dbus_O[5]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\dbus_O[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[6]~8_combout\,
	devoe => ww_devoe,
	o => \dbus_O[6]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\dbus_O[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[7]~9_combout\,
	devoe => ww_devoe,
	o => \dbus_O[7]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\dbus_O[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[8]~10_combout\,
	devoe => ww_devoe,
	o => \dbus_O[8]~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\dbus_O[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[9]~11_combout\,
	devoe => ww_devoe,
	o => \dbus_O[9]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\dbus_O[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[10]~12_combout\,
	devoe => ww_devoe,
	o => \dbus_O[10]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\dbus_O[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[11]~13_combout\,
	devoe => ww_devoe,
	o => \dbus_O[11]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\dbus_O[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[12]~14_combout\,
	devoe => ww_devoe,
	o => \dbus_O[12]~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\dbus_O[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[13]~15_combout\,
	devoe => ww_devoe,
	o => \dbus_O[13]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\dbus_O[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[14]~16_combout\,
	devoe => ww_devoe,
	o => \dbus_O[14]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\dbus_O[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d|D_OUT[15]~17_combout\,
	devoe => ww_devoe,
	o => \dbus_O[15]~output_o\);

-- Location: IOIBUF_X34_Y12_N15
\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: LCCOMB_X19_Y10_N22
\CL|counter[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[0]~3_combout\ = !\CL|counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CL|counter\(0),
	combout => \CL|counter[0]~3_combout\);

-- Location: LCCOMB_X19_Y10_N24
\CL|counter[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[0]~feeder_combout\ = \CL|counter[0]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CL|counter[0]~3_combout\,
	combout => \CL|counter[0]~feeder_combout\);

-- Location: FF_X19_Y10_N25
\CL|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \CL|counter[0]~feeder_combout\,
	clrn => \CL|ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CL|counter\(0));

-- Location: LCCOMB_X19_Y10_N26
\CL|counter[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[1]~1_combout\ = \CL|counter\(0) $ (\CL|counter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CL|counter\(0),
	datac => \CL|counter\(1),
	combout => \CL|counter[1]~1_combout\);

-- Location: LCCOMB_X19_Y10_N4
\CL|counter[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[1]~feeder_combout\ = \CL|counter[1]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CL|counter[1]~1_combout\,
	combout => \CL|counter[1]~feeder_combout\);

-- Location: FF_X19_Y10_N5
\CL|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \CL|counter[1]~feeder_combout\,
	clrn => \CL|ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CL|counter\(1));

-- Location: LCCOMB_X19_Y10_N20
\CL|counter[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[2]~2_combout\ = \CL|counter\(2) $ (((\CL|counter\(0) & \CL|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CL|counter\(0),
	datac => \CL|counter\(2),
	datad => \CL|counter\(1),
	combout => \CL|counter[2]~2_combout\);

-- Location: FF_X19_Y10_N21
\CL|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \CL|counter[2]~2_combout\,
	clrn => \CL|ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CL|counter\(2));

-- Location: LCCOMB_X19_Y10_N14
\CL|counter[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|counter[3]~0_combout\ = \CL|counter\(3) $ (((\CL|counter\(0) & (\CL|counter\(2) & \CL|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CL|counter\(0),
	datab => \CL|counter\(2),
	datac => \CL|counter\(3),
	datad => \CL|counter\(1),
	combout => \CL|counter[3]~0_combout\);

-- Location: FF_X19_Y10_N15
\CL|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \CL|counter[3]~0_combout\,
	clrn => \CL|ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CL|counter\(3));

-- Location: LCCOMB_X19_Y10_N28
\CL|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|Equal0~0_combout\ = (!\CL|counter\(0) & (\CL|counter\(1) & (\CL|counter\(3) & !\CL|counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CL|counter\(0),
	datab => \CL|counter\(1),
	datac => \CL|counter\(3),
	datad => \CL|counter\(2),
	combout => \CL|Equal0~0_combout\);

-- Location: LCCOMB_X19_Y10_N30
\CL|temp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CL|temp~0_combout\ = \CL|temp~0_combout\ $ (\CL|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CL|temp~0_combout\,
	datad => \CL|Equal0~0_combout\,
	combout => \CL|temp~0_combout\);

-- Location: CLKCTRL_G4
\CL|temp~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CL|temp~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CL|temp~0clkctrl_outclk\);

-- Location: IOIBUF_X0_Y11_N15
\CLR~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

-- Location: FF_X19_Y9_N23
\CT|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(5),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(6));

-- Location: FF_X19_Y9_N1
\CT|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(6),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(7));

-- Location: LCCOMB_X18_Y9_N16
\CT|temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CT|temp[0]~0_combout\ = !\CT|temp\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(7),
	combout => \CT|temp[0]~0_combout\);

-- Location: FF_X19_Y9_N7
\CT|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \CT|temp[0]~0_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(0));

-- Location: LCCOMB_X19_Y9_N0
\CT|temp[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CT|temp[1]~1_combout\ = !\CT|temp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(0),
	combout => \CT|temp[1]~1_combout\);

-- Location: FF_X19_Y9_N31
\CT|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp[1]~1_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(1));

-- Location: FF_X19_Y9_N15
\CT|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(1),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(2));

-- Location: FF_X19_Y9_N9
\CT|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(2),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(3));

-- Location: FF_X19_Y9_N5
\CT|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(3),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(4));

-- Location: FF_X19_Y9_N27
\CT|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \CT|temp\(4),
	clrn => \ALT_INV_CLR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CT|temp\(5));

-- Location: LCCOMB_X19_Y9_N2
\CTRLM|T4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T4~0_combout\ = (!\CT|temp\(2) & (\CT|temp\(4) & (!\CT|temp\(6) & !\CT|temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(2),
	datab => \CT|temp\(4),
	datac => \CT|temp\(6),
	datad => \CT|temp\(7),
	combout => \CTRLM|T4~0_combout\);

-- Location: LCCOMB_X19_Y9_N6
\CTRLM|T4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T4~1_combout\ = (!\CT|temp\(1) & !\CT|temp\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(1),
	datab => \CT|temp\(3),
	combout => \CTRLM|T4~1_combout\);

-- Location: LCCOMB_X19_Y9_N16
\CTRLM|T4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T4~2_combout\ = (!\CT|temp\(5) & (\CT|temp\(0) & (\CTRLM|T4~0_combout\ & \CTRLM|T4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(5),
	datab => \CT|temp\(0),
	datac => \CTRLM|T4~0_combout\,
	datad => \CTRLM|T4~1_combout\,
	combout => \CTRLM|T4~2_combout\);

-- Location: IOIBUF_X34_Y12_N22
\WR~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WR,
	o => \WR~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\CS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CS,
	o => \CS~input_o\);

-- Location: LCCOMB_X1_Y11_N4
\RAMM|DO[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO[15]~0_combout\ = (\WR~input_o\ & \CS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \RAMM|DO[15]~0_combout\);

-- Location: CLKCTRL_G1
\RAMM|DO[15]~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RAMM|DO[15]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RAMM|DO[15]~0clkctrl_outclk\);

-- Location: LCCOMB_X19_Y9_N12
\CTRLM|T5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T5~0_combout\ = (!\CT|temp\(6) & (!\CT|temp\(4) & \CT|temp\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(6),
	datac => \CT|temp\(4),
	datad => \CT|temp\(5),
	combout => \CTRLM|T5~0_combout\);

-- Location: LCCOMB_X19_Y9_N10
\CTRLM|T6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T6~0_combout\ = (!\CT|temp\(1) & (!\CT|temp\(7) & (!\CT|temp\(2) & \CT|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(1),
	datab => \CT|temp\(7),
	datac => \CT|temp\(2),
	datad => \CT|temp\(0),
	combout => \CTRLM|T6~0_combout\);

-- Location: LCCOMB_X19_Y9_N24
\CTRLM|T5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T5~1_combout\ = (\CTRLM|T5~0_combout\ & (!\CT|temp\(3) & \CTRLM|T6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T5~0_combout\,
	datac => \CT|temp\(3),
	datad => \CTRLM|T6~0_combout\,
	combout => \CTRLM|T5~1_combout\);

-- Location: LCCOMB_X19_Y9_N28
\CTRLM|T3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T3~0_combout\ = (!\CT|temp\(6) & (!\CT|temp\(4) & !\CT|temp\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(6),
	datac => \CT|temp\(4),
	datad => \CT|temp\(5),
	combout => \CTRLM|T3~0_combout\);

-- Location: LCCOMB_X19_Y9_N4
\CTRLM|IDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IDR~0_combout\ = (\CT|temp\(0) & (!\CT|temp\(7) & (!\CT|temp\(3) & \CTRLM|T3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(0),
	datab => \CT|temp\(7),
	datac => \CT|temp\(3),
	datad => \CTRLM|T3~0_combout\,
	combout => \CTRLM|IDR~0_combout\);

-- Location: LCCOMB_X19_Y9_N26
\CTRLM|IIR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IIR~2_combout\ = (!\CT|temp\(1) & (\CTRLM|IDR~0_combout\ & \CT|temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(1),
	datab => \CTRLM|IDR~0_combout\,
	datad => \CT|temp\(2),
	combout => \CTRLM|IIR~2_combout\);

-- Location: LCCOMB_X19_Y9_N20
\CTRLM|T3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T3~1_combout\ = (\CTRLM|T6~0_combout\ & (\CT|temp\(3) & \CTRLM|T3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T6~0_combout\,
	datac => \CT|temp\(3),
	datad => \CTRLM|T3~0_combout\,
	combout => \CTRLM|T3~1_combout\);

-- Location: LCCOMB_X19_Y9_N14
\CTRLM|IMAR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IMAR~0_combout\ = (!\CT|temp\(1) & (!\CT|temp\(0) & !\CT|temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(1),
	datab => \CT|temp\(0),
	datac => \CT|temp\(2),
	combout => \CTRLM|IMAR~0_combout\);

-- Location: LCCOMB_X19_Y9_N8
\CTRLM|IMAR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IMAR~1_combout\ = (\CTRLM|IMAR~0_combout\ & (\CTRLM|T3~0_combout\ & (!\CT|temp\(3) & !\CT|temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|IMAR~0_combout\,
	datab => \CTRLM|T3~0_combout\,
	datac => \CT|temp\(3),
	datad => \CT|temp\(7),
	combout => \CTRLM|IMAR~1_combout\);

-- Location: IOIBUF_X34_Y10_N8
\Add_IN[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Add_IN(3),
	o => \Add_IN[3]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\Add_IN[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Add_IN(0),
	o => \Add_IN[0]~input_o\);

-- Location: IOIBUF_X32_Y0_N8
\Add_IN[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Add_IN(1),
	o => \Add_IN[1]~input_o\);

-- Location: IOIBUF_X34_Y17_N1
\Add_IN[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Add_IN(2),
	o => \Add_IN[2]~input_o\);

-- Location: LCCOMB_X26_Y14_N26
\RAMM|Data~431\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~431_combout\ = (\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (\Add_IN[1]~input_o\ & \Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~431_combout\);

-- Location: LCCOMB_X25_Y14_N4
\rtl~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~15_combout\ = (\RAMM|Data~431_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~431_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~15_combout\);

-- Location: IOIBUF_X34_Y20_N8
\Input[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(6),
	o => \Input[6]~input_o\);

-- Location: LCCOMB_X25_Y14_N18
\RAMM|Data~246\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~246_combout\ = (\rtl~15_combout\ & (\Input[6]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~246_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~15_combout\,
	datac => \Input[6]~input_o\,
	datad => \RAMM|Data~246_combout\,
	combout => \RAMM|Data~246_combout\);

-- Location: LCCOMB_X33_Y13_N10
\RAMM|Data~429\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~429_combout\ = (!\Add_IN[0]~input_o\ & (\Add_IN[3]~input_o\ & (\Add_IN[1]~input_o\ & \Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[0]~input_o\,
	datab => \Add_IN[3]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~429_combout\);

-- Location: LCCOMB_X1_Y11_N10
\rtl~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~13_combout\ = (\CS~input_o\ & (\RAMM|Data~429_combout\ & !\WR~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CS~input_o\,
	datac => \RAMM|Data~429_combout\,
	datad => \WR~input_o\,
	combout => \rtl~13_combout\);

-- Location: CLKCTRL_G3
\rtl~13clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~13clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~13clkctrl_outclk\);

-- Location: LCCOMB_X26_Y15_N22
\RAMM|Data~230\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~230_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~230_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \RAMM|Data~230_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~230_combout\);

-- Location: LCCOMB_X26_Y13_N12
\RAMM|Data~430\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~430_combout\ = (!\Add_IN[0]~input_o\ & (!\Add_IN[1]~input_o\ & (\Add_IN[3]~input_o\ & \Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[0]~input_o\,
	datab => \Add_IN[1]~input_o\,
	datac => \Add_IN[3]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~430_combout\);

-- Location: LCCOMB_X23_Y13_N0
\rtl~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~14_combout\ = (!\WR~input_o\ & (\CS~input_o\ & \RAMM|Data~430_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datac => \CS~input_o\,
	datad => \RAMM|Data~430_combout\,
	combout => \rtl~14_combout\);

-- Location: LCCOMB_X23_Y13_N10
\RAMM|Data~198\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~198_combout\ = (\rtl~14_combout\ & (\Input[6]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~198_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datac => \Input[6]~input_o\,
	datad => \RAMM|Data~198_combout\,
	combout => \RAMM|Data~198_combout\);

-- Location: LCCOMB_X25_Y10_N14
\P|temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \P|temp[0]~0_combout\ = \P|temp\(0) $ (\CTRLM|IPC~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \P|temp\(0),
	datad => \CTRLM|IPC~2_combout\,
	combout => \P|temp[0]~0_combout\);

-- Location: FF_X25_Y10_N15
\P|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \P|temp[0]~0_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \P|temp\(0));

-- Location: FF_X22_Y16_N9
\MAR|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \P|temp\(0),
	sload => VCC,
	ena => \CTRLM|IMAR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MAR|temp\(0));

-- Location: LCCOMB_X33_Y12_N4
\RAMM|Data~428\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~428_combout\ = (\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (!\Add_IN[1]~input_o\ & \Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~428_combout\);

-- Location: LCCOMB_X33_Y12_N10
\rtl~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~12_combout\ = (!\WR~input_o\ & (\RAMM|Data~428_combout\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WR~input_o\,
	datac => \RAMM|Data~428_combout\,
	datad => \CS~input_o\,
	combout => \rtl~12_combout\);

-- Location: CLKCTRL_G7
\rtl~12clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~12clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~12clkctrl_outclk\);

-- Location: LCCOMB_X26_Y15_N16
\RAMM|Data~214\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~214_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~214_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \RAMM|Data~214_combout\,
	combout => \RAMM|Data~214_combout\);

-- Location: LCCOMB_X26_Y15_N30
\RAMM|Data~323\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~323_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & ((\RAMM|Data~214_combout\))) # (!\MAR|temp\(0) & (\RAMM|Data~198_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~198_combout\,
	datab => \MAR|temp\(1),
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~214_combout\,
	combout => \RAMM|Data~323_combout\);

-- Location: LCCOMB_X26_Y15_N0
\RAMM|Data~324\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~324_combout\ = (\RAMM|Data~323_combout\ & ((\RAMM|Data~246_combout\) # ((!\MAR|temp\(1))))) # (!\RAMM|Data~323_combout\ & (((\RAMM|Data~230_combout\ & \MAR|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~246_combout\,
	datab => \RAMM|Data~230_combout\,
	datac => \RAMM|Data~323_combout\,
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~324_combout\);

-- Location: LCCOMB_X24_Y15_N18
\RAMM|Data~421\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~421_combout\ = (!\Add_IN[3]~input_o\ & (\Add_IN[2]~input_o\ & (!\Add_IN[0]~input_o\ & \Add_IN[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[2]~input_o\,
	datac => \Add_IN[0]~input_o\,
	datad => \Add_IN[1]~input_o\,
	combout => \RAMM|Data~421_combout\);

-- Location: LCCOMB_X24_Y15_N12
\rtl~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~5_combout\ = (\RAMM|Data~421_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~421_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~5_combout\);

-- Location: LCCOMB_X25_Y15_N18
\RAMM|Data~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~102_combout\ = (\rtl~5_combout\ & (\Input[6]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~102_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~5_combout\,
	datac => \Input[6]~input_o\,
	datad => \RAMM|Data~102_combout\,
	combout => \RAMM|Data~102_combout\);

-- Location: LCCOMB_X24_Y15_N14
\RAMM|Data~423\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~423_combout\ = (!\Add_IN[3]~input_o\ & (\Add_IN[2]~input_o\ & (\Add_IN[0]~input_o\ & \Add_IN[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[2]~input_o\,
	datac => \Add_IN[0]~input_o\,
	datad => \Add_IN[1]~input_o\,
	combout => \RAMM|Data~423_combout\);

-- Location: LCCOMB_X24_Y15_N6
\rtl~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~7_combout\ = (!\WR~input_o\ & (\RAMM|Data~423_combout\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datac => \RAMM|Data~423_combout\,
	datad => \CS~input_o\,
	combout => \rtl~7_combout\);

-- Location: LCCOMB_X23_Y15_N4
\RAMM|Data~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~118_combout\ = (\rtl~7_combout\ & (\Input[6]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~118_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[6]~input_o\,
	datac => \RAMM|Data~118_combout\,
	datad => \rtl~7_combout\,
	combout => \RAMM|Data~118_combout\);

-- Location: LCCOMB_X24_Y15_N26
\RAMM|Data~420\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~420_combout\ = (!\Add_IN[3]~input_o\ & (\Add_IN[2]~input_o\ & (\Add_IN[0]~input_o\ & !\Add_IN[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[2]~input_o\,
	datac => \Add_IN[0]~input_o\,
	datad => \Add_IN[1]~input_o\,
	combout => \RAMM|Data~420_combout\);

-- Location: LCCOMB_X24_Y15_N4
\rtl~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~4_combout\ = (\RAMM|Data~420_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~420_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~4_combout\);

-- Location: LCCOMB_X23_Y18_N10
\RAMM|Data~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~86_combout\ = (\rtl~4_combout\ & ((\Input[6]~input_o\))) # (!\rtl~4_combout\ & (\RAMM|Data~86_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~86_combout\,
	datab => \Input[6]~input_o\,
	datad => \rtl~4_combout\,
	combout => \RAMM|Data~86_combout\);

-- Location: LCCOMB_X23_Y16_N4
\RAMM|Data~422\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~422_combout\ = (\Add_IN[2]~input_o\ & (!\Add_IN[1]~input_o\ & (!\Add_IN[3]~input_o\ & !\Add_IN[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[2]~input_o\,
	datab => \Add_IN[1]~input_o\,
	datac => \Add_IN[3]~input_o\,
	datad => \Add_IN[0]~input_o\,
	combout => \RAMM|Data~422_combout\);

-- Location: LCCOMB_X23_Y16_N30
\rtl~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~6_combout\ = (!\WR~input_o\ & (\RAMM|Data~422_combout\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datac => \RAMM|Data~422_combout\,
	datad => \CS~input_o\,
	combout => \rtl~6_combout\);

-- Location: LCCOMB_X23_Y18_N28
\RAMM|Data~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~70_combout\ = (\rtl~6_combout\ & ((\Input[6]~input_o\))) # (!\rtl~6_combout\ & (\RAMM|Data~70_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~70_combout\,
	datac => \rtl~6_combout\,
	datad => \Input[6]~input_o\,
	combout => \RAMM|Data~70_combout\);

-- Location: LCCOMB_X23_Y18_N12
\RAMM|Data~316\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~316_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~86_combout\) # ((\MAR|temp\(1))))) # (!\MAR|temp\(0) & (((\RAMM|Data~70_combout\ & !\MAR|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~86_combout\,
	datab => \RAMM|Data~70_combout\,
	datac => \MAR|temp\(0),
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~316_combout\);

-- Location: LCCOMB_X26_Y15_N4
\RAMM|Data~317\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~317_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~316_combout\ & ((\RAMM|Data~118_combout\))) # (!\RAMM|Data~316_combout\ & (\RAMM|Data~102_combout\)))) # (!\MAR|temp\(1) & (((\RAMM|Data~316_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~102_combout\,
	datab => \RAMM|Data~118_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~316_combout\,
	combout => \RAMM|Data~317_combout\);

-- Location: LCCOMB_X25_Y10_N22
\P|temp[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \P|temp[3]~3_combout\ = (\P|temp\(2) & (\P|temp\(1) & (\CTRLM|IPC~2_combout\ & \P|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P|temp\(2),
	datab => \P|temp\(1),
	datac => \CTRLM|IPC~2_combout\,
	datad => \P|temp\(0),
	combout => \P|temp[3]~3_combout\);

-- Location: LCCOMB_X25_Y10_N24
\P|temp[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \P|temp[3]~4_combout\ = \P|temp[3]~3_combout\ $ (\P|temp\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P|temp[3]~3_combout\,
	datac => \P|temp\(3),
	combout => \P|temp[3]~4_combout\);

-- Location: FF_X25_Y10_N25
\P|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \P|temp[3]~4_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \P|temp\(3));

-- Location: FF_X24_Y12_N31
\MAR|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \P|temp\(3),
	sload => VCC,
	ena => \CTRLM|IMAR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MAR|temp\(3));

-- Location: LCCOMB_X33_Y12_N2
\RAMM|Data~417\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~417_combout\ = (\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (!\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~417_combout\);

-- Location: LCCOMB_X33_Y12_N8
\rtl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~1_combout\ = (\RAMM|Data~417_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~417_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~1_combout\);

-- Location: CLKCTRL_G8
\rtl~1clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~1clkctrl_outclk\);

-- Location: LCCOMB_X25_Y15_N22
\RAMM|Data~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~150_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~150_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \RAMM|Data~150_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~150_combout\);

-- Location: LCCOMB_X26_Y14_N28
\RAMM|Data~419\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~419_combout\ = (\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~419_combout\);

-- Location: LCCOMB_X25_Y14_N22
\rtl~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~3_combout\ = (\RAMM|Data~419_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~419_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~3_combout\);

-- Location: LCCOMB_X24_Y15_N16
\RAMM|Data~182\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~182_combout\ = (\rtl~3_combout\ & (\Input[6]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~182_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datab => \rtl~3_combout\,
	datad => \RAMM|Data~182_combout\,
	combout => \RAMM|Data~182_combout\);

-- Location: LCCOMB_X25_Y15_N30
\RAMM|Data~418\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~418_combout\ = (!\Add_IN[2]~input_o\ & (\Add_IN[3]~input_o\ & (!\Add_IN[1]~input_o\ & !\Add_IN[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[2]~input_o\,
	datab => \Add_IN[3]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[0]~input_o\,
	combout => \RAMM|Data~418_combout\);

-- Location: LCCOMB_X25_Y15_N26
\rtl~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~2_combout\ = (\RAMM|Data~418_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~418_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~2_combout\);

-- Location: LCCOMB_X25_Y16_N28
\RAMM|Data~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~134_combout\ = (\rtl~2_combout\ & ((\Input[6]~input_o\))) # (!\rtl~2_combout\ & (\RAMM|Data~134_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~134_combout\,
	datac => \Input[6]~input_o\,
	datad => \rtl~2_combout\,
	combout => \RAMM|Data~134_combout\);

-- Location: LCCOMB_X33_Y12_N18
\RAMM|Data~416\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~416_combout\ = (\Add_IN[3]~input_o\ & (!\Add_IN[0]~input_o\ & (\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~416_combout\);

-- Location: LCCOMB_X33_Y12_N12
\rtl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~0_combout\ = (\RAMM|Data~416_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~416_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~0_combout\);

-- Location: CLKCTRL_G9
\rtl~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~0clkctrl_outclk\);

-- Location: LCCOMB_X25_Y16_N14
\RAMM|Data~166\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~166_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~166_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[6]~input_o\,
	datac => \RAMM|Data~166_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~166_combout\);

-- Location: LCCOMB_X25_Y16_N12
\RAMM|Data~318\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~318_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~166_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~134_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~134_combout\,
	datab => \RAMM|Data~166_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~318_combout\);

-- Location: LCCOMB_X26_Y15_N26
\RAMM|Data~319\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~319_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~318_combout\ & ((\RAMM|Data~182_combout\))) # (!\RAMM|Data~318_combout\ & (\RAMM|Data~150_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~318_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~150_combout\,
	datab => \RAMM|Data~182_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~318_combout\,
	combout => \RAMM|Data~319_combout\);

-- Location: LCCOMB_X26_Y14_N30
\RAMM|Data~425\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~425_combout\ = (!\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (!\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~425_combout\);

-- Location: LCCOMB_X26_Y14_N20
\rtl~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~9_combout\ = (\RAMM|Data~425_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~425_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~9_combout\);

-- Location: LCCOMB_X26_Y15_N10
\RAMM|Data~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~22_combout\ = (\rtl~9_combout\ & (\Input[6]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \rtl~9_combout\,
	datad => \RAMM|Data~22_combout\,
	combout => \RAMM|Data~22_combout\);

-- Location: LCCOMB_X29_Y12_N8
\RAMM|Data~427\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~427_combout\ = (!\Add_IN[3]~input_o\ & (\Add_IN[0]~input_o\ & (\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~427_combout\);

-- Location: LCCOMB_X1_Y11_N20
\rtl~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~11_combout\ = (!\WR~input_o\ & (\RAMM|Data~427_combout\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WR~input_o\,
	datac => \RAMM|Data~427_combout\,
	datad => \CS~input_o\,
	combout => \rtl~11_combout\);

-- Location: CLKCTRL_G0
\rtl~11clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~11clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~11clkctrl_outclk\);

-- Location: LCCOMB_X25_Y15_N14
\RAMM|Data~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~54_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \RAMM|Data~54_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~54_combout\);

-- Location: LCCOMB_X28_Y15_N12
\RAMM|Data~424\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~424_combout\ = (!\Add_IN[3]~input_o\ & (!\Add_IN[0]~input_o\ & (!\Add_IN[2]~input_o\ & \Add_IN[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[3]~input_o\,
	datab => \Add_IN[0]~input_o\,
	datac => \Add_IN[2]~input_o\,
	datad => \Add_IN[1]~input_o\,
	combout => \RAMM|Data~424_combout\);

-- Location: LCCOMB_X25_Y15_N0
\rtl~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~8_combout\ = (\RAMM|Data~424_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~424_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~8_combout\);

-- Location: LCCOMB_X26_Y15_N20
\RAMM|Data~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~38_combout\ = (\rtl~8_combout\ & (\Input[6]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datac => \Input[6]~input_o\,
	datad => \RAMM|Data~38_combout\,
	combout => \RAMM|Data~38_combout\);

-- Location: LCCOMB_X33_Y13_N18
\RAMM|Data~426\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~426_combout\ = (!\Add_IN[0]~input_o\ & (!\Add_IN[3]~input_o\ & (!\Add_IN[1]~input_o\ & !\Add_IN[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add_IN[0]~input_o\,
	datab => \Add_IN[3]~input_o\,
	datac => \Add_IN[1]~input_o\,
	datad => \Add_IN[2]~input_o\,
	combout => \RAMM|Data~426_combout\);

-- Location: LCCOMB_X33_Y13_N30
\rtl~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rtl~10_combout\ = (\RAMM|Data~426_combout\ & (!\WR~input_o\ & \CS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~426_combout\,
	datac => \WR~input_o\,
	datad => \CS~input_o\,
	combout => \rtl~10_combout\);

-- Location: CLKCTRL_G6
\rtl~10clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~10clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~10clkctrl_outclk\);

-- Location: LCCOMB_X26_Y17_N30
\RAMM|Data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~6_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[6]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[6]~input_o\,
	datac => \RAMM|Data~6_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~6_combout\);

-- Location: LCCOMB_X26_Y15_N28
\RAMM|Data~320\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~320_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~38_combout\) # ((\MAR|temp\(0))))) # (!\MAR|temp\(1) & (((!\MAR|temp\(0) & \RAMM|Data~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~38_combout\,
	datab => \MAR|temp\(1),
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~6_combout\,
	combout => \RAMM|Data~320_combout\);

-- Location: LCCOMB_X26_Y15_N2
\RAMM|Data~321\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~321_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~320_combout\ & ((\RAMM|Data~54_combout\))) # (!\RAMM|Data~320_combout\ & (\RAMM|Data~22_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~320_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~22_combout\,
	datab => \RAMM|Data~54_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~320_combout\,
	combout => \RAMM|Data~321_combout\);

-- Location: LCCOMB_X26_Y15_N12
\RAMM|Data~322\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~322_combout\ = (\MAR|temp\(2) & (\MAR|temp\(3))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & (\RAMM|Data~319_combout\)) # (!\MAR|temp\(3) & ((\RAMM|Data~321_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~319_combout\,
	datad => \RAMM|Data~321_combout\,
	combout => \RAMM|Data~322_combout\);

-- Location: LCCOMB_X26_Y15_N18
\RAMM|Data~325\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~325_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~322_combout\ & (\RAMM|Data~324_combout\)) # (!\RAMM|Data~322_combout\ & ((\RAMM|Data~317_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~322_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~324_combout\,
	datac => \RAMM|Data~317_combout\,
	datad => \RAMM|Data~322_combout\,
	combout => \RAMM|Data~325_combout\);

-- Location: LCCOMB_X26_Y15_N8
\RAMM|DO[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(6) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~325_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(6),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~325_combout\,
	combout => \RAMM|DO\(6));

-- Location: LCCOMB_X26_Y12_N28
\DR|temp[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[6]~feeder_combout\ = \RAMM|DO\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RAMM|DO\(6),
	combout => \DR|temp[6]~feeder_combout\);

-- Location: LCCOMB_X19_Y9_N22
\CTRLM|IDR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IDR~1_combout\ = (\CT|temp\(1) & (!\CT|temp\(2) & \CTRLM|IDR~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(1),
	datab => \CT|temp\(2),
	datad => \CTRLM|IDR~0_combout\,
	combout => \CTRLM|IDR~1_combout\);

-- Location: LCCOMB_X23_Y10_N18
\CTRLM|IDR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IDR~2_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|IDR~1_combout\) # ((\CTRLM|T4~2_combout\ & \CTRLM|IPC~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T4~2_combout\,
	datab => \CTRLM|IDR~1_combout\,
	datac => \CTRLM|Code15~combout\,
	datad => \CTRLM|IPC~1_combout\,
	combout => \CTRLM|IDR~2_combout\);

-- Location: FF_X26_Y12_N29
\DR|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[6]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(6));

-- Location: FF_X23_Y9_N1
\ACC|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[6]~8_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(6));

-- Location: IOIBUF_X34_Y12_N8
\Input[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(0),
	o => \Input[0]~input_o\);

-- Location: LCCOMB_X25_Y14_N14
\RAMM|Data~176\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~176_combout\ = (\rtl~3_combout\ & (\Input[0]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~176_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~3_combout\,
	datab => \Input[0]~input_o\,
	datac => \RAMM|Data~176_combout\,
	combout => \RAMM|Data~176_combout\);

-- Location: LCCOMB_X25_Y15_N20
\RAMM|Data~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~128_combout\ = (\rtl~2_combout\ & (\Input[0]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~128_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \rtl~2_combout\,
	datad => \RAMM|Data~128_combout\,
	combout => \RAMM|Data~128_combout\);

-- Location: LCCOMB_X22_Y17_N20
\RAMM|Data~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~144_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[0]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~144_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \RAMM|Data~144_combout\,
	combout => \RAMM|Data~144_combout\);

-- Location: LCCOMB_X22_Y17_N14
\RAMM|Data~256\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~256_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1)) # (\RAMM|Data~144_combout\)))) # (!\MAR|temp\(0) & (\RAMM|Data~128_combout\ & (!\MAR|temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~128_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~144_combout\,
	combout => \RAMM|Data~256_combout\);

-- Location: LCCOMB_X21_Y16_N4
\RAMM|Data~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~160_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[0]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~160_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \RAMM|Data~160_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~160_combout\);

-- Location: LCCOMB_X22_Y17_N16
\RAMM|Data~257\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~257_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~256_combout\ & (\RAMM|Data~176_combout\)) # (!\RAMM|Data~256_combout\ & ((\RAMM|Data~160_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~256_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~176_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~256_combout\,
	datad => \RAMM|Data~160_combout\,
	combout => \RAMM|Data~257_combout\);

-- Location: LCCOMB_X25_Y14_N6
\RAMM|Data~240\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~240_combout\ = (\rtl~15_combout\ & (\Input[0]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~240_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \rtl~15_combout\,
	datad => \RAMM|Data~240_combout\,
	combout => \RAMM|Data~240_combout\);

-- Location: LCCOMB_X22_Y15_N8
\RAMM|Data~224\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~224_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[0]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~224_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \RAMM|Data~224_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~224_combout\);

-- Location: LCCOMB_X23_Y13_N24
\RAMM|Data~192\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~192_combout\ = (\rtl~14_combout\ & (\Input[0]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~192_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \rtl~14_combout\,
	datad => \RAMM|Data~192_combout\,
	combout => \RAMM|Data~192_combout\);

-- Location: LCCOMB_X22_Y17_N8
\RAMM|Data~263\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~263_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~224_combout\) # ((\MAR|temp\(0))))) # (!\MAR|temp\(1) & (((\RAMM|Data~192_combout\ & !\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~224_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~192_combout\,
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~263_combout\);

-- Location: LCCOMB_X23_Y17_N26
\RAMM|Data~208\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~208_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[0]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~208_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \RAMM|Data~208_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~208_combout\);

-- Location: LCCOMB_X22_Y17_N26
\RAMM|Data~264\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~264_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~263_combout\ & (\RAMM|Data~240_combout\)) # (!\RAMM|Data~263_combout\ & ((\RAMM|Data~208_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~263_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~240_combout\,
	datac => \RAMM|Data~263_combout\,
	datad => \RAMM|Data~208_combout\,
	combout => \RAMM|Data~264_combout\);

-- Location: LCCOMB_X24_Y15_N2
\RAMM|Data~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~112_combout\ = (\rtl~7_combout\ & ((\Input[0]~input_o\))) # (!\rtl~7_combout\ & (\RAMM|Data~112_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~112_combout\,
	datac => \Input[0]~input_o\,
	datad => \rtl~7_combout\,
	combout => \RAMM|Data~112_combout\);

-- Location: LCCOMB_X23_Y16_N22
\RAMM|Data~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~64_combout\ = (\rtl~6_combout\ & (\Input[0]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~64_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \RAMM|Data~64_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~64_combout\);

-- Location: LCCOMB_X24_Y15_N20
\RAMM|Data~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~96_combout\ = (\rtl~5_combout\ & (\Input[0]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~96_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~96_combout\,
	combout => \RAMM|Data~96_combout\);

-- Location: LCCOMB_X22_Y17_N22
\RAMM|Data~258\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~258_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~96_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~64_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~64_combout\,
	datab => \RAMM|Data~96_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~258_combout\);

-- Location: LCCOMB_X23_Y16_N2
\RAMM|Data~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~80_combout\ = (\rtl~4_combout\ & (\Input[0]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~80_combout\,
	combout => \RAMM|Data~80_combout\);

-- Location: LCCOMB_X22_Y17_N4
\RAMM|Data~259\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~259_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~258_combout\ & (\RAMM|Data~112_combout\)) # (!\RAMM|Data~258_combout\ & ((\RAMM|Data~80_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~258_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~112_combout\,
	datac => \RAMM|Data~258_combout\,
	datad => \RAMM|Data~80_combout\,
	combout => \RAMM|Data~259_combout\);

-- Location: LCCOMB_X23_Y17_N4
\RAMM|Data~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~48_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[0]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[0]~input_o\,
	datac => \RAMM|Data~48_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~48_combout\);

-- Location: LCCOMB_X22_Y17_N30
\RAMM|Data~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~32_combout\ = (\rtl~8_combout\ & (\Input[0]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datab => \Input[0]~input_o\,
	datad => \RAMM|Data~32_combout\,
	combout => \RAMM|Data~32_combout\);

-- Location: LCCOMB_X22_Y17_N0
\RAMM|Data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~16_combout\ = (\rtl~9_combout\ & (\Input[0]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[0]~input_o\,
	datac => \RAMM|Data~16_combout\,
	datad => \rtl~9_combout\,
	combout => \RAMM|Data~16_combout\);

-- Location: LCCOMB_X22_Y17_N10
\RAMM|Data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~0_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & ((\Input[0]~input_o\))) # (!GLOBAL(\rtl~10clkctrl_outclk\) & (\RAMM|Data~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~0_combout\,
	datab => \Input[0]~input_o\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~0_combout\);

-- Location: LCCOMB_X22_Y17_N2
\RAMM|Data~260\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~260_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~16_combout\) # ((\MAR|temp\(1))))) # (!\MAR|temp\(0) & (((!\MAR|temp\(1) & \RAMM|Data~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~16_combout\,
	datab => \MAR|temp\(0),
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~0_combout\,
	combout => \RAMM|Data~260_combout\);

-- Location: LCCOMB_X22_Y17_N28
\RAMM|Data~261\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~261_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~260_combout\ & (\RAMM|Data~48_combout\)) # (!\RAMM|Data~260_combout\ & ((\RAMM|Data~32_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~260_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~48_combout\,
	datab => \RAMM|Data~32_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~260_combout\,
	combout => \RAMM|Data~261_combout\);

-- Location: LCCOMB_X22_Y17_N6
\RAMM|Data~262\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~262_combout\ = (\MAR|temp\(3) & (\MAR|temp\(2))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~259_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~261_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~259_combout\,
	datad => \RAMM|Data~261_combout\,
	combout => \RAMM|Data~262_combout\);

-- Location: LCCOMB_X22_Y17_N24
\RAMM|Data~265\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~265_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~262_combout\ & ((\RAMM|Data~264_combout\))) # (!\RAMM|Data~262_combout\ & (\RAMM|Data~257_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~262_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~257_combout\,
	datac => \RAMM|Data~264_combout\,
	datad => \RAMM|Data~262_combout\,
	combout => \RAMM|Data~265_combout\);

-- Location: LCCOMB_X22_Y17_N18
\RAMM|DO[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(0) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~265_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(0),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~265_combout\,
	combout => \RAMM|DO\(0));

-- Location: LCCOMB_X22_Y17_N12
\DR|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[0]~feeder_combout\ = \RAMM|DO\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(0),
	combout => \DR|temp[0]~feeder_combout\);

-- Location: FF_X22_Y17_N13
\DR|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[0]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(0));

-- Location: LCCOMB_X21_Y9_N10
\d|D_OUT[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[0]~0_combout\ = (\DR|temp\(0) & !\A|DO\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DR|temp\(0),
	datad => \A|DO\(10),
	combout => \d|D_OUT[0]~0_combout\);

-- Location: LCCOMB_X19_Y9_N18
\CTRLM|T6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T6~1_combout\ = (!\CT|temp\(4) & \CT|temp\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CT|temp\(4),
	datac => \CT|temp\(6),
	combout => \CTRLM|T6~1_combout\);

-- Location: LCCOMB_X22_Y9_N14
\CTRLM|T6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|T6~combout\ = (!\CT|temp\(5) & (\CTRLM|T6~0_combout\ & (!\CT|temp\(3) & \CTRLM|T6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(5),
	datab => \CTRLM|T6~0_combout\,
	datac => \CT|temp\(3),
	datad => \CTRLM|T6~1_combout\,
	combout => \CTRLM|T6~combout\);

-- Location: LCCOMB_X22_Y9_N26
\IR|WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr2~0_combout\ = (\IR|Equal9~0_combout\) # (!\A|temp~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A|temp~16_combout\,
	datad => \IR|Equal9~0_combout\,
	combout => \IR|WideOr2~0_combout\);

-- Location: LCCOMB_X22_Y9_N2
\CTRLM|IIR~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IIR~3_combout\ = (\CT|temp\(2) & (!\CTRLM|Code15~combout\ & (!\CT|temp\(1) & \CTRLM|IDR~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(2),
	datab => \CTRLM|Code15~combout\,
	datac => \CT|temp\(1),
	datad => \CTRLM|IDR~0_combout\,
	combout => \CTRLM|IIR~3_combout\);

-- Location: FF_X22_Y10_N1
\IR|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[10]~12_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(10));

-- Location: FF_X21_Y9_N5
\ACC|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[2]~4_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(2));

-- Location: FF_X22_Y10_N31
\ACC|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[8]~10_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(8));

-- Location: FF_X23_Y9_N29
\ACC|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[7]~9_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(7));

-- Location: FF_X23_Y9_N23
\ACC|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[5]~7_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(5));

-- Location: FF_X23_Y9_N31
\ACC|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[3]~5_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(3));

-- Location: FF_X21_Y9_N9
\ACC|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[0]~1_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(0));

-- Location: LCCOMB_X25_Y7_N0
\A|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~0_combout\ = \ACC|temp\(0) $ (VCC)
-- \A|Add2~1\ = CARRY(\ACC|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(0),
	datad => VCC,
	combout => \A|Add2~0_combout\,
	cout => \A|Add2~1\);

-- Location: LCCOMB_X25_Y7_N2
\A|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~2_combout\ = (\IR|WideOr3~2_combout\ & ((\ACC|temp\(1) & (\A|Add2~1\ & VCC)) # (!\ACC|temp\(1) & (!\A|Add2~1\)))) # (!\IR|WideOr3~2_combout\ & ((\ACC|temp\(1) & (!\A|Add2~1\)) # (!\ACC|temp\(1) & ((\A|Add2~1\) # (GND)))))
-- \A|Add2~3\ = CARRY((\IR|WideOr3~2_combout\ & (!\ACC|temp\(1) & !\A|Add2~1\)) # (!\IR|WideOr3~2_combout\ & ((!\A|Add2~1\) # (!\ACC|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(1),
	datad => VCC,
	cin => \A|Add2~1\,
	combout => \A|Add2~2_combout\,
	cout => \A|Add2~3\);

-- Location: FF_X22_Y10_N27
\ACC|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[9]~11_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(9));

-- Location: LCCOMB_X25_Y7_N16
\A|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~16_combout\ = ((\IR|WideOr3~2_combout\ $ (\ACC|temp\(8) $ (!\A|Add2~15\)))) # (GND)
-- \A|Add2~17\ = CARRY((\IR|WideOr3~2_combout\ & ((\ACC|temp\(8)) # (!\A|Add2~15\))) # (!\IR|WideOr3~2_combout\ & (\ACC|temp\(8) & !\A|Add2~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(8),
	datad => VCC,
	cin => \A|Add2~15\,
	combout => \A|Add2~16_combout\,
	cout => \A|Add2~17\);

-- Location: LCCOMB_X25_Y7_N18
\A|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~18_combout\ = (\ACC|temp\(9) & ((\IR|WideOr3~2_combout\ & (\A|Add2~17\ & VCC)) # (!\IR|WideOr3~2_combout\ & (!\A|Add2~17\)))) # (!\ACC|temp\(9) & ((\IR|WideOr3~2_combout\ & (!\A|Add2~17\)) # (!\IR|WideOr3~2_combout\ & ((\A|Add2~17\) # (GND)))))
-- \A|Add2~19\ = CARRY((\ACC|temp\(9) & (!\IR|WideOr3~2_combout\ & !\A|Add2~17\)) # (!\ACC|temp\(9) & ((!\A|Add2~17\) # (!\IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(9),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~17\,
	combout => \A|Add2~18_combout\,
	cout => \A|Add2~19\);

-- Location: LCCOMB_X22_Y8_N0
\A|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~0_combout\ = (\d|D_OUT[0]~1_combout\ & (\ACC|temp\(0) $ (VCC))) # (!\d|D_OUT[0]~1_combout\ & ((\ACC|temp\(0)) # (GND)))
-- \A|Add1~1\ = CARRY((\ACC|temp\(0)) # (!\d|D_OUT[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[0]~1_combout\,
	datab => \ACC|temp\(0),
	datad => VCC,
	combout => \A|Add1~0_combout\,
	cout => \A|Add1~1\);

-- Location: LCCOMB_X22_Y8_N2
\A|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~2_combout\ = (\ACC|temp\(1) & ((\d|D_OUT[1]~2_combout\ & (!\A|Add1~1\)) # (!\d|D_OUT[1]~2_combout\ & (\A|Add1~1\ & VCC)))) # (!\ACC|temp\(1) & ((\d|D_OUT[1]~2_combout\ & ((\A|Add1~1\) # (GND))) # (!\d|D_OUT[1]~2_combout\ & (!\A|Add1~1\))))
-- \A|Add1~3\ = CARRY((\ACC|temp\(1) & (\d|D_OUT[1]~2_combout\ & !\A|Add1~1\)) # (!\ACC|temp\(1) & ((\d|D_OUT[1]~2_combout\) # (!\A|Add1~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datab => \d|D_OUT[1]~2_combout\,
	datad => VCC,
	cin => \A|Add1~1\,
	combout => \A|Add1~2_combout\,
	cout => \A|Add1~3\);

-- Location: LCCOMB_X22_Y8_N4
\A|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~4_combout\ = ((\ACC|temp\(2) $ (\d|D_OUT[2]~4_combout\ $ (\A|Add1~3\)))) # (GND)
-- \A|Add1~5\ = CARRY((\ACC|temp\(2) & ((!\A|Add1~3\) # (!\d|D_OUT[2]~4_combout\))) # (!\ACC|temp\(2) & (!\d|D_OUT[2]~4_combout\ & !\A|Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \d|D_OUT[2]~4_combout\,
	datad => VCC,
	cin => \A|Add1~3\,
	combout => \A|Add1~4_combout\,
	cout => \A|Add1~5\);

-- Location: LCCOMB_X22_Y8_N6
\A|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~6_combout\ = (\ACC|temp\(3) & ((\d|D_OUT[3]~5_combout\ & (!\A|Add1~5\)) # (!\d|D_OUT[3]~5_combout\ & (\A|Add1~5\ & VCC)))) # (!\ACC|temp\(3) & ((\d|D_OUT[3]~5_combout\ & ((\A|Add1~5\) # (GND))) # (!\d|D_OUT[3]~5_combout\ & (!\A|Add1~5\))))
-- \A|Add1~7\ = CARRY((\ACC|temp\(3) & (\d|D_OUT[3]~5_combout\ & !\A|Add1~5\)) # (!\ACC|temp\(3) & ((\d|D_OUT[3]~5_combout\) # (!\A|Add1~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \d|D_OUT[3]~5_combout\,
	datad => VCC,
	cin => \A|Add1~5\,
	combout => \A|Add1~6_combout\,
	cout => \A|Add1~7\);

-- Location: LCCOMB_X22_Y8_N8
\A|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~8_combout\ = ((\d|D_OUT[4]~6_combout\ $ (\ACC|temp\(4) $ (\A|Add1~7\)))) # (GND)
-- \A|Add1~9\ = CARRY((\d|D_OUT[4]~6_combout\ & (\ACC|temp\(4) & !\A|Add1~7\)) # (!\d|D_OUT[4]~6_combout\ & ((\ACC|temp\(4)) # (!\A|Add1~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[4]~6_combout\,
	datab => \ACC|temp\(4),
	datad => VCC,
	cin => \A|Add1~7\,
	combout => \A|Add1~8_combout\,
	cout => \A|Add1~9\);

-- Location: LCCOMB_X22_Y8_N10
\A|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~10_combout\ = (\d|D_OUT[5]~7_combout\ & ((\ACC|temp\(5) & (!\A|Add1~9\)) # (!\ACC|temp\(5) & ((\A|Add1~9\) # (GND))))) # (!\d|D_OUT[5]~7_combout\ & ((\ACC|temp\(5) & (\A|Add1~9\ & VCC)) # (!\ACC|temp\(5) & (!\A|Add1~9\))))
-- \A|Add1~11\ = CARRY((\d|D_OUT[5]~7_combout\ & ((!\A|Add1~9\) # (!\ACC|temp\(5)))) # (!\d|D_OUT[5]~7_combout\ & (!\ACC|temp\(5) & !\A|Add1~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[5]~7_combout\,
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|Add1~9\,
	combout => \A|Add1~10_combout\,
	cout => \A|Add1~11\);

-- Location: LCCOMB_X22_Y8_N12
\A|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~12_combout\ = ((\ACC|temp\(6) $ (\d|D_OUT[6]~8_combout\ $ (\A|Add1~11\)))) # (GND)
-- \A|Add1~13\ = CARRY((\ACC|temp\(6) & ((!\A|Add1~11\) # (!\d|D_OUT[6]~8_combout\))) # (!\ACC|temp\(6) & (!\d|D_OUT[6]~8_combout\ & !\A|Add1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \d|D_OUT[6]~8_combout\,
	datad => VCC,
	cin => \A|Add1~11\,
	combout => \A|Add1~12_combout\,
	cout => \A|Add1~13\);

-- Location: LCCOMB_X22_Y8_N14
\A|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~14_combout\ = (\d|D_OUT[7]~9_combout\ & ((\ACC|temp\(7) & (!\A|Add1~13\)) # (!\ACC|temp\(7) & ((\A|Add1~13\) # (GND))))) # (!\d|D_OUT[7]~9_combout\ & ((\ACC|temp\(7) & (\A|Add1~13\ & VCC)) # (!\ACC|temp\(7) & (!\A|Add1~13\))))
-- \A|Add1~15\ = CARRY((\d|D_OUT[7]~9_combout\ & ((!\A|Add1~13\) # (!\ACC|temp\(7)))) # (!\d|D_OUT[7]~9_combout\ & (!\ACC|temp\(7) & !\A|Add1~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[7]~9_combout\,
	datab => \ACC|temp\(7),
	datad => VCC,
	cin => \A|Add1~13\,
	combout => \A|Add1~14_combout\,
	cout => \A|Add1~15\);

-- Location: LCCOMB_X22_Y8_N16
\A|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~16_combout\ = ((\ACC|temp\(8) $ (\d|D_OUT[8]~10_combout\ $ (\A|Add1~15\)))) # (GND)
-- \A|Add1~17\ = CARRY((\ACC|temp\(8) & ((!\A|Add1~15\) # (!\d|D_OUT[8]~10_combout\))) # (!\ACC|temp\(8) & (!\d|D_OUT[8]~10_combout\ & !\A|Add1~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(8),
	datab => \d|D_OUT[8]~10_combout\,
	datad => VCC,
	cin => \A|Add1~15\,
	combout => \A|Add1~16_combout\,
	cout => \A|Add1~17\);

-- Location: LCCOMB_X22_Y8_N18
\A|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~18_combout\ = (\d|D_OUT[9]~11_combout\ & ((\ACC|temp\(9) & (!\A|Add1~17\)) # (!\ACC|temp\(9) & ((\A|Add1~17\) # (GND))))) # (!\d|D_OUT[9]~11_combout\ & ((\ACC|temp\(9) & (\A|Add1~17\ & VCC)) # (!\ACC|temp\(9) & (!\A|Add1~17\))))
-- \A|Add1~19\ = CARRY((\d|D_OUT[9]~11_combout\ & ((!\A|Add1~17\) # (!\ACC|temp\(9)))) # (!\d|D_OUT[9]~11_combout\ & (!\ACC|temp\(9) & !\A|Add1~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[9]~11_combout\,
	datab => \ACC|temp\(9),
	datad => VCC,
	cin => \A|Add1~17\,
	combout => \A|Add1~18_combout\,
	cout => \A|Add1~19\);

-- Location: LCCOMB_X24_Y9_N0
\A|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~0_combout\ = (\ACC|temp\(0) & (\d|D_OUT[0]~1_combout\ $ (VCC))) # (!\ACC|temp\(0) & (\d|D_OUT[0]~1_combout\ & VCC))
-- \A|Add0~1\ = CARRY((\ACC|temp\(0) & \d|D_OUT[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datab => \d|D_OUT[0]~1_combout\,
	datad => VCC,
	combout => \A|Add0~0_combout\,
	cout => \A|Add0~1\);

-- Location: LCCOMB_X24_Y9_N2
\A|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~2_combout\ = (\d|D_OUT[1]~2_combout\ & ((\ACC|temp\(1) & (\A|Add0~1\ & VCC)) # (!\ACC|temp\(1) & (!\A|Add0~1\)))) # (!\d|D_OUT[1]~2_combout\ & ((\ACC|temp\(1) & (!\A|Add0~1\)) # (!\ACC|temp\(1) & ((\A|Add0~1\) # (GND)))))
-- \A|Add0~3\ = CARRY((\d|D_OUT[1]~2_combout\ & (!\ACC|temp\(1) & !\A|Add0~1\)) # (!\d|D_OUT[1]~2_combout\ & ((!\A|Add0~1\) # (!\ACC|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[1]~2_combout\,
	datab => \ACC|temp\(1),
	datad => VCC,
	cin => \A|Add0~1\,
	combout => \A|Add0~2_combout\,
	cout => \A|Add0~3\);

-- Location: LCCOMB_X24_Y9_N4
\A|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~4_combout\ = ((\ACC|temp\(2) $ (\d|D_OUT[2]~4_combout\ $ (!\A|Add0~3\)))) # (GND)
-- \A|Add0~5\ = CARRY((\ACC|temp\(2) & ((\d|D_OUT[2]~4_combout\) # (!\A|Add0~3\))) # (!\ACC|temp\(2) & (\d|D_OUT[2]~4_combout\ & !\A|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \d|D_OUT[2]~4_combout\,
	datad => VCC,
	cin => \A|Add0~3\,
	combout => \A|Add0~4_combout\,
	cout => \A|Add0~5\);

-- Location: LCCOMB_X24_Y9_N6
\A|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~6_combout\ = (\ACC|temp\(3) & ((\d|D_OUT[3]~5_combout\ & (\A|Add0~5\ & VCC)) # (!\d|D_OUT[3]~5_combout\ & (!\A|Add0~5\)))) # (!\ACC|temp\(3) & ((\d|D_OUT[3]~5_combout\ & (!\A|Add0~5\)) # (!\d|D_OUT[3]~5_combout\ & ((\A|Add0~5\) # (GND)))))
-- \A|Add0~7\ = CARRY((\ACC|temp\(3) & (!\d|D_OUT[3]~5_combout\ & !\A|Add0~5\)) # (!\ACC|temp\(3) & ((!\A|Add0~5\) # (!\d|D_OUT[3]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \d|D_OUT[3]~5_combout\,
	datad => VCC,
	cin => \A|Add0~5\,
	combout => \A|Add0~6_combout\,
	cout => \A|Add0~7\);

-- Location: LCCOMB_X24_Y9_N8
\A|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~8_combout\ = ((\d|D_OUT[4]~6_combout\ $ (\ACC|temp\(4) $ (!\A|Add0~7\)))) # (GND)
-- \A|Add0~9\ = CARRY((\d|D_OUT[4]~6_combout\ & ((\ACC|temp\(4)) # (!\A|Add0~7\))) # (!\d|D_OUT[4]~6_combout\ & (\ACC|temp\(4) & !\A|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[4]~6_combout\,
	datab => \ACC|temp\(4),
	datad => VCC,
	cin => \A|Add0~7\,
	combout => \A|Add0~8_combout\,
	cout => \A|Add0~9\);

-- Location: LCCOMB_X24_Y9_N10
\A|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~10_combout\ = (\ACC|temp\(5) & ((\d|D_OUT[5]~7_combout\ & (\A|Add0~9\ & VCC)) # (!\d|D_OUT[5]~7_combout\ & (!\A|Add0~9\)))) # (!\ACC|temp\(5) & ((\d|D_OUT[5]~7_combout\ & (!\A|Add0~9\)) # (!\d|D_OUT[5]~7_combout\ & ((\A|Add0~9\) # (GND)))))
-- \A|Add0~11\ = CARRY((\ACC|temp\(5) & (!\d|D_OUT[5]~7_combout\ & !\A|Add0~9\)) # (!\ACC|temp\(5) & ((!\A|Add0~9\) # (!\d|D_OUT[5]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(5),
	datab => \d|D_OUT[5]~7_combout\,
	datad => VCC,
	cin => \A|Add0~9\,
	combout => \A|Add0~10_combout\,
	cout => \A|Add0~11\);

-- Location: LCCOMB_X24_Y9_N12
\A|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~12_combout\ = ((\d|D_OUT[6]~8_combout\ $ (\ACC|temp\(6) $ (!\A|Add0~11\)))) # (GND)
-- \A|Add0~13\ = CARRY((\d|D_OUT[6]~8_combout\ & ((\ACC|temp\(6)) # (!\A|Add0~11\))) # (!\d|D_OUT[6]~8_combout\ & (\ACC|temp\(6) & !\A|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[6]~8_combout\,
	datab => \ACC|temp\(6),
	datad => VCC,
	cin => \A|Add0~11\,
	combout => \A|Add0~12_combout\,
	cout => \A|Add0~13\);

-- Location: LCCOMB_X24_Y9_N14
\A|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~14_combout\ = (\ACC|temp\(7) & ((\d|D_OUT[7]~9_combout\ & (\A|Add0~13\ & VCC)) # (!\d|D_OUT[7]~9_combout\ & (!\A|Add0~13\)))) # (!\ACC|temp\(7) & ((\d|D_OUT[7]~9_combout\ & (!\A|Add0~13\)) # (!\d|D_OUT[7]~9_combout\ & ((\A|Add0~13\) # (GND)))))
-- \A|Add0~15\ = CARRY((\ACC|temp\(7) & (!\d|D_OUT[7]~9_combout\ & !\A|Add0~13\)) # (!\ACC|temp\(7) & ((!\A|Add0~13\) # (!\d|D_OUT[7]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \d|D_OUT[7]~9_combout\,
	datad => VCC,
	cin => \A|Add0~13\,
	combout => \A|Add0~14_combout\,
	cout => \A|Add0~15\);

-- Location: LCCOMB_X24_Y9_N16
\A|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~16_combout\ = ((\ACC|temp\(8) $ (\d|D_OUT[8]~10_combout\ $ (!\A|Add0~15\)))) # (GND)
-- \A|Add0~17\ = CARRY((\ACC|temp\(8) & ((\d|D_OUT[8]~10_combout\) # (!\A|Add0~15\))) # (!\ACC|temp\(8) & (\d|D_OUT[8]~10_combout\ & !\A|Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(8),
	datab => \d|D_OUT[8]~10_combout\,
	datad => VCC,
	cin => \A|Add0~15\,
	combout => \A|Add0~16_combout\,
	cout => \A|Add0~17\);

-- Location: LCCOMB_X24_Y9_N18
\A|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~18_combout\ = (\d|D_OUT[9]~11_combout\ & ((\ACC|temp\(9) & (\A|Add0~17\ & VCC)) # (!\ACC|temp\(9) & (!\A|Add0~17\)))) # (!\d|D_OUT[9]~11_combout\ & ((\ACC|temp\(9) & (!\A|Add0~17\)) # (!\ACC|temp\(9) & ((\A|Add0~17\) # (GND)))))
-- \A|Add0~19\ = CARRY((\d|D_OUT[9]~11_combout\ & (!\ACC|temp\(9) & !\A|Add0~17\)) # (!\d|D_OUT[9]~11_combout\ & ((!\A|Add0~17\) # (!\ACC|temp\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[9]~11_combout\,
	datab => \ACC|temp\(9),
	datad => VCC,
	cin => \A|Add0~17\,
	combout => \A|Add0~18_combout\,
	cout => \A|Add0~19\);

-- Location: LCCOMB_X23_Y8_N6
\A|temp~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~24_combout\ = (\IR|WideOr3~2_combout\ & ((\A|Add1~18_combout\) # ((!\IR|WideOr1~1_combout\)))) # (!\IR|WideOr3~2_combout\ & (((\IR|WideOr1~1_combout\ & \A|Add0~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \A|Add1~18_combout\,
	datac => \IR|WideOr1~1_combout\,
	datad => \A|Add0~18_combout\,
	combout => \A|temp~24_combout\);

-- Location: LCCOMB_X23_Y8_N16
\A|temp~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~25_combout\ = (\IR|WideOr1~1_combout\ & (((\A|temp~24_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(9) & ((\d|D_OUT[9]~11_combout\) # (\A|temp~24_combout\))) # (!\ACC|temp\(9) & (\d|D_OUT[9]~11_combout\ & \A|temp~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \ACC|temp\(9),
	datac => \d|D_OUT[9]~11_combout\,
	datad => \A|temp~24_combout\,
	combout => \A|temp~25_combout\);

-- Location: LCCOMB_X23_Y8_N24
\A|temp~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~115_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~25_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~18_combout\)))) # (!\IR|WideOr0~3_combout\ & (\A|temp~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \A|temp~19_combout\,
	datac => \A|Add2~18_combout\,
	datad => \A|temp~25_combout\,
	combout => \A|temp~115_combout\);

-- Location: LCCOMB_X23_Y8_N18
\A|temp~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~116_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~115_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(9) $ (((\d|D_OUT[9]~11_combout\) # (\A|temp~115_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(9),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[9]~11_combout\,
	datad => \A|temp~115_combout\,
	combout => \A|temp~116_combout\);

-- Location: LCCOMB_X23_Y8_N26
\A|temp[9]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[9]~93_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[9]~11_combout\ $ (((\ACC|temp\(9)))))) # (!\A|temp~22_combout\ & (((\A|temp~116_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[9]~11_combout\,
	datab => \A|temp~22_combout\,
	datac => \A|temp~116_combout\,
	datad => \ACC|temp\(9),
	combout => \A|temp[9]~93_combout\);

-- Location: LCCOMB_X23_Y9_N26
\A|temp[0]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[0]~84_combout\ = (\CTRLM|EDR~0_combout\) # ((\CTRLM|T5~1_combout\ & \CTRLM|IPC~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CTRLM|EDR~0_combout\,
	datac => \CTRLM|T5~1_combout\,
	datad => \CTRLM|IPC~0_combout\,
	combout => \A|temp[0]~84_combout\);

-- Location: IOIBUF_X0_Y11_N8
\Input[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(15),
	o => \Input[15]~input_o\);

-- Location: LCCOMB_X24_Y14_N12
\RAMM|Data~255\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~255_combout\ = (\rtl~15_combout\ & (\Input[15]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~255_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~15_combout\,
	datac => \Input[15]~input_o\,
	datad => \RAMM|Data~255_combout\,
	combout => \RAMM|Data~255_combout\);

-- Location: LCCOMB_X24_Y14_N6
\RAMM|Data~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~127_combout\ = (\rtl~7_combout\ & (\Input[15]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~127_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[15]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~127_combout\,
	combout => \RAMM|Data~127_combout\);

-- Location: LCCOMB_X23_Y14_N30
\RAMM|Data~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~63_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~63_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~63_combout\);

-- Location: LCCOMB_X23_Y14_N28
\RAMM|Data~191\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~191_combout\ = (\rtl~3_combout\ & (\Input[15]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~191_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~3_combout\,
	datab => \Input[15]~input_o\,
	datad => \RAMM|Data~191_combout\,
	combout => \RAMM|Data~191_combout\);

-- Location: LCCOMB_X23_Y14_N12
\RAMM|Data~413\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~413_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~191_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~63_combout\,
	datab => \RAMM|Data~191_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~413_combout\);

-- Location: LCCOMB_X23_Y14_N14
\RAMM|Data~414\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~414_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~413_combout\ & (\RAMM|Data~255_combout\)) # (!\RAMM|Data~413_combout\ & ((\RAMM|Data~127_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~413_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~255_combout\,
	datab => \RAMM|Data~127_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~413_combout\,
	combout => \RAMM|Data~414_combout\);

-- Location: LCCOMB_X23_Y14_N24
\RAMM|Data~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~95_combout\ = (\rtl~4_combout\ & (\Input[15]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~95_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~95_combout\,
	combout => \RAMM|Data~95_combout\);

-- Location: LCCOMB_X23_Y14_N26
\RAMM|Data~223\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~223_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~223_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~223_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~223_combout\);

-- Location: LCCOMB_X23_Y14_N16
\RAMM|Data~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~31_combout\ = (\rtl~9_combout\ & (\Input[15]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~9_combout\,
	datab => \Input[15]~input_o\,
	datad => \RAMM|Data~31_combout\,
	combout => \RAMM|Data~31_combout\);

-- Location: LCCOMB_X23_Y14_N18
\RAMM|Data~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~159_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~159_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \RAMM|Data~159_combout\,
	combout => \RAMM|Data~159_combout\);

-- Location: LCCOMB_X23_Y14_N20
\RAMM|Data~406\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~406_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~159_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~31_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~159_combout\,
	combout => \RAMM|Data~406_combout\);

-- Location: LCCOMB_X23_Y14_N2
\RAMM|Data~407\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~407_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~406_combout\ & ((\RAMM|Data~223_combout\))) # (!\RAMM|Data~406_combout\ & (\RAMM|Data~95_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~406_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~95_combout\,
	datac => \RAMM|Data~223_combout\,
	datad => \RAMM|Data~406_combout\,
	combout => \RAMM|Data~407_combout\);

-- Location: LCCOMB_X25_Y15_N4
\RAMM|Data~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~143_combout\ = (\rtl~2_combout\ & (\Input[15]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~143_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~143_combout\,
	datad => \rtl~2_combout\,
	combout => \RAMM|Data~143_combout\);

-- Location: LCCOMB_X24_Y12_N14
\RAMM|Data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~15_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~15_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~15_combout\);

-- Location: LCCOMB_X24_Y14_N8
\RAMM|Data~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~79_combout\ = (\rtl~6_combout\ & (\Input[15]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~79_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[15]~input_o\,
	datac => \RAMM|Data~79_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~79_combout\);

-- Location: LCCOMB_X24_Y12_N8
\RAMM|Data~410\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~410_combout\ = (\MAR|temp\(2) & ((\MAR|temp\(3)) # ((\RAMM|Data~79_combout\)))) # (!\MAR|temp\(2) & (!\MAR|temp\(3) & (\RAMM|Data~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~15_combout\,
	datad => \RAMM|Data~79_combout\,
	combout => \RAMM|Data~410_combout\);

-- Location: LCCOMB_X23_Y13_N22
\RAMM|Data~207\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~207_combout\ = (\rtl~14_combout\ & (\Input[15]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~207_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~207_combout\,
	datad => \rtl~14_combout\,
	combout => \RAMM|Data~207_combout\);

-- Location: LCCOMB_X24_Y12_N26
\RAMM|Data~411\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~411_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~410_combout\ & ((\RAMM|Data~207_combout\))) # (!\RAMM|Data~410_combout\ & (\RAMM|Data~143_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~410_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~143_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~410_combout\,
	datad => \RAMM|Data~207_combout\,
	combout => \RAMM|Data~411_combout\);

-- Location: LCCOMB_X23_Y13_N14
\RAMM|Data~239\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~239_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~239_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~239_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~239_combout\);

-- Location: LCCOMB_X23_Y13_N4
\RAMM|Data~175\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~175_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[15]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~175_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~175_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~175_combout\);

-- Location: LCCOMB_X25_Y15_N8
\RAMM|Data~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~47_combout\ = (\rtl~8_combout\ & (\Input[15]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~47_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~47_combout\,
	datad => \rtl~8_combout\,
	combout => \RAMM|Data~47_combout\);

-- Location: LCCOMB_X23_Y13_N8
\RAMM|Data~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~111_combout\ = (\rtl~5_combout\ & (\Input[15]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~111_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[15]~input_o\,
	datac => \RAMM|Data~111_combout\,
	datad => \rtl~5_combout\,
	combout => \RAMM|Data~111_combout\);

-- Location: LCCOMB_X23_Y13_N12
\RAMM|Data~408\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~408_combout\ = (\MAR|temp\(2) & (((\RAMM|Data~111_combout\) # (\MAR|temp\(3))))) # (!\MAR|temp\(2) & (\RAMM|Data~47_combout\ & ((!\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~47_combout\,
	datab => \RAMM|Data~111_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~408_combout\);

-- Location: LCCOMB_X23_Y13_N30
\RAMM|Data~409\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~409_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~408_combout\ & (\RAMM|Data~239_combout\)) # (!\RAMM|Data~408_combout\ & ((\RAMM|Data~175_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~408_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~239_combout\,
	datac => \RAMM|Data~175_combout\,
	datad => \RAMM|Data~408_combout\,
	combout => \RAMM|Data~409_combout\);

-- Location: LCCOMB_X24_Y12_N20
\RAMM|Data~412\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~412_combout\ = (\MAR|temp\(1) & ((\MAR|temp\(0)) # ((\RAMM|Data~409_combout\)))) # (!\MAR|temp\(1) & (!\MAR|temp\(0) & (\RAMM|Data~411_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~411_combout\,
	datad => \RAMM|Data~409_combout\,
	combout => \RAMM|Data~412_combout\);

-- Location: LCCOMB_X24_Y12_N2
\RAMM|Data~415\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~415_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~412_combout\ & (\RAMM|Data~414_combout\)) # (!\RAMM|Data~412_combout\ & ((\RAMM|Data~407_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~412_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~414_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~407_combout\,
	datad => \RAMM|Data~412_combout\,
	combout => \RAMM|Data~415_combout\);

-- Location: LCCOMB_X24_Y12_N0
\RAMM|DO[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(15) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~415_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO[15]~0clkctrl_outclk\,
	datab => \RAMM|DO\(15),
	datad => \RAMM|Data~415_combout\,
	combout => \RAMM|DO\(15));

-- Location: LCCOMB_X23_Y10_N12
\DR|temp[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[15]~feeder_combout\ = \RAMM|DO\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RAMM|DO\(15),
	combout => \DR|temp[15]~feeder_combout\);

-- Location: FF_X23_Y10_N13
\DR|temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[15]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(15));

-- Location: FF_X23_Y10_N15
\ACC|temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[15]~17_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(15));

-- Location: IOIBUF_X30_Y24_N22
\Input[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(13),
	o => \Input[13]~input_o\);

-- Location: LCCOMB_X25_Y12_N0
\RAMM|Data~189\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~189_combout\ = (\rtl~3_combout\ & (\Input[13]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~189_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~3_combout\,
	datac => \Input[13]~input_o\,
	datad => \RAMM|Data~189_combout\,
	combout => \RAMM|Data~189_combout\);

-- Location: LCCOMB_X25_Y12_N6
\RAMM|Data~253\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~253_combout\ = (\rtl~15_combout\ & (\Input[13]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~253_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~15_combout\,
	datac => \Input[13]~input_o\,
	datad => \RAMM|Data~253_combout\,
	combout => \RAMM|Data~253_combout\);

-- Location: LCCOMB_X25_Y12_N10
\RAMM|Data~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~125_combout\ = (\rtl~7_combout\ & (\Input[13]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~125_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~125_combout\,
	combout => \RAMM|Data~125_combout\);

-- Location: LCCOMB_X25_Y12_N16
\RAMM|Data~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~61_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \RAMM|Data~61_combout\,
	combout => \RAMM|Data~61_combout\);

-- Location: LCCOMB_X25_Y12_N28
\RAMM|Data~393\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~393_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~125_combout\) # ((\MAR|temp\(3))))) # (!\MAR|temp\(2) & (((\RAMM|Data~61_combout\ & !\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~125_combout\,
	datab => \RAMM|Data~61_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~393_combout\);

-- Location: LCCOMB_X25_Y12_N22
\RAMM|Data~394\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~394_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~393_combout\ & ((\RAMM|Data~253_combout\))) # (!\RAMM|Data~393_combout\ & (\RAMM|Data~189_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~393_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~189_combout\,
	datac => \RAMM|Data~253_combout\,
	datad => \RAMM|Data~393_combout\,
	combout => \RAMM|Data~394_combout\);

-- Location: LCCOMB_X24_Y13_N28
\RAMM|Data~237\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~237_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~237_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \RAMM|Data~237_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~237_combout\);

-- Location: LCCOMB_X24_Y13_N18
\RAMM|Data~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~109_combout\ = (\rtl~5_combout\ & (\Input[13]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~109_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~5_combout\,
	datac => \Input[13]~input_o\,
	datad => \RAMM|Data~109_combout\,
	combout => \RAMM|Data~109_combout\);

-- Location: LCCOMB_X24_Y13_N6
\RAMM|Data~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~45_combout\ = (\rtl~8_combout\ & (\Input[13]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~45_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~45_combout\,
	combout => \RAMM|Data~45_combout\);

-- Location: LCCOMB_X24_Y13_N20
\RAMM|Data~173\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~173_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~173_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \RAMM|Data~173_combout\,
	combout => \RAMM|Data~173_combout\);

-- Location: LCCOMB_X24_Y13_N0
\RAMM|Data~386\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~386_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~173_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~45_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~173_combout\,
	combout => \RAMM|Data~386_combout\);

-- Location: LCCOMB_X24_Y13_N30
\RAMM|Data~387\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~387_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~386_combout\ & (\RAMM|Data~237_combout\)) # (!\RAMM|Data~386_combout\ & ((\RAMM|Data~109_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~386_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~237_combout\,
	datab => \RAMM|Data~109_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~386_combout\,
	combout => \RAMM|Data~387_combout\);

-- Location: LCCOMB_X25_Y12_N8
\RAMM|Data~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~157_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~157_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \RAMM|Data~157_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~157_combout\);

-- Location: LCCOMB_X25_Y12_N26
\RAMM|Data~221\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~221_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~221_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \RAMM|Data~221_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~221_combout\);

-- Location: LCCOMB_X25_Y12_N12
\RAMM|Data~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~29_combout\ = (\rtl~9_combout\ & ((\Input[13]~input_o\))) # (!\rtl~9_combout\ & (\RAMM|Data~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~29_combout\,
	datac => \Input[13]~input_o\,
	datad => \rtl~9_combout\,
	combout => \RAMM|Data~29_combout\);

-- Location: LCCOMB_X25_Y12_N14
\RAMM|Data~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~93_combout\ = (\rtl~4_combout\ & (\Input[13]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datab => \RAMM|Data~93_combout\,
	datac => \rtl~4_combout\,
	combout => \RAMM|Data~93_combout\);

-- Location: LCCOMB_X25_Y12_N20
\RAMM|Data~388\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~388_combout\ = (\MAR|temp\(2) & (((\RAMM|Data~93_combout\) # (\MAR|temp\(3))))) # (!\MAR|temp\(2) & (\RAMM|Data~29_combout\ & ((!\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~29_combout\,
	datab => \RAMM|Data~93_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~388_combout\);

-- Location: LCCOMB_X25_Y12_N30
\RAMM|Data~389\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~389_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~388_combout\ & ((\RAMM|Data~221_combout\))) # (!\RAMM|Data~388_combout\ & (\RAMM|Data~157_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~388_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~157_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~221_combout\,
	datad => \RAMM|Data~388_combout\,
	combout => \RAMM|Data~389_combout\);

-- Location: LCCOMB_X24_Y13_N2
\RAMM|Data~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~77_combout\ = (\rtl~6_combout\ & ((\Input[13]~input_o\))) # (!\rtl~6_combout\ & (\RAMM|Data~77_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~77_combout\,
	datac => \Input[13]~input_o\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~77_combout\);

-- Location: LCCOMB_X24_Y13_N16
\RAMM|Data~205\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~205_combout\ = (\rtl~14_combout\ & (\Input[13]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~205_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[13]~input_o\,
	datac => \rtl~14_combout\,
	datad => \RAMM|Data~205_combout\,
	combout => \RAMM|Data~205_combout\);

-- Location: LCCOMB_X25_Y15_N6
\RAMM|Data~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~141_combout\ = (\rtl~2_combout\ & (\Input[13]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~141_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[13]~input_o\,
	datac => \rtl~2_combout\,
	datad => \RAMM|Data~141_combout\,
	combout => \RAMM|Data~141_combout\);

-- Location: LCCOMB_X23_Y12_N14
\RAMM|Data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~13_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[13]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[13]~input_o\,
	datac => \RAMM|Data~13_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~13_combout\);

-- Location: LCCOMB_X24_Y12_N6
\RAMM|Data~390\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~390_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~141_combout\) # ((\MAR|temp\(2))))) # (!\MAR|temp\(3) & (((!\MAR|temp\(2) & \RAMM|Data~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~141_combout\,
	datab => \MAR|temp\(3),
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~13_combout\,
	combout => \RAMM|Data~390_combout\);

-- Location: LCCOMB_X24_Y12_N28
\RAMM|Data~391\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~391_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~390_combout\ & ((\RAMM|Data~205_combout\))) # (!\RAMM|Data~390_combout\ & (\RAMM|Data~77_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~390_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~77_combout\,
	datac => \RAMM|Data~205_combout\,
	datad => \RAMM|Data~390_combout\,
	combout => \RAMM|Data~391_combout\);

-- Location: LCCOMB_X24_Y12_N22
\RAMM|Data~392\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~392_combout\ = (\MAR|temp\(1) & (\MAR|temp\(0))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & (\RAMM|Data~389_combout\)) # (!\MAR|temp\(0) & ((\RAMM|Data~391_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~389_combout\,
	datad => \RAMM|Data~391_combout\,
	combout => \RAMM|Data~392_combout\);

-- Location: LCCOMB_X23_Y12_N18
\RAMM|Data~395\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~395_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~392_combout\ & (\RAMM|Data~394_combout\)) # (!\RAMM|Data~392_combout\ & ((\RAMM|Data~387_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~392_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~394_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~387_combout\,
	datad => \RAMM|Data~392_combout\,
	combout => \RAMM|Data~395_combout\);

-- Location: LCCOMB_X23_Y12_N26
\RAMM|DO[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(13) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~395_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(13),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~395_combout\,
	combout => \RAMM|DO\(13));

-- Location: LCCOMB_X22_Y12_N10
\DR|temp[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[13]~feeder_combout\ = \RAMM|DO\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(13),
	combout => \DR|temp[13]~feeder_combout\);

-- Location: FF_X22_Y12_N11
\DR|temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[13]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(13));

-- Location: IOIBUF_X13_Y24_N15
\Input[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(12),
	o => \Input[12]~input_o\);

-- Location: LCCOMB_X22_Y14_N12
\RAMM|Data~188\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~188_combout\ = (\rtl~3_combout\ & (\Input[12]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~188_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~3_combout\,
	datab => \Input[12]~input_o\,
	datad => \RAMM|Data~188_combout\,
	combout => \RAMM|Data~188_combout\);

-- Location: LCCOMB_X21_Y14_N24
\RAMM|Data~172\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~172_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~172_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \RAMM|Data~172_combout\,
	combout => \RAMM|Data~172_combout\);

-- Location: LCCOMB_X22_Y14_N30
\RAMM|Data~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~140_combout\ = (\rtl~2_combout\ & (\Input[12]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~140_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \RAMM|Data~140_combout\,
	datad => \rtl~2_combout\,
	combout => \RAMM|Data~140_combout\);

-- Location: LCCOMB_X22_Y14_N8
\RAMM|Data~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~156_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~156_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \RAMM|Data~156_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~156_combout\);

-- Location: LCCOMB_X22_Y14_N0
\RAMM|Data~376\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~376_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & ((\RAMM|Data~156_combout\))) # (!\MAR|temp\(0) & (\RAMM|Data~140_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~140_combout\,
	datab => \RAMM|Data~156_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~376_combout\);

-- Location: LCCOMB_X22_Y14_N26
\RAMM|Data~377\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~377_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~376_combout\ & (\RAMM|Data~188_combout\)) # (!\RAMM|Data~376_combout\ & ((\RAMM|Data~172_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~376_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~188_combout\,
	datab => \RAMM|Data~172_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~376_combout\,
	combout => \RAMM|Data~377_combout\);

-- Location: LCCOMB_X22_Y14_N6
\RAMM|Data~252\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~252_combout\ = (\rtl~15_combout\ & (\Input[12]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~252_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \rtl~15_combout\,
	datad => \RAMM|Data~252_combout\,
	combout => \RAMM|Data~252_combout\);

-- Location: LCCOMB_X22_Y14_N4
\RAMM|Data~220\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~220_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~220_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \RAMM|Data~220_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~220_combout\);

-- Location: LCCOMB_X22_Y14_N28
\RAMM|Data~204\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~204_combout\ = (\rtl~14_combout\ & (\Input[12]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~204_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datab => \Input[12]~input_o\,
	datad => \RAMM|Data~204_combout\,
	combout => \RAMM|Data~204_combout\);

-- Location: LCCOMB_X22_Y14_N2
\RAMM|Data~236\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~236_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~236_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~236_combout\,
	combout => \RAMM|Data~236_combout\);

-- Location: LCCOMB_X22_Y14_N24
\RAMM|Data~383\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~383_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~236_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~204_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~204_combout\,
	datab => \RAMM|Data~236_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~383_combout\);

-- Location: LCCOMB_X22_Y14_N10
\RAMM|Data~384\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~384_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~383_combout\ & (\RAMM|Data~252_combout\)) # (!\RAMM|Data~383_combout\ & ((\RAMM|Data~220_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~383_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~252_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~220_combout\,
	datad => \RAMM|Data~383_combout\,
	combout => \RAMM|Data~384_combout\);

-- Location: LCCOMB_X23_Y16_N6
\RAMM|Data~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~92_combout\ = (\rtl~4_combout\ & (\Input[12]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[12]~input_o\,
	datab => \rtl~4_combout\,
	datad => \RAMM|Data~92_combout\,
	combout => \RAMM|Data~92_combout\);

-- Location: LCCOMB_X23_Y16_N16
\RAMM|Data~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~76_combout\ = (\rtl~6_combout\ & (\Input[12]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~76_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[12]~input_o\,
	datac => \rtl~6_combout\,
	datad => \RAMM|Data~76_combout\,
	combout => \RAMM|Data~76_combout\);

-- Location: LCCOMB_X23_Y16_N24
\RAMM|Data~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~108_combout\ = (\rtl~5_combout\ & (\Input[12]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~108_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[12]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~108_combout\,
	combout => \RAMM|Data~108_combout\);

-- Location: LCCOMB_X23_Y16_N14
\RAMM|Data~378\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~378_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~108_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~76_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~76_combout\,
	datab => \RAMM|Data~108_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~378_combout\);

-- Location: LCCOMB_X23_Y16_N10
\RAMM|Data~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~124_combout\ = (\rtl~7_combout\ & (\Input[12]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~124_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[12]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~124_combout\,
	combout => \RAMM|Data~124_combout\);

-- Location: LCCOMB_X23_Y16_N20
\RAMM|Data~379\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~379_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~378_combout\ & ((\RAMM|Data~124_combout\))) # (!\RAMM|Data~378_combout\ & (\RAMM|Data~92_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~378_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~92_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~378_combout\,
	datad => \RAMM|Data~124_combout\,
	combout => \RAMM|Data~379_combout\);

-- Location: LCCOMB_X21_Y16_N28
\RAMM|Data~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~60_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \RAMM|Data~60_combout\,
	combout => \RAMM|Data~60_combout\);

-- Location: LCCOMB_X22_Y15_N10
\RAMM|Data~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~44_combout\ = (\rtl~8_combout\ & (\Input[12]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datac => \Input[12]~input_o\,
	datad => \RAMM|Data~44_combout\,
	combout => \RAMM|Data~44_combout\);

-- Location: LCCOMB_X22_Y14_N22
\RAMM|Data~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~28_combout\ = (\rtl~9_combout\ & (\Input[12]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \RAMM|Data~28_combout\,
	datad => \rtl~9_combout\,
	combout => \RAMM|Data~28_combout\);

-- Location: LCCOMB_X21_Y16_N14
\RAMM|Data~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~12_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[12]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[12]~input_o\,
	datac => \RAMM|Data~12_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~12_combout\);

-- Location: LCCOMB_X22_Y16_N8
\RAMM|Data~380\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~380_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & (\RAMM|Data~28_combout\)) # (!\MAR|temp\(0) & ((\RAMM|Data~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~28_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~12_combout\,
	combout => \RAMM|Data~380_combout\);

-- Location: LCCOMB_X22_Y16_N18
\RAMM|Data~381\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~381_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~380_combout\ & (\RAMM|Data~60_combout\)) # (!\RAMM|Data~380_combout\ & ((\RAMM|Data~44_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~380_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~60_combout\,
	datac => \RAMM|Data~44_combout\,
	datad => \RAMM|Data~380_combout\,
	combout => \RAMM|Data~381_combout\);

-- Location: LCCOMB_X22_Y16_N0
\RAMM|Data~382\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~382_combout\ = (\MAR|temp\(3) & (\MAR|temp\(2))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~379_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~381_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~379_combout\,
	datad => \RAMM|Data~381_combout\,
	combout => \RAMM|Data~382_combout\);

-- Location: LCCOMB_X22_Y16_N2
\RAMM|Data~385\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~385_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~382_combout\ & ((\RAMM|Data~384_combout\))) # (!\RAMM|Data~382_combout\ & (\RAMM|Data~377_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~382_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~377_combout\,
	datac => \RAMM|Data~384_combout\,
	datad => \RAMM|Data~382_combout\,
	combout => \RAMM|Data~385_combout\);

-- Location: LCCOMB_X22_Y16_N4
\RAMM|DO[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(12) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~385_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(12),
	datab => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~385_combout\,
	combout => \RAMM|DO\(12));

-- Location: FF_X23_Y16_N9
\DR|temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(12),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(12));

-- Location: IOIBUF_X28_Y24_N15
\Input[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(11),
	o => \Input[11]~input_o\);

-- Location: LCCOMB_X24_Y18_N16
\RAMM|Data~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~123_combout\ = (\rtl~7_combout\ & (\Input[11]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~123_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~123_combout\,
	combout => \RAMM|Data~123_combout\);

-- Location: LCCOMB_X25_Y14_N0
\RAMM|Data~251\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~251_combout\ = (\rtl~15_combout\ & (\Input[11]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~251_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~15_combout\,
	datac => \Input[11]~input_o\,
	datad => \RAMM|Data~251_combout\,
	combout => \RAMM|Data~251_combout\);

-- Location: LCCOMB_X23_Y18_N0
\RAMM|Data~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~59_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~59_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[11]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \RAMM|Data~59_combout\,
	combout => \RAMM|Data~59_combout\);

-- Location: LCCOMB_X24_Y18_N14
\RAMM|Data~187\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~187_combout\ = (\rtl~3_combout\ & (\Input[11]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~187_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datab => \RAMM|Data~187_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~187_combout\);

-- Location: LCCOMB_X24_Y18_N24
\RAMM|Data~373\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~373_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~187_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~59_combout\,
	datab => \RAMM|Data~187_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~373_combout\);

-- Location: LCCOMB_X24_Y18_N26
\RAMM|Data~374\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~374_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~373_combout\ & ((\RAMM|Data~251_combout\))) # (!\RAMM|Data~373_combout\ & (\RAMM|Data~123_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~373_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~123_combout\,
	datac => \RAMM|Data~251_combout\,
	datad => \RAMM|Data~373_combout\,
	combout => \RAMM|Data~374_combout\);

-- Location: LCCOMB_X23_Y18_N18
\RAMM|Data~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~91_combout\ = (\rtl~4_combout\ & (\Input[11]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~91_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[11]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~91_combout\,
	combout => \RAMM|Data~91_combout\);

-- Location: LCCOMB_X26_Y14_N10
\RAMM|Data~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~27_combout\ = (\rtl~9_combout\ & (\Input[11]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~9_combout\,
	datac => \Input[11]~input_o\,
	datad => \RAMM|Data~27_combout\,
	combout => \RAMM|Data~27_combout\);

-- Location: LCCOMB_X23_Y18_N8
\RAMM|Data~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~155_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~155_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[11]~input_o\,
	datac => \RAMM|Data~155_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~155_combout\);

-- Location: LCCOMB_X24_Y18_N30
\RAMM|Data~366\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~366_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~155_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~27_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~155_combout\,
	combout => \RAMM|Data~366_combout\);

-- Location: LCCOMB_X23_Y17_N8
\RAMM|Data~219\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~219_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~219_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \RAMM|Data~219_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~219_combout\);

-- Location: LCCOMB_X24_Y18_N4
\RAMM|Data~367\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~367_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~366_combout\ & ((\RAMM|Data~219_combout\))) # (!\RAMM|Data~366_combout\ & (\RAMM|Data~91_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~366_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~91_combout\,
	datac => \RAMM|Data~366_combout\,
	datad => \RAMM|Data~219_combout\,
	combout => \RAMM|Data~367_combout\);

-- Location: LCCOMB_X24_Y19_N30
\RAMM|Data~235\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~235_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~235_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \RAMM|Data~235_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~235_combout\);

-- Location: LCCOMB_X24_Y18_N0
\RAMM|Data~171\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~171_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~171_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datab => \RAMM|Data~171_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~171_combout\);

-- Location: LCCOMB_X25_Y18_N24
\RAMM|Data~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~107_combout\ = (\rtl~5_combout\ & (\Input[11]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~107_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~107_combout\,
	combout => \RAMM|Data~107_combout\);

-- Location: LCCOMB_X25_Y18_N18
\RAMM|Data~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~43_combout\ = (\rtl~8_combout\ & (\Input[11]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datab => \rtl~8_combout\,
	datad => \RAMM|Data~43_combout\,
	combout => \RAMM|Data~43_combout\);

-- Location: LCCOMB_X24_Y18_N6
\RAMM|Data~368\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~368_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~107_combout\) # ((\MAR|temp\(3))))) # (!\MAR|temp\(2) & (((\RAMM|Data~43_combout\ & !\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~107_combout\,
	datab => \RAMM|Data~43_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~368_combout\);

-- Location: LCCOMB_X24_Y18_N8
\RAMM|Data~369\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~369_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~368_combout\ & (\RAMM|Data~235_combout\)) # (!\RAMM|Data~368_combout\ & ((\RAMM|Data~171_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~368_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~235_combout\,
	datab => \RAMM|Data~171_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~368_combout\,
	combout => \RAMM|Data~369_combout\);

-- Location: LCCOMB_X23_Y18_N2
\RAMM|Data~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~139_combout\ = (\rtl~2_combout\ & (\Input[11]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~139_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~2_combout\,
	datac => \Input[11]~input_o\,
	datad => \RAMM|Data~139_combout\,
	combout => \RAMM|Data~139_combout\);

-- Location: LCCOMB_X25_Y18_N28
\RAMM|Data~203\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~203_combout\ = (\rtl~14_combout\ & (\Input[11]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~203_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~14_combout\,
	datac => \Input[11]~input_o\,
	datad => \RAMM|Data~203_combout\,
	combout => \RAMM|Data~203_combout\);

-- Location: LCCOMB_X24_Y18_N20
\RAMM|Data~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~75_combout\ = (\rtl~6_combout\ & (\Input[11]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~75_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \RAMM|Data~75_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~75_combout\);

-- Location: LCCOMB_X24_Y18_N18
\RAMM|Data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~11_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[11]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[11]~input_o\,
	datac => \RAMM|Data~11_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~11_combout\);

-- Location: LCCOMB_X24_Y18_N10
\RAMM|Data~370\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~370_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2))))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~75_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~75_combout\,
	datab => \MAR|temp\(3),
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~11_combout\,
	combout => \RAMM|Data~370_combout\);

-- Location: LCCOMB_X24_Y18_N28
\RAMM|Data~371\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~371_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~370_combout\ & ((\RAMM|Data~203_combout\))) # (!\RAMM|Data~370_combout\ & (\RAMM|Data~139_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~370_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~139_combout\,
	datab => \RAMM|Data~203_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~370_combout\,
	combout => \RAMM|Data~371_combout\);

-- Location: LCCOMB_X24_Y18_N2
\RAMM|Data~372\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~372_combout\ = (\MAR|temp\(1) & ((\MAR|temp\(0)) # ((\RAMM|Data~369_combout\)))) # (!\MAR|temp\(1) & (!\MAR|temp\(0) & ((\RAMM|Data~371_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~369_combout\,
	datad => \RAMM|Data~371_combout\,
	combout => \RAMM|Data~372_combout\);

-- Location: LCCOMB_X24_Y18_N12
\RAMM|Data~375\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~375_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~372_combout\ & (\RAMM|Data~374_combout\)) # (!\RAMM|Data~372_combout\ & ((\RAMM|Data~367_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~372_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~374_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~367_combout\,
	datad => \RAMM|Data~372_combout\,
	combout => \RAMM|Data~375_combout\);

-- Location: LCCOMB_X24_Y18_N22
\RAMM|DO[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(11) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~375_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(11),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~375_combout\,
	combout => \RAMM|DO\(11));

-- Location: FF_X24_Y18_N1
\DR|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(11),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(11));

-- Location: LCCOMB_X25_Y7_N20
\A|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~20_combout\ = ((\ACC|temp\(10) $ (\IR|WideOr3~2_combout\ $ (!\A|Add2~19\)))) # (GND)
-- \A|Add2~21\ = CARRY((\ACC|temp\(10) & ((\IR|WideOr3~2_combout\) # (!\A|Add2~19\))) # (!\ACC|temp\(10) & (\IR|WideOr3~2_combout\ & !\A|Add2~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(10),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~19\,
	combout => \A|Add2~20_combout\,
	cout => \A|Add2~21\);

-- Location: LCCOMB_X25_Y7_N22
\A|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~22_combout\ = (\IR|WideOr3~2_combout\ & ((\ACC|temp\(11) & (\A|Add2~21\ & VCC)) # (!\ACC|temp\(11) & (!\A|Add2~21\)))) # (!\IR|WideOr3~2_combout\ & ((\ACC|temp\(11) & (!\A|Add2~21\)) # (!\ACC|temp\(11) & ((\A|Add2~21\) # (GND)))))
-- \A|Add2~23\ = CARRY((\IR|WideOr3~2_combout\ & (!\ACC|temp\(11) & !\A|Add2~21\)) # (!\IR|WideOr3~2_combout\ & ((!\A|Add2~21\) # (!\ACC|temp\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(11),
	datad => VCC,
	cin => \A|Add2~21\,
	combout => \A|Add2~22_combout\,
	cout => \A|Add2~23\);

-- Location: LCCOMB_X22_Y8_N20
\A|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~20_combout\ = ((\ACC|temp\(10) $ (\d|D_OUT[10]~12_combout\ $ (\A|Add1~19\)))) # (GND)
-- \A|Add1~21\ = CARRY((\ACC|temp\(10) & ((!\A|Add1~19\) # (!\d|D_OUT[10]~12_combout\))) # (!\ACC|temp\(10) & (!\d|D_OUT[10]~12_combout\ & !\A|Add1~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(10),
	datab => \d|D_OUT[10]~12_combout\,
	datad => VCC,
	cin => \A|Add1~19\,
	combout => \A|Add1~20_combout\,
	cout => \A|Add1~21\);

-- Location: LCCOMB_X22_Y8_N22
\A|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~22_combout\ = (\d|D_OUT[11]~13_combout\ & ((\ACC|temp\(11) & (!\A|Add1~21\)) # (!\ACC|temp\(11) & ((\A|Add1~21\) # (GND))))) # (!\d|D_OUT[11]~13_combout\ & ((\ACC|temp\(11) & (\A|Add1~21\ & VCC)) # (!\ACC|temp\(11) & (!\A|Add1~21\))))
-- \A|Add1~23\ = CARRY((\d|D_OUT[11]~13_combout\ & ((!\A|Add1~21\) # (!\ACC|temp\(11)))) # (!\d|D_OUT[11]~13_combout\ & (!\ACC|temp\(11) & !\A|Add1~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[11]~13_combout\,
	datab => \ACC|temp\(11),
	datad => VCC,
	cin => \A|Add1~21\,
	combout => \A|Add1~22_combout\,
	cout => \A|Add1~23\);

-- Location: LCCOMB_X24_Y9_N20
\A|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~20_combout\ = ((\d|D_OUT[10]~12_combout\ $ (\ACC|temp\(10) $ (!\A|Add0~19\)))) # (GND)
-- \A|Add0~21\ = CARRY((\d|D_OUT[10]~12_combout\ & ((\ACC|temp\(10)) # (!\A|Add0~19\))) # (!\d|D_OUT[10]~12_combout\ & (\ACC|temp\(10) & !\A|Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[10]~12_combout\,
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|Add0~19\,
	combout => \A|Add0~20_combout\,
	cout => \A|Add0~21\);

-- Location: LCCOMB_X24_Y9_N22
\A|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~22_combout\ = (\d|D_OUT[11]~13_combout\ & ((\ACC|temp\(11) & (\A|Add0~21\ & VCC)) # (!\ACC|temp\(11) & (!\A|Add0~21\)))) # (!\d|D_OUT[11]~13_combout\ & ((\ACC|temp\(11) & (!\A|Add0~21\)) # (!\ACC|temp\(11) & ((\A|Add0~21\) # (GND)))))
-- \A|Add0~23\ = CARRY((\d|D_OUT[11]~13_combout\ & (!\ACC|temp\(11) & !\A|Add0~21\)) # (!\d|D_OUT[11]~13_combout\ & ((!\A|Add0~21\) # (!\ACC|temp\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[11]~13_combout\,
	datab => \ACC|temp\(11),
	datad => VCC,
	cin => \A|Add0~21\,
	combout => \A|Add0~22_combout\,
	cout => \A|Add0~23\);

-- Location: LCCOMB_X23_Y7_N20
\A|temp~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~32_combout\ = (\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & (\A|Add1~22_combout\)) # (!\IR|WideOr3~2_combout\ & ((\A|Add0~22_combout\))))) # (!\IR|WideOr1~1_combout\ & (\IR|WideOr3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \IR|WideOr3~2_combout\,
	datac => \A|Add1~22_combout\,
	datad => \A|Add0~22_combout\,
	combout => \A|temp~32_combout\);

-- Location: LCCOMB_X23_Y7_N6
\A|temp~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~33_combout\ = (\ACC|temp\(11) & ((\A|temp~32_combout\) # ((!\IR|WideOr1~1_combout\ & \d|D_OUT[11]~13_combout\)))) # (!\ACC|temp\(11) & (\A|temp~32_combout\ & ((\IR|WideOr1~1_combout\) # (\d|D_OUT[11]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datab => \IR|WideOr1~1_combout\,
	datac => \d|D_OUT[11]~13_combout\,
	datad => \A|temp~32_combout\,
	combout => \A|temp~33_combout\);

-- Location: LCCOMB_X23_Y7_N18
\A|temp~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~113_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~33_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~22_combout\)))) # (!\IR|WideOr0~3_combout\ & (((\A|temp~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~22_combout\,
	datab => \IR|WideOr0~3_combout\,
	datac => \A|temp~19_combout\,
	datad => \A|temp~33_combout\,
	combout => \A|temp~113_combout\);

-- Location: LCCOMB_X23_Y7_N8
\A|temp~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~114_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~113_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(11) $ (((\d|D_OUT[11]~13_combout\) # (\A|temp~113_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[11]~13_combout\,
	datad => \A|temp~113_combout\,
	combout => \A|temp~114_combout\);

-- Location: LCCOMB_X23_Y7_N28
\A|temp[11]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[11]~94_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[11]~13_combout\ $ (((\ACC|temp\(11)))))) # (!\A|temp~22_combout\ & (((\A|temp~114_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[11]~13_combout\,
	datab => \A|temp~114_combout\,
	datac => \A|temp~22_combout\,
	datad => \ACC|temp\(11),
	combout => \A|temp[11]~94_combout\);

-- Location: LCCOMB_X23_Y7_N26
\A|temp[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(11) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[11]~94_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp[11]~94_combout\,
	datac => \A|temp\(11),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(11));

-- Location: LCCOMB_X24_Y7_N6
\A|temp~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~34_combout\ = (\A|temp~22_combout\ & (\A|temp\(11))) # (!\A|temp~22_combout\ & ((\A|temp~114_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datac => \A|temp\(11),
	datad => \A|temp~114_combout\,
	combout => \A|temp~34_combout\);

-- Location: LCCOMB_X24_Y7_N2
\A|DO[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(11) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~34_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(11),
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|temp~34_combout\,
	combout => \A|DO\(11));

-- Location: LCCOMB_X23_Y9_N14
\d|D_OUT[11]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[11]~13_combout\ = (\A|DO\(11)) # (((\d|Equal0~5_combout\ & \DR|temp\(11))) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \DR|temp\(11),
	datac => \A|DO\(11),
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[11]~13_combout\);

-- Location: FF_X23_Y9_N15
\ACC|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[11]~13_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(11));

-- Location: LCCOMB_X25_Y7_N24
\A|Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~24_combout\ = ((\ACC|temp\(12) $ (\IR|WideOr3~2_combout\ $ (!\A|Add2~23\)))) # (GND)
-- \A|Add2~25\ = CARRY((\ACC|temp\(12) & ((\IR|WideOr3~2_combout\) # (!\A|Add2~23\))) # (!\ACC|temp\(12) & (\IR|WideOr3~2_combout\ & !\A|Add2~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(12),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~23\,
	combout => \A|Add2~24_combout\,
	cout => \A|Add2~25\);

-- Location: LCCOMB_X22_Y6_N20
\A|temp~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~35_combout\ = (\IR|WideOr1~1_combout\ & (((!\IR|WideOr3~2_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(12) & ((\IR|WideOr3~2_combout\) # (\d|D_OUT[12]~14_combout\))) # (!\ACC|temp\(12) & (\IR|WideOr3~2_combout\ & 
-- \d|D_OUT[12]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(12),
	datab => \IR|WideOr1~1_combout\,
	datac => \IR|WideOr3~2_combout\,
	datad => \d|D_OUT[12]~14_combout\,
	combout => \A|temp~35_combout\);

-- Location: LCCOMB_X22_Y8_N24
\A|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~24_combout\ = ((\d|D_OUT[12]~14_combout\ $ (\ACC|temp\(12) $ (\A|Add1~23\)))) # (GND)
-- \A|Add1~25\ = CARRY((\d|D_OUT[12]~14_combout\ & (\ACC|temp\(12) & !\A|Add1~23\)) # (!\d|D_OUT[12]~14_combout\ & ((\ACC|temp\(12)) # (!\A|Add1~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[12]~14_combout\,
	datab => \ACC|temp\(12),
	datad => VCC,
	cin => \A|Add1~23\,
	combout => \A|Add1~24_combout\,
	cout => \A|Add1~25\);

-- Location: LCCOMB_X24_Y9_N24
\A|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~24_combout\ = ((\d|D_OUT[12]~14_combout\ $ (\ACC|temp\(12) $ (!\A|Add0~23\)))) # (GND)
-- \A|Add0~25\ = CARRY((\d|D_OUT[12]~14_combout\ & ((\ACC|temp\(12)) # (!\A|Add0~23\))) # (!\d|D_OUT[12]~14_combout\ & (\ACC|temp\(12) & !\A|Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[12]~14_combout\,
	datab => \ACC|temp\(12),
	datad => VCC,
	cin => \A|Add0~23\,
	combout => \A|Add0~24_combout\,
	cout => \A|Add0~25\);

-- Location: LCCOMB_X23_Y6_N10
\A|temp~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~36_combout\ = (\IR|WideOr1~1_combout\ & ((\A|temp~35_combout\ & ((\A|Add0~24_combout\))) # (!\A|temp~35_combout\ & (\A|Add1~24_combout\)))) # (!\IR|WideOr1~1_combout\ & (\A|temp~35_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \A|temp~35_combout\,
	datac => \A|Add1~24_combout\,
	datad => \A|Add0~24_combout\,
	combout => \A|temp~36_combout\);

-- Location: LCCOMB_X23_Y6_N24
\A|temp~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~37_combout\ = (\A|temp~19_combout\ & (((\A|temp~36_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~24_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~24_combout\,
	datab => \A|temp~19_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~36_combout\,
	combout => \A|temp~37_combout\);

-- Location: LCCOMB_X23_Y6_N2
\A|temp~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~38_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~37_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(12) $ (((\d|D_OUT[12]~14_combout\) # (\A|temp~37_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[12]~14_combout\,
	datab => \ACC|temp\(12),
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~37_combout\,
	combout => \A|temp~38_combout\);

-- Location: LCCOMB_X22_Y6_N2
\A|temp[12]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[12]~87_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[12]~14_combout\ $ ((\ACC|temp\(12))))) # (!\A|temp~22_combout\ & (((\A|temp~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[12]~14_combout\,
	datab => \ACC|temp\(12),
	datac => \A|temp~38_combout\,
	datad => \A|temp~22_combout\,
	combout => \A|temp[12]~87_combout\);

-- Location: LCCOMB_X22_Y6_N12
\A|temp[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(12) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp[12]~87_combout\))) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(12),
	datac => \A|temp[12]~87_combout\,
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(12));

-- Location: LCCOMB_X23_Y6_N12
\A|temp~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~39_combout\ = (\A|temp~22_combout\ & (\A|temp\(12))) # (!\A|temp~22_combout\ & ((\A|temp~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(12),
	datac => \A|temp~22_combout\,
	datad => \A|temp~38_combout\,
	combout => \A|temp~39_combout\);

-- Location: LCCOMB_X23_Y6_N14
\A|DO[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(12) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~39_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~39_combout\,
	datab => \A|DO\(12),
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(12));

-- Location: LCCOMB_X23_Y9_N6
\d|D_OUT[12]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[12]~14_combout\ = (\A|DO\(12)) # (((\d|Equal0~5_combout\ & \DR|temp\(12))) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \DR|temp\(12),
	datac => \A|DO\(12),
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[12]~14_combout\);

-- Location: FF_X23_Y9_N7
\ACC|temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[12]~14_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(12));

-- Location: LCCOMB_X25_Y7_N26
\A|Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~26_combout\ = (\ACC|temp\(13) & ((\IR|WideOr3~2_combout\ & (\A|Add2~25\ & VCC)) # (!\IR|WideOr3~2_combout\ & (!\A|Add2~25\)))) # (!\ACC|temp\(13) & ((\IR|WideOr3~2_combout\ & (!\A|Add2~25\)) # (!\IR|WideOr3~2_combout\ & ((\A|Add2~25\) # (GND)))))
-- \A|Add2~27\ = CARRY((\ACC|temp\(13) & (!\IR|WideOr3~2_combout\ & !\A|Add2~25\)) # (!\ACC|temp\(13) & ((!\A|Add2~25\) # (!\IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(13),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~25\,
	combout => \A|Add2~26_combout\,
	cout => \A|Add2~27\);

-- Location: LCCOMB_X22_Y8_N26
\A|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~26_combout\ = (\d|D_OUT[13]~15_combout\ & ((\ACC|temp\(13) & (!\A|Add1~25\)) # (!\ACC|temp\(13) & ((\A|Add1~25\) # (GND))))) # (!\d|D_OUT[13]~15_combout\ & ((\ACC|temp\(13) & (\A|Add1~25\ & VCC)) # (!\ACC|temp\(13) & (!\A|Add1~25\))))
-- \A|Add1~27\ = CARRY((\d|D_OUT[13]~15_combout\ & ((!\A|Add1~25\) # (!\ACC|temp\(13)))) # (!\d|D_OUT[13]~15_combout\ & (!\ACC|temp\(13) & !\A|Add1~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[13]~15_combout\,
	datab => \ACC|temp\(13),
	datad => VCC,
	cin => \A|Add1~25\,
	combout => \A|Add1~26_combout\,
	cout => \A|Add1~27\);

-- Location: LCCOMB_X24_Y9_N26
\A|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~26_combout\ = (\d|D_OUT[13]~15_combout\ & ((\ACC|temp\(13) & (\A|Add0~25\ & VCC)) # (!\ACC|temp\(13) & (!\A|Add0~25\)))) # (!\d|D_OUT[13]~15_combout\ & ((\ACC|temp\(13) & (!\A|Add0~25\)) # (!\ACC|temp\(13) & ((\A|Add0~25\) # (GND)))))
-- \A|Add0~27\ = CARRY((\d|D_OUT[13]~15_combout\ & (!\ACC|temp\(13) & !\A|Add0~25\)) # (!\d|D_OUT[13]~15_combout\ & ((!\A|Add0~25\) # (!\ACC|temp\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[13]~15_combout\,
	datab => \ACC|temp\(13),
	datad => VCC,
	cin => \A|Add0~25\,
	combout => \A|Add0~26_combout\,
	cout => \A|Add0~27\);

-- Location: LCCOMB_X23_Y6_N18
\A|temp~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~40_combout\ = (\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & (\A|Add1~26_combout\)) # (!\IR|WideOr3~2_combout\ & ((\A|Add0~26_combout\))))) # (!\IR|WideOr1~1_combout\ & (((\IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \A|Add1~26_combout\,
	datac => \IR|WideOr3~2_combout\,
	datad => \A|Add0~26_combout\,
	combout => \A|temp~40_combout\);

-- Location: LCCOMB_X23_Y6_N0
\A|temp~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~41_combout\ = (\IR|WideOr1~1_combout\ & (((\A|temp~40_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(13) & ((\d|D_OUT[13]~15_combout\) # (\A|temp~40_combout\))) # (!\ACC|temp\(13) & (\d|D_OUT[13]~15_combout\ & \A|temp~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \ACC|temp\(13),
	datac => \d|D_OUT[13]~15_combout\,
	datad => \A|temp~40_combout\,
	combout => \A|temp~41_combout\);

-- Location: LCCOMB_X23_Y6_N6
\A|temp~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~111_combout\ = (\A|temp~19_combout\ & (((\A|temp~41_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~26_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~26_combout\,
	datab => \A|temp~19_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~41_combout\,
	combout => \A|temp~111_combout\);

-- Location: LCCOMB_X23_Y6_N16
\A|temp~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~112_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~111_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(13) $ (((\d|D_OUT[13]~15_combout\) # (\A|temp~111_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[13]~15_combout\,
	datab => \ACC|temp\(13),
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~111_combout\,
	combout => \A|temp~112_combout\);

-- Location: LCCOMB_X23_Y6_N4
\A|temp[13]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[13]~95_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[13]~15_combout\ $ (((\ACC|temp\(13)))))) # (!\A|temp~22_combout\ & (((\A|temp~112_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[13]~15_combout\,
	datab => \A|temp~112_combout\,
	datac => \A|temp~22_combout\,
	datad => \ACC|temp\(13),
	combout => \A|temp[13]~95_combout\);

-- Location: LCCOMB_X23_Y6_N22
\A|temp[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(13) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp[13]~95_combout\))) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(13),
	datac => \A|temp[13]~95_combout\,
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(13));

-- Location: LCCOMB_X23_Y6_N30
\A|temp~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~42_combout\ = (\A|temp~22_combout\ & (\A|temp\(13))) # (!\A|temp~22_combout\ & ((\A|temp~112_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datac => \A|temp\(13),
	datad => \A|temp~112_combout\,
	combout => \A|temp~42_combout\);

-- Location: LCCOMB_X23_Y6_N20
\A|DO[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(13) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~42_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~42_combout\,
	datab => \A|DO\(13),
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(13));

-- Location: LCCOMB_X21_Y9_N18
\d|D_OUT[13]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[13]~15_combout\ = ((\A|DO\(13)) # ((\d|Equal0~5_combout\ & \DR|temp\(13)))) # (!\CTRLM|ESUM~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \DR|temp\(13),
	datac => \CTRLM|ESUM~1_combout\,
	datad => \A|DO\(13),
	combout => \d|D_OUT[13]~15_combout\);

-- Location: FF_X21_Y9_N19
\ACC|temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[13]~15_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(13));

-- Location: LCCOMB_X25_Y7_N28
\A|Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~28_combout\ = ((\ACC|temp\(14) $ (\IR|WideOr3~2_combout\ $ (!\A|Add2~27\)))) # (GND)
-- \A|Add2~29\ = CARRY((\ACC|temp\(14) & ((\IR|WideOr3~2_combout\) # (!\A|Add2~27\))) # (!\ACC|temp\(14) & (\IR|WideOr3~2_combout\ & !\A|Add2~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~27\,
	combout => \A|Add2~28_combout\,
	cout => \A|Add2~29\);

-- Location: LCCOMB_X25_Y7_N30
\A|Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~30_combout\ = \ACC|temp\(15) $ (\A|Add2~29\ $ (\IR|WideOr3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(15),
	datad => \IR|WideOr3~2_combout\,
	cin => \A|Add2~29\,
	combout => \A|Add2~30_combout\);

-- Location: LCCOMB_X24_Y9_N28
\A|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~28_combout\ = ((\d|D_OUT[14]~16_combout\ $ (\ACC|temp\(14) $ (!\A|Add0~27\)))) # (GND)
-- \A|Add0~29\ = CARRY((\d|D_OUT[14]~16_combout\ & ((\ACC|temp\(14)) # (!\A|Add0~27\))) # (!\d|D_OUT[14]~16_combout\ & (\ACC|temp\(14) & !\A|Add0~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[14]~16_combout\,
	datab => \ACC|temp\(14),
	datad => VCC,
	cin => \A|Add0~27\,
	combout => \A|Add0~28_combout\,
	cout => \A|Add0~29\);

-- Location: LCCOMB_X24_Y9_N30
\A|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add0~30_combout\ = \ACC|temp\(15) $ (\A|Add0~29\ $ (\d|D_OUT[15]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(15),
	datad => \d|D_OUT[15]~17_combout\,
	cin => \A|Add0~29\,
	combout => \A|Add0~30_combout\);

-- Location: LCCOMB_X22_Y8_N28
\A|Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~28_combout\ = ((\d|D_OUT[14]~16_combout\ $ (\ACC|temp\(14) $ (\A|Add1~27\)))) # (GND)
-- \A|Add1~29\ = CARRY((\d|D_OUT[14]~16_combout\ & (\ACC|temp\(14) & !\A|Add1~27\)) # (!\d|D_OUT[14]~16_combout\ & ((\ACC|temp\(14)) # (!\A|Add1~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[14]~16_combout\,
	datab => \ACC|temp\(14),
	datad => VCC,
	cin => \A|Add1~27\,
	combout => \A|Add1~28_combout\,
	cout => \A|Add1~29\);

-- Location: LCCOMB_X22_Y8_N30
\A|Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add1~30_combout\ = \ACC|temp\(15) $ (\A|Add1~29\ $ (!\d|D_OUT[15]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(15),
	datad => \d|D_OUT[15]~17_combout\,
	cin => \A|Add1~29\,
	combout => \A|Add1~30_combout\);

-- Location: LCCOMB_X24_Y7_N18
\A|temp~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~48_combout\ = (\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & ((\A|Add1~30_combout\))) # (!\IR|WideOr3~2_combout\ & (\A|Add0~30_combout\)))) # (!\IR|WideOr1~1_combout\ & (\IR|WideOr3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \IR|WideOr3~2_combout\,
	datac => \A|Add0~30_combout\,
	datad => \A|Add1~30_combout\,
	combout => \A|temp~48_combout\);

-- Location: LCCOMB_X24_Y7_N24
\A|temp~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~49_combout\ = (\d|D_OUT[15]~17_combout\ & ((\A|temp~48_combout\) # ((\ACC|temp\(15) & !\IR|WideOr1~1_combout\)))) # (!\d|D_OUT[15]~17_combout\ & (\A|temp~48_combout\ & ((\ACC|temp\(15)) # (\IR|WideOr1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[15]~17_combout\,
	datab => \ACC|temp\(15),
	datac => \IR|WideOr1~1_combout\,
	datad => \A|temp~48_combout\,
	combout => \A|temp~49_combout\);

-- Location: LCCOMB_X24_Y7_N16
\A|temp~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~109_combout\ = (\A|temp~19_combout\ & (((\A|temp~49_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~30_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~19_combout\,
	datab => \A|Add2~30_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~49_combout\,
	combout => \A|temp~109_combout\);

-- Location: LCCOMB_X24_Y7_N22
\A|temp~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~110_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~109_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(15) $ (((\d|D_OUT[15]~17_combout\) # (\A|temp~109_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(15),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[15]~17_combout\,
	datad => \A|temp~109_combout\,
	combout => \A|temp~110_combout\);

-- Location: LCCOMB_X23_Y10_N22
\A|temp[15]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[15]~96_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(15) $ (((\d|D_OUT[15]~17_combout\))))) # (!\A|temp~22_combout\ & (((\A|temp~110_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datab => \ACC|temp\(15),
	datac => \A|temp~110_combout\,
	datad => \d|D_OUT[15]~17_combout\,
	combout => \A|temp[15]~96_combout\);

-- Location: LCCOMB_X23_Y10_N8
\A|temp[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(15) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[15]~96_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp[15]~96_combout\,
	datac => \A|temp\(15),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(15));

-- Location: LCCOMB_X24_Y7_N14
\A|temp~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~50_combout\ = (\A|temp~22_combout\ & ((\A|temp\(15)))) # (!\A|temp~22_combout\ & (\A|temp~110_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datac => \A|temp~110_combout\,
	datad => \A|temp\(15),
	combout => \A|temp~50_combout\);

-- Location: LCCOMB_X24_Y7_N12
\A|DO[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(15) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~50_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(15),
	datac => \A|temp~50_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(15));

-- Location: LCCOMB_X23_Y10_N14
\d|D_OUT[15]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[15]~17_combout\ = (\A|DO\(15)) # (((\DR|temp\(15) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DR|temp\(15),
	datab => \A|DO\(15),
	datac => \d|Equal0~5_combout\,
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[15]~17_combout\);

-- Location: FF_X22_Y10_N11
\IR|temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[15]~17_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(15));

-- Location: LCCOMB_X22_Y10_N10
\IR|Equal5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal5~3_combout\ = (!\IR|temp\(6) & (!\IR|temp\(14) & (\IR|temp\(15) & \IR|temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(6),
	datab => \IR|temp\(14),
	datac => \IR|temp\(15),
	datad => \IR|temp\(7),
	combout => \IR|Equal5~3_combout\);

-- Location: FF_X21_Y9_N3
\IR|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[1]~2_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(1));

-- Location: FF_X21_Y9_N23
\IR|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[4]~6_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(4));

-- Location: LCCOMB_X21_Y9_N22
\IR|Equal5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal5~2_combout\ = (\IR|temp\(1) & (!\IR|temp\(4) & \IR|temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|temp\(1),
	datac => \IR|temp\(4),
	datad => \IR|temp\(0),
	combout => \IR|Equal5~2_combout\);

-- Location: LCCOMB_X21_Y9_N0
\IR|Equal5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal5~4_combout\ = (\IR|Equal5~3_combout\ & (\IR|Equal5~2_combout\ & \IR|Equal5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|Equal5~3_combout\,
	datac => \IR|Equal5~2_combout\,
	datad => \IR|Equal5~1_combout\,
	combout => \IR|Equal5~4_combout\);

-- Location: LCCOMB_X21_Y10_N18
\IR|WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr1~0_combout\ = ((\IR|Equal6~3_combout\) # ((\IR|Equal9~0_combout\) # (\IR|Equal5~4_combout\))) # (!\CTRLM|C2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|C2~2_combout\,
	datab => \IR|Equal6~3_combout\,
	datac => \IR|Equal9~0_combout\,
	datad => \IR|Equal5~4_combout\,
	combout => \IR|WideOr1~0_combout\);

-- Location: LCCOMB_X23_Y9_N2
\A|temp[0]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[0]~85_combout\ = (\A|temp[0]~84_combout\ & (\IR|WideOr0~2_combout\ $ (((!\IR|WideOr2~0_combout\ & !\IR|WideOr1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr2~0_combout\,
	datab => \IR|WideOr0~2_combout\,
	datac => \A|temp[0]~84_combout\,
	datad => \IR|WideOr1~0_combout\,
	combout => \A|temp[0]~85_combout\);

-- Location: CLKCTRL_G5
\A|temp[0]~85clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \A|temp[0]~85clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \A|temp[0]~85clkctrl_outclk\);

-- Location: LCCOMB_X23_Y8_N14
\A|temp[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(9) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[9]~93_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[9]~93_combout\,
	datac => \A|temp\(9),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(9));

-- Location: LCCOMB_X23_Y8_N30
\A|temp~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~26_combout\ = (\A|temp~22_combout\ & (\A|temp\(9))) # (!\A|temp~22_combout\ & ((\A|temp~116_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp\(9),
	datad => \A|temp~116_combout\,
	combout => \A|temp~26_combout\);

-- Location: LCCOMB_X23_Y8_N12
\A|DO[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(9) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~26_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(9),
	datac => \A|temp~26_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(9));

-- Location: IOIBUF_X28_Y24_N8
\Input[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(9),
	o => \Input[9]~input_o\);

-- Location: LCCOMB_X25_Y14_N26
\RAMM|Data~185\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~185_combout\ = (\rtl~3_combout\ & (\Input[9]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~185_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datac => \RAMM|Data~185_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~185_combout\);

-- Location: LCCOMB_X25_Y14_N12
\RAMM|Data~249\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~249_combout\ = (\rtl~15_combout\ & (\Input[9]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~249_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datab => \rtl~15_combout\,
	datad => \RAMM|Data~249_combout\,
	combout => \RAMM|Data~249_combout\);

-- Location: LCCOMB_X25_Y16_N6
\RAMM|Data~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~121_combout\ = (\rtl~7_combout\ & (\Input[9]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~121_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~121_combout\,
	combout => \RAMM|Data~121_combout\);

-- Location: LCCOMB_X24_Y16_N30
\RAMM|Data~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~57_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~57_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \RAMM|Data~57_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~57_combout\);

-- Location: LCCOMB_X24_Y16_N16
\RAMM|Data~353\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~353_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~121_combout\) # ((\MAR|temp\(3))))) # (!\MAR|temp\(2) & (((\RAMM|Data~57_combout\ & !\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~121_combout\,
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~57_combout\,
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~353_combout\);

-- Location: LCCOMB_X24_Y16_N26
\RAMM|Data~354\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~354_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~353_combout\ & ((\RAMM|Data~249_combout\))) # (!\RAMM|Data~353_combout\ & (\RAMM|Data~185_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~353_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~185_combout\,
	datac => \RAMM|Data~249_combout\,
	datad => \RAMM|Data~353_combout\,
	combout => \RAMM|Data~354_combout\);

-- Location: LCCOMB_X25_Y16_N4
\RAMM|Data~233\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~233_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~233_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datac => \RAMM|Data~233_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~233_combout\);

-- Location: LCCOMB_X25_Y16_N24
\RAMM|Data~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~105_combout\ = (\rtl~5_combout\ & (\Input[9]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~105_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datab => \rtl~5_combout\,
	datad => \RAMM|Data~105_combout\,
	combout => \RAMM|Data~105_combout\);

-- Location: LCCOMB_X25_Y15_N2
\RAMM|Data~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~41_combout\ = (\rtl~8_combout\ & (\Input[9]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~41_combout\,
	combout => \RAMM|Data~41_combout\);

-- Location: LCCOMB_X25_Y16_N2
\RAMM|Data~169\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~169_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~169_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datab => \RAMM|Data~169_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~169_combout\);

-- Location: LCCOMB_X25_Y16_N22
\RAMM|Data~346\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~346_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~169_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~41_combout\,
	datab => \RAMM|Data~169_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~346_combout\);

-- Location: LCCOMB_X24_Y16_N8
\RAMM|Data~347\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~347_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~346_combout\ & (\RAMM|Data~233_combout\)) # (!\RAMM|Data~346_combout\ & ((\RAMM|Data~105_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~346_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~233_combout\,
	datab => \RAMM|Data~105_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~346_combout\,
	combout => \RAMM|Data~347_combout\);

-- Location: LCCOMB_X26_Y16_N26
\RAMM|Data~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~25_combout\ = (\rtl~9_combout\ & (\Input[9]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datac => \RAMM|Data~25_combout\,
	datad => \rtl~9_combout\,
	combout => \RAMM|Data~25_combout\);

-- Location: LCCOMB_X24_Y16_N14
\RAMM|Data~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~89_combout\ = (\rtl~4_combout\ & (\Input[9]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~89_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[9]~input_o\,
	datac => \RAMM|Data~89_combout\,
	datad => \rtl~4_combout\,
	combout => \RAMM|Data~89_combout\);

-- Location: LCCOMB_X24_Y16_N22
\RAMM|Data~348\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~348_combout\ = (\MAR|temp\(2) & (((\RAMM|Data~89_combout\) # (\MAR|temp\(3))))) # (!\MAR|temp\(2) & (\RAMM|Data~25_combout\ & ((!\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~25_combout\,
	datab => \RAMM|Data~89_combout\,
	datac => \MAR|temp\(2),
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~348_combout\);

-- Location: LCCOMB_X23_Y17_N28
\RAMM|Data~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~153_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~153_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \RAMM|Data~153_combout\,
	combout => \RAMM|Data~153_combout\);

-- Location: LCCOMB_X23_Y17_N30
\RAMM|Data~217\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~217_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~217_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \RAMM|Data~217_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~217_combout\);

-- Location: LCCOMB_X24_Y16_N4
\RAMM|Data~349\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~349_combout\ = (\RAMM|Data~348_combout\ & (((\RAMM|Data~217_combout\)) # (!\MAR|temp\(3)))) # (!\RAMM|Data~348_combout\ & (\MAR|temp\(3) & (\RAMM|Data~153_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~348_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~153_combout\,
	datad => \RAMM|Data~217_combout\,
	combout => \RAMM|Data~349_combout\);

-- Location: LCCOMB_X23_Y13_N18
\RAMM|Data~201\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~201_combout\ = (\rtl~14_combout\ & ((\Input[9]~input_o\))) # (!\rtl~14_combout\ & (\RAMM|Data~201_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~201_combout\,
	datac => \Input[9]~input_o\,
	datad => \rtl~14_combout\,
	combout => \RAMM|Data~201_combout\);

-- Location: LCCOMB_X24_Y16_N0
\RAMM|Data~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~73_combout\ = (\rtl~6_combout\ & (\Input[9]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~73_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \rtl~6_combout\,
	datad => \RAMM|Data~73_combout\,
	combout => \RAMM|Data~73_combout\);

-- Location: LCCOMB_X24_Y16_N2
\RAMM|Data~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~137_combout\ = (\rtl~2_combout\ & (\Input[9]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~137_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~2_combout\,
	datac => \Input[9]~input_o\,
	datad => \RAMM|Data~137_combout\,
	combout => \RAMM|Data~137_combout\);

-- Location: LCCOMB_X24_Y16_N24
\RAMM|Data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~9_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[9]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[9]~input_o\,
	datac => \RAMM|Data~9_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~9_combout\);

-- Location: LCCOMB_X24_Y16_N18
\RAMM|Data~350\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~350_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & (\RAMM|Data~137_combout\)) # (!\MAR|temp\(3) & ((\RAMM|Data~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~137_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~9_combout\,
	combout => \RAMM|Data~350_combout\);

-- Location: LCCOMB_X24_Y16_N12
\RAMM|Data~351\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~351_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~350_combout\ & (\RAMM|Data~201_combout\)) # (!\RAMM|Data~350_combout\ & ((\RAMM|Data~73_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~350_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~201_combout\,
	datab => \RAMM|Data~73_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~350_combout\,
	combout => \RAMM|Data~351_combout\);

-- Location: LCCOMB_X24_Y16_N10
\RAMM|Data~352\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~352_combout\ = (\MAR|temp\(0) & ((\MAR|temp\(1)) # ((\RAMM|Data~349_combout\)))) # (!\MAR|temp\(0) & (!\MAR|temp\(1) & ((\RAMM|Data~351_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~349_combout\,
	datad => \RAMM|Data~351_combout\,
	combout => \RAMM|Data~352_combout\);

-- Location: LCCOMB_X24_Y16_N28
\RAMM|Data~355\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~355_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~352_combout\ & (\RAMM|Data~354_combout\)) # (!\RAMM|Data~352_combout\ & ((\RAMM|Data~347_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~352_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~354_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~347_combout\,
	datad => \RAMM|Data~352_combout\,
	combout => \RAMM|Data~355_combout\);

-- Location: LCCOMB_X24_Y16_N6
\RAMM|DO[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(9) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~355_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(9),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~355_combout\,
	combout => \RAMM|DO\(9));

-- Location: FF_X23_Y16_N7
\DR|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(9),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(9));

-- Location: LCCOMB_X22_Y10_N26
\d|D_OUT[9]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[9]~11_combout\ = (\A|DO\(9)) # (((\DR|temp\(9) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(9),
	datab => \CTRLM|ESUM~1_combout\,
	datac => \DR|temp\(9),
	datad => \d|Equal0~5_combout\,
	combout => \d|D_OUT[9]~11_combout\);

-- Location: FF_X22_Y10_N21
\IR|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[9]~11_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(9));

-- Location: LCCOMB_X21_Y10_N8
\IR|Equal6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal6~2_combout\ = (!\IR|temp\(14) & (\IR|temp\(7) & (\IR|temp\(15) & \IR|temp\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(14),
	datab => \IR|temp\(7),
	datac => \IR|temp\(15),
	datad => \IR|temp\(5),
	combout => \IR|Equal6~2_combout\);

-- Location: FF_X22_Y10_N15
\IR|temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[12]~14_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(12));

-- Location: LCCOMB_X21_Y10_N20
\IR|Equal6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal6~3_combout\ = (\IR|temp\(9) & (\IR|Equal6~2_combout\ & (\IR|Equal6~1_combout\ & !\IR|temp\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(9),
	datab => \IR|Equal6~2_combout\,
	datac => \IR|Equal6~1_combout\,
	datad => \IR|temp\(12),
	combout => \IR|Equal6~3_combout\);

-- Location: LCCOMB_X23_Y7_N24
\IR|WideOr1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr1~1_combout\ = (!\IR|Equal6~3_combout\ & (!\IR|Equal5~4_combout\ & \CTRLM|C2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal6~3_combout\,
	datab => \IR|Equal5~4_combout\,
	datac => \CTRLM|C2~2_combout\,
	combout => \IR|WideOr1~1_combout\);

-- Location: LCCOMB_X22_Y7_N12
\A|temp~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~51_combout\ = (\IR|WideOr1~1_combout\ & (((!\IR|WideOr3~2_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(1) & ((\IR|WideOr3~2_combout\) # (\d|D_OUT[1]~2_combout\))) # (!\ACC|temp\(1) & (\IR|WideOr3~2_combout\ & \d|D_OUT[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datab => \IR|WideOr1~1_combout\,
	datac => \IR|WideOr3~2_combout\,
	datad => \d|D_OUT[1]~2_combout\,
	combout => \A|temp~51_combout\);

-- Location: LCCOMB_X22_Y7_N14
\A|temp~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~52_combout\ = (\A|temp~51_combout\ & (((\A|Add0~2_combout\)) # (!\IR|WideOr1~1_combout\))) # (!\A|temp~51_combout\ & (\IR|WideOr1~1_combout\ & ((\A|Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~51_combout\,
	datab => \IR|WideOr1~1_combout\,
	datac => \A|Add0~2_combout\,
	datad => \A|Add1~2_combout\,
	combout => \A|temp~52_combout\);

-- Location: LCCOMB_X22_Y7_N16
\A|temp~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~53_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~52_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~2_combout\)))) # (!\IR|WideOr0~3_combout\ & (((\A|temp~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~2_combout\,
	datab => \IR|WideOr0~3_combout\,
	datac => \A|temp~52_combout\,
	datad => \A|temp~19_combout\,
	combout => \A|temp~53_combout\);

-- Location: LCCOMB_X22_Y7_N22
\A|temp~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~54_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~53_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(1) $ (((\d|D_OUT[1]~2_combout\) # (\A|temp~53_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \d|D_OUT[1]~2_combout\,
	datac => \ACC|temp\(1),
	datad => \A|temp~53_combout\,
	combout => \A|temp~54_combout\);

-- Location: LCCOMB_X22_Y7_N20
\A|temp[1]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[1]~89_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(1) $ (((\d|D_OUT[1]~2_combout\))))) # (!\A|temp~22_combout\ & (((\A|temp~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datab => \A|temp~22_combout\,
	datac => \A|temp~54_combout\,
	datad => \d|D_OUT[1]~2_combout\,
	combout => \A|temp[1]~89_combout\);

-- Location: LCCOMB_X22_Y7_N18
\A|temp[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(1) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp[1]~89_combout\))) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp\(1),
	datac => \A|temp[1]~89_combout\,
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(1));

-- Location: LCCOMB_X22_Y7_N8
\A|temp~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~55_combout\ = (\A|temp~22_combout\ & ((\A|temp\(1)))) # (!\A|temp~22_combout\ & (\A|temp~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datac => \A|temp~54_combout\,
	datad => \A|temp\(1),
	combout => \A|temp~55_combout\);

-- Location: LCCOMB_X23_Y6_N28
\A|DO[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(1) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~55_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(1),
	datac => \A|temp~55_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(1));

-- Location: IOIBUF_X34_Y9_N8
\Input[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(1),
	o => \Input[1]~input_o\);

-- Location: LCCOMB_X24_Y14_N30
\RAMM|Data~241\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~241_combout\ = (\rtl~15_combout\ & (\Input[1]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~241_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datab => \rtl~15_combout\,
	datac => \RAMM|Data~241_combout\,
	combout => \RAMM|Data~241_combout\);

-- Location: LCCOMB_X24_Y14_N16
\RAMM|Data~177\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~177_combout\ = (\rtl~3_combout\ & (\Input[1]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~177_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datab => \rtl~3_combout\,
	datad => \RAMM|Data~177_combout\,
	combout => \RAMM|Data~177_combout\);

-- Location: LCCOMB_X24_Y14_N4
\RAMM|Data~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~49_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~49_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \RAMM|Data~49_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~49_combout\);

-- Location: LCCOMB_X24_Y14_N2
\RAMM|Data~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~113_combout\ = (\rtl~7_combout\ & (\Input[1]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~113_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~113_combout\,
	combout => \RAMM|Data~113_combout\);

-- Location: LCCOMB_X24_Y14_N20
\RAMM|Data~273\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~273_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2))))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & ((\RAMM|Data~113_combout\))) # (!\MAR|temp\(2) & (\RAMM|Data~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~49_combout\,
	datab => \RAMM|Data~113_combout\,
	datac => \MAR|temp\(3),
	datad => \MAR|temp\(2),
	combout => \RAMM|Data~273_combout\);

-- Location: LCCOMB_X24_Y14_N10
\RAMM|Data~274\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~274_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~273_combout\ & (\RAMM|Data~241_combout\)) # (!\RAMM|Data~273_combout\ & ((\RAMM|Data~177_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~273_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~241_combout\,
	datab => \RAMM|Data~177_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~273_combout\,
	combout => \RAMM|Data~274_combout\);

-- Location: LCCOMB_X23_Y12_N8
\RAMM|Data~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~145_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~145_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \RAMM|Data~145_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~145_combout\);

-- Location: LCCOMB_X23_Y12_N2
\RAMM|Data~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~81_combout\ = (\rtl~4_combout\ & (\Input[1]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~81_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~4_combout\,
	datac => \Input[1]~input_o\,
	datad => \RAMM|Data~81_combout\,
	combout => \RAMM|Data~81_combout\);

-- Location: LCCOMB_X23_Y12_N16
\RAMM|Data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~17_combout\ = (\rtl~9_combout\ & (\Input[1]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~9_combout\,
	datad => \RAMM|Data~17_combout\,
	combout => \RAMM|Data~17_combout\);

-- Location: LCCOMB_X23_Y12_N30
\RAMM|Data~268\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~268_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2))))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~81_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~81_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~17_combout\,
	combout => \RAMM|Data~268_combout\);

-- Location: LCCOMB_X22_Y12_N22
\RAMM|Data~209\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~209_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~209_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \RAMM|Data~209_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~209_combout\);

-- Location: LCCOMB_X23_Y12_N4
\RAMM|Data~269\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~269_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~268_combout\ & ((\RAMM|Data~209_combout\))) # (!\RAMM|Data~268_combout\ & (\RAMM|Data~145_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~268_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~145_combout\,
	datac => \RAMM|Data~268_combout\,
	datad => \RAMM|Data~209_combout\,
	combout => \RAMM|Data~269_combout\);

-- Location: LCCOMB_X23_Y12_N6
\RAMM|Data~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~65_combout\ = (\rtl~6_combout\ & (\Input[1]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~65_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~6_combout\,
	datad => \RAMM|Data~65_combout\,
	combout => \RAMM|Data~65_combout\);

-- Location: LCCOMB_X23_Y13_N16
\RAMM|Data~193\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~193_combout\ = (\rtl~14_combout\ & (\Input[1]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~193_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[1]~input_o\,
	datac => \rtl~14_combout\,
	datad => \RAMM|Data~193_combout\,
	combout => \RAMM|Data~193_combout\);

-- Location: LCCOMB_X23_Y12_N20
\RAMM|Data~129\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~129_combout\ = (\rtl~2_combout\ & (\Input[1]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~129_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datab => \RAMM|Data~129_combout\,
	datad => \rtl~2_combout\,
	combout => \RAMM|Data~129_combout\);

-- Location: LCCOMB_X23_Y12_N24
\RAMM|Data~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~1_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datab => \RAMM|Data~1_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~1_combout\);

-- Location: LCCOMB_X23_Y12_N10
\RAMM|Data~270\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~270_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~129_combout\) # ((\MAR|temp\(2))))) # (!\MAR|temp\(3) & (((!\MAR|temp\(2) & \RAMM|Data~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~129_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~1_combout\,
	combout => \RAMM|Data~270_combout\);

-- Location: LCCOMB_X23_Y12_N28
\RAMM|Data~271\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~271_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~270_combout\ & ((\RAMM|Data~193_combout\))) # (!\RAMM|Data~270_combout\ & (\RAMM|Data~65_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~270_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~65_combout\,
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~193_combout\,
	datad => \RAMM|Data~270_combout\,
	combout => \RAMM|Data~271_combout\);

-- Location: LCCOMB_X23_Y12_N22
\RAMM|Data~272\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~272_combout\ = (\MAR|temp\(0) & ((\MAR|temp\(1)) # ((\RAMM|Data~269_combout\)))) # (!\MAR|temp\(0) & (!\MAR|temp\(1) & ((\RAMM|Data~271_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~269_combout\,
	datad => \RAMM|Data~271_combout\,
	combout => \RAMM|Data~272_combout\);

-- Location: LCCOMB_X24_Y14_N0
\RAMM|Data~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~97_combout\ = (\rtl~5_combout\ & (\Input[1]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~97_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~97_combout\,
	combout => \RAMM|Data~97_combout\);

-- Location: LCCOMB_X24_Y14_N14
\RAMM|Data~225\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~225_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~225_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \RAMM|Data~225_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~225_combout\);

-- Location: LCCOMB_X24_Y14_N24
\RAMM|Data~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~33_combout\ = (\rtl~8_combout\ & (\Input[1]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~33_combout\,
	combout => \RAMM|Data~33_combout\);

-- Location: LCCOMB_X24_Y14_N18
\RAMM|Data~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~161_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[1]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~161_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[1]~input_o\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \RAMM|Data~161_combout\,
	combout => \RAMM|Data~161_combout\);

-- Location: LCCOMB_X24_Y14_N28
\RAMM|Data~266\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~266_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~161_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~33_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~161_combout\,
	combout => \RAMM|Data~266_combout\);

-- Location: LCCOMB_X24_Y14_N22
\RAMM|Data~267\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~267_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~266_combout\ & ((\RAMM|Data~225_combout\))) # (!\RAMM|Data~266_combout\ & (\RAMM|Data~97_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~266_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~97_combout\,
	datac => \RAMM|Data~225_combout\,
	datad => \RAMM|Data~266_combout\,
	combout => \RAMM|Data~267_combout\);

-- Location: LCCOMB_X23_Y12_N0
\RAMM|Data~275\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~275_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~272_combout\ & (\RAMM|Data~274_combout\)) # (!\RAMM|Data~272_combout\ & ((\RAMM|Data~267_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~272_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~274_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~272_combout\,
	datad => \RAMM|Data~267_combout\,
	combout => \RAMM|Data~275_combout\);

-- Location: LCCOMB_X23_Y12_N12
\RAMM|DO[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(1) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~275_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(1),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~275_combout\,
	combout => \RAMM|DO\(1));

-- Location: FF_X23_Y12_N21
\DR|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(1),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(1));

-- Location: LCCOMB_X21_Y9_N30
\d|D_OUT[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[1]~2_combout\ = (\A|DO\(1)) # (((\d|Equal0~5_combout\ & \DR|temp\(1))) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \A|DO\(1),
	datac => \CTRLM|ESUM~1_combout\,
	datad => \DR|temp\(1),
	combout => \d|D_OUT[1]~2_combout\);

-- Location: FF_X21_Y9_N31
\ACC|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[1]~2_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(1));

-- Location: LCCOMB_X25_Y7_N4
\A|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~4_combout\ = ((\ACC|temp\(2) $ (\IR|WideOr3~2_combout\ $ (!\A|Add2~3\)))) # (GND)
-- \A|Add2~5\ = CARRY((\ACC|temp\(2) & ((\IR|WideOr3~2_combout\) # (!\A|Add2~3\))) # (!\ACC|temp\(2) & (\IR|WideOr3~2_combout\ & !\A|Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~3\,
	combout => \A|Add2~4_combout\,
	cout => \A|Add2~5\);

-- Location: LCCOMB_X25_Y7_N6
\A|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~6_combout\ = (\IR|WideOr3~2_combout\ & ((\ACC|temp\(3) & (\A|Add2~5\ & VCC)) # (!\ACC|temp\(3) & (!\A|Add2~5\)))) # (!\IR|WideOr3~2_combout\ & ((\ACC|temp\(3) & (!\A|Add2~5\)) # (!\ACC|temp\(3) & ((\A|Add2~5\) # (GND)))))
-- \A|Add2~7\ = CARRY((\IR|WideOr3~2_combout\ & (!\ACC|temp\(3) & !\A|Add2~5\)) # (!\IR|WideOr3~2_combout\ & ((!\A|Add2~5\) # (!\ACC|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(3),
	datad => VCC,
	cin => \A|Add2~5\,
	combout => \A|Add2~6_combout\,
	cout => \A|Add2~7\);

-- Location: LCCOMB_X25_Y7_N8
\A|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~8_combout\ = ((\IR|WideOr3~2_combout\ $ (\ACC|temp\(4) $ (!\A|Add2~7\)))) # (GND)
-- \A|Add2~9\ = CARRY((\IR|WideOr3~2_combout\ & ((\ACC|temp\(4)) # (!\A|Add2~7\))) # (!\IR|WideOr3~2_combout\ & (\ACC|temp\(4) & !\A|Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(4),
	datad => VCC,
	cin => \A|Add2~7\,
	combout => \A|Add2~8_combout\,
	cout => \A|Add2~9\);

-- Location: LCCOMB_X23_Y8_N8
\A|temp~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~67_combout\ = (\IR|WideOr1~1_combout\ & (((!\IR|WideOr3~2_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(4) & ((\d|D_OUT[4]~6_combout\) # (\IR|WideOr3~2_combout\))) # (!\ACC|temp\(4) & (\d|D_OUT[4]~6_combout\ & \IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \ACC|temp\(4),
	datac => \d|D_OUT[4]~6_combout\,
	datad => \IR|WideOr3~2_combout\,
	combout => \A|temp~67_combout\);

-- Location: LCCOMB_X23_Y8_N10
\A|temp~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~68_combout\ = (\A|temp~67_combout\ & (((\A|Add0~8_combout\) # (!\IR|WideOr1~1_combout\)))) # (!\A|temp~67_combout\ & (\A|Add1~8_combout\ & (\IR|WideOr1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~8_combout\,
	datab => \A|temp~67_combout\,
	datac => \IR|WideOr1~1_combout\,
	datad => \A|Add0~8_combout\,
	combout => \A|temp~68_combout\);

-- Location: LCCOMB_X23_Y8_N20
\A|temp~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~69_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~68_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~8_combout\)))) # (!\IR|WideOr0~3_combout\ & (\A|temp~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \A|temp~19_combout\,
	datac => \A|Add2~8_combout\,
	datad => \A|temp~68_combout\,
	combout => \A|temp~69_combout\);

-- Location: LCCOMB_X23_Y8_N2
\A|temp~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~70_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~69_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(4) $ (((\d|D_OUT[4]~6_combout\) # (\A|temp~69_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \ACC|temp\(4),
	datac => \d|D_OUT[4]~6_combout\,
	datad => \A|temp~69_combout\,
	combout => \A|temp~70_combout\);

-- Location: LCCOMB_X23_Y8_N4
\A|temp[4]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[4]~91_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[4]~6_combout\ $ (((\ACC|temp\(4)))))) # (!\A|temp~22_combout\ & (((\A|temp~70_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datab => \d|D_OUT[4]~6_combout\,
	datac => \A|temp~70_combout\,
	datad => \ACC|temp\(4),
	combout => \A|temp[4]~91_combout\);

-- Location: LCCOMB_X21_Y8_N20
\A|temp[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(4) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[4]~91_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[4]~91_combout\,
	datac => \A|temp[0]~85clkctrl_outclk\,
	datad => \A|temp\(4),
	combout => \A|temp\(4));

-- Location: LCCOMB_X24_Y8_N4
\A|temp~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~71_combout\ = (\A|temp~22_combout\ & (\A|temp\(4))) # (!\A|temp~22_combout\ & ((\A|temp~70_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp\(4),
	datad => \A|temp~70_combout\,
	combout => \A|temp~71_combout\);

-- Location: LCCOMB_X24_Y8_N10
\A|DO[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(4) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~71_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(4),
	datac => \A|temp~71_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(4));

-- Location: IOIBUF_X28_Y24_N22
\Input[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(4),
	o => \Input[4]~input_o\);

-- Location: LCCOMB_X26_Y17_N24
\RAMM|Data~212\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~212_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~212_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datac => \RAMM|Data~212_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~212_combout\);

-- Location: LCCOMB_X25_Y14_N16
\RAMM|Data~244\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~244_combout\ = (\rtl~15_combout\ & (\Input[4]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~244_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datab => \rtl~15_combout\,
	datad => \RAMM|Data~244_combout\,
	combout => \RAMM|Data~244_combout\);

-- Location: LCCOMB_X23_Y13_N20
\RAMM|Data~196\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~196_combout\ = (\rtl~14_combout\ & (\Input[4]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~196_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datab => \Input[4]~input_o\,
	datad => \RAMM|Data~196_combout\,
	combout => \RAMM|Data~196_combout\);

-- Location: LCCOMB_X26_Y13_N14
\RAMM|Data~228\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~228_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~228_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[4]~input_o\,
	datac => \RAMM|Data~228_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~228_combout\);

-- Location: LCCOMB_X26_Y17_N14
\RAMM|Data~303\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~303_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~228_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~196_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~196_combout\,
	datab => \RAMM|Data~228_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~303_combout\);

-- Location: LCCOMB_X26_Y17_N8
\RAMM|Data~304\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~304_combout\ = (\RAMM|Data~303_combout\ & (((\RAMM|Data~244_combout\) # (!\MAR|temp\(0))))) # (!\RAMM|Data~303_combout\ & (\RAMM|Data~212_combout\ & ((\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~212_combout\,
	datab => \RAMM|Data~244_combout\,
	datac => \RAMM|Data~303_combout\,
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~304_combout\);

-- Location: LCCOMB_X25_Y14_N30
\RAMM|Data~180\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~180_combout\ = (\rtl~3_combout\ & (\Input[4]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~180_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datac => \RAMM|Data~180_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~180_combout\);

-- Location: LCCOMB_X26_Y13_N22
\RAMM|Data~164\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~164_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~164_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[4]~input_o\,
	datac => \RAMM|Data~164_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~164_combout\);

-- Location: LCCOMB_X25_Y15_N16
\RAMM|Data~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~132_combout\ = (\rtl~2_combout\ & (\Input[4]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~132_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~2_combout\,
	datab => \Input[4]~input_o\,
	datad => \RAMM|Data~132_combout\,
	combout => \RAMM|Data~132_combout\);

-- Location: LCCOMB_X26_Y13_N24
\RAMM|Data~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~148_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~148_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[4]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \RAMM|Data~148_combout\,
	combout => \RAMM|Data~148_combout\);

-- Location: LCCOMB_X26_Y17_N12
\RAMM|Data~296\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~296_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1)) # (\RAMM|Data~148_combout\)))) # (!\MAR|temp\(0) & (\RAMM|Data~132_combout\ & (!\MAR|temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~132_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~148_combout\,
	combout => \RAMM|Data~296_combout\);

-- Location: LCCOMB_X26_Y17_N26
\RAMM|Data~297\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~297_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~296_combout\ & (\RAMM|Data~180_combout\)) # (!\RAMM|Data~296_combout\ & ((\RAMM|Data~164_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~296_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~180_combout\,
	datab => \RAMM|Data~164_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~296_combout\,
	combout => \RAMM|Data~297_combout\);

-- Location: LCCOMB_X23_Y16_N8
\RAMM|Data~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~84_combout\ = (\rtl~4_combout\ & (\Input[4]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~84_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datab => \RAMM|Data~84_combout\,
	datad => \rtl~4_combout\,
	combout => \RAMM|Data~84_combout\);

-- Location: LCCOMB_X23_Y16_N26
\RAMM|Data~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~116_combout\ = (\rtl~7_combout\ & ((\Input[4]~input_o\))) # (!\rtl~7_combout\ & (\RAMM|Data~116_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~116_combout\,
	datab => \Input[4]~input_o\,
	datac => \rtl~7_combout\,
	combout => \RAMM|Data~116_combout\);

-- Location: LCCOMB_X23_Y16_N12
\RAMM|Data~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~100_combout\ = (\rtl~5_combout\ & (\Input[4]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~100_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~100_combout\,
	combout => \RAMM|Data~100_combout\);

-- Location: LCCOMB_X23_Y16_N28
\RAMM|Data~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~68_combout\ = (\rtl~6_combout\ & (\Input[4]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~68_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~6_combout\,
	datac => \Input[4]~input_o\,
	datad => \RAMM|Data~68_combout\,
	combout => \RAMM|Data~68_combout\);

-- Location: LCCOMB_X23_Y16_N18
\RAMM|Data~298\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~298_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~100_combout\) # ((\MAR|temp\(0))))) # (!\MAR|temp\(1) & (((\RAMM|Data~68_combout\ & !\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~100_combout\,
	datab => \RAMM|Data~68_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~298_combout\);

-- Location: LCCOMB_X23_Y16_N0
\RAMM|Data~299\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~299_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~298_combout\ & ((\RAMM|Data~116_combout\))) # (!\RAMM|Data~298_combout\ & (\RAMM|Data~84_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~298_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~84_combout\,
	datac => \RAMM|Data~116_combout\,
	datad => \RAMM|Data~298_combout\,
	combout => \RAMM|Data~299_combout\);

-- Location: LCCOMB_X26_Y17_N10
\RAMM|Data~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~36_combout\ = (\rtl~8_combout\ & (\Input[4]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datab => \Input[4]~input_o\,
	datad => \RAMM|Data~36_combout\,
	combout => \RAMM|Data~36_combout\);

-- Location: LCCOMB_X28_Y17_N28
\RAMM|Data~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~52_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[4]~input_o\,
	datab => \RAMM|Data~52_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~52_combout\);

-- Location: LCCOMB_X26_Y17_N28
\RAMM|Data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~20_combout\ = (\rtl~9_combout\ & (\Input[4]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~9_combout\,
	datac => \Input[4]~input_o\,
	datad => \RAMM|Data~20_combout\,
	combout => \RAMM|Data~20_combout\);

-- Location: LCCOMB_X26_Y17_N18
\RAMM|Data~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~4_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[4]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[4]~input_o\,
	datac => \RAMM|Data~4_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~4_combout\);

-- Location: LCCOMB_X26_Y17_N0
\RAMM|Data~300\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~300_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~20_combout\) # ((\MAR|temp\(1))))) # (!\MAR|temp\(0) & (((!\MAR|temp\(1) & \RAMM|Data~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~20_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~4_combout\,
	combout => \RAMM|Data~300_combout\);

-- Location: LCCOMB_X26_Y17_N2
\RAMM|Data~301\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~301_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~300_combout\ & ((\RAMM|Data~52_combout\))) # (!\RAMM|Data~300_combout\ & (\RAMM|Data~36_combout\)))) # (!\MAR|temp\(1) & (((\RAMM|Data~300_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~36_combout\,
	datab => \RAMM|Data~52_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~300_combout\,
	combout => \RAMM|Data~301_combout\);

-- Location: LCCOMB_X26_Y17_N16
\RAMM|Data~302\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~302_combout\ = (\MAR|temp\(3) & (\MAR|temp\(2))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~299_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~301_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~299_combout\,
	datad => \RAMM|Data~301_combout\,
	combout => \RAMM|Data~302_combout\);

-- Location: LCCOMB_X26_Y17_N6
\RAMM|Data~305\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~305_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~302_combout\ & (\RAMM|Data~304_combout\)) # (!\RAMM|Data~302_combout\ & ((\RAMM|Data~297_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~302_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~304_combout\,
	datac => \RAMM|Data~297_combout\,
	datad => \RAMM|Data~302_combout\,
	combout => \RAMM|Data~305_combout\);

-- Location: LCCOMB_X26_Y17_N4
\RAMM|DO[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(4) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~305_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(4),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~305_combout\,
	combout => \RAMM|DO\(4));

-- Location: FF_X25_Y17_N19
\DR|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(4),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(4));

-- Location: LCCOMB_X21_Y9_N26
\d|D_OUT[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[4]~6_combout\ = ((\A|DO\(4)) # ((\d|Equal0~5_combout\ & \DR|temp\(4)))) # (!\CTRLM|ESUM~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \CTRLM|ESUM~1_combout\,
	datac => \A|DO\(4),
	datad => \DR|temp\(4),
	combout => \d|D_OUT[4]~6_combout\);

-- Location: FF_X21_Y9_N27
\ACC|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[4]~6_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(4));

-- Location: LCCOMB_X25_Y7_N10
\A|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~10_combout\ = (\IR|WideOr3~2_combout\ & ((\ACC|temp\(5) & (\A|Add2~9\ & VCC)) # (!\ACC|temp\(5) & (!\A|Add2~9\)))) # (!\IR|WideOr3~2_combout\ & ((\ACC|temp\(5) & (!\A|Add2~9\)) # (!\ACC|temp\(5) & ((\A|Add2~9\) # (GND)))))
-- \A|Add2~11\ = CARRY((\IR|WideOr3~2_combout\ & (!\ACC|temp\(5) & !\A|Add2~9\)) # (!\IR|WideOr3~2_combout\ & ((!\A|Add2~9\) # (!\ACC|temp\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|Add2~9\,
	combout => \A|Add2~10_combout\,
	cout => \A|Add2~11\);

-- Location: LCCOMB_X25_Y7_N12
\A|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~12_combout\ = ((\IR|WideOr3~2_combout\ $ (\ACC|temp\(6) $ (!\A|Add2~11\)))) # (GND)
-- \A|Add2~13\ = CARRY((\IR|WideOr3~2_combout\ & ((\ACC|temp\(6)) # (!\A|Add2~11\))) # (!\IR|WideOr3~2_combout\ & (\ACC|temp\(6) & !\A|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(6),
	datad => VCC,
	cin => \A|Add2~11\,
	combout => \A|Add2~12_combout\,
	cout => \A|Add2~13\);

-- Location: LCCOMB_X25_Y7_N14
\A|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~14_combout\ = (\ACC|temp\(7) & ((\IR|WideOr3~2_combout\ & (\A|Add2~13\ & VCC)) # (!\IR|WideOr3~2_combout\ & (!\A|Add2~13\)))) # (!\ACC|temp\(7) & ((\IR|WideOr3~2_combout\ & (!\A|Add2~13\)) # (!\IR|WideOr3~2_combout\ & ((\A|Add2~13\) # (GND)))))
-- \A|Add2~15\ = CARRY((\ACC|temp\(7) & (!\IR|WideOr3~2_combout\ & !\A|Add2~13\)) # (!\ACC|temp\(7) & ((!\A|Add2~13\) # (!\IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \IR|WideOr3~2_combout\,
	datad => VCC,
	cin => \A|Add2~13\,
	combout => \A|Add2~14_combout\,
	cout => \A|Add2~15\);

-- Location: LCCOMB_X25_Y8_N0
\A|temp~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~17_combout\ = (\IR|WideOr1~1_combout\ & (!\IR|WideOr3~2_combout\)) # (!\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & ((\ACC|temp\(8)) # (\d|D_OUT[8]~10_combout\))) # (!\IR|WideOr3~2_combout\ & (\ACC|temp\(8) & \d|D_OUT[8]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \IR|WideOr3~2_combout\,
	datac => \ACC|temp\(8),
	datad => \d|D_OUT[8]~10_combout\,
	combout => \A|temp~17_combout\);

-- Location: LCCOMB_X25_Y8_N18
\A|temp~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~18_combout\ = (\IR|WideOr1~1_combout\ & ((\A|temp~17_combout\ & (\A|Add0~16_combout\)) # (!\A|temp~17_combout\ & ((\A|Add1~16_combout\))))) # (!\IR|WideOr1~1_combout\ & (\A|temp~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \A|temp~17_combout\,
	datac => \A|Add0~16_combout\,
	datad => \A|Add1~16_combout\,
	combout => \A|temp~18_combout\);

-- Location: LCCOMB_X25_Y8_N16
\A|temp~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~20_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~18_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~16_combout\)))) # (!\IR|WideOr0~3_combout\ & (\A|temp~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \A|temp~19_combout\,
	datac => \A|Add2~16_combout\,
	datad => \A|temp~18_combout\,
	combout => \A|temp~20_combout\);

-- Location: LCCOMB_X25_Y8_N22
\A|temp~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~21_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~20_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(8) $ (((\d|D_OUT[8]~10_combout\) # (\A|temp~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(8),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[8]~10_combout\,
	datad => \A|temp~20_combout\,
	combout => \A|temp~21_combout\);

-- Location: LCCOMB_X25_Y8_N10
\A|temp[8]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[8]~83_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[8]~10_combout\ $ (((\ACC|temp\(8)))))) # (!\A|temp~22_combout\ & (((\A|temp~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[8]~10_combout\,
	datab => \A|temp~21_combout\,
	datac => \A|temp~22_combout\,
	datad => \ACC|temp\(8),
	combout => \A|temp[8]~83_combout\);

-- Location: LCCOMB_X25_Y8_N26
\A|temp[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(8) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[8]~83_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[8]~83_combout\,
	datac => \A|temp\(8),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(8));

-- Location: LCCOMB_X25_Y8_N30
\A|temp~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~23_combout\ = (\A|temp~22_combout\ & (\A|temp\(8))) # (!\A|temp~22_combout\ & ((\A|temp~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(8),
	datab => \A|temp~22_combout\,
	datac => \A|temp~21_combout\,
	combout => \A|temp~23_combout\);

-- Location: LCCOMB_X23_Y8_N22
\A|DO[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(8) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~23_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~23_combout\,
	datac => \A|DO\(8),
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(8));

-- Location: IOIBUF_X23_Y24_N8
\Input[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(8),
	o => \Input[8]~input_o\);

-- Location: LCCOMB_X25_Y14_N20
\RAMM|Data~248\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~248_combout\ = (\rtl~15_combout\ & (\Input[8]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~248_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~15_combout\,
	datad => \RAMM|Data~248_combout\,
	combout => \RAMM|Data~248_combout\);

-- Location: LCCOMB_X22_Y13_N8
\RAMM|Data~216\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~216_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~216_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \RAMM|Data~216_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~216_combout\);

-- Location: LCCOMB_X22_Y13_N10
\RAMM|Data~232\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~232_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~232_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~232_combout\,
	combout => \RAMM|Data~232_combout\);

-- Location: LCCOMB_X23_Y13_N28
\RAMM|Data~200\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~200_combout\ = (\rtl~14_combout\ & (\Input[8]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~200_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datab => \Input[8]~input_o\,
	datad => \RAMM|Data~200_combout\,
	combout => \RAMM|Data~200_combout\);

-- Location: LCCOMB_X22_Y13_N20
\RAMM|Data~343\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~343_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~232_combout\) # ((\MAR|temp\(0))))) # (!\MAR|temp\(1) & (((\RAMM|Data~200_combout\ & !\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~232_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~200_combout\,
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~343_combout\);

-- Location: LCCOMB_X22_Y13_N18
\RAMM|Data~344\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~344_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~343_combout\ & (\RAMM|Data~248_combout\)) # (!\RAMM|Data~343_combout\ & ((\RAMM|Data~216_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~343_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~248_combout\,
	datac => \RAMM|Data~216_combout\,
	datad => \RAMM|Data~343_combout\,
	combout => \RAMM|Data~344_combout\);

-- Location: LCCOMB_X23_Y18_N16
\RAMM|Data~184\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~184_combout\ = (\rtl~3_combout\ & (\Input[8]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~184_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~3_combout\,
	datac => \Input[8]~input_o\,
	datad => \RAMM|Data~184_combout\,
	combout => \RAMM|Data~184_combout\);

-- Location: LCCOMB_X23_Y18_N14
\RAMM|Data~168\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~168_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~168_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \RAMM|Data~168_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~168_combout\);

-- Location: LCCOMB_X23_Y18_N26
\RAMM|Data~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~136_combout\ = (\rtl~2_combout\ & (\Input[8]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~136_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \RAMM|Data~136_combout\,
	datad => \rtl~2_combout\,
	combout => \RAMM|Data~136_combout\);

-- Location: LCCOMB_X23_Y18_N24
\RAMM|Data~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~152_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~152_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datab => \RAMM|Data~152_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~152_combout\);

-- Location: LCCOMB_X23_Y18_N6
\RAMM|Data~336\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~336_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & ((\RAMM|Data~152_combout\))) # (!\MAR|temp\(0) & (\RAMM|Data~136_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~136_combout\,
	datab => \MAR|temp\(1),
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~152_combout\,
	combout => \RAMM|Data~336_combout\);

-- Location: LCCOMB_X23_Y18_N20
\RAMM|Data~337\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~337_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~336_combout\ & (\RAMM|Data~184_combout\)) # (!\RAMM|Data~336_combout\ & ((\RAMM|Data~168_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~336_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~184_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~168_combout\,
	datad => \RAMM|Data~336_combout\,
	combout => \RAMM|Data~337_combout\);

-- Location: LCCOMB_X25_Y16_N18
\RAMM|Data~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~88_combout\ = (\rtl~4_combout\ & (\Input[8]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~88_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~88_combout\,
	combout => \RAMM|Data~88_combout\);

-- Location: LCCOMB_X25_Y16_N20
\RAMM|Data~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~120_combout\ = (\rtl~7_combout\ & (\Input[8]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~120_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~7_combout\,
	datac => \Input[8]~input_o\,
	datad => \RAMM|Data~120_combout\,
	combout => \RAMM|Data~120_combout\);

-- Location: LCCOMB_X25_Y16_N30
\RAMM|Data~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~72_combout\ = (\rtl~6_combout\ & (\Input[8]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~72_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \RAMM|Data~72_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~72_combout\);

-- Location: LCCOMB_X25_Y16_N8
\RAMM|Data~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~104_combout\ = (\rtl~5_combout\ & (\Input[8]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~104_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datab => \RAMM|Data~104_combout\,
	datad => \rtl~5_combout\,
	combout => \RAMM|Data~104_combout\);

-- Location: LCCOMB_X25_Y16_N10
\RAMM|Data~338\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~338_combout\ = (\MAR|temp\(1) & (((\RAMM|Data~104_combout\) # (\MAR|temp\(0))))) # (!\MAR|temp\(1) & (\RAMM|Data~72_combout\ & ((!\MAR|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~72_combout\,
	datab => \RAMM|Data~104_combout\,
	datac => \MAR|temp\(1),
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~338_combout\);

-- Location: LCCOMB_X25_Y16_N16
\RAMM|Data~339\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~339_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~338_combout\ & ((\RAMM|Data~120_combout\))) # (!\RAMM|Data~338_combout\ & (\RAMM|Data~88_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~338_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~88_combout\,
	datac => \RAMM|Data~120_combout\,
	datad => \RAMM|Data~338_combout\,
	combout => \RAMM|Data~339_combout\);

-- Location: LCCOMB_X25_Y15_N24
\RAMM|Data~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~40_combout\ = (\rtl~8_combout\ & (\Input[8]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~40_combout\,
	combout => \RAMM|Data~40_combout\);

-- Location: LCCOMB_X22_Y16_N14
\RAMM|Data~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~56_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[8]~input_o\,
	datac => \RAMM|Data~56_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~56_combout\);

-- Location: LCCOMB_X25_Y16_N26
\RAMM|Data~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~24_combout\ = (\rtl~9_combout\ & (\Input[8]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~9_combout\,
	datad => \RAMM|Data~24_combout\,
	combout => \RAMM|Data~24_combout\);

-- Location: LCCOMB_X22_Y16_N24
\RAMM|Data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~8_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[8]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[8]~input_o\,
	datac => \rtl~10clkctrl_outclk\,
	datad => \RAMM|Data~8_combout\,
	combout => \RAMM|Data~8_combout\);

-- Location: LCCOMB_X22_Y16_N10
\RAMM|Data~340\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~340_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & (\RAMM|Data~24_combout\)) # (!\MAR|temp\(0) & ((\RAMM|Data~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~24_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~8_combout\,
	combout => \RAMM|Data~340_combout\);

-- Location: LCCOMB_X22_Y16_N28
\RAMM|Data~341\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~341_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~340_combout\ & ((\RAMM|Data~56_combout\))) # (!\RAMM|Data~340_combout\ & (\RAMM|Data~40_combout\)))) # (!\MAR|temp\(1) & (((\RAMM|Data~340_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~40_combout\,
	datac => \RAMM|Data~56_combout\,
	datad => \RAMM|Data~340_combout\,
	combout => \RAMM|Data~341_combout\);

-- Location: LCCOMB_X22_Y16_N6
\RAMM|Data~342\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~342_combout\ = (\MAR|temp\(3) & (\MAR|temp\(2))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~339_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~341_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~339_combout\,
	datad => \RAMM|Data~341_combout\,
	combout => \RAMM|Data~342_combout\);

-- Location: LCCOMB_X22_Y16_N12
\RAMM|Data~345\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~345_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~342_combout\ & (\RAMM|Data~344_combout\)) # (!\RAMM|Data~342_combout\ & ((\RAMM|Data~337_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~342_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \RAMM|Data~344_combout\,
	datac => \RAMM|Data~337_combout\,
	datad => \RAMM|Data~342_combout\,
	combout => \RAMM|Data~345_combout\);

-- Location: LCCOMB_X22_Y16_N26
\RAMM|DO[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(8) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~345_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(8),
	datab => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~345_combout\,
	combout => \RAMM|DO\(8));

-- Location: FF_X22_Y16_N5
\DR|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(8),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(8));

-- Location: LCCOMB_X22_Y10_N30
\d|D_OUT[8]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[8]~10_combout\ = (\A|DO\(8)) # (((\DR|temp\(8) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(8),
	datab => \CTRLM|ESUM~1_combout\,
	datac => \DR|temp\(8),
	datad => \d|Equal0~5_combout\,
	combout => \d|D_OUT[8]~10_combout\);

-- Location: FF_X22_Y10_N17
\IR|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[8]~10_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(8));

-- Location: FF_X21_Y9_N15
\IR|temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[13]~15_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(13));

-- Location: LCCOMB_X21_Y10_N2
\IR|Equal3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal3~3_combout\ = (\IR|temp\(6) & (!\IR|temp\(8) & (\IR|temp\(7) & \IR|temp\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(6),
	datab => \IR|temp\(8),
	datac => \IR|temp\(7),
	datad => \IR|temp\(13),
	combout => \IR|Equal3~3_combout\);

-- Location: LCCOMB_X21_Y10_N4
\IR|Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal3~1_combout\ = (\IR|temp\(9) & (!\IR|temp\(4) & (\IR|temp\(0) & !\IR|temp\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(9),
	datab => \IR|temp\(4),
	datac => \IR|temp\(0),
	datad => \IR|temp\(12),
	combout => \IR|Equal3~1_combout\);

-- Location: FF_X21_Y9_N11
\IR|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[11]~13_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(11));

-- Location: LCCOMB_X22_Y10_N6
\IR|Equal3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal3~2_combout\ = (!\IR|temp\(15) & (!\IR|temp\(14) & (!\IR|temp\(3) & \IR|temp\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(15),
	datab => \IR|temp\(14),
	datac => \IR|temp\(3),
	datad => \IR|temp\(11),
	combout => \IR|Equal3~2_combout\);

-- Location: LCCOMB_X21_Y10_N16
\IR|Equal3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal3~4_combout\ = (\IR|Equal3~3_combout\ & (\IR|temp\(10) & (\IR|Equal3~1_combout\ & \IR|Equal3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal3~3_combout\,
	datab => \IR|temp\(10),
	datac => \IR|Equal3~1_combout\,
	datad => \IR|Equal3~2_combout\,
	combout => \IR|Equal3~4_combout\);

-- Location: LCCOMB_X22_Y10_N18
\IR|WideOr3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr3~0_combout\ = (!\IR|Equal1~1_combout\ & ((!\IR|Equal3~0_combout\) # (!\IR|Equal3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal1~1_combout\,
	datac => \IR|Equal3~4_combout\,
	datad => \IR|Equal3~0_combout\,
	combout => \IR|WideOr3~0_combout\);

-- Location: LCCOMB_X23_Y7_N10
\IR|WideOr3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr3~2_combout\ = (\IR|WideOr3~0_combout\ & (!\IR|Equal5~4_combout\ & \IR|WideNor0~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~0_combout\,
	datac => \IR|Equal5~4_combout\,
	datad => \IR|WideNor0~combout\,
	combout => \IR|WideOr3~2_combout\);

-- Location: LCCOMB_X23_Y10_N26
\A|temp~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~59_combout\ = (\IR|WideOr3~2_combout\ & (!\IR|WideOr1~1_combout\ & ((\d|D_OUT[2]~4_combout\) # (\ACC|temp\(2))))) # (!\IR|WideOr3~2_combout\ & ((\IR|WideOr1~1_combout\) # ((\d|D_OUT[2]~4_combout\ & \ACC|temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[2]~4_combout\,
	datab => \ACC|temp\(2),
	datac => \IR|WideOr3~2_combout\,
	datad => \IR|WideOr1~1_combout\,
	combout => \A|temp~59_combout\);

-- Location: LCCOMB_X23_Y10_N28
\A|temp~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~60_combout\ = (\A|temp~59_combout\ & (((\A|Add0~4_combout\)) # (!\IR|WideOr1~1_combout\))) # (!\A|temp~59_combout\ & (\IR|WideOr1~1_combout\ & ((\A|Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~59_combout\,
	datab => \IR|WideOr1~1_combout\,
	datac => \A|Add0~4_combout\,
	datad => \A|Add1~4_combout\,
	combout => \A|temp~60_combout\);

-- Location: LCCOMB_X23_Y10_N10
\A|temp~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~61_combout\ = (\A|temp~19_combout\ & (((\A|temp~60_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~4_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~19_combout\,
	datab => \A|Add2~4_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~60_combout\,
	combout => \A|temp~61_combout\);

-- Location: LCCOMB_X23_Y10_N24
\A|temp~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~62_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~61_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(2) $ (((\d|D_OUT[2]~4_combout\) # (\A|temp~61_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[2]~4_combout\,
	datad => \A|temp~61_combout\,
	combout => \A|temp~62_combout\);

-- Location: LCCOMB_X23_Y10_N20
\A|temp[2]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[2]~90_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[2]~4_combout\ $ ((\ACC|temp\(2))))) # (!\A|temp~22_combout\ & (((\A|temp~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[2]~4_combout\,
	datab => \ACC|temp\(2),
	datac => \A|temp~62_combout\,
	datad => \A|temp~22_combout\,
	combout => \A|temp[2]~90_combout\);

-- Location: LCCOMB_X23_Y10_N30
\A|temp[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(2) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp[2]~90_combout\))) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(2),
	datac => \A|temp[2]~90_combout\,
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(2));

-- Location: LCCOMB_X23_Y10_N6
\A|temp~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~63_combout\ = (\A|temp~22_combout\ & (\A|temp\(2))) # (!\A|temp~22_combout\ & ((\A|temp~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp\(2),
	datad => \A|temp~62_combout\,
	combout => \A|temp~63_combout\);

-- Location: LCCOMB_X23_Y9_N12
\A|DO[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(2) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~63_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(2),
	datab => \A|temp~63_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(2));

-- Location: IOIBUF_X13_Y24_N22
\Input[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(2),
	o => \Input[2]~input_o\);

-- Location: LCCOMB_X24_Y17_N12
\RAMM|Data~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~146_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & ((\Input[2]~input_o\))) # (!GLOBAL(\rtl~1clkctrl_outclk\) & (\RAMM|Data~146_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~146_combout\,
	datab => \Input[2]~input_o\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~146_combout\);

-- Location: LCCOMB_X25_Y17_N22
\RAMM|Data~178\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~178_combout\ = (\rtl~3_combout\ & (\Input[2]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~178_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~178_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~178_combout\);

-- Location: LCCOMB_X25_Y17_N28
\RAMM|Data~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~130_combout\ = (\rtl~2_combout\ & (\Input[2]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~130_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \rtl~2_combout\,
	datad => \RAMM|Data~130_combout\,
	combout => \RAMM|Data~130_combout\);

-- Location: LCCOMB_X25_Y16_N0
\RAMM|Data~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~162_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[2]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~162_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[2]~input_o\,
	datab => \RAMM|Data~162_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~162_combout\);

-- Location: LCCOMB_X25_Y17_N2
\RAMM|Data~278\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~278_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0)) # (\RAMM|Data~162_combout\)))) # (!\MAR|temp\(1) & (\RAMM|Data~130_combout\ & (!\MAR|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~130_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~162_combout\,
	combout => \RAMM|Data~278_combout\);

-- Location: LCCOMB_X25_Y17_N24
\RAMM|Data~279\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~279_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~278_combout\ & ((\RAMM|Data~178_combout\))) # (!\RAMM|Data~278_combout\ & (\RAMM|Data~146_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~278_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~146_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~178_combout\,
	datad => \RAMM|Data~278_combout\,
	combout => \RAMM|Data~279_combout\);

-- Location: LCCOMB_X25_Y17_N26
\RAMM|Data~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~50_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[2]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~50_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~50_combout\);

-- Location: LCCOMB_X25_Y17_N18
\RAMM|Data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~18_combout\ = (\rtl~9_combout\ & (\Input[2]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[2]~input_o\,
	datab => \rtl~9_combout\,
	datad => \RAMM|Data~18_combout\,
	combout => \RAMM|Data~18_combout\);

-- Location: LCCOMB_X25_Y17_N0
\RAMM|Data~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~34_combout\ = (\rtl~8_combout\ & (\Input[2]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datab => \Input[2]~input_o\,
	datad => \RAMM|Data~34_combout\,
	combout => \RAMM|Data~34_combout\);

-- Location: LCCOMB_X25_Y17_N4
\RAMM|Data~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~2_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[2]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~2_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~2_combout\);

-- Location: LCCOMB_X25_Y17_N6
\RAMM|Data~280\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~280_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1))))) # (!\MAR|temp\(0) & ((\MAR|temp\(1) & (\RAMM|Data~34_combout\)) # (!\MAR|temp\(1) & ((\RAMM|Data~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~34_combout\,
	datac => \RAMM|Data~2_combout\,
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~280_combout\);

-- Location: LCCOMB_X25_Y17_N12
\RAMM|Data~281\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~281_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~280_combout\ & (\RAMM|Data~50_combout\)) # (!\RAMM|Data~280_combout\ & ((\RAMM|Data~18_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~280_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~50_combout\,
	datab => \RAMM|Data~18_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~280_combout\,
	combout => \RAMM|Data~281_combout\);

-- Location: LCCOMB_X25_Y17_N14
\RAMM|Data~282\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~282_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & (\RAMM|Data~279_combout\)) # (!\MAR|temp\(3) & ((\RAMM|Data~281_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~279_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~281_combout\,
	combout => \RAMM|Data~282_combout\);

-- Location: LCCOMB_X23_Y15_N12
\RAMM|Data~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~98_combout\ = (\rtl~5_combout\ & ((\Input[2]~input_o\))) # (!\rtl~5_combout\ & (\RAMM|Data~98_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~98_combout\,
	datac => \Input[2]~input_o\,
	datad => \rtl~5_combout\,
	combout => \RAMM|Data~98_combout\);

-- Location: LCCOMB_X25_Y17_N30
\RAMM|Data~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~114_combout\ = (\rtl~7_combout\ & (\Input[2]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~114_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~7_combout\,
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~114_combout\,
	combout => \RAMM|Data~114_combout\);

-- Location: LCCOMB_X21_Y13_N6
\RAMM|Data~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~82_combout\ = (\rtl~4_combout\ & (\Input[2]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~82_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[2]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~82_combout\,
	combout => \RAMM|Data~82_combout\);

-- Location: LCCOMB_X21_Y13_N28
\RAMM|Data~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~66_combout\ = (\rtl~6_combout\ & (\Input[2]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~66_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[2]~input_o\,
	datab => \RAMM|Data~66_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~66_combout\);

-- Location: LCCOMB_X21_Y13_N24
\RAMM|Data~276\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~276_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~82_combout\) # ((\MAR|temp\(1))))) # (!\MAR|temp\(0) & (((\RAMM|Data~66_combout\ & !\MAR|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~82_combout\,
	datab => \RAMM|Data~66_combout\,
	datac => \MAR|temp\(0),
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~276_combout\);

-- Location: LCCOMB_X25_Y17_N8
\RAMM|Data~277\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~277_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~276_combout\ & ((\RAMM|Data~114_combout\))) # (!\RAMM|Data~276_combout\ & (\RAMM|Data~98_combout\)))) # (!\MAR|temp\(1) & (((\RAMM|Data~276_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~98_combout\,
	datac => \RAMM|Data~114_combout\,
	datad => \RAMM|Data~276_combout\,
	combout => \RAMM|Data~277_combout\);

-- Location: LCCOMB_X25_Y14_N2
\RAMM|Data~242\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~242_combout\ = (\rtl~15_combout\ & (\Input[2]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~242_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~15_combout\,
	datac => \Input[2]~input_o\,
	datad => \RAMM|Data~242_combout\,
	combout => \RAMM|Data~242_combout\);

-- Location: LCCOMB_X24_Y13_N4
\RAMM|Data~226\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~226_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[2]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~226_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~226_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~226_combout\);

-- Location: LCCOMB_X23_Y13_N26
\RAMM|Data~194\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~194_combout\ = (\rtl~14_combout\ & (\Input[2]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~194_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[2]~input_o\,
	datac => \RAMM|Data~194_combout\,
	datad => \rtl~14_combout\,
	combout => \RAMM|Data~194_combout\);

-- Location: LCCOMB_X23_Y15_N10
\RAMM|Data~210\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~210_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[2]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~210_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[2]~input_o\,
	datac => \RAMM|Data~210_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~210_combout\);

-- Location: LCCOMB_X23_Y15_N28
\RAMM|Data~283\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~283_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & ((\RAMM|Data~210_combout\))) # (!\MAR|temp\(0) & (\RAMM|Data~194_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~194_combout\,
	datab => \MAR|temp\(1),
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~210_combout\,
	combout => \RAMM|Data~283_combout\);

-- Location: LCCOMB_X25_Y17_N16
\RAMM|Data~284\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~284_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~283_combout\ & (\RAMM|Data~242_combout\)) # (!\RAMM|Data~283_combout\ & ((\RAMM|Data~226_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~283_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~242_combout\,
	datac => \RAMM|Data~226_combout\,
	datad => \RAMM|Data~283_combout\,
	combout => \RAMM|Data~284_combout\);

-- Location: LCCOMB_X25_Y17_N10
\RAMM|Data~285\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~285_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~282_combout\ & ((\RAMM|Data~284_combout\))) # (!\RAMM|Data~282_combout\ & (\RAMM|Data~277_combout\)))) # (!\MAR|temp\(2) & (\RAMM|Data~282_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~282_combout\,
	datac => \RAMM|Data~277_combout\,
	datad => \RAMM|Data~284_combout\,
	combout => \RAMM|Data~285_combout\);

-- Location: LCCOMB_X25_Y17_N20
\RAMM|DO[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(2) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~285_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(2),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~285_combout\,
	combout => \RAMM|DO\(2));

-- Location: FF_X25_Y17_N1
\DR|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(2),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(2));

-- Location: LCCOMB_X22_Y7_N4
\d|D_OUT[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[2]~3_combout\ = (!\A|DO\(10) & \DR|temp\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(10),
	datad => \DR|temp\(2),
	combout => \d|D_OUT[2]~3_combout\);

-- Location: LCCOMB_X24_Y8_N6
\A|temp~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~64_combout\ = (\IR|WideOr3~2_combout\ & (((\A|Add1~6_combout\)) # (!\IR|WideOr1~1_combout\))) # (!\IR|WideOr3~2_combout\ & (\IR|WideOr1~1_combout\ & ((\A|Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \IR|WideOr1~1_combout\,
	datac => \A|Add1~6_combout\,
	datad => \A|Add0~6_combout\,
	combout => \A|temp~64_combout\);

-- Location: LCCOMB_X24_Y8_N28
\A|temp~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~65_combout\ = (\ACC|temp\(3) & ((\A|temp~64_combout\) # ((!\IR|WideOr1~1_combout\ & \d|D_OUT[3]~5_combout\)))) # (!\ACC|temp\(3) & (\A|temp~64_combout\ & ((\IR|WideOr1~1_combout\) # (\d|D_OUT[3]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \IR|WideOr1~1_combout\,
	datac => \d|D_OUT[3]~5_combout\,
	datad => \A|temp~64_combout\,
	combout => \A|temp~65_combout\);

-- Location: LCCOMB_X24_Y8_N22
\A|temp~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~105_combout\ = (\A|temp~19_combout\ & (((\A|temp~65_combout\)) # (!\IR|WideOr0~3_combout\))) # (!\A|temp~19_combout\ & (\IR|WideOr0~3_combout\ & (\A|Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~19_combout\,
	datab => \IR|WideOr0~3_combout\,
	datac => \A|Add2~6_combout\,
	datad => \A|temp~65_combout\,
	combout => \A|temp~105_combout\);

-- Location: LCCOMB_X24_Y8_N16
\A|temp~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~106_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~105_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(3) $ (((\A|temp~105_combout\) # (\d|D_OUT[3]~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \IR|WideOr0~3_combout\,
	datac => \A|temp~105_combout\,
	datad => \d|D_OUT[3]~5_combout\,
	combout => \A|temp~106_combout\);

-- Location: LCCOMB_X24_Y8_N24
\A|temp[3]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[3]~98_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(3) $ (((\d|D_OUT[3]~5_combout\))))) # (!\A|temp~22_combout\ & (((\A|temp~106_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \A|temp~106_combout\,
	datac => \A|temp~22_combout\,
	datad => \d|D_OUT[3]~5_combout\,
	combout => \A|temp[3]~98_combout\);

-- Location: LCCOMB_X25_Y8_N14
\A|temp[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(3) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[3]~98_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[3]~98_combout\,
	datac => \A|temp\(3),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(3));

-- Location: LCCOMB_X24_Y8_N30
\A|temp~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~66_combout\ = (\A|temp~22_combout\ & (\A|temp\(3))) # (!\A|temp~22_combout\ & ((\A|temp~106_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp\(3),
	datad => \A|temp~106_combout\,
	combout => \A|temp~66_combout\);

-- Location: LCCOMB_X24_Y8_N0
\A|DO[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(3) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~66_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~66_combout\,
	datab => \A|DO\(3),
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(3));

-- Location: LCCOMB_X24_Y6_N16
\A|temp~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~72_combout\ = (\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & ((\A|Add1~10_combout\))) # (!\IR|WideOr3~2_combout\ & (\A|Add0~10_combout\)))) # (!\IR|WideOr1~1_combout\ & (\IR|WideOr3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \IR|WideOr3~2_combout\,
	datac => \A|Add0~10_combout\,
	datad => \A|Add1~10_combout\,
	combout => \A|temp~72_combout\);

-- Location: LCCOMB_X24_Y6_N6
\A|temp~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~73_combout\ = (\IR|WideOr1~1_combout\ & (((\A|temp~72_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(5) & ((\d|D_OUT[5]~7_combout\) # (\A|temp~72_combout\))) # (!\ACC|temp\(5) & (\d|D_OUT[5]~7_combout\ & \A|temp~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \ACC|temp\(5),
	datac => \d|D_OUT[5]~7_combout\,
	datad => \A|temp~72_combout\,
	combout => \A|temp~73_combout\);

-- Location: LCCOMB_X24_Y6_N24
\A|temp~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~103_combout\ = (\A|temp~19_combout\ & (((\A|temp~73_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~10_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~10_combout\,
	datab => \A|temp~19_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~73_combout\,
	combout => \A|temp~103_combout\);

-- Location: LCCOMB_X24_Y6_N2
\A|temp~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~104_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~103_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(5) $ (((\d|D_OUT[5]~7_combout\) # (\A|temp~103_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[5]~7_combout\,
	datab => \ACC|temp\(5),
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~103_combout\,
	combout => \A|temp~104_combout\);

-- Location: LCCOMB_X24_Y6_N20
\A|temp[5]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[5]~99_combout\ = (\A|temp~22_combout\ & (\d|D_OUT[5]~7_combout\ $ (((\ACC|temp\(5)))))) # (!\A|temp~22_combout\ & (((\A|temp~104_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datab => \d|D_OUT[5]~7_combout\,
	datac => \A|temp~104_combout\,
	datad => \ACC|temp\(5),
	combout => \A|temp[5]~99_combout\);

-- Location: LCCOMB_X24_Y6_N8
\A|temp[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(5) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[5]~99_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp[5]~99_combout\,
	datac => \A|temp\(5),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(5));

-- Location: LCCOMB_X24_Y6_N0
\A|temp~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~74_combout\ = (\A|temp~22_combout\ & (\A|temp\(5))) # (!\A|temp~22_combout\ & ((\A|temp~104_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp\(5),
	datac => \A|temp~22_combout\,
	datad => \A|temp~104_combout\,
	combout => \A|temp~74_combout\);

-- Location: LCCOMB_X24_Y6_N22
\A|DO[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(5) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~74_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(5),
	datab => \A|temp~74_combout\,
	datac => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(5));

-- Location: LCCOMB_X23_Y9_N10
\d|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~1_combout\ = (!\A|DO\(2) & (!\A|DO\(4) & (!\A|DO\(3) & !\A|DO\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(2),
	datab => \A|DO\(4),
	datac => \A|DO\(3),
	datad => \A|DO\(5),
	combout => \d|Equal0~1_combout\);

-- Location: LCCOMB_X23_Y6_N8
\d|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~2_combout\ = (!\A|DO\(0) & (!\A|DO\(1) & (!\A|DO\(12) & !\A|DO\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(0),
	datab => \A|DO\(1),
	datac => \A|DO\(12),
	datad => \A|DO\(13),
	combout => \d|Equal0~2_combout\);

-- Location: LCCOMB_X24_Y7_N0
\d|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~3_combout\ = (!\A|DO\(15) & (!\A|DO\(14) & !\A|DO\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(15),
	datac => \A|DO\(14),
	datad => \A|DO\(11),
	combout => \d|Equal0~3_combout\);

-- Location: LCCOMB_X23_Y8_N0
\d|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~0_combout\ = (!\A|DO\(9) & (!\A|DO\(6) & (!\A|DO\(8) & !\A|DO\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(9),
	datab => \A|DO\(6),
	datac => \A|DO\(8),
	datad => \A|DO\(7),
	combout => \d|Equal0~0_combout\);

-- Location: LCCOMB_X23_Y9_N18
\d|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~4_combout\ = (\d|Equal0~1_combout\ & (\d|Equal0~2_combout\ & (\d|Equal0~3_combout\ & \d|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~1_combout\,
	datab => \d|Equal0~2_combout\,
	datac => \d|Equal0~3_combout\,
	datad => \d|Equal0~0_combout\,
	combout => \d|Equal0~4_combout\);

-- Location: LCCOMB_X21_Y9_N4
\d|D_OUT[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[2]~4_combout\ = (\A|DO\(2)) # (((\d|D_OUT[2]~3_combout\ & \d|Equal0~4_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(2),
	datab => \d|D_OUT[2]~3_combout\,
	datac => \CTRLM|ESUM~1_combout\,
	datad => \d|Equal0~4_combout\,
	combout => \d|D_OUT[2]~4_combout\);

-- Location: FF_X21_Y9_N21
\IR|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[2]~4_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(2));

-- Location: LCCOMB_X21_Y9_N14
\IR|Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal5~0_combout\ = (\IR|temp\(11) & (!\IR|temp\(8) & (\IR|temp\(13) & !\IR|temp\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(11),
	datab => \IR|temp\(8),
	datac => \IR|temp\(13),
	datad => \IR|temp\(3),
	combout => \IR|Equal5~0_combout\);

-- Location: LCCOMB_X22_Y10_N24
\IR|Equal7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal7~1_combout\ = (!\IR|temp\(9) & (\IR|temp\(12) & !\IR|temp\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(9),
	datab => \IR|temp\(12),
	datad => \IR|temp\(5),
	combout => \IR|Equal7~1_combout\);

-- Location: LCCOMB_X21_Y9_N24
\IR|Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal5~1_combout\ = (!\IR|temp\(10) & (!\IR|temp\(2) & (\IR|Equal5~0_combout\ & \IR|Equal7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(10),
	datab => \IR|temp\(2),
	datac => \IR|Equal5~0_combout\,
	datad => \IR|Equal7~1_combout\,
	combout => \IR|Equal5~1_combout\);

-- Location: LCCOMB_X21_Y9_N16
\CTRLM|C2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|C2~5_combout\ = (!\IR|Equal6~3_combout\ & (((!\IR|Equal5~2_combout\) # (!\IR|Equal5~3_combout\)) # (!\IR|Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal5~1_combout\,
	datab => \IR|Equal5~3_combout\,
	datac => \IR|Equal5~2_combout\,
	datad => \IR|Equal6~3_combout\,
	combout => \CTRLM|C2~5_combout\);

-- Location: LCCOMB_X22_Y9_N18
\CTRLM|C2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|C2~4_combout\ = (\IR|WideOr0~2_combout\ & ((\IR|WideOr1~0_combout\) # ((\CTRLM|C2~2_combout\ & \CTRLM|C2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|C2~2_combout\,
	datab => \IR|WideOr0~2_combout\,
	datac => \CTRLM|C2~5_combout\,
	datad => \IR|WideOr1~0_combout\,
	combout => \CTRLM|C2~4_combout\);

-- Location: LCCOMB_X22_Y9_N30
\CTRLM|Code8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|Code8~0_combout\ = (!\IR|Equal9~0_combout\ & (!\IR|WideOr0~2_combout\ & (\A|temp~16_combout\ & !\IR|WideOr1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal9~0_combout\,
	datab => \IR|WideOr0~2_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|WideOr1~0_combout\,
	combout => \CTRLM|Code8~0_combout\);

-- Location: LCCOMB_X22_Y9_N20
\CTRLM|IPC~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IPC~0_combout\ = (\IR|WideOr2~0_combout\ & ((\CTRLM|C2~4_combout\) # ((\CTRLM|Code8~0_combout\ & !\IR|WideOr3~1_combout\)))) # (!\IR|WideOr2~0_combout\ & (((\CTRLM|Code8~0_combout\ & !\IR|WideOr3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr2~0_combout\,
	datab => \CTRLM|C2~4_combout\,
	datac => \CTRLM|Code8~0_combout\,
	datad => \IR|WideOr3~1_combout\,
	combout => \CTRLM|IPC~0_combout\);

-- Location: LCCOMB_X22_Y9_N6
\CTRLM|ESUM~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|ESUM~1_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|ESUM~0_combout\) # ((\CTRLM|T6~combout\ & \CTRLM|IPC~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|ESUM~0_combout\,
	datab => \CTRLM|Code15~combout\,
	datac => \CTRLM|T6~combout\,
	datad => \CTRLM|IPC~0_combout\,
	combout => \CTRLM|ESUM~1_combout\);

-- Location: LCCOMB_X21_Y9_N8
\d|D_OUT[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[0]~1_combout\ = (\A|DO\(0)) # (((\d|D_OUT[0]~0_combout\ & \d|Equal0~4_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(0),
	datab => \d|D_OUT[0]~0_combout\,
	datac => \CTRLM|ESUM~1_combout\,
	datad => \d|Equal0~4_combout\,
	combout => \d|D_OUT[0]~1_combout\);

-- Location: FF_X21_Y9_N13
\IR|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[0]~1_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(0));

-- Location: LCCOMB_X22_Y10_N0
\IR|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal6~0_combout\ = (\IR|temp\(3) & (\IR|temp\(8) & (\IR|temp\(10) & \IR|temp\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(3),
	datab => \IR|temp\(8),
	datac => \IR|temp\(10),
	datad => \IR|temp\(4),
	combout => \IR|Equal6~0_combout\);

-- Location: LCCOMB_X21_Y9_N2
\IR|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~0_combout\ = (!\IR|temp\(11) & (!\IR|temp\(13) & (\IR|temp\(1) & \IR|temp\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(11),
	datab => \IR|temp\(13),
	datac => \IR|temp\(1),
	datad => \IR|temp\(2),
	combout => \IR|Equal0~0_combout\);

-- Location: LCCOMB_X21_Y10_N14
\IR|Equal6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal6~1_combout\ = (\IR|temp\(6) & (!\IR|temp\(0) & (\IR|Equal6~0_combout\ & \IR|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(6),
	datab => \IR|temp\(0),
	datac => \IR|Equal6~0_combout\,
	datad => \IR|Equal0~0_combout\,
	combout => \IR|Equal6~1_combout\);

-- Location: LCCOMB_X21_Y10_N28
\IR|Equal7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal7~2_combout\ = (\IR|Equal7~0_combout\ & (\IR|Equal6~1_combout\ & \IR|Equal7~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal7~0_combout\,
	datac => \IR|Equal6~1_combout\,
	datad => \IR|Equal7~1_combout\,
	combout => \IR|Equal7~2_combout\);

-- Location: LCCOMB_X22_Y9_N12
\IR|WideOr3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr3~1_combout\ = (\IR|Equal7~2_combout\) # (((\IR|Equal5~4_combout\) # (!\IR|WideNor0~combout\)) # (!\IR|WideOr3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal7~2_combout\,
	datab => \IR|WideOr3~0_combout\,
	datac => \IR|Equal5~4_combout\,
	datad => \IR|WideNor0~combout\,
	combout => \IR|WideOr3~1_combout\);

-- Location: LCCOMB_X23_Y9_N16
\CTRLM|EDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|EDR~0_combout\ = (\CTRLM|T3~1_combout\ & ((\CTRLM|Code4~0_combout\) # ((\IR|WideOr3~1_combout\ & \CTRLM|Code8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|Code4~0_combout\,
	datab => \IR|WideOr3~1_combout\,
	datac => \CTRLM|T3~1_combout\,
	datad => \CTRLM|Code8~0_combout\,
	combout => \CTRLM|EDR~0_combout\);

-- Location: LCCOMB_X23_Y9_N20
\CTRLM|R~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|R~0_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|EDR~0_combout\) # ((\CTRLM|T5~1_combout\ & \CTRLM|IPC~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T5~1_combout\,
	datab => \CTRLM|EDR~0_combout\,
	datac => \CTRLM|Code15~combout\,
	datad => \CTRLM|IPC~0_combout\,
	combout => \CTRLM|R~0_combout\);

-- Location: CLKCTRL_G2
\CTRLM|R~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CTRLM|R~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CTRLM|R~0clkctrl_outclk\);

-- Location: LCCOMB_X24_Y6_N18
\A|temp~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~80_combout\ = (\IR|WideOr1~1_combout\ & ((\IR|WideOr3~2_combout\ & ((\A|Add1~14_combout\))) # (!\IR|WideOr3~2_combout\ & (\A|Add0~14_combout\)))) # (!\IR|WideOr1~1_combout\ & (\IR|WideOr3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \IR|WideOr3~2_combout\,
	datac => \A|Add0~14_combout\,
	datad => \A|Add1~14_combout\,
	combout => \A|temp~80_combout\);

-- Location: LCCOMB_X24_Y6_N28
\A|temp~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~81_combout\ = (\ACC|temp\(7) & ((\A|temp~80_combout\) # ((\d|D_OUT[7]~9_combout\ & !\IR|WideOr1~1_combout\)))) # (!\ACC|temp\(7) & (\A|temp~80_combout\ & ((\d|D_OUT[7]~9_combout\) # (\IR|WideOr1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \d|D_OUT[7]~9_combout\,
	datac => \IR|WideOr1~1_combout\,
	datad => \A|temp~80_combout\,
	combout => \A|temp~81_combout\);

-- Location: LCCOMB_X24_Y6_N12
\A|temp~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~101_combout\ = (\A|temp~19_combout\ & (((\A|temp~81_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~14_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~14_combout\,
	datab => \A|temp~19_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~81_combout\,
	combout => \A|temp~101_combout\);

-- Location: LCCOMB_X24_Y6_N10
\A|temp~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~102_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~101_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(7) $ (((\d|D_OUT[7]~9_combout\) # (\A|temp~101_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[7]~9_combout\,
	datad => \A|temp~101_combout\,
	combout => \A|temp~102_combout\);

-- Location: LCCOMB_X24_Y6_N30
\A|temp[7]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[7]~100_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(7) $ ((\d|D_OUT[7]~9_combout\)))) # (!\A|temp~22_combout\ & (((\A|temp~102_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datab => \ACC|temp\(7),
	datac => \d|D_OUT[7]~9_combout\,
	datad => \A|temp~102_combout\,
	combout => \A|temp[7]~100_combout\);

-- Location: LCCOMB_X24_Y6_N26
\A|temp[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(7) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[7]~100_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[7]~100_combout\,
	datac => \A|temp\(7),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(7));

-- Location: LCCOMB_X24_Y6_N14
\A|temp~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~82_combout\ = (\A|temp~22_combout\ & (\A|temp\(7))) # (!\A|temp~22_combout\ & ((\A|temp~102_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp\(7),
	datac => \A|temp~22_combout\,
	datad => \A|temp~102_combout\,
	combout => \A|temp~82_combout\);

-- Location: LCCOMB_X24_Y6_N4
\A|DO[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(7) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~82_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(7),
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|temp~82_combout\,
	combout => \A|DO\(7));

-- Location: IOIBUF_X30_Y0_N1
\Input[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(7),
	o => \Input[7]~input_o\);

-- Location: LCCOMB_X25_Y13_N28
\RAMM|Data~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~119_combout\ = (\rtl~7_combout\ & (\Input[7]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~119_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~119_combout\,
	combout => \RAMM|Data~119_combout\);

-- Location: LCCOMB_X25_Y13_N14
\RAMM|Data~247\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~247_combout\ = (\rtl~15_combout\ & ((\Input[7]~input_o\))) # (!\rtl~15_combout\ & (\RAMM|Data~247_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~15_combout\,
	datac => \RAMM|Data~247_combout\,
	datad => \Input[7]~input_o\,
	combout => \RAMM|Data~247_combout\);

-- Location: LCCOMB_X25_Y13_N8
\RAMM|Data~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~55_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~55_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \RAMM|Data~55_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~55_combout\);

-- Location: LCCOMB_X25_Y13_N18
\RAMM|Data~183\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~183_combout\ = (\rtl~3_combout\ & (\Input[7]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~183_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \rtl~3_combout\,
	datad => \RAMM|Data~183_combout\,
	combout => \RAMM|Data~183_combout\);

-- Location: LCCOMB_X25_Y13_N20
\RAMM|Data~333\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~333_combout\ = (\MAR|temp\(3) & (((\RAMM|Data~183_combout\) # (\MAR|temp\(2))))) # (!\MAR|temp\(3) & (\RAMM|Data~55_combout\ & ((!\MAR|temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~55_combout\,
	datab => \RAMM|Data~183_combout\,
	datac => \MAR|temp\(3),
	datad => \MAR|temp\(2),
	combout => \RAMM|Data~333_combout\);

-- Location: LCCOMB_X25_Y13_N30
\RAMM|Data~334\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~334_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~333_combout\ & ((\RAMM|Data~247_combout\))) # (!\RAMM|Data~333_combout\ & (\RAMM|Data~119_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~333_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~119_combout\,
	datac => \RAMM|Data~247_combout\,
	datad => \RAMM|Data~333_combout\,
	combout => \RAMM|Data~334_combout\);

-- Location: LCCOMB_X25_Y13_N10
\RAMM|Data~215\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~215_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~215_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \RAMM|Data~215_combout\,
	combout => \RAMM|Data~215_combout\);

-- Location: LCCOMB_X25_Y13_N24
\RAMM|Data~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~87_combout\ = (\rtl~4_combout\ & (\Input[7]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~87_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datab => \rtl~4_combout\,
	datad => \RAMM|Data~87_combout\,
	combout => \RAMM|Data~87_combout\);

-- Location: LCCOMB_X25_Y13_N26
\RAMM|Data~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~151_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~151_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \RAMM|Data~151_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~151_combout\);

-- Location: LCCOMB_X25_Y13_N12
\RAMM|Data~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~23_combout\ = (\rtl~9_combout\ & (\Input[7]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \rtl~9_combout\,
	datad => \RAMM|Data~23_combout\,
	combout => \RAMM|Data~23_combout\);

-- Location: LCCOMB_X25_Y13_N16
\RAMM|Data~326\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~326_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~151_combout\) # ((\MAR|temp\(2))))) # (!\MAR|temp\(3) & (((\RAMM|Data~23_combout\ & !\MAR|temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~151_combout\,
	datab => \RAMM|Data~23_combout\,
	datac => \MAR|temp\(3),
	datad => \MAR|temp\(2),
	combout => \RAMM|Data~326_combout\);

-- Location: LCCOMB_X25_Y13_N6
\RAMM|Data~327\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~327_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~326_combout\ & (\RAMM|Data~215_combout\)) # (!\RAMM|Data~326_combout\ & ((\RAMM|Data~87_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~326_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~215_combout\,
	datab => \RAMM|Data~87_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~326_combout\,
	combout => \RAMM|Data~327_combout\);

-- Location: LCCOMB_X24_Y13_N12
\RAMM|Data~231\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~231_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~231_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~231_combout\,
	combout => \RAMM|Data~231_combout\);

-- Location: LCCOMB_X26_Y13_N30
\RAMM|Data~167\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~167_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~167_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[7]~input_o\,
	datac => \RAMM|Data~167_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~167_combout\);

-- Location: LCCOMB_X24_Y13_N26
\RAMM|Data~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~103_combout\ = (\rtl~5_combout\ & (\Input[7]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~103_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \RAMM|Data~103_combout\,
	datad => \rtl~5_combout\,
	combout => \RAMM|Data~103_combout\);

-- Location: LCCOMB_X25_Y12_N24
\RAMM|Data~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~39_combout\ = (\rtl~8_combout\ & (\Input[7]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[7]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~39_combout\,
	combout => \RAMM|Data~39_combout\);

-- Location: LCCOMB_X24_Y12_N30
\RAMM|Data~328\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~328_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~103_combout\) # ((\MAR|temp\(3))))) # (!\MAR|temp\(2) & (((!\MAR|temp\(3) & \RAMM|Data~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~103_combout\,
	datab => \MAR|temp\(2),
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~39_combout\,
	combout => \RAMM|Data~328_combout\);

-- Location: LCCOMB_X24_Y12_N4
\RAMM|Data~329\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~329_combout\ = (\RAMM|Data~328_combout\ & ((\RAMM|Data~231_combout\) # ((!\MAR|temp\(3))))) # (!\RAMM|Data~328_combout\ & (((\RAMM|Data~167_combout\ & \MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~231_combout\,
	datab => \RAMM|Data~167_combout\,
	datac => \RAMM|Data~328_combout\,
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~329_combout\);

-- Location: LCCOMB_X25_Y12_N18
\RAMM|Data~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~135_combout\ = (\rtl~2_combout\ & (\Input[7]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~135_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~2_combout\,
	datac => \Input[7]~input_o\,
	datad => \RAMM|Data~135_combout\,
	combout => \RAMM|Data~135_combout\);

-- Location: LCCOMB_X24_Y13_N24
\RAMM|Data~199\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~199_combout\ = (\rtl~14_combout\ & (\Input[7]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~199_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datac => \Input[7]~input_o\,
	datad => \RAMM|Data~199_combout\,
	combout => \RAMM|Data~199_combout\);

-- Location: LCCOMB_X24_Y13_N22
\RAMM|Data~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~71_combout\ = (\rtl~6_combout\ & (\Input[7]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \RAMM|Data~71_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~71_combout\);

-- Location: LCCOMB_X26_Y12_N14
\RAMM|Data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~7_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[7]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[7]~input_o\,
	datac => \RAMM|Data~7_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~7_combout\);

-- Location: LCCOMB_X24_Y12_N18
\RAMM|Data~330\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~330_combout\ = (\MAR|temp\(2) & ((\MAR|temp\(3)) # ((\RAMM|Data~71_combout\)))) # (!\MAR|temp\(2) & (!\MAR|temp\(3) & ((\RAMM|Data~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~71_combout\,
	datad => \RAMM|Data~7_combout\,
	combout => \RAMM|Data~330_combout\);

-- Location: LCCOMB_X24_Y12_N12
\RAMM|Data~331\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~331_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~330_combout\ & ((\RAMM|Data~199_combout\))) # (!\RAMM|Data~330_combout\ & (\RAMM|Data~135_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~330_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~135_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~199_combout\,
	datad => \RAMM|Data~330_combout\,
	combout => \RAMM|Data~331_combout\);

-- Location: LCCOMB_X24_Y12_N10
\RAMM|Data~332\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~332_combout\ = (\MAR|temp\(1) & ((\MAR|temp\(0)) # ((\RAMM|Data~329_combout\)))) # (!\MAR|temp\(1) & (!\MAR|temp\(0) & ((\RAMM|Data~331_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~329_combout\,
	datad => \RAMM|Data~331_combout\,
	combout => \RAMM|Data~332_combout\);

-- Location: LCCOMB_X24_Y12_N24
\RAMM|Data~335\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~335_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~332_combout\ & (\RAMM|Data~334_combout\)) # (!\RAMM|Data~332_combout\ & ((\RAMM|Data~327_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~332_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~334_combout\,
	datac => \RAMM|Data~327_combout\,
	datad => \RAMM|Data~332_combout\,
	combout => \RAMM|Data~335_combout\);

-- Location: LCCOMB_X24_Y12_N16
\RAMM|DO[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(7) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~335_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(7),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~335_combout\,
	combout => \RAMM|DO\(7));

-- Location: LCCOMB_X23_Y9_N24
\DR|temp[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[7]~feeder_combout\ = \RAMM|DO\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RAMM|DO\(7),
	combout => \DR|temp[7]~feeder_combout\);

-- Location: FF_X23_Y9_N25
\DR|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[7]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(7));

-- Location: LCCOMB_X23_Y9_N28
\d|D_OUT[7]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[7]~9_combout\ = (\A|DO\(7)) # (((\DR|temp\(7) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(7),
	datab => \DR|temp\(7),
	datac => \d|Equal0~5_combout\,
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[7]~9_combout\);

-- Location: FF_X21_Y10_N3
\IR|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[7]~9_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(7));

-- Location: LCCOMB_X22_Y10_N4
\IR|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal1~0_combout\ = (!\IR|temp\(5) & (\IR|temp\(6) & (\IR|temp\(7) & !\IR|temp\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(5),
	datab => \IR|temp\(6),
	datac => \IR|temp\(7),
	datad => \IR|temp\(4),
	combout => \IR|Equal1~0_combout\);

-- Location: LCCOMB_X22_Y10_N14
\IR|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~1_combout\ = (!\IR|temp\(15) & (!\IR|temp\(14) & !\IR|temp\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(15),
	datab => \IR|temp\(14),
	datad => \IR|temp\(10),
	combout => \IR|Equal0~1_combout\);

-- Location: LCCOMB_X22_Y10_N16
\IR|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~2_combout\ = (!\IR|temp\(12) & (!\IR|temp\(8) & !\IR|temp\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|temp\(12),
	datac => \IR|temp\(8),
	datad => \IR|temp\(9),
	combout => \IR|Equal0~2_combout\);

-- Location: LCCOMB_X22_Y10_N2
\IR|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~3_combout\ = (\IR|Equal0~1_combout\ & (!\IR|temp\(0) & (\IR|Equal0~0_combout\ & \IR|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal0~1_combout\,
	datab => \IR|temp\(0),
	datac => \IR|Equal0~0_combout\,
	datad => \IR|Equal0~2_combout\,
	combout => \IR|Equal0~3_combout\);

-- Location: LCCOMB_X22_Y10_N22
\IR|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal1~1_combout\ = (!\IR|temp\(3) & (\IR|Equal1~0_combout\ & \IR|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(3),
	datac => \IR|Equal1~0_combout\,
	datad => \IR|Equal0~3_combout\,
	combout => \IR|Equal1~1_combout\);

-- Location: LCCOMB_X22_Y10_N20
\IR|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal2~1_combout\ = (\IR|temp\(3) & (\IR|temp\(12) & (\IR|temp\(9) & \IR|temp\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(3),
	datab => \IR|temp\(12),
	datac => \IR|temp\(9),
	datad => \IR|temp\(4),
	combout => \IR|Equal2~1_combout\);

-- Location: LCCOMB_X21_Y10_N30
\IR|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal2~0_combout\ = (!\IR|temp\(5) & (!\IR|temp\(7) & (!\IR|temp\(6) & \IR|temp\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(5),
	datab => \IR|temp\(7),
	datac => \IR|temp\(6),
	datad => \IR|temp\(8),
	combout => \IR|Equal2~0_combout\);

-- Location: LCCOMB_X21_Y9_N12
\IR|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal2~2_combout\ = (\IR|Equal2~0_combout\ & (\IR|Equal0~0_combout\ & (!\IR|temp\(0) & \IR|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal2~0_combout\,
	datab => \IR|Equal0~0_combout\,
	datac => \IR|temp\(0),
	datad => \IR|Equal0~1_combout\,
	combout => \IR|Equal2~2_combout\);

-- Location: LCCOMB_X21_Y9_N28
\IR|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal2~3_combout\ = (\IR|Equal2~1_combout\ & \IR|Equal2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|Equal2~1_combout\,
	datad => \IR|Equal2~2_combout\,
	combout => \IR|Equal2~3_combout\);

-- Location: LCCOMB_X22_Y9_N4
\A|temp~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~16_combout\ = (!\IR|Equal1~1_combout\ & (!\IR|Equal5~4_combout\ & (!\IR|Equal6~3_combout\ & !\IR|Equal2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal1~1_combout\,
	datab => \IR|Equal5~4_combout\,
	datac => \IR|Equal6~3_combout\,
	datad => \IR|Equal2~3_combout\,
	combout => \A|temp~16_combout\);

-- Location: LCCOMB_X23_Y10_N16
\A|temp~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~19_combout\ = (\IR|Equal7~2_combout\) # ((!\IR|Equal8~1_combout\ & !\A|temp~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal8~1_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|Equal7~2_combout\,
	combout => \A|temp~19_combout\);

-- Location: LCCOMB_X24_Y8_N20
\A|temp~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~56_combout\ = (\IR|WideOr3~2_combout\ & (((\A|Add1~12_combout\)) # (!\IR|WideOr1~1_combout\))) # (!\IR|WideOr3~2_combout\ & (\IR|WideOr1~1_combout\ & ((\A|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \IR|WideOr1~1_combout\,
	datac => \A|Add1~12_combout\,
	datad => \A|Add0~12_combout\,
	combout => \A|temp~56_combout\);

-- Location: LCCOMB_X24_Y8_N2
\A|temp~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~57_combout\ = (\d|D_OUT[6]~8_combout\ & ((\A|temp~56_combout\) # ((\ACC|temp\(6) & !\IR|WideOr1~1_combout\)))) # (!\d|D_OUT[6]~8_combout\ & (\A|temp~56_combout\ & ((\ACC|temp\(6)) # (\IR|WideOr1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[6]~8_combout\,
	datab => \ACC|temp\(6),
	datac => \IR|WideOr1~1_combout\,
	datad => \A|temp~56_combout\,
	combout => \A|temp~57_combout\);

-- Location: LCCOMB_X24_Y8_N18
\A|temp~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~107_combout\ = (\A|temp~19_combout\ & (((\A|temp~57_combout\)) # (!\IR|WideOr0~3_combout\))) # (!\A|temp~19_combout\ & (\IR|WideOr0~3_combout\ & (\A|Add2~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~19_combout\,
	datab => \IR|WideOr0~3_combout\,
	datac => \A|Add2~12_combout\,
	datad => \A|temp~57_combout\,
	combout => \A|temp~107_combout\);

-- Location: LCCOMB_X24_Y8_N12
\A|temp~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~108_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~107_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(6) $ (((\d|D_OUT[6]~8_combout\) # (\A|temp~107_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[6]~8_combout\,
	datad => \A|temp~107_combout\,
	combout => \A|temp~108_combout\);

-- Location: LCCOMB_X24_Y8_N26
\A|temp[6]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[6]~97_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(6) $ ((\d|D_OUT[6]~8_combout\)))) # (!\A|temp~22_combout\ & (((\A|temp~108_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \A|temp~22_combout\,
	datac => \d|D_OUT[6]~8_combout\,
	datad => \A|temp~108_combout\,
	combout => \A|temp[6]~97_combout\);

-- Location: LCCOMB_X24_Y8_N14
\A|temp[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(6) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[6]~97_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[6]~97_combout\,
	datac => \A|temp\(6),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(6));

-- Location: LCCOMB_X24_Y8_N8
\A|temp~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~58_combout\ = (\A|temp~22_combout\ & (\A|temp\(6))) # (!\A|temp~22_combout\ & ((\A|temp~108_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~22_combout\,
	datac => \A|temp\(6),
	datad => \A|temp~108_combout\,
	combout => \A|temp~58_combout\);

-- Location: LCCOMB_X23_Y8_N28
\A|DO[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(6) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~58_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(6),
	datac => \A|temp~58_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(6));

-- Location: LCCOMB_X23_Y9_N0
\d|D_OUT[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[6]~8_combout\ = (\A|DO\(6)) # (((\DR|temp\(6) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DR|temp\(6),
	datab => \A|DO\(6),
	datac => \d|Equal0~5_combout\,
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[6]~8_combout\);

-- Location: FF_X21_Y10_N23
\IR|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[6]~8_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(6));

-- Location: LCCOMB_X21_Y9_N20
\IR|Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal8~0_combout\ = (!\IR|temp\(0) & (!\IR|temp\(1) & \IR|temp\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(0),
	datab => \IR|temp\(1),
	datad => \IR|temp\(4),
	combout => \IR|Equal8~0_combout\);

-- Location: LCCOMB_X21_Y9_N6
\IR|Equal8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal8~1_combout\ = (\IR|temp\(6) & (\IR|Equal8~0_combout\ & (\IR|Equal7~0_combout\ & \IR|Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(6),
	datab => \IR|Equal8~0_combout\,
	datac => \IR|Equal7~0_combout\,
	datad => \IR|Equal5~1_combout\,
	combout => \IR|Equal8~1_combout\);

-- Location: LCCOMB_X22_Y9_N24
\IR|WideOr0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr0~2_combout\ = (!\IR|Equal8~1_combout\ & (!\IR|Equal7~2_combout\ & !\IR|Equal9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|Equal8~1_combout\,
	datac => \IR|Equal7~2_combout\,
	datad => \IR|Equal9~0_combout\,
	combout => \IR|WideOr0~2_combout\);

-- Location: LCCOMB_X22_Y9_N16
\CTRLM|Code15\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|Code15~combout\ = (!\IR|WideOr0~2_combout\ & (\IR|WideOr1~0_combout\ & (\IR|WideOr2~0_combout\ & !\IR|WideOr3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~2_combout\,
	datab => \IR|WideOr1~0_combout\,
	datac => \IR|WideOr2~0_combout\,
	datad => \IR|WideOr3~1_combout\,
	combout => \CTRLM|Code15~combout\);

-- Location: LCCOMB_X22_Y12_N24
\CTRLM|IMAR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IMAR~2_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|IMAR~1_combout\) # ((\CTRLM|T3~1_combout\ & \CTRLM|IPC~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T3~1_combout\,
	datab => \CTRLM|IMAR~1_combout\,
	datac => \CTRLM|Code15~combout\,
	datad => \CTRLM|IPC~1_combout\,
	combout => \CTRLM|IMAR~2_combout\);

-- Location: FF_X22_Y16_N27
\MAR|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \P|temp\(1),
	sload => VCC,
	ena => \CTRLM|IMAR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MAR|temp\(1));

-- Location: IOIBUF_X34_Y17_N15
\Input[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(5),
	o => \Input[5]~input_o\);

-- Location: LCCOMB_X25_Y14_N28
\RAMM|Data~245\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~245_combout\ = (\rtl~15_combout\ & (\Input[5]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~245_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~15_combout\,
	datac => \Input[5]~input_o\,
	datad => \RAMM|Data~245_combout\,
	combout => \RAMM|Data~245_combout\);

-- Location: LCCOMB_X25_Y14_N8
\RAMM|Data~181\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~181_combout\ = (\rtl~3_combout\ & (\Input[5]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~181_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[5]~input_o\,
	datac => \RAMM|Data~181_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~181_combout\);

-- Location: LCCOMB_X26_Y16_N16
\RAMM|Data~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~53_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & ((\Input[5]~input_o\))) # (!GLOBAL(\rtl~11clkctrl_outclk\) & (\RAMM|Data~53_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~53_combout\,
	datac => \Input[5]~input_o\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~53_combout\);

-- Location: LCCOMB_X24_Y15_N10
\RAMM|Data~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~117_combout\ = (\rtl~7_combout\ & (\Input[5]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~117_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~7_combout\,
	datac => \Input[5]~input_o\,
	datad => \RAMM|Data~117_combout\,
	combout => \RAMM|Data~117_combout\);

-- Location: LCCOMB_X26_Y16_N12
\RAMM|Data~313\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~313_combout\ = (\MAR|temp\(2) & (((\RAMM|Data~117_combout\) # (\MAR|temp\(3))))) # (!\MAR|temp\(2) & (\RAMM|Data~53_combout\ & ((!\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~53_combout\,
	datac => \RAMM|Data~117_combout\,
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~313_combout\);

-- Location: LCCOMB_X26_Y16_N14
\RAMM|Data~314\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~314_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~313_combout\ & (\RAMM|Data~245_combout\)) # (!\RAMM|Data~313_combout\ & ((\RAMM|Data~181_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~313_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~245_combout\,
	datab => \RAMM|Data~181_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~313_combout\,
	combout => \RAMM|Data~314_combout\);

-- Location: LCCOMB_X26_Y13_N26
\RAMM|Data~229\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~229_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[5]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~229_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[5]~input_o\,
	datac => \RAMM|Data~229_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \RAMM|Data~229_combout\);

-- Location: LCCOMB_X24_Y15_N0
\RAMM|Data~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~101_combout\ = (\rtl~5_combout\ & (\Input[5]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~101_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[5]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~101_combout\,
	combout => \RAMM|Data~101_combout\);

-- Location: LCCOMB_X25_Y15_N28
\RAMM|Data~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~37_combout\ = (\rtl~8_combout\ & (\Input[5]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[5]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~37_combout\,
	combout => \RAMM|Data~37_combout\);

-- Location: LCCOMB_X26_Y13_N0
\RAMM|Data~165\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~165_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & ((\Input[5]~input_o\))) # (!GLOBAL(\rtl~0clkctrl_outclk\) & (\RAMM|Data~165_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~165_combout\,
	datac => \Input[5]~input_o\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~165_combout\);

-- Location: LCCOMB_X26_Y16_N6
\RAMM|Data~306\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~306_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & ((\RAMM|Data~165_combout\))) # (!\MAR|temp\(3) & (\RAMM|Data~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~37_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~165_combout\,
	combout => \RAMM|Data~306_combout\);

-- Location: LCCOMB_X26_Y16_N4
\RAMM|Data~307\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~307_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~306_combout\ & (\RAMM|Data~229_combout\)) # (!\RAMM|Data~306_combout\ & ((\RAMM|Data~101_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~306_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~229_combout\,
	datab => \RAMM|Data~101_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~306_combout\,
	combout => \RAMM|Data~307_combout\);

-- Location: LCCOMB_X26_Y13_N16
\RAMM|Data~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~149_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[5]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~149_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[5]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \RAMM|Data~149_combout\,
	combout => \RAMM|Data~149_combout\);

-- Location: LCCOMB_X26_Y16_N24
\RAMM|Data~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~85_combout\ = (\rtl~4_combout\ & (\Input[5]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~85_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[5]~input_o\,
	datab => \rtl~4_combout\,
	datad => \RAMM|Data~85_combout\,
	combout => \RAMM|Data~85_combout\);

-- Location: LCCOMB_X26_Y16_N0
\RAMM|Data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~21_combout\ = (\rtl~9_combout\ & (\Input[5]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~9_combout\,
	datab => \Input[5]~input_o\,
	datad => \RAMM|Data~21_combout\,
	combout => \RAMM|Data~21_combout\);

-- Location: LCCOMB_X26_Y16_N30
\RAMM|Data~308\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~308_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~85_combout\) # ((\MAR|temp\(3))))) # (!\MAR|temp\(2) & (((\RAMM|Data~21_combout\ & !\MAR|temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~85_combout\,
	datac => \RAMM|Data~21_combout\,
	datad => \MAR|temp\(3),
	combout => \RAMM|Data~308_combout\);

-- Location: LCCOMB_X26_Y15_N14
\RAMM|Data~213\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~213_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[5]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~213_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[5]~input_o\,
	datac => \RAMM|Data~213_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~213_combout\);

-- Location: LCCOMB_X26_Y16_N8
\RAMM|Data~309\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~309_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~308_combout\ & ((\RAMM|Data~213_combout\))) # (!\RAMM|Data~308_combout\ & (\RAMM|Data~149_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~308_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~149_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~308_combout\,
	datad => \RAMM|Data~213_combout\,
	combout => \RAMM|Data~309_combout\);

-- Location: LCCOMB_X23_Y13_N6
\RAMM|Data~197\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~197_combout\ = (\rtl~14_combout\ & (\Input[5]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~197_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~14_combout\,
	datac => \Input[5]~input_o\,
	datad => \RAMM|Data~197_combout\,
	combout => \RAMM|Data~197_combout\);

-- Location: LCCOMB_X24_Y16_N20
\RAMM|Data~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~69_combout\ = (\rtl~6_combout\ & (\Input[5]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~69_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~6_combout\,
	datac => \Input[5]~input_o\,
	datad => \RAMM|Data~69_combout\,
	combout => \RAMM|Data~69_combout\);

-- Location: LCCOMB_X26_Y15_N24
\RAMM|Data~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~133_combout\ = (\rtl~2_combout\ & (\Input[5]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~133_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~2_combout\,
	datac => \Input[5]~input_o\,
	datad => \RAMM|Data~133_combout\,
	combout => \RAMM|Data~133_combout\);

-- Location: LCCOMB_X26_Y16_N18
\RAMM|Data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~5_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & ((\Input[5]~input_o\))) # (!GLOBAL(\rtl~10clkctrl_outclk\) & (\RAMM|Data~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~5_combout\,
	datac => \Input[5]~input_o\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~5_combout\);

-- Location: LCCOMB_X26_Y16_N10
\RAMM|Data~310\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~310_combout\ = (\MAR|temp\(2) & (((\MAR|temp\(3))))) # (!\MAR|temp\(2) & ((\MAR|temp\(3) & (\RAMM|Data~133_combout\)) # (!\MAR|temp\(3) & ((\RAMM|Data~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~133_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~5_combout\,
	combout => \RAMM|Data~310_combout\);

-- Location: LCCOMB_X26_Y16_N20
\RAMM|Data~311\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~311_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~310_combout\ & (\RAMM|Data~197_combout\)) # (!\RAMM|Data~310_combout\ & ((\RAMM|Data~69_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~310_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~197_combout\,
	datac => \RAMM|Data~69_combout\,
	datad => \RAMM|Data~310_combout\,
	combout => \RAMM|Data~311_combout\);

-- Location: LCCOMB_X26_Y16_N2
\RAMM|Data~312\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~312_combout\ = (\MAR|temp\(1) & (\MAR|temp\(0))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & (\RAMM|Data~309_combout\)) # (!\MAR|temp\(0) & ((\RAMM|Data~311_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~309_combout\,
	datad => \RAMM|Data~311_combout\,
	combout => \RAMM|Data~312_combout\);

-- Location: LCCOMB_X26_Y16_N28
\RAMM|Data~315\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~315_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~312_combout\ & (\RAMM|Data~314_combout\)) # (!\RAMM|Data~312_combout\ & ((\RAMM|Data~307_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~312_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~314_combout\,
	datac => \RAMM|Data~307_combout\,
	datad => \RAMM|Data~312_combout\,
	combout => \RAMM|Data~315_combout\);

-- Location: LCCOMB_X26_Y16_N22
\RAMM|DO[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(5) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~315_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(5),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~315_combout\,
	combout => \RAMM|DO\(5));

-- Location: FF_X26_Y16_N25
\DR|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(5),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(5));

-- Location: LCCOMB_X23_Y9_N22
\d|D_OUT[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[5]~7_combout\ = (\A|DO\(5)) # (((\DR|temp\(5) & \d|Equal0~5_combout\)) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DR|temp\(5),
	datab => \A|DO\(5),
	datac => \d|Equal0~5_combout\,
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[5]~7_combout\);

-- Location: FF_X21_Y10_N13
\IR|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[5]~7_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(5));

-- Location: LCCOMB_X21_Y10_N22
\IR|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal3~0_combout\ = (\IR|temp\(5) & (\IR|temp\(2) & \IR|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(5),
	datab => \IR|temp\(2),
	datad => \IR|temp\(1),
	combout => \IR|Equal3~0_combout\);

-- Location: LCCOMB_X21_Y10_N24
\IR|Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal4~0_combout\ = (!\IR|temp\(13) & (!\IR|temp\(2) & !\IR|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(13),
	datac => \IR|temp\(2),
	datad => \IR|temp\(1),
	combout => \IR|Equal4~0_combout\);

-- Location: LCCOMB_X21_Y10_N26
\IR|Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal4~1_combout\ = (\IR|Equal2~0_combout\ & (\IR|temp\(10) & (\IR|Equal3~1_combout\ & \IR|Equal3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal2~0_combout\,
	datab => \IR|temp\(10),
	datac => \IR|Equal3~1_combout\,
	datad => \IR|Equal3~2_combout\,
	combout => \IR|Equal4~1_combout\);

-- Location: LCCOMB_X21_Y10_N10
\CTRLM|C2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|C2~2_combout\ = (\IR|Equal3~0_combout\ & (!\IR|Equal3~4_combout\ & ((!\IR|Equal4~1_combout\) # (!\IR|Equal4~0_combout\)))) # (!\IR|Equal3~0_combout\ & (((!\IR|Equal4~1_combout\)) # (!\IR|Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal3~0_combout\,
	datab => \IR|Equal4~0_combout\,
	datac => \IR|Equal4~1_combout\,
	datad => \IR|Equal3~4_combout\,
	combout => \CTRLM|C2~2_combout\);

-- Location: LCCOMB_X21_Y10_N0
\IR|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~4_combout\ = (\IR|temp\(5) & (\IR|temp\(4) & !\IR|temp\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(5),
	datab => \IR|temp\(4),
	datad => \IR|temp\(7),
	combout => \IR|Equal0~4_combout\);

-- Location: LCCOMB_X22_Y10_N28
\IR|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal0~5_combout\ = (\IR|temp\(3) & (!\IR|temp\(6) & (\IR|Equal0~4_combout\ & \IR|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(3),
	datab => \IR|temp\(6),
	datac => \IR|Equal0~4_combout\,
	datad => \IR|Equal0~3_combout\,
	combout => \IR|Equal0~5_combout\);

-- Location: LCCOMB_X22_Y9_N10
\IR|WideNor0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideNor0~combout\ = ((\IR|Equal0~5_combout\) # ((!\IR|WideOr0~2_combout\) # (!\A|temp~16_combout\))) # (!\CTRLM|C2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|C2~2_combout\,
	datab => \IR|Equal0~5_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|WideOr0~2_combout\,
	combout => \IR|WideNor0~combout\);

-- Location: LCCOMB_X23_Y10_N4
\CTRLM|C2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|C2~3_combout\ = (!\IR|Equal9~0_combout\ & (!\IR|Equal7~2_combout\ & (\CTRLM|C2~2_combout\ & !\IR|Equal8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal9~0_combout\,
	datab => \IR|Equal7~2_combout\,
	datac => \CTRLM|C2~2_combout\,
	datad => \IR|Equal8~1_combout\,
	combout => \CTRLM|C2~3_combout\);

-- Location: LCCOMB_X22_Y9_N0
\CTRLM|IPC~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IPC~1_combout\ = (\CTRLM|IPC~0_combout\) # ((\IR|WideNor0~combout\ & (\A|temp~16_combout\ & \CTRLM|C2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideNor0~combout\,
	datab => \A|temp~16_combout\,
	datac => \CTRLM|C2~3_combout\,
	datad => \CTRLM|IPC~0_combout\,
	combout => \CTRLM|IPC~1_combout\);

-- Location: LCCOMB_X25_Y10_N0
\CTRLM|IPC~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|IPC~2_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|IIR~2_combout\) # ((\CTRLM|T5~1_combout\ & \CTRLM|IPC~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T5~1_combout\,
	datab => \CTRLM|IIR~2_combout\,
	datac => \CTRLM|IPC~1_combout\,
	datad => \CTRLM|Code15~combout\,
	combout => \CTRLM|IPC~2_combout\);

-- Location: LCCOMB_X25_Y10_N20
\P|temp[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \P|temp[1]~1_combout\ = \P|temp\(1) $ (((\CTRLM|IPC~2_combout\ & \P|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CTRLM|IPC~2_combout\,
	datac => \P|temp\(1),
	datad => \P|temp\(0),
	combout => \P|temp[1]~1_combout\);

-- Location: FF_X25_Y10_N21
\P|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \P|temp[1]~1_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \P|temp\(1));

-- Location: LCCOMB_X25_Y10_N18
\P|temp[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \P|temp[2]~2_combout\ = \P|temp\(2) $ (((\P|temp\(1) & (\CTRLM|IPC~2_combout\ & \P|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \P|temp\(1),
	datab => \CTRLM|IPC~2_combout\,
	datac => \P|temp\(2),
	datad => \P|temp\(0),
	combout => \P|temp[2]~2_combout\);

-- Location: FF_X25_Y10_N19
\P|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \P|temp[2]~2_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \P|temp\(2));

-- Location: FF_X24_Y12_N1
\MAR|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \P|temp\(2),
	sload => VCC,
	ena => \CTRLM|IMAR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MAR|temp\(2));

-- Location: IOIBUF_X18_Y24_N15
\Input[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(10),
	o => \Input[10]~input_o\);

-- Location: LCCOMB_X23_Y15_N18
\RAMM|Data~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~106_combout\ = (\rtl~5_combout\ & (\Input[10]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~106_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[10]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~106_combout\,
	combout => \RAMM|Data~106_combout\);

-- Location: LCCOMB_X24_Y15_N22
\RAMM|Data~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~122_combout\ = (\rtl~7_combout\ & ((\Input[10]~input_o\))) # (!\rtl~7_combout\ & (\RAMM|Data~122_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~7_combout\,
	datac => \RAMM|Data~122_combout\,
	datad => \Input[10]~input_o\,
	combout => \RAMM|Data~122_combout\);

-- Location: LCCOMB_X23_Y15_N16
\RAMM|Data~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~74_combout\ = (\rtl~6_combout\ & (\Input[10]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~74_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~6_combout\,
	datac => \Input[10]~input_o\,
	datad => \RAMM|Data~74_combout\,
	combout => \RAMM|Data~74_combout\);

-- Location: LCCOMB_X24_Y15_N8
\RAMM|Data~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~90_combout\ = (\rtl~4_combout\ & ((\Input[10]~input_o\))) # (!\rtl~4_combout\ & (\RAMM|Data~90_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|Data~90_combout\,
	datac => \rtl~4_combout\,
	datad => \Input[10]~input_o\,
	combout => \RAMM|Data~90_combout\);

-- Location: LCCOMB_X23_Y15_N6
\RAMM|Data~356\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~356_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1)) # (\RAMM|Data~90_combout\)))) # (!\MAR|temp\(0) & (\RAMM|Data~74_combout\ & (!\MAR|temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~74_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~90_combout\,
	combout => \RAMM|Data~356_combout\);

-- Location: LCCOMB_X23_Y15_N8
\RAMM|Data~357\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~357_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~356_combout\ & ((\RAMM|Data~122_combout\))) # (!\RAMM|Data~356_combout\ & (\RAMM|Data~106_combout\)))) # (!\MAR|temp\(1) & (((\RAMM|Data~356_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~106_combout\,
	datab => \RAMM|Data~122_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~356_combout\,
	combout => \RAMM|Data~357_combout\);

-- Location: LCCOMB_X22_Y18_N30
\RAMM|Data~186\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~186_combout\ = (\rtl~3_combout\ & (\Input[10]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~186_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \RAMM|Data~186_combout\,
	datad => \rtl~3_combout\,
	combout => \RAMM|Data~186_combout\);

-- Location: LCCOMB_X22_Y18_N26
\RAMM|Data~170\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~170_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~170_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \RAMM|Data~170_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~170_combout\);

-- Location: LCCOMB_X22_Y18_N16
\RAMM|Data~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~138_combout\ = (\rtl~2_combout\ & (\Input[10]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~138_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~2_combout\,
	datab => \Input[10]~input_o\,
	datad => \RAMM|Data~138_combout\,
	combout => \RAMM|Data~138_combout\);

-- Location: LCCOMB_X22_Y18_N14
\RAMM|Data~358\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~358_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1))))) # (!\MAR|temp\(0) & ((\MAR|temp\(1) & (\RAMM|Data~170_combout\)) # (!\MAR|temp\(1) & ((\RAMM|Data~138_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~170_combout\,
	datab => \RAMM|Data~138_combout\,
	datac => \MAR|temp\(0),
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~358_combout\);

-- Location: LCCOMB_X21_Y18_N8
\RAMM|Data~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~154_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~154_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \RAMM|Data~154_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~154_combout\);

-- Location: LCCOMB_X22_Y18_N8
\RAMM|Data~359\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~359_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~358_combout\ & (\RAMM|Data~186_combout\)) # (!\RAMM|Data~358_combout\ & ((\RAMM|Data~154_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~358_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~186_combout\,
	datab => \MAR|temp\(0),
	datac => \RAMM|Data~358_combout\,
	datad => \RAMM|Data~154_combout\,
	combout => \RAMM|Data~359_combout\);

-- Location: LCCOMB_X22_Y18_N28
\RAMM|Data~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~26_combout\ = (\rtl~9_combout\ & (\Input[10]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \rtl~9_combout\,
	datad => \RAMM|Data~26_combout\,
	combout => \RAMM|Data~26_combout\);

-- Location: LCCOMB_X21_Y18_N6
\RAMM|Data~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~58_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \RAMM|Data~58_combout\,
	combout => \RAMM|Data~58_combout\);

-- Location: LCCOMB_X22_Y18_N18
\RAMM|Data~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~42_combout\ = (\rtl~8_combout\ & (\Input[10]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~42_combout\,
	combout => \RAMM|Data~42_combout\);

-- Location: LCCOMB_X22_Y18_N24
\RAMM|Data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~10_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \RAMM|Data~10_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~10_combout\);

-- Location: LCCOMB_X22_Y18_N6
\RAMM|Data~360\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~360_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~42_combout\) # ((\MAR|temp\(0))))) # (!\MAR|temp\(1) & (((!\MAR|temp\(0) & \RAMM|Data~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~42_combout\,
	datab => \MAR|temp\(1),
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~10_combout\,
	combout => \RAMM|Data~360_combout\);

-- Location: LCCOMB_X22_Y18_N20
\RAMM|Data~361\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~361_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~360_combout\ & ((\RAMM|Data~58_combout\))) # (!\RAMM|Data~360_combout\ & (\RAMM|Data~26_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~360_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~26_combout\,
	datac => \RAMM|Data~58_combout\,
	datad => \RAMM|Data~360_combout\,
	combout => \RAMM|Data~361_combout\);

-- Location: LCCOMB_X22_Y18_N22
\RAMM|Data~362\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~362_combout\ = (\MAR|temp\(3) & ((\MAR|temp\(2)) # ((\RAMM|Data~359_combout\)))) # (!\MAR|temp\(3) & (!\MAR|temp\(2) & ((\RAMM|Data~361_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~359_combout\,
	datad => \RAMM|Data~361_combout\,
	combout => \RAMM|Data~362_combout\);

-- Location: LCCOMB_X25_Y14_N10
\RAMM|Data~250\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~250_combout\ = (\rtl~15_combout\ & (\Input[10]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~250_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[10]~input_o\,
	datac => \rtl~15_combout\,
	datad => \RAMM|Data~250_combout\,
	combout => \RAMM|Data~250_combout\);

-- Location: LCCOMB_X22_Y19_N0
\RAMM|Data~234\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~234_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~234_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[10]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~234_combout\,
	combout => \RAMM|Data~234_combout\);

-- Location: LCCOMB_X23_Y15_N0
\RAMM|Data~202\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~202_combout\ = (\rtl~14_combout\ & (\Input[10]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~202_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[10]~input_o\,
	datab => \RAMM|Data~202_combout\,
	datad => \rtl~14_combout\,
	combout => \RAMM|Data~202_combout\);

-- Location: LCCOMB_X23_Y15_N2
\RAMM|Data~218\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~218_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[10]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~218_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[10]~input_o\,
	datab => \RAMM|Data~218_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~218_combout\);

-- Location: LCCOMB_X23_Y15_N26
\RAMM|Data~363\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~363_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1)) # (\RAMM|Data~218_combout\)))) # (!\MAR|temp\(0) & (\RAMM|Data~202_combout\ & (!\MAR|temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~202_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~218_combout\,
	combout => \RAMM|Data~363_combout\);

-- Location: LCCOMB_X22_Y18_N0
\RAMM|Data~364\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~364_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~363_combout\ & (\RAMM|Data~250_combout\)) # (!\RAMM|Data~363_combout\ & ((\RAMM|Data~234_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~363_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(1),
	datab => \RAMM|Data~250_combout\,
	datac => \RAMM|Data~234_combout\,
	datad => \RAMM|Data~363_combout\,
	combout => \RAMM|Data~364_combout\);

-- Location: LCCOMB_X22_Y18_N10
\RAMM|Data~365\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~365_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~362_combout\ & ((\RAMM|Data~364_combout\))) # (!\RAMM|Data~362_combout\ & (\RAMM|Data~357_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~362_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~357_combout\,
	datac => \RAMM|Data~362_combout\,
	datad => \RAMM|Data~364_combout\,
	combout => \RAMM|Data~365_combout\);

-- Location: LCCOMB_X22_Y18_N12
\RAMM|DO[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(10) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~365_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(10),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~365_combout\,
	combout => \RAMM|DO\(10));

-- Location: LCCOMB_X22_Y18_N4
\DR|temp[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DR|temp[10]~feeder_combout\ = \RAMM|DO\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RAMM|DO\(10),
	combout => \DR|temp[10]~feeder_combout\);

-- Location: FF_X22_Y18_N5
\DR|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \DR|temp[10]~feeder_combout\,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(10));

-- Location: LCCOMB_X22_Y10_N8
\d|D_OUT[10]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[10]~12_combout\ = ((\A|DO\(10)) # ((\DR|temp\(10) & \d|Equal0~4_combout\))) # (!\CTRLM|ESUM~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DR|temp\(10),
	datab => \CTRLM|ESUM~1_combout\,
	datac => \A|DO\(10),
	datad => \d|Equal0~4_combout\,
	combout => \d|D_OUT[10]~12_combout\);

-- Location: FF_X22_Y10_N9
\ACC|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[10]~12_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(10));

-- Location: LCCOMB_X22_Y7_N26
\A|temp~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~27_combout\ = (\IR|WideOr3~2_combout\ & (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(10)) # (\d|D_OUT[10]~12_combout\)))) # (!\IR|WideOr3~2_combout\ & ((\IR|WideOr1~1_combout\) # ((\ACC|temp\(10) & \d|D_OUT[10]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(10),
	datab => \IR|WideOr3~2_combout\,
	datac => \IR|WideOr1~1_combout\,
	datad => \d|D_OUT[10]~12_combout\,
	combout => \A|temp~27_combout\);

-- Location: LCCOMB_X22_Y7_N0
\A|temp~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~28_combout\ = (\A|temp~27_combout\ & (((\A|Add0~20_combout\)) # (!\IR|WideOr1~1_combout\))) # (!\A|temp~27_combout\ & (\IR|WideOr1~1_combout\ & ((\A|Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~27_combout\,
	datab => \IR|WideOr1~1_combout\,
	datac => \A|Add0~20_combout\,
	datad => \A|Add1~20_combout\,
	combout => \A|temp~28_combout\);

-- Location: LCCOMB_X22_Y7_N10
\A|temp~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~29_combout\ = (\A|temp~19_combout\ & (((\A|temp~28_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~20_combout\ & (\IR|WideOr0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~20_combout\,
	datab => \A|temp~19_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~28_combout\,
	combout => \A|temp~29_combout\);

-- Location: LCCOMB_X22_Y7_N28
\A|temp~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~30_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~29_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(10) $ (((\d|D_OUT[10]~12_combout\) # (\A|temp~29_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(10),
	datab => \d|D_OUT[10]~12_combout\,
	datac => \IR|WideOr0~3_combout\,
	datad => \A|temp~29_combout\,
	combout => \A|temp~30_combout\);

-- Location: LCCOMB_X22_Y7_N6
\A|temp[10]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[10]~86_combout\ = (\A|temp~22_combout\ & ((\d|D_OUT[10]~12_combout\ $ (\ACC|temp\(10))))) # (!\A|temp~22_combout\ & (\A|temp~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~30_combout\,
	datab => \d|D_OUT[10]~12_combout\,
	datac => \A|temp~22_combout\,
	datad => \ACC|temp\(10),
	combout => \A|temp[10]~86_combout\);

-- Location: LCCOMB_X22_Y7_N24
\A|temp[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(10) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[10]~86_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp[10]~86_combout\,
	datac => \A|temp[0]~85clkctrl_outclk\,
	datad => \A|temp\(10),
	combout => \A|temp\(10));

-- Location: LCCOMB_X22_Y7_N30
\A|temp~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~31_combout\ = (\A|temp~22_combout\ & (\A|temp\(10))) # (!\A|temp~22_combout\ & ((\A|temp~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp\(10),
	datac => \A|temp~22_combout\,
	datad => \A|temp~30_combout\,
	combout => \A|temp~31_combout\);

-- Location: LCCOMB_X22_Y7_N2
\A|DO[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(10) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|temp~31_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|DO\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|DO\(10),
	datac => \A|temp~31_combout\,
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(10));

-- Location: LCCOMB_X23_Y9_N4
\d|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|Equal0~5_combout\ = (!\A|DO\(10) & (\CTRLM|ESUM~1_combout\ & \d|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(10),
	datab => \CTRLM|ESUM~1_combout\,
	datad => \d|Equal0~4_combout\,
	combout => \d|Equal0~5_combout\);

-- Location: IOIBUF_X28_Y24_N1
\Input[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(3),
	o => \Input[3]~input_o\);

-- Location: LCCOMB_X24_Y15_N24
\RAMM|Data~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~83_combout\ = (\rtl~4_combout\ & (\Input[3]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~83_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~4_combout\,
	datac => \Input[3]~input_o\,
	datad => \RAMM|Data~83_combout\,
	combout => \RAMM|Data~83_combout\);

-- Location: LCCOMB_X26_Y14_N18
\RAMM|Data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~19_combout\ = (\rtl~9_combout\ & (\Input[3]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~9_combout\,
	datac => \Input[3]~input_o\,
	datad => \RAMM|Data~19_combout\,
	combout => \RAMM|Data~19_combout\);

-- Location: LCCOMB_X24_Y17_N0
\RAMM|Data~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~147_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[3]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~147_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datab => \RAMM|Data~147_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~147_combout\);

-- Location: LCCOMB_X24_Y17_N30
\RAMM|Data~286\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~286_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2)) # (\RAMM|Data~147_combout\)))) # (!\MAR|temp\(3) & (\RAMM|Data~19_combout\ & (!\MAR|temp\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~19_combout\,
	datab => \MAR|temp\(3),
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~147_combout\,
	combout => \RAMM|Data~286_combout\);

-- Location: LCCOMB_X23_Y17_N20
\RAMM|Data~211\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~211_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[3]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~211_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datab => \RAMM|Data~211_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~211_combout\);

-- Location: LCCOMB_X24_Y17_N4
\RAMM|Data~287\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~287_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~286_combout\ & ((\RAMM|Data~211_combout\))) # (!\RAMM|Data~286_combout\ & (\RAMM|Data~83_combout\)))) # (!\MAR|temp\(2) & (((\RAMM|Data~286_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~83_combout\,
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~286_combout\,
	datad => \RAMM|Data~211_combout\,
	combout => \RAMM|Data~287_combout\);

-- Location: LCCOMB_X25_Y14_N24
\RAMM|Data~243\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~243_combout\ = (\rtl~15_combout\ & (\Input[3]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~243_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datab => \rtl~15_combout\,
	datad => \RAMM|Data~243_combout\,
	combout => \RAMM|Data~243_combout\);

-- Location: LCCOMB_X24_Y15_N30
\RAMM|Data~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~115_combout\ = (\rtl~7_combout\ & ((\Input[3]~input_o\))) # (!\rtl~7_combout\ & (\RAMM|Data~115_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~115_combout\,
	datac => \Input[3]~input_o\,
	datad => \rtl~7_combout\,
	combout => \RAMM|Data~115_combout\);

-- Location: LCCOMB_X24_Y17_N2
\RAMM|Data~179\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~179_combout\ = (\rtl~3_combout\ & (\Input[3]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~179_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~3_combout\,
	datac => \Input[3]~input_o\,
	datad => \RAMM|Data~179_combout\,
	combout => \RAMM|Data~179_combout\);

-- Location: LCCOMB_X23_Y17_N22
\RAMM|Data~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~51_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[3]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~51_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datac => \RAMM|Data~51_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~51_combout\);

-- Location: LCCOMB_X24_Y17_N24
\RAMM|Data~293\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~293_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~179_combout\) # ((\MAR|temp\(2))))) # (!\MAR|temp\(3) & (((\RAMM|Data~51_combout\ & !\MAR|temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~179_combout\,
	datab => \RAMM|Data~51_combout\,
	datac => \MAR|temp\(3),
	datad => \MAR|temp\(2),
	combout => \RAMM|Data~293_combout\);

-- Location: LCCOMB_X24_Y17_N26
\RAMM|Data~294\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~294_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~293_combout\ & (\RAMM|Data~243_combout\)) # (!\RAMM|Data~293_combout\ & ((\RAMM|Data~115_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~293_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~243_combout\,
	datab => \RAMM|Data~115_combout\,
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~293_combout\,
	combout => \RAMM|Data~294_combout\);

-- Location: LCCOMB_X24_Y19_N28
\RAMM|Data~227\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~227_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[3]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~227_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~227_combout\,
	combout => \RAMM|Data~227_combout\);

-- Location: LCCOMB_X24_Y15_N28
\RAMM|Data~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~99_combout\ = (\rtl~5_combout\ & (\Input[3]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~99_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[3]~input_o\,
	datac => \rtl~5_combout\,
	datad => \RAMM|Data~99_combout\,
	combout => \RAMM|Data~99_combout\);

-- Location: LCCOMB_X25_Y15_N10
\RAMM|Data~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~35_combout\ = (\rtl~8_combout\ & (\Input[3]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~8_combout\,
	datac => \Input[3]~input_o\,
	datad => \RAMM|Data~35_combout\,
	combout => \RAMM|Data~35_combout\);

-- Location: LCCOMB_X24_Y17_N14
\RAMM|Data~288\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~288_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2))))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~99_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~35_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~99_combout\,
	datab => \RAMM|Data~35_combout\,
	datac => \MAR|temp\(3),
	datad => \MAR|temp\(2),
	combout => \RAMM|Data~288_combout\);

-- Location: LCCOMB_X23_Y18_N30
\RAMM|Data~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~163_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\Input[3]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\RAMM|Data~163_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[3]~input_o\,
	datac => \RAMM|Data~163_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~163_combout\);

-- Location: LCCOMB_X24_Y17_N8
\RAMM|Data~289\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~289_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~288_combout\ & (\RAMM|Data~227_combout\)) # (!\RAMM|Data~288_combout\ & ((\RAMM|Data~163_combout\))))) # (!\MAR|temp\(3) & (((\RAMM|Data~288_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~227_combout\,
	datab => \MAR|temp\(3),
	datac => \RAMM|Data~288_combout\,
	datad => \RAMM|Data~163_combout\,
	combout => \RAMM|Data~289_combout\);

-- Location: LCCOMB_X25_Y15_N12
\RAMM|Data~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~131_combout\ = (\rtl~2_combout\ & (\Input[3]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~131_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[3]~input_o\,
	datac => \rtl~2_combout\,
	datad => \RAMM|Data~131_combout\,
	combout => \RAMM|Data~131_combout\);

-- Location: LCCOMB_X24_Y17_N16
\RAMM|Data~195\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~195_combout\ = (\rtl~14_combout\ & (\Input[3]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~195_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~14_combout\,
	datac => \Input[3]~input_o\,
	datad => \RAMM|Data~195_combout\,
	combout => \RAMM|Data~195_combout\);

-- Location: LCCOMB_X23_Y18_N4
\RAMM|Data~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~67_combout\ = (\rtl~6_combout\ & (\Input[3]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~67_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Input[3]~input_o\,
	datac => \rtl~6_combout\,
	datad => \RAMM|Data~67_combout\,
	combout => \RAMM|Data~67_combout\);

-- Location: LCCOMB_X24_Y17_N10
\RAMM|Data~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~3_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & ((\Input[3]~input_o\))) # (!GLOBAL(\rtl~10clkctrl_outclk\) & (\RAMM|Data~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~3_combout\,
	datac => \Input[3]~input_o\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \RAMM|Data~3_combout\);

-- Location: LCCOMB_X24_Y17_N6
\RAMM|Data~290\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~290_combout\ = (\MAR|temp\(3) & (((\MAR|temp\(2))))) # (!\MAR|temp\(3) & ((\MAR|temp\(2) & (\RAMM|Data~67_combout\)) # (!\MAR|temp\(2) & ((\RAMM|Data~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~67_combout\,
	datab => \MAR|temp\(3),
	datac => \MAR|temp\(2),
	datad => \RAMM|Data~3_combout\,
	combout => \RAMM|Data~290_combout\);

-- Location: LCCOMB_X24_Y17_N20
\RAMM|Data~291\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~291_combout\ = (\MAR|temp\(3) & ((\RAMM|Data~290_combout\ & ((\RAMM|Data~195_combout\))) # (!\RAMM|Data~290_combout\ & (\RAMM|Data~131_combout\)))) # (!\MAR|temp\(3) & (((\RAMM|Data~290_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~131_combout\,
	datab => \RAMM|Data~195_combout\,
	datac => \MAR|temp\(3),
	datad => \RAMM|Data~290_combout\,
	combout => \RAMM|Data~291_combout\);

-- Location: LCCOMB_X24_Y17_N18
\RAMM|Data~292\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~292_combout\ = (\MAR|temp\(0) & (\MAR|temp\(1))) # (!\MAR|temp\(0) & ((\MAR|temp\(1) & (\RAMM|Data~289_combout\)) # (!\MAR|temp\(1) & ((\RAMM|Data~291_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~289_combout\,
	datad => \RAMM|Data~291_combout\,
	combout => \RAMM|Data~292_combout\);

-- Location: LCCOMB_X24_Y17_N28
\RAMM|Data~295\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~295_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~292_combout\ & ((\RAMM|Data~294_combout\))) # (!\RAMM|Data~292_combout\ & (\RAMM|Data~287_combout\)))) # (!\MAR|temp\(0) & (((\RAMM|Data~292_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(0),
	datab => \RAMM|Data~287_combout\,
	datac => \RAMM|Data~294_combout\,
	datad => \RAMM|Data~292_combout\,
	combout => \RAMM|Data~295_combout\);

-- Location: LCCOMB_X24_Y17_N22
\RAMM|DO[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(3) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~295_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|DO\(3),
	datac => \RAMM|DO[15]~0clkctrl_outclk\,
	datad => \RAMM|Data~295_combout\,
	combout => \RAMM|DO\(3));

-- Location: FF_X24_Y17_N1
\DR|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(3),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(3));

-- Location: LCCOMB_X23_Y9_N30
\d|D_OUT[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[3]~5_combout\ = (\A|DO\(3)) # (((\d|Equal0~5_combout\ & \DR|temp\(3))) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d|Equal0~5_combout\,
	datab => \DR|temp\(3),
	datac => \A|DO\(3),
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[3]~5_combout\);

-- Location: FF_X22_Y10_N7
\IR|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[3]~5_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(3));

-- Location: LCCOMB_X22_Y10_N12
\IR|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal9~0_combout\ = (!\IR|temp\(3) & (\IR|temp\(6) & (\IR|Equal0~4_combout\ & \IR|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(3),
	datab => \IR|temp\(6),
	datac => \IR|Equal0~4_combout\,
	datad => \IR|Equal0~3_combout\,
	combout => \IR|Equal9~0_combout\);

-- Location: LCCOMB_X22_Y9_N8
\CTRLM|Code4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|Code4~0_combout\ = (!\IR|Equal9~0_combout\ & (\IR|WideOr0~2_combout\ & (\A|temp~16_combout\ & \IR|WideOr1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal9~0_combout\,
	datab => \IR|WideOr0~2_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|WideOr1~0_combout\,
	combout => \CTRLM|Code4~0_combout\);

-- Location: LCCOMB_X22_Y9_N28
\CTRLM|ESUM~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|ESUM~0_combout\ = (\CTRLM|T4~2_combout\ & ((\CTRLM|Code4~0_combout\) # ((\CTRLM|Code8~0_combout\ & \IR|WideOr3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T4~2_combout\,
	datab => \CTRLM|Code4~0_combout\,
	datac => \CTRLM|Code8~0_combout\,
	datad => \IR|WideOr3~1_combout\,
	combout => \CTRLM|ESUM~0_combout\);

-- Location: LCCOMB_X22_Y9_N22
\CTRLM|W~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|W~0_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|ESUM~0_combout\) # ((\CTRLM|IPC~1_combout\ & \CTRLM|T6~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|ESUM~0_combout\,
	datab => \CTRLM|IPC~1_combout\,
	datac => \CTRLM|T6~combout\,
	datad => \CTRLM|Code15~combout\,
	combout => \CTRLM|W~0_combout\);

-- Location: FF_X23_Y9_N9
\ACC|temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	d => \d|D_OUT[14]~16_combout\,
	ena => \CTRLM|W~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ACC|temp\(14));

-- Location: LCCOMB_X25_Y8_N4
\A|temp~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~43_combout\ = (\IR|WideOr1~1_combout\ & (((!\IR|WideOr3~2_combout\)))) # (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(14) & ((\d|D_OUT[14]~16_combout\) # (\IR|WideOr3~2_combout\))) # (!\ACC|temp\(14) & (\d|D_OUT[14]~16_combout\ & 
-- \IR|WideOr3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \IR|WideOr1~1_combout\,
	datac => \d|D_OUT[14]~16_combout\,
	datad => \IR|WideOr3~2_combout\,
	combout => \A|temp~43_combout\);

-- Location: LCCOMB_X25_Y8_N6
\A|temp~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~44_combout\ = (\IR|WideOr1~1_combout\ & ((\A|temp~43_combout\ & (\A|Add0~28_combout\)) # (!\A|temp~43_combout\ & ((\A|Add1~28_combout\))))) # (!\IR|WideOr1~1_combout\ & (\A|temp~43_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \A|temp~43_combout\,
	datac => \A|Add0~28_combout\,
	datad => \A|Add1~28_combout\,
	combout => \A|temp~44_combout\);

-- Location: LCCOMB_X25_Y8_N28
\A|temp~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~45_combout\ = (\IR|WideOr0~3_combout\ & ((\A|temp~19_combout\ & ((\A|temp~44_combout\))) # (!\A|temp~19_combout\ & (\A|Add2~28_combout\)))) # (!\IR|WideOr0~3_combout\ & (((\A|temp~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \A|Add2~28_combout\,
	datac => \A|temp~19_combout\,
	datad => \A|temp~44_combout\,
	combout => \A|temp~45_combout\);

-- Location: LCCOMB_X25_Y8_N2
\A|temp~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~46_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~45_combout\)))) # (!\IR|WideOr0~3_combout\ & (\ACC|temp\(14) $ (((\d|D_OUT[14]~16_combout\) # (\A|temp~45_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \IR|WideOr0~3_combout\,
	datac => \d|D_OUT[14]~16_combout\,
	datad => \A|temp~45_combout\,
	combout => \A|temp~46_combout\);

-- Location: LCCOMB_X25_Y8_N24
\A|temp[14]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[14]~88_combout\ = (\A|temp~22_combout\ & (\ACC|temp\(14) $ (((\d|D_OUT[14]~16_combout\))))) # (!\A|temp~22_combout\ & (((\A|temp~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \A|temp~46_combout\,
	datac => \A|temp~22_combout\,
	datad => \d|D_OUT[14]~16_combout\,
	combout => \A|temp[14]~88_combout\);

-- Location: LCCOMB_X25_Y8_N8
\A|temp[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(14) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp[14]~88_combout\)) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp[14]~88_combout\,
	datac => \A|temp\(14),
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(14));

-- Location: LCCOMB_X25_Y8_N12
\A|temp~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~47_combout\ = (\A|temp~22_combout\ & (\A|temp\(14))) # (!\A|temp~22_combout\ & ((\A|temp~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp\(14),
	datad => \A|temp~46_combout\,
	combout => \A|temp~47_combout\);

-- Location: LCCOMB_X24_Y7_N26
\A|DO[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(14) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~47_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~47_combout\,
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|DO\(14),
	combout => \A|DO\(14));

-- Location: IOIBUF_X0_Y18_N15
\Input[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input(14),
	o => \Input[14]~input_o\);

-- Location: LCCOMB_X22_Y13_N2
\RAMM|Data~254\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~254_combout\ = (\rtl~15_combout\ & (\Input[14]~input_o\)) # (!\rtl~15_combout\ & ((\RAMM|Data~254_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~15_combout\,
	datad => \RAMM|Data~254_combout\,
	combout => \RAMM|Data~254_combout\);

-- Location: LCCOMB_X22_Y13_N0
\RAMM|Data~238\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~238_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\Input[14]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\RAMM|Data~238_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \RAMM|Data~238_combout\,
	combout => \RAMM|Data~238_combout\);

-- Location: LCCOMB_X22_Y13_N26
\RAMM|Data~222\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~222_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\Input[14]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\RAMM|Data~222_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \RAMM|Data~222_combout\,
	datad => \rtl~12clkctrl_outclk\,
	combout => \RAMM|Data~222_combout\);

-- Location: LCCOMB_X22_Y13_N16
\RAMM|Data~206\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~206_combout\ = (\rtl~14_combout\ & (\Input[14]~input_o\)) # (!\rtl~14_combout\ & ((\RAMM|Data~206_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~14_combout\,
	datad => \RAMM|Data~206_combout\,
	combout => \RAMM|Data~206_combout\);

-- Location: LCCOMB_X22_Y13_N14
\RAMM|Data~403\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~403_combout\ = (\MAR|temp\(1) & (((\MAR|temp\(0))))) # (!\MAR|temp\(1) & ((\MAR|temp\(0) & (\RAMM|Data~222_combout\)) # (!\MAR|temp\(0) & ((\RAMM|Data~206_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~222_combout\,
	datab => \MAR|temp\(1),
	datac => \RAMM|Data~206_combout\,
	datad => \MAR|temp\(0),
	combout => \RAMM|Data~403_combout\);

-- Location: LCCOMB_X22_Y13_N4
\RAMM|Data~404\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~404_combout\ = (\RAMM|Data~403_combout\ & ((\RAMM|Data~254_combout\) # ((!\MAR|temp\(1))))) # (!\RAMM|Data~403_combout\ & (((\RAMM|Data~238_combout\ & \MAR|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~254_combout\,
	datab => \RAMM|Data~238_combout\,
	datac => \RAMM|Data~403_combout\,
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~404_combout\);

-- Location: LCCOMB_X21_Y13_N20
\RAMM|Data~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~126_combout\ = (\rtl~7_combout\ & (\Input[14]~input_o\)) # (!\rtl~7_combout\ & ((\RAMM|Data~126_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~7_combout\,
	datad => \RAMM|Data~126_combout\,
	combout => \RAMM|Data~126_combout\);

-- Location: LCCOMB_X21_Y13_N18
\RAMM|Data~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~110_combout\ = (\rtl~5_combout\ & (\Input[14]~input_o\)) # (!\rtl~5_combout\ & ((\RAMM|Data~110_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datab => \rtl~5_combout\,
	datad => \RAMM|Data~110_combout\,
	combout => \RAMM|Data~110_combout\);

-- Location: LCCOMB_X21_Y13_N22
\RAMM|Data~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~78_combout\ = (\rtl~6_combout\ & (\Input[14]~input_o\)) # (!\rtl~6_combout\ & ((\RAMM|Data~78_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \RAMM|Data~78_combout\,
	datad => \rtl~6_combout\,
	combout => \RAMM|Data~78_combout\);

-- Location: LCCOMB_X21_Y13_N12
\RAMM|Data~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~94_combout\ = (\rtl~4_combout\ & (\Input[14]~input_o\)) # (!\rtl~4_combout\ & ((\RAMM|Data~94_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~4_combout\,
	datad => \RAMM|Data~94_combout\,
	combout => \RAMM|Data~94_combout\);

-- Location: LCCOMB_X21_Y13_N10
\RAMM|Data~396\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~396_combout\ = (\MAR|temp\(0) & (((\RAMM|Data~94_combout\) # (\MAR|temp\(1))))) # (!\MAR|temp\(0) & (\RAMM|Data~78_combout\ & ((!\MAR|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~78_combout\,
	datab => \RAMM|Data~94_combout\,
	datac => \MAR|temp\(0),
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~396_combout\);

-- Location: LCCOMB_X21_Y13_N16
\RAMM|Data~397\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~397_combout\ = (\MAR|temp\(1) & ((\RAMM|Data~396_combout\ & (\RAMM|Data~126_combout\)) # (!\RAMM|Data~396_combout\ & ((\RAMM|Data~110_combout\))))) # (!\MAR|temp\(1) & (((\RAMM|Data~396_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~126_combout\,
	datab => \RAMM|Data~110_combout\,
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~396_combout\,
	combout => \RAMM|Data~397_combout\);

-- Location: LCCOMB_X22_Y14_N20
\RAMM|Data~190\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~190_combout\ = (\rtl~3_combout\ & (\Input[14]~input_o\)) # (!\rtl~3_combout\ & ((\RAMM|Data~190_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~3_combout\,
	datad => \RAMM|Data~190_combout\,
	combout => \RAMM|Data~190_combout\);

-- Location: LCCOMB_X21_Y13_N26
\RAMM|Data~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~158_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\Input[14]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\RAMM|Data~158_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \RAMM|Data~158_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \RAMM|Data~158_combout\);

-- Location: LCCOMB_X22_Y13_N12
\RAMM|Data~174\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~174_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & ((\Input[14]~input_o\))) # (!GLOBAL(\rtl~0clkctrl_outclk\) & (\RAMM|Data~174_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~174_combout\,
	datab => \Input[14]~input_o\,
	datac => \rtl~0clkctrl_outclk\,
	combout => \RAMM|Data~174_combout\);

-- Location: LCCOMB_X22_Y13_N6
\RAMM|Data~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~142_combout\ = (\rtl~2_combout\ & (\Input[14]~input_o\)) # (!\rtl~2_combout\ & ((\RAMM|Data~142_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~2_combout\,
	datad => \RAMM|Data~142_combout\,
	combout => \RAMM|Data~142_combout\);

-- Location: LCCOMB_X22_Y13_N24
\RAMM|Data~398\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~398_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1))))) # (!\MAR|temp\(0) & ((\MAR|temp\(1) & (\RAMM|Data~174_combout\)) # (!\MAR|temp\(1) & ((\RAMM|Data~142_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~174_combout\,
	datab => \RAMM|Data~142_combout\,
	datac => \MAR|temp\(0),
	datad => \MAR|temp\(1),
	combout => \RAMM|Data~398_combout\);

-- Location: LCCOMB_X22_Y13_N22
\RAMM|Data~399\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~399_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~398_combout\ & (\RAMM|Data~190_combout\)) # (!\RAMM|Data~398_combout\ & ((\RAMM|Data~158_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~398_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~190_combout\,
	datab => \RAMM|Data~158_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~398_combout\,
	combout => \RAMM|Data~399_combout\);

-- Location: LCCOMB_X22_Y16_N30
\RAMM|Data~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~62_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\Input[14]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\RAMM|Data~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \RAMM|Data~62_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \RAMM|Data~62_combout\);

-- Location: LCCOMB_X26_Y14_N8
\RAMM|Data~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~30_combout\ = (\rtl~9_combout\ & (\Input[14]~input_o\)) # (!\rtl~9_combout\ & ((\RAMM|Data~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \RAMM|Data~30_combout\,
	datad => \rtl~9_combout\,
	combout => \RAMM|Data~30_combout\);

-- Location: LCCOMB_X22_Y15_N0
\RAMM|Data~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~46_combout\ = (\rtl~8_combout\ & (\Input[14]~input_o\)) # (!\rtl~8_combout\ & ((\RAMM|Data~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~8_combout\,
	datad => \RAMM|Data~46_combout\,
	combout => \RAMM|Data~46_combout\);

-- Location: LCCOMB_X22_Y16_N20
\RAMM|Data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~14_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\Input[14]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\RAMM|Data~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input[14]~input_o\,
	datac => \rtl~10clkctrl_outclk\,
	datad => \RAMM|Data~14_combout\,
	combout => \RAMM|Data~14_combout\);

-- Location: LCCOMB_X22_Y16_N16
\RAMM|Data~400\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~400_combout\ = (\MAR|temp\(0) & (((\MAR|temp\(1))))) # (!\MAR|temp\(0) & ((\MAR|temp\(1) & (\RAMM|Data~46_combout\)) # (!\MAR|temp\(1) & ((\RAMM|Data~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~46_combout\,
	datab => \MAR|temp\(0),
	datac => \MAR|temp\(1),
	datad => \RAMM|Data~14_combout\,
	combout => \RAMM|Data~400_combout\);

-- Location: LCCOMB_X22_Y16_N22
\RAMM|Data~401\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~401_combout\ = (\MAR|temp\(0) & ((\RAMM|Data~400_combout\ & (\RAMM|Data~62_combout\)) # (!\RAMM|Data~400_combout\ & ((\RAMM|Data~30_combout\))))) # (!\MAR|temp\(0) & (((\RAMM|Data~400_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RAMM|Data~62_combout\,
	datab => \RAMM|Data~30_combout\,
	datac => \MAR|temp\(0),
	datad => \RAMM|Data~400_combout\,
	combout => \RAMM|Data~401_combout\);

-- Location: LCCOMB_X22_Y13_N28
\RAMM|Data~402\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~402_combout\ = (\MAR|temp\(3) & ((\MAR|temp\(2)) # ((\RAMM|Data~399_combout\)))) # (!\MAR|temp\(3) & (!\MAR|temp\(2) & ((\RAMM|Data~401_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(3),
	datab => \MAR|temp\(2),
	datac => \RAMM|Data~399_combout\,
	datad => \RAMM|Data~401_combout\,
	combout => \RAMM|Data~402_combout\);

-- Location: LCCOMB_X22_Y13_N30
\RAMM|Data~405\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|Data~405_combout\ = (\MAR|temp\(2) & ((\RAMM|Data~402_combout\ & (\RAMM|Data~404_combout\)) # (!\RAMM|Data~402_combout\ & ((\RAMM|Data~397_combout\))))) # (!\MAR|temp\(2) & (((\RAMM|Data~402_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MAR|temp\(2),
	datab => \RAMM|Data~404_combout\,
	datac => \RAMM|Data~397_combout\,
	datad => \RAMM|Data~402_combout\,
	combout => \RAMM|Data~405_combout\);

-- Location: LCCOMB_X22_Y12_N4
\RAMM|DO[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- \RAMM|DO\(14) = (GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & ((\RAMM|Data~405_combout\))) # (!GLOBAL(\RAMM|DO[15]~0clkctrl_outclk\) & (\RAMM|DO\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RAMM|DO\(14),
	datac => \RAMM|Data~405_combout\,
	datad => \RAMM|DO[15]~0clkctrl_outclk\,
	combout => \RAMM|DO\(14));

-- Location: FF_X23_Y9_N5
\DR|temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0clkctrl_outclk\,
	asdata => \RAMM|DO\(14),
	sload => VCC,
	ena => \CTRLM|IDR~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DR|temp\(14));

-- Location: LCCOMB_X23_Y9_N8
\d|D_OUT[14]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \d|D_OUT[14]~16_combout\ = (\A|DO\(14)) # (((\d|Equal0~5_combout\ & \DR|temp\(14))) # (!\CTRLM|ESUM~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|DO\(14),
	datab => \d|Equal0~5_combout\,
	datac => \DR|temp\(14),
	datad => \CTRLM|ESUM~1_combout\,
	combout => \d|D_OUT[14]~16_combout\);

-- Location: FF_X22_Y10_N25
\IR|temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CL|temp~0_combout\,
	asdata => \d|D_OUT[14]~16_combout\,
	sload => VCC,
	ena => \CTRLM|IIR~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|temp\(14));

-- Location: LCCOMB_X21_Y10_N12
\IR|Equal7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|Equal7~0_combout\ = (\IR|temp\(14) & (!\IR|temp\(7) & !\IR|temp\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|temp\(14),
	datab => \IR|temp\(7),
	datad => \IR|temp\(15),
	combout => \IR|Equal7~0_combout\);

-- Location: LCCOMB_X21_Y10_N6
\IR|WideOr0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|WideOr0~3_combout\ = (!\IR|Equal8~1_combout\ & (((!\IR|Equal6~1_combout\) # (!\IR|Equal7~1_combout\)) # (!\IR|Equal7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal7~0_combout\,
	datab => \IR|Equal7~1_combout\,
	datac => \IR|Equal8~1_combout\,
	datad => \IR|Equal6~1_combout\,
	combout => \IR|WideOr0~3_combout\);

-- Location: LCCOMB_X25_Y8_N20
\A|temp~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~22_combout\ = (\IR|Equal9~0_combout\) # ((\IR|WideOr0~3_combout\ & (\A|temp~16_combout\ & \IR|WideOr1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \IR|Equal9~0_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|WideOr1~1_combout\,
	combout => \A|temp~22_combout\);

-- Location: LCCOMB_X23_Y7_N16
\A|temp~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~75_combout\ = (\IR|WideOr3~2_combout\ & (!\IR|WideOr1~1_combout\ & ((\ACC|temp\(0)) # (\d|D_OUT[0]~1_combout\)))) # (!\IR|WideOr3~2_combout\ & ((\IR|WideOr1~1_combout\) # ((\ACC|temp\(0) & \d|D_OUT[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr3~2_combout\,
	datab => \ACC|temp\(0),
	datac => \IR|WideOr1~1_combout\,
	datad => \d|D_OUT[0]~1_combout\,
	combout => \A|temp~75_combout\);

-- Location: LCCOMB_X23_Y7_N30
\A|temp~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~76_combout\ = (\IR|WideOr1~1_combout\ & ((\A|temp~75_combout\ & ((\A|Add0~0_combout\))) # (!\A|temp~75_combout\ & (\A|Add1~0_combout\)))) # (!\IR|WideOr1~1_combout\ & (\A|temp~75_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr1~1_combout\,
	datab => \A|temp~75_combout\,
	datac => \A|Add1~0_combout\,
	datad => \A|Add0~0_combout\,
	combout => \A|temp~76_combout\);

-- Location: LCCOMB_X23_Y7_N4
\A|temp~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~77_combout\ = (\A|temp~19_combout\ & (((\A|temp~76_combout\) # (!\IR|WideOr0~3_combout\)))) # (!\A|temp~19_combout\ & (\A|Add2~0_combout\ & ((\IR|WideOr0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~19_combout\,
	datab => \A|Add2~0_combout\,
	datac => \A|temp~76_combout\,
	datad => \IR|WideOr0~3_combout\,
	combout => \A|temp~77_combout\);

-- Location: LCCOMB_X23_Y7_N2
\A|temp~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~78_combout\ = (\IR|WideOr0~3_combout\ & (((\A|temp~77_combout\)))) # (!\IR|WideOr0~3_combout\ & ((\A|temp~77_combout\ & (!\ACC|temp\(0))) # (!\A|temp~77_combout\ & ((\A|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~3_combout\,
	datab => \ACC|temp\(0),
	datac => \A|temp~77_combout\,
	datad => \A|Add0~0_combout\,
	combout => \A|temp~78_combout\);

-- Location: LCCOMB_X23_Y7_N14
\A|temp[0]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp[0]~92_combout\ = (\A|temp~22_combout\ & ((\A|Add0~0_combout\))) # (!\A|temp~22_combout\ & (\A|temp~78_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp~22_combout\,
	datac => \A|temp~78_combout\,
	datad => \A|Add0~0_combout\,
	combout => \A|temp[0]~92_combout\);

-- Location: LCCOMB_X23_Y7_N0
\A|temp[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp\(0) = (GLOBAL(\A|temp[0]~85clkctrl_outclk\) & ((\A|temp[0]~92_combout\))) # (!GLOBAL(\A|temp[0]~85clkctrl_outclk\) & (\A|temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp\(0),
	datac => \A|temp[0]~92_combout\,
	datad => \A|temp[0]~85clkctrl_outclk\,
	combout => \A|temp\(0));

-- Location: LCCOMB_X23_Y7_N12
\A|temp~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|temp~79_combout\ = (\A|temp~22_combout\ & (\A|temp\(0))) # (!\A|temp~22_combout\ & ((\A|temp~78_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|temp\(0),
	datac => \A|temp~22_combout\,
	datad => \A|temp~78_combout\,
	combout => \A|temp~79_combout\);

-- Location: LCCOMB_X23_Y6_N26
\A|DO[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|DO\(0) = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|temp~79_combout\)) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|DO\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~79_combout\,
	datac => \A|DO\(0),
	datad => \CTRLM|R~0clkctrl_outclk\,
	combout => \A|DO\(0));

-- Location: LCCOMB_X24_Y7_N30
\A|Equal8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Equal8~2_combout\ = (!\A|temp~66_combout\ & (!\A|temp~55_combout\ & (!\A|temp~63_combout\ & !\A|temp~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~66_combout\,
	datab => \A|temp~55_combout\,
	datac => \A|temp~63_combout\,
	datad => \A|temp~58_combout\,
	combout => \A|Equal8~2_combout\);

-- Location: LCCOMB_X24_Y7_N8
\A|Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Equal8~0_combout\ = (!\A|temp~26_combout\ & (!\A|temp~23_combout\ & (!\A|temp~31_combout\ & !\A|temp~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~26_combout\,
	datab => \A|temp~23_combout\,
	datac => \A|temp~31_combout\,
	datad => \A|temp~34_combout\,
	combout => \A|Equal8~0_combout\);

-- Location: LCCOMB_X24_Y7_N4
\A|Equal8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Equal8~3_combout\ = (!\A|temp~79_combout\ & (!\A|temp~71_combout\ & (!\A|temp~82_combout\ & !\A|temp~74_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~79_combout\,
	datab => \A|temp~71_combout\,
	datac => \A|temp~82_combout\,
	datad => \A|temp~74_combout\,
	combout => \A|Equal8~3_combout\);

-- Location: LCCOMB_X24_Y7_N28
\A|Equal8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Equal8~1_combout\ = (!\A|temp~50_combout\ & (!\A|temp~39_combout\ & (!\A|temp~47_combout\ & !\A|temp~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|temp~50_combout\,
	datab => \A|temp~39_combout\,
	datac => \A|temp~47_combout\,
	datad => \A|temp~42_combout\,
	combout => \A|Equal8~1_combout\);

-- Location: LCCOMB_X24_Y7_N10
\A|Equal8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Equal8~4_combout\ = (\A|Equal8~2_combout\ & (\A|Equal8~0_combout\ & (\A|Equal8~3_combout\ & \A|Equal8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Equal8~2_combout\,
	datab => \A|Equal8~0_combout\,
	datac => \A|Equal8~3_combout\,
	datad => \A|Equal8~1_combout\,
	combout => \A|Equal8~4_combout\);

-- Location: LCCOMB_X24_Y7_N20
\A|Zero\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Zero~combout\ = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|Equal8~4_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|Zero~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|Zero~combout\,
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|Equal8~4_combout\,
	combout => \A|Zero~combout\);

-- Location: LCCOMB_X19_Y7_N0
\A|Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~32_combout\ = \ACC|temp\(0) $ (VCC)
-- \A|Add2~33\ = CARRY(\ACC|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datad => VCC,
	combout => \A|Add2~32_combout\,
	cout => \A|Add2~33\);

-- Location: LCCOMB_X19_Y7_N2
\A|Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~34_combout\ = (\ACC|temp\(1) & (!\A|Add2~33\)) # (!\ACC|temp\(1) & ((\A|Add2~33\) # (GND)))
-- \A|Add2~35\ = CARRY((!\A|Add2~33\) # (!\ACC|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datad => VCC,
	cin => \A|Add2~33\,
	combout => \A|Add2~34_combout\,
	cout => \A|Add2~35\);

-- Location: LCCOMB_X19_Y7_N4
\A|Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~36_combout\ = (\ACC|temp\(2) & (\A|Add2~35\ $ (GND))) # (!\ACC|temp\(2) & (!\A|Add2~35\ & VCC))
-- \A|Add2~37\ = CARRY((\ACC|temp\(2) & !\A|Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(2),
	datad => VCC,
	cin => \A|Add2~35\,
	combout => \A|Add2~36_combout\,
	cout => \A|Add2~37\);

-- Location: LCCOMB_X19_Y7_N6
\A|Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~38_combout\ = (\ACC|temp\(3) & (!\A|Add2~37\)) # (!\ACC|temp\(3) & ((\A|Add2~37\) # (GND)))
-- \A|Add2~39\ = CARRY((!\A|Add2~37\) # (!\ACC|temp\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(3),
	datad => VCC,
	cin => \A|Add2~37\,
	combout => \A|Add2~38_combout\,
	cout => \A|Add2~39\);

-- Location: LCCOMB_X19_Y7_N8
\A|Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~40_combout\ = (\ACC|temp\(4) & (\A|Add2~39\ $ (GND))) # (!\ACC|temp\(4) & (!\A|Add2~39\ & VCC))
-- \A|Add2~41\ = CARRY((\ACC|temp\(4) & !\A|Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(4),
	datad => VCC,
	cin => \A|Add2~39\,
	combout => \A|Add2~40_combout\,
	cout => \A|Add2~41\);

-- Location: LCCOMB_X19_Y7_N10
\A|Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~42_combout\ = (\ACC|temp\(5) & (!\A|Add2~41\)) # (!\ACC|temp\(5) & ((\A|Add2~41\) # (GND)))
-- \A|Add2~43\ = CARRY((!\A|Add2~41\) # (!\ACC|temp\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|Add2~41\,
	combout => \A|Add2~42_combout\,
	cout => \A|Add2~43\);

-- Location: LCCOMB_X19_Y7_N12
\A|Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~44_combout\ = (\ACC|temp\(6) & (\A|Add2~43\ $ (GND))) # (!\ACC|temp\(6) & (!\A|Add2~43\ & VCC))
-- \A|Add2~45\ = CARRY((\ACC|temp\(6) & !\A|Add2~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(6),
	datad => VCC,
	cin => \A|Add2~43\,
	combout => \A|Add2~44_combout\,
	cout => \A|Add2~45\);

-- Location: LCCOMB_X19_Y7_N14
\A|Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~46_combout\ = (\ACC|temp\(7) & (!\A|Add2~45\)) # (!\ACC|temp\(7) & ((\A|Add2~45\) # (GND)))
-- \A|Add2~47\ = CARRY((!\A|Add2~45\) # (!\ACC|temp\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(7),
	datad => VCC,
	cin => \A|Add2~45\,
	combout => \A|Add2~46_combout\,
	cout => \A|Add2~47\);

-- Location: LCCOMB_X19_Y7_N16
\A|Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~48_combout\ = (\ACC|temp\(8) & (\A|Add2~47\ $ (GND))) # (!\ACC|temp\(8) & (!\A|Add2~47\ & VCC))
-- \A|Add2~49\ = CARRY((\ACC|temp\(8) & !\A|Add2~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(8),
	datad => VCC,
	cin => \A|Add2~47\,
	combout => \A|Add2~48_combout\,
	cout => \A|Add2~49\);

-- Location: LCCOMB_X19_Y7_N18
\A|Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~50_combout\ = (\ACC|temp\(9) & (!\A|Add2~49\)) # (!\ACC|temp\(9) & ((\A|Add2~49\) # (GND)))
-- \A|Add2~51\ = CARRY((!\A|Add2~49\) # (!\ACC|temp\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(9),
	datad => VCC,
	cin => \A|Add2~49\,
	combout => \A|Add2~50_combout\,
	cout => \A|Add2~51\);

-- Location: LCCOMB_X19_Y7_N20
\A|Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~52_combout\ = (\ACC|temp\(10) & (\A|Add2~51\ $ (GND))) # (!\ACC|temp\(10) & (!\A|Add2~51\ & VCC))
-- \A|Add2~53\ = CARRY((\ACC|temp\(10) & !\A|Add2~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|Add2~51\,
	combout => \A|Add2~52_combout\,
	cout => \A|Add2~53\);

-- Location: LCCOMB_X19_Y7_N22
\A|Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~54_combout\ = (\ACC|temp\(11) & (!\A|Add2~53\)) # (!\ACC|temp\(11) & ((\A|Add2~53\) # (GND)))
-- \A|Add2~55\ = CARRY((!\A|Add2~53\) # (!\ACC|temp\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(11),
	datad => VCC,
	cin => \A|Add2~53\,
	combout => \A|Add2~54_combout\,
	cout => \A|Add2~55\);

-- Location: LCCOMB_X19_Y7_N24
\A|Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~56_combout\ = (\ACC|temp\(12) & (\A|Add2~55\ $ (GND))) # (!\ACC|temp\(12) & (!\A|Add2~55\ & VCC))
-- \A|Add2~57\ = CARRY((\ACC|temp\(12) & !\A|Add2~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(12),
	datad => VCC,
	cin => \A|Add2~55\,
	combout => \A|Add2~56_combout\,
	cout => \A|Add2~57\);

-- Location: LCCOMB_X19_Y7_N26
\A|Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~58_combout\ = (\ACC|temp\(13) & (!\A|Add2~57\)) # (!\ACC|temp\(13) & ((\A|Add2~57\) # (GND)))
-- \A|Add2~59\ = CARRY((!\A|Add2~57\) # (!\ACC|temp\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(13),
	datad => VCC,
	cin => \A|Add2~57\,
	combout => \A|Add2~58_combout\,
	cout => \A|Add2~59\);

-- Location: LCCOMB_X19_Y7_N28
\A|Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~60_combout\ = (\ACC|temp\(14) & (\A|Add2~59\ $ (GND))) # (!\ACC|temp\(14) & (!\A|Add2~59\ & VCC))
-- \A|Add2~61\ = CARRY((\ACC|temp\(14) & !\A|Add2~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(14),
	datad => VCC,
	cin => \A|Add2~59\,
	combout => \A|Add2~60_combout\,
	cout => \A|Add2~61\);

-- Location: LCCOMB_X19_Y7_N30
\A|Add2~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add2~62_combout\ = \ACC|temp\(15) $ (\A|Add2~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(15),
	cin => \A|Add2~61\,
	combout => \A|Add2~62_combout\);

-- Location: LCCOMB_X18_Y7_N0
\A|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~1_cout\ = CARRY((\ACC|temp\(0) & !\A|Add2~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datab => \A|Add2~32_combout\,
	datad => VCC,
	cout => \A|LessThan3~1_cout\);

-- Location: LCCOMB_X18_Y7_N2
\A|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~3_cout\ = CARRY((\ACC|temp\(1) & (\A|Add2~34_combout\ & !\A|LessThan3~1_cout\)) # (!\ACC|temp\(1) & ((\A|Add2~34_combout\) # (!\A|LessThan3~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datab => \A|Add2~34_combout\,
	datad => VCC,
	cin => \A|LessThan3~1_cout\,
	cout => \A|LessThan3~3_cout\);

-- Location: LCCOMB_X18_Y7_N4
\A|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~5_cout\ = CARRY((\A|Add2~36_combout\ & (\ACC|temp\(2) & !\A|LessThan3~3_cout\)) # (!\A|Add2~36_combout\ & ((\ACC|temp\(2)) # (!\A|LessThan3~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~36_combout\,
	datab => \ACC|temp\(2),
	datad => VCC,
	cin => \A|LessThan3~3_cout\,
	cout => \A|LessThan3~5_cout\);

-- Location: LCCOMB_X18_Y7_N6
\A|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~7_cout\ = CARRY((\ACC|temp\(3) & (\A|Add2~38_combout\ & !\A|LessThan3~5_cout\)) # (!\ACC|temp\(3) & ((\A|Add2~38_combout\) # (!\A|LessThan3~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \A|Add2~38_combout\,
	datad => VCC,
	cin => \A|LessThan3~5_cout\,
	cout => \A|LessThan3~7_cout\);

-- Location: LCCOMB_X18_Y7_N8
\A|LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~9_cout\ = CARRY((\ACC|temp\(4) & ((!\A|LessThan3~7_cout\) # (!\A|Add2~40_combout\))) # (!\ACC|temp\(4) & (!\A|Add2~40_combout\ & !\A|LessThan3~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(4),
	datab => \A|Add2~40_combout\,
	datad => VCC,
	cin => \A|LessThan3~7_cout\,
	cout => \A|LessThan3~9_cout\);

-- Location: LCCOMB_X18_Y7_N10
\A|LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~11_cout\ = CARRY((\A|Add2~42_combout\ & ((!\A|LessThan3~9_cout\) # (!\ACC|temp\(5)))) # (!\A|Add2~42_combout\ & (!\ACC|temp\(5) & !\A|LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~42_combout\,
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|LessThan3~9_cout\,
	cout => \A|LessThan3~11_cout\);

-- Location: LCCOMB_X18_Y7_N12
\A|LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~13_cout\ = CARRY((\ACC|temp\(6) & ((!\A|LessThan3~11_cout\) # (!\A|Add2~44_combout\))) # (!\ACC|temp\(6) & (!\A|Add2~44_combout\ & !\A|LessThan3~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \A|Add2~44_combout\,
	datad => VCC,
	cin => \A|LessThan3~11_cout\,
	cout => \A|LessThan3~13_cout\);

-- Location: LCCOMB_X18_Y7_N14
\A|LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~15_cout\ = CARRY((\ACC|temp\(7) & (\A|Add2~46_combout\ & !\A|LessThan3~13_cout\)) # (!\ACC|temp\(7) & ((\A|Add2~46_combout\) # (!\A|LessThan3~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \A|Add2~46_combout\,
	datad => VCC,
	cin => \A|LessThan3~13_cout\,
	cout => \A|LessThan3~15_cout\);

-- Location: LCCOMB_X18_Y7_N16
\A|LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~17_cout\ = CARRY((\ACC|temp\(8) & ((!\A|LessThan3~15_cout\) # (!\A|Add2~48_combout\))) # (!\ACC|temp\(8) & (!\A|Add2~48_combout\ & !\A|LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(8),
	datab => \A|Add2~48_combout\,
	datad => VCC,
	cin => \A|LessThan3~15_cout\,
	cout => \A|LessThan3~17_cout\);

-- Location: LCCOMB_X18_Y7_N18
\A|LessThan3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~19_cout\ = CARRY((\ACC|temp\(9) & (\A|Add2~50_combout\ & !\A|LessThan3~17_cout\)) # (!\ACC|temp\(9) & ((\A|Add2~50_combout\) # (!\A|LessThan3~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(9),
	datab => \A|Add2~50_combout\,
	datad => VCC,
	cin => \A|LessThan3~17_cout\,
	cout => \A|LessThan3~19_cout\);

-- Location: LCCOMB_X18_Y7_N20
\A|LessThan3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~21_cout\ = CARRY((\A|Add2~52_combout\ & (\ACC|temp\(10) & !\A|LessThan3~19_cout\)) # (!\A|Add2~52_combout\ & ((\ACC|temp\(10)) # (!\A|LessThan3~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~52_combout\,
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|LessThan3~19_cout\,
	cout => \A|LessThan3~21_cout\);

-- Location: LCCOMB_X18_Y7_N22
\A|LessThan3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~23_cout\ = CARRY((\ACC|temp\(11) & (\A|Add2~54_combout\ & !\A|LessThan3~21_cout\)) # (!\ACC|temp\(11) & ((\A|Add2~54_combout\) # (!\A|LessThan3~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datab => \A|Add2~54_combout\,
	datad => VCC,
	cin => \A|LessThan3~21_cout\,
	cout => \A|LessThan3~23_cout\);

-- Location: LCCOMB_X18_Y7_N24
\A|LessThan3~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~25_cout\ = CARRY((\A|Add2~56_combout\ & (\ACC|temp\(12) & !\A|LessThan3~23_cout\)) # (!\A|Add2~56_combout\ & ((\ACC|temp\(12)) # (!\A|LessThan3~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add2~56_combout\,
	datab => \ACC|temp\(12),
	datad => VCC,
	cin => \A|LessThan3~23_cout\,
	cout => \A|LessThan3~25_cout\);

-- Location: LCCOMB_X18_Y7_N26
\A|LessThan3~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~27_cout\ = CARRY((\ACC|temp\(13) & (\A|Add2~58_combout\ & !\A|LessThan3~25_cout\)) # (!\ACC|temp\(13) & ((\A|Add2~58_combout\) # (!\A|LessThan3~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(13),
	datab => \A|Add2~58_combout\,
	datad => VCC,
	cin => \A|LessThan3~25_cout\,
	cout => \A|LessThan3~27_cout\);

-- Location: LCCOMB_X18_Y7_N28
\A|LessThan3~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~29_cout\ = CARRY((\ACC|temp\(14) & ((!\A|LessThan3~27_cout\) # (!\A|Add2~60_combout\))) # (!\ACC|temp\(14) & (!\A|Add2~60_combout\ & !\A|LessThan3~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \A|Add2~60_combout\,
	datad => VCC,
	cin => \A|LessThan3~27_cout\,
	cout => \A|LessThan3~29_cout\);

-- Location: LCCOMB_X18_Y7_N30
\A|LessThan3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan3~30_combout\ = (\ACC|temp\(15) & ((\A|LessThan3~29_cout\) # (!\A|Add2~62_combout\))) # (!\ACC|temp\(15) & (\A|LessThan3~29_cout\ & !\A|Add2~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(15),
	datad => \A|Add2~62_combout\,
	cin => \A|LessThan3~29_cout\,
	combout => \A|LessThan3~30_combout\);

-- Location: LCCOMB_X26_Y9_N4
\A|Over~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Over~0_combout\ = (!\IR|Equal9~0_combout\ & (\A|LessThan3~30_combout\ & (\A|temp~16_combout\ & \IR|WideOr1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal9~0_combout\,
	datab => \A|LessThan3~30_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|WideOr1~0_combout\,
	combout => \A|Over~0_combout\);

-- Location: LCCOMB_X28_Y9_N0
\A|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~1_cout\ = CARRY((!\A|Add0~0_combout\ & \ACC|temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~0_combout\,
	datab => \ACC|temp\(0),
	datad => VCC,
	cout => \A|LessThan0~1_cout\);

-- Location: LCCOMB_X28_Y9_N2
\A|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~3_cout\ = CARRY((\ACC|temp\(1) & (\A|Add0~2_combout\ & !\A|LessThan0~1_cout\)) # (!\ACC|temp\(1) & ((\A|Add0~2_combout\) # (!\A|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(1),
	datab => \A|Add0~2_combout\,
	datad => VCC,
	cin => \A|LessThan0~1_cout\,
	cout => \A|LessThan0~3_cout\);

-- Location: LCCOMB_X28_Y9_N4
\A|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~5_cout\ = CARRY((\ACC|temp\(2) & ((!\A|LessThan0~3_cout\) # (!\A|Add0~4_combout\))) # (!\ACC|temp\(2) & (!\A|Add0~4_combout\ & !\A|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \A|Add0~4_combout\,
	datad => VCC,
	cin => \A|LessThan0~3_cout\,
	cout => \A|LessThan0~5_cout\);

-- Location: LCCOMB_X28_Y9_N6
\A|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~7_cout\ = CARRY((\ACC|temp\(3) & (\A|Add0~6_combout\ & !\A|LessThan0~5_cout\)) # (!\ACC|temp\(3) & ((\A|Add0~6_combout\) # (!\A|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \A|Add0~6_combout\,
	datad => VCC,
	cin => \A|LessThan0~5_cout\,
	cout => \A|LessThan0~7_cout\);

-- Location: LCCOMB_X28_Y9_N8
\A|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~9_cout\ = CARRY((\A|Add0~8_combout\ & (\ACC|temp\(4) & !\A|LessThan0~7_cout\)) # (!\A|Add0~8_combout\ & ((\ACC|temp\(4)) # (!\A|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~8_combout\,
	datab => \ACC|temp\(4),
	datad => VCC,
	cin => \A|LessThan0~7_cout\,
	cout => \A|LessThan0~9_cout\);

-- Location: LCCOMB_X28_Y9_N10
\A|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~11_cout\ = CARRY((\A|Add0~10_combout\ & ((!\A|LessThan0~9_cout\) # (!\ACC|temp\(5)))) # (!\A|Add0~10_combout\ & (!\ACC|temp\(5) & !\A|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~10_combout\,
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|LessThan0~9_cout\,
	cout => \A|LessThan0~11_cout\);

-- Location: LCCOMB_X28_Y9_N12
\A|LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~13_cout\ = CARRY((\ACC|temp\(6) & ((!\A|LessThan0~11_cout\) # (!\A|Add0~12_combout\))) # (!\ACC|temp\(6) & (!\A|Add0~12_combout\ & !\A|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \A|Add0~12_combout\,
	datad => VCC,
	cin => \A|LessThan0~11_cout\,
	cout => \A|LessThan0~13_cout\);

-- Location: LCCOMB_X28_Y9_N14
\A|LessThan0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~15_cout\ = CARRY((\A|Add0~14_combout\ & ((!\A|LessThan0~13_cout\) # (!\ACC|temp\(7)))) # (!\A|Add0~14_combout\ & (!\ACC|temp\(7) & !\A|LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~14_combout\,
	datab => \ACC|temp\(7),
	datad => VCC,
	cin => \A|LessThan0~13_cout\,
	cout => \A|LessThan0~15_cout\);

-- Location: LCCOMB_X28_Y9_N16
\A|LessThan0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~17_cout\ = CARRY((\A|Add0~16_combout\ & (\ACC|temp\(8) & !\A|LessThan0~15_cout\)) # (!\A|Add0~16_combout\ & ((\ACC|temp\(8)) # (!\A|LessThan0~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~16_combout\,
	datab => \ACC|temp\(8),
	datad => VCC,
	cin => \A|LessThan0~15_cout\,
	cout => \A|LessThan0~17_cout\);

-- Location: LCCOMB_X28_Y9_N18
\A|LessThan0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~19_cout\ = CARRY((\A|Add0~18_combout\ & ((!\A|LessThan0~17_cout\) # (!\ACC|temp\(9)))) # (!\A|Add0~18_combout\ & (!\ACC|temp\(9) & !\A|LessThan0~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~18_combout\,
	datab => \ACC|temp\(9),
	datad => VCC,
	cin => \A|LessThan0~17_cout\,
	cout => \A|LessThan0~19_cout\);

-- Location: LCCOMB_X28_Y9_N20
\A|LessThan0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~21_cout\ = CARRY((\ACC|temp\(10) & ((!\A|LessThan0~19_cout\) # (!\A|Add0~20_combout\))) # (!\ACC|temp\(10) & (!\A|Add0~20_combout\ & !\A|LessThan0~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(10),
	datab => \A|Add0~20_combout\,
	datad => VCC,
	cin => \A|LessThan0~19_cout\,
	cout => \A|LessThan0~21_cout\);

-- Location: LCCOMB_X28_Y9_N22
\A|LessThan0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~23_cout\ = CARRY((\ACC|temp\(11) & (\A|Add0~22_combout\ & !\A|LessThan0~21_cout\)) # (!\ACC|temp\(11) & ((\A|Add0~22_combout\) # (!\A|LessThan0~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datab => \A|Add0~22_combout\,
	datad => VCC,
	cin => \A|LessThan0~21_cout\,
	cout => \A|LessThan0~23_cout\);

-- Location: LCCOMB_X28_Y9_N24
\A|LessThan0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~25_cout\ = CARRY((\A|Add0~24_combout\ & (\ACC|temp\(12) & !\A|LessThan0~23_cout\)) # (!\A|Add0~24_combout\ & ((\ACC|temp\(12)) # (!\A|LessThan0~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~24_combout\,
	datab => \ACC|temp\(12),
	datad => VCC,
	cin => \A|LessThan0~23_cout\,
	cout => \A|LessThan0~25_cout\);

-- Location: LCCOMB_X28_Y9_N26
\A|LessThan0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~27_cout\ = CARRY((\A|Add0~26_combout\ & ((!\A|LessThan0~25_cout\) # (!\ACC|temp\(13)))) # (!\A|Add0~26_combout\ & (!\ACC|temp\(13) & !\A|LessThan0~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~26_combout\,
	datab => \ACC|temp\(13),
	datad => VCC,
	cin => \A|LessThan0~25_cout\,
	cout => \A|LessThan0~27_cout\);

-- Location: LCCOMB_X28_Y9_N28
\A|LessThan0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~29_cout\ = CARRY((\ACC|temp\(14) & ((!\A|LessThan0~27_cout\) # (!\A|Add0~28_combout\))) # (!\ACC|temp\(14) & (!\A|Add0~28_combout\ & !\A|LessThan0~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \A|Add0~28_combout\,
	datad => VCC,
	cin => \A|LessThan0~27_cout\,
	cout => \A|LessThan0~29_cout\);

-- Location: LCCOMB_X28_Y9_N30
\A|LessThan0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan0~30_combout\ = (\ACC|temp\(15) & ((\A|LessThan0~29_cout\) # (!\A|Add0~30_combout\))) # (!\ACC|temp\(15) & (\A|LessThan0~29_cout\ & !\A|Add0~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(15),
	datad => \A|Add0~30_combout\,
	cin => \A|LessThan0~29_cout\,
	combout => \A|LessThan0~30_combout\);

-- Location: LCCOMB_X25_Y9_N0
\A|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~1_cout\ = CARRY((!\A|Add0~0_combout\ & \d|D_OUT[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~0_combout\,
	datab => \d|D_OUT[0]~1_combout\,
	datad => VCC,
	cout => \A|LessThan1~1_cout\);

-- Location: LCCOMB_X25_Y9_N2
\A|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~3_cout\ = CARRY((\A|Add0~2_combout\ & ((!\A|LessThan1~1_cout\) # (!\d|D_OUT[1]~2_combout\))) # (!\A|Add0~2_combout\ & (!\d|D_OUT[1]~2_combout\ & !\A|LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~2_combout\,
	datab => \d|D_OUT[1]~2_combout\,
	datad => VCC,
	cin => \A|LessThan1~1_cout\,
	cout => \A|LessThan1~3_cout\);

-- Location: LCCOMB_X25_Y9_N4
\A|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~5_cout\ = CARRY((\d|D_OUT[2]~4_combout\ & ((!\A|LessThan1~3_cout\) # (!\A|Add0~4_combout\))) # (!\d|D_OUT[2]~4_combout\ & (!\A|Add0~4_combout\ & !\A|LessThan1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[2]~4_combout\,
	datab => \A|Add0~4_combout\,
	datad => VCC,
	cin => \A|LessThan1~3_cout\,
	cout => \A|LessThan1~5_cout\);

-- Location: LCCOMB_X25_Y9_N6
\A|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~7_cout\ = CARRY((\d|D_OUT[3]~5_combout\ & (\A|Add0~6_combout\ & !\A|LessThan1~5_cout\)) # (!\d|D_OUT[3]~5_combout\ & ((\A|Add0~6_combout\) # (!\A|LessThan1~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[3]~5_combout\,
	datab => \A|Add0~6_combout\,
	datad => VCC,
	cin => \A|LessThan1~5_cout\,
	cout => \A|LessThan1~7_cout\);

-- Location: LCCOMB_X25_Y9_N8
\A|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~9_cout\ = CARRY((\A|Add0~8_combout\ & (\d|D_OUT[4]~6_combout\ & !\A|LessThan1~7_cout\)) # (!\A|Add0~8_combout\ & ((\d|D_OUT[4]~6_combout\) # (!\A|LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~8_combout\,
	datab => \d|D_OUT[4]~6_combout\,
	datad => VCC,
	cin => \A|LessThan1~7_cout\,
	cout => \A|LessThan1~9_cout\);

-- Location: LCCOMB_X25_Y9_N10
\A|LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~11_cout\ = CARRY((\A|Add0~10_combout\ & ((!\A|LessThan1~9_cout\) # (!\d|D_OUT[5]~7_combout\))) # (!\A|Add0~10_combout\ & (!\d|D_OUT[5]~7_combout\ & !\A|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~10_combout\,
	datab => \d|D_OUT[5]~7_combout\,
	datad => VCC,
	cin => \A|LessThan1~9_cout\,
	cout => \A|LessThan1~11_cout\);

-- Location: LCCOMB_X25_Y9_N12
\A|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~13_cout\ = CARRY((\A|Add0~12_combout\ & (\d|D_OUT[6]~8_combout\ & !\A|LessThan1~11_cout\)) # (!\A|Add0~12_combout\ & ((\d|D_OUT[6]~8_combout\) # (!\A|LessThan1~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~12_combout\,
	datab => \d|D_OUT[6]~8_combout\,
	datad => VCC,
	cin => \A|LessThan1~11_cout\,
	cout => \A|LessThan1~13_cout\);

-- Location: LCCOMB_X25_Y9_N14
\A|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~15_cout\ = CARRY((\A|Add0~14_combout\ & ((!\A|LessThan1~13_cout\) # (!\d|D_OUT[7]~9_combout\))) # (!\A|Add0~14_combout\ & (!\d|D_OUT[7]~9_combout\ & !\A|LessThan1~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~14_combout\,
	datab => \d|D_OUT[7]~9_combout\,
	datad => VCC,
	cin => \A|LessThan1~13_cout\,
	cout => \A|LessThan1~15_cout\);

-- Location: LCCOMB_X25_Y9_N16
\A|LessThan1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~17_cout\ = CARRY((\A|Add0~16_combout\ & (\d|D_OUT[8]~10_combout\ & !\A|LessThan1~15_cout\)) # (!\A|Add0~16_combout\ & ((\d|D_OUT[8]~10_combout\) # (!\A|LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~16_combout\,
	datab => \d|D_OUT[8]~10_combout\,
	datad => VCC,
	cin => \A|LessThan1~15_cout\,
	cout => \A|LessThan1~17_cout\);

-- Location: LCCOMB_X25_Y9_N18
\A|LessThan1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~19_cout\ = CARRY((\d|D_OUT[9]~11_combout\ & (\A|Add0~18_combout\ & !\A|LessThan1~17_cout\)) # (!\d|D_OUT[9]~11_combout\ & ((\A|Add0~18_combout\) # (!\A|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[9]~11_combout\,
	datab => \A|Add0~18_combout\,
	datad => VCC,
	cin => \A|LessThan1~17_cout\,
	cout => \A|LessThan1~19_cout\);

-- Location: LCCOMB_X25_Y9_N20
\A|LessThan1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~21_cout\ = CARRY((\d|D_OUT[10]~12_combout\ & ((!\A|LessThan1~19_cout\) # (!\A|Add0~20_combout\))) # (!\d|D_OUT[10]~12_combout\ & (!\A|Add0~20_combout\ & !\A|LessThan1~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[10]~12_combout\,
	datab => \A|Add0~20_combout\,
	datad => VCC,
	cin => \A|LessThan1~19_cout\,
	cout => \A|LessThan1~21_cout\);

-- Location: LCCOMB_X25_Y9_N22
\A|LessThan1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~23_cout\ = CARRY((\d|D_OUT[11]~13_combout\ & (\A|Add0~22_combout\ & !\A|LessThan1~21_cout\)) # (!\d|D_OUT[11]~13_combout\ & ((\A|Add0~22_combout\) # (!\A|LessThan1~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[11]~13_combout\,
	datab => \A|Add0~22_combout\,
	datad => VCC,
	cin => \A|LessThan1~21_cout\,
	cout => \A|LessThan1~23_cout\);

-- Location: LCCOMB_X25_Y9_N24
\A|LessThan1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~25_cout\ = CARRY((\d|D_OUT[12]~14_combout\ & ((!\A|LessThan1~23_cout\) # (!\A|Add0~24_combout\))) # (!\d|D_OUT[12]~14_combout\ & (!\A|Add0~24_combout\ & !\A|LessThan1~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[12]~14_combout\,
	datab => \A|Add0~24_combout\,
	datad => VCC,
	cin => \A|LessThan1~23_cout\,
	cout => \A|LessThan1~25_cout\);

-- Location: LCCOMB_X25_Y9_N26
\A|LessThan1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~27_cout\ = CARRY((\A|Add0~26_combout\ & ((!\A|LessThan1~25_cout\) # (!\d|D_OUT[13]~15_combout\))) # (!\A|Add0~26_combout\ & (!\d|D_OUT[13]~15_combout\ & !\A|LessThan1~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add0~26_combout\,
	datab => \d|D_OUT[13]~15_combout\,
	datad => VCC,
	cin => \A|LessThan1~25_cout\,
	cout => \A|LessThan1~27_cout\);

-- Location: LCCOMB_X25_Y9_N28
\A|LessThan1~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~29_cout\ = CARRY((\d|D_OUT[14]~16_combout\ & ((!\A|LessThan1~27_cout\) # (!\A|Add0~28_combout\))) # (!\d|D_OUT[14]~16_combout\ & (!\A|Add0~28_combout\ & !\A|LessThan1~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \d|D_OUT[14]~16_combout\,
	datab => \A|Add0~28_combout\,
	datad => VCC,
	cin => \A|LessThan1~27_cout\,
	cout => \A|LessThan1~29_cout\);

-- Location: LCCOMB_X25_Y9_N30
\A|LessThan1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan1~30_combout\ = (\d|D_OUT[15]~17_combout\ & ((\A|LessThan1~29_cout\) # (!\A|Add0~30_combout\))) # (!\d|D_OUT[15]~17_combout\ & (\A|LessThan1~29_cout\ & !\A|Add0~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \d|D_OUT[15]~17_combout\,
	datad => \A|Add0~30_combout\,
	cin => \A|LessThan1~29_cout\,
	combout => \A|LessThan1~30_combout\);

-- Location: LCCOMB_X26_Y9_N18
\A|Over~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Over~1_combout\ = (\IR|WideOr2~0_combout\ & (!\IR|WideOr1~0_combout\ & ((\A|LessThan0~30_combout\) # (\A|LessThan1~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr2~0_combout\,
	datab => \IR|WideOr1~0_combout\,
	datac => \A|LessThan0~30_combout\,
	datad => \A|LessThan1~30_combout\,
	combout => \A|Over~1_combout\);

-- Location: LCCOMB_X26_Y9_N12
\A|Over~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Over~2_combout\ = (\IR|WideOr0~2_combout\ & (\IR|WideOr3~1_combout\ & ((\A|Over~0_combout\) # (\A|Over~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr0~2_combout\,
	datab => \IR|WideOr3~1_combout\,
	datac => \A|Over~0_combout\,
	datad => \A|Over~1_combout\,
	combout => \A|Over~2_combout\);

-- Location: LCCOMB_X26_Y9_N22
\A|Over\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Over~combout\ = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|Over~2_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|Over~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A|Over~combout\,
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|Over~2_combout\,
	combout => \A|Over~combout\);

-- Location: LCCOMB_X19_Y8_N0
\A|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~0_combout\ = \ACC|temp\(0) $ (VCC)
-- \A|Add3~1\ = CARRY(\ACC|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datad => VCC,
	combout => \A|Add3~0_combout\,
	cout => \A|Add3~1\);

-- Location: LCCOMB_X19_Y8_N2
\A|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~2_combout\ = (\ACC|temp\(1) & (\A|Add3~1\ & VCC)) # (!\ACC|temp\(1) & (!\A|Add3~1\))
-- \A|Add3~3\ = CARRY((!\ACC|temp\(1) & !\A|Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(1),
	datad => VCC,
	cin => \A|Add3~1\,
	combout => \A|Add3~2_combout\,
	cout => \A|Add3~3\);

-- Location: LCCOMB_X19_Y8_N4
\A|Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~4_combout\ = (\ACC|temp\(2) & ((GND) # (!\A|Add3~3\))) # (!\ACC|temp\(2) & (\A|Add3~3\ $ (GND)))
-- \A|Add3~5\ = CARRY((\ACC|temp\(2)) # (!\A|Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datad => VCC,
	cin => \A|Add3~3\,
	combout => \A|Add3~4_combout\,
	cout => \A|Add3~5\);

-- Location: LCCOMB_X19_Y8_N6
\A|Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~6_combout\ = (\ACC|temp\(3) & (\A|Add3~5\ & VCC)) # (!\ACC|temp\(3) & (!\A|Add3~5\))
-- \A|Add3~7\ = CARRY((!\ACC|temp\(3) & !\A|Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datad => VCC,
	cin => \A|Add3~5\,
	combout => \A|Add3~6_combout\,
	cout => \A|Add3~7\);

-- Location: LCCOMB_X19_Y8_N8
\A|Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~8_combout\ = (\ACC|temp\(4) & ((GND) # (!\A|Add3~7\))) # (!\ACC|temp\(4) & (\A|Add3~7\ $ (GND)))
-- \A|Add3~9\ = CARRY((\ACC|temp\(4)) # (!\A|Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(4),
	datad => VCC,
	cin => \A|Add3~7\,
	combout => \A|Add3~8_combout\,
	cout => \A|Add3~9\);

-- Location: LCCOMB_X19_Y8_N10
\A|Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~10_combout\ = (\ACC|temp\(5) & (\A|Add3~9\ & VCC)) # (!\ACC|temp\(5) & (!\A|Add3~9\))
-- \A|Add3~11\ = CARRY((!\ACC|temp\(5) & !\A|Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(5),
	datad => VCC,
	cin => \A|Add3~9\,
	combout => \A|Add3~10_combout\,
	cout => \A|Add3~11\);

-- Location: LCCOMB_X19_Y8_N12
\A|Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~12_combout\ = (\ACC|temp\(6) & ((GND) # (!\A|Add3~11\))) # (!\ACC|temp\(6) & (\A|Add3~11\ $ (GND)))
-- \A|Add3~13\ = CARRY((\ACC|temp\(6)) # (!\A|Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datad => VCC,
	cin => \A|Add3~11\,
	combout => \A|Add3~12_combout\,
	cout => \A|Add3~13\);

-- Location: LCCOMB_X19_Y8_N14
\A|Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~14_combout\ = (\ACC|temp\(7) & (\A|Add3~13\ & VCC)) # (!\ACC|temp\(7) & (!\A|Add3~13\))
-- \A|Add3~15\ = CARRY((!\ACC|temp\(7) & !\A|Add3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(7),
	datad => VCC,
	cin => \A|Add3~13\,
	combout => \A|Add3~14_combout\,
	cout => \A|Add3~15\);

-- Location: LCCOMB_X19_Y8_N16
\A|Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~16_combout\ = (\ACC|temp\(8) & ((GND) # (!\A|Add3~15\))) # (!\ACC|temp\(8) & (\A|Add3~15\ $ (GND)))
-- \A|Add3~17\ = CARRY((\ACC|temp\(8)) # (!\A|Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(8),
	datad => VCC,
	cin => \A|Add3~15\,
	combout => \A|Add3~16_combout\,
	cout => \A|Add3~17\);

-- Location: LCCOMB_X19_Y8_N18
\A|Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~18_combout\ = (\ACC|temp\(9) & (\A|Add3~17\ & VCC)) # (!\ACC|temp\(9) & (!\A|Add3~17\))
-- \A|Add3~19\ = CARRY((!\ACC|temp\(9) & !\A|Add3~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(9),
	datad => VCC,
	cin => \A|Add3~17\,
	combout => \A|Add3~18_combout\,
	cout => \A|Add3~19\);

-- Location: LCCOMB_X19_Y8_N20
\A|Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~20_combout\ = (\ACC|temp\(10) & ((GND) # (!\A|Add3~19\))) # (!\ACC|temp\(10) & (\A|Add3~19\ $ (GND)))
-- \A|Add3~21\ = CARRY((\ACC|temp\(10)) # (!\A|Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|Add3~19\,
	combout => \A|Add3~20_combout\,
	cout => \A|Add3~21\);

-- Location: LCCOMB_X19_Y8_N22
\A|Add3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~22_combout\ = (\ACC|temp\(11) & (\A|Add3~21\ & VCC)) # (!\ACC|temp\(11) & (!\A|Add3~21\))
-- \A|Add3~23\ = CARRY((!\ACC|temp\(11) & !\A|Add3~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datad => VCC,
	cin => \A|Add3~21\,
	combout => \A|Add3~22_combout\,
	cout => \A|Add3~23\);

-- Location: LCCOMB_X19_Y8_N24
\A|Add3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~24_combout\ = (\ACC|temp\(12) & ((GND) # (!\A|Add3~23\))) # (!\ACC|temp\(12) & (\A|Add3~23\ $ (GND)))
-- \A|Add3~25\ = CARRY((\ACC|temp\(12)) # (!\A|Add3~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(12),
	datad => VCC,
	cin => \A|Add3~23\,
	combout => \A|Add3~24_combout\,
	cout => \A|Add3~25\);

-- Location: LCCOMB_X19_Y8_N26
\A|Add3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~26_combout\ = (\ACC|temp\(13) & (\A|Add3~25\ & VCC)) # (!\ACC|temp\(13) & (!\A|Add3~25\))
-- \A|Add3~27\ = CARRY((!\ACC|temp\(13) & !\A|Add3~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(13),
	datad => VCC,
	cin => \A|Add3~25\,
	combout => \A|Add3~26_combout\,
	cout => \A|Add3~27\);

-- Location: LCCOMB_X19_Y8_N28
\A|Add3~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~28_combout\ = (\ACC|temp\(14) & ((GND) # (!\A|Add3~27\))) # (!\ACC|temp\(14) & (\A|Add3~27\ $ (GND)))
-- \A|Add3~29\ = CARRY((\ACC|temp\(14)) # (!\A|Add3~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datad => VCC,
	cin => \A|Add3~27\,
	combout => \A|Add3~28_combout\,
	cout => \A|Add3~29\);

-- Location: LCCOMB_X19_Y8_N30
\A|Add3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Add3~30_combout\ = \A|Add3~29\ $ (!\ACC|temp\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \ACC|temp\(15),
	cin => \A|Add3~29\,
	combout => \A|Add3~30_combout\);

-- Location: LCCOMB_X18_Y8_N0
\A|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~1_cout\ = CARRY((!\ACC|temp\(0) & \A|Add3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datab => \A|Add3~0_combout\,
	datad => VCC,
	cout => \A|LessThan4~1_cout\);

-- Location: LCCOMB_X18_Y8_N2
\A|LessThan4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~3_cout\ = CARRY((\A|Add3~2_combout\ & (\ACC|temp\(1) & !\A|LessThan4~1_cout\)) # (!\A|Add3~2_combout\ & ((\ACC|temp\(1)) # (!\A|LessThan4~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add3~2_combout\,
	datab => \ACC|temp\(1),
	datad => VCC,
	cin => \A|LessThan4~1_cout\,
	cout => \A|LessThan4~3_cout\);

-- Location: LCCOMB_X18_Y8_N4
\A|LessThan4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~5_cout\ = CARRY((\A|Add3~4_combout\ & ((!\A|LessThan4~3_cout\) # (!\ACC|temp\(2)))) # (!\A|Add3~4_combout\ & (!\ACC|temp\(2) & !\A|LessThan4~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add3~4_combout\,
	datab => \ACC|temp\(2),
	datad => VCC,
	cin => \A|LessThan4~3_cout\,
	cout => \A|LessThan4~5_cout\);

-- Location: LCCOMB_X18_Y8_N6
\A|LessThan4~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~7_cout\ = CARRY((\ACC|temp\(3) & ((!\A|LessThan4~5_cout\) # (!\A|Add3~6_combout\))) # (!\ACC|temp\(3) & (!\A|Add3~6_combout\ & !\A|LessThan4~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(3),
	datab => \A|Add3~6_combout\,
	datad => VCC,
	cin => \A|LessThan4~5_cout\,
	cout => \A|LessThan4~7_cout\);

-- Location: LCCOMB_X18_Y8_N8
\A|LessThan4~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~9_cout\ = CARRY((\ACC|temp\(4) & (\A|Add3~8_combout\ & !\A|LessThan4~7_cout\)) # (!\ACC|temp\(4) & ((\A|Add3~8_combout\) # (!\A|LessThan4~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(4),
	datab => \A|Add3~8_combout\,
	datad => VCC,
	cin => \A|LessThan4~7_cout\,
	cout => \A|LessThan4~9_cout\);

-- Location: LCCOMB_X18_Y8_N10
\A|LessThan4~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~11_cout\ = CARRY((\ACC|temp\(5) & ((!\A|LessThan4~9_cout\) # (!\A|Add3~10_combout\))) # (!\ACC|temp\(5) & (!\A|Add3~10_combout\ & !\A|LessThan4~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(5),
	datab => \A|Add3~10_combout\,
	datad => VCC,
	cin => \A|LessThan4~9_cout\,
	cout => \A|LessThan4~11_cout\);

-- Location: LCCOMB_X18_Y8_N12
\A|LessThan4~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~13_cout\ = CARRY((\ACC|temp\(6) & (\A|Add3~12_combout\ & !\A|LessThan4~11_cout\)) # (!\ACC|temp\(6) & ((\A|Add3~12_combout\) # (!\A|LessThan4~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \A|Add3~12_combout\,
	datad => VCC,
	cin => \A|LessThan4~11_cout\,
	cout => \A|LessThan4~13_cout\);

-- Location: LCCOMB_X18_Y8_N14
\A|LessThan4~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~15_cout\ = CARRY((\ACC|temp\(7) & ((!\A|LessThan4~13_cout\) # (!\A|Add3~14_combout\))) # (!\ACC|temp\(7) & (!\A|Add3~14_combout\ & !\A|LessThan4~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(7),
	datab => \A|Add3~14_combout\,
	datad => VCC,
	cin => \A|LessThan4~13_cout\,
	cout => \A|LessThan4~15_cout\);

-- Location: LCCOMB_X18_Y8_N16
\A|LessThan4~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~17_cout\ = CARRY((\A|Add3~16_combout\ & ((!\A|LessThan4~15_cout\) # (!\ACC|temp\(8)))) # (!\A|Add3~16_combout\ & (!\ACC|temp\(8) & !\A|LessThan4~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add3~16_combout\,
	datab => \ACC|temp\(8),
	datad => VCC,
	cin => \A|LessThan4~15_cout\,
	cout => \A|LessThan4~17_cout\);

-- Location: LCCOMB_X18_Y8_N18
\A|LessThan4~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~19_cout\ = CARRY((\A|Add3~18_combout\ & (\ACC|temp\(9) & !\A|LessThan4~17_cout\)) # (!\A|Add3~18_combout\ & ((\ACC|temp\(9)) # (!\A|LessThan4~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add3~18_combout\,
	datab => \ACC|temp\(9),
	datad => VCC,
	cin => \A|LessThan4~17_cout\,
	cout => \A|LessThan4~19_cout\);

-- Location: LCCOMB_X18_Y8_N20
\A|LessThan4~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~21_cout\ = CARRY((\A|Add3~20_combout\ & ((!\A|LessThan4~19_cout\) # (!\ACC|temp\(10)))) # (!\A|Add3~20_combout\ & (!\ACC|temp\(10) & !\A|LessThan4~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add3~20_combout\,
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|LessThan4~19_cout\,
	cout => \A|LessThan4~21_cout\);

-- Location: LCCOMB_X18_Y8_N22
\A|LessThan4~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~23_cout\ = CARRY((\ACC|temp\(11) & ((!\A|LessThan4~21_cout\) # (!\A|Add3~22_combout\))) # (!\ACC|temp\(11) & (!\A|Add3~22_combout\ & !\A|LessThan4~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(11),
	datab => \A|Add3~22_combout\,
	datad => VCC,
	cin => \A|LessThan4~21_cout\,
	cout => \A|LessThan4~23_cout\);

-- Location: LCCOMB_X18_Y8_N24
\A|LessThan4~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~25_cout\ = CARRY((\ACC|temp\(12) & (\A|Add3~24_combout\ & !\A|LessThan4~23_cout\)) # (!\ACC|temp\(12) & ((\A|Add3~24_combout\) # (!\A|LessThan4~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(12),
	datab => \A|Add3~24_combout\,
	datad => VCC,
	cin => \A|LessThan4~23_cout\,
	cout => \A|LessThan4~25_cout\);

-- Location: LCCOMB_X18_Y8_N26
\A|LessThan4~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~27_cout\ = CARRY((\ACC|temp\(13) & ((!\A|LessThan4~25_cout\) # (!\A|Add3~26_combout\))) # (!\ACC|temp\(13) & (!\A|Add3~26_combout\ & !\A|LessThan4~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(13),
	datab => \A|Add3~26_combout\,
	datad => VCC,
	cin => \A|LessThan4~25_cout\,
	cout => \A|LessThan4~27_cout\);

-- Location: LCCOMB_X18_Y8_N28
\A|LessThan4~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~29_cout\ = CARRY((\ACC|temp\(14) & (\A|Add3~28_combout\ & !\A|LessThan4~27_cout\)) # (!\ACC|temp\(14) & ((\A|Add3~28_combout\) # (!\A|LessThan4~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(14),
	datab => \A|Add3~28_combout\,
	datad => VCC,
	cin => \A|LessThan4~27_cout\,
	cout => \A|LessThan4~29_cout\);

-- Location: LCCOMB_X18_Y8_N30
\A|LessThan4~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan4~30_combout\ = (\ACC|temp\(15) & (\A|LessThan4~29_cout\ & \A|Add3~30_combout\)) # (!\ACC|temp\(15) & ((\A|LessThan4~29_cout\) # (\A|Add3~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(15),
	datad => \A|Add3~30_combout\,
	cin => \A|LessThan4~29_cout\,
	combout => \A|LessThan4~30_combout\);

-- Location: LCCOMB_X26_Y8_N0
\A|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~1_cout\ = CARRY((!\ACC|temp\(0) & \A|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(0),
	datab => \A|Add1~0_combout\,
	datad => VCC,
	cout => \A|LessThan2~1_cout\);

-- Location: LCCOMB_X26_Y8_N2
\A|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~3_cout\ = CARRY((\A|Add1~2_combout\ & (\ACC|temp\(1) & !\A|LessThan2~1_cout\)) # (!\A|Add1~2_combout\ & ((\ACC|temp\(1)) # (!\A|LessThan2~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~2_combout\,
	datab => \ACC|temp\(1),
	datad => VCC,
	cin => \A|LessThan2~1_cout\,
	cout => \A|LessThan2~3_cout\);

-- Location: LCCOMB_X26_Y8_N4
\A|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~5_cout\ = CARRY((\ACC|temp\(2) & (\A|Add1~4_combout\ & !\A|LessThan2~3_cout\)) # (!\ACC|temp\(2) & ((\A|Add1~4_combout\) # (!\A|LessThan2~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(2),
	datab => \A|Add1~4_combout\,
	datad => VCC,
	cin => \A|LessThan2~3_cout\,
	cout => \A|LessThan2~5_cout\);

-- Location: LCCOMB_X26_Y8_N6
\A|LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~7_cout\ = CARRY((\A|Add1~6_combout\ & (\ACC|temp\(3) & !\A|LessThan2~5_cout\)) # (!\A|Add1~6_combout\ & ((\ACC|temp\(3)) # (!\A|LessThan2~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~6_combout\,
	datab => \ACC|temp\(3),
	datad => VCC,
	cin => \A|LessThan2~5_cout\,
	cout => \A|LessThan2~7_cout\);

-- Location: LCCOMB_X26_Y8_N8
\A|LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~9_cout\ = CARRY((\ACC|temp\(4) & (\A|Add1~8_combout\ & !\A|LessThan2~7_cout\)) # (!\ACC|temp\(4) & ((\A|Add1~8_combout\) # (!\A|LessThan2~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(4),
	datab => \A|Add1~8_combout\,
	datad => VCC,
	cin => \A|LessThan2~7_cout\,
	cout => \A|LessThan2~9_cout\);

-- Location: LCCOMB_X26_Y8_N10
\A|LessThan2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~11_cout\ = CARRY((\ACC|temp\(5) & ((!\A|LessThan2~9_cout\) # (!\A|Add1~10_combout\))) # (!\ACC|temp\(5) & (!\A|Add1~10_combout\ & !\A|LessThan2~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(5),
	datab => \A|Add1~10_combout\,
	datad => VCC,
	cin => \A|LessThan2~9_cout\,
	cout => \A|LessThan2~11_cout\);

-- Location: LCCOMB_X26_Y8_N12
\A|LessThan2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~13_cout\ = CARRY((\ACC|temp\(6) & (\A|Add1~12_combout\ & !\A|LessThan2~11_cout\)) # (!\ACC|temp\(6) & ((\A|Add1~12_combout\) # (!\A|LessThan2~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ACC|temp\(6),
	datab => \A|Add1~12_combout\,
	datad => VCC,
	cin => \A|LessThan2~11_cout\,
	cout => \A|LessThan2~13_cout\);

-- Location: LCCOMB_X26_Y8_N14
\A|LessThan2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~15_cout\ = CARRY((\A|Add1~14_combout\ & (\ACC|temp\(7) & !\A|LessThan2~13_cout\)) # (!\A|Add1~14_combout\ & ((\ACC|temp\(7)) # (!\A|LessThan2~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~14_combout\,
	datab => \ACC|temp\(7),
	datad => VCC,
	cin => \A|LessThan2~13_cout\,
	cout => \A|LessThan2~15_cout\);

-- Location: LCCOMB_X26_Y8_N16
\A|LessThan2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~17_cout\ = CARRY((\A|Add1~16_combout\ & ((!\A|LessThan2~15_cout\) # (!\ACC|temp\(8)))) # (!\A|Add1~16_combout\ & (!\ACC|temp\(8) & !\A|LessThan2~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~16_combout\,
	datab => \ACC|temp\(8),
	datad => VCC,
	cin => \A|LessThan2~15_cout\,
	cout => \A|LessThan2~17_cout\);

-- Location: LCCOMB_X26_Y8_N18
\A|LessThan2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~19_cout\ = CARRY((\A|Add1~18_combout\ & (\ACC|temp\(9) & !\A|LessThan2~17_cout\)) # (!\A|Add1~18_combout\ & ((\ACC|temp\(9)) # (!\A|LessThan2~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~18_combout\,
	datab => \ACC|temp\(9),
	datad => VCC,
	cin => \A|LessThan2~17_cout\,
	cout => \A|LessThan2~19_cout\);

-- Location: LCCOMB_X26_Y8_N20
\A|LessThan2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~21_cout\ = CARRY((\A|Add1~20_combout\ & ((!\A|LessThan2~19_cout\) # (!\ACC|temp\(10)))) # (!\A|Add1~20_combout\ & (!\ACC|temp\(10) & !\A|LessThan2~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~20_combout\,
	datab => \ACC|temp\(10),
	datad => VCC,
	cin => \A|LessThan2~19_cout\,
	cout => \A|LessThan2~21_cout\);

-- Location: LCCOMB_X26_Y8_N22
\A|LessThan2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~23_cout\ = CARRY((\A|Add1~22_combout\ & (\ACC|temp\(11) & !\A|LessThan2~21_cout\)) # (!\A|Add1~22_combout\ & ((\ACC|temp\(11)) # (!\A|LessThan2~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~22_combout\,
	datab => \ACC|temp\(11),
	datad => VCC,
	cin => \A|LessThan2~21_cout\,
	cout => \A|LessThan2~23_cout\);

-- Location: LCCOMB_X26_Y8_N24
\A|LessThan2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~25_cout\ = CARRY((\A|Add1~24_combout\ & ((!\A|LessThan2~23_cout\) # (!\ACC|temp\(12)))) # (!\A|Add1~24_combout\ & (!\ACC|temp\(12) & !\A|LessThan2~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~24_combout\,
	datab => \ACC|temp\(12),
	datad => VCC,
	cin => \A|LessThan2~23_cout\,
	cout => \A|LessThan2~25_cout\);

-- Location: LCCOMB_X26_Y8_N26
\A|LessThan2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~27_cout\ = CARRY((\A|Add1~26_combout\ & (\ACC|temp\(13) & !\A|LessThan2~25_cout\)) # (!\A|Add1~26_combout\ & ((\ACC|temp\(13)) # (!\A|LessThan2~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~26_combout\,
	datab => \ACC|temp\(13),
	datad => VCC,
	cin => \A|LessThan2~25_cout\,
	cout => \A|LessThan2~27_cout\);

-- Location: LCCOMB_X26_Y8_N28
\A|LessThan2~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~29_cout\ = CARRY((\A|Add1~28_combout\ & ((!\A|LessThan2~27_cout\) # (!\ACC|temp\(14)))) # (!\A|Add1~28_combout\ & (!\ACC|temp\(14) & !\A|LessThan2~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A|Add1~28_combout\,
	datab => \ACC|temp\(14),
	datad => VCC,
	cin => \A|LessThan2~27_cout\,
	cout => \A|LessThan2~29_cout\);

-- Location: LCCOMB_X26_Y8_N30
\A|LessThan2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|LessThan2~30_combout\ = (\ACC|temp\(15) & (\A|LessThan2~29_cout\ & \A|Add1~30_combout\)) # (!\ACC|temp\(15) & ((\A|LessThan2~29_cout\) # (\A|Add1~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ACC|temp\(15),
	datad => \A|Add1~30_combout\,
	cin => \A|LessThan2~29_cout\,
	combout => \A|LessThan2~30_combout\);

-- Location: LCCOMB_X26_Y9_N10
\A|Nege~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Nege~0_combout\ = (\IR|WideOr2~0_combout\ & (!\IR|WideOr1~0_combout\ & ((\A|LessThan2~30_combout\)))) # (!\IR|WideOr2~0_combout\ & (\IR|WideOr1~0_combout\ & (\A|LessThan4~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|WideOr2~0_combout\,
	datab => \IR|WideOr1~0_combout\,
	datac => \A|LessThan4~30_combout\,
	datad => \A|LessThan2~30_combout\,
	combout => \A|Nege~0_combout\);

-- Location: LCCOMB_X26_Y9_N24
\A|Nege~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Nege~1_combout\ = (!\IR|WideOr3~1_combout\ & \A|Nege~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|WideOr3~1_combout\,
	datad => \A|Nege~0_combout\,
	combout => \A|Nege~1_combout\);

-- Location: LCCOMB_X26_Y9_N16
\A|Nege\ : cycloneive_lcell_comb
-- Equation(s):
-- \A|Nege~combout\ = (GLOBAL(\CTRLM|R~0clkctrl_outclk\) & ((\A|Nege~1_combout\))) # (!GLOBAL(\CTRLM|R~0clkctrl_outclk\) & (\A|Nege~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A|Nege~combout\,
	datac => \CTRLM|R~0clkctrl_outclk\,
	datad => \A|Nege~1_combout\,
	combout => \A|Nege~combout\);

-- Location: LCCOMB_X22_Y11_N20
\IR|STOP\ : cycloneive_lcell_comb
-- Equation(s):
-- \IR|STOP~combout\ = (\IR|Equal9~0_combout\) # ((!\IR|Equal0~5_combout\ & (\CTRLM|C2~3_combout\ & \A|temp~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal0~5_combout\,
	datab => \CTRLM|C2~3_combout\,
	datac => \A|temp~16_combout\,
	datad => \IR|Equal9~0_combout\,
	combout => \IR|STOP~combout\);

-- Location: LCCOMB_X22_Y11_N2
\CTRLM|EDR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|EDR~1_combout\ = (\IR|Equal0~5_combout\ & (\CTRLM|T6~combout\ & (\A|temp~16_combout\ & \CTRLM|C2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|Equal0~5_combout\,
	datab => \CTRLM|T6~combout\,
	datac => \A|temp~16_combout\,
	datad => \CTRLM|C2~3_combout\,
	combout => \CTRLM|EDR~1_combout\);

-- Location: LCCOMB_X19_Y9_N30
\CTRLM|EDR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|EDR~2_combout\ = (\CTRLM|EDR~1_combout\) # ((\CTRLM|IDR~0_combout\ & (\CT|temp\(2) $ (\CT|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CT|temp\(2),
	datab => \CTRLM|IDR~0_combout\,
	datac => \CT|temp\(1),
	datad => \CTRLM|EDR~1_combout\,
	combout => \CTRLM|EDR~2_combout\);

-- Location: LCCOMB_X26_Y9_N28
\CTRLM|EDR~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|EDR~3_combout\ = (\CTRLM|EDR~2_combout\) # ((\CTRLM|IPC~1_combout\ & ((\CTRLM|T5~1_combout\) # (\CTRLM|T4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|T5~1_combout\,
	datab => \CTRLM|IPC~1_combout\,
	datac => \CTRLM|T4~2_combout\,
	datad => \CTRLM|EDR~2_combout\,
	combout => \CTRLM|EDR~3_combout\);

-- Location: LCCOMB_X26_Y9_N6
\CTRLM|EDR~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTRLM|EDR~4_combout\ = (!\CTRLM|Code15~combout\ & ((\CTRLM|EDR~0_combout\) # (\CTRLM|EDR~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTRLM|Code15~combout\,
	datac => \CTRLM|EDR~0_combout\,
	datad => \CTRLM|EDR~3_combout\,
	combout => \CTRLM|EDR~4_combout\);

ww_ALU_OUT(0) <= \ALU_OUT[0]~output_o\;

ww_ALU_OUT(1) <= \ALU_OUT[1]~output_o\;

ww_ALU_OUT(2) <= \ALU_OUT[2]~output_o\;

ww_ALU_OUT(3) <= \ALU_OUT[3]~output_o\;

ww_ALU_OUT(4) <= \ALU_OUT[4]~output_o\;

ww_ALU_OUT(5) <= \ALU_OUT[5]~output_o\;

ww_ALU_OUT(6) <= \ALU_OUT[6]~output_o\;

ww_ALU_OUT(7) <= \ALU_OUT[7]~output_o\;

ww_ALU_OUT(8) <= \ALU_OUT[8]~output_o\;

ww_ALU_OUT(9) <= \ALU_OUT[9]~output_o\;

ww_ALU_OUT(10) <= \ALU_OUT[10]~output_o\;

ww_ALU_OUT(11) <= \ALU_OUT[11]~output_o\;

ww_ALU_OUT(12) <= \ALU_OUT[12]~output_o\;

ww_ALU_OUT(13) <= \ALU_OUT[13]~output_o\;

ww_ALU_OUT(14) <= \ALU_OUT[14]~output_o\;

ww_ALU_OUT(15) <= \ALU_OUT[15]~output_o\;

ww_Zero <= \Zero~output_o\;

ww_Over <= \Over~output_o\;

ww_Nege <= \Nege~output_o\;

ww_ERROR <= \ERROR~output_o\;

ww_STOP <= \STOP~output_o\;

ww_Tap(0) <= \Tap[0]~output_o\;

ww_Tap(1) <= \Tap[1]~output_o\;

ww_Tap(2) <= \Tap[2]~output_o\;

ww_Tap(3) <= \Tap[3]~output_o\;

ww_Tap(4) <= \Tap[4]~output_o\;

ww_Tap(5) <= \Tap[5]~output_o\;

ww_Tap(6) <= \Tap[6]~output_o\;

ww_Tap(7) <= \Tap[7]~output_o\;

ww_Code_IR(0) <= \Code_IR[0]~output_o\;

ww_Code_IR(1) <= \Code_IR[1]~output_o\;

ww_Code_IR(2) <= \Code_IR[2]~output_o\;

ww_Code_IR(3) <= \Code_IR[3]~output_o\;

ww_IPC_O <= \IPC_O~output_o\;

ww_IMAR_O <= \IMAR_O~output_o\;

ww_IDR_O <= \IDR_O~output_o\;

ww_EDR_O <= \EDR_O~output_o\;

ww_W_O <= \W_O~output_o\;

ww_R_O <= \R_O~output_o\;

ww_ISUM_O <= \ISUM_O~output_o\;

ww_ESUM_O <= \ESUM_O~output_o\;

ww_IIR_O <= \IIR_O~output_o\;

ww_ABUS_O(0) <= \ABUS_O[0]~output_o\;

ww_ABUS_O(1) <= \ABUS_O[1]~output_o\;

ww_ABUS_O(2) <= \ABUS_O[2]~output_o\;

ww_ABUS_O(3) <= \ABUS_O[3]~output_o\;

ww_dbus_O(0) <= \dbus_O[0]~output_o\;

ww_dbus_O(1) <= \dbus_O[1]~output_o\;

ww_dbus_O(2) <= \dbus_O[2]~output_o\;

ww_dbus_O(3) <= \dbus_O[3]~output_o\;

ww_dbus_O(4) <= \dbus_O[4]~output_o\;

ww_dbus_O(5) <= \dbus_O[5]~output_o\;

ww_dbus_O(6) <= \dbus_O[6]~output_o\;

ww_dbus_O(7) <= \dbus_O[7]~output_o\;

ww_dbus_O(8) <= \dbus_O[8]~output_o\;

ww_dbus_O(9) <= \dbus_O[9]~output_o\;

ww_dbus_O(10) <= \dbus_O[10]~output_o\;

ww_dbus_O(11) <= \dbus_O[11]~output_o\;

ww_dbus_O(12) <= \dbus_O[12]~output_o\;

ww_dbus_O(13) <= \dbus_O[13]~output_o\;

ww_dbus_O(14) <= \dbus_O[14]~output_o\;

ww_dbus_O(15) <= \dbus_O[15]~output_o\;
END structure;


