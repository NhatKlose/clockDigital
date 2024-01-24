module counter_minute(
    input minute_clk,
    input rst,
    input en,
    input [6:0] set_numb_min,

    output reg hour_clk,
    output reg[6:0] minute_w
);
always @(posedge minute_clk or posedge rst or en) begin
    if(en)
    begin
        if(rst) begin
            hour_clk <= 0;
            minute_w <= 0;
        end
        else begin
            if(minute_w == 59 || minute_w == set_numb_min) begin 
                minute_w = 0;
                hour_clk <= 1;
            end
            else begin 
                minute_w = minute_w + 1;
                hour_clk <= 0;
            end
        end
    end
    else 
    begin
        minute_w <= 0;
    end
end
endmodule