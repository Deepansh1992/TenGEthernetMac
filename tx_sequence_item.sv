//  Class: tx_sequence_item
//

class tx_sequence_item extends uvm_sequence_item;
    
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

    // `uvm_object_utils_begin(tx_sequence_item)
    //     `uvm_field_array_int    (pkt_tx_data, UVM_ALL_ON)
    //     `uvm_field_int          (pkt_tx_eop, UVM_ALL_ON)
    //     `uvm_field_array_int    (pkt_tx_mod, UVM_ALL_ON)
    //     `uvm_field_int          (pkt_tx_sop, UVM_ALL_ON)
    //     `uvm_field_int          (pkt_tx_val, UVM_ALL_ON)
    // `uvm_object_utils_end
    
    //  Group: Functions

    //  Constructor: new
    function new(string name = "tx_sequence_item");
        super.new(name);
        `uvm_info(get_name(), $sformatf("%m"), UVM_MEDIUM);
        
    endfunction: new

    //  Function: do_copy
    // extern function void do_copy(uvm_object rhs);
    //  Function: do_compare
    // extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    //  Function: convert2string
    // extern function string convert2string();
    //  Function: do_print
    // extern function void do_print(uvm_printer printer);
    //  Function: do_record
    // extern function void do_record(uvm_recorder recorder);
    //  Function: do_pack
    // extern function void do_pack();
    //  Function: do_unpack
    // extern function void do_unpack();


endclass: tx_sequence_item