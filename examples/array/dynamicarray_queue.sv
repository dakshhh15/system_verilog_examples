typedef string ar1 [];

module dynamic_queue;
  ar1 list [$];

  initial
  begin	

	automatic ar1 books = '{"atbp", "lfa", "nw", "np", "ap"};
	automatic ar1 authors = '{"hm", "jg", "rr"};

	list.push_back(books);
	list.push_back(authors);
    
    $display("list = %p", list);

	foreach(list[i])
	  foreach(list[i][j]) begin
		$display("list[%0d][%0d] = %s", i,j,list[i][j]); end

  end

endmodule
