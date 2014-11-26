library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port (
		clk    : in std_logic;
		out_val: in  std_logic_vector(7 downto 0);
		
		-- everything below is the interface to the i2c driver
    	start,
		stop,
		read,
		write,
		ack_in : out std_logic;
		din    : out std_logic_vector(7 downto 0);
		dout   : in  std_logic_vector(7 downto 0);
		
		cmd_ack  : in std_logic; -- command done
		ack_out  : in std_logic
    );
end FSM;

architecture moore of FSM is
	type StateType is (S1, S2, S3, S4);
	signal currentState, nextState : StateType;

begin
	transition : process(currentState, cmd_ack)
	begin
		if cmd_ack = '1' then
			case currentState is 
				when S1 =>
					nextState <= S2;
				when S2 =>
					nextState <= S3;
				when S3 =>
					nextState <= S4;
				when S4 =>
					nextState <= S1;
			end case;
		end if;
	end process;
	
	stateMemory : process(clk)
	begin
		if rising_edge(clk) then
			currentState <= nextState;
		end if;
	end process;
	
	outputs : process(currentState)
	begin
		case currentState is 
			when S1 =>
				start <= '1';
				stop <= '0';
				ack_in <= '0';
				din <= "10010000";
			when S2 =>
				stop <= '1';
				start <= '0';
				din <= "100011XX";
			when S3 =>
				start <= '1';
				stop <= '0';
				din <= "10010001";
			when S4 =>
				stop <= '1';
				start <= '0';
				out_val <= dout;
				ack_in <= '1';
		end case;
	end process;

end moore;
