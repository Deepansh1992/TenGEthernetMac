`ifndef RX_DRIVER
`define RX_DRIVER
class rx_driver extends uvm_driver #(reset_sequence_item);
    `uvm_object_utils(rx_driver);
    virtual pkt_interface pkt_vi; 
    
    function new (input string name = "rx_driver" input uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(input uvm_phase phase); 
        `uvm_info("rx_driver", "HIERARCHY:%m", UVM_HIGH);
        super.build_phase (phase); 
        uvm_config_db#(virtual pkt_interface)::get(this, "", "pck_if", pkt_vi);
    endfunction
    
    virtual task run_phase(input uvm_phase phase);
        `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
        forever begin
            
        end
     endtask
`endif
