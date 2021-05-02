--RAM存储器仿真文件
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_ram is
end ms_ram;

architecture modelsim of ms_ram is
component RAM	--程序计数器
	port (CS : in std_logic;	--工作使能端
			WR : in std_logic;	--读写使能端
			Add_IN : in std_logic_vector(3 downto 0);
			Address : in std_logic_vector(3 downto 0);
			DI : in std_logic_vector(15 downto 0);
			DO : out std_logic_vector(15 downto 0)	
			);
	end component;	
	
	signal CS : std_logic;	--时钟信号
	signal WR : std_logic;	--读写使能端
	signal Add_IN : std_logic_vector(3 downto 0);
	signal Address : std_logic_vector(3 downto 0);
	signal DI : std_logic_vector(15 downto 0);
	signal DO : std_logic_vector(15 downto 0);
begin
R : RAM port map(CS, WR, Add_IN, Address, DI, DO);
process
	begin
		CS<= '1';
		wait;
	end process;

process
	begin
		WR<= '0';
		wait for 100 ns;
		WR<='1';
		wait for 100 ns;
	end process;
process
	begin
		Address <= "0000";
		wait for 20 ns;
		Address <= "0001";
		wait for 20 ns;
		Address <= "0010";
		wait for 20 ns;
		Address <= "0011";
		wait for 20 ns;
		Address <= "0100";
		wait for 20 ns;
	end process;
process
	begin
		Add_IN<="0000";DI<="0100010011111001";
		wait for 20 ns;
		Add_IN<="0001";DI<="1000111000011110";
		wait for 20 ns;
		Add_IN<="0010";DI<="0000000011111110";
		wait for 20 ns;
		Add_IN<="0011";DI<="1111100111110001";
		wait for 20 ns;
		Add_IN<="0100";DI<="0000001111110000";
		wait for 20 ns;
	end process;
end modelsim;