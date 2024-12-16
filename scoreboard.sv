class scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_export #(int) mon1_export;
  uvm_analysis_export #(int) mon2_export;
  uvm_analysis_export #(int) mon3_export;
  
  uvm_tlm_analysis_fifo #(int) mon1_fifo;
  uvm_tlm_analysis_fifo #(int) mon2_fifo;
  uvm_tlm_analysis_fifo #(int) mon3_fifo;
  
  int t_count1,t_count2,t_count3;
  
  function new(string name = "scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon1_export = new("mon1_export",this);
    mon2_export = new("mon2_export",this);
    mon3_export = new("mon3_export",this);
    
    mon1_fifo = new("mon1_fifo",this);
    mon2_fifo = new("mon2_fifo",this);
    mon3_fifo = new("mon3_fifo",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon1_export.connect(mon1_fifo.analysis_export);
    mon2_export.connect(mon2_fifo.analysis_export);
    mon3_export.connect(mon3_fifo.analysis_export);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        mon1_fifo.get(t_count1);
        `uvm_info(get_type_name(),$sformatf("From MON1 t_count1 = %0d",t_count1),UVM_NONE)
        #1;
        mon2_fifo.get(t_count2);
        `uvm_info(get_type_name(),$sformatf("From MON2 t_count2 = %0d",t_count2),UVM_NONE)
        #1;
        mon3_fifo.get(t_count3);
        `uvm_info(get_type_name(),$sformatf("From MON3 t_count3 = %0d",t_count3),UVM_NONE)
      end
  endtask

endclass