
/*******************************************************************************
 *
 * Author:      AsicZen
 * File:        azAxi_master_env.sv
 * Revision:    1.0.0
 * Date:        15th July, 2014
 *
 *******************************************************************************
 */
`ifndef AZAXI_MASTER_ENV_SV
`define AZAXI_MASTER_ENV_SV

class azAxi_master_env extends uvm_env;


  // This field controls how many  agents are instantiated in this env 	
  bit [7:0] master_num_agents;

  // This is an array of the  agents in this env
  azAxi_master_agent agents[];

  `uvm_component_utils_begin(azAxi_master_env)
    `uvm_field_int(master_num_agents, UVM_ALL_ON)
  `uvm_component_utils_end


   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction : new
     
   function void build();
     string inst_name;
     super.build();
     agents = new[master_num_agents];
     for(int i = 0; i < master_num_agents; i++) begin
      $sformat(inst_name, "agents[%0d]", i); 
       agents[i] = azAxi_master_agent::type_id::create(inst_name,this);
	   agents[i].agent_num = i;
     end	 
   endfunction : build
   
   task run();
   endtask : run

endclass : azAxi_master_env

`endif // AZAXI_MASTER_ENV_SV

