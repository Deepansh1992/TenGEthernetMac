`ifndef	RESET_AGENT__SV
`define	RESET_AGENT__SV
`include "reset_driver.sv"

typedef	uvm_sequencer #(reset_sequence_item) reset_sequencer;

class reset_agent extends uvm_agent;
   `uvm_component_utils(reset_agent)
    
        reset_sequencer     rst_sqr;
        reset_driver        rst_drv;

    function new (string name = "reset_agent", uvm_component parent);
        super.new (name, parent);
    endfunction
    
    virtual function void build_phase (input uvm_phase phase);
        super.build_phase(phase);
        rst_sqr = reset_sequencer::type_id::create("rst_sqr", this);
        rst_drv = reset_driver::type_id::create("rst_drv", this);
   endfunction

   virtual function void connect_phase (uvm_phase phase);
        if (get_is_active())
            rst_drv.seq_item_port.connect (rst_sqr.seq_item_export);
    endfunction

endclass

`endif 