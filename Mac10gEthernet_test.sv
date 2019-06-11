module Mac10gEthernet_test();
 
reg           clk_156m25;
reg           clk_312m50;
reg           clk_xgmii_rx;
reg           clk_xgmii_tx;

reg           reset_156m25_n;
reg           reset_xgmii_rx_n;
reg           reset_xgmii_tx_n;

reg           pkt_rx_ren;

reg  [63:0]   pkt_tx_data;
reg           pkt_tx_val;
reg           pkt_tx_sop;
reg           pkt_tx_eop;
reg  [2:0]    pkt_tx_mod;

integer       tx_count;
integer       rx_count;

wire                    pkt_rx_avail;   
wire [63:0]             pkt_rx_data;    
wire                    pkt_rx_eop;     
wire                    pkt_rx_err;     
wire [2:0]              pkt_rx_mod;     
wire                    pkt_rx_sop;     
wire                    pkt_rx_val;     
wire                    pkt_tx_full;    
wire                    wb_ack_o;       
wire [31:0]             wb_dat_o;       
wire                    wb_int_o;       
wire [7:0]              xgmii_txc;      
wire [63:0]             xgmii_txd;      

    // Clock Generators 
    initial begin 
        wb_clk_i = 'd0; 
        forever begin 
            WaitPS(10000); 
            wb_clk_i = ~ wb_clk_i; 
        end
    end
    
    initial begin
        clk_156m25 = 1'b0;
        clk_xgmii_rx = 1'b0;
        clk_xgmii_tx = 1'b0;
        forever begin
            WaitPS(3200);
            clk_156m25 = ~clk_156m25;
            clk_xgmii_rx = ~clk_xgmii_rx;
            clk_xgmii_tx = ~clk_xgmii_tx;
        end
    end

    initial begin
        clk_312m50 = 1'b0;
        forever begin
            WaitPS(1600);
            clk_312m50 = ~clk_312m50;
        end
    end

    wishbone_interface  wb_itf      (wb_clk_i); 
    xgmii_interface     xgmii_intf  (clk_xgmii_rx, clk_xgmii_tx); 
    pkt_interface       pkt_intf    (clk_156m25); 
    
    xge_mac dut( 
                 .wb_clkI       (wb_clk_i)
                ,.clk_156m25    (clk_156m25)
                ,.clk_xgmii_rx  (clk_xgmii_rx)
                ,.clk_xgmii_tx  (clk_xgmii_tx)
                ,wb_itf
                ,xgmii_intf
                ,pkt_intf
    );

    // xge_mac dut(/*AUTOINST*/
    //         // Outputs
    //         .pkt_rx_avail               (pkt_rx_avail      ),
    //         .pkt_rx_data                (pkt_rx_data       ),
    //         .pkt_rx_eop                 (pkt_rx_eop        ),
    //         .pkt_rx_err                 (pkt_rx_err        ),
    //         .pkt_rx_mod                 (pkt_rx_mod[2:0]   ),
    //         .pkt_rx_sop                 (pkt_rx_sop        ),
    //         .pkt_rx_val                 (pkt_rx_val        ),
    //         .pkt_tx_full                (pkt_tx_full       ),
    //         .wb_ack_o                   (wb_ack_o          ),
    //         .wb_dat_o                   (wb_dat_o          ),
    //         .wb_int_o                   (wb_int_o          ),
    //         .xgmii_txc                  (xgmii_txc         ),
    //         .xgmii_txd                  (xgmii_txd         ),
    //         // Inputs
    //         .clk_156m25                 (clk_156m25        ),
    //         .clk_xgmii_rx               (clk_xgmii_rx      ),
    //         .clk_xgmii_tx               (clk_xgmii_tx      ),
    //         .pkt_rx_ren                 (pkt_rx_ren        ),
    //         .pkt_tx_data                (pkt_tx_data       ),
    //         .pkt_tx_eop                 (pkt_tx_eop        ),
    //         .pkt_tx_mod                 (pkt_tx_mod        ),
    //         .pkt_tx_sop                 (pkt_tx_sop        ),
    //         .pkt_tx_val                 (pkt_tx_val        ),
    //         .reset_156m25_n             (reset_156m25_n    ),
    //         .reset_xgmii_rx_n           (reset_xgmii_rx_n  ),
    //         .reset_xgmii_tx_n           (reset_xgmii_tx_n  ),
    //         .wb_adr_i                   (wb_adr_i          ),
    //         .wb_clk_i                   (wb_clk_i          ),
    //         .wb_cyc_i                   (wb_cyc_i          ),
    //         .wb_dat_i                   (wb_dat_i          ),
    //         .wb_rst_i                   (wb_rst_i          ),
    //         .wb_stb_i                   (wb_stb_i          ),
    //         .wb_we_i                    (wb_we_i           ),
    //         .xgmii_rxc                  (xgmii_rxc         ),
    //         .xgmii_rxd                  (xgmii_rxd         )
    //         );



endmodule

