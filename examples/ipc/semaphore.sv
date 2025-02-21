module sem;
   semaphore key;
  
  initial
    begin
      key = new (1);
      
      fork
        personA ();
        personB ();
        #25 personC ();
      join_none
    end
  
  task getroom (bit[1:0] id);
    $display("[%0t] trying to get room by id[%b]", $time, id);
    key.get(1);
    $display("[%0t] got the room key for id[%b]", $time, id);
  endtask
  
  task leaveroom (bit[1:0] id);
    $display("[%0t] id[%b] leaving the room", $time, id);
    key.put (1);
    $display("[%0t] id[%b] left the room", $time, id);
  endtask
  
  task personA ();
    getroom (1);
    #20 leaveroom (1);
  endtask
  
  task personB ();
    getroom(2);
    #15 leaveroom (2);
  endtask
  
  task personC ();
    getroom(0);
    #15 leaveroom (0);
  endtask
  
endmodule
