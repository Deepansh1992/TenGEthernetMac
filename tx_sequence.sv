`ifndef TX_SEQUENCE
`define TX_SEQUENCE
class tx_sequence extends uvm_sequence#(tx_sequence_item); 
    function new (input string name = "tx_sequence");
        super.new(name);
    endfunction

    virtual task body();
        `uvm_do(req);
    endtask: body
endclass
`endif
