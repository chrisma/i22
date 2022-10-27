require 'rails_helper'

describe "The author model", type: :model do
  before :each do
    @first = 'Alan'
    @last = 'Turing'
    @homepage = 'http://wikipedia.org/Alan_Turing'
    @author = Author.new(first_name: @first, last_name: @last, homepage: @homepage)
  end

  it "should have a name and homepage" do
    expect(@author.first_name).to eq(@first)
    expect(@author.last_name).to eq(@last)
    expect(@author.homepage).to eq(@homepage)
  end

  it "should not be valid without last name" do
    @author.last_name = nil
    expect(@author).to_not be_valid
  end

  it "should have a name and homepage" do
    first = 'Alan'
    last = 'Turing'
    homepage = 'http://wikipedia.org/Alan_Turing'
    # author = Author.new({first_name: first, last_name: last, homepage: homepage})
    author = Author.new({:first_name => first, :last_name => last, :homepage => homepage})
    expect(author.first_name).to eq(first)
    expect(author.last_name).to eq(last)
    expect(author.homepage).to eq(homepage)
  end

  it "should have a method called 'name' that returns the full name" do
    expect(@author.name).to eq(@first + ' ' + @last)
  end
end
