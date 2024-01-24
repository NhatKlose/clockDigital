`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2022 07:52:56 PM
// Design Name: 
// Module Name: counter_led_7
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_led_7(en,clk,rst,set_12_24,set_numb_sec,set_numb_min
,set_numb_hour,set_numb_day,set_numb_month,set_numb_year,tens_sec_o,units_sec_o,tens_min_o,units_min_o,tens_hour_o,units_hour_o,tens_day_o
,units_day_o,tens_month_o,units_month_o,thours_year_o,hundrs_year_o,tens_year_o,units_year_o);

input en,clk,rst, set_12_24;
input [6:0]set_numb_sec;
input [6:0]set_numb_min;
input [6:0]set_numb_hour;
input [6:0]set_numb_day;
input [6:0]set_numb_month;
input [10:0]set_numb_year;

output [6:0]tens_sec_o;
output [6:0]units_sec_o;
output [6:0]tens_min_o;
output [6:0]units_min_o;
output [6:0]tens_hour_o;
output [6:0]units_hour_o;
output [6:0]tens_day_o;
output [6:0]units_day_o;
output [6:0]tens_month_o;
output [6:0]units_month_o;
output thours_year_o;
output [2:0]hundrs_year_o;
output [2:0]tens_year_o;
output [2:0]units_year_o;

wire hour_clk, minute_clk, day_clk, month_clk, year_clk;
wire [6:0] second_w, minute_w, hour_w, day_w, month_w, max_day;
wire [10:0] year_w;
wire [3:0] tens_sec, units_sec, tens_min, units_min, tens_hour, units_hour, tens_day, units_day, tens_month, units_month;
wire thours_year;
wire [2:0] hundrs_year, tens_year, units_year;

counter_second cnt1 (.clk(clk), .rst(rst),.en(en), .minute_clk(minute_clk), .second_w(second_w), .set_numb_sec(set_numb_sec));

counter_minute cnt2 (.minute_clk(minute_clk), .en(en), .rst(rst), .hour_clk(hour_clk), .minute_w(minute_w), .set_numb_min(set_numb_min));

counter_hour cnt3 (.hour_clk(hour_clk), .rst(rst), .en(en), .set_12_24(set_12_24), .day_clk(day_clk),.hour_w(hour_w),.set_numb_hour(set_numb_hour));

counter_day cnt4 (.day_clk(day_clk), .rst(rst), .en(en), .max_day(max_day), .month_clk(month_clk), .day_w(day_w), .set_numb_day(set_numb_day));

counter_month cnt5 (.month_clk(month_clk), .rst(rst), .en(en), .year_clk(year_clk), .month_w(month_w), .set_numb_month(set_numb_month));

counter_year cnt6 (.year_clk(year_clk), .rst(rst), .en(en), .year_w(year_w), .set_numb_year(set_numb_year));

DayOfMonth dfm (.month_w(month_w), .year_w(year_w), .max_day(max_day));

extract_bits ex1 (.w(second_w), .rst(rst), .tens(tens_sec), .units(units_sec));

extract_bits ex2 (.w(minute_w), .rst(rst), .tens(tens_min), .units(units_min));

extract_bits ex3 (.w(hour_w), .rst(rst), .tens(tens_hour), .units(units_hour));

extract_bits ex4 (.w(day_w), .rst(rst), .tens(tens_day), .units(units_day));

extract_bits ex5 (.w(month_w), .rst(rst), .tens(tens_month), .units(units_month));

extract_bits_year ex6 (.w(year_w), .rst(rst), .thours(thours_year), .hundrs(hundrs_year), .tens(tens_year), .units(units_year));
           
led_7_seg L1 (.in(tens_sec), .out(tens_sec_o));
led_7_seg L2 (.in(units_sec), .out(units_sec_o));

led_7_seg L3 (.in(tens_min), .out(tens_min_o));
led_7_seg L4 (.in(units_min), .out(units_min_o));

led_7_seg L5 (.in(tens_hour), .out(tens_hour_o));
led_7_seg L6 (.in(units_hour), .out(units_hour_o));

led_7_seg L7 (.in(tens_day), .out(tens_day_o));
led_7_seg L8 (.in(units_day), .out(units_day_o));

led_7_seg L9 (.in(tens_month), .out(tens_month_o));
led_7_seg L10 (.in(units_month), .out(units_month_o));

led_7_seg L11 (.in(thours_year), .out(thours_year_o));
led_7_seg L12 (.in(hundrs_year), .out(hundrs_year_o));
led_7_seg L13 (.in(tens_year), .out(tens_year_o));
led_7_seg L14 (.in(units_year), .out(units_year_o));

endmodule
