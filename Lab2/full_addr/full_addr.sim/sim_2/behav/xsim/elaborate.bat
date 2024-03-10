@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Mar 10 16:12:31 +0800 2024
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 5f1dbacfa2794ecb83f94e46a2875436 --incr --debug typical --relax --mt 32 -L xil_defaultlib -L secureip --snapshot tb_full_addr_clk_behav xil_defaultlib.tb_full_addr_clk -log elaborate.log"
call xelab  -wto 5f1dbacfa2794ecb83f94e46a2875436 --incr --debug typical --relax --mt 32 -L xil_defaultlib -L secureip --snapshot tb_full_addr_clk_behav xil_defaultlib.tb_full_addr_clk -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
