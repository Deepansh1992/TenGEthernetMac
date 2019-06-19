`ifndef	RX_AGENT__SV
`define	RX_AGENT__SV
// `include "rx_sequence_item.sv"
`include "rx_monitor.sv"
typedef	uvm_sequencer #(tx_sequence_item) rx_sequencer;

class rx_agent extends uvm_agent;
   `uvm_component_utils(rx_agent)
    
    rx_monitor       rx_mon;

        uvm_analysis_port #(tx_sequence_item) agent_ap;

        function new (string name = "rx_agent", input uvm_component parent);
            super.new (name, parent);
        endfunction
    
        virtual function void build_phase (input uvm_phase phase);
            super.build_phase(phase);
            rx_mon = rx_monitor::type_id::create("rx_mon", this);
            agent_ap = new ( "agent_ap", this );

        endfunction

        virtual function void connect_phase(input uvm_phase phase);
            super.connect_phase(phase);
            this.agent_ap = rx_mon.mon_ap;
        endfunction 
endclass
`endif