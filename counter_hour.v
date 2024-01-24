module counter_hour(
    input hour_clk,
    input rst,
    input en,
    input set_12_24,
    input [6:0] set_numb_hour,

    output reg day_clk,
    output reg[6:0] hour_w
);
always @(posedge hour_clk or posedge rst or en) begin
    if(en) 
    begin
        if(rst) begin
            day_clk <= 0;
            hour_w <= 0;
        end
        else begin
            if(set_12_24==0)begin
                if(hour_w == 11) 
                begin 
                    hour_w = 0;
                    day_clk <= 1; 
                end
                else begin 
                    hour_w = hour_w + 1;
                    day_clk <= 0;
                end
            end
            else begin
                if(hour_w == 23 || hour_w == set_numb_hour) begin 
                hour_w = 0;
                day_clk <= 1;            
                end
                else begin 
                hour_w = hour_w + 1;
                day_clk <= 0;
                end
            end
        end
    end
    else 
    begin
        hour_w <= 0;
    end
end
endmodule