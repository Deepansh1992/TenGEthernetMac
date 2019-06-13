`ifndef	WB_AGENT__SV
`define	WB_AGENT__SV
`include "wb_driver.sv"

typedef	uvm_sequencer #(wb_sequence_item) wb_sequencer;

class wb_agent extends uvm_agent;
   `uvm_component_utils(wb_agent)
    
    wb_sequencer     wb_sqr;
    wb_driver        wb_drv;

    function new (string name = "wb_agent", uvm_component parent);
        super.new (name, parent);
    endfunction

    virtual function void build_phase (input uvm_phase phase);
        super.build_phase(phase);
        wb_sqr = wb_sequencer::type_id::create("wb_sqr", this);
        wb_drv = wb_driver::type_id::create("wb_drv", this);
   endfunction

    virtual function void connect_phase (uvm_phase phase);
        if (get_is_active())
            wb_drv.seq_item_port.connect (wb_sqr.seq_item_export);
    endfunction
endclass
`endif

