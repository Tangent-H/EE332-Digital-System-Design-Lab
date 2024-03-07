-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Thu Mar  7 22:05:35 2024
-- Host        : Y9000X-TANGENT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/MyProjects/FPGA/Lab2/full_addr/full_addr.sim/sim_2/impl/func/xsim/tb_full_addr_clk_func_impl.vhd
-- Design      : full_addr_clk
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity full_addr_clk is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    clk : in STD_LOGIC;
    Sum : out STD_LOGIC;
    Cout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of full_addr_clk : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of full_addr_clk : entity is "e02c4cd9";
end full_addr_clk;

architecture STRUCTURE of full_addr_clk is
  signal A_IBUF : STD_LOGIC;
  signal B_IBUF : STD_LOGIC;
  signal Cin_IBUF : STD_LOGIC;
  signal Cout_OBUF : STD_LOGIC;
  signal Cout_i_1_n_0 : STD_LOGIC;
  signal Sum0 : STD_LOGIC;
  signal Sum_OBUF : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Cout_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of Sum_i_1 : label is "soft_lutpair0";
begin
A_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => A,
      O => A_IBUF
    );
B_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => B,
      O => B_IBUF
    );
Cin_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Cin,
      O => Cin_IBUF
    );
Cout_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Cout_OBUF,
      O => Cout
    );
Cout_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Cin_IBUF,
      I1 => B_IBUF,
      I2 => A_IBUF,
      O => Cout_i_1_n_0
    );
Cout_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => Cout_i_1_n_0,
      Q => Cout_OBUF,
      R => '0'
    );
Sum_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Sum_OBUF,
      O => Sum
    );
Sum_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => Cin_IBUF,
      I1 => A_IBUF,
      I2 => B_IBUF,
      O => Sum0
    );
Sum_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => Sum0,
      Q => Sum_OBUF,
      R => '0'
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
end STRUCTURE;
