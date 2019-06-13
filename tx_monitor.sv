`ifndef TX_MONITOR
`define TX_MONITOR
class tx_monitor extends uvm_monitor; 
    `uvm_component_utils(tx_monitor)

    virtual pkt_interface pkt_vi;  

    uvm_analysis_port #(tx_sequence_item) tx_mon_ap;
    
    function new(input string name = "tx_monitor",input uvm_component parent);
        super.new(name, parent);        
    endfunction: new

    virtual function void build_phase (uvm_phase phase); 
        super.build_phase (phase);

        `uvm_info(get_name(), "*********************HEIRARCHY%m", UVM_HIGH);
        
       
        tx_mon_ap = new ("tx_mon_ap", this);
        uvm_config_db#(virtual pkt_interface)::get(this, "", "pck_vi", pkt_vi);
        if(pkt_vi==null) begin
            `uvm_error(get_name(), "Pkt interface not set")
        end
    endfunction

    virtual task run_phase (uvm_phase phase); 
        tx_sequence_item pkt_id;
        `uvm_info("MONITOR CLASS run_phase()", "HEIRARCHY%m", UVM_HIGH);
        
        forever begin 
            pkt_id = tx_sequence_item::type_id::create ("pkt_id", this); 
            tx_mon_ap.write(pkt_id); 
        end
    endtask
endclass
`endif
