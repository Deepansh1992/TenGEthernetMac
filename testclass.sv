`ifndef TESTCLASS_SV
`define TESTCLASS_SV
class test_base extends uvm_test;
      
      reset_interface      reset_intf; 
      wishbone_interface   wb_intf;
      pkt_interface        pkt_intf; 
      
      reset_sequence       reset_seq; 
      wb_sequence          wb_seq; 
      tx_sequence          tx_seq; 
      

      environment       envil;
        //create seq handles

    function new(input string name, input name parent);
        super.new(name,parent);
     endfunction
     
     virtual function void end_of_elaboration_phase(input uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
        factory.print();
     endfunction
     
     virtual function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        envil = env::type_id::create("envil",this);
        // here also you can connect the virtual interface to the original interface
        uvm_config_db#(virtual reset_interface)    ::set (this, envil.reset_agt.rst_drv, "pkt_vi", reset_intf);
        uvm_config_db#(virtual wishbone_interface) ::set (this, envil.reset_agt.rst_drv, "wb_vi", wb_intf);
        uvm_config_db#(virtual pkt_interface)      ::set (this, envil.tx_agt.tx_drv, "pkt_vi", pkt_intf);
        uvm_config_db#(virtual wishbone_interface) ::set (this, envil.wb_agt._drv, "wb_vi", wb_intf);
     endfunction

     virtual task main_phase(input uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        //this part needs to be done
         seq.start(envil.reset_agt.rst_drv);
         seq.start(envil.tx_agt.tx_drv);
         seq.start(envil.wb_agt._drv);
        phase.drop_objection(this);

     endtask
     
     virtual task run_phase(input uvm_phase phase);
        `uvm_info("test_base", "Hello .. I am doing my first UVM INFO", UVM_HIGH)
        seq=user_sequence::type_id::create("seq",this);
        `uvm_info("test_base",$sformat("%m"), UVM_HIGH)
     endtask
endclass //test_base
`endif 