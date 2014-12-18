library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity unite is
    Port (
		LED : out std_ulogic_vector(3 downto 0);
		CLK_66MHZ : in std_ulogic;
		SDA, SCL: inout std_logic;
		USER_RESET : in std_logic
    );
end unite;

architecture Behavioral of unite is
	signal duty_cycle : unsigned(7 downto 0);
	
	signal scl_i   : std_logic; -- i2c clock line input
	signal scl_o   : std_logic; -- i2c clock line output
	signal scl_oen : std_logic; -- i2c clock line output enable, active low
	signal sda_i   : std_logic; -- i2c data line input
	signal sda_o   : std_logic; -- i2c data line output
	signal sda_oen : std_logic;
	
	signal start,
		   stop,
		   read,
		   write,
		   ack_in : std_logic;
	signal din    : std_logic_vector(7 downto 0);
	signal dout   : std_logic_vector(7 downto 0);
	signal cmd_ack  : std_logic; -- command done
	signal ack_out  : std_logic;
	
	-- we ignore those values:
	signal i2c_busy, i2c_al : std_logic;
begin


 pwm : entity work.LEDPWM(Behavioral)
 	generic map (WIDTH => 25)
 	port map (
 		CLK_66MHZ => CLK_66MHZ,
        LED => LED,
        duty_cycle => duty_cycle
 	);
 
 tristate : entity work.tristate(Behavioral)
 	port map (
 		-- Interface to byte_ctrl
        scl_i   => scl_i,   -- i2c clock line input
		scl_o   => scl_o,   -- i2c clock line output
		scl_oen => scl_oen, -- i2c clock line output enable, active low
		sda_i   => sda_i,   -- i2c data line input
		sda_o   => sda_o,   -- i2c data line output
		sda_oen => sda_oen, -- i2c data line output enable, active low
		
		-- Interface to the outside world
		scl => SCL,
		sda => SDA
 	);
 	
 fsm : entity work.FSM(moore)
    port map (
		clk    => CLK_66MHZ,
		out_val=> duty_cycle,
		user_reset => USER_RESET,
		
		-- everything below is the interface to the i2c driver
    	start => start,
		stop => stop,
		read => read,
		write => write,
		ack_in => ack_in,
		din    => din,
		dout   => dout,
		
		cmd_ack=> cmd_ack
    );
    
  i2c : entity work.i2c_master_byte_ctrl(structural)
  	port map (
  		clk    => CLK_66MHZ,
		rst    => USER_RESET, -- synchronous active high reset (WISHBONE compatible)
		nReset => '1', -- asynchronous active low reset (FPGA compatible)
		ena    => '1', -- core enable signal
 
        clk_cnt => "0000000010100101",
		--clk_cnt : in unsigned(15 downto 0);	-- 4x SCL
 
		-- input signals
		start => start,
		stop => stop,
		read => read,
		write => write,
		ack_in => ack_in,
		din    => din,
 
		-- output signals
		cmd_ack => cmd_ack,
		ack_out  => open,
		i2c_busy => open, -- ignored
		i2c_al => open, -- ignored
		dout => dout,
 
		-- i2c lines
		scl_i   => scl_i,   -- i2c clock line input
		scl_o   => scl_o,   -- i2c clock line output
		scl_oen => scl_oen, -- i2c clock line output enable, active low
		sda_i   => sda_i,   -- i2c data line input
		sda_o   => sda_o,   -- i2c data line output
		sda_oen => sda_oen -- i2c data line output enable, active low
  	);
end Behavioral;
