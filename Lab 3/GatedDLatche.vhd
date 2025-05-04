library ieee;
use ieee.std_logic_1164.all ;

entity GatedDLatch is 
port
(
    D : in std_logic ;
    E : in std_logic ;
    Reset : in std_logic;
    Q : buffer std_logic ;
    P : buffer std_logic 
) ;
end entity GatedDLatch ;

architecture Implementation of GatedDLatch is
signal S,R : std_logic ; 
begin  
    R <= (not(D) and E) and not(RESET);  
    S <= (D and E) and not(RESET);
    Q <= '0' when RESET = '1' else R nor P ;
    P <= '1' when RESET = '1' else Q nor S ;

end architecture Implementation ;


