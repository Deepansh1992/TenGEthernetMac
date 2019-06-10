`ifndef RESET_DRIVER
`define RESET_DRIVER
class reset_driver extends uvm_driver #(reset_sequence_item);
    virtual pkt_interface       pkt_vi; 
    virtual wishbone_interface  wb_vi; 
    
    function new (input string name = "reset_driver" input uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(input uvm_phase phase); 
        `uvm_info("RESET_DRIVER", "HIERARCHY:%m", UVM_HIGH);
        super.build_phase (phase); 
        uvm_config_db#(virtual pkt_interface)::get(this, "", "pck_if", pkt_vi);
    endfunction
    
    virtual task run_phase(input uvm_phase phase);
        `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
  
        forever begin
            seq_item_port.get_next_item(req);
                `uvm_info("RESET_DRIVER run_phase()", req.sprint(), UVM_HIGH); 
                @(pkt_vi.clk_156m25);           pkt_vi.reset_156m25_n       <=  req.reset_156m25_n; 
                @(wb_clk_i.wb_vi);              wb_vi.wb_rst_i              <=  req.wb_rst_i;
                @(xgmii_interface.clk_xgmii_rx) xgmii_interface.reset_xgmii_rx_n    <= req.reset_xgmii_rx_n;
                @(xgmii_interface.clk_xgmii_tx) xgmii_interface.reset_xgmii_tx_n    <= req.reset_xgmii_tx_n;

                //givign an initial value to all the signals 

                wb_adr_i    <= 'd0;
                wb_cyc_i    <= 'd0;
                wb_dat_i    <= 'd0;
                wb_stb_i    <= 'd0;
                wb_we_i     <= 'd0; 
                pkt_tx_data <= 'd0; 
                pkt_tx_eop  <= 'd0; 
                pkt_tx_mod  <= 'd0; 
                pkt_tx_sop  <= 'd0; 
                pkt_tx_val  <= 'd0;
                pkt_rx_ren  <= 'd0;  


            seq_item_port.get_next_item(req);    
            end
     endtask
`endif
