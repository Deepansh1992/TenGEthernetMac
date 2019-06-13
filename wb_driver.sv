`ifndef WB_DRIVER
`define WB_DRIVER
class wb_driver extends uvm_driver #(wb_sequence_item);
    `uvm_component_utils(wb_driver)
    virtual wb_interface wb_vi; 
    
    function new (input string name = "wb_driver", input uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(input uvm_phase phase); 
        `uvm_info("wb_driver", "HIERARCHY:%m", UVM_HIGH);
        super.build_phase (phase); 
        uvm_config_db#(virtual wb_interface)::get(this, "", "wb_vi", wb_vi);
    endfunction
    
    virtual task run_phase(input uvm_phase phase);
        `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);
        forever begin
            wait(wb_vi.wb_rst_i && wb_vi.wb_ack_o==1'd0 );
            seq_item_port.get_next_item(req); 
            `uvm_info(" WB DRIVER_CLASS run_phase()", req.sprint(), UVM_HIGH);
            @(wb_vi.wb_clk_i) begin
                wb_vi.wb_adr_i  =   req.wb_adr_i;  
                wb_vi.wb_cyc_i  =   req.wb_cyc_i;  
                wb_vi.wb_stb_i  =   req.wb_stb_i;  
                wb_vi.wb_dat_i  =   32'b0       ;  
                wb_vi.wb_we_i   =   1'd0        ;    
            end 
            wait(wb_vi.wb_ack_o);
            seq_item_port.item_done();            
            @(wb_vi.wb_clk_i) begin
                wb_vi.wb_adr_i  =   8'b0        ;  
                wb_vi.wb_cyc_i  =   1'b0        ;  
                wb_vi.wb_stb_i  =   1'b0        ;  
                wb_vi.wb_dat_i  =   32'b0       ;  
                wb_vi.wb_we_i   =   1'd0        ;    
            end 
        end
     endtask
`endif
