library ieee;
use ieee.std_logic_1164.all ;

entity DFlipFlop is 
port 
(
    D : in std_logic ;
    Clk : in std_logic ;
    Reset : in std_logic ;
    Q : inout  std_logic ;
    P : inout  std_logic
) ;
end DFlipFlop ;

architecture Implementation of DFlipFlop is
    signal Master_Q : std_logic ;
    signal Master_P : std_logic ;
    signal Clk_NOT : std_logic ;
    component GatedDLatch
    port
    (
        D : in std_logic ;
        E : in std_logic ;
	    RESET : in std_logic ;
        Q : buffer std_logic ;
        P : buffer std_logic 
    ) ;
    end component ;
    begin
        CLK_NOT <= not(Clk) ;
       Master : GatedDLatch port map(D, CLK_NOT, Reset, Master_Q, Master_P);
	Slave  : GatedDLatch port map(Master_Q, Clk, Reset, Q, P);
    end Implementation ;
