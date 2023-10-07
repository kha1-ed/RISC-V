module Main_Decoder #(parameter n=32)(
    input zero,
    input  [6:0] op,    
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg ResultSrc,
    output PCSrc,
    output reg [1:0] AluOp  
);
    
    
    reg Branch ;
    assign PCSrc = Branch & zero ;

    always @(*) begin
        // Default values
        RegWrite = 1'b0;
        ImmSrc = 2'b00;
        ALUSrc = 1'b1;
        MemWrite = 1'b0;
        ResultSrc = 1'b1;
        AluOp = 2'b00;
        Branch = 1'b0;

        // Determine control signals based on instruction fields
        
        case(op)
            7'b0000011: begin     // lw
                RegWrite  = 1'b1 ;
                ImmSrc    = 2'b00 ;
                ALUSrc    = 1'b1 ;
                MemWrite  = 1'b0 ;
                ResultSrc = 1'b1 ;
                Branch    = 1'b0 ;
                AluOp     = 2'b00 ;
                end
                
            7'b0100011: begin     // sw
                RegWrite  = 1'b0 ;
                ImmSrc    = 2'b01 ;
                ALUSrc    = 1'b1 ;
                MemWrite  = 1'b1 ;
                ResultSrc = 1'b1 ;
                Branch    = 1'b0 ;
                AluOp     = 2'b00 ;
                end
                
            7'b0110011: begin    // R-type (or) 
                RegWrite  = 1'b1 ;
                ImmSrc    = 2'b10 ;
                ALUSrc    = 1'b0 ;
                MemWrite  = 1'b0 ;
                ResultSrc = 1'b0 ;
                Branch    = 1'b0 ;
                AluOp     = 2'b10 ;
                end
                
            7'b1100011: begin   // beq
                RegWrite  = 1'b0 ;
                ImmSrc    = 2'b10 ;
                ALUSrc    = 1'b0 ;
                MemWrite  = 1'b0 ;
                ResultSrc = 1'b0 ;
                Branch    = 1'b1 ;              
                AluOp     = 2'b01 ;
                end 
            default: begin
                 RegWrite  = 1'b1 ;
                 ImmSrc    = 2'b00 ;
                 ALUSrc    = 1'b1 ;
                 MemWrite  = 1'b0 ;
                 ResultSrc = 1'b1 ;
                 Branch    = 1'b0 ;
                 AluOp     = 2'b00 ;
                 end
        endcase
    end
    
   
    
endmodule
