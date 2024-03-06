-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun Feb 25 15:14:58 2024
-- Host        : Y9000X-TANGENT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/Tangent/SUSTech/大三下/课程资料/DSD/Lab/Lab1/Tutorial/Tutorial.sim/sim_1/impl/func/xsim/counter_tbw_func_impl.vhd
-- Design      : Counter
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Counter is
  port (
    CLOCK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    DIRECTION : in STD_LOGIC;
    COUNT_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Counter : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of Counter : entity is "c30fa0af";
end Counter;

architecture STRUCTURE of Counter is
  signal CLOCK_IBUF : STD_LOGIC;
  signal CLOCK_IBUF_BUFG : STD_LOGIC;
  signal COUNT_OUT_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DIRECTION_IBUF : STD_LOGIC;
  signal RESET_IBUF : STD_LOGIC;
  signal \count_in[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_in[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_in[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_in[3]_i_1_n_0\ : STD_LOGIC;
  signal delay : STD_LOGIC;
  signal eqOp : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_in[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_in[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_in[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_in[3]_i_1\ : label is "soft_lutpair0";
  attribute inverted : string;
  attribute inverted of \delay_reg[0]_inv\ : label is "yes";
begin
CLOCK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLOCK_IBUF,
      O => CLOCK_IBUF_BUFG
    );
CLOCK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLOCK,
      O => CLOCK_IBUF
    );
\COUNT_OUT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => COUNT_OUT_OBUF(0),
      O => COUNT_OUT(0)
    );
\COUNT_OUT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => COUNT_OUT_OBUF(1),
      O => COUNT_OUT(1)
    );
\COUNT_OUT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => COUNT_OUT_OBUF(2),
      O => COUNT_OUT(2)
    );
\COUNT_OUT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => COUNT_OUT_OBUF(3),
      O => COUNT_OUT(3)
    );
DIRECTION_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => DIRECTION,
      O => DIRECTION_IBUF
    );
RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RESET,
      O => RESET_IBUF
    );
\count_in[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => COUNT_OUT_OBUF(0),
      O => \count_in[0]_i_1_n_0\
    );
\count_in[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => COUNT_OUT_OBUF(0),
      I1 => DIRECTION_IBUF,
      I2 => COUNT_OUT_OBUF(1),
      O => \count_in[1]_i_1_n_0\
    );
\count_in[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"78E1"
    )
        port map (
      I0 => COUNT_OUT_OBUF(0),
      I1 => DIRECTION_IBUF,
      I2 => COUNT_OUT_OBUF(2),
      I3 => COUNT_OUT_OBUF(1),
      O => \count_in[2]_i_1_n_0\
    );
\count_in[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FE01"
    )
        port map (
      I0 => DIRECTION_IBUF,
      I1 => COUNT_OUT_OBUF(0),
      I2 => COUNT_OUT_OBUF(1),
      I3 => COUNT_OUT_OBUF(3),
      I4 => COUNT_OUT_OBUF(2),
      O => \count_in[3]_i_1_n_0\
    );
\count_in_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLOCK_IBUF_BUFG,
      CE => delay,
      CLR => RESET_IBUF,
      D => \count_in[0]_i_1_n_0\,
      Q => COUNT_OUT_OBUF(0)
    );
\count_in_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLOCK_IBUF_BUFG,
      CE => delay,
      CLR => RESET_IBUF,
      D => \count_in[1]_i_1_n_0\,
      Q => COUNT_OUT_OBUF(1)
    );
\count_in_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLOCK_IBUF_BUFG,
      CE => delay,
      CLR => RESET_IBUF,
      D => \count_in[2]_i_1_n_0\,
      Q => COUNT_OUT_OBUF(2)
    );
\count_in_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLOCK_IBUF_BUFG,
      CE => delay,
      CLR => RESET_IBUF,
      D => \count_in[3]_i_1_n_0\,
      Q => COUNT_OUT_OBUF(3)
    );
\delay[0]_inv_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => delay,
      O => eqOp
    );
\delay_reg[0]_inv\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLOCK_IBUF_BUFG,
      CE => '1',
      D => eqOp,
      PRE => RESET_IBUF,
      Q => delay
    );
end STRUCTURE;
