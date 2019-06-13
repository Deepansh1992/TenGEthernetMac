// `ifndef RX_DRIVER
// `define RX_DRIVER
// class rx_driver extends uvm_driver #(reset_sequence_item);
//     `uvm_component_utils(rx_driver);
//     virtual pkt_interface pkt_vi; 
    
//     function new (input string name = "rx_driver", input uvm_component parent);
//         super.new(name, parent);
//     endfunction 

//     virtual function void build_phase(input uvm_phase phase); 
//         `uvm_info("rx_driver", "HIERARCHY:%m", UVM_HIGH);
//         super.build_phase (phase); 
//             uvm_config_db#(virtual pkt_interface)::get(this, "", "pkt_vi", pkt_vi);
//     endfunction
    
//     virtual task run_phase(input uvm_phase phase);
//         `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
//         forever begin
//             wait(pkt_vi.reset_156m25_n && pkt_vi.pkt_rx_avail);
//             `uvm_info("RX_DRIVER_CLASS run_phase", req.sprint(), UVM_HIGH);
//             @(pkt_vi.clk_156m25) begin 
//                 pkt_vi.pkt_rx_ren   = 1'b1;
//             end
//             wait(pkt_vi.eop);
//             @(pkt_vi.clk_156m25)begin
//                 pkt_vi.pkt_rx_ren   = 1'b0;
//             end
//         end
//      endtask
// `endif
