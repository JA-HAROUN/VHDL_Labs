LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY test_Half_Adder IS
END test_Half_Adder;

ARCHITECTURE test_HA OF test_Half_Adder IS

    COMPONENT HALF_ADDER IS
        PORT (
            A_1 : IN STD_LOGIC;
            B_1 : IN STD_LOGIC;
            Sum_1 : OUT STD_LOGIC;
            Carry_1 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A, B : STD_LOGIC := '0';
    SIGNAL S, Cout : STD_LOGIC;

BEGIN

    HALF : HALF_ADDER
    PORT MAP(
        A_1 => A,
        B_1 => B,
        Sum_1 => S,
        Carry_1 => Cout
    );

    PROCESS BEGIN

        WAIT FOR 2 ns;

        FOR i IN 0 TO 1 LOOP
            FOR j IN 0 TO 1 LOOP

                A <= NOT A;
                WAIT FOR 1 ns;

            END LOOP;

            B <= NOT B;
            WAIT FOR 1 ns;

        END LOOP;

        WAIT;

    END PROCESS;

END test_HA;