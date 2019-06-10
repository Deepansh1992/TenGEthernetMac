//  Class: rx_sequence_item
//
class rx_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(rx_sequence_item);

    //  Group: Variables
    rand bit    pkt_rx_ren;             // To rx_dq0 of rx_dequeue.v

    //  Constructor: new
    function new(string name = "rx_sequence_item");
        super.new(name);
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

    
endclass: rx_sequence_item
