`timescale 1ns / 1ps

module crossbar_testbench();
	reg clk;
	reg reset;
	
	// MASTERS
	reg  master_0_req; 
	reg  master_0_cmd;
	wire master_0_ack;
	wire master_0_resp;
	wire [31:0] master_0_rdata;
	reg  [31:0] master_0_wdata;
	reg  [31:0] master_0_addr;
	
	reg  master_1_req;
	reg  master_1_cmd;
	wire master_1_ack;
	wire master_1_resp;
	wire [31:0] master_1_rdata;
	reg  [31:0] master_1_wdata;
	reg  [31:0] master_1_addr;
	
	reg  master_2_req;
	reg  master_2_cmd;
	wire master_2_ack;
	wire master_2_resp;
	wire [31:0] master_2_rdata;
	reg  [31:0] master_2_wdata;
	reg  [31:0] master_2_addr;
	
	reg  master_3_req;
	reg  master_3_cmd;
	wire master_3_ack;
	wire master_3_resp;
	wire [31:0] master_3_rdata;
	reg  [31:0] master_3_wdata;
	reg  [31:0] master_3_addr;
	
	// SLAVES
	wire slave_0_req;
	wire slave_0_ack;
	wire slave_0_cmd;
	wire slave_0_resp;
	wire [31:0] slave_0_wdata;
	wire [31:0] slave_0_rdata;
	wire [31:0] slave_0_addr;
	
	wire slave_1_req;
	wire slave_1_ack;
	wire slave_1_cmd;
	wire slave_1_resp;
	wire [31:0] slave_1_wdata;
	wire [31:0] slave_1_rdata;
	wire [31:0] slave_1_addr;
	
	wire slave_2_req;
	wire slave_2_ack;
	wire slave_2_cmd;
	wire slave_2_resp;
	wire [31:0] slave_2_wdata;
	wire [31:0] slave_2_rdata;
	wire [31:0] slave_2_addr;
	
	wire slave_3_req;
	wire slave_3_ack;
	wire slave_3_cmd;
	wire slave_3_resp;
	wire [31:0] slave_3_wdata;
	wire [31:0] slave_3_rdata;
	wire [31:0] slave_3_addr;
	                            
	crossbar dut (
		.clk(clk),
		.reset(reset),
		
		.master_0_req(master_0_req),
		.master_0_cmd(master_0_cmd),
		.master_0_ack(master_0_ack),
		.master_0_resp(master_0_resp),
		.master_0_addr(master_0_addr),
		.master_0_wdata(master_0_wdata),
		.master_0_rdata(master_0_rdata),
		
		.master_1_req(master_1_req),
		.master_1_cmd(master_1_cmd),
		.master_1_ack(master_1_ack),
		.master_1_resp(master_1_resp),
		.master_1_addr(master_1_addr),
		.master_1_wdata(master_1_wdata),
		.master_1_rdata(master_1_rdata),
		
		.master_2_req(master_2_req),
		.master_2_cmd(master_2_cmd),
		.master_2_ack(master_2_ack),
		.master_2_resp(master_2_resp),
		.master_2_addr(master_2_addr),
		.master_2_wdata(master_2_wdata),
		.master_2_rdata(master_2_rdata),
		
		.master_3_req(master_3_req),
		.master_3_cmd(master_3_cmd),
		.master_3_ack(master_3_ack),
		.master_3_resp(master_3_resp),
		.master_3_addr(master_3_addr),
		.master_3_wdata(master_3_wdata),
		.master_3_rdata(master_3_rdata),
		
		.slave_0_req(slave_0_req),
		.slave_0_ack(slave_0_ack),
		.slave_0_cmd(slave_0_cmd),
		.slave_0_resp(slave_0_resp),
		.slave_0_rdata(slave_0_rdata),
		.slave_0_wdata(slave_0_wdata),
		.slave_0_addr(slave_0_addr),
		
		.slave_1_req(slave_1_req),
		.slave_1_ack(slave_1_ack),
		.slave_1_cmd(slave_1_cmd),
		.slave_1_resp(slave_1_resp),
		.slave_1_rdata(slave_1_rdata),
		.slave_1_wdata(slave_1_wdata),
		.slave_1_addr(slave_1_addr),
		
		.slave_2_req(slave_2_req),
		.slave_2_ack(slave_2_ack),
		.slave_2_cmd(slave_2_cmd),
		.slave_2_resp(slave_2_resp),
		.slave_2_rdata(slave_2_rdata),
		.slave_2_wdata(slave_2_wdata),
		.slave_2_addr(slave_2_addr),
		
		.slave_3_req(slave_3_req),
		.slave_3_ack(slave_3_ack),
		.slave_3_cmd(slave_3_cmd),
		.slave_3_resp(slave_3_resp),
		.slave_3_rdata(slave_3_rdata),
		.slave_3_wdata(slave_3_wdata),
		.slave_3_addr(slave_3_addr)
	);

	// INSTANTIATION SLAVES
	slave slave_0 (
		.clk(clk),
		.reset(reset),
		.req(slave_0_req),
		.cmd(slave_0_cmd),
		.ack(slave_0_ack),
		.resp(slave_0_resp),
		.addr(slave_0_addr),
		.wdata(slave_0_wdata),
		.rdata(slave_0_rdata)
	);
	
	slave slave_1 (
		.clk(clk),
		.reset(reset),
		.req(slave_1_req),
		.cmd(slave_1_cmd),
		.ack(slave_1_ack),
		.resp(slave_1_resp),
		.addr(slave_1_addr),
		.wdata(slave_1_wdata),
		.rdata(slave_1_rdata)
	);
	
	slave slave_2 (
		.clk(clk),
		.reset(reset),
		.req(slave_2_req),
		.cmd(slave_2_cmd),
		.ack(slave_2_ack),
		.resp(slave_2_resp),
		.addr(slave_2_addr),
		.wdata(slave_2_wdata),
		.rdata(slave_2_rdata)
	);
	
	slave slave_3 (
		.clk(clk),
		.reset(reset),
		.req(slave_3_req),
		.cmd(slave_3_cmd),
		.ack(slave_3_ack),
		.resp(slave_3_resp),
		.addr(slave_3_addr),
		.wdata(slave_3_wdata),
		.rdata(slave_3_rdata)
	);
	
	initial begin                                                  
		// CODE THAT EXECUTES ONLY ONCE
		clk = 1;
		master_0_req = 0;
		master_1_req = 0;
		master_2_req = 0;
		master_3_req = 0;
		master_0_cmd = 0;
		master_1_cmd = 0;
		master_2_cmd = 0;
		master_3_cmd = 0;
		master_0_wdata = 0;
		master_1_wdata = 0;
		master_2_wdata = 0;
		master_3_wdata = 0;
		master_0_addr = 0;
		master_1_addr = 0;
		master_2_addr = 0;
		master_3_addr = 0;
			
		reset = 1;
		repeat(1)
			@(posedge clk);
		reset = 0;
	end

	// GENERATE CLK
		always begin
			#5; 
			clk = ~clk;
		end  

 initial
	 begin
	@(negedge reset);
  crossbar_transaction(1,0,32'hABCD_0001, 32'hABCD_0001); // M0 WRITE
  crossbar_transaction(1,1,32'hABCD_0002, 32'hABCD_0002); // M1 WRITE
  crossbar_transaction(1,2,32'hABCD_0003, 32'hABCD_0003); // M2 WRITE
  crossbar_transaction(1,3,32'hABCD_0004, 32'hABCD_0004); // M3 WRITE
  repeat(5)
			@(posedge clk);
  crossbar_transaction(0,0,32'hABCD_0001, 0); // M0 READ
  crossbar_transaction(0,1,32'hABCD_0002, 0); // M1 READ
  crossbar_transaction(0,2,32'hABCD_0003, 0); // M2 READ
  crossbar_transaction(0,3,32'hABCD_0004, 0); // M3 READ
    repeat(5)
		  	@(posedge clk);
  fork 
		crossbar_transaction(1,0,32'hABCD_0101, 32'hABCD_0001); // M0 WRITE
		crossbar_transaction(1,1,32'hABCD_0101, 32'hABCD_0002); // M1 WRITE
		crossbar_transaction(1,2,32'hABCD_0101, 32'hABCD_0003); // M2 WRITE
		crossbar_transaction(1,3,32'hABCD_0101, 32'hABCD_0004); // M3 WRITE
  join 	
  repeat(5)
			@(posedge clk);
  fork 
	crossbar_transaction(0,0,32'hABCD_0101, 0); // M0 READ
  crossbar_transaction(0,1,32'hABCD_0101, 0); // M1 READ
  crossbar_transaction(0,2,32'hABCD_0101, 0); // M2 READ
  crossbar_transaction(0,3,32'hABCD_0101, 0); // M3 READ
  join 
  repeat(5)
			@(posedge clk);
  fork 
  crossbar_transaction(1,0,32'h4BCD_0001, 32'hABCD_0001); // M0 WRITE
  crossbar_transaction(1,2,32'h4BCD_0001, 32'hABCD_0002); // M2 WRITE
  join 
  repeat(5)
			@(posedge clk);
  fork 
  crossbar_transaction(1,2,32'h4BCD_0001, 32'hABCD_0001); // M2 WRITE
  crossbar_transaction(1,1,32'h4BCD_0001, 32'hABCD_0002); // M1 WRITE
  join 
  repeat(5)
			@(posedge clk);
  fork 
  crossbar_transaction(1,0,32'h4BCD_0001, 32'hABCD_0003); // M0 WRITE
  crossbar_transaction(1,2,32'h4BCD_0001, 32'hABCD_0001); // M2 WRITE
  crossbar_transaction(1,3,32'h4BCD_0001, 32'hABCD_0000); // M3 WRITE
  join 
end

task automatic crossbar_transaction;  
	input cmd;
	input [1:0] channel_num;
	input [31:0] addr, wdata;
begin
	@(posedge clk);
	case(channel_num)
		0:begin
				master_0_req = 1;
				master_0_cmd = cmd;
				master_0_addr = addr;
				master_0_wdata = wdata;
				while(!master_0_ack)
					@(posedge clk);
				master_0_req = 0;
				if(!cmd)
					while(!master_0_resp)
						@(posedge clk);
		end
		1:begin
				master_1_req = 1;
				master_1_cmd = cmd;
				master_1_addr = addr;
				master_1_wdata = wdata;
				while(!master_1_ack)
					@(posedge clk);
				master_1_req = 0;
				if(!cmd)
					while(!master_1_resp)
						@(posedge clk);
		end
		2:begin
				master_2_req = 1;
				master_2_cmd = cmd;
				master_2_addr = addr;
				master_2_wdata = wdata;
				while(!master_2_ack)
					@(posedge clk);
				master_2_req = 0;
				if(!cmd)
					while(!master_2_resp)
						@(posedge clk);
		end
		3:begin
				master_3_req = 1;
				master_3_cmd = cmd;
				master_3_addr = addr;
				master_3_wdata = wdata;
				while(!master_3_ack)
					@(posedge clk);
				master_3_req = 0;
				if(!cmd)
					while(!master_3_resp)
						@(posedge clk);
		 end
	endcase
end
endtask

endmodule

// SLAVE RESPONSE EMULATION MODULE
module slave (
	input clk,
	input reset,
	output reg ack,     
	input req,
	input cmd,			                 // 0 - READ, 1 - WRITE
	output reg resp,
	input [31:0] addr,
	input [31:0] wdata,
	output reg [31:0] rdata
	);
	
	reg [31:0] mem [1023:0];
	
	always @(posedge clk) begin
    if (reset) 
    begin
      ack <= 0;
    end 
    else if (req) 
     begin
      ack <= 1;
     end 
     else 
      begin
        ack <= 0;
      end
   begin
     if (ack)
      ack <= 0;
   end
end

	always @(posedge clk) begin
		if (reset)
		begin
			resp <= 0;
			rdata <= 0;
		end
		else if (req && ack)
		begin
			if (cmd)
				mem[addr & 'h000003ff] <= wdata;
			else
			begin
				resp <= 1;
				rdata <= mem[addr & 'h000003ff];
			end
		end
		if (resp)
			resp <= 0;
	end

endmodule