require 'rails_helper'

RSpec.describe Paper, type: :model do
  before :each do
    @paper = FactoryBot.create :paper
  end

  it "should have a factory that fills all fields" do
    expect(@paper.title).to_not be_nil
    expect(@paper.venue).to_not be_nil
    expect(@paper.year).to_not be_nil
  end

  it "should not be valid without a title" do
    @paper.title = nil
    expect(@paper).to_not be_valid
  end

  it "should not be valid without a venue" do
    @paper.venue = nil
    expect(@paper).to_not be_valid
  end

  it "should not be valid without a year" do
    @paper.year = nil
    expect(@paper).to_not be_valid
  end

  it "should not validate with non-integer year" do
    @paper.year = 'nineteen-fifty'
    expect(@paper).to_not be_valid
    @paper.year = 1950.1
    expect(@paper).to_not be_valid
  end

  # Given a paper
  # Then it should have an empty list of authors
  it "should have and belong to many authors" do
    expect(Paper.new.authors).to be_empty
  end
end
