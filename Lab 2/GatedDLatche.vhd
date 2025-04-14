library ieee;
use ieee.std_logic_1164.all ;

entity GatedDLatch is 
port
(
    D : in std_logic ;
    E : in std_logic ;
    Q : buffer std_logic ;
    P : buffer std_logic 
) ;
end entity GatedDLatch ;

architecture Implementation of GatedDLatch is
signal S,R : std_logic ; 

begin  
R <= not(D) and E ;
S <= D and E ;
Q <= R nor P ;
P <= Q nor S ;

end architecture Implementation ;


