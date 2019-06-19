`ifndef ENV_SV
`define ENV_SV
`include "reset_agent.sv"
`include "wb_agent.sv"
`include "tx_agent.sv"
`include "rx_agent.sv" 

class environment extends uvm_env;
    `uvm_component_utils(environment)
    wb_agent        wb_agt;
    reset_agent     reset_agt;
    rx_agent        rx_agt;
    tx_agent        tx_agt;
    // // scoreboard      sb;

    function new(input string name="Environment", input uvm_component parent);
        super.new(name,parent);   
    endfunction

    virtual function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        wb_agt      = wb_agent::type_id::create("wb_agt",this);
        reset_agt   = reset_agent::type_id::create("reset_agt",this);
        rx_agt      = rx_agent::type_id::create("rx_agt",this);
        tx_agt      = tx_agent::type_id::create("tx_agt",this);
    //     // sb          = scoreboard::type_id::create("sb",this);
    endfunction
    // virtual function connect_phase(input uvm_phase phase);
        // super.connect_phase(phase);
        // rx_agt.analysis_port.connect(sb.axp_scoreboard);
        // tx_agt.analysis_port.connect(sb.axp_scoreboard);
    // endfunction 
endclass
`endif