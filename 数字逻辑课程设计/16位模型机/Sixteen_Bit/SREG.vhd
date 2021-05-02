--SR结果发生器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SREG is
	port (DI : in std_logic_vector(15 downto 0);	--输入数据
			DO : out std_logic_vector(15 downto 0)	--输出数据
			);
end SREG;

architecture vhd_dreg of SREG is
begin
	DO <= DI;
end vhd_dreg;