set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]

# Clock signal

set_property -dict { PACKAGE_PIN N14    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 [get_ports {CLK100MHZ}];

#Button

set_property -dict { PACKAGE_PIN P6   IOSTANDARD LVCMOS33 } [get_ports { CPU_RESET_N }];#IO_25_14

# LEDs

set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN K12   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
set_property -dict { PACKAGE_PIN l13   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }];
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }];
set_property -dict { PACKAGE_PIN M12   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }];
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }];

##HD Headers
##Bank A

#set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS33 } [get_ports { BA2 }];
#set_property -dict { PACKAGE_PIN T7   IOSTANDARD LVCMOS33 } [get_ports { BA3 }];
#set_property -dict { PACKAGE_PIN T5   IOSTANDARD LVCMOS33 } [get_ports { BA5 }];
#set_property -dict { PACKAGE_PIN R5   IOSTANDARD LVCMOS33 } [get_ports { BA6 }];
#set_property -dict { PACKAGE_PIN R8   IOSTANDARD LVCMOS33 } [get_ports { BA8 }];
#set_property -dict { PACKAGE_PIN P8   IOSTANDARD LVCMOS33 } [get_ports { BA9 }];
#set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports { BA11 }];
#set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports { BA12 }];

#set_property -dict { PACKAGE_PIN J1   IOSTANDARD LVCMOS33 } [get_ports { BA14 }];
#set_property -dict { PACKAGE_PIN K1   IOSTANDARD LVCMOS33 } [get_ports { BA15 }];
#set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports { BA17 }];
#set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports { BA18 }];
#set_property -dict { PACKAGE_PIN G1   IOSTANDARD LVCMOS33 } [get_ports { BA20 }];
#set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports { BA21 }];
#set_property -dict { PACKAGE_PIN K5   IOSTANDARD LVCMOS33 } [get_ports { BA23 }];
#set_property -dict { PACKAGE_PIN E6   IOSTANDARD LVCMOS33 } [get_ports { BA24 }];

#set_property -dict { PACKAGE_PIN M6   IOSTANDARD LVCMOS33 } [get_ports { BA27 }];
#set_property -dict { PACKAGE_PIN N6   IOSTANDARD LVCMOS33 } [get_ports { BA28 }];
#set_property -dict { PACKAGE_PIN H5   IOSTANDARD LVCMOS33 } [get_ports { BA30 }];
#set_property -dict { PACKAGE_PIN H4   IOSTANDARD LVCMOS33 } [get_ports { BA31 }];
#set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports { BA33 }];
#set_property -dict { PACKAGE_PIN H3   IOSTANDARD LVCMOS33 } [get_ports { BA34 }];
#set_property -dict { PACKAGE_PIN J5   IOSTANDARD LVCMOS33 } [get_ports { BA36 }];
#set_property -dict { PACKAGE_PIN J4   IOSTANDARD LVCMOS33 } [get_ports { BA37 }];

#set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports { BA39 }];
#set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports { BA40 }];
#set_property -dict { PACKAGE_PIN N9   IOSTANDARD LVCMOS33 } [get_ports { BA42 }];
#set_property -dict { PACKAGE_PIN P9   IOSTANDARD LVCMOS33 } [get_ports { BA43 }];
#set_property -dict { PACKAGE_PIN R7   IOSTANDARD LVCMOS33 } [get_ports { BA45 }];
#set_property -dict { PACKAGE_PIN R6   IOSTANDARD LVCMOS33 } [get_ports { BA46 }];
#set_property -dict { PACKAGE_PIN T9   IOSTANDARD LVCMOS33 } [get_ports { BA48 }];
#set_property -dict { PACKAGE_PIN T10  IOSTANDARD LVCMOS33 } [get_ports { BA49 }];

##Bank B

#set_property -dict { PACKAGE_PIN D1   IOSTANDARD LVCMOS33 } [get_ports { BB2 }];
#set_property -dict { PACKAGE_PIN E2   IOSTANDARD LVCMOS33 } [get_ports { BB3 }];
#set_property -dict { PACKAGE_PIN A2   IOSTANDARD LVCMOS33 } [get_ports { BB5 }];
#set_property -dict { PACKAGE_PIN B2   IOSTANDARD LVCMOS33 } [get_ports { BB6 }];
#set_property -dict { PACKAGE_PIN E1   IOSTANDARD LVCMOS33 } [get_ports { BB8 }];
#set_property -dict { PACKAGE_PIN F2   IOSTANDARD LVCMOS33 } [get_ports { BB9 }];
#set_property -dict { PACKAGE_PIN F3   IOSTANDARD LVCMOS33 } [get_ports { BB11 }];
#set_property -dict { PACKAGE_PIN F4   IOSTANDARD LVCMOS33 } [get_ports { BB12 }];

#set_property -dict { PACKAGE_PIN A3   IOSTANDARD LVCMOS33 } [get_ports { BB14 }];
#set_property -dict { PACKAGE_PIN B4   IOSTANDARD LVCMOS33 } [get_ports { BB15 }];
#set_property -dict { PACKAGE_PIN A4   IOSTANDARD LVCMOS33 } [get_ports { BB17 }];
#set_property -dict { PACKAGE_PIN A5   IOSTANDARD LVCMOS33 } [get_ports { BB18 }];
#set_property -dict { PACKAGE_PIN B5   IOSTANDARD LVCMOS33 } [get_ports { BB20 }];
#set_property -dict { PACKAGE_PIN B6   IOSTANDARD LVCMOS33 } [get_ports { BB21 }];
#set_property -dict { PACKAGE_PIN A7   IOSTANDARD LVCMOS33 } [get_ports { BB23 }];
#set_property -dict { PACKAGE_PIN B7   IOSTANDARD LVCMOS33 } [get_ports { BB24 }];

#set_property -dict { PACKAGE_PIN C7   IOSTANDARD LVCMOS33 } [get_ports { BB27 }];
#set_property -dict { PACKAGE_PIN C6   IOSTANDARD LVCMOS33 } [get_ports { BB28 }];
#set_property -dict { PACKAGE_PIN D6   IOSTANDARD LVCMOS33 } [get_ports { BB30 }];
#set_property -dict { PACKAGE_PIN D5   IOSTANDARD LVCMOS33 } [get_ports { BB31 }];
#set_property -dict { PACKAGE_PIN F5   IOSTANDARD LVCMOS33 } [get_ports { BB33 }];
#set_property -dict { PACKAGE_PIN E5   IOSTANDARD LVCMOS33 } [get_ports { BB34 }];
#set_property -dict { PACKAGE_PIN G5   IOSTANDARD LVCMOS33 } [get_ports { BB36 }];
#set_property -dict { PACKAGE_PIN G4   IOSTANDARD LVCMOS33 } [get_ports { BB37 }];

#set_property -dict { PACKAGE_PIN D4   IOSTANDARD LVCMOS33 } [get_ports { BB39 }];
#set_property -dict { PACKAGE_PIN C4   IOSTANDARD LVCMOS33 } [get_ports { BB40 }];
#set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports { BB42 }];
#set_property -dict { PACKAGE_PIN D3   IOSTANDARD LVCMOS33 } [get_ports { BB43 }];
#set_property -dict { PACKAGE_PIN C3   IOSTANDARD LVCMOS33 } [get_ports { BB45 }];
#set_property -dict { PACKAGE_PIN C2   IOSTANDARD LVCMOS33 } [get_ports { BB46 }];
#set_property -dict { PACKAGE_PIN C1   IOSTANDARD LVCMOS33 } [get_ports { BB48 }];
#set_property -dict { PACKAGE_PIN B1   IOSTANDARD LVCMOS33 } [get_ports { BB49 }];

##Bank C

#set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { BC2 }];
#set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { BC3 }];
#set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { BC5 }];
#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { BC6 }];
#set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { BC8 }];
#set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { BC9 }];
#set_property -dict { PACKAGE_PIN N2    IOSTANDARD LVCMOS33 } [get_ports { BC11 }];
#set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { BC12 }];

#set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS33 } [get_ports { BC14 }];
#set_property -dict { PACKAGE_PIN P4   IOSTANDARD LVCMOS33 } [get_ports { BC15 }];
#set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS33 } [get_ports { BC17 }];
#set_property -dict { PACKAGE_PIN L4   IOSTANDARD LVCMOS33 } [get_ports { BC18 }];
#set_property -dict { PACKAGE_PIN N4   IOSTANDARD LVCMOS33 } [get_ports { BC20 }];
#set_property -dict { PACKAGE_PIN M5   IOSTANDARD LVCMOS33 } [get_ports { BC21 }];
#set_property -dict { PACKAGE_PIN L5   IOSTANDARD LVCMOS33 } [get_ports { BC23 }];
#set_property -dict { PACKAGE_PIN P5   IOSTANDARD LVCMOS33 } [get_ports { BC24 }];

#set_property -dict { PACKAGE_PIN T4   IOSTANDARD LVCMOS33 } [get_ports { BC27 }];
#set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports { BC28 }];
#set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports { BC30 }];
#set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports { BC31 }];
#set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { BC33 }];
#set_property -dict { PACKAGE_PIN R1   IOSTANDARD LVCMOS33 } [get_ports { BC34 }];
#set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports { BC36 }];
#set_property -dict { PACKAGE_PIN P1   IOSTANDARD LVCMOS33 } [get_ports { BC37 }];

#set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports { BC39 }];
#set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS33 } [get_ports { BC40 }];
#set_property -dict { PACKAGE_PIN N13  IOSTANDARD LVCMOS33 } [get_ports { BC42 }];
#set_property -dict { PACKAGE_PIN P13  IOSTANDARD LVCMOS33 } [get_ports { BC43 }];
#set_property -dict { PACKAGE_PIN N11  IOSTANDARD LVCMOS33 } [get_ports { BC45 }];
#set_property -dict { PACKAGE_PIN N12  IOSTANDARD LVCMOS33 } [get_ports { BC46 }];
#set_property -dict { PACKAGE_PIN P10  IOSTANDARD LVCMOS33 } [get_ports { BC48 }];
#set_property -dict { PACKAGE_PIN P11  IOSTANDARD LVCMOS33 } [get_ports { BC49 }];

##Bank D

#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { BD2 }]; # Shared with LED2
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { BD3 }]; # Shared with LED3
#set_property -dict { PACKAGE_PIN M12   IOSTANDARD LVCMOS33 } [get_ports { BD5 }]; # Shared with LED6
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { BD6 }]; # Shared with LED7
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { BD8 }];
#set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { BD9 }];
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { BD11 }];
#set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { BD12 }];

#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { BD14 }]; # Shared with USB_TXD
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { BD15 }]; # Shared with USB_RXD

#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { BD42 }];
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { BD43 }];
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { BD45 }]; # Shared with LED5
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { BD46 }]; # Shared with LED4
#set_property -dict { PACKAGE_PIN K12   IOSTANDARD LVCMOS33 } [get_ports { BD48 }]; # Shared with LED1
#set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { BD49 }]; # Shared with LED0

##USB-RS232 Interface

set_property -dict { PACKAGE_PIN P15    IOSTANDARD LVCMOS33 } [get_ports { UART_RX }];
set_property -dict { PACKAGE_PIN P16    IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];

##Quad SPI Flash

#set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }];
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }];
#set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }];
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }];
#set_property -dict { PACKAGE_PIN L12   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }];
#set_property -dict { PACKAGE_PIN E8    IOSTANDARD LVCMOS33 } [get_ports { QSPI_CLK }];

##DDR3 Memory   #THIS IS UNTESTED. IOSTANDARD may very well be the INCORRECT ONE. 
                #This is mostly a placeholder with correct package pins and labels.

#set_property -dict { PACKAGE_PIN G14    IOSTANDARD LVCMOS33 } [get_ports { DDR_CK_P }];
#set_property -dict { PACKAGE_PIN F14    IOSTANDARD LVCMOS33 } [get_ports { DDR_CK_N }];
#set_property -dict { PACKAGE_PIN D15    IOSTANDARD LVCMOS33 } [get_ports { DDR_CKE }];

#set_property -dict { PACKAGE_PIN D16    IOSTANDARD LVCMOS33 } [get_ports { DDR_CS }];
#set_property -dict { PACKAGE_PIN D11    IOSTANDARD LVCMOS33 } [get_ports { DDR_RAS }];
#set_property -dict { PACKAGE_PIN D14    IOSTANDARD LVCMOS33 } [get_ports { DDR_CAS }];
#set_property -dict { PACKAGE_PIN E11    IOSTANDARD LVCMOS33 } [get_ports { DDR_WE }];

#set_property -dict { PACKAGE_PIN B15    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQS0_P }];
#set_property -dict { PACKAGE_PIN A15    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQS0_N }];
#set_property -dict { PACKAGE_PIN B9     IOSTANDARD LVCMOS33 } [get_ports { DDR_DQS1_P }];
#set_property -dict { PACKAGE_PIN A10    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQS1_N }];

#set_property -dict { PACKAGE_PIN A14    IOSTANDARD LVCMOS33 } [get_ports { DDR_DM[0] }];
#set_property -dict { PACKAGE_PIN C9     IOSTANDARD LVCMOS33 } [get_ports { DDR_DM[1] }];

#set_property -dict { PACKAGE_PIN G11    IOSTANDARD LVCMOS33 } [get_ports { DDR_ODT }];

#set_property -dict { PACKAGE_PIN D13    IOSTANDARD LVCMOS33 } [get_ports { DDR_RST }];

#set_property -dict { PACKAGE_PIN F12    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[0] }];
#set_property -dict { PACKAGE_PIN G16    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[1] }];
#set_property -dict { PACKAGE_PIN G15    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[2] }];
#set_property -dict { PACKAGE_PIN E16    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[3] }];
#set_property -dict { PACKAGE_PIN H11    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[4] }];
#set_property -dict { PACKAGE_PIN G12    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[5] }];
#set_property -dict { PACKAGE_PIN H16    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[6] }];
#set_property -dict { PACKAGE_PIN H12    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[7] }];
#set_property -dict { PACKAGE_PIN J16    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[8] }];
#set_property -dict { PACKAGE_PIN H13    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[9] }];
#set_property -dict { PACKAGE_PIN E12    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[10] }];
#set_property -dict { PACKAGE_PIN H14    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[11] }];
#set_property -dict { PACKAGE_PIN F13    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[12] }];
#set_property -dict { PACKAGE_PIN J15    IOSTANDARD LVCMOS33 } [get_ports { DDR_A[13] }];

#set_property -dict { PACKAGE_PIN E13    IOSTANDARD LVCMOS33 } [get_ports { DDR_BA[0] }];
#set_property -dict { PACKAGE_PIN F15    IOSTANDARD LVCMOS33 } [get_ports { DDR_BA[1] }];
#set_property -dict { PACKAGE_PIN E15    IOSTANDARD LVCMOS33 } [get_ports { DDR_BA[2] }];

#set_property -dict { PACKAGE_PIN A13    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[0] }];
#set_property -dict { PACKAGE_PIN B16    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[1] }];
#set_property -dict { PACKAGE_PIN B14    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[2] }];
#set_property -dict { PACKAGE_PIN C11    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[3] }];
#set_property -dict { PACKAGE_PIN C13    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[4] }];
#set_property -dict { PACKAGE_PIN C16    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[5] }];
#set_property -dict { PACKAGE_PIN C12    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[6] }];
#set_property -dict { PACKAGE_PIN C14    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[7] }];
#set_property -dict { PACKAGE_PIN D8     IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[8] }];
#set_property -dict { PACKAGE_PIN B11    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[9] }];
#set_property -dict { PACKAGE_PIN C8     IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[10] }];
#set_property -dict { PACKAGE_PIN B10    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[11] }];
#set_property -dict { PACKAGE_PIN A12    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[12] }];
#set_property -dict { PACKAGE_PIN A8     IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[13] }];
#set_property -dict { PACKAGE_PIN B12    IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[14] }];
#set_property -dict { PACKAGE_PIN A9     IOSTANDARD LVCMOS33 } [get_ports { DDR_DQ[15] }];