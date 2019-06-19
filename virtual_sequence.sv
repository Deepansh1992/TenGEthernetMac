`ifdef VIRTUAL_SEQ_SV
`define VIRTUAL_SEQ_SV
class virtual_sequence extends uvm_sequence;
    `uvm_object_utils(virtual_sequence)
    `uvm_declare_p_sequencer(virtual_sequence)
    tx_sequence     tx_seq;
    rx_sequence     rx_seq;
    reset_sequence  rst_seq;
    wb_sequence     wb_seq;


    function new(input string name = "virtual_sequence" )//doesnt have a parent
        super.new(name);
        `uvm_info(get_name, $sformatf("Heirarchy==%m"), UVM_HIGH)
    endfunction : new  

    virtual task body();
        // `uvm_do_on();
        #1000000;
        // `uvm_do_on();
    endtask : body
    
    virtual task pre_task();
        super.pre_task();
        //raise objection over here
        phase.raise_objection(this);
    endtask : pre_task 

    virtual task post_task();
        super.post_task();
        //drop objection here
        phase.drop_objection(this);
    endtask : post_task
endclass : virtual sequence
    
`endif