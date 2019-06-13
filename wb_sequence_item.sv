//  Class: wb_sequence_item
//
class wb_sequence_item extends uvm_sequence_item;

    //  Group: Variables
    rand bit [7:0]             wb_adr_i;               // To wishbone_if0 of wishbone_if.v
    rand bit                   wb_cyc_i;               // To wishbone_if0 of wishbone_if.v
    rand bit [31:0]            wb_dat_i;               // To wishbone_if0 of wishbone_if.v
    rand bit                   wb_stb_i;               // To wishbone_if0 of wishbone_if.v
    rand bit                   wb_we_i;                // To wishbone_if0 of wishbone_if.v
    
    // `uvm_object_utils_begin (wb_sequence_item)
    //     `uvm_field_array_int    (wb_adr_i, UVM_ALL_ON)           
    //     `uvm_field_int          (wb_cyc_i, UVM_ALL_ON)           
    //     `uvm_field_array_int    (wb_dat_i, UVM_ALL_ON)           
    //     `uvm_field_int          (wb_stb_i, UVM_ALL_ON)           
    //     `uvm_field_int          (wb_we_i, UVM_ALL_ON)                 
    // `uvm_object_utils_end
    
    function new(string name = "wb_sequence_item");
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

    
endclass: wb_sequence_item
