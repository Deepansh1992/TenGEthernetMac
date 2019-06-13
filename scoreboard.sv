`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV
class scoreboard extends uvm_scoreboard;
    `uvm_component_param_utils(scoreboard)

    uvm_analysis_export#(mon_pkt)  axp_scoreboard;
    //needs uvm analysis export from tx_agent

     function new(input string name ="", input uvm_component parent);
        super.new(name,parent);
     endfunction
    
     virtual function void build_phase (input uvm_phase phase);
        super.build_phase(phase);
     endfunction

     virtual function connect_phase(input uvm_phase phase);
        super.connect_phase(phase);
        // here u need to connect the port to the compartor of the scorrboard
     endfunction
endclass

// scoreboard needs a report phase here

`endif