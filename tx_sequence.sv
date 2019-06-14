`ifndef TX_SEQUENCE
`define TX_SEQUENCE
`include "tx_sequence_item.sv"

class tx_sequence extends uvm_sequence#(tx_sequence_item); 

    `uvm_object_utils(tx_sequence)

    function new (input string name = "tx_sequence");
        super.new(name);
        `uvm_info(get_name(), $sformatf("%m"), UVM_HIGH)
    endfunction

    virtual task body();
        `uvm_do(req);
    endtask: body
endclass
`endif
