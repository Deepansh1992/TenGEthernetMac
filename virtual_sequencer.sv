`ifdef VIRTUAL_SEQUENCER_SV
`define VIRTUAL_SEQUENCER_SV
class virtual_sequencer extends uvm_sequencer;
    `uvm_component_utils(virtual_sequencer)
    rx_sequencer        rx_seqr;
    tx_sequencer        tx_seqr;
    reset_sequencer     rst_seqr;
    wb_sequencer        wb_seqr;

    function new (input string name = "virtual_sequencer", input uvm_component parent );
        super.new(name,parent);
    endfunction : new
    
endclass : virtual_sequencer
`endif