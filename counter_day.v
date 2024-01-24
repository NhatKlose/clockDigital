module counter_day(
    input day_clk,
    input rst,
    input en,
    input max_day,
    input [6:0] set_numb_day,

    output reg month_clk,
    output reg[6:0] day_w
);
always @(posedge day_clk or posedge rst) begin
    if(en)
    begin
        if(rst) begin
            month_clk <= 0;
            day_w <= 0;
        end
        else begin 
            if(day_w == max_day || day_w == set_numb_day) begin
                day_w <= 0;
                month_clk <= 1;
            end
            else begin
                day_w = day_w + 1;
                month_clk <= 0;
            end
        end
    end
    else 
    begin
        day_w <= 0;
    end
end
endmodule