LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY halfadder IS
    PORT (
        A, B : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC);
END halfadder;
ARCHITECTURE implhalfadder OF halfadder IS
BEGIN
    S <= A XOR B;
    Cout <= A AND B;
END implhalfadder;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladder IS
    PORT (
        A, B, Cin : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC);
END fulladder;
ARCHITECTURE implfulladder OF fulladder IS
    COMPONENT halfadder PORT (A, B : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL insum, incarry1, incarry2 : STD_LOGIC;
BEGIN
    H1 : halfadder PORT MAP(A, B, insum, incarry1);
    H2 : halfadder PORT MAP(insum, Cin, S, incarry2);
    Cout <= incarry1 OR incarry2;
END implfulladder;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Rippleadder IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END Rippleadder;

ARCHITECTURE implRippleadder OF Rippleadder IS
    COMPONENT fulladder
        PORT (
            A, B, Cin : IN STD_LOGIC;
            S, Cout : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL carry : STD_LOGIC_VECTOR (3 DOWNTO 1);
BEGIN
    F1 : Fulladder PORT MAP(a(0), b(0), cin, sum(0), carry(1));
    F2 : Fulladder PORT MAP(a(1), b(1), carry(1), sum(1), carry(2));
    F3 : Fulladder PORT MAP(a(2), b(2), carry(2), sum(2), carry(3));
    F4 : Fulladder PORT MAP(a(3), b(3), carry(3), sum(3), cout);
END implRippleadder;