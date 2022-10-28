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

  # Given a paper
  # When a user visits the paper's edit page
  # Then it should have a single multiple select box
  it "should allow to select paper authors from a multiple select box" do
    expect(page).to have_css('select[multiple]', count: 1)
  end
end
