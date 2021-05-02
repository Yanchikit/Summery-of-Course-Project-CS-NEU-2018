--16位模型机
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sixteen_Bit_CPU is
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;	--复位信号
			CS, WR : in std_logic;	--RAM的控制信号
			Add_IN : in std_logic_vector(3 downto 0); --RAM输入数据存放地址
			Input : in std_logic_vector(15 downto 0);	--RAM输入数据
			ALU_OUT : out std_logic_vector(15 downto 0);	--ALU输出数据
			Zero, Over, Nege : out std_logic; --标志位信号
			ERROR,STOP : out std_logic;
			
			Tap : out std_logic_vector(7 downto 0);	--节拍信号
			Code_IR : out std_logic_vector(3 downto 0);	--IR输出指令
			IPC_O : out std_logic;	--PC控制信号
			IMAR_O : out std_logic;	--MAR寄存信号
			IDR_O, EDR_O : out std_logic;	--DR寄存、输出信号
			W_O, R_O : out std_logic;	--ALU中DR输入输出信号
			ISUM_O : out std_logic;	--ALU控制信号
			ESUM_O : out std_logic;	--ALU输出信号
			IIR_O : out std_logic;	--IREG寄存信号
			ABUS_O : out std_logic_vector(3 downto 0);	--地址总线
			dbus_O : out std_logic_vector(15 downto 0)	--内部总线
			);
end Sixteen_Bit_CPU;

architecture vhd of Sixteen_Bit_CPU is
component MAREG	--地址寄存器
	port (CLK : in std_logic;	--时钟信号
			AI : in std_logic_vector(3 downto 0);
			IMAR : in std_logic;	--寄存命令
			AO : out std_logic_vector(3 downto 0)
			);
end component;	

component IREG	--指令寄存器
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--指令数据
			IIR : in std_logic;	--寄存信号
			Code : out std_logic_vector(3 downto 0);	--指令信号
			ERROR,STOP : out std_logic
			);
end component;

component COUNTER	--节拍发生器
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;	--初始
			T : out std_logic_vector(7 downto 0)
			);
end component;

component ALU	--算术逻辑单元
	port (DA,DB : in std_logic_vector(15 downto 0);	--输入数据
			Code : in std_logic_vector(3 downto 0);	--输入命令
			ISUM, ESUM : in std_logic;	--输入、输出控制
			ALU_OUT : out std_logic_vector(15 downto 0);	--ALU输出数据
			Zero, Over, Nege : out std_logic --标志位
			);
	end component;	
	
component DREG	--数据寄存器
	port (CLK : in std_logic;	--时钟信号
			DI : in std_logic_vector(15 downto 0);	--输入数据
			W : in std_logic;	--写命令
			R : in std_logic;	--读命令
			DO : out std_logic_vector(15 downto 0)	--输出数据
			);
	end component;	
	
component CLOCK	--时钟信号产生器
	port (CLK : in std_logic;	--50MHz T=20ns 5e7T= 1s
			CLK_OUT : out std_logic
			);
	end component;	

component PC	--程序计数器
	port (CLK : in std_logic;	--时钟信号
			CLR : in std_logic;
			IPC : in std_logic;	--控制信号
			PC_OUT : out std_logic_vector(3 downto 0)
			);
	end component;	

component CTRL	--控制电路
	port (CLK : in std_logic;	--时钟信号
			Code : in std_logic_vector(3 downto 0);	--指令信号	from IREG
			T : in std_logic_vector(7 downto 0);	--节拍信号	from COUNTER
			IPC : out std_logic;	--PC控制信号
			IMAR : out std_logic;	--MAREG寄存信号
			IDR, EDR : out std_logic;	--DREG寄存、输出信号
			W, R : out std_logic;	--ALU中DREG输入输出信号
			Code_A : out std_logic_vector(3 downto 0);
			ISUM : out std_logic;	--ALU控制信号
			ESUM : out std_logic;	--ALU输出信号
			IIR : out std_logic	--IREG寄存信号
			);
end component;

component RAM	--存储器
	port (CS : in std_logic;	--工作使能端
			WR : in std_logic;	--读写使能端
			Add_IN : in std_logic_vector(3 downto 0);
			Address : in std_logic_vector(3 downto 0);
			DI : in std_logic_vector(15 downto 0);
			DO : out std_logic_vector(15 downto 0)	
			);
end component;

component dbus	--内部数据总线
	port (D_ALU : in std_logic_vector(15 downto 0);
			D_DR : in std_logic_vector(15 downto 0);
			D_OUT : out std_logic_vector(15 downto 0)
			);
end component;

signal CLK_Used : std_logic;	--时钟信号	CL时钟信号产生器 --> 各个电路
signal T : std_logic_vector(7 downto 0);	--节拍信号	CT节拍发生器 --> CTRLM控制电路
signal Code : std_logic_vector(3 downto 0);	--指令信号	IR指令寄存器 --> CTRLM控制电路
signal Code_A : std_logic_vector(3 downto 0);	--指令信号	CTRLM控制电路 --> ALU
signal IPC : std_logic;	--PC信号	CTRLM控制电路 --> PC程序计数器
signal IMAR : std_logic;	--MAR寄存信号	CTRLM控制电路 --> MAR地址寄存器
signal IDR, EDR : std_logic;	--DR寄存、输出信号	CTRLM控制电路 --> DR数据寄存器
signal W, R : std_logic;	--ALU中DR输入输出信号	CTRLM控制电路 --> ALU数据寄存器
signal ISUM : std_logic;	--ALU指令信号	CTRLM控制电路 --> ALU算数逻辑单元
signal ESUM : std_logic;	--ALU输出信号	CTRLM控制电路 --> ALU算数逻辑单元
signal DA : std_logic_vector(15 downto 0);	--ALU输入数据
signal IIR : std_logic;	--IREG寄存信号	CTRLM控制电路 --> IR指令寄存器
signal Address : std_logic_vector(3 downto 0);	--地址数据	MAR数据寄存器 --> RAM存储器
signal A_OUT : std_logic_vector(15 downto 0); 
signal DR_OUT : std_logic_vector(15 downto 0); 
signal dbus_OUT : std_logic_vector(15 downto 0); 

signal ABUS : std_logic_vector(3 downto 0);	--地址线
signal D_BUS : std_logic_vector(15 downto 0);	--外部数据总线

begin
--输出信号赋值
Tap <= T;
Code_IR <= Code;
IPC_O <= IPC;
IMAR_O <= IMAR;
IDR_O <= IDR;	EDR_O<=EDR;
W_O <= W;
R_O <= R;
ISUM_O <= ISUM;
ESUM_O <= ESUM;
IIR_O <= IIR;
ABUS_O <= ABUS;
dbus_O <= dbus_OUT;
ALU_OUT <= A_OUT;

CL : CLOCK port map(CLK, CLK_Used);	--时钟信号产生器
CT : COUNTER port map(CLK_Used, CLR, T); --节拍发生器
CTRLM : CTRL port map(CLK_Used, Code, T, IPC, IMAR, IDR, EDR, W, R, Code_A, ISUM, ESUM, IIR);	--控制电路
IR : IREG port map(CLK_Used, dbus_OUT, IIR, Code, ERROR, STOP);	--指令寄存器
DR : DREG port map(CLK_Used, D_BUS, IDR, EDR, DR_OUT);	--数据寄存器
ACC : DREG port map(CLK_Used, dbus_OUT, W, R, DA);	--累加器
P : PC port map(CLK_Used, CLR, IPC, Address);	--程序寄存器
MAR : MAREG port map(CLK_Used, Address, IMAR, ABUS);	--地址寄存器
RAMM : RAM port map(CS, WR, Add_IN, ABUS, Input, D_BUS);	--存储器
A : ALU port map(DA, dbus_OUT, Code_A, ISUM, ESUM, A_OUT, Zero, Over, Nege);	--算数逻辑单元
d : dbus port map(A_OUT, DR_OUT, dbus_OUT);	--总线
end vhd;