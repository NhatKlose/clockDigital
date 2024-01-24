 module DayOfMonth(
    input day_clk,
    input rst,
    input [6:0]month_w,
    input [10:0]year_w,
    output reg [6:0]max_day
 );
 always @(posedge day_clk or posedge rst) begin
    if(rst) begin
        max_day <= 7'b0011111;
    end
    else begin 
      case(month_w)
         6'd1: begin
            max_day <= 7'd31;
         end
         6'd2: begin
            if(year_w % 4 == 0) 
            begin
                max_day <= 29;
            end
            else begin
                max_day <= 28;
            end
         end
         6'd3: begin
            max_day <= 6'd31;
         end
         6'd4: begin
            max_day <= 6'd30;
         end
         6'd5: begin
            max_day <= 6'd31;
         end
         6'd6: begin
            max_day <= 6'd30;
         end
         6'd7: begin
            max_day <= 6'd31;
         end
         6'd8: begin
            max_day <= 6'd31;
         end
         6'd9: begin
            max_day <= 6'd30;
         end
         6'd10: begin
            max_day <= 6'd31;
         end
         6'd11: begin
            max_day <= 6'd30;
         end
         6'd12: begin
            max_day <= 6'd31;
         end
      endcase
    end
end
 
 endmodule