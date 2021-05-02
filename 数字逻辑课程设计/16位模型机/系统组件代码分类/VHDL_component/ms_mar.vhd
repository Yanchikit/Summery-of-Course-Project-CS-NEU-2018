--地址寄存器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_mar is
end ms_mar;

architecture modelsim of ms_mar is
component MAREG	--地址寄存器
	port (CLK : in std_logic;	--时钟信号
			AI : in std_logic_vector(3 downto 0);
			IMAR : in std_logic;	--寄存命令
			AO : out std_logic_vector(3 downto 0)
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal AI : std_logic_vector(3 downto 0);
	signal IMAR : std_logic;	--寄存命令
	signal AO : std_logic_vector(3 downto 0);
begin
MAR : MAREG port map(CLK, AI, IMAR, AO);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;
process
	begin
		AI<= "1001";
		wait for 40 ns;
		AI<= "1010";
		wait for 40 ns;
		AI<= "0011";
		wait for 40 ns;
		AI<= "1111";
		wait for 40 ns;
		AI<= "0101";
		wait for 40 ns;
	end process;

process
	begin
		IMAR<= '0';
		wait for 60 ns;
		IMAR<='1';
		wait for 60 ns;
	end process;
end modelsim;