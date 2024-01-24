module counter_led_7_tb;

  reg en, clk, rst, set_12_24;
  reg [6:0] set_numb_sec;
  reg [6:0] set_numb_min;
  reg [6:0] set_numb_hour;
  reg [6:0] set_numb_day;
  reg [6:0] set_numb_month;
  reg [10:0] set_numb_year;
  
  wire [6:0] tens_sec_o;
  wire [6:0] units_sec_o;
  wire [6:0] tens_min_o;
  wire [6:0] units_min_o;
  wire [6:0] tens_hour_o;
  wire [6:0] units_hour_o;
  wire [6:0] tens_day_o;
  wire [6:0] units_day_o;
  wire [6:0] tens_month_o;
  wire [6:0] units_month_o;
  wire thours_year_o;
  wire [2:0] hundrs_year_o;
  wire [2:0] tens_year_o;
  wire [2:0] units_year_o;

  counter_led_7 dut (
    .en(en),
    .clk(clk),
    .rst(rst),
    .set_12_24(set_12_24),
    .set_numb_sec(set_numb_sec),
    .set_numb_min(set_numb_min),
    .set_numb_hour(set_numb_hour),
    .set_numb_day(set_numb_day),
    .set_numb_month(set_numb_month),
    .set_numb_year(set_numb_year),
    .tens_sec_o(tens_sec_o),
    .units_sec_o(units_sec_o),
    .tens_min_o(tens_min_o),
    .units_min_o(units_min_o),
    .tens_hour_o(tens_hour_o),
    .units_hour_o(units_hour_o),
    .tens_day_o(tens_day_o),
    .units_day_o(units_day_o),
    .tens_month_o(tens_month_o),
    .units_month_o(units_month_o),
    .thours_year_o(thours_year_o),
    .hundrs_year_o(hundrs_year_o),
    .tens_year_o(tens_year_o),
    .units_year_o(units_year_o)
  );
parameter CLK_PERIOD = 10;
// Clock generation
  initial begin
    clk = 0;
    forever #((CLK_PERIOD)/2) clk = ~clk;
  end
  // Reset
  initial begin
    rst = 1;
    en = 0;
    set_12_24 = 0;
    set_numb_sec = 7'b0000000;
    set_numb_min = 7'b0000000;
    set_numb_hour = 7'b0000000;
    set_numb_day = 7'b0000000;
    set_numb_month = 7'b0000000;
    set_numb_year = 11'b00000000000;
    
    #10;
    rst = 0;
    #10;
    en = 1;
    
    #100;
    set_12_24 = 1;
    set_numb_sec = 7'd48;
    //set_numb_sec = 7'b0111011;
    set_numb_min = 7'b0111011;
    set_numb_hour = 7'b0011000;
    set_numb_day = 7'b0011111;
    set_numb_month = 7'b0001100;
    set_numb_year = 11'b01111101101;
    // Set other variables if needed
   
    
    #100000;
    $finish;
  end

endmodule