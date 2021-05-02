# 十六位模型机

[TOC]

### 一、设计总要求

1、总线结构

```
单总线
数据总线位数 16位
地址总线 4位
```

2、存储器

```
内存容量 16*16位
```

3、操作控制器

```
用硬布线控制器实现 16位微操作控制信号
```

4、运算器

5、指令规模

```
10条指令代码及信号
送数(LD)加法(ADD)减法(SUB)自增(INC)自减(DEC)
逻与(AND)逻或(OR)逻非(NOT)异或(XOR)停机(HALT)
```

### 二、整机逻辑图框图

### 三、指令系统

```
10条指令代码及信号
送数(LD)		0000000000111110->0001
加法(ADD)		0000000011000110->0010
减法(SUB) 	0001001100011110->0011
自增(INC)		0010111011100111->0100
自减(DEC)		0000111100000001->0101
逻与(AND)		1011100010000011->0110
逻或(OR)		1000011111111110->0111
逻非(NOT) 	0101010101011110->1000
异或(XOR) 	0111100001010000->1001
停机(HALT)	0000000001110110->1111
```



### 四、指令执行流程

1. LD送数	LD A,6

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="0001" 移数
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   T6: dbus->A_DR	W='1' 写入
   T7: NULL
   ```

2. ADD加法     ADD A,7

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="0010" 加法
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   	A+7			R='1' ISUM='1' 计算
   T6: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T7: NULL
   ```

3. SUB减法     SUB A,7

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="0011" 减法
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   	A-7			R='1' ISUM='1' 计算
   T6: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T7: NULL
   ```

4. 自增     INC A

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IRR='1' 读入	Code="0100" 自增
   T3: A+1->SR		R='1' ISUM='1' 计算
   T4: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T5: NULL
   T6: NULL
   T7: NULL
   ```

5. 自减

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IRR='1' 读入	Code="0101" 自减
   T3: A-1->SR		R='1' ISUM='1' 计算
   T4: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T5: NULL
   T6: NULL
   T7: NULL
   ```

6. 逻辑与

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="0110" 移数
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   	A and 7			R='1' ISUM='1' 计算
   T6: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T7: NULL
   ```

7. 逻辑或

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="0111" 移数
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   	A or 7			R='1' ISUM='1' 计算
   T6: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T7: NULL
   ```

8. 逻辑非

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IRR='1' 读入	Code="1000" 非
   T3: not A->SR		R='1' ISUM='1' 计算
   T4: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T5: NULL
   T6: NULL
   T7: NULL
   ```

9. 逻辑异或

   ```
   T0:	PC->MAR->ABUS	IMAR= '1'读出
   T1: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T2: PC+1->PC	IPC='1' 计数
   	DR->IR		IIR='1' 读入	Code="1001" 移数
   T3: PC->MAR->ABUS	IMAR= '1'读出
   T4: DBUS->DR	IDR='1'	EDR='1' 写入dbus
   T5: PC+1->PC	IPC='1' 计数
   	A xor 7			R='1' ISUM='1' 计算
   T6: ALU->SR->dubs	ESUM='1' 输出
   	dbus->A_DR	W='1' 写入	EDR='0' 高阻态
   T7: NULL
   ```

10. 停机

    ```
    T0:	PC->MAR->ABUS	IMAR= '1'读出
    T1: DBUS->DR	IDR='1' 写入
    T2: PC+1->PC	IPC='1' 计数
    	DR->IR		IIR=0 接受指令	Code="1111"停机
    				IPC='0'不计数 EDR='0'不输出 IIR='1'
    T3: NULL
    T4: NULL
    T5: NULL
    T6: NULL
    T7: NULL
    ```



### 五、微操作控制信号

    程序计数器 PC 的计数控制信号 IPC
    地址寄存器 MAR 的寄存命令信号 IMAR
    数据寄存器 DR 的寄存命令信号 IDR
    数据寄存器 DR 的输出控制信号 EDR
    累加器 A 的输入命令信号 R
    累加器 A 的输出控制信号 W
    ALU 的加法运算控制信号 ISUM
    ALU 的输出控制信号 ESUM
    指令寄存器 IR 的寄存命令信号 IIR。

### 六、顶层设计原理图

### 七、VHDL

### 八、仿真调试

