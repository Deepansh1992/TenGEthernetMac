`ifndef	RX_MONITOR_SV
`define	RX_MONITOR_SV

class rx_monitor extends uvm_monitor;
    `uvm_component_utils(rx_monitor)

    virtual pkt_interface   pkt_vif;

    uvm_analysis_port#(mon_pkt) mon_ap;

    function new(input string name,input uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          mon_ap = new("mon_ap", this);
          uvm_config_db#(virtual pkt_interface)::get(this,"","pkt_vif",pkt_vif);
          if(pkt_vif==null) begin
            `uvm_error(get_name(), "Pkt interface not set")
          end
    endfunction

    virtual task run_phase( input uvm_phase phase);
        mon_pkt pkt_id = mon_pkt::typeid::create("pkt_id",this);
        `uvm_info(get_name(), $sformatf("%m"), UVM_HIGH);
        
        forever begin
            @(posedge pkt_vif.clk_156m25);
            //drive signals over here

            mon_ap.write(pkt_id);
        end

    endtask: run_phase
endclass