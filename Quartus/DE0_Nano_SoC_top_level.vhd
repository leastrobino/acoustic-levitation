-------------------------------------------------------------------------------
-- DE0_Nano_SoC_top_level.vhd
-- ==========================
--
-- Board        : Terasic DE0-Nano-SoC
-- Author       : Léa Strobino
-- Revision     : 1.0
-- Last updated : Thu, 19 Apr 2018 18:17:51 +0200
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DE0_Nano_SoC_top_level is

  port(

    -- Clock
    FPGA_CLK1_50 : in std_logic;

    -- Key
    KEY_N : in std_logic_vector(1 downto 0);

    -- LED
    LED : out std_logic_vector(7 downto 0);

    -- HPS
    HPS_CONV_USB_N   : inout std_logic;
    HPS_DDR3_ADDR    : out   std_logic_vector(14 downto 0);
    HPS_DDR3_BA      : out   std_logic_vector(2 downto 0);
    HPS_DDR3_CAS_N   : out   std_logic;
    HPS_DDR3_CK_N    : out   std_logic;
    HPS_DDR3_CK_P    : out   std_logic;
    HPS_DDR3_CKE     : out   std_logic;
    HPS_DDR3_CS_N    : out   std_logic;
    HPS_DDR3_DM      : out   std_logic_vector(3 downto 0);
    HPS_DDR3_DQ      : inout std_logic_vector(31 downto 0);
    HPS_DDR3_DQS_N   : inout std_logic_vector(3 downto 0);
    HPS_DDR3_DQS_P   : inout std_logic_vector(3 downto 0);
    HPS_DDR3_ODT     : out   std_logic;
    HPS_DDR3_RAS_N   : out   std_logic;
    HPS_DDR3_RESET_N : out   std_logic;
    HPS_DDR3_RZQ     : in    std_logic;
    HPS_DDR3_WE_N    : out   std_logic;
    HPS_ENET_GTX_CLK : out   std_logic;
    HPS_ENET_INT_N   : inout std_logic;
    HPS_ENET_MDC     : out   std_logic;
    HPS_ENET_MDIO    : inout std_logic;
    HPS_ENET_RX_CLK  : in    std_logic;
    HPS_ENET_RX_DATA : in    std_logic_vector(3 downto 0);
    HPS_ENET_RX_DV   : in    std_logic;
    HPS_ENET_TX_DATA : out   std_logic_vector(3 downto 0);
    HPS_ENET_TX_EN   : out   std_logic;
    HPS_GSENSOR_INT  : inout std_logic;
    HPS_I2C0_SCLK    : inout std_logic;
    HPS_I2C0_SDAT    : inout std_logic;
    HPS_KEY_N        : inout std_logic;
    HPS_LED          : inout std_logic;
    HPS_SD_CLK       : out   std_logic;
    HPS_SD_CMD       : inout std_logic;
    HPS_SD_DATA      : inout std_logic_vector(3 downto 0);
    HPS_UART_RX      : in    std_logic;
    HPS_UART_TX      : out   std_logic;
    HPS_USB_CLKOUT   : in    std_logic;
    HPS_USB_DATA     : inout std_logic_vector(7 downto 0);
    HPS_USB_DIR      : in    std_logic;
    HPS_USB_NXT      : in    std_logic;
    HPS_USB_STP      : out   std_logic;

    -- Piezo
    PIEZO  : out std_logic_vector(88 downto 1);
    ENABLE : out std_logic;

    -- GPIO on LTC connector
    HPS_LTC_GPIO          : inout std_logic_vector(3 downto 0);
    HPS_LTC_GPIO_ENABLE_N : inout std_logic

  );

end entity DE0_Nano_SoC_top_level;

architecture rtl of DE0_Nano_SoC_top_level is

  component soc_system is
    port (
      clk_clk                              : in    std_logic                     := 'X';             -- clk
      fpga_key_input_export                : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
      fpga_led_output_export               : out   std_logic_vector(7 downto 0);                     -- export
      hps_ddr_mem_a                        : out   std_logic_vector(14 downto 0);                    -- mem_a
      hps_ddr_mem_ba                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
      hps_ddr_mem_ck                       : out   std_logic;                                        -- mem_ck
      hps_ddr_mem_ck_n                     : out   std_logic;                                        -- mem_ck_n
      hps_ddr_mem_cke                      : out   std_logic;                                        -- mem_cke
      hps_ddr_mem_cs_n                     : out   std_logic;                                        -- mem_cs_n
      hps_ddr_mem_ras_n                    : out   std_logic;                                        -- mem_ras_n
      hps_ddr_mem_cas_n                    : out   std_logic;                                        -- mem_cas_n
      hps_ddr_mem_we_n                     : out   std_logic;                                        -- mem_we_n
      hps_ddr_mem_reset_n                  : out   std_logic;                                        -- mem_reset_n
      hps_ddr_mem_dq                       : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
      hps_ddr_mem_dqs                      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
      hps_ddr_mem_dqs_n                    : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
      hps_ddr_mem_odt                      : out   std_logic;                                        -- mem_odt
      hps_ddr_mem_dm                       : out   std_logic_vector(3 downto 0);                     -- mem_dm
      hps_ddr_oct_rzqin                    : in    std_logic                     := 'X';             -- oct_rzqin
      hps_h2f_loan_io_in                   : out   std_logic_vector(66 downto 0);                    -- in
      hps_h2f_loan_io_out                  : in    std_logic_vector(66 downto 0) := (others => 'X'); -- out
      hps_h2f_loan_io_oe                   : in    std_logic_vector(66 downto 0) := (others => 'X'); -- oe
      hps_io_hps_io_emac1_inst_TX_CLK      : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
      hps_io_hps_io_emac1_inst_TXD0        : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
      hps_io_hps_io_emac1_inst_TXD1        : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
      hps_io_hps_io_emac1_inst_TXD2        : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
      hps_io_hps_io_emac1_inst_TXD3        : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
      hps_io_hps_io_emac1_inst_RXD0        : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
      hps_io_hps_io_emac1_inst_MDIO        : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
      hps_io_hps_io_emac1_inst_MDC         : out   std_logic;                                        -- hps_io_emac1_inst_MDC
      hps_io_hps_io_emac1_inst_RX_CTL      : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
      hps_io_hps_io_emac1_inst_TX_CTL      : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
      hps_io_hps_io_emac1_inst_RX_CLK      : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
      hps_io_hps_io_emac1_inst_RXD1        : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
      hps_io_hps_io_emac1_inst_RXD2        : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
      hps_io_hps_io_emac1_inst_RXD3        : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
      hps_io_hps_io_sdio_inst_CMD          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
      hps_io_hps_io_sdio_inst_D0           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
      hps_io_hps_io_sdio_inst_D1           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
      hps_io_hps_io_sdio_inst_CLK          : out   std_logic;                                        -- hps_io_sdio_inst_CLK
      hps_io_hps_io_sdio_inst_D2           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
      hps_io_hps_io_sdio_inst_D3           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
      hps_io_hps_io_usb1_inst_D0           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
      hps_io_hps_io_usb1_inst_D1           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
      hps_io_hps_io_usb1_inst_D2           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
      hps_io_hps_io_usb1_inst_D3           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
      hps_io_hps_io_usb1_inst_D4           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
      hps_io_hps_io_usb1_inst_D5           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
      hps_io_hps_io_usb1_inst_D6           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
      hps_io_hps_io_usb1_inst_D7           : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
      hps_io_hps_io_usb1_inst_CLK          : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
      hps_io_hps_io_usb1_inst_STP          : out   std_logic;                                        -- hps_io_usb1_inst_STP
      hps_io_hps_io_usb1_inst_DIR          : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
      hps_io_hps_io_usb1_inst_NXT          : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
      hps_io_hps_io_uart0_inst_RX          : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
      hps_io_hps_io_uart0_inst_TX          : out   std_logic;                                        -- hps_io_uart0_inst_TX
      hps_io_hps_io_i2c0_inst_SDA          : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
      hps_io_hps_io_i2c0_inst_SCL          : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
      hps_io_hps_io_gpio_inst_GPIO09       : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
      hps_io_hps_io_gpio_inst_GPIO35       : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
      hps_io_hps_io_gpio_inst_GPIO53       : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
      hps_io_hps_io_gpio_inst_GPIO61       : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
      hps_io_hps_io_gpio_inst_LOANIO40     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO40
      hps_io_hps_io_gpio_inst_LOANIO51     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO51
      hps_io_hps_io_gpio_inst_LOANIO52     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO52
      hps_io_hps_io_gpio_inst_LOANIO54     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO54
      hps_io_hps_io_gpio_inst_LOANIO64     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO64
      hps_io_hps_io_gpio_inst_LOANIO65     : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO65
      piezo_controller_piezo_enable_export : out   std_logic;                                        -- export
      piezo_controller_piezo_out_export    : out   std_logic_vector(88 downto 0);                    -- export
      piezo_controller_piezo_status_export : out   std_logic_vector(2 downto 0);                     -- export
      reset_reset_n                        : in    std_logic                     := 'X'              -- reset_n
    );
  end component soc_system;

  signal reset_n         : std_logic;
  signal piezo_out_0     : std_logic;
  signal piezo_enable    : std_logic;
  signal piezo_status    : std_logic_vector(2 downto 0);
  signal piezo_new_value : std_logic;
  signal ctr             : unsigned(20 downto 0);
  signal GPIO            : std_logic_vector(3 downto 0) := (others => '0');
  signal led_avalon      : std_logic_vector(7 downto 0);

begin

  soc_system_inst : component soc_system
  port map(
    clk_clk                                        => FPGA_CLK1_50,
    reset_reset_n                                  => reset_n,
    hps_ddr_mem_a                                  => HPS_DDR3_ADDR,
    hps_ddr_mem_ba                                 => HPS_DDR3_BA,
    hps_ddr_mem_ck                                 => HPS_DDR3_CK_P,
    hps_ddr_mem_ck_n                               => HPS_DDR3_CK_N,
    hps_ddr_mem_cke                                => HPS_DDR3_CKE,
    hps_ddr_mem_cs_n                               => HPS_DDR3_CS_N,
    hps_ddr_mem_ras_n                              => HPS_DDR3_RAS_N,
    hps_ddr_mem_cas_n                              => HPS_DDR3_CAS_N,
    hps_ddr_mem_we_n                               => HPS_DDR3_WE_N,
    hps_ddr_mem_reset_n                            => HPS_DDR3_RESET_N,
    hps_ddr_mem_dq                                 => HPS_DDR3_DQ,
    hps_ddr_mem_dqs                                => HPS_DDR3_DQS_P,
    hps_ddr_mem_dqs_n                              => HPS_DDR3_DQS_N,
    hps_ddr_mem_odt                                => HPS_DDR3_ODT,
    hps_ddr_mem_dm                                 => HPS_DDR3_DM,
    hps_ddr_oct_rzqin                              => HPS_DDR3_RZQ,
    hps_io_hps_io_emac1_inst_TX_CLK                => HPS_ENET_GTX_CLK,
    hps_io_hps_io_emac1_inst_TX_CTL                => HPS_ENET_TX_EN,
    hps_io_hps_io_emac1_inst_TXD0                  => HPS_ENET_TX_DATA(0),
    hps_io_hps_io_emac1_inst_TXD1                  => HPS_ENET_TX_DATA(1),
    hps_io_hps_io_emac1_inst_TXD2                  => HPS_ENET_TX_DATA(2),
    hps_io_hps_io_emac1_inst_TXD3                  => HPS_ENET_TX_DATA(3),
    hps_io_hps_io_emac1_inst_RX_CLK                => HPS_ENET_RX_CLK,
    hps_io_hps_io_emac1_inst_RX_CTL                => HPS_ENET_RX_DV,
    hps_io_hps_io_emac1_inst_RXD0                  => HPS_ENET_RX_DATA(0),
    hps_io_hps_io_emac1_inst_RXD1                  => HPS_ENET_RX_DATA(1),
    hps_io_hps_io_emac1_inst_RXD2                  => HPS_ENET_RX_DATA(2),
    hps_io_hps_io_emac1_inst_RXD3                  => HPS_ENET_RX_DATA(3),
    hps_io_hps_io_emac1_inst_MDIO                  => HPS_ENET_MDIO,
    hps_io_hps_io_emac1_inst_MDC                   => HPS_ENET_MDC,
    hps_io_hps_io_sdio_inst_CLK                    => HPS_SD_CLK,
    hps_io_hps_io_sdio_inst_CMD                    => HPS_SD_CMD,
    hps_io_hps_io_sdio_inst_D0                     => HPS_SD_DATA(0),
    hps_io_hps_io_sdio_inst_D1                     => HPS_SD_DATA(1),
    hps_io_hps_io_sdio_inst_D2                     => HPS_SD_DATA(2),
    hps_io_hps_io_sdio_inst_D3                     => HPS_SD_DATA(3),
    hps_io_hps_io_usb1_inst_CLK                    => HPS_USB_CLKOUT,
    hps_io_hps_io_usb1_inst_STP                    => HPS_USB_STP,
    hps_io_hps_io_usb1_inst_DIR                    => HPS_USB_DIR,
    hps_io_hps_io_usb1_inst_NXT                    => HPS_USB_NXT,
    hps_io_hps_io_usb1_inst_D0                     => HPS_USB_DATA(0),
    hps_io_hps_io_usb1_inst_D1                     => HPS_USB_DATA(1),
    hps_io_hps_io_usb1_inst_D2                     => HPS_USB_DATA(2),
    hps_io_hps_io_usb1_inst_D3                     => HPS_USB_DATA(3),
    hps_io_hps_io_usb1_inst_D4                     => HPS_USB_DATA(4),
    hps_io_hps_io_usb1_inst_D5                     => HPS_USB_DATA(5),
    hps_io_hps_io_usb1_inst_D6                     => HPS_USB_DATA(6),
    hps_io_hps_io_usb1_inst_D7                     => HPS_USB_DATA(7),
    hps_io_hps_io_uart0_inst_RX                    => HPS_UART_RX,
    hps_io_hps_io_uart0_inst_TX                    => HPS_UART_TX,
    hps_io_hps_io_i2c0_inst_SDA                    => HPS_I2C0_SDAT,
    hps_io_hps_io_i2c0_inst_SCL                    => HPS_I2C0_SCLK,
    hps_io_hps_io_gpio_inst_GPIO09                 => HPS_CONV_USB_N,
    hps_io_hps_io_gpio_inst_GPIO35                 => HPS_ENET_INT_N,
    hps_io_hps_io_gpio_inst_GPIO53                 => HPS_LED,
    hps_io_hps_io_gpio_inst_GPIO61                 => HPS_GSENSOR_INT,
    hps_io_hps_io_gpio_inst_LOANIO40               => HPS_LTC_GPIO_ENABLE_N,
    hps_h2f_loan_io_out(40)                        => '0',
    hps_h2f_loan_io_oe(40)                         => '1',
    hps_io_hps_io_gpio_inst_LOANIO51               => HPS_LTC_GPIO(2),
    hps_h2f_loan_io_out(51)                        => GPIO(2),
    hps_h2f_loan_io_oe(51)                         => '1',
    hps_io_hps_io_gpio_inst_LOANIO52               => HPS_LTC_GPIO(3),
    hps_h2f_loan_io_out(52)                        => GPIO(3),
    hps_h2f_loan_io_oe(52)                         => '1',
    hps_io_hps_io_gpio_inst_LOANIO54               => HPS_KEY_N,
    hps_h2f_loan_io_in(54)                         => reset_n,
    hps_h2f_loan_io_oe(54)                         => '0',
    hps_io_hps_io_gpio_inst_LOANIO64               => HPS_LTC_GPIO(1),
    hps_h2f_loan_io_out(64)                        => GPIO(1),
    hps_h2f_loan_io_oe(64)                         => '1',
    hps_io_hps_io_gpio_inst_LOANIO65               => HPS_LTC_GPIO(0),
    hps_h2f_loan_io_out(65)                        => GPIO(0),
    hps_h2f_loan_io_oe(65)                         => '1',
    fpga_key_input_export                          => KEY_N,
    fpga_led_output_export                         => led_avalon,
    piezo_controller_piezo_out_export(87 downto 0) => PIEZO,
    piezo_controller_piezo_out_export(88)          => piezo_out_0,
    piezo_controller_piezo_enable_export           => piezo_enable,
    piezo_controller_piezo_status_export           => piezo_status
  );

  ENABLE  <= piezo_enable;

  GPIO(0) <= piezo_status(0);                      -- sync
  GPIO(1) <= piezo_status(1);                      -- phase register in use ('0' = A, '1' = B)
  GPIO(2) <= piezo_status(2);                      -- new phase value written
  GPIO(3) <= piezo_out_0;                          -- reference piezo signal

  LED(7)  <= led_avalon(7);                        -- software running
  LED(6)  <= piezo_enable;                         -- enable
  LED(5)  <= piezo_new_value;                      -- new phase value written
  LED(4)  <= piezo_enable and not piezo_status(1); -- phase register A in use
  LED(3)  <= piezo_enable and     piezo_status(1); -- phase register B in use
  LED(2)  <= led_avalon(2);
  LED(1)  <= led_avalon(1);
  LED(0)  <= led_avalon(0);

  -- LED blink duration for "piezo_status(2)": 40 ms.
  process (FPGA_CLK1_50, reset_n)
  begin
    if reset_n = '0' then
      ctr <= to_unsigned(0,21);
      piezo_new_value <= '0';
    elsif rising_edge(FPGA_CLK1_50) then
      if piezo_status(2) = '1' or (ctr > 0 and ctr < 2E6) then
        ctr <= ctr+1;
        piezo_new_value <= '1';
      else
        ctr <= to_unsigned(0,21);
        piezo_new_value <= '0';
      end if;
    end if;
  end process;

end architecture rtl;
