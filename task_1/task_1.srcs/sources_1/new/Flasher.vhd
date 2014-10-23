library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Toggles the LED state every half second

entity Flasher is
	port (
		LED : out std_logic_vector(3 downto 0);
		CLK_66MHZ : in std_ulogic
	);
end;

architecture FlasherArchitecture of Flasher is
	signal counter : unsigned range 0 to 67108864;
begin
LED <= counter(25);

counterProcess : process(CLK_66MHZ)
begin
	if(rising_edge(CLK_66MHZ)) then
		counter <= counter + 1;
	end if;
end process;

end FlasherArchitecture;
