--PC程序计数器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;
			IPC : in std_logic;	--控制信号
			PC_OUT : out std_logic_vector(3 downto 0)
			);
end PC;

architecture vhd_pc of PC is
signal temp : std_logic_vector(3 downto 0);
begin
	process(CLK, CLR, IPC)
	begin	
		if(CLR = '1') then	--清零
			temp <= "0000";
		elsif(rising_edge(CLK)) then	--时钟上升沿
			if(IPC = '1')then	--控制信号有效
				temp <= temp + 1;	--PC + 1
			end if;
		end if;
	end process;
PC_OUT <= temp;
end vhd_pc;	