module crossbar (
	input clk,                                       // CLOCK
	input reset,                                     // RESET
	
	// MASTERS
	input  master_0_req,				 // REQUEST OF TRANSACTION
	output master_0_ack,                             // ACKNOWLEDGMENT OF TRANSACTION
	input  master_0_cmd,				 // 0 - READ, 1 - WRITE (MASTER -> SLAVE)
	output master_0_resp,                            // RDATA AVAILABLE SIGNAL
	input  [31:0] master_0_addr,                     // ADDRESS
	input  [31:0] master_0_wdata,                    // DATA TO WRITE
	output [31:0] master_0_rdata,                    // DATA READED
	
	input  master_1_req,				
	output master_1_ack,
	input  master_1_cmd,				
	output master_1_resp,
	input  [31:0] master_1_addr,
	input  [31:0] master_1_wdata,
	output [31:0] master_1_rdata,
	
	input  master_2_req,
	output master_2_ack,
	input  master_2_cmd,
	output master_2_resp,
	input  [31:0] master_2_addr,
	input  [31:0] master_2_wdata,
	output [31:0] master_2_rdata,
	
	input  master_3_req,
	output master_3_ack,
	input  master_3_cmd,
	output master_3_resp,
	input  [31:0] master_3_addr,
	input  [31:0] master_3_wdata,
	output [31:0] master_3_rdata,
	
	// SLAVES
	output slave_0_req,
	input  slave_0_ack,
	output slave_0_cmd,
	input  slave_0_resp,
	input  [31:0] slave_0_rdata,
	output [31:0] slave_0_wdata,
	output [31:0] slave_0_addr,
	
	output slave_1_req,
	input  slave_1_ack,
	output slave_1_cmd,
	input  slave_1_resp,
	input  [31:0] slave_1_rdata,
	output [31:0] slave_1_wdata,
	output [31:0] slave_1_addr,
	
	output slave_2_req,
	input  slave_2_ack,
	output slave_2_cmd,
	input  slave_2_resp,
	input  [31:0] slave_2_rdata,
	output [31:0] slave_2_wdata,
	output [31:0] slave_2_addr,
	
	output slave_3_req,
	input  slave_3_ack,
	output slave_3_cmd,
	input  slave_3_resp,
	input  [31:0] slave_3_rdata,
	output [31:0] slave_3_wdata,
	output [31:0] slave_3_addr
	);

        // VECTORS
	wire [3:0] slave_resp = {slave_3_resp, slave_2_resp, slave_1_resp, slave_0_resp}; 
	wire [3:0] slave_ack = {slave_3_ack, slave_2_ack, slave_1_ack, slave_0_ack};
	wire [3:0] master;

        // FOR REMEMBERING MASTER WHILE RESP WAITING
	reg  [3:0] master_read;	 

	// ARBITERS
	arbiter arb(
		.clk(clk),
		.reset(reset),
		
		.req0(master_0_req),
		.req1(master_1_req),
		.req2(master_2_req),
		.req3(master_3_req),
		
		.gnt0(master[0]),
		.gnt1(master[1]),
		.gnt2(master[2]),
		.gnt3(master[3])
	);   
	
        // MASTERS LOGIC
	always @(posedge clk) begin
		if (reset)
			master_read <= 0;  
		else if (slave_resp)
			master_read <= 0;
		else if (master)
			master_read <= (master[0] && !master_0_cmd) ? 4'b0001 :
				       (master[1] && !master_1_cmd) ? 4'b0010 :
				       (master[2] && !master_2_cmd) ? 4'b0100 : 
				       (master[3] && !master_3_cmd) ? 4'b1000 : 4'b0000;
	end    

	assign master_0_rdata = (master_0_resp) ?
				   slave_0_resp ? slave_0_rdata:
				   slave_1_resp ? slave_1_rdata:
				   slave_2_resp ? slave_2_rdata:
				   slave_3_resp ? slave_3_rdata: 0 : 0;
	assign master_1_rdata = (master_1_resp) ?
			           slave_0_resp ? slave_0_rdata:
				   slave_1_resp ? slave_1_rdata:
				   slave_2_resp ? slave_2_rdata:
				   slave_3_resp ? slave_3_rdata: 0 : 0;
	assign master_2_rdata = (master_2_resp) ?
				   slave_0_resp ? slave_0_rdata:
				   slave_1_resp ? slave_1_rdata:
			           slave_2_resp ? slave_2_rdata:
				   slave_3_resp ? slave_3_rdata: 0 : 0;
	assign master_3_rdata = (master_3_resp) ?
				   slave_0_resp ? slave_0_rdata:
				   slave_1_resp ? slave_1_rdata:
				   slave_2_resp ? slave_2_rdata:
				   slave_3_resp ? slave_3_rdata: 0 : 0;

	assign master_0_resp = (master_read == 4'b0001 && slave_resp) ? 1'b1 : 1'b0;  
	assign master_1_resp = (master_read == 4'b0010 && slave_resp) ? 1'b1 : 1'b0;
	assign master_2_resp = (master_read == 4'b0100 && slave_resp) ? 1'b1 : 1'b0;
	assign master_3_resp = (master_read == 4'b1000 && slave_resp) ? 1'b1 : 1'b0; 

	assign master_0_ack = (master == 4'b0001 && slave_ack) ? 1'b1 : 1'b0;     
	assign master_1_ack = (master == 4'b0010 && slave_ack) ? 1'b1 : 1'b0;
	assign master_2_ack = (master == 4'b0100 && slave_ack) ? 1'b1 : 1'b0;
	assign master_3_ack = (master == 4'b1000 && slave_ack) ? 1'b1 : 1'b0;  

	// SLAVES LOGIC
	assign slave_0_addr = (slave_0_req) ?
		        (master == 4'b0001) ? master_0_addr:
			(master == 4'b0010) ? master_1_addr:
			(master == 4'b0100) ? master_2_addr:
			(master == 4'b1000) ? master_3_addr: 0 : 0;
	assign slave_1_addr = (slave_1_req) ?
		        (master == 4'b0001) ? master_0_addr:
		        (master == 4'b0010) ? master_1_addr:
		        (master == 4'b0100) ? master_2_addr:
		        (master == 4'b1000) ? master_3_addr: 0 : 0;
	assign slave_2_addr = (slave_2_req) ?
		        (master == 4'b0001) ? master_0_addr:
		        (master == 4'b0010) ? master_1_addr:
			(master == 4'b0100) ? master_2_addr:
			(master == 4'b1000) ? master_3_addr: 0 : 0;
	assign slave_3_addr = (slave_3_req) ?
		        (master == 4'b0001) ? master_0_addr:
		        (master == 4'b0010) ? master_1_addr:
		        (master == 4'b0100) ? master_2_addr:
		        (master == 4'b1000) ? master_3_addr: 0 : 0;

	assign slave_0_cmd = (slave_0_req) ?
		       (master == 4'b0001) ? master_0_cmd:
		       (master == 4'b0010) ? master_1_cmd:
		       (master == 4'b0100) ? master_2_cmd:
		       (master == 4'b1000) ? master_3_cmd: 1'b0 : 1'b0;
	assign slave_1_cmd = (slave_1_req) ?
		       (master == 4'b0001) ? master_0_cmd:
		       (master == 4'b0010) ? master_1_cmd:
		       (master == 4'b0100) ? master_2_cmd:
		       (master == 4'b1000) ? master_3_cmd: 1'b0 : 1'b0;
	assign slave_2_cmd = (slave_2_req) ?
		       (master == 4'b0001) ? master_0_cmd:
		       (master == 4'b0010) ? master_1_cmd:
		       (master == 4'b0100) ? master_2_cmd:
		       (master == 4'b1000) ? master_3_cmd: 1'b0 : 1'b0;
	assign slave_3_cmd = (slave_3_req) ?
		       (master == 4'b0001) ? master_0_cmd:
		       (master == 4'b0010) ? master_1_cmd:
		       (master == 4'b0100) ? master_2_cmd:
		       (master == 4'b1000) ? master_3_cmd: 1'b0 : 1'b0;


	assign slave_0_wdata = (slave_0_req) ?
		         (master == 4'b0001) ? master_0_wdata:
		         (master == 4'b0010) ? master_1_wdata:
			 (master == 4'b0100) ? master_2_wdata:
			 (master == 4'b1000) ? master_3_wdata: 0 : 0;
	assign slave_1_wdata = (slave_1_req) ?
			 (master == 4'b0001) ? master_0_wdata:
			 (master == 4'b0010) ? master_1_wdata:
		         (master == 4'b0100) ? master_2_wdata:
		         (master == 4'b1000) ? master_3_wdata: 0 : 0;
	assign slave_2_wdata = (slave_2_req) ?
			 (master == 4'b0001) ? master_0_wdata:
		         (master == 4'b0010) ? master_1_wdata:
			 (master == 4'b0100) ? master_2_wdata:
			 (master == 4'b1000) ? master_3_wdata: 0 : 0;
	assign slave_3_wdata = (slave_3_req) ?
			 (master == 4'b0001) ? master_0_wdata:
			 (master == 4'b0010) ? master_1_wdata:
			 (master == 4'b0100) ? master_2_wdata:
			 (master == 4'b1000) ? master_3_wdata: 0 : 0;

        // DELAY SLAVE ACK TO RESET SLAVE REQ
        reg slave_0_ack_delayed;
        reg slave_1_ack_delayed;
        reg slave_2_ack_delayed;
        reg slave_3_ack_delayed;

        always @(posedge clk) begin
        slave_0_ack_delayed <= slave_0_ack;
        slave_1_ack_delayed <= slave_1_ack;
        slave_2_ack_delayed <= slave_2_ack;
        slave_3_ack_delayed <= slave_3_ack;
        end

        assign slave_0_req = (((master == 4'b0001 && master_0_addr[31:30] == 2'b00) ||
			       (master == 4'b0010 && master_1_addr[31:30] == 2'b00) ||
			       (master == 4'b0100 && master_2_addr[31:30] == 2'b00) ||
			       (master == 4'b1000 && master_3_addr[31:30] == 2'b00)) && ~slave_0_ack_delayed) ? 1'b1 : 1'b0;
        assign slave_1_req = (((master == 4'b0001 && master_0_addr[31:30] == 2'b01) ||
			       (master == 4'b0010 && master_1_addr[31:30] == 2'b01) ||
			       (master == 4'b0100 && master_2_addr[31:30] == 2'b01) ||
			       (master == 4'b1000 && master_3_addr[31:30] == 2'b01)) && ~slave_1_ack_delayed) ? 1'b1 : 1'b0;
        assign slave_2_req = (((master == 4'b0001 && master_0_addr[31:30] == 2'b10) ||
			       (master == 4'b0010 && master_1_addr[31:30] == 2'b10) ||
			       (master == 4'b0100 && master_2_addr[31:30] == 2'b10) ||
			       (master == 4'b1000 && master_3_addr[31:30] == 2'b10)) && ~slave_2_ack_delayed) ? 1'b1 : 1'b0;
        assign slave_3_req = (((master == 4'b0001 && master_0_addr[31:30] == 2'b11) ||
			       (master == 4'b0010 && master_1_addr[31:30] == 2'b11) ||
			       (master == 4'b0100 && master_2_addr[31:30] == 2'b11) ||
			       (master == 4'b1000 && master_3_addr[31:30] == 2'b11)) && ~slave_3_ack_delayed) ? 1'b1 : 1'b0;


endmodule
