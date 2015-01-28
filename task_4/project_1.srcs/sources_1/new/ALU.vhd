library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
	generic(
		WIDTH : integer := 16
	);
	Port(
		clock      : in  std_ulogic;
		register_D : in  std_ulogic_vector(WIDTH - 1 downto 0);
		A_or_M     : in  std_ulogic_vector(WIDTH - 1 downto 0);
		c          : in  std_ulogic_vector(WIDTH - 1 downto 0);

		comp       : out std_ulogic_vector(WIDTH - 1 downto 0)
	);
end ALU;

architecture Behavioral of ALU is
	signal c1_6 : std_ulogic_vector(5 downto 0);
begin
	c1_6 <= c(11 downto 6);

	ALU_operation : process(clock)
	begin
		case c1_6 is
			when "101010" => comp <= (others => '0');
			when "111111" => comp <= std_ulogic_vector(to_unsigned(1, WIDTH));
			when "111010" => comp <= (others => '1');
			when "001100" => comp <= register_D;
			when "110000" => comp <= A_or_M;
			when "001101" => comp <= not register_D;
			when "110001" => comp <= not A_or_M;
			when "001111" => comp <= std_ulogic_vector(-signed(register_D));
			when "110011" => comp <= std_ulogic_vector(-signed(A_or_M));
			when "011111" => comp <= std_ulogic_vector(signed(register_D) + 1);
			when "110111" => comp <= std_ulogic_vector(signed(A_or_M) + 1);
			when "001110" => comp <= std_ulogic_vector(signed(register_D) - 1);
			when "110010" => comp <= std_ulogic_vector(signed(A_or_M) - 1);
			when "000010" => comp <= std_ulogic_vector(signed(register_D) + signed(A_or_M));
			when "010011" => comp <= std_ulogic_vector(signed(register_D) - signed(A_or_M));
			when "000111" => comp <= std_ulogic_vector(signed(A_or_M) - signed(register_D));
			when "000000" => comp <= register_D and A_or_M;
			when "010101" => comp <= register_D or A_or_M;
			when others => null;
		end case;
	end process;
end Behavioral;
