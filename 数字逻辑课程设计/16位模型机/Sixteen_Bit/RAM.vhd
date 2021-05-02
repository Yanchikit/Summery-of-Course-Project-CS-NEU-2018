--RAM存储器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
	port (CS : in std_logic;	--工作使能端
			WR : in std_logic;	--读写使能端
			Add_IN : in std_logic_vector(3 downto 0);
			Address : in std_logic_vector(3 downto 0);
			DI : in std_logic_vector(15 downto 0);
			DO : out std_logic_vector(15 downto 0)	
			);
end RAM;
--16 * 16 bit
architecture vhd_ram of RAM is
TYPE matrix_index is array (15 downto 0) of std_logic_vector(15 downto 0);
begin
	process(CS, WR, Add_IN, Address, DI)
	variable Data : matrix_index;
	begin
		if(CS='1') then	--使能端有效
			if(WR = '0') then	--写有效
				Data(conv_integer(ADD_IN(3 downto 0))) := DI;
			elsif(WR = '1') then	--读有效
				DO <= Data(conv_integer(Address(3 downto 0)));
			end if;
		end if;
	end process;
end vhd_ram;