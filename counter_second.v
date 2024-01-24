module counter_second(
    input clk,
    input rst,
    input en,
    input [6:0] set_numb_sec,
    output reg minute_clk,
    output reg[6:0] second_w
);
always @(posedge clk or posedge rst or en) begin
    if(en) 
    begin
        if(rst) begin
            minute_clk <= 0;
            second_w <= 0;
        end
        else begin
            if(second_w == 7'd48 || second_w == set_numb_sec) begin 
                second_w = 0; 
                minute_clk <= 1;
            end
            else begin 
                second_w = second_w + 1;
                minute_clk <= 0;
            end
        end
    end
    else 
    begin 
        second_w <= 0;
    end
end
endmodule