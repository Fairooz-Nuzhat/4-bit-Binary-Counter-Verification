interface counter_interface #(parameter data_width = 4)
    (input reg clk);

    logic reset;
    logic enable;
    logic load;
    logic count;
    logic [data_width-1:0] data_in;
    logic [data_width-1:0] A_count;
    logic C_out;

endinterface
