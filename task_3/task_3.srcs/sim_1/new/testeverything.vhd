library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testeverything_tb is
end testeverything_tb;

architecture Behavioral of testeverything_tb is
	signal led : std_ulogic_vector(3 downto 0);
	signal clock : std_ulogic := '0';
	
	signal SDA, SCL, USER_RESET: std_logic;
begin
SDA <= 'H';
SCL <= 'H';
clock <= not clock after 7.57575757 ns;
	
i2cclient : entity work.ADS7830(RTL)
	port map (
		SDA	=> SDA,
		SCL	=> SCL
	);

united : entity work.unite(Behavioral)
	port map (
		LED => led,
		CLK_66MHZ => clock,
		SDA => SDA,
		SCL => SCL,
		USER_RESET => USER_RESET
	);
		
stimuli : process
	begin
		USER_RESET <= '1';
		wait for 10us;
		USER_RESET <= '0';
		wait for 1000ms;
		wait;
	end process;

end Behavioral;
