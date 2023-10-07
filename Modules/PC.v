module PC_counter(
    input  clk,
    input  reset_n,
    input  [31:0] PCNext,
    output reg [31:0] PC
    );
        
    always @(posedge clk, negedge reset_n) begin 
          // PC <= 32'b0 ; 
        if (~reset_n)
            PC <= 'h0 ;
        else
            PC <= PCNext ;
    end
    
endmodule
