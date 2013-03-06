require 'rspec'

describe "the server" do
  it "should be less than or equal to 140 characters" do
    length = `wc -m server.rb`.split[0].to_i
    expect(length).to be <= 140
  end
end
