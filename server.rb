require 'socket';
s = TCPServer.new(80);
loop {
	Thread.start(s.accept) { |c|
		c.gets "\n\r";
		c.puts "HTTP/1.1 410 Gone";
		c.close;
	}
}
