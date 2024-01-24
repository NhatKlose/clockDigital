module counter_month(
    input month_clk,
    input rst,
    input en,
    input [6:0] set_numb_month,
    output reg year_clk,
    output reg[6:0] month_w
);
always @(posedge month_clk or posedge rst or en) begin
    if(en) 
    begin
        if(rst) begin
            year_clk <= 0;
            month_w <= 0;
        end
        else begin
            if(month_w == 12 || month_w == set_numb_month) begin 
                month_w = 0;
                year_clk <= 1;
            end
            else begin 
                month_w = month_w + 1;
                year_clk <= 0;
            end
        end
    end
    else 
    begin
        month_w <= 0;
    end
end
endmodule