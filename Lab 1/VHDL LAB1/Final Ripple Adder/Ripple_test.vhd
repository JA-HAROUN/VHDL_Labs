LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testforripple IS
END testforripple;

ARCHITECTURE test OF testforripple IS

    COMPONENT Rippleadder PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL A, B, S : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL Cin, Cout : STD_LOGIC := '0';
BEGIN
    R : Rippleadder PORT MAP(A, B, Cin, S, Cout);
    PROCESS BEGIN
        loop_1 : FOR k IN 0 TO 3 LOOP
            REPORT "New value";
            WAIT FOR 5 ps;
            loop_2 : FOR i IN 0 TO 3 LOOP
                A <= STD_LOGIC_VECTOR(unsigned(A) + 1);
                WAIT FOR 5 ps;
                REPORT "New value";
            END LOOP loop_2;
            B <= STD_LOGIC_VECTOR(unsigned(B) + 1);
        END LOOP loop_1;

    END PROCESS;
END test;