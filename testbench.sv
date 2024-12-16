`include "uvm_macros.svh"
import uvm_pkg::*;

`include "monitor1.sv"
`include "monitor2.sv"
`include "monitor3.sv"
`include "scoreboard.sv"
`include "my_env.sv"
`include "my_test.sv"

module top;
  
  initial 
    begin
      run_test("my_test");
    end
  
endmodule