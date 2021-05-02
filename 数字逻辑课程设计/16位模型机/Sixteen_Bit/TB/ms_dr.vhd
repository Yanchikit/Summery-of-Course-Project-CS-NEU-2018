--数据寄存器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_dr is
end ms_dr;

architecture modelsim of ms_dr is
component DREG	--数据寄存器
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--输入数据
			W : in std_logic;	--写命令
			R : in std_logic;	--读命令
			DO : out std_logic_vector(15 downto 0)	--输出数据
			);
	end component;	
	
	signal CLK : std_logic;	--时钟信号
	signal DI : std_logic_vector(15 downto 0);	--输入数据
	signal W : std_logic;	--写命令
	signal R : std_logic;	--读命令
	signal DO : std_logic_vector(15 downto 0);	--输出数据
begin
DR : DREG port map(CLK, DI, W, R, DO);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;
process
	begin
		DI<= "1000111001111111";
		wait for 40 ns;
		DI<= "1001000000011000";
		wait for 40 ns;
		DI<= "1111111100000000";
		wait for 40 ns;
		DI<= "1000011110000000";
		wait for 40 ns;
		DI<= "0100001111000011";
		wait for 40 ns;
	end process;
process
	begin
		W<= '0';
		wait for 60 ns;
		W<='1';
		wait for 60 ns;
	end process;
process
	begin
		R<= '0';
		wait for 120 ns;
		R<='1';
		wait for 120 ns;
	end process;
end modelsim;