module Register_file(
      input clk, reset,
      input [4:0] A1, A2,            // Read ports 1 and 2 address
      input [4:0] A3,                // Write address
      input [31:0] WD3,              // Write data
      input WE3,                     // Write enable for port 3
      output reg [31:0] RD1, RD2     // Read data 1 and 2
      );

      reg [31:0] register [0:(2**5)-1];   // Array to hold registers
      integer k ; 
   
      always @(posedge clk, negedge reset) begin
        if(!reset) begin
           for(k=0; k < 2**5 - 1 ; k = k + 1)
           register[k] <= 0 ;   
        end
        
        else if (WE3) 
          register[A3] <= WD3;            // Write operation on rising edge of clock
      end
      
      always @(*) begin
          RD1 <= register[A1];         // Read date
          RD2 <= register[A2];
      end

endmodule
