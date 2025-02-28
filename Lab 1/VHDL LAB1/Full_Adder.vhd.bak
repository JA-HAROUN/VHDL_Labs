LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS
    PORT (
        A_2, B_2, Cin_2 : IN STD_LOGIC;
        Sum_2, Cout_2 : OUT STD_LOGIC
    );
END FA;

ARCHITECTURE ADD_FULL OF FA IS

    COMPONENT HA
        PORT (
            A_1 : IN STD_LOGIC;
            B_1 : IN STD_LOGIC;
            Sum_1 : OUT STD_LOGIC;
            Carry_1 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL S1, C1, C2 : STD_LOGIC;

BEGIN
    -- First half adder
    HA1 : HA PORT MAP(A_2, B_2, S1, C1);

    -- Second half adder [Get the sum]
    HA2 : HA PORT MAP(S1, Cin_2, Sum_2, C2);

    -- Get the final carry out
    Cout_2 <= C1 OR C2;

END ADD_FULL;