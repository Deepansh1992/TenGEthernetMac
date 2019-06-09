`ifndef	RX_AGENT__SV
`define	RX_AGENT__SV

typedef	uvm_sequencer #(rx_sequence_item) rx_sequencer;

class rx_agent extends uvm_agent;
   `uvm_component_utils(rx_agent)
    
        rx_monitor       rx_mon;

        function new (string name = "rx_agent", uvm_component parent=null);
            super.new (name, parent);
        endfunction
    
        virtual function void build_phase (input uvm_phase phase);
            super.build_phase(phase);
            rx_mon = rx_monitor::type_id::create("rx_mon", this);
        endfunction

endclass
`endif