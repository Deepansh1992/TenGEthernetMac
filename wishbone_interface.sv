interface wishbone_inerface (input wb_clk_i);
    
    logic[7:0]             wb_adr_i;              
    logic                  wb_cyc_i;               
    logic[31:0]            wb_dat_i;               
    logic                  wb_rst_i;               
    logic                  wb_stb_i;               
    logic                  wb_we_i;                
    logic                  wb_ack_o;               
    logic [31:0]           wb_dat_o;               
    logic                  wb_int_o;               
    
 endinterface