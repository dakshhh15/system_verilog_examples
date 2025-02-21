module tb;
  event event_a;


  initial begin
    #20 ->event_a;
    $display ("[%0t] Thread1: triggered event_a", $time);
  end


  initial begin
    $display ("[%0t] Thread2: waiting for trigger ", $time);
    #10 @(event_a);
    $display ("[%0t] Thread2: received event_a trigger ", $time);
  end


  initial begin
    $display ("[%0t] Thread3: waiting for trigger ", $time);
    #20 wait(event_a.triggered);
    $display ("[%0t] Thread3: received event_a trigger", $time);
  end
endmodule
