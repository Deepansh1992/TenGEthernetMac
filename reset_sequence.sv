`ifndef RESET_SEQUENCE
`define RESET_SEQUENCE

class reset_sequence extends uvm_sequence #(reset_sequence_item); 
    `uvm_object_utils(reset_sequence);
    
    function new (input string name = "reset_sequence" )
        super.new(name);
    endfunction

    virtual task body(); 
        `uvm_do(req);
    endtask
endclass
`endif