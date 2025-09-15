class random_test extends counter_base_test;

    string name = "random_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();        
        super.run();
        gen.random_seq(25);
        $display($time, "ns |%s| random tasks ended", this.name);
        env.scb.report();
    endtask

endclass
