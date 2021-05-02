--CTRL控制电路仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_ctrl is
end ms_ctrl;

architecture modelsim of ms_ctrl is
component CTRL	--程序计数器
	port (CLK : in std_logic;	--时钟信号
			Code : in std_logic_vector(3 downto 0);	--指令信号	from IREG
			T : in std_logic_vector(7 downto 0);	--节拍信号	from COUNTER
			IPC : out std_logic;	--PC控制信号
			IMAR : out std_logic;	--MAREG寄存信号
			IDR, EDR : out std_logic;	--DREG寄存、输出信号
			W, R : out std_logic;	--ALU中DREG输入输出信号
			Code_A : out std_logic_vector(3 downto 0);
			ISUM, ESUM : out std_logic;	--ALU控制、输出信号
			IIR : out std_logic	--IREG寄存信号
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal Code : std_logic_vector(3 downto 0);	--指令信号	from IREG
	signal T : std_logic_vector(7 downto 0);	--节拍信号	from COUNTER
	signal IPC : std_logic;	--PC控制信号
	signal IMAR : std_logic;	--MAREG寄存信号
	signal IDR, EDR : std_logic;	--DREG寄存、输出信号
	signal W, R : std_logic;	--ALU中DREG输入输出信号
	signal Code_A : std_logic_vector(3 downto 0);
	signal ISUM, ESUM : std_logic;	--ALU控制、输出信号
	signal IIR : std_logic;	--IREG寄存信号
begin
CL : CTRL port map(CLK, Code, T, IPC, IMAR, IDR, EDR, W, R, Code_A, ISUM, ESUM, IIR);

process
	begin
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
	end process;
process
	begin
		T <= "00000001";
		wait for 40 ns;
		T <= "00000010";
		wait for 40 ns;
		T <= "00000100";
		wait for 40 ns;
		T <= "00001000";
		wait for 40 ns;
		T <= "00010000";
		wait for 40 ns;
		T <= "00100000";
		wait for 40 ns;
		T <= "01000000";
		wait for 40 ns;
		T <= "10000000";
		wait for 40 ns;
	end process;
	
	
process
	begin
		Code <= "0001";
		wait for 320 ns;
		Code <= "0010";
		wait for 320 ns;
		Code <= "0011";
		wait for 320 ns;	
	end process;
	
	
end modelsim;