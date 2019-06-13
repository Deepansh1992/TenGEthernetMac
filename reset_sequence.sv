`ifndef RESET_SEQUENCE
`define RESET_SEQUENCE
`include "reset_sequence_item.sv"

class reset_sequence extends uvm_sequence #(reset_sequence_item); 
    `uvm_object_utils(reset_sequence)
    
    function new (input string name = "reset_sequence" );
        super.new(name);
        `uvm_info(get_name(), $sformatf("%m"), UVM_HIGH);        
    endfunction

    virtual task body(); 
        `uvm_do(req);
    endtask
endclass
`endif