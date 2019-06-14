`ifndef TESTCLASS_SV
`define TESTCLASS_SV

`include "reset_sequence.sv"
`include "wb_sequence.sv"
`include "tx_sequence.sv"
`include "environment.sv"
	
class test_base extends uvm_test;
   `uvm_component_utils(test_base)
   
    environment    envil;
    reset_sequence  rst_seq;
    wb_sequence     wb_seq;
    tx_sequence     tx_seq; 


    function new(input string name, input uvm_component parent);
         super.new(name, parent);
    endfunction : new
     
     virtual function void end_of_elaboration_phase(input uvm_phase phase);
        super.end_of_elaboration_phase(phase);
      //   uvm_top.print_topology();
      //   factory.print();
     endfunction
     
     virtual function void build_phase(input uvm_phase phase);
      super.build_phase(phase);
        envil = environment::type_id::create("envil",this);

   //    //   connect the virtual interface to the original interface
      uvm_config_db#(virtual pkt_interface)::set(this, envil.tx_agt.tx_drv, "pkt_vi", Mac10gEthernet_test.pkt_intf);
      uvm_config_db#(virtual pkt_interface)::set(this, envil.tx_agt.tx_mon, "pkt_vi", Mac10gEthernet_test.pkt_intf);
      // uvm_config_db#(virtual pkt_interface)::set(this, envil.rx_agt.rx_mon, "pkt_vi", Mac10gEthernet_test.pkt_vi);
      uvm_config_db#(virtual pkt_interface)::set(this, envil.reset_agt.rst_drv, "pkt_vi", Mac10gEthernet_test.pkt_intf);
      uvm_config_db#(virtual wishbone_interface)::set(this, envil.wb_agt.wb_drv, "wb_vi", Mac10gEthernet_test.wb_intf);
      uvm_config_db#(virtual wishbone_interface)::set(this, envil.reset_agt.rst_drv, "wb_vi", Mac10gEthernet_test.wb_intf);
     endfunction

     virtual task main_phase(input uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        //this part needs to be done
            //seq.start
        phase.drop_objection(this);

     endtask
     
     virtual task run_phase(input uvm_phase phase);
        `uvm_info("test_base", $sformatf("%m"), UVM_HIGH)

        rst_seq   =  reset_sequence::type_id::create("rst_seq",this);
        wb_seq    =  wb_sequence::type_id::create("wb_seq",this);
        tx_seq    =  tx_sequence::type_id::create("tx_seq",this);
        //   rx_seq   =  rx_sequence::type_id::create("rx_seq",this);
      
        `uvm_info("test_base",$sformatf("%m"), UVM_HIGH)
     endtask
endclass //test_base
`endif 