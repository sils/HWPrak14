library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM is
    Port (
		clk    : in std_logic;
		out_val: out unsigned(7 downto 0);
		user_reset : in std_logic;
		
		-- everything below is the interface to the i2c driver
    	start,
		stop,
		read,
		write,
		ack_in : out std_logic;
		din    : out std_logic_vector(7 downto 0);
		dout   : in  std_logic_vector(7 downto 0);
		
		cmd_ack  : in std_logic -- command done
    );
end FSM;

architecture moore of FSM is
	type StateType is (S1, S2, S3, S4);
	signal currentState, nextState: StateType;
    signal dout_save: unsigned(7 downto 0) := "00000000";
begin
	transition : process(currentState, cmd_ack,  dout)
	begin
		nextState <= currentState;
			case currentState is 
				when S1 =>
				if cmd_ack = '1' then
					nextState <= S2;
				end if;
				when S2 =>
				if cmd_ack = '1' then
					nextState <= S3;
				end if;
				when S3 =>
				if cmd_ack = '1' then
					nextState <= S4;
				end if;
				when S4 =>
				if cmd_ack = '1' then
					nextState <= S1;
				end if;
			end case;
	end process;
	
	stateMemory : process(clk)
	begin
		if rising_edge(clk) then
		    if currentState = S4 and cmd_ack = '1' then
		        dout_save <= unsigned(dout);
		    end if;
		
		    if user_reset = '1' then
		        currentState <= S1;
		    else
			    currentState <= nextState;
			end if;
		end if;
	end process;
	
	outputs : process(currentState, dout_save)
	begin
		case currentState is 
			when S1 =>
				start <= '1';
				stop <= '0';
				ack_in <= '0';
				din <= "10010000";
				write <= '1';
				read <= '0';
			when S2 =>
				stop <= '0';
				start <= '0';
				ack_in <= '0';
				din <= "10001100";
                write <= '1';
                read <= '0';
			when S3 =>
				start <= '1';
				stop <= '0';
				ack_in <= '0';
				din <= "10010001";
                write <= '1';
                read <= '0';
			when S4 =>
				stop <= '1';
				start <= '0';
				din <= "00000000";
				ack_in <= '1';
                write <= '0';
                read <= '1';
		end case;
    out_val <= dout_save;
	end process;

end moore;
