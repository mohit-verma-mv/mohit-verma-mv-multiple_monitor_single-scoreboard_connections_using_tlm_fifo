class monitor1 extends uvm_monitor;
  
  `uvm_component_utils(monitor1)
  
  uvm_analysis_port #(int) mon1_ap;
  
  int count1;
  
  function new(string name = "monitor1", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon1_ap = new("mon1_ap",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    count1 = 100;
    #1;
    mon1_ap.write(count1);
  endtask 

endclass