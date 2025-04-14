-- Dummy Clk component for simulation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clk is
    port (
        CLK_OUT : inout std_logic
    ) ;
end entity Clk;

architecture behavior of Clk is
begin
    process
    begin
        while true loop
            CLK_OUT <= '0';
            wait for 5 ns;
            CLK_OUT <= '1';
            wait for 5 ns;
        end loop;
    end process;
end architecture behavior;