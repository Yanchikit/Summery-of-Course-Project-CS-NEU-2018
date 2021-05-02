--DREG16位累加器/数据寄存器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DREG is
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--输入数据
			W : in std_logic;	--写命令
			R : in std_logic;	--读命令
			DO : out std_logic_vector(15 downto 0)	--输出数据
			);
end DREG;

architecture vhd_dreg of DREG is
signal temp : std_logic_vector(15 downto 0):="ZZZZZZZZZZZZZZZZ";
begin
	process(CLK, W, R)
	begin
		if(rising_edge(CLK))then	--时钟上升沿
			if(W='1') then	--写入
				temp <= DI;
			end if;
		end if;
	end process;
DO <= temp when R='1' else "ZZZZZZZZZZZZZZZZ";	--读命令 否则高阻态
end vhd_dreg;