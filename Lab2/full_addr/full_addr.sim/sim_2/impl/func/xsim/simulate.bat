@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Mar 08 00:07:14 +0800 2024
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_full_addr_clk_func_impl -key {Post-Implementation:sim_2:Functional:tb_full_addr_clk} -tclbatch tb_full_addr_clk.tcl -wdb D:/MyProjects/FPGA/Lab2/full_addr/full_addr.sim/sim_2/impl/func/xsim/wav_db.wdb -log simulate.log"
call xsim  tb_full_addr_clk_func_impl -key {Post-Implementation:sim_2:Functional:tb_full_addr_clk} -tclbatch tb_full_addr_clk.tcl -wdb D:/MyProjects/FPGA/Lab2/full_addr/full_addr.sim/sim_2/impl/func/xsim/wav_db.wdb -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
