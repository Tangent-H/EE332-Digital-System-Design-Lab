# 设计思路

## Top module

1. 接收板上push button电平跳变信号
2. 接收板上load switch电平信号，并据此设置两种模式
3. 在load='1'的情况下，读取12个switch的信号->BCD码
4. 读取计数结果，点12个灯or8段LED
5. 实例化多个counter，分别记录个位、十位、百位

## Frequency divider

输入：100Mhz时钟信号（来自板上）

输出：1Hz pulse

实现：带有reset的计数器

## Counter

输入：Frequency divider的pulse

输出：BCD计数结果

实现：带有reset, set的BCD计数器（仅记录一位）





注意：时钟信号需要同步