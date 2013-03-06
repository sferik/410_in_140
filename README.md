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

Running the server
------------------
	sudo ruby server.rb

**Note**: Must be run as root since it binds to port 80. If it's not run as
root on a Unix-like operating systems, you will get the error:

	server.rb:2:in `initialize': Permission denied - bind(2) (Errno::EACCES)
