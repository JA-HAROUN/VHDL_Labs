LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testforripple IS
END testforripple;

ARCHITECTURE test OF testforripple IS

    COMPONENT Rippleadder PORT (A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL A, B, S : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL Cin, Cout : STD_LOGIC := '0';
    SIGNAL check, int_Cin : INTEGER := 0;
BEGIN
    R : Rippleadder PORT MAP(A, B, Cin, S, Cout);
    PROCESS BEGIN
        loop_0 : FOR j IN 0 TO 1 LOOP
            IF Cin = '1' THEN
                Int_Cin <= 1;
            END IF;
            loop_1 : FOR k IN 0 TO 15 LOOP
                WAIT FOR 10 ps;
                loop_2 : FOR i IN 0 TO 15 LOOP
                    A <= STD_LOGIC_VECTOR(unsigned(A) + 1);
                    WAIT FOR 10 ps;
                    check <= to_integer(unsigned(A)) + to_integer(unsigned(B)) + Int_Cin;
                    WAIT FOR 10 ps;
                    IF STD_LOGIC_VECTOR(to_unsigned(check, 4)) /= S THEN
                        REPORT "Wrong Result";
                    END IF;
                    WAIT FOR 10 ps;
                END LOOP loop_2;
                B <= STD_LOGIC_VECTOR(unsigned(B) + 1);
            END LOOP loop_1;
            Cin <= '1';
            WAIT FOR 10 ps;
        END LOOP loop_0;

    END PROCESS;
END test;