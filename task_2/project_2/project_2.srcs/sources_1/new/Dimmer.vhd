library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Toggles the LED state every half second

entity Dimmer is
	generic (
	   WIDTH : integer := 25
	);
	port (
		LED : out std_ulogic_vector(3 downto 0);
		CLK_66MHZ : in std_ulogic
	);
end;

architecture DimmerArchitecture of Dimmer is
	signal counter : unsigned(WIDTH downto 0) := (others => '0'); -- that makes 67108864 bit combinations
	signal duty_cycle : unsigned (7 downto 0) := (others => '0');
begin
	ledpwm : entity work.LEDPWM(Behavioral)
	port map (
		LED => LED,
		CLK_66MHZ => CLK_66MHZ,
		duty_cycle => duty_cycle
	);
	
counterProcess : process(CLK_66MHZ)
begin
	if(rising_edge(CLK_66MHZ)) then
		counter <= counter + 1;
		
		if(counter = 0) then
			duty_cycle <= duty_cycle + 32;
		end if;
	end if;
end process;

end DimmerArchitecture;
