class monitor2 extends uvm_monitor;
  
  `uvm_component_utils(monitor2)
  
  uvm_analysis_port #(int) mon2_ap;
  
  int count2;
  
  function new(string name = "monitor2", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon2_ap = new("mon2_ap",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    count2 = 200;
    #1;
    mon2_ap.write(count2);
  endtask

endclass