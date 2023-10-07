module ControlUnit(
    input zero,
    input  [6:0] op,  
    input  [2:0] funct3,
    input  [6:0] funct7, 
     
    output  RegWrite,
    output  [1:0] ImmSrc,
    output  ALUSrc,
    output  MemWrite,
    output  ResultSrc,
    output  [2:0] ALUControl,
    output  PCSrc
    );
    
    wire [1:0] AluOp ;
    
    Main_Decoder G1(
    .zero(zero),
    .op(op),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .PCSrc(PCSrc),
    .AluOp(AluOp)
    );
    
    ALU_Decoder N2(
    .funct3(funct3),
    .funct7(funct7[5]),
    .AluOp(AluOp),
    .op(op[5]),
    .ALUControl(ALUControl)
    );
    
    
endmodule
