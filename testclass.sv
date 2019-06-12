`ifndef TESTCLASS_SV
`define TESTCLASS_SV
//`include "package.sv"
//import Macpackage::*; 

	`include "../TenGEthernetMac/reset_sequence_item.sv"
	`include "../TenGEthernetMac/wb_sequence_item.sv"
	`include "../TenGEthernetMac/tx_sequence_item.sv"
	`include "../TenGEthernetMac/rx_sequence_item.sv"
	`include "../TenGEthernetMac/reset_sequence.sv"
	`include "../TenGEthernetMac/wb_sequence.sv"
	`include "../TenGEthernetMac/tx_sequence.sv"
	`include "../TenGEthernetMac/rx_sequence.sv"
	`include "../TenGEthernetMac/reset_driver.sv"
	`include "../TenGEthernetMac/wb_driver.sv"
	`include "../TenGEthernetMac/tx_driver.sv"
	`include "../TenGEthernetMac/rx_driver.sv"
	`include "../TenGEthernetMac/reset_agent.sv"
	`include "../TenGEthernetMac/wb_agent.sv"
	`include "../TenGEthernetMac/tx_agent.sv"
	`include "../TenGEthernetMac/rx_agent.sv"
	`include "../TenGEthernetMac/rx_monitor.sv"
	`include "../TenGEthernetMac/tx_monitor.sv"
	`include "../TenGEthernetMac/environment.sv"
	
class test_base extends uvm_test;
        environment    envil;
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
     endfunction

     virtual task main_phase(input uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        //this part needs to be done
            //seq.start
        phase.drop_objection(this);

     endtask
     
     virtual task run_phase(input uvm_phase phase);
        `uvm_info("test_base", "Hello .. I am doing my first UVM INFO", UVM_HIGH)
        seq=user_sequence::type_id::create("seq",this);
        `uvm_info("test_base",$sformat("%m"), UVM_HIGH)
     endtask
endclass //test_base
`endif 