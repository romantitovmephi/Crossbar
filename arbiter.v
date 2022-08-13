module arbiter (
	clk,    
	reset,    
	req3,
	req2,
	req1,
	req0,   
	gnt3,   
	gnt2,   
	gnt1,   
	gnt0
	);

	input  clk;    
	input  reset;    
	input  req3;            // REQUEST SIGNALS 
	input  req2;   
	input  req1;                          
	input  req0;   
	output gnt3;            // GRANT SIGNALS 
	output gnt2;   
	output gnt1;   
	output gnt0;
 
	wire beg       ;        // BEGIN SIGNAL
        wire comreq    ;        // COMMUNICATION REQUEST SIGNAL 
	wire [1:0] gnt ;        // ENCODED GRANT 
	reg  lgnt0     ;        // LATCHED GRANTS 
	reg  lgnt1     ;
	reg  lgnt2     ;
	reg  lgnt3     ;
	reg  enmask    ;        // ENABLE MASK 
	reg  mask0     ;        // MASK0/MASK1 ARE TWO-BIT ENCODED GRANTS 
	reg  mask1     ;  
	
	always @ (posedge clk)
	if (reset) begin         
	  lgnt0 <= 0;
	  lgnt1 <= 0;
	  lgnt2 <= 0;
	  lgnt3 <= 0;
	end 
        else 
          begin 

       // ARBITRATION LOGIC. GRANT SIGNALS DATAFLOW MODELLING
       lgnt0 <= (~comreq & ~mask1 & ~mask0 & ~req3 & ~req2 & ~req1 & req0)     
              | (~comreq & ~mask1 &  mask0 & ~req3 & ~req2 &  req0)             
              | (~comreq &  mask1 & ~mask0 & ~req3 &  req0)                     
              | (~comreq &  mask1 &  mask0 & req0)                              
              | ( comreq &  lgnt0);
      
       lgnt1 <= (~comreq & ~mask1 & ~mask0 &  req1)
              | (~comreq & ~mask1 &  mask0 & ~req3 & ~req2 &  req1 & ~req0)
              | (~comreq &  mask1 & ~mask0 & ~req3 &  req1 & ~req0)
              | (~comreq &  mask1 &  mask0 &  req1 & ~req0)
              | ( comreq &  lgnt1);
      
       lgnt2 <= (~comreq & ~mask1 & ~mask0 &  req2 & ~req1)
              | (~comreq & ~mask1 &  mask0 &  req2)
              | (~comreq &  mask1 & ~mask0 & ~req3 &  req2 & ~req1 & ~req0)
              | (~comreq &  mask1 &  mask0 &  req2 & ~req1 & ~req0)
              | ( comreq &  lgnt2);
      
       lgnt3 <= (~comreq & ~mask1 & ~mask0 & req3  & ~req2 & ~req1)
              | (~comreq & ~mask1 &  mask0 & req3  & ~req2)
              | (~comreq &  mask1 & ~mask0 & req3)
              | (~comreq &  mask1 &  mask0 & req3  & ~req2 & ~req1 & ~req0)
              | ( comreq &  lgnt3);

	  end 

	// BEGIN INPUT LOGIC 
	assign beg = (req3 | req2 | req1 | req0) & ~comreq;  
     
        // NEW MASK VALUE
	always @ (posedge clk) begin                                                                       
        enmask <= (beg & ~enmask);                            
	end 

	// COMREQ LOGIC (BUS STATUS) 0 - FREE, 1 - BUSY
	assign comreq = (req3 & lgnt3)
		      | (req2 & lgnt2)
		      | (req1 & lgnt1)
		      | (req0 & lgnt0);

	// ENCODER LOGIC. INDICATES WHICH MASTER HAS BEEN GRANTED THE BUS
	assign gnt = {(lgnt3 | lgnt2),(lgnt3 | lgnt1)};

	// MASK REGISTER
	always @ (posedge clk) begin
	  if(reset) begin
	    mask1 <= 0;
	    mask0 <= 0;
	  end else if (enmask) begin  
	    mask1 <= gnt[1];         
	    mask0 <= gnt[0];
	  end else begin
	    mask1 <= mask1;
	    mask0 <= mask0;
	  end 
        end

	assign gnt3 = lgnt3;   
	assign gnt2 = lgnt2;
	assign gnt1 = lgnt1;
	assign gnt0 = lgnt0;

endmodule
