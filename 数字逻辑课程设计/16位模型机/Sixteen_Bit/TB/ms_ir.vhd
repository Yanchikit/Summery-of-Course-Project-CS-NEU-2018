--指令寄存器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_ir is
end ms_ir;

architecture modelsim of ms_ir is
component IREG	--指令寄存器
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--指令数据
			IIR : in std_logic;	--寄存信号
			Code : out std_logic_vector(3 downto 0)	--指令信号
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal DI : std_logic_vector(15 downto 0);	--指令数据
	signal IIR : std_logic;	--寄存命令
	signal Code : std_logic_vector(3 downto 0);	--指令信号
begin
IR : IREG port map(CLK, DI, IIR, Code);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;
process
	begin
		DI<= "0000000000111110";
		wait for 40 ns;
		DI<= "0000000001110110";
		wait for 40 ns;
		DI<= "0000000011000110";
		wait for 40 ns;
		DI<= "0000000001110110";
		wait for 40 ns;
		DI<= "1111111111111111";
		wait for 40 ns;
		DI<= "0000000000111110";
		wait for 40 ns;
	end process;

process
	begin
		IIR<= '0';
		wait for 60 ns;
		IIR<='1';
		wait for 60 ns;
	end process;
end modelsim;