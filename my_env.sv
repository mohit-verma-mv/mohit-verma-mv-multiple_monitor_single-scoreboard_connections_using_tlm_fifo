class my_env extends uvm_env;
  
  `uvm_component_utils(my_env)
  
  monitor1 mon1;
  monitor2 mon2;
  monitor3 mon3;
  scoreboard a_scb;
  
  function new(string name = "my_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon1 = monitor1::type_id::create("mon1",this);
    mon2 = monitor2::type_id::create("mon2",this);
    mon3 = monitor3::type_id::create("mon3",this);
    a_scb = scoreboard::type_id::create("a_scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon1.mon1_ap.connect(a_scb.mon1_export);
    mon2.mon2_ap.connect(a_scb.mon2_export);
    mon3.mon3_ap.connect(a_scb.mon3_export);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

endclass