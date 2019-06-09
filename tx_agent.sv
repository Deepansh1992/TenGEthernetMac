`ifndef	TX_AGENT__SV
`define	TX_AGENT__SV

typedef	uvm_sequencer #(tx_sequence_item) tx_sequencer;

class tx_agent extends uvm_agent;
   `uvm_component_utils(tx_agent)
    
        tx_sequencer     tx_sqr;
        tx_sequence      tx_seq;
        tx_driver        tx_drv;
        tx_monitor       tx_mon;

    function new (string name = "tx_agent", uvm_component parent = null);
            super.new (name, parent);
    endfunction

    virtual function void build_phase (input uvm_phase phase);
        super.build_phase(phase);
        tx_sqr = tx_sequencer::type_id::create("tx_sqr", this);
        tx_seq = tx_sequence::type_id::create("tx_seq", this);
        tx_drv = tx_driver::type_id::create("tx_drv", this);
        tx_mon = tx_monitor::type_id::create("tx_mon", this);
    endfunction

   virtual function void connect_phase (uvm_phase phase);
    if (get_is_active())
        tx_drv.seq_item_port.connect (tx_sqr.seq_item_export);
    endfunction

endclass
`endif