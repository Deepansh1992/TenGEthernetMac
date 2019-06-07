`ifndef RESET_SEQUENCE
`define RESET_SEQUENCE
`include "reset_sequence_item.sv"

class reset_sequence extends uvm_sequence #(reset_sequence_item); 
    function new (input string name = "reset_sequence" )
        super.new(name);
    endfunction

    virtual task body(); 
        `uvm_do(req);
    endtask
endclass
`endif