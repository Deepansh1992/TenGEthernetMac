`ifndef TX_SEQUENCE
`define TX_SEQUENCE
`include "tx_sequence_item.sv"
class tx_sequence extends uvm_sequence#(tx_sequence_item); 
    function new (input string name = "tx_sequence");
        super.new(name);
    endfunction

    virtual 
endclass



`endif
