410 in 140
==========
A Twitter API v1 server implemented in 140 characters (or less).

Motivation
----------
On March 5, 2013, [Twitter deprecated version 1 of their API][sadness]. At some
unspecified time in the future, API v1 requests will start returning `HTTP 410
Gone`. This project aims to implement a multithreaded web server for this
endpoint in 140 characters (or less), so it fits in a Tweet.

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
> How many requests per second?

LOL!

> Are you serious?

No, not particularly. [I was trying to be funny][tweet], but [someone
replied][judofyr] that my code wasn't up to [spec][]. This repo exists mostly
to give the haters and nitpickers a place to be constructive.

[tweet]: https://twitter.com/sferik/status/309207114050568192
[judofyr]: https://twitter.com/judofyr/status/309235306547273728
[spec]: http://www.ietf.org/rfc/rfc2616.txt

> Most [Ruby styleguides][styleguide] call for two space indentation. Why do
> you use tabs?

I'm using tabs to keep the character count below 140. I suppose I could have
used single spaces instead but that looked worse to me.

[styleguide]: https://github.com/styleguide/ruby

> I thought this was Ruby. What's up with the semicolons?

You must be confusing Ruby with [JavaScript][]. :trollface:

[javascript]: https://github.com/twitter/bootstrap/issues/3057

> No, seriously. Why use semicolons if you're trying to keep it short?

Many Twitter clients strip out newline characters when rendering Tweet text.
The semicolons add a few extra characters but ensure that the code can be
copied and run from any Twitter client.
