module ControlUnit2(
    input zero,
    input  [6:0] op,  
    input  [14:12] funct3,
    input  [6:0] funct7, 
     
    output  RegWrite,
    output  [1:0] ImmSrc,
    output  ALUSrc,
    output  MemWrite,
    output  [1:0] ResultSrc,
    output  [2:0] ALUControl,
    output  PCSrc
    );
    
    wire [1:0] ALUOp ;

    
     MainDecoder2 G3(
       .zero(zero),
       .op(op),
       .RegWrite(RegWrite),
       .ImmSrc(ImmSrc),
       .ALUSrc(ALUSrc),
       .MemWrite(MemWrite),
       .ResultSrc(ResultSrc),
       .PCSrc(PCSrc),
       .ALUOp(ALUOp)
       );
       
       ALUDecoder2 N3(
       .funct3(funct3),
       .funct7(funct7[5]),
       .ALUOp(ALUOp),
       .op(op[5]),
       .ALUControl(ALUControl)
       );
       
endmodule
