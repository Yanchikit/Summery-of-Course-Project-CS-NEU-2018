--MAREG地址寄存器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MAREG is
	port (CLK : in std_logic;	--时钟信号
			AI : in std_logic_vector(3 downto 0);
			IMAR : in std_logic;	--寄存命令
			AO : out std_logic_vector(3 downto 0)
			);
end MAREG;

architecture vhd_marge of MAREG is
signal temp : std_logic_vector(3 downto 0):="0000";
begin
AO <= temp;
	process(CLK, IMAR)
	begin
		if(rising_edge(CLK)) then	--时钟上升沿
			if(IMAR = '1') then	--寄存信号有效
				temp <= AI;
			end if;
		end if;
	end process;
end vhd_marge;


