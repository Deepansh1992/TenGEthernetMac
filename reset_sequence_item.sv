//  Class: reset_sequence_item
//
class reset_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(reset_sequence_item)

    //  Group: Variables
    bit wb_rst_i;           
    bit reset_156m25_n;         
    bit reset_xgmii_rx_n;       
    bit reset_xgmii_tx_n;       
    

    `uvm_object_utils_begin (reset_sequence_item);
        `uvm_field_int  (wb_rst_i, UVM_ALL_ON); 
        `uvm_field_int  (reset_156m25_n, UVM_ALL_ON); 
        `uvm_field_int  (reset_xgmii_rx_n, UVM_ALL_ON); 
        `uvm_field_int  (reset_xgmii_tx_n, UVM_ALL_ON); 
    `uvm_object_utils_end

    //  Constructor: new
    function new(string name = "reset_sequence_item");
        super.new(name);
        `uvm_info(get_name(), $sformatf("%m"), UVM_MEDIUM);
    endfunction: new


    
endclass: reset_sequence_item
