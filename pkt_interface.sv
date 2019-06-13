interface pkt_interface (input clk_156m25);
    logic                   pkt_rx_ren;             
    logic [63:0]            pkt_tx_data;            
    logic                   pkt_tx_eop;             
    logic [2:0]             pkt_tx_mod;             
    logic                   pkt_tx_sop;             
    logic                   pkt_tx_val;             
    logic                   reset_156m25_n;         
    logic                   pkt_rx_avail;           
    logic [63:0]            pkt_rx_data;            
    logic                   pkt_rx_eop;             
    logic                   pkt_rx_err;             
    logic [2:0]             pkt_rx_mod;             
    logic                   pkt_rx_sop;             
    logic                   pkt_rx_val;             
    logic                   pkt_tx_full;     
 endinterface