module extract_bits_year(
    input [10:0] w,
    input rst,
    output reg thours,
    output reg[2:0]hundrs,
    output reg[2:0]tens,
    output reg[2:0]units
);
always @(posedge w or posedge rst) begin
    if(rst) begin
        thours <= 0;
        hundrs <= 0;
        tens <= 0;
        units <= 0;
    end
    else begin
        thours <= w/1000;
        hundrs <= (w%1000)/100;
        units <= w%10;
        tens <=(w-units)/10;
    end
end
endmodule
