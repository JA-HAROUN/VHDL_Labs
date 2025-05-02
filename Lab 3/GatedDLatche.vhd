LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY GatedDLatch IS
    PORT (
        D : IN STD_LOGIC;
        E : IN STD_LOGIC;
        Q : BUFFER STD_LOGIC;
        P : BUFFER STD_LOGIC
    );
END ENTITY GatedDLatch;

ARCHITECTURE Implementation OF GatedDLatch IS
    SIGNAL S, R : STD_LOGIC;

BEGIN
    R <= NOT(D) AND E;
    S <= D AND E;
    Q <= R NOR P;
    P <= Q NOR S;

END ARCHITECTURE Implementation;