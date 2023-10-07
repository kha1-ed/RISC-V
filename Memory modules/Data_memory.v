module data_memory (
    input clk, reset, 
    input [31:0] WD,        // Write Data
    input [31:0] A,         // Address
    input WE,                // Write Enable
    output reg [31:0] RD    // Read Data
    );
    
    reg [31:0] memory [0:2**32-1];
    integer i;
    always@(posedge clk, negedge reset) begin
        if(!reset) begin
         for(i = 0; i < 2**32-1 ; i = i+ 1)begin
         memory[i] <= 0;
         
         end
         
        end
        
        else if(WE)
            memory[A] <= WD ;    // Write data at the specified address on rising edge of clock
    end
     
    always@(*)
      begin
        RD = memory[A];       // Read data from the specified address
      end   
                       
endmodule
