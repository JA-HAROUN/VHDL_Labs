library ieee;
use ieee.std_logic_1164.all ;

entity MUX2_1 is 
port
(
    O1 : in std_logic ;
    O2 : in std_logic ;
    Selector : in std_logic ;
    SOUT : out std_logic
) ;
end MUX2_1 ;

architecture behavior of MUX2_1 is
begin
    SOUT <= O1 when Selector = '0'
    else O2 ;
end behavior ;
