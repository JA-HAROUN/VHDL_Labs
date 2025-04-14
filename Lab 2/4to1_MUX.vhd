library ieee;
use ieee.std_logic_1164.all ;

entity MUX4_1 is 
port
(
    O1 : in std_logic ;
    O2 : in std_logic ;
    O3 : in std_logic ;
    O4 : in std_logic ;
    Selector : in std_logic_vector (1 downto 0) ;
    SOUT : out std_logic
) ;
end MUX4_1 ;

architecture behavior of MUX4_1 is
begin
    SOUT <= O1 when Selector = "00"
    else O2 when Selector = "01"
    else O3 when Selector = "10"
    else O4 ;
end behavior ;
