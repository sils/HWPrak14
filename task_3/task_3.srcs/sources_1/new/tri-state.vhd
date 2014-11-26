library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate is
	Port (
		-- Interface to byte_ctrl
        scl_i   : out std_logic; -- i2c clock line input
		scl_o   : in  std_logic; -- i2c clock line output
		scl_oen : in  std_logic; -- i2c clock line output enable, active low
		sda_i   : out std_logic; -- i2c data line input
		sda_o   : in  std_logic; -- i2c data line output
		sda_oen : in  std_logic; -- i2c data line output enable, active low
		
		-- Interface to the outside world
		scl : inout std_logic;
		sda : inout std_logic
    );
end tristate;

architecture Behavioral of tristate is
begin
	scl_i <= scl;
	scl <= scl_o when scl_oen = '0' else 'Z';
	sda_i <= sda;
	sda <= sda_o when sda_oen = '0' else 'Z';
end Behavioral;
