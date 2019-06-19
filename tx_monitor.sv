`ifndef TX_MONITOR
`define TX_MONITOR

class tx_monitor extends uvm_monitor; 
    `uvm_component_utils(tx_monitor); 

    virtual pkt_interface pkt_vi;  
    uvm_analysis_port #(tx_pkt) tx_mon_ap;
    
    function new(input string name = "tx_monitor", uvm_component parent);
        super.new(name, parent);        
    endfunction: new

    virtual function void build_phase (uvm_phase phase); 
        `uvm_info(get_name(), "HEIRARCHY%m", UVM_HIGH);
        super.build(phase);
        uvm_config_db#(virtual pkt_interface)::get(this, "", "pck_if", pkt_vi);
        if(pkt_vif==null) begin
            `uvm_error(get_name(), "Pkt interface not set")
        end
    endfunction

    virtual task run_phase (uvm_phase phase); 
        tx_pkt tx_pck_id = tx_pkt::type_id::create ("pkt_id", this); 
        `uvm_info("MONITOR CLASS run_phase()", "HEIRARCHY%m", UVM_HIGH);

        forever begin 
            @(posedge pkt_vi.clk_156m251) begin 
                tx_pkt.pkt_tx_data    = pkt_vi.pkt_tx_data       ; 
                tx_pkt.pkt_tx_eop     = pkt_vi.pkt_tx_eop        ; 
                tx_pkt.pkt_tx_mod     = pkt_vi.pkt_tx_mod        ; 
                tx_pkt.pkt_tx_sop     = pkt_vi.pkt_tx_sop        ; 
                tx_pkt.pkt_tx_val     = pkt_vi.pkt_tx_val        ; 
                tx_pkt.reset_156m25_n = pkt_vi.reset_156m25_n    ; 
                tx_pkt.pkt_tx_full    = pkt_vi.pkt_tx_full       ; 
            end 
                tx_mon_ap.write(tx_pkt);
        end
    endtask
endclass
        

        
        



    

    
    



`endif
