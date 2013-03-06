require 'rspec'

describe "the server" do
	it "should be less than or equal to 140 characters" do
		file_size = File.size("server.rb")
		puts file_size
		expect(file_size).to be <= 140
	end
end
