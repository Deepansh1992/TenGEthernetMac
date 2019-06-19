`ifndef TESTCASE__SV
`define TESTCASE__SV



program testcase();


  import uvm_pkg::*;

  `include "testclass.sv"

  initial begin
    $display("********************************************************before runtest"); 

        run_test("");

    $display("*********************************************************after run test"); 

  end

endprogram : testcase

`endif

