-------------------------------------------------------------------------------
-- piezo.vhd
-- =========
--
-- Author       : Léa Strobino
-- Revision     : 1.1
-- Last updated : Tue, 13 Nov 2018 20:40:08 +0100
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity piezo is

  generic (
    g_WIDTH : integer := 16  -- counter width
  );

  port (

    clk_i      : in  std_logic := '0';
    reset_n_i  : in  std_logic := '0';

    enable_i   : in  std_logic := '0';
    sync_p1_i  : in  std_logic := '0';
    phase_i    : in  unsigned(g_WIDTH-1 downto 0) := to_unsigned(0,g_WIDTH);
    duration_i : in  unsigned(g_WIDTH-1 downto 0) := to_unsigned(0,g_WIDTH);
    wave_o     : out std_logic

  );

end entity piezo;

architecture rtl of piezo is

  type t_state is (IDLE, COUNT);

  signal s_state0, s_state1 : t_state;
  signal s_ctr0_c, s_ctr1_c : unsigned(g_WIDTH-1 downto 0);

begin

  -- Phase
  process (clk_i, reset_n_i)
  begin

    if reset_n_i = '0' then

      s_state0 <= IDLE;
      s_state1 <= IDLE;
      s_ctr0_c <= to_unsigned(0,s_ctr0_c'length);
      s_ctr1_c <= to_unsigned(0,s_ctr1_c'length);
      wave_o   <= '0';

    elsif rising_edge(clk_i) then

      s_state0 <= IDLE;
      s_state1 <= IDLE;
      s_ctr0_c <= to_unsigned(0,s_ctr0_c'length);
      s_ctr1_c <= to_unsigned(0,s_ctr1_c'length);
      wave_o   <= '0';

      if enable_i = '1' then
        if sync_p1_i = '1' then             -- Start signal generation.
          s_state0 <= COUNT;
        end if;
        if s_state0 = COUNT then
          if s_ctr0_c /= phase_i then       -- Wait for "phase_i" cycles.
            s_state0 <= COUNT;
            s_ctr0_c <= s_ctr0_c+1;
          else                              -- Set "wave_o" high.
            s_state1 <= COUNT;
            wave_o   <= '1';
          end if;
        end if;
        if s_state1 = COUNT then
          if s_ctr1_c /= duration_i-1 then  -- Wait for "duration_i" cycles.
            s_state1 <= COUNT;
            s_ctr1_c <= s_ctr1_c+1;
            wave_o   <= '1';
          end if;                           -- Set "wave_o" low.
        end if;
      end if;

    end if;

  end process;

end architecture rtl;
