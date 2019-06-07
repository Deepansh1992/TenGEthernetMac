`ifndef WISHBONE_SEQUENCE
`define WISHBONE_SEQUENCE
`include "wb_sequence_item.sv"
class wb_sequence extends uvm_sequence#(wb_sequence_item);

    function new (input string name = "wb_sequence")
        super.new(name); 
    endfunction 

    virtual task body(); 
        `uvm_do(req); 
    endtask
endclass
`endif
