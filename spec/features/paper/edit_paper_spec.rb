require 'rails_helper'

describe "Edit paper page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end

  it "should persist changes made in the form" do
    new_year = @paper.year + 1
    page.fill_in 'paper[year]', with: new_year
    find('input[type="submit"]').click
    expect(@paper.reload.year).to eq(new_year)
  end	
end
