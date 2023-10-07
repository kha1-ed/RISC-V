module MainDecoder2(
    input zero,
    input  [6:0] op,    
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg [1:0] ResultSrc,
    output PCSrc,
    output reg [1:0] ALUOp
    );
    
    reg Jump, Branch ;
    assign PCSrc = (zero & Branch) | Jump ;
    always @(*) begin 
        casex(op)
                7'b0000011: begin     // lw
                    RegWrite  = 1'b1 ;
                    ImmSrc    = 2'b00 ;
                    ALUSrc    = 1'b1 ;
                    MemWrite  = 1'b0 ;
                    ResultSrc = 2'b01 ;
                    Branch    = 1'b0 ;
                    Jump      = 1'b0 ; 
                    ALUOp     = 2'b00 ;
                end
                    
                7'b0100011: begin     // sw
                    RegWrite  = 1'b0 ;
                    ImmSrc    = 2'b01 ;
                    ALUSrc    = 1'b1 ;
                    MemWrite  = 1'b1 ;
                    ResultSrc = 2'bxx ;
                    Branch    = 1'b0 ;
                    Jump      = 1'b0 ;
                    ALUOp     = 2'b00 ;
                end
                    
                7'b0110011: begin    // R-type (or) 
                    RegWrite  = 1'b1 ;
                    ImmSrc    = 2'bxx ;
                    ALUSrc    = 1'b0 ;
                    MemWrite  = 1'b0 ;
                    ResultSrc = 2'b00 ;
                    Branch    = 1'b0 ;
                    Jump      = 1'b0 ;
                    ALUOp     = 2'b10 ;
                    end
                    
                7'b1100011: begin   // beq
                    RegWrite  = 1'b0 ;
                    ImmSrc    = 2'b10 ;
                    ALUSrc    = 1'b0 ;
                    MemWrite  = 1'b0 ;
                    ResultSrc = 2'bxx ;
                    Branch    = 1'b1 ;   
                    Jump      = 1'b0 ;           
                    ALUOp     = 2'b01 ;
                end 
                    
                
                    
                7'b0010011:  begin    // I_type
                    Branch = 0 ;
                    Jump      = 1'b0 ;
                    ResultSrc = 2'b00 ;
                    MemWrite = 0 ;
                    ALUSrc = 1 ;
                    ImmSrc = 2'b00 ;
                    RegWrite = 1 ;
                    ALUOp = 2'b10;
                end
    
                7'b1101111: begin      //jal
                    Branch = 0 ;
                    Jump = 1 ;
                    ResultSrc = 2'b10 ;
                    MemWrite = 0 ;
                    ALUSrc = 1'bx ;
                    ImmSrc = 2'b11;
                    RegWrite = 1 ;
                    ALUOp = 2'bxx;
                end
                        
                default :
                begin
                    Branch = 1'bx ;
                    Jump = 1'bx ;
                    ResultSrc = 2'bxx ;
                    MemWrite = 1'bx ;
                    ALUSrc = 1'bx ;
                    ImmSrc = 2'bxx ;
                    RegWrite = 1'bx ;
                    ALUOp = 2'bxx ;
                end
        endcase
    end
endmodule

