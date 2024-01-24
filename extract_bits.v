module extract_bits(
    input [6:0] w,
    input rst,
    output reg[3:0]tens,
    output reg[3:0]units
);
always @(posedge w or posedge rst) begin
    if(rst) begin
        tens <= 0;
        units <= 0;
    end
    else begin
        units <= w%10;
        tens <=(w-units)/10;
    end
end
endmodule
