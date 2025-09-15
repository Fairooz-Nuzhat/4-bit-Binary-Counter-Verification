class counter_agent;

    counter_coverage cov;
    counter_driver drvr;
    counter_generator gen;
    counter_monitor mntr;

    mailbox gen2drvr;
    mailbox mntr2cov;
    semaphore sem;
    string name = "counter_agent";

    function new(virtual counter_interface intf);
        cov = new();
        drvr = new(intf);
        gen = new();
        mntr = new(intf);
        gen2drvr = new();
        mntr2cov = new();
        sem = new();       
        $display($time, "ns |%s| is created", this.name); 
    endfunction

    function connect();
        gen.gen2drvr = gen2drvr;
        drvr.gen2drvr = gen2drvr;
        gen.sem = sem;
        drvr.sem = sem;
        mntr.mntr2cov = mntr2cov;
        cov.mntr2cov = mntr2cov;
    endfunction

endclass
