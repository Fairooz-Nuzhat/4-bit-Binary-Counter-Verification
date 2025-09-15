class counter_base_test;

    counter_environment env;
    counter_generator gen;
    string name = "counter_base_test";

    function new(virtual counter_interface intf);
        env = new(intf);
        gen = env.agnt.gen;
        $display($time, "ns |%s| is created", this.name);   
    endfunction

    function connect();
        env.connect();
    endfunction

    task run();
        fork
            env.agnt.drvr.run();
            env.agnt.mntr.run();
            env.scb.run();
            env.agnt.cov.run();
        join_none
        env.agnt.drvr.delay();
        gen.reset_seq(2);
    endtask
endclass
