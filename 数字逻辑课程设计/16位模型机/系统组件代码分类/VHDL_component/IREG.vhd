--IR指令寄存器
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity IREG is
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--指令数据
			IIR : in std_logic;	--寄存信号
			Code : out std_logic_vector(3 downto 0);	--指令信号
			ERROR,STOP : out std_logic
			);
end IREG;

architecture vhd_ireg of IREG is
signal temp : std_logic_vector(15 downto 0);
begin
	process(CLK, IIR)
	begin
		if(rising_edge(CLK)) then	--时钟信号上升沿
			if(IIR = '1') then	--寄存信号有效
				temp <= DI;
			end if;
		end if;
	end process;
	
	process(CLK, temp)
	begin
		case temp is	--产生指令信号（相当于一个译码器）
			when "0000000000111110" => Code <= "0001";ERROR<='0';STOP<='0';	--移数信号
			when "0000000011000110" => Code <= "0010";ERROR<='0';STOP<='0';	--加法信号
			when "0001001100011110" => Code <= "0011";ERROR<='0';STOP<='0';	--减法信号
			when "0010111011100111" => Code <= "0100";ERROR<='0';STOP<='0';	--自增信号
			when "0000111100000001" => Code <= "0101";ERROR<='0';STOP<='0';	--自减信号
			when "1011100010000011" => Code <= "0110";ERROR<='0';STOP<='0';	--逻辑与信号
			when "1000011111111110" => Code <= "0111";ERROR<='0';STOP<='0';	--逻辑或信号
			when "0101010101011110" => Code <= "1000";ERROR<='0';STOP<='0';	--逻辑非信号
			when "0111100001010000" => Code <= "1001";ERROR<='0';STOP<='0';	--逻辑异或信号
			when "0000000001110110" => Code <= "1111";ERROR<='0';STOP<='1';	--停机信号
			when others => Code <= "0000";ERROR<='1';STOP<='1'; --异常错误停机
		end case;
	end process;
end vhd_ireg;