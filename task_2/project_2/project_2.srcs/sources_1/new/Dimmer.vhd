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
	signal state: unsigned (2 downto 0) := (others => '0');
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
			case state is
			 when  "000" => duty_cycle <= "00000000"; --0
			 when  "001" => duty_cycle <= "00011001"; --25
			 when  "010" => duty_cycle <= "00110010"; --50
			 when  "011" => duty_cycle <= "01001011"; --75
			 when  "100" => duty_cycle <= "01100100"; --100
			 when  "101" => duty_cycle <= "10010110"; --150
			 when  "110" => duty_cycle <= "11001000"; --200
			 when  "111" => duty_cycle <= "11111111"; --255
			 when others => null;
			end case;
			state <= state + 1;
		end if;
	end if;
end process;

end DimmerArchitecture;
