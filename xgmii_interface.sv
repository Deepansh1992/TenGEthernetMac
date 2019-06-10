interface xgmii_interface(input clk_xgmii_rx, input clk_xgmii_tx);
    logic                   reset_xgmii_rx_n;       
    logic                   reset_xgmii_tx_n;       
    logic [7:0]             xgmii_rxc;              
    logic [63:0]            xgmii_rxd;              
    logic [7:0]             xgmii_txc;              
    logic [63:0]            xgmii_txd; 
endinterface