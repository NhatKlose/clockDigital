module counter_year(
    input year_clk,
    input rst,
    input en,
    input [6:0] set_numb_year,
    output reg[10:0] year_w
);
always @(posedge year_clk or posedge rst or en) begin
    if(en) 
    begin
        if(rst || year_w == set_numb_year) begin
            year_w <= 0;
        end
        else begin
            year_w <= year_w + 1;
        end
    end
    else 
    begin
        year_w <= 0;
    end
end
endmodule