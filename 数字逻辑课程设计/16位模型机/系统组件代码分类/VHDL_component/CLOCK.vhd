--CLOCK时钟信号产生器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CLOCK is
	port (CLK : in std_logic;	--50MHz T=20ns 5e7T= 1s
			CLK_OUT : out std_logic
			);
end CLOCK;

architecture vhd of CLOCK is
signal temp : std_logic:='0';
begin
CLK_OUT <= temp;
	process(CLK)
	variable T : integer := 10;	--25000000
	variable counter : integer range 0 to T;
	begin
		if(counter = T) then
			counter := 0;
			temp <= not temp;
		elsif(rising_edge(CLK))then
			counter := counter + 1;
		end if;
	end process;
end;
		
