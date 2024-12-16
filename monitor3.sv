class monitor3 extends uvm_monitor;
  
  `uvm_component_utils(monitor3)
  
  uvm_analysis_port #(int) mon3_ap;
  
  int count3;
  
  function new(string name = "monitor3", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon3_ap = new("mon3_ap",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    count3 = 300;
    #1;
    mon3_ap.write(count3);
  endtask

endclass