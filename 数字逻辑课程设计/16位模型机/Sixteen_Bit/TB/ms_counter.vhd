--节拍发生器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_counter is
end ms_counter;

architecture modelsim of ms_counter is
component COUNTER	--节拍发生器
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;	--初始
			T : out std_logic_vector(7 downto 0)
			);
	end component;	
	
signal CLK : std_logic;	--时钟信号
signal CLR : std_logic;	--初始
signal T : std_logic_vector(7 downto 0);
begin
CT : COUNTER port map(CLK, CLR, T);
process
	begin
		CLK<= '0';
		wait for 20 ns;
		CLK<='1';
		wait for 20 ns;
	end process;
process
	begin
		CLR <= '1';
		wait for 60 ns;
		CLR <= '0';
		wait;
	end process;

end modelsim;