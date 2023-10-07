module instruction_memory #(parameter n = 32)(
    input [31:0] A,         
    output reg [31:0] RD    
);

    reg [31:0] memory [0 : 2**n - 1];  // Instruction memory array
    
    initial 
    begin
    memory[0] = 'hFFC4A303 ;
    memory[1] = 'h0064A423 ;
    memory[2] = 'h0062E233 ;
    memory[3] = 'hFE420AE3 ;
    memory[4] = 'h00100193 ;
    end
    
    always @(*) begin
        case(A)
           'h1000: memory[A] = 'hFFC4A303 ;
           'h1004: memory[A] = 'h0064A423 ;
           'h1008: memory[A] = 'h0062E233 ;
           'h10c : memory[A] = 'hFE420AE3 ;
        endcase 
    end
    always@(*)begin
        RD = memory[A];
    end
    
endmodule
