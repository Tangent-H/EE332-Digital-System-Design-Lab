-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Mar  4 17:51:55 2024
-- Host        : Y9000X-TANGENT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/MyProjects/FPGA/Lab2/sim_process/sim_process.sim/sim_1/synth/func/xsim/tb_proc_func_synth.vhd
-- Design      : proc
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc is
  port (
    x : in STD_LOGIC;
    y : in STD_LOGIC;
    z : in STD_LOGIC;
    res1 : out STD_LOGIC;
    res2 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of proc : entity is true;
end proc;

architecture STRUCTURE of proc is
  signal res2_OBUF : STD_LOGIC;
  signal x_IBUF : STD_LOGIC;
  signal y_IBUF : STD_LOGIC;
  signal z_IBUF : STD_LOGIC;
begin
res1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => res2_OBUF,
      O => res1
    );
res1_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => x_IBUF,
      I1 => y_IBUF,
      I2 => z_IBUF,
      O => res2_OBUF
    );
res2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => res2_OBUF,
      O => res2
    );
x_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => x,
      O => x_IBUF
    );
y_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => y,
      O => y_IBUF
    );
z_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => z,
      O => z_IBUF
    );
end STRUCTURE;
