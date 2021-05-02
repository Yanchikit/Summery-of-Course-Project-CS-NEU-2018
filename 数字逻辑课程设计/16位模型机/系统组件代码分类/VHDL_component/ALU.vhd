--ALU 算数逻辑单元
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--16位数据加法
entity ALU is
	port (DA,DB : in std_logic_vector(15 downto 0);	--输入数据
			Code : in std_logic_vector(3 downto 0);	--输入命令
			ISUM, ESUM : in std_logic;	--输入、输出控制
			ALU_OUT : out std_logic_vector(15 downto 0);	--ALU输出数据
			Zero, Over, Nege : out std_logic:='0' --标志位
			);
end ALU;

architecture vhd_alu of ALU is
signal DO : std_logic_vector(15 downto 0);
begin
process(DA, DB, ISUM)
variable D1, D2, temp : std_logic_vector(15 downto 0);
begin
	if(ISUM = '1')then 
		D1 := DA;
		D2 := DB;
		Zero <= '0';
		Over <= '0';
		Nege <= '0';
		if (Code = "0010") then	--加法
			temp := D1 + D2;
			if (temp < D1 or temp < D2) then 
				Over <= '1'; 
			else 
				Over <= '0';
			end if;
		elsif (Code = "0011") then	--减法
			temp := D1 - D2;
			if (temp > D1) then 
				Nege <= '1'; 
			else 
				Nege <= '0';
			end if;
		elsif (Code = "0100") then	--自增
			temp := D1 + 1;
			if (temp < D1) then 
				Over <= '1'; 
			else 
				Over <= '0';
			end if;
		elsif (Code = "0101") then	--自减
			temp := D1 - 1;
			if (temp > D1) then 
				Nege <= '1'; 
			else 
				Nege <= '0';
			end if;
		elsif (Code = "0110") then	--逻辑与
			temp := D1 and D2;
		elsif (Code = "0111") then	--逻辑或
			temp := D1 or D2;
		elsif (Code = "1000") then	--逻辑非
			temp := not D1;
		elsif (Code = "1001") then	--逻辑异或
			temp := D1 xor D2;
		else
			temp := temp;
		end if;
		if (temp = "0000000000000000") then 
			Zero <= '1'; 
		else 
			Zero <= '0';
		end if;
		DO <= temp;
	end if;
end process;
ALU_OUT <= DO when ESUM = '1' else "ZZZZZZZZZZZZZZZZ";	--输出有效 否则高阻态
end vhd_alu;
