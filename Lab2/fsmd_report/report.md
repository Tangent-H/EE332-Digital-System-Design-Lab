# Fibonacci Function Implementation with FSMD

# Introduction

In this lab, I implement a Fibonacci function on an FPGA board using **F**inite **S**tate **M**achine with **D**atapath (FSMD). It can receive 6-bit input using the switches on board and calculate its Fibonacci value. The calculated value (in hexadecimal) is displayed by seven-segment LED digital tubes.

Keywords: Fibonacci, FSMD, seven-segment display

# I/O Interface

![hardware](./assets/hardware.png)

As shown in Figure todo, the elements are:

- `6-bit input`: the desired `n` to calculate the Fibonacci sequence, i.e., fib(n).
- `ready`: when this LED is lit, it means the system is in the `idle` state and it is ready to receive the user’s input.
- `Fibonacci result`: the fib(n) result is displayed in hexadecimal.
- `reset`: reset the system.

- `start/load`: this signal is represented only by the symbol `start` in the program and the ASM chart. When `start=1`, the system will clear the previous result and enter the `load` state. At this time, the user is supposed to enter the `6-bit input`. Then, set start=0, and the system will start operating to calculate the Fibonacci value.

# Design Procedure

## Step 1: Defining the input and output signals

According to the I/O interface defined above, the input and output signals required are:

- Input signals:
  - `clk`: system clock.
  - `rst`: reset signal.
  - `n`: 6-bit input signal to calculate the $n^{th}$ term of the Fibonacci sequence.
  - `start`: command. The system enters the `load` state when `start=1` and starts operating after the `start` switch from 1 to 0.

- Output signals:
  - `fib_n`: calculation results of $fib(n)$.
  - `ready`: indicate the system is idle.

## Step 2: Converting the algorithm to an ASM chart