-------------------------------------------------------------------------------
-- piezo.vhd
-- =========
--
-- Author       : Léa Strobino
-- Revision     : 1.0
-- Last updated : Thu, 19 Apr 2018 17:26:09 +0200
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity piezo is

  port (

    clk            : in  std_logic := '0';
    reset_n        : in  std_logic := '0';

    piezo_enable   : in  std_logic := '0';
    piezo_sync     : in  std_logic := '0';
    piezo_phase    : in  unsigned(15 downto 0) := to_unsigned(0,16);
    piezo_duration : in  unsigned(15 downto 0) := to_unsigned(0,16);
    piezo_out      : out std_logic

  );

end entity piezo;

architecture rtl of piezo is

  signal ctr0 : unsigned(15 downto 0);
  signal ctr1 : unsigned(15 downto 0);

begin

  -- Phase
  process (clk, reset_n)
  begin

    if reset_n = '0' then

      ctr0      <= to_unsigned(0,16);
      ctr1      <= to_unsigned(0,16);
      piezo_out <= '0';

    elsif rising_edge(clk) then

      ctr0      <= to_unsigned(0,16);
      ctr1      <= to_unsigned(0,16);
      piezo_out <= '0';

      if piezo_enable = '1' then
        if piezo_sync = '1' then        -- Start signal generation.
          ctr0 <= to_unsigned(1,16);
        end if;
        if ctr0 > 0 then
          if ctr0 <= piezo_phase then   -- Wait for "piezo_phase" cycles.
            ctr0 <= ctr0+1;
          else                          -- Set "piezo_out" high.
            ctr1 <= to_unsigned(1,16);
            piezo_out <= '1';
          end if;
        end if;
        if ctr1 > 0 then
          if ctr1 < piezo_duration then -- Wait for "piezo_duration" cycles.
            ctr1 <= ctr1+1;
            piezo_out <= '1';
          end if;                       -- Set "piezo_out" low.
        end if;
      end if;

    end if;

  end process;

end architecture rtl;
