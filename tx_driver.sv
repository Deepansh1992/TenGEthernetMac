`ifndef TX_DRIVER
`define TX_DRIVER
class tx_driver extends uvm_driver #(reset_sequence_item);
    `uvm_object_utils(tx_driver);
    virtual pkt_interface pkt_vi; 
    
    function new (input string name = "tx_driver" input uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(input uvm_phase phase); 
        `uvm_info("tx_driver", "HIERARCHY:%m", UVM_HIGH);
        super.build_phase (phase); 
        uvm_config_db#(virtual pkt_interface)::get(this, "", "pck_if", pkt_vi);
    endfunction
    
    virtual task run_phase(input uvm_phase phase);
        `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
        forever begin
            wait (pkt_vi.reset_156m25_n && pkt_vi.pkt_tx_full);
            seq_item_port.get_next_item(req); 
            `uvm_info("DRIVER_CLASS run_phase()", req.sprint(), UVM_HIGH); 
            @(pkt_vi.clk_156m25) begin 
                pkt_vi.pkt_tx_data  <= req.pkt_tx_data;
                pkt_vi.pkt_tx_eop   <= req.pkt_tx_eop;
                pkt_vi.pkt_tx_mod   <= req.pkt_tx_mod;
                pkt_vi.pkt_tx_sop   <= req.pkt_tx_sop;
                pkt_vi.pkt_tx_val   <= req.pkt_tx_val;
            end
            seq_item_port.item_done(); 
        end
     endtask
endclass
`endif
