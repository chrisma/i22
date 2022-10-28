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
end
