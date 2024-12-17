```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity my_entity is
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0)
  );
end entity;

architecture behavioral of my_entity is
  signal data_reg : std_logic_vector(7 downto 0);
begin
  process (clk) begin
    if rising_edge(clk) then
      data_reg <= data_in;      
    end if;
  end process;
  
  data_out <= data_reg; -- Assign data_out in a separate process to fix the race condition
end architecture;
```