--程序计数器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_pc is
end ms_pc;

architecture modelsim of ms_pc is
component PC	--程序计数器
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;
			IPC : in std_logic;	--控制信号
			PC_OUT : out std_logic_vector(3 downto 0)
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal CLR : std_logic;
	signal IPC : std_logic;	--控制信号
	signal PC_OUT : std_logic_vector(3 downto 0);
begin
P : PC port map(CLK, CLR, IPC, PC_OUT);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;

process
	begin
		CLR<= '1';
		wait for 40 ns;
		CLR<='0';
		wait;
	end process;

process
	begin
		IPC<= '0';
		wait for 60 ns;
		IPC<='1';
		wait for 60 ns;
	end process;
end modelsim;