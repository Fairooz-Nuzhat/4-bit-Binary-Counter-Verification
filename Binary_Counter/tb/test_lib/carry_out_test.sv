class carry_out_test extends counter_base_test;

    string name = "carry_out_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();
        super.run();
        gen.up_count_seq(20);  
        gen.down_count_seq(20);  
        $display($time," ns || carry checking tasks ended ", this.name);
        env.scb.report();
    endtask

endclass
