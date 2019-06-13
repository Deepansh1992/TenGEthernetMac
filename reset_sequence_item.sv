//  Class: reset_sequence_item
//
class reset_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(reset_sequence_item)

    //  Group: Variables
    bit wb_rst_i;           
    bit reset_156m25_n;         
    bit reset_xgmii_rx_n;       
    bit reset_xgmii_tx_n;       
    
    //  Group: Functions
    
    //  Constructor: new
    function new(string name = "reset_sequence_item");
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

    
endclass: reset_sequence_item
