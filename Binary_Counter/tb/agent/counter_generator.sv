class counter_generator;

    mailbox gen2drvr;
    counter_transaction tx;
    semaphore sem;
    string name = "counter_generator";

    function new();
        $display($time, "ns |%s| is created", this.name); 
    endfunction

    task random_seq(int n);
        tx = new();
        repeat(n) begin
            tx.reset = 1;
            tx.randomize();
            gen2drvr.put(tx);
            sem.get(1);
        end
    endtask

    task reset_seq(int n);
        tx = new();
        repeat(n) begin
           tx.reset = 0;
           tx.randomize() with {
           cycle == n;
           enable == 0;
           load == 0;
           count == 0;
               };
           gen2drvr.put(tx);
           sem.get(1);
        end
    endtask

    task up_count_seq(int n);
       tx = new();
       repeat(n) begin
           tx.reset = 1;
           tx.randomize() with {
           cycle == n;
           enable == 1;
           load == 0;
           count == 1;
               };
            gen2drvr.put(tx);
            sem.get(1);
        end
    endtask

    task down_count_seq(int n);
       tx = new();
       repeat(n) begin
           tx.reset = 1;
           tx.randomize() with {
           cycle == n;
           enable == 1;
           load == 0;
           count == 0;
               };
            gen2drvr.put(tx);
            sem.get(1);
        end
    endtask

    task disable_seq(int n);
        tx = new();
       repeat(n) begin
           tx.reset = 1;
           tx.randomize() with {
           cycle == n;
           enable == 0;
               };
            gen2drvr.put(tx);
            sem.get(1);
        end
    endtask

    task load_seq(int n);
        tx = new();
       repeat(n) begin
           tx.reset = 1;
           tx.randomize() with {
           cycle == n;
           enable == 1;
           load == 1;
               };
            gen2drvr.put(tx);  
            sem.get(1);
        end
    endtask

endclass
