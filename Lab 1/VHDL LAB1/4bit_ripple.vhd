LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY work;
USE work.ALL;

ENTITY RippleAdder IS
    PORT (
        A_3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B_3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        CarryIn : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        CarryOut : OUT STD_LOGIC
    );
END RippleAdder;

ARCHITECTURE ADD_RIPPLE OF RippleAdder IS

    COMPONENT Full_Adder
        PORT (
            A_2, B_2, Cin_2 : IN STD_LOGIC;
            Sum_2, Cout_2 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C1, C2, C3 : STD_LOGIC;

BEGIN

    FA0 : Full_Adder PORT MAP(A_3(0), B_3(0), CarryIn, Sum(0), C1);
    FA1 : Full_Adder PORT MAP(A_3(1), B_3(1), C1, Sum(1), C2);
    FA2 : Full_Adder PORT MAP(A_3(2), B_3(2), C2, Sum(2), C3);
    FA3 : Full_Adder PORT MAP(A_3(3), B_3(3), C3, Sum(3), CarryOut);

END ADD_RIPPLE;