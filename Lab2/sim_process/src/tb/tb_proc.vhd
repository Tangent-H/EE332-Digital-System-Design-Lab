----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2024 16:58:56
-- Design Name: 
-- Module Name: tb_proc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_proc is
--  Port ( );
end tb_proc;

architecture Behavioral of tb_proc is
    component proc is
        Port ( x : in STD_LOGIC;
        y : in STD_LOGIC;
        z : in STD_LOGIC;
        res1 : out STD_LOGIC;
        res2 : out STD_LOGIC);
    end component;
    signal x_tb, y_tb, z_tb, res1_tb, res2_tb : STD_LOGIC;

begin
    uut : proc port map(x=>x_tb, y=>y_tb, z=>z_tb, res1=>res1_tb, res2=>res2_tb);   -- port map means connecting the signals to the ports of the component
    proc_x : process
    begin
        x_tb <= '0';
        wait for 40 ns;
        x_tb <= '1';
        wait for 40 ns;
    end process proc_x;

    proc_y : process
    begin
        y_tb <= '0';
        wait for 20 ns;
        y_tb <= '1';
        wait for 20 ns;
    end process proc_y;
    
    proc_z : process
    begin
        z_tb <= '0';
        wait for 10 ns;
        z_tb <= '1';
        wait for 10 ns;
    end process proc_z;
end Behavioral;
