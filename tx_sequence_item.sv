//  Class: tx_sequence_item
//
`ifdef TX_SEQUENCE_ITEM
`define TX_SEQUENCE_ITEM

class tx_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(tx_sequence_item)
    //  Group: Variables
    
    rand bit [63:0]     pkt_tx_data;   // To tx_eq0 of tx_enqueue.v
    rand bit            pkt_tx_eop;    // To tx_eq0 of tx_enqueue.v
    rand bit [2:0]      pkt_tx_mod;    // To tx_eq0 of tx_enqueue.v
    rand bit            pkt_tx_sop;    // To tx_eq0 of tx_enqueue.v
    rand bit            pkt_tx_val;    // To tx_eq0 of tx_enqueue.v

    rand bit            pkt_rx_avail; 
    rand bit [63:0]     pkt_rx_data ; 
    rand bit            pkt_rx_eop  ; 
    rand bit            pkt_rx_err  ; 
    rand bit  [2:0]     pkt_rx_mod  ; 
    rand bit            pkt_rx_sop  ; 
    rand bit            pkt_rx_val  ; 
    rand bit            pkt_tx_full ; 

    `uvm_object_utils_begin(tx_sequence_item)
        `uvm_field_array_int    (pkt_tx_data, UVM_ALL_ON)
        `uvm_field_int          (pkt_tx_eop, UVM_ALL_ON)
        `uvm_field_array_int    (pkt_tx_mod, UVM_ALL_ON)
        `uvm_field_int          (pkt_tx_sop, UVM_ALL_ON)
        `uvm_field_int          (pkt_tx_val, UVM_ALL_ON)
    `uvm_object_utils_end

 // constraints should be given here   
 
    //  Constructor: new
    function new(string name = "tx_sequence_item");
        super.new(name);
        `uvm_info(get_name(), $sformatf("%m"), UVM_MEDIUM);
    endfunction: new

endclass: tx_sequence_item


class /*name of the class*/ extends tx_sequence_item;
    `uvm_object_utils(/*name of the class*/)
    constraint /*name*/
    {

    }

    function new (input string name = ""  )
        super.new(name);
    endfunction : new
endclass 

class /*name of the class*/ extends tx_sequence_item;
    `uvm_object_utils(/*name of the class*/)
    constraint /*name*/
    {

    }

    function new (input string name = ""  )
        super.new(name);
    endfunction : new
endclass 

class /*name of the class*/ extends tx_sequence_item;
    `uvm_object_utils(/*name of the class*/)
    constraint /*name*/
    {

    }

    function new (input string name = ""  )
        super.new(name);
    endfunction : new
endclass 

`endif
