--CTRL控制电路
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CTRL is
	port (CLK : in std_logic;	--时钟信号
			Code : in std_logic_vector(3 downto 0);	--指令信号	from IREG
			T : in std_logic_vector(7 downto 0);	--节拍信号	from COUNTER
			
			IPC : out std_logic:='0';	--PC控制信号
			IMAR : out std_logic:='0';	--MAREG寄存信号
			IDR, EDR : out std_logic:='0';	--DREG寄存、输出信号
			W, R : out std_logic:='0';	--ALU中DREG输入输出信号
			Code_A : out std_logic_vector(3 downto 0);
			ISUM, ESUM : out std_logic:='0';	--ALU控制、输出信号
			IIR : out std_logic:='0'	--IREG寄存信号
			);
end CTRL;

architecture vhd_ctrl of CTRL is
signal Code1,Code2,Code3,Code4,Code5,Code6,Code7,Code8,Code9,Code15 : std_logic:='0';	--命令信号中间变量
signal T0, T1, T2, T3, T4, T5, T6, T7 : std_logic:='0';	--节拍信号中间变量
signal C1, C2, C3 : std_logic:='0';	--指令分类
begin
--命令信号保存------------------------------------------------------------------------
Code1 <= (not Code(3)) and (not Code(2)) and (not Code(1)) and (Code(0));	--0001
Code2 <= (not Code(3)) and (not Code(2)) and (Code(1)) and (not Code(0));	--0010
Code3 <= (not Code(3)) and (not Code(2)) and (Code(1)) and (Code(0));	--0011
Code4 <= (not Code(3)) and (Code(2)) and (not Code(1)) and (not Code(0));	--0100
Code5 <= (not Code(3)) and (Code(2)) and (not Code(1)) and (Code(0));	--0101
Code6 <= (not Code(3)) and (Code(2)) and (Code(1)) and (not Code(0));	--0110
Code7 <= (not Code(3)) and (Code(2)) and (Code(1)) and (Code(0));	--0111
Code8 <= (Code(3)) and (not Code(2)) and (not Code(1)) and (not Code(0));	--1000
Code9 <= (Code(3)) and (not Code(2)) and (not Code(1)) and (Code(0));	--1001
Code15 <= (Code(3)) and (Code(2)) and (Code(1)) and (Code(0));	--1111

C1 <= Code1;
C2 <= Code2 or Code3 or Code6 or Code7 or Code9;
C3 <= Code4 or Code5  or Code8;
--节拍信号保存------------------------------------------------------------------------
T0 <= (not T(7)) and (not T(6)) and (not T(5)) and (not T(4)) and (not T(3)) and (not T(2)) and (not T(1)) and (T(0));	--00000001
T1 <= (not T(7)) and (not T(6)) and (not T(5)) and (not T(4)) and (not T(3)) and (not T(2)) and (T(1)) and (not T(0));	--00000010
T2 <= (not T(7)) and (not T(6)) and (not T(5)) and (not T(4)) and (not T(3)) and (T(2)) and (not T(1)) and (not T(0));	--00000100
T3 <= (not T(7)) and (not T(6)) and (not T(5)) and (not T(4)) and (T(3)) and (not T(2)) and (not T(1)) and (not T(0));	--00001000
T4 <= (not T(7)) and (not T(6)) and (not T(5)) and (T(4)) and (not T(3)) and (not T(2)) and (not T(1)) and (not T(0));	--00010000
T5 <= (not T(7)) and (not T(6)) and (T(5)) and (not T(4)) and (not T(3)) and (not T(2)) and (not T(1)) and (not T(0));	--00100000
T6 <= (not T(7)) and (T(6)) and (not T(5)) and (not T(4)) and (not T(3)) and (not T(2)) and (not T(1)) and (not T(0));	--01000000
T7 <= (T(7)) and (not T(6)) and (not T(5)) and (not T(4)) and (not T(3)) and (not T(2)) and (not T(1)) and (not T(0));	--10000000
--微控制指令--------------------------------------------------------------------------
IPC <= (not Code15) and (T2 or ((C1 and T5) or (C2 and T5)));	--PC控制信号
IMAR <= (not Code15) and (T0 or ((C1 and T3) or (C2 and T3)));	--MAREG寄存信号	
IDR <= (not Code15) and (T1 or ((C1 and T4) or (C2 and T4)));	--DREG寄存信号
EDR <= (not Code15) and (T1 or T2 or (C1 and T4) or (C1 and T5) or (C1 and T6) or (C2 and T4) or (C2 and T5) or (C3 and T3));	--DREG输出信号
W <= (not Code15) and ((C1 and T6) or (C2 and T6) or (C3 and T4));	--ALU中DREG输入信号
R <= (not Code15) and ((C2 and T5) or (C3 and T3));	--ALU中DREG输出信号
Code_A <= Code;	--ALU操作指令
ISUM <= (not Code15) and ((C2 and T5) or (C3 and T3));		--ALU控制信号
ESUM <= (not Code15) and ((C2 and T6) or (C3 and T4));	--ALU输出信号
IIR <= (not Code15) and (T2);--IREG寄存信号
end vhd_ctrl;