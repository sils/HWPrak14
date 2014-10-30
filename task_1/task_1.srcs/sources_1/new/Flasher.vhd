library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Toggles the LED state every half second

entity Flasher is
	port (
		LED : out std_ulogic_vector(3 downto 0);
		CLK_66MHZ : in std_ulogic
	);
end;

architecture FlasherArchitecture of Flasher is
	signal counter : unsigned(25 downto 0) := (others => '0'); -- that makes 67108864 bit combinations
begin
LED(2) <= counter(25); -- toggle LED together with the upper most bit

counterProcess : process(CLK_66MHZ)
begin
	if(rising_edge(CLK_66MHZ)) then
		counter <= counter + 1;
	end if;
end process;

end FlasherArchitecture;
