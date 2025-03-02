LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY HALF_ADDER IS
    PORT (
        A_1 : IN STD_LOGIC;
        B_1 : IN STD_LOGIC;
        Sum_1 : OUT STD_LOGIC;
        Carry_1 : OUT STD_LOGIC
    );
END HALF_ADDER;

ARCHITECTURE ADD_HALF OF HALF_ADDER IS
BEGIN
    Sum_1 <= A_1 XOR B_1;
    Carry_1 <= A_1 AND B_1;
END ADD_HALF;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY work;
USE work.ALL;

ENTITY Full_Adder IS
    PORT (
        A_2, B_2, Cin_2 : IN STD_LOGIC;
        Sum_2, Cout_2 : OUT STD_LOGIC
    );
END Full_Adder;

ARCHITECTURE ADD_FULL OF Full_Adder IS

    COMPONENT HALF_ADDER
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
    HA1 : HALF_ADDER PORT MAP(A_2, B_2, S1, C1);

    -- Second half adder [Get the sum]
    HA2 : HALF_ADDER PORT MAP(S1, Cin_2, Sum_2, C2);

    -- Get the final carry out
    Cout_2 <= C1 OR C2;

END ADD_FULL;