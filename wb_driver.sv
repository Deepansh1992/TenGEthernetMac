`ifndef WB_DRIVER
`define WB_DRIVER
class wb_driver extends uvm_driver #(reset_sequence_item);
    virtual wb_interface wb_vi; 
    
    function new (input string name = "wb_driver" input uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(input uvm_phase phase); 
        `uvm_info("wb_driver", "HIERARCHY:%m", UVM_HIGH);
        super.build_phase (phase); 
        uvm_config_db#(virtual wb_interface)::get(this, "", "pck_if", wb_vi);
    endfunction
    
    virtual task run_phase(input uvm_phase phase);
        `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
        forever begin
            seq_item_port.get_next_item(req); 
            `uvm_info("DRIVER_RUN_")
            
        end
     endtask
`endif
