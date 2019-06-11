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
            if(pkt_vif.pkt_rx_val) begin
                @(posedge pkt_vif.clk_156m25) begin
                    //drive signals over here
                    pkt_id.pkt_rx_avail  =  pkt_vif.pkt_rx_avail;
                    pkt_id.pkt_rx_data   =  pkt_vif.pkt_rx_data;  
                    pkt_id.pkt_rx_eop    =  pkt_vif.pkt_rx_eop;    
                    pkt_id.pkt_rx_err    =  pkt_vif.pkt_rx_err;    
                    pkt_id.pkt_rx_mod    =  pkt_vif.pkt_rx_mod;    
                    pkt_id.pkt_rx_sop    =  pkt_vif.pkt_rx_sop;    
                    pkt_id.pkt_rx_val    =  pkt_vif.pkt_rx_val;    
                    pkt_id.pkt_tx_full   =  pkt_vif.pkt_tx_full;             
                end
                mon_ap.write(pkt_id);
            end
        end

    endtask: run_phase
endclass