class counter_scoreboard;
    mailbox mntr2scb;
    counter_transaction tx_mntr;
    logic [3:0] exp_A_count;
    logic exp_C_out;
    int pass ;
    int fail;
    string name = "counter_scoreboard";
    string op_name;
    logic [3:0] op;

    function new();
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();
        pass = 0;
        fail = 0;
        forever begin
            get();            //receives transaction from monitor 
            update();         //updates expected values
            compare();        //comapres expected and actual values received from monitor
        end
    endtask

    task get();
        mntr2scb.get(tx_mntr);
    endtask

    task update();
        if (!tx_mntr.reset) begin      //reset update
            exp_A_count = 0;
            exp_C_out = 0;
        end

        else begin
            if (tx_mntr.enable == 0) begin        //disable value
                exp_A_count = exp_A_count;
                exp_C_out = exp_C_out;
            end

            else if (tx_mntr.enable == 1 && tx_mntr.load == 1) begin        //loading value
                exp_A_count = tx_mntr.data_in;
                exp_C_out = 0;
            end

            else if (tx_mntr.enable == 1 && tx_mntr.load == 0 && tx_mntr.count == 1) begin      //up-count
                exp_C_out = (exp_A_count == 15) ? 1:0;
                exp_A_count = exp_A_count + 1;
            end

            else if (tx_mntr.enable == 1 && tx_mntr.load == 0 && tx_mntr.count == 0) begin      //down-count
                exp_A_count = exp_A_count - 1;
                exp_C_out = 0;
            end
        end
    endtask

    task compare();
        op = {tx_mntr.reset,tx_mntr.enable,tx_mntr.load,tx_mntr.count};

        if (exp_A_count == tx_mntr.A_count && exp_C_out == tx_mntr.C_out) begin
            pass++;    
        end

        else begin
            fail++;
            if (exp_A_count != tx_mntr.A_count) begin
                casex(op)
                    4'b0xxx : op_name = "reset";
                    4'b10xx : op_name = "enable";
                    4'b111x : op_name = "load";
                    4'b1101 : op_name = "up_count";
                    4'b1100 : op_name = "down_count";
                endcase 
                $display($time,"ns |SCB| *E: A_count failed for *%s operation* :: exp %0h, actual %0h", op_name, exp_A_count, tx_mntr.A_count);    
            end   

            else begin
                casex(op)
                    4'b0xxx : op_name = "reset";
                    4'b10xx : op_name = "enable";
                    4'b111x : op_name = "load";
                    4'b1101 : op_name = "up_count";
                    4'b1100 : op_name = "down_count";
                endcase 
                $display($time,"ns |SCB| *E: C_out failed for *%s operation* :: exp %0h, actual %0h", op_name, exp_C_out, tx_mntr.C_out);   
            end
        end   
    endtask

    function void report();
        $display($time,"ns |SCB| Total passed test: %0d ", pass);
        $display($time,"ns |SCB| Total failed test: %0d ", fail);
        $display($time,"ns |SCB| Total test count: %0d ", pass+fail);
    endfunction

endclass

