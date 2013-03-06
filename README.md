410 in 140
==========
A Twitter API v1 server implemented in 140 characters (or less).

Motivation
----------
On March 5, 2013, [Twitter deprecated version 1 of their API][sadness]. At some
unspecified time in the future, API v1 requests will start returning `HTTP 410
Gone`. This project aims to implement a web server for this endpoint in 140
characters (or less), so it fits in a Tweet.

[sadness]: https://dev.twitter.com/blog/planning-for-api-v1-retirement

Life is short. Don't make me click. Just show me the code!
----------------------------------------------------------
Okay.

```ruby
require 'socket';
s = TCPServer.new(80);
loop {
	Thread.start(s.accept){|c|
		c.gets "\n\n";
		c.puts "HTTP/1.1 410 Gone\r";
		c.close
	}
}
```

Running the server
------------------
	sudo ruby server.rb

**Note**: Must be run as root since it binds to port 80. If it's not run as
root on a Unix-like operating systems, you will get the error:

	server.rb:2:in `initialize': Permission denied - bind(2) (Errno::EACCES)

Running the specs
-----------------
There is currently only one spec, which verifies that the size of server.rb is
less than or equal to 140 characters.

	rspec spec.rb

FAQ
---
> Are you serious?

No, not particularly. [I was trying to be funny][tweet], but [someone
replied][judofyr] that my code wasn't up to [spec][]. This repo exists mostly
to give the haters and nitpickers a place to constructively pick nits.

[tweet]: https://twitter.com/sferik/status/309207114050568192
[judofyr]: https://twitter.com/judofyr/status/309235306547273728
[spec]: http://www.ietf.org/rfc/rfc2616.txt
