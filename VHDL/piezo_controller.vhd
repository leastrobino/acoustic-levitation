-------------------------------------------------------------------------------
-- piezo_controller.vhd
-- ====================
--
-- Author       : Léa Strobino
-- Revision     : 1.0
-- Last updated : Sun, 29 Apr 2018 16:08:31 +0200
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity piezo_controller is

  generic (
    piezo_count : integer := 120
  );

  port (

    clk           : in  std_logic := '0';
    reset_n       : in  std_logic := '0';

    -- Avalon
    AVS_Address   : in  std_logic_vector(7 downto 0)   := (others => '0');
    AVS_Read      : in  std_logic                      := '0';
    AVS_ReadData  : out std_logic_vector(15 downto 0);
    AVS_Write     : in  std_logic                      := '0';
    AVS_WriteData : in  std_logic_vector(15 downto 0)  := (others => '0');

    -- Output signals
    piezo_out     : out std_logic_vector(piezo_count-1 downto 0);
    piezo_enable  : out std_logic;
    piezo_status  : out std_logic_vector(2 downto 0)

  );

end entity piezo_controller;

architecture rtl of piezo_controller is

  type unsigned_array is array(piezo_count-1 downto 0) of unsigned(15 downto 0);

  -- Registers
  signal enable        : std_logic;
  signal period        : unsigned(15 downto 0);
  signal phase_A_count : unsigned(15 downto 0);
  signal phase_B_count : unsigned(15 downto 0);
  signal phase_A       : unsigned_array;
  signal phase_B       : unsigned_array;

  -- Components
  component piezo is
    port (
      clk            : in std_logic;
      reset_n        : in std_logic;
      piezo_enable   : in std_logic;
      piezo_sync     : in std_logic;
      piezo_phase    : in unsigned(15 downto 0);
      piezo_duration : in unsigned(15 downto 0);
      piezo_out      : out std_logic
    );
  end component piezo;

  signal ctr        : unsigned(15 downto 0);
  signal sync       : unsigned(2 downto 0);
  signal phase      : unsigned_array;
  signal phase_nA_B : std_logic;
  signal ctr_A_B    : unsigned(15 downto 0);
  signal new_value  : std_logic;

begin

  piezo_enable    <= enable;
  piezo_status(0) <= sync(0);
  piezo_status(1) <= phase_nA_B;
  piezo_status(2) <= new_value;

  -- Components
  piezo_gen : for i in 0 to piezo_count-1 generate
    piezo_inst : component piezo
    port map (
      clk            => clk,
      reset_n        => reset_n,
      piezo_enable   => enable,
      piezo_sync     => sync(0),
      piezo_phase    => phase(i),
      piezo_duration => period/2,
      piezo_out      => piezo_out(i)
    );
  end generate piezo_gen;

  -- Avalon read
  process (clk, reset_n)
  begin

    if reset_n = '0' then

      AVS_ReadData <= (others => '0');

    elsif rising_edge(clk) then

      AVS_ReadData <= (others => '0');

      if AVS_Read = '1' then
        case AVS_Address is

          when X"00" => AVS_ReadData(0) <= enable;
          when X"01" => AVS_ReadData    <= std_logic_vector(period);
          when X"02" => AVS_ReadData    <= std_logic_vector(phase_A_count);
          when X"03" => AVS_ReadData    <= std_logic_vector(phase_B_count);

          when others =>

            for i in 0 to piezo_count-1 loop
              if AVS_Address = std_logic_vector(to_unsigned(16#10#+i,8)) then
                AVS_ReadData <= std_logic_vector(phase_A(i));
              end if;
            end loop;

            for i in 0 to piezo_count-1 loop
              if AVS_Address = std_logic_vector(to_unsigned(16#88#+i,8)) then
                AVS_ReadData <= std_logic_vector(phase_B(i));
              end if;
            end loop;

        end case;
      end if;

    end if;

  end process;

  -- Avalon write
  process (clk, reset_n)
  begin

    if reset_n = '0' then

      enable        <= '0';
      period        <= to_unsigned(0,16);
      phase_A_count <= to_unsigned(0,16);
      phase_B_count <= to_unsigned(0,16);
      phase_A       <= (others => to_unsigned(0,16));
      phase_B       <= (others => to_unsigned(0,16));
      new_value     <= '0';

    elsif rising_edge(clk) then

      new_value <= '0';

      if AVS_Write = '1' then
        case AVS_Address is

          when X"00" =>

            if period > 1 then                           -- Ensure "enable" is low if "period" < 2.
              enable <= AVS_WriteData(0);
            else
              enable <= '0';
            end if;

          when X"01" => period        <= unsigned(AVS_WriteData);
          when X"02" => phase_A_count <= unsigned(AVS_WriteData);
          when X"03" => phase_B_count <= unsigned(AVS_WriteData);

          when others =>

            for i in 0 to piezo_count-1 loop
              if AVS_Address = std_logic_vector(to_unsigned(16#10#+i,8)) then
                if unsigned(AVS_WriteData) < period then -- Ensure "phase_A(i)" is in range 0.."period"-1.
                  phase_A(i) <= unsigned(AVS_WriteData);
                else
                  phase_A(i) <= to_unsigned(0,16);
                end if;
                new_value  <= '1';
              end if;
            end loop;

            for i in 0 to piezo_count-1 loop
              if AVS_Address = std_logic_vector(to_unsigned(16#88#+i,8)) then
                if unsigned(AVS_WriteData) < period then -- Ensure "phase_B(i)" is in range 0.."period"-1.
                  phase_B(i) <= unsigned(AVS_WriteData);
                else
                  phase_B(i) <= to_unsigned(0,16);
                end if;
                new_value  <= '1';
              end if;
            end loop;

        end case;
      end if;

    end if;

  end process;

  -- Sync signals: sync_{-i}
  process (clk, reset_n)
  begin

    if reset_n = '0' then

      ctr  <= to_unsigned(0,16);
      sync <= (others => '0');

    elsif rising_edge(clk) then

      ctr  <= to_unsigned(0,16);
      sync <= (others => '0');

      if enable = '1' then
        sync <= sync srl 1;
        if ctr < period-1 then
          ctr <= ctr+1;
        else
          sync(sync'length-1) <= '1';
        end if;
      end if;

    end if;

  end process;

  -- Phase register in use
  process (clk, reset_n)
  begin

    if reset_n = '0' then

      phase      <= phase_A;
      phase_nA_B <= '0';
      ctr_A_B    <= to_unsigned(0,16);

    elsif rising_edge(clk) then

      if phase_B_count = 0 or enable = '0' then -- Use phase register A.
        if sync(0) = '1' then
          phase <= phase_A;
        end if;
        phase_nA_B <= '0';
        ctr_A_B    <= to_unsigned(0,16);
      elsif phase_A_count = 0 then              -- Use phase register B.
        if sync(0) = '1' then
          phase <= phase_B;
        end if;
        phase_nA_B <= '1';
        ctr_A_B    <= to_unsigned(0,16);
      elsif phase_nA_B = '0' then
        if sync(0) = '1' then
          phase <= phase_A;
        end if;
        if ctr_A_B < phase_A_count then         -- Keep using phase register A.
          if sync(2) = '1' then
            ctr_A_B <= ctr_A_B+1;
          end if;
        else                                    -- Switch to phase register B.
          phase_nA_B <= '1';
          ctr_A_B    <= to_unsigned(0,16);
        end if;
      else
        if sync(0) = '1' then
          phase <= phase_B;
        end if;
        if ctr_A_B < phase_B_count then         -- Keep using phase register B.
          if sync(2) = '1' then
            ctr_A_B <= ctr_A_B+1;
          end if;
        else                                    -- Switch to phase register A.
          phase_nA_B <= '0';
          ctr_A_B    <= to_unsigned(0,16);
        end if;
      end if;

    end if;

  end process;

end architecture rtl;
