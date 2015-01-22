library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_hack is
end tb_hack;

architecture Behavioral of tb_hack is
	signal clock : std_ulogic := '0';
	signal reset : std_ulogic := '0';
begin
clock <= not clock after 7.57575757 ns;



uut : entity work.Hack(Behavioral)
	port map (
		clock	=> clock,
		reset	=> reset
	);


stimuli : process
	begin
		reset <= '1';
		wait for 10 us;
		reset <= '0';
		wait for 1000 ms;
		wait;
	end process;
end Behavioral;
