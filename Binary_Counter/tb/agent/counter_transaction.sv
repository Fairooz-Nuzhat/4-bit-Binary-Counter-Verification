
class counter_transaction #(parameter data_width = 4);

    logic reset;
    rand logic enable ;
    rand logic load ;
    rand logic count ;
    rand logic [data_width-1:0] data_in ;
    logic [data_width-1:0] A_count;
    logic C_out;

    rand int cycle;    
    constraint cycle_con {cycle<30;}
    string name = "counter_transaction";

    function new();
        $display($time, "ns |%s| is created", this.name);   
    endfunction

endclass
