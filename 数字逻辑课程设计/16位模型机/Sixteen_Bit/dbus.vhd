--dbus
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity dbus is
	port (D_ALU : in std_logic_vector(15 downto 0);
			D_DR : in std_logic_vector(15 downto 0);
			D_OUT : out std_logic_vector(15 downto 0)
			);
end dbus;

architecture vhd of dbus is
signal temp : std_logic_vector(15 downto 0):="ZZZZZZZZZZZZZZZZ";
begin
	process(D_ALU, D_DR)
	begin
		if not (D_ALU = "ZZZZZZZZZZZZZZZZ") then
			temp <= D_ALU;
		else
			temp <= D_DR;
		end if;
	end process;
D_OUT <= temp;
end;