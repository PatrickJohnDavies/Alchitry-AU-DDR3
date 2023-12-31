module au_top#
  ( 
        // Traffic Gen related parameters 
        parameter PORT_MODE             = "BI_MODE", 
        parameter DATA_MODE             = 4'b0010, 
        parameter TST_MEM_INSTR_MODE    = "R_W_INSTR_MODE", 
        parameter EYE_TEST              = "FALSE", // set EYE_TEST = "TRUE" to probe memory signals. Traffic Generator will only write to one single location and no read transactions will be generated. 
        parameter DATA_PATTERN          = "DGEN_ALL", 
                                          // For small devices, choose one only. For large device, choose "DGEN_ALL" 
                                          // "DGEN_HAMMER", "DGEN_WALKING1" "DGEN_WALKING0","DGEN_ADDR", "DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL" 
        parameter CMD_PATTERN           = "CGEN_ALL", // "CGEN_PRBS","CGEN_FIXED","CGEN_BRAM", "CGEN_SEQUENTIAL", "CGEN_ALL" 
        parameter CMD_WDT               = 'h3FF, 
        parameter WR_WDT                = 'h1FFF, 
        parameter RD_WDT                = 'h3FF, 
        parameter SEL_VICTIM_LINE       = 0, 
        parameter BEGIN_ADDRESS         = 32'h00000000, 
        parameter END_ADDRESS           = 32'h00ffffff, 
        parameter PRBS_EADDR_MASK_POS   = 32'hff000000, 
        // The following parameters refer to width of various ports 
        parameter CK_WIDTH              = 1, // # of CK/CK# outputs to memory. 
        parameter nCS_PER_RANK          = 1, // # of unique CS outputs per rank for phy 
        parameter CKE_WIDTH             = 1, // # of CKE outputs to memory. 
        parameter DM_WIDTH              = 2, // # of DM (data mask) 
        parameter ODT_WIDTH             = 1, // # of ODT outputs to memory. 
        parameter BANK_WIDTH            = 3, // # of memory Bank Address bits. 
        parameter COL_WIDTH             = 10, // # of memory Column Address bits. 
        parameter CS_WIDTH              = 1, // # of unique CS outputs to memory. 
        parameter DQ_WIDTH              = 16, // # of DQ (data) 
        parameter DQS_WIDTH             = 2, 
        parameter DQS_CNT_WIDTH         = 1, // = ceil(log2(DQS_WIDTH)) 
        parameter DRAM_WIDTH            = 8, // # of DQ per DQS 
        parameter ECC                   = "OFF", 
        parameter ECC_TEST              = "OFF", 
        parameter nBANK_MACHS           = 4, 
        parameter RANKS                 = 1, // # of Ranks. 
        parameter ROW_WIDTH             = 14, // # of memory Row Address bits. 
        parameter ADDR_WIDTH            = 28, // # = RANK_WIDTH + BANK_WIDTH + ROW_WIDTH + COL_WIDTH;  Chip Select is always tied to low for single rank devices 
        // The following parameters are mode register settings 
        parameter BURST_MODE            = "8", // DDR3 SDRAM: Burst Length (Mode Register 0). # = "8", "4", "OTF". DDR2 SDRAM: // Burst Length (Mode Register). // # = "8", "4".
        // The following parameters are multiplier and divisor factors for PLLE2.
        // Based on the selected design frequency these parameters vary.
        parameter CLKIN_PERIOD          = 3077, // Input Clock Period 
        parameter CLKFBOUT_MULT         = 4, // write PLL VCO multiplier 
        parameter DIVCLK_DIVIDE         = 1, // write PLL VCO divisor 
        parameter CLKOUT0_PHASE         = 0.0, // Phase for PLL output clock (CLKOUT0) 
        parameter CLKOUT0_DIVIDE        = 2, // VCO output divisor for PLL output clock (CLKOUT0) 
        parameter CLKOUT1_DIVIDE        = 4, // VCO output divisor for PLL output clock (CLKOUT1) 
        parameter CLKOUT2_DIVIDE        = 64, // VCO output divisor for PLL output clock (CLKOUT2) 
        parameter CLKOUT3_DIVIDE        = 16, // VCO output divisor for PLL output clock (CLKOUT3) 
        parameter MMCM_VCO              = 649, // Max Freq (MHz) of MMCM VCO 
        parameter MMCM_MULT_F           = 8, // write MMCM VCO multiplier 
        parameter MMCM_DIVCLK_DIVIDE    = 1, // write MMCM VCO divisor 
        // Simulation parameters 
        parameter SIMULATION            = "FALSE", // Should be TRUE during design simulations and FALSE during implementations
        // IODELAY and PHY related parameters
        parameter TCQ                   = 100,
        parameter DRAM_TYPE             = "DDR3",
        // System clock frequency parameters
        parameter nCK_PER_CLK           = 4, // # of memory CKs per fabric CLK
        // Debug parameters
        parameter DEBUG_PORT            = "OFF", // # = "ON" Enable debug signals/controls. "OFF" Disable debug signals/controls.  
        parameter RST_ACT_LOW           = 0 // =1 for active low reset, 0 for active high.
   )
   (
        input CLK100MHZ,
        input CPU_RESET_N,
        output[7:0] LED,
        input UART_RX,
        output UART_TX,
        /* DDR3 Connections */
        inout [15:0] ddr3_dq,
        inout [1:0] ddr3_dqs_n,
        inout [1:0] ddr3_dqs_p,
        output [13:0] ddr3_addr,
        output [2:0] ddr3_ba,
        output ddr3_ras_n,
        output ddr3_cas_n,
        output ddr3_we_n,
        output ddr3_reset_n,
        output [0:0] ddr3_ck_p,
        output [0:0] ddr3_ck_n,
        output [0:0] ddr3_cke,
        output [0:0] ddr3_cs_n,
        output [1:0] ddr3_dm,
        output [0:0] ddr3_odt
    );
    
    wire rst;
    reset_conditioner reset_conditioner(.clk(CLK100MHZ), .in(!CPU_RESET_N), .out(rst));
    
    wire wiz_lock;
    clk_wiz_0 clk_wiz
	(
        // Clock out ports
        .clk_out1(clk_100),     // output clk_out1
        .clk_out2(clk_200),     // output clk_out2
        // Status and control signals
        .reset(rst), // input reset
        .locked(wiz_lock),       // output locked
        // Clock in ports
        .clk_in1(CLK100MHZ)		//input clk_in1
	);      
    
    assign UART_TX = UART_RX;
    
//    // Power-on-reset generator circuit.
//    // Asserts resetn for 1023 cycles, then deasserts
//    // `resetn` is Active low reset
//    reg [9:0] por_counter = 1023;
//    always @ (posedge clk_100) 
//    begin
//        if (por_counter)
//            por_counter <= por_counter - 1 ;
//    end
//    assign rst = (por_counter == 0);
 
    function integer clogb2 (input integer size);
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
        size = size >> 1;
    end
    endfunction
  
    localparam DATA_WIDTH            = 16;
    localparam RANK_WIDTH            = clogb2(RANKS);
    localparam PAYLOAD_WIDTH         = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH;
//    localparam BURST_LENGTH          = STR_TO_INT(BURST_MODE);
    localparam APP_DATA_WIDTH        = 2 * nCK_PER_CLK * PAYLOAD_WIDTH;
    localparam APP_MASK_WIDTH        = APP_DATA_WIDTH / 8;
  
    wire [(2*nCK_PER_CLK)-1:0]            app_ecc_multiple_err;
    wire [(2*nCK_PER_CLK)-1:0]            app_ecc_single_err;
    reg [ADDR_WIDTH-1:0]                  app_addr;
    reg [2:0]                             app_cmd;
    reg                                   app_en;
    wire                                  app_rdy;
    wire [APP_DATA_WIDTH-1:0]             app_rd_data;
    wire                                  app_rd_data_end;
    wire                                  app_rd_data_valid;
    reg [APP_DATA_WIDTH-1:0]              app_wdf_data;
    wire                                  app_wdf_end = 1;
    wire [APP_MASK_WIDTH-1:0]             app_wdf_mask = 0;
    wire                                  app_wdf_rdy;
    wire                                  app_sr_active;
    wire                                  app_ref_ack;
    wire                                  app_zq_ack;
    reg                                   app_wdf_wren;
    wire [(64+(2*APP_DATA_WIDTH))-1:0]    error_status;
    wire [(PAYLOAD_WIDTH/8)-1:0]          cumlative_dq_lane_error;
    wire                                  mem_pattern_init_done;
    wire [47:0]                           tg_wr_data_counts;
    wire [47:0]                           tg_rd_data_counts;
    wire                                  modify_enable_sel;
    wire [2:0]                            data_mode_manual_sel;
    wire [2:0]                            addr_mode_manual_sel;
    wire [APP_DATA_WIDTH-1:0]             cmp_data;
    reg [63:0]                            cmp_data_r;
    wire                                  cmp_data_valid;
    reg                                   cmp_data_valid_r;
    wire                                  cmp_error;
    wire [(PAYLOAD_WIDTH/8)-1:0]          dq_error_bytelane_cmp;
    wire                                  clk;
    wire                                  rst;
    wire                                  dbg_sel_pi_incdec;
    wire                                  dbg_pi_f_inc;
    wire                                  dbg_pi_f_dec;
    wire                                  dbg_sel_po_incdec;
    wire                                  dbg_po_f_inc;
    wire                                  dbg_po_f_stg23_sel;
    wire                                  dbg_po_f_dec;
    wire                                  vio_modify_enable;
    wire [3:0]                            vio_data_mode_value;
    wire                                  vio_pause_traffic;
    wire [2:0]                            vio_addr_mode_value;
    wire [3:0]                            vio_instr_mode_value;
    wire [1:0]                            vio_bl_mode_value;
    wire [9:0]                            vio_fixed_bl_value;
    wire [2:0]                            vio_fixed_instr_value;
    wire                                  vio_data_mask_gen;
    wire                                  vio_tg_rst;
    wire                                  vio_dbg_sel_pi_incdec;
    wire                                  vio_dbg_pi_f_inc;
    wire                                  vio_dbg_pi_f_dec;
    wire                                  vio_dbg_sel_po_incdec;
    wire                                  vio_dbg_po_f_inc;
    wire                                  vio_dbg_po_f_stg23_sel;
    wire                                  vio_dbg_po_f_dec;
    wire [11:0]                           device_temp;
    `ifdef SKIP_CALIB
        wire                              calib_tap_req;
        reg                               calib_tap_load;
        reg [6:0]                         calib_tap_addr;
        reg [7:0]                         calib_tap_val;
        reg                               calib_tap_load_done;
    `endif

    wire ui_clk;
    wire ui_clk_sync_rst;
    mig_7series_0 mig(
        // Memory interface ports
       .ddr3_addr                      (ddr3_addr),
       .ddr3_ba                        (ddr3_ba),
       .ddr3_cas_n                     (ddr3_cas_n),
       .ddr3_ck_n                      (ddr3_ck_n),
       .ddr3_ck_p                      (ddr3_ck_p),
       .ddr3_cke                       (ddr3_cke),
       .ddr3_ras_n                     (ddr3_ras_n),
       .ddr3_we_n                      (ddr3_we_n),
       .ddr3_dq                        (ddr3_dq),
       .ddr3_dqs_n                     (ddr3_dqs_n),
       .ddr3_dqs_p                     (ddr3_dqs_p),
       .ddr3_reset_n                   (ddr3_reset_n),
       .init_calib_complete            (calib_done),
       .ddr3_cs_n                      (ddr3_cs_n),
       .ddr3_dm                        (ddr3_dm),
       .ddr3_odt                       (ddr3_odt),
        // Application interface ports
       .app_addr                       (app_addr),
       .app_cmd                        (app_cmd),
       .app_en                         (app_en),
       .app_wdf_data                   (app_wdf_data),
       .app_wdf_end                    (app_wdf_end),
       .app_wdf_wren                   (app_wdf_wren),
       .app_rd_data                    (app_rd_data),
       .app_rd_data_end                (app_rd_data_end),
       .app_rd_data_valid              (app_rd_data_valid),
       .app_rdy                        (app_rdy),
       .app_wdf_rdy                    (app_wdf_rdy),
       .app_sr_req                     (1'b0),
       .app_ref_req                    (1'b0),
       .app_zq_req                     (1'b0),
       .app_sr_active                  (app_sr_active),
       .app_ref_ack                    (app_ref_ack),
       .app_zq_ack                     (app_zq_ack),
       .ui_clk                         (ui_clk),
       .ui_clk_sync_rst                (ui_clk_sync_rst),
       .app_wdf_mask                   (app_wdf_mask),
        // System Clock Ports
       .sys_clk_i                      (clk_100),
        // Reference Clock Ports
       .clk_ref_i                      (clk_200),
       .device_temp                    (device_temp),
       `ifdef SKIP_CALIB
           .calib_tap_req              (calib_tap_req),
           .calib_tap_load             (calib_tap_load),
           .calib_tap_addr             (calib_tap_addr),
           .calib_tap_val              (calib_tap_val),
           .calib_tap_load_done        (calib_tap_load_done),
       `endif
       .sys_rst                        (!wiz_lock)
    );

    localparam STATE_IDLE = 3'd0;
    localparam STATE_WRITE = 3'd1;
    localparam STATE_WRITE_DONE = 3'd2;
    localparam STATE_READ = 3'd3;
    localparam STATE_READ_DONE = 3'd4;
    localparam STATE_PARK = 3'd5;
    reg [2:0] state = STATE_IDLE;
    
    localparam CMD_WRITE = 3'b000;
    localparam CMD_READ = 3'b001;
    
    wire calib_done;
    assign LED[0] = calib_done;
    reg led_pass;
    assign LED[1] = led_pass;
    reg led_fail;
    assign LED[2] = led_fail;
    reg [127:0] data_to_write = {32'hcafebabe, 32'h12345678, 32'hAA55AA55, 32'h55AA55AA};
    reg [127:0] data_read_from_memory = 128'd0;

    always @ (posedge ui_clk) 
    begin
        if (ui_clk_sync_rst) 
        begin
            state <= STATE_IDLE;
            app_en <= 0;
            app_wdf_wren <= 0;
        end 
        else 
        begin
            case (state)
                STATE_IDLE: 
                begin
                    if (calib_done) 
                        state <= STATE_WRITE;
                end
    
                STATE_WRITE: 
                begin
                    if (app_rdy & app_wdf_rdy) 
                    begin
                        state <= STATE_WRITE_DONE;
                        app_en <= 1;
                        app_wdf_wren <= 1;
                        app_addr <= 0;
                        app_cmd <= CMD_WRITE;
                        app_wdf_data <= data_to_write;
                    end
                end     

                STATE_WRITE_DONE: 
                begin
                    if (app_rdy & app_en) 
                        app_en <= 0;
                    if (app_wdf_rdy & app_wdf_wren) 
                        app_wdf_wren <= 0;
                    if (~app_en & ~app_wdf_wren) 
                        state <= STATE_READ;
                end
    
                STATE_READ: 
                begin
                    if (app_rdy) 
                    begin
                        app_en <= 1;
                        app_addr <= 0;
                        app_cmd <= CMD_READ;
                        state <= STATE_READ_DONE;
                    end
                end
                
                STATE_READ_DONE: 
                begin
                    if (app_rdy & app_en) 
                        app_en <= 0;
                    if (app_rd_data_valid) 
                    begin
                        data_read_from_memory <= app_rd_data;
                        state <= STATE_PARK;
                    end
                end
                
                STATE_PARK: 
                begin
                    if (data_to_write == data_read_from_memory) 
                    begin
                        led_pass <= 1;
                    end else if (data_to_write != data_read_from_memory) 
                    begin
                        led_fail <= 1;
                    end
                end
                
                default: 
                begin
                    state <= STATE_IDLE;
                end
            endcase
        end
    end
endmodule
