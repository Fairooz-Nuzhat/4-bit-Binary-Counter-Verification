class down_counting_test extends counter_base_test;

    string name = "down_counting_test";
    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();
        super.run();
        gen.down_count_seq(18);
        $display($time," ns || down_counting tasks ended ",  this.name);
        env.scb.report();
    endtask

endclass
