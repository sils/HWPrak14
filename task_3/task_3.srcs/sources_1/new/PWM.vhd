library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LEDPWM is
    generic (
        WIDTH : integer := 7 -- that makes 256 bit combinations
    );
    Port (
        CLK_66MHZ : in std_ulogic;
        LED : out std_ulogic_vector(3 downto 0);
        duty_cycle : in unsigned(7 downto 0)
    );
end LEDPWM;

architecture Behavioral of LEDPWM is
	signal counter : unsigned(7 downto 0) := (others => '0');
	signal ledstate : std_ulogic := '0';
begin
ledstate <= '1' when duty_cycle > counter else '0';
LED(0) <= ledstate;
LED(1) <= ledstate;
LED(2) <= ledstate;
LED(3) <= ledstate;

counterProcess : process(CLK_66MHZ)
begin
	if(rising_edge(CLK_66MHZ)) then
		counter <= counter + 1;
	end if;
end process;

end Behavioral;
