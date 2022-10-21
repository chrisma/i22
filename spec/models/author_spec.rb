require 'rails_helper'

describe "The author model", type: :model do
  it "should have a method called 'name' that returns the full name" do
    first = 'Alan'
    last = 'Turing'
    homepage = 'http://wikipedia.org/Alan_Turing'
    author = Author.new(first_name: first, last_name: last, homepage: homepage)
    expect(author.first_name).to eq(first)
    expect(author.last).to eq(last)
    expect(author.homepage).to eq(homepage)
  end
end