library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_counter is
end entity test_counter;

architecture test of test_counter is 
    component EvenOddCounter is 
        port(
            Load     : in  std_logic;
            Count    : in  std_logic;
            EvenOdd  : in  std_logic;
            Data     : in  std_logic_vector(3 downto 0);
            CLK      : in  std_logic;
            sequence : out std_logic_vector(3 downto 0)
        );
    end component;

    signal seq_out   : std_logic_vector(3 downto 0);
    signal load      : std_logic := '0';
    signal count     : std_logic := '0';
    signal even_odd  : std_logic := '0';
    signal data      : std_logic_vector(3 downto 0) := (others => '0');
    signal clk       : std_logic := '0';

    constant CLK_PERIOD : time := 10 ns;

begin
    -- Unit Under Test
    uut: EvenOddCounter
        port map(
            Load     => load,
            Count    => count,
            EvenOdd  => even_odd,
            Data     => data,
            CLK      => clk,
            sequence => seq_out
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Stimulus + self?checking
    stimulus : process
    begin
        -- let everything settle
        wait for CLK_PERIOD;

        -- Test 1: Load "0011"
        data <= "0011";
        load <= '1';
        wait until rising_edge(clk);
        load <= '0';
        wait until rising_edge(clk);

        -- Test 2: Count up in even mode (should go to 4)
        count <= '1';
        even_odd <= '0';
        wait until rising_edge(clk);

        -- Test 3: Now odd?mode count (should go to 5)
        even_odd <= '1';
        wait until rising_edge(clk);

        -- all done
        wait;
    end process;

end architecture test;
