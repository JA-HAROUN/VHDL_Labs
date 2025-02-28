LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY test_Full_Adder IS
END test_Full_Adder;

ARCHITECTURE check_Full_Adder OF test_Full_Adder IS

    COMPONENT Full_Adder IS
        PORT (
            A_2, B_2, Cin_2 : IN STD_LOGIC;
            Sum_2, Cout_2 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A, B, Cin : STD_LOGIC := '0';
    SIGNAL S, Cout : STD_LOGIC;

BEGIN

    FULL : Full_Adder PORT MAP(
        A_2 => A,
        B_2 => B,
        Cin_2 => Cin,
        Sum_2 => S,
        Cout_2 => Cout
    );
    PROCESS BEGIN

        WAIT FOR 2 ns;

        FOR i IN 0 TO 1 LOOP

            FOR j IN 0 TO 1 LOOP

                -- A change
                A <= NOT A;
                WAIT FOR 1 ns;

            END LOOP;

            -- B change
            B <= NOT B;
            WAIT FOR 1 ns;

        END LOOP;

        -- Cin change
        Cin <= NOT Cin;

        WAIT FOR 1 ns;

    END PROCESS;

END check_Full_Adder; -- check_Full_Adder