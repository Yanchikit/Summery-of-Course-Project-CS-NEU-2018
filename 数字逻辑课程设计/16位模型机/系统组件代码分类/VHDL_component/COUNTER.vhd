--COUNTER节拍发生器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COUNTER is
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;	--初始
			T : out std_logic_vector(7 downto 0)
			);
end COUNTER;
architecture vhd_counter of COUNTER is
signal temp : std_logic_vector(7 downto 0);
begin
	T <= temp;
	process(CLK, CLR)
	begin
		if(CLR = '1') then	--初始
			temp <= "00000001";
		elsif(rising_edge(CLK)) then	--时钟信号上升沿
			temp(0)<=temp(7);
			temp(1)<=temp(0);
			temp(2)<=temp(1);
			temp(3)<=temp(2);
			temp(4)<=temp(3);
			temp(5)<=temp(4);
			temp(6)<=temp(5);
			temp(7)<=temp(6);
		end if;
	end process;
end vhd_counter;