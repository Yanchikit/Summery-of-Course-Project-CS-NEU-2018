--dbus仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_dbus is
end ms_dbus;

architecture modelsim of ms_dbus is
component dbus	--程序计数器
	port (D_ALU : in std_logic_vector(15 downto 0);
			D_DR : in std_logic_vector(15 downto 0);
			D_OUT : out std_logic_vector(15 downto 0)
			);
	end component;	
	
	signal D_ALU : std_logic_vector(15 downto 0);
	signal D_DR : std_logic_vector(15 downto 0);
	signal D_OUT : std_logic_vector(15 downto 0);
begin
d : dbus port map(D_ALU, D_DR, D_OUT);
process
	begin
		D_ALU <= "ZZZZZZZZZZZZZZZZ";
		wait for 30 ns;
		D_ALU <= "1001100011100010";
		wait for 30 ns;
		D_ALU <= "1000100000000000";
		wait for 30 ns;
		D_ALU <= "ZZZZZZZZZZZZZZZZ";
		wait for 30 ns;
		D_ALU <= "1011110111100110";
		wait for 30 ns;
		D_ALU <= "1111111110000000";
		wait for 30 ns;
	end process;
process
	begin
		D_DR <= "ZZZZZZZZZZZZZZZZ";
		wait for 80 ns;
		D_DR <= "1111111111111111";
		wait for 80 ns;
		D_DR <= "0000000000000000";
		wait for 80 ns;
		D_DR <= "ZZZZZZZZZZZZZZZZ";
		wait for 80 ns;
		D_DR <= "ZZZZZZZZZZZZZZZZ";
		wait for 80 ns;
		D_DR <= "0101010101010111";
		wait for 80 ns;
	end process;
end modelsim;