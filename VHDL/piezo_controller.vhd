-------------------------------------------------------------------------------
-- piezo_controller.vhd
-- ====================
--
-- Author       : Léa Strobino
-- Revision     : 1.1
-- Last updated : Tue, 13 Nov 2018 20:40:08 +0100
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity piezo_controller is

  generic (
    g_PIEZO_COUNT : integer := 120
  );

  port (

    clk_i           : in  std_logic := '0';
    reset_n_i       : in  std_logic := '0';

    -- Avalon
    AVS_Address_i   : in  std_logic_vector(7 downto 0)  := (others => '0');
    AVS_Read_i      : in  std_logic := '0';
    AVS_ReadData_o  : out std_logic_vector(15 downto 0);
    AVS_Write_i     : in  std_logic := '0';
    AVS_WriteData_i : in  std_logic_vector(15 downto 0) := (others => '0');

    -- Output signals
    enable_o        : out std_logic;
    status_o        : out std_logic_vector(2 downto 0);
    wave_o          : out std_logic_vector(g_PIEZO_COUNT-1 downto 0)

  );

end entity piezo_controller;

architecture rtl of piezo_controller is

  type t_AB is (A, B);
  type t_unsigned_array is array(g_PIEZO_COUNT-1 downto 0) of unsigned(15 downto 0);

  -- Registers
  signal s_enable        : std_logic;
  signal s_period        : unsigned(15 downto 0);
  signal s_phase_A_count : unsigned(15 downto 0);
  signal s_phase_B_count : unsigned(15 downto 0);
  signal s_phase_A       : t_unsigned_array;
  signal s_phase_B       : t_unsigned_array;

  -- Components
  component piezo is
    generic (
      g_WIDTH : integer
    );
    port (
      clk_i      : in  std_logic;
      reset_n_i  : in  std_logic;
      enable_i   : in  std_logic;
      sync_p1_i  : in  std_logic;
      phase_i    : in  unsigned(g_WIDTH-1 downto 0);
      duration_i : in  unsigned(g_WIDTH-1 downto 0);
      wave_o     : out std_logic
    );
  end component piezo;

  signal s_ctr_c     : unsigned(15 downto 0);
  signal s_ctr_AB_c  : unsigned(15 downto 0);
  signal s_duration  : unsigned(15 downto 0);
  signal s_new_value : std_logic;
  signal s_phase     : t_unsigned_array;
  signal s_phase_AB  : t_AB;
  signal s_sync_p1   : unsigned(2 downto 0);

begin

  enable_o    <= s_enable;
  status_o(0) <= s_sync_p1(0);
  status_o(1) <= '1' when s_phase_AB = B else '0';
  status_o(2) <= s_new_value;
  s_duration  <= s_period/2;

  -- Components
  gen_piezo : for i in 0 to g_PIEZO_COUNT-1 generate
    cmp_piezo : component piezo
    generic map (
      g_WIDTH    => 16
    )
    port map (
      clk_i      => clk_i,
      reset_n_i  => reset_n_i,
      enable_i   => s_enable,
      sync_p1_i  => s_sync_p1(0),
      phase_i    => s_phase(i),
      duration_i => s_duration,
      wave_o     => wave_o(i)
    );
  end generate gen_piezo;

  -- Avalon read
  process (clk_i, reset_n_i)
  begin

    if reset_n_i = '0' then

      AVS_ReadData_o <= (others => '0');

    elsif rising_edge(clk_i) then

      AVS_ReadData_o <= (others => '0');

      if AVS_Read_i = '1' then
        case AVS_Address_i is

          when X"00" => AVS_ReadData_o(0) <= s_enable;
          when X"01" => AVS_ReadData_o    <= std_logic_vector(s_period);
          when X"02" => AVS_ReadData_o    <= std_logic_vector(s_phase_A_count);
          when X"03" => AVS_ReadData_o    <= std_logic_vector(s_phase_B_count);

          when others =>

            for i in 0 to g_PIEZO_COUNT-1 loop
              if AVS_Address_i = std_logic_vector(to_unsigned(16#10#+i,8)) then
                AVS_ReadData_o <= std_logic_vector(s_phase_A(i));
              end if;
            end loop;

            for i in 0 to g_PIEZO_COUNT-1 loop
              if AVS_Address_i = std_logic_vector(to_unsigned(16#88#+i,8)) then
                AVS_ReadData_o <= std_logic_vector(s_phase_B(i));
              end if;
            end loop;

        end case;
      end if;

    end if;

  end process;

  -- Avalon write
  process (clk_i, reset_n_i)
  begin

    if reset_n_i = '0' then

      s_enable        <= '0';
      s_period        <= to_unsigned(0,16);
      s_phase_A_count <= to_unsigned(0,16);
      s_phase_B_count <= to_unsigned(0,16);
      s_phase_A       <= (others => to_unsigned(0,16));
      s_phase_B       <= (others => to_unsigned(0,16));
      s_new_value     <= '0';

    elsif rising_edge(clk_i) then

      s_new_value <= '0';

      if AVS_Write_i = '1' then
        case AVS_Address_i is

          when X"00" =>

            if s_period > 1 then  -- Ensure s_enable is low if s_period < 2.
              s_enable <= AVS_WriteData_i(0);
            else
              s_enable <= '0';
            end if;

          when X"01" => s_period        <= unsigned(AVS_WriteData_i);
          when X"02" => s_phase_A_count <= unsigned(AVS_WriteData_i);
          when X"03" => s_phase_B_count <= unsigned(AVS_WriteData_i);

          when others =>

            for i in 0 to g_PIEZO_COUNT-1 loop
              if AVS_Address_i = std_logic_vector(to_unsigned(16#10#+i,8)) then
                if unsigned(AVS_WriteData_i) < s_period then  -- Ensure s_phase_A(i) is in range 0..s_period-1.
                  s_phase_A(i) <= unsigned(AVS_WriteData_i);
                else
                  s_phase_A(i) <= to_unsigned(0,16);
                end if;
                s_new_value <= '1';
              end if;
            end loop;

            for i in 0 to g_PIEZO_COUNT-1 loop
              if AVS_Address_i = std_logic_vector(to_unsigned(16#88#+i,8)) then
                if unsigned(AVS_WriteData_i) < s_period then  -- Ensure s_phase_B(i) is in range 0..s_period-1.
                  s_phase_B(i) <= unsigned(AVS_WriteData_i);
                else
                  s_phase_B(i) <= to_unsigned(0,16);
                end if;
                s_new_value <= '1';
              end if;
            end loop;

        end case;
      end if;

    end if;

  end process;

  -- Synchronization signals: s_sync_p1_{-i}
  process (clk_i, reset_n_i)
  begin

    if reset_n_i = '0' then

      s_ctr_c   <= to_unsigned(0,16);
      s_sync_p1 <= (others => '0');

    elsif rising_edge(clk_i) then

      s_ctr_c   <= to_unsigned(0,16);
      s_sync_p1 <= (others => '0');

      if s_enable = '1' then
        s_sync_p1 <= s_sync_p1 srl 1;
        if s_ctr_c = s_period-1 then
          s_sync_p1(s_sync_p1'length-1) <= '1';
        else
          s_ctr_c <= s_ctr_c+1;
        end if;
      end if;

    end if;

  end process;

  -- Phase register in use
  process (clk_i, reset_n_i)
  begin

    if reset_n_i = '0' then

      s_phase    <= s_phase_A;
      s_phase_AB <= A;
      s_ctr_AB_c <= to_unsigned(0,16);

    elsif rising_edge(clk_i) then

      if s_phase_B_count = 0 or s_enable = '0' then   -- Use phase register A.
        if s_sync_p1(0) = '1' or s_enable = '0' then
          s_phase <= s_phase_A;
        end if;
        s_phase_AB <= A;
        s_ctr_AB_c <= to_unsigned(0,16);
      elsif s_phase_A_count = 0 then                  -- Use phase register B.
        if s_sync_p1(0) = '1' then
          s_phase <= s_phase_B;
        end if;
        s_phase_AB <= B;
        s_ctr_AB_c <= to_unsigned(0,16);
      elsif s_phase_AB = A then
        if s_sync_p1(0) = '1' then
          s_phase <= s_phase_A;
        end if;
        if s_ctr_AB_c /= s_phase_A_count then         -- Keep using phase register A.
          if s_sync_p1(2) = '1' then
            s_ctr_AB_c <= s_ctr_AB_c+1;
          end if;
        else                                          -- Switch to phase register B.
          s_phase_AB <= B;
          s_ctr_AB_c <= to_unsigned(0,16);
        end if;
      else
        if s_sync_p1(0) = '1' then
          s_phase <= s_phase_B;
        end if;
        if s_ctr_AB_c /= s_phase_B_count then         -- Keep using phase register B.
          if s_sync_p1(2) = '1' then
            s_ctr_AB_c <= s_ctr_AB_c+1;
          end if;
        else                                          -- Switch to phase register A.
          s_phase_AB <= A;
          s_ctr_AB_c <= to_unsigned(0,16);
        end if;
      end if;

    end if;

  end process;

end architecture rtl;
