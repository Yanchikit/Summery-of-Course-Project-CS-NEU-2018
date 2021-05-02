--时钟信号产生器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_clk is
end ms_clk;

architecture modelsim of ms_clk is
component CLOCK	--时钟信号产生器
	port (CLK : in std_logic;	--50MHz T=20ns 5e7T= 1s
			CLK_OUT : out std_logic
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal CLK_OUT : std_logic;
begin
CL : CLOCK port map(CLK, CLK_OUT);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;
end modelsim;