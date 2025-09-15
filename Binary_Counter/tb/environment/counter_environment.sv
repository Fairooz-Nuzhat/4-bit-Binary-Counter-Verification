class counter_environment;

    counter_agent agnt;
    counter_scoreboard scb;
    mailbox mntr2scb;
    string name = "counter_environment";

    function new(virtual counter_interface intf);
        agnt = new(intf);
        scb = new();
        mntr2scb = new();
        $display($time, "ns |%s| is created", this.name);
    endfunction

    function connect();
        agnt.mntr.mntr2scb = mntr2scb;
        scb.mntr2scb = mntr2scb;
        agnt.connect();
    endfunction

endclass
